var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');

// GET home page
router.get('/', function (req, res, next) {

    db.getAllRole(function (error, data) {
        if(error){
            return;
        }
        res.render('admin/danh-sach-quyen', {data:data});
    })


});

router.post('/xoa', function (req, res, next) {
    var obj = req.body;
    var id = obj.id;
    db.checkUserExist(id,function (error, rs) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(rs.length>0){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "vẫn còn người dùng tồn tại trong quyền này"));
        }else {
            db.deleteRole(id,function (error1, rs1) {
                if(error){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                    return;
                }
                res.json(api.getResponse(api.SUCC_EXEC, null, ""));
            })


        }
    })
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
