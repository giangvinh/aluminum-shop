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
    if (req.session.username) {
        var id = req.query.id;

        db.getDanhMucSanPhamById(id, function (error, danhmuc) {
            if (error) {
                return;
            }
            res.render('admin/sua-danh-muc-san-pham', {
                danhmuc: danhmuc[0]
            });

        });

    } else {
        res.render('admin/loginPage');
    }

});


router.post('/sua', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết session làm việc"));
        return;
    }
    var obj = req.body;
    var des_vi = obj.des_vi;
    var name_vi = obj.name_vi;
    var title_vi = obj.name_vi;
    var category_id = obj.category_id;
    var entity_code = api.ENUM_ENTITY_CODE.CAT;
    var updated_date = new Date().toISOString().slice(0, 19).replace('T', ' ');
    var updated_by = req.session.username;
    var status = 1;
    var rating = 0;

    db.updateDanhMucSanPham(name_vi,title_vi,des_vi,null,updated_by,updated_date,entity_code,status,null,null,null,null,category_id,null, function (error, result) {
            if (error) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;

            }
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
            console.log(456456);

    })
});


module.exports = router;
