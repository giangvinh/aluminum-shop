var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');

// GET home page
router.get('/', function (req, res, next) {

    db.getDanhMucSanPham(function (error, data) {
        if(error){
            return;
        }
        res.render('admin/danh-sach-danh-muc-san-pham', {data:data});
    })

});
router.post('/changeProductStatus', function (req, res, next) {
    var obj = req.body;
    var id = obj.id;
    var status = obj.new_status;

    db.updateProductCategoryStatus(status,id,function (error,result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(result){
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
        }

    });

});
router.post('/xoa', function (req, res, next) {
    // if(req.session.token && req.session.email) {
    //     var email = req.session.email;
    //     var token = req.session.token;

    // res.render('chinh-sach-ban-hang', {
    //     email: email,
    //     token: token
    // });
    if(!req.session.username) {
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết phiên làm việc"));
        return;
    }
    var obj = req.body;
    var id = obj.id;
    db.removeDanhMucSanPham(id,function (error,result) {
       if(error){
           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
           return;
       }
        db.removeSanPhamCuaDanhMuc(id,function (error1,result1) {
            if(error1){
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            if(result1){
                res.json(api.getResponse(api.SUCC_EXEC, null, ""));
            }
        });

    });
});

router.post('/update_order', function (req, res, next) {


    var obj = req.body;
    var id = obj.id;
    var order = obj.order;

    db.updateOrderProductCategory(order,id,function (error,result) {
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
