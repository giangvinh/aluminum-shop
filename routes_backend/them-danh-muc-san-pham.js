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
    res.render('admin/them-danh-muc-san-pham');
});

router.post('/them', function (req, res, next) {
    if (!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Hết phiên làm việc."));
        return;
    }
    var obj = req.body;
    var des_vi = obj.name;
    var name_vi = obj.name;
    var title_vi = obj.name;
    var id = uuidv1(); // ⇨ 'f64f2940-fae4-11e7-8c5f-ef356f279131'
    var entity_code = api.ENUM_ENTITY_CODE.CAT;
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;
    var rating = 0;


    db.insertDanhMucSanPham(id, name_vi, title_vi, des_vi, null, created_date, created_by, entity_code, status, null, null, null, null,null, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, {
            id: id
        }, ""));

    })

});


module.exports = router;
