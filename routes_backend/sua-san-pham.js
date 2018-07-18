var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
const uuidv1 = require('uuid/v1');
const html2pug = require('html2pug')

// GET home page
router.get('/', function (req, res, next) {

    var id = req.query.id;
    db.getOnlyDanhMucSanPham_ID_NAME(function (error, listDanhmuc) {
        if (error) {
            return;
        }
        db.getSanPham_ID_CODE_NAME(id, function (error1, listSanpham) {
            if (error1) {
                return;
            }

            db.getSanPhamById(id, function (error2, sanpham) {
                if(error2){
                    return;
                }

                db.getMucDuLieu(sanpham[0].entity_code,"vi",id,function (error3, sanphamVI) {
                   if(error3){
                       return;
                   }
                    db.getMucDuLieu(sanpham[0].entity_code,"en",id,function (error4, sanphamEN) {
                        if(error4){
                            return;
                        }


                        if(sanpham[0].is_important.lastIndexOf(1) !== -1){
                            sanpham[0].is_important = 1;
                        }else {
                            sanpham[0].is_important = 0;
                        }

                        db.getSpecialContent(id,api.ENUM_ENTITY_CODE.MON,function (error5, monngonList) {
                            if(error5){
                                return;
                            }
                            db.getSpecialProductLinkContent(id,function (error6, lienketList) {

                                db.getProductImageList(id,function (error00, imageList) {
                                    if(error00) return;
                                    var url = req.protocol + '://' + req.get('host')+"/upload/";

                                    res.render('admin/sua-san-pham', {
                                        lienketList: lienketList,
                                        monngonList: monngonList,
                                        listDanhmuc: listDanhmuc,
                                        sanpham: sanpham[0],
                                        listSanpham: listSanpham,
                                        sanphamVI: sanphamVI[0],
                                        sanphamEN: sanphamEN[0],
                                        imageList: imageList,
                                        address: url,
                                        types: [
                                            { value: 2, name: "Thịt bò nhập khẩu"},
                                            { value: 3, name: "Thịt heo nhập khẩu"},
                                            { value: 4, name: "Thực phẩm đông lạnh"},
                                            { value: 5, name: "Sản phẩm tiêu dùng"},
                                            { value: 1, name: "Khác"}
                                        ]
                                    });
                                })

                            })


                        })

                    });
                });


            })
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

router.post('/them-lien-ket', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết session làm việc"));
        return;
    }
    var obj = req.body;
    var content_id = obj.content_id;
    var product_id = obj.product_id;
    var created_at = api.getNow();
    var created_by = req.session.username;
    var id = uuidv1();

    db.insertProductLinkContent(id,content_id,product_id,created_at,created_by,function (error, result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi server"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, id, ""));

    })

});


router.post('/upload-them-hinh', function (req, res, next) {

    var obj = req.body;
    var url = obj.url;
    var product_id = obj.product_id;
    var created_at = api.getNow();
    var created_by = req.session.username;
    var id = uuidv1();
    var address = req.protocol + '://' + req.get('host')+"/upload/";

    db.insertSlider(id,url,"","","",created_by,created_at,product_id,api.ENUM_ENTITY_CODE.PRD,1,1,function (error, rs) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi server"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, {id: id,address: address}, ""));

    })


});


router.post('/xoa-lien-ket', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết session làm việc"));
        return;
    }
    var obj = req.body;
    var id = obj.id;

    db.xoaProductLinkContent(id,function (error, result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi server"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, null, ""));

    })

});

router.post('/xoa-hinh-anh', function (req, res, next) {

    var obj = req.body;
    var id = obj.id;

    db.xoaProductImageList(id,function (error, result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi server"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, null, ""));

    })

});

router.post('/sua', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết session làm việc"));
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
    var parent_id = obj.parent_id == "" ? null : obj.parent_id;
    var image = obj.image;
    var important = obj.important;

    var meta_title_vi = obj.meta_title_vi;
    var meta_description_vi = obj.meta_description_vi;
    var meta_keyword_vi = obj.meta_keyword_vi;
    var meta_description_en = obj.meta_description_en;
    var meta_keyword_en = obj.meta_keyword_en;
    var meta_title_en = obj.meta_title_en;

    var product_id = obj.product_id;
    if(important){
        important = 1;
    }else{
        important = 0;
    }
    var type = obj.type;
    var entity_code = api.ENUM_ENTITY_CODE.PRD;
    var updated_date = api.getNow();
    var updated_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.updateSanPham(product_id, product_category_id, code, name_vi,
        title_vi, quantity, image, des_vi, html_vi,
        price, weight, parent_id, entity_code,
        updated_date, updated_by, unit, tag, status
        , order, rating, important, type, function (error, result) {
            if (error) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }

            db.updateMucDuLieu(product_id,name_vi,title_vi,des_vi,html_vi,updated_by,updated_date,meta_keyword_vi,meta_description_vi,meta_title_vi,entity_code,"vi", function (e1, ressult) {
                if (e1) {
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhậ vào mục dữ liệu tiếng việt"));
                    return;
                }
                db.updateMucDuLieu(product_id,name_en,title_en,des_en,html_en,updated_by,updated_date,meta_keyword_en,meta_description_en,meta_title_en,entity_code,"en", function (e3, ressult) {
                    if (e3) {
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật vào mục dữ liệu tiếng anh"));
                        return;
                    }
                    res.json(api.getResponse(api.SUCC_EXEC, null, ""));

                });

            });

        })


});


module.exports = router;
