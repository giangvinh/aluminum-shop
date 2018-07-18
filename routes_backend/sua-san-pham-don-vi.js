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
    db.getAllDanhMucSanPham(function (error, listDanhmuc) {
        if (error) {
            return;
        }
        console.log(34345345);
        db.getSanPhamById(id, function (error2, sanpham) {
            if(error2){
                return;
            }
            var cate_name=null;
            for (var i = 0; i < listDanhmuc.length; i++){
                console.log(34343);
                console.log(listDanhmuc[i].id);
                console.log(sanpham[0].product_category_id);
                if (sanpham[0].product_category_id == listDanhmuc[i].id){
                    cate_name=listDanhmuc[i].name;
                    console.log(34343);
                    console.log(listDanhmuc[i].name);
                }
            }



            res.render('admin/sua-san-pham-don-vi', {
                listDanhmuc: listDanhmuc,
                sanpham: sanpham[0],
                cate_name:cate_name
            });
            console.log(456464);
            console.log(sanpham);
            console.log(cate_name);
        })
    })
});




router.post('/sua', function (req, res, next) {
    var obj = req.body;
    var product_category_id = obj.product_category_id;
    var code = obj.code;
    var quantity = obj.quantity;
    var price = obj.price;
    var weight = obj.weight;
    var order = obj.order;
    var unit = obj.unit;
    var name = obj.name;
    var parent_id = null;
    var color=obj.color;


    var product_id = obj.product_id;
    var entity_code = api.ENUM_ENTITY_CODE.PRD;
    var updated_date = api.getNow();
    var updated_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.updateSanPham(product_id, product_category_id, code, name,
        null, quantity, null, null, null,
        price, weight, parent_id, entity_code,
        updated_date, updated_by, unit, null, null, status
        , order, rating, 0, 1,color, function (error, result) {
            if (error) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));


        })


});


module.exports = router;
