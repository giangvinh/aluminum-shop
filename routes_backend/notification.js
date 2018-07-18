var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
const uuidv1 = require('uuid/v1');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
// GET home page
router.get('/', function (req, res, next) {
    if (!req.session.username) {
        return;
    }
    db.getNotificationById(req.session.user_id, function (error4, notification) {
        if (error4) {
            return;
        }


        res.render('admin/notification',
            {notification: notification});

    });
});

router.post('/sua', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết session làm việc"));
        return;
    }
    var obj = req.body;
    var html_vi = obj.html_vi;
    var html_en = obj.html_en;
    var title = obj.title;
    var image = obj.image;
    var id = obj.id;
    var entity_code = api.ENUM_ENTITY_CODE.GTU;

    var updated_date = api.getNow();
    var updated_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.updateGioiThieuContent(entity_code, updated_by, updated_date, "", html_vi, status, image, id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        db.getMucDuLieuByRequiringId(id,function (error1, result1) {
            if(error1){
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            if(result1.length > 0){
                db.updateMucDuLieuGioiThieu(id, "", "", html_vi, updated_by, updated_date, entity_code, "vi", function (e1, ressult) {
                    if (e1) {
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhậ vào mục dữ liệu tiếng việt"));
                        return;
                    }
                    db.updateMucDuLieuGioiThieu(id, "", "", html_en, updated_by, updated_date, entity_code, "en", function (e3, ressult) {
                        if (e3) {
                            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật vào mục dữ liệu tiếng anh"));
                            return;
                        }
                        res.json(api.getResponse(api.SUCC_EXEC, null, ""));

                    });

                });
            }else {
                var idVi = uuidv1();
                db.insertMucDuLieu(id,"","","",html_vi,updated_by,updated_date,entity_code,status,"vi","","","",idVi,function (ea, al) {
                    if(ea){
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm vào mục dữ liệu tiếng việt"));
                        return;
                    }
                    var idEn = uuidv1();

                    db.insertMucDuLieu(id,"","","",html_en,updated_by,updated_date,entity_code,status,"en","","","",idEn,function (eb, al) {
                        if(eb){
                            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm vào mục dữ liệu tiếng anh"));
                            return;
                        }
                        res.json(api.getResponse(api.SUCC_EXEC, null, ""));
                    })
                })



            }

        })


    })


});

router.post('/upload', function (req, res, next) {
    console.log("IN");
    var form = new formidable.IncomingForm(),
        files = [],
        fields = [];

    form.uploadDir = "upload";
    var file_name = "";
    form
        .on('field', function (field, value) {
            // console.log(field, value);
            fields.push([field, value]);
        })
        .on('file', function (field, file) {
            // console.log(field, file);
            files.push([field, file]);
            fs.rename(file.path, form.uploadDir + "/" + file.name);
            file_name = file.name;
        })
        .on('end', function () {
            console.log('-> upload done');
            // res.writeHead(200, {'content-type': 'text/plain'});
            // res.write('received fields:\n\n '+util.inspect(fields));
            // res.write('\n\n');
            // res.end('received files:\n\n '+util.inspect(files));
            res.json(api.getResponse(api.SUCC_EXEC, file_name, ""));

        });
    form.parse(req);
});
module.exports = router;
