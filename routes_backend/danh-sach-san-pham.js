var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');

// GET home page
router.get('/', function (req, res, next) {
    // if(req.session.token && req.session.email) {
    //     var email = req.session.email;
    //     var token = req.session.token;

        // res.render('chinh-sach-ban-hang', {
        //     email: email,
        //     token: token
        // });

    db.getSanPham(function (error, data) {
        if(error){
            return;
        }
        res.render('admin/danh-sach-san-pham', {data:data});
    })


    // }else {
    //     utility.renderLogin(res);
    // }
});

router.post('/xoa', function (req, res, next) {
    // if(req.session.token && req.session.email) {
    //     var email = req.session.email;
    //     var token = req.session.token;

    // res.render('chinh-sach-ban-hang', {
    //     email: email,
    //     token: token
    // });

    var obj = req.body;
    var id = obj.id;
    db.removeSanPham(id,function (error,result) {
       if(error){
           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
           return;
       }
       if(result){
           res.json(api.getResponse(api.SUCC_EXEC, null, ""));
       }

    });

    // }else {
    //     utility.renderLogin(res);
    // }
});

router.post('/update_order', function (req, res, next) {


    var obj = req.body;
    var id = obj.id;
    var order = obj.order;

    db.updateOrderProduct(order,id,function (error,result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(result){
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
        }

    });

});
module.exports = router;
