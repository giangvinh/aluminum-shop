var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
const uuidv1 = require('uuid/v1');

// GET home page
router.get('/', function (req, res, next) {
    db.getWarehouseAndProduct(function (error, data) {
        if(error){
            return;
        }
        res.render('admin/danh-sach-nhap-kho', {data:data});
    })
});

router.post('/plus', function (req, res, next) {
    var username = req.session.username;
    var obj = req.body;
    var product_code = obj.product_code;
    var warehouse_history_type = obj.warehouse_history_type;
    var quantity = Number(obj.quantity);
    db.getWarehouseAndProductByProductCode(product_code,function (error, data) {
       if(error){
           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
           return;
       }
       if(data.length > 0){
           var previous_quantity = Number(data[0].quantity);
           previous_quantity+=quantity;
           if (data[0].warehouse_id != null) {
               db.updateWarehouse(previous_quantity,api.getNow(),username,data[0].product_id,function (error1, rs) {
                   if(error1){
                       res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                       return;
                   }
                   var id = uuidv1();
                   db.insertWarehouseHistory(id,data[0].warehouse_id,data[0].product_id,quantity,warehouse_history_type,username,api.getNow(),1,function (error2, rs1) {
                       if(error2){
                           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                           return;
                       }
                       res.json(api.getResponse(api.SUCC_EXEC, previous_quantity, ""));

                   })
               })
           } else {
               var warehouse_id = uuidv1();
               db.insertWarehouse(warehouse_id, data[0].product_id, previous_quantity, api.getNow(),username,1,function (error1, rs) {
                   if(error1){
                       res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                       return;
                   }
                   var id = uuidv1();
                   db.insertWarehouseHistory(id,warehouse_id,data[0].product_id,quantity,warehouse_history_type,username,api.getNow(),1,function (error2, rs1) {
                       if(error2){
                           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                           return;
                       }
                       res.json(api.getResponse(api.SUCC_EXEC, previous_quantity, ""));

                   })
               })
           }


       }

    });
});

router.post('/minus', function (req, res, next) {
    var username = req.session.username;
    var obj = req.body;
    var product_code = obj.product_code;
    var quantity = Number(obj.quantity);
    db.getWarehouseAndProductByProductCode(product_code,function (error, data) {
       if(error){
           res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
           return;
       }
       if(data.length > 0){
           var previous_quantity = Number(data[0].quantity);
           previous_quantity-=quantity;
           db.updateWarehouse(previous_quantity,api.getNow(),username,data[0].product_id,function (error1, rs) {
               if(error1){
                   res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                   return;
               }
               var id = uuidv1();
               db.insertWarehouseHistory(id,data[0].warehouse_id,data[0].product_id,quantity,2,username,api.getNow(),1,function (error2, rs1) {
                   if(error2){
                       res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                       return;
                   }
                   res.json(api.getResponse(api.SUCC_EXEC, previous_quantity, ""));

               })
           })
       }

    });
});

module.exports = router;
