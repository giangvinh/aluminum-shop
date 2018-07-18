var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
const uuidv1 = require('uuid/v1');

// GET home page
router.get('/', function (req, res, next) {
    db.getOnlyDanhMucSanPham_ID_NAME(function (error, danhmuc) {
        if (error) {
            return;
        }
        console.log(46666);
        console.log(danhmuc);
        db.getSanPham_ID_CODE_NAME('', function (error1, sanpham) {
            if (error1) {
                return;
            }



            res.render('admin/them-san-pham', {
                danhmuc: danhmuc,
                sanpham: sanpham,
                types: [
                    { value: 2, name: "Thịt bò nhập khẩu"},
                    { value: 3, name: "Thịt heo nhập khẩu"},
                    { value: 4, name: "Thực phẩm đông lạnh"},
                    { value: 5, name: "Sản phẩm tiêu dùng"},
                    { value: 1, name: "Khác"}
                ]
            });
        })
    });


});


router.post('/', function (req, res, next) {
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

router.post('/them', function (req, res, next) {
    if(!req.session.username){
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết phiên làm việc"));
        return;
    }
    var obj = req.body;
    var product_category_id = obj.product_category_id;
    var code = obj.code;
    var quantity = obj.quantity;
    var price = obj.price;
    var weight = obj.weight;
    var unit = obj.unit;
    var tag = obj.tag;
    var order = obj.order;
    var des_vi = obj.des_vi;
    var name_vi = obj.name_vi;
    var title_vi = obj.name_vi;
    var html_vi = obj.html_vi;
    var des_en = obj.des_en;
    var name_en = obj.name_en;
    var title_en = obj.name_en;
    var html_en = obj.html_en;

    var meta_title_vi = obj.meta_title_vi;
    var meta_description_vi = obj.meta_description_vi;
    var meta_keyword_vi = obj.meta_keyword_vi;
    var meta_description_en = obj.meta_description_en;
    var meta_keyword_en = obj.meta_keyword_en;
    var meta_title_en = obj.meta_title_en;

    var parent_id = obj.parent_id == "" ? null : obj.parent_id;
    var image = obj.image;
    var important = obj.important;
    if(important) {
        important = 1;
    } else {
        important = 0;
    }
    var type = obj.type;
    var id = uuidv1();
    var entity_code = api.ENUM_ENTITY_CODE.PRD;
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.countProductByCode(code,function (er, codeRs) {
        if(er){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(codeRs[0].count > 0){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Code này đã được sử dụng"));
            return;
        }else {
            db.insertSanPham(id, product_category_id, code, name_vi,
                title_vi, quantity, image, des_vi, html_vi,
                price, weight, parent_id, entity_code,
                created_date, created_by, unit, tag, status
                , order, rating, important, type, function (error, result) {
                    if (error) {
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                        return;
                    }

                    var idVi = uuidv1();
                    db.insertMucDuLieu(id, name_vi, title_vi, des_vi, html_vi, created_by, created_date, entity_code, 1, "vi",meta_keyword_vi,meta_description_vi,meta_title_vi, idVi, function (e1, ressult) {
                        if (e1) {
                            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm vào mục dữ liệu tiếng việt"));
                            return;
                        }
                        var idEn = uuidv1();
                        db.insertMucDuLieu(id, name_en, title_en, des_en, html_en, created_by, created_date, entity_code, 1, "en",meta_keyword_en,meta_description_en,meta_title_en, idEn, function (e3, ressult) {
                            if (e3) {
                                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm vào mục dữ liệu tiếng anh"));
                                return;
                            }

                            var idWarehouse = uuidv1();
                            db.insertWarehouse(idWarehouse,id,0,created_date,created_by,status,function (error10, rs) {
                                if(error10){
                                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm dữ liệu vào warehouse"));
                                    return;
                                }

                                var idWareHouseHistory = uuidv1();
                                db.insertWarehouseHistory(idWareHouseHistory,idWarehouse,id,0,3,created_by,created_date,1,function (error11, rs1) {
                                    if(error11){
                                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm dữ liệu vào warehouse history"));
                                        return;
                                    }
                                    res.json(api.getResponse(api.SUCC_EXEC, null, ""));

                                })
                            })

                        });

                    });

                })


        }
    })

});


module.exports = router;
