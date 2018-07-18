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
    db.getAllProduct(function (error, sanpham) {
        if (error) {
            res.render('admin/them-don-hang', {
            });
            return;
        }
        res.render('admin/them-don-hang', {
            sanpham:sanpham
        });
        console.log(254685855);
        console.log(sanpham);
    })

});

router.post('/count', function (req, res, next) {
    var obj = req.body;
    var product_id = obj.product_id;
    db.countProduct(product_id,function (error, countResult) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, countResult[0].count, "SUCCESS"));

    })
});


router.post('/getAllProduct', function (req, res, next) {
    var obj = req.body;
    db.getAllProduct(function (error, product) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, product, "SUCCESS"));

    })
});


router.post('/them', function (req, res, next) {
    if(!req.session.username){
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết phiên làm việc"));
        return;
    }
    var obj = req.body;
    var fullname = obj.fullname;
    var email = obj.email;
    var phone = obj.phone;
    var address_delivery = obj.address_delivery;
    var total_amount = obj.total_amount;
    var total_quantity = obj.total_quantity;
    var percent_promotion = obj.percent_promotion;
    var price_coupon = obj.price_coupon;
    var isPromo = obj.isPromo;
    var list_product = obj.list_product;
    var type = obj.type;
    var o_id = uuidv1();
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.insertPurchaseOrder(o_id, null, fullname, email, phone, 0, address_delivery,
        null, null, null, created_date, created_by, status, total_amount, total_quantity, null, percent_promotion,
        price_coupon, null, null,function (er, purchaseOrder) {
            if (er) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            //for(var i=0;i< list_product.product_id.length;i++){
            list_product.forEach(function(product) {


                var od_id = uuidv1();


                db.insertPurchaseOrderDetail(od_id, o_id, product.product_id, product.product_quantity,
                    product.product_price, product.product_total, created_date, created_by, status, product.is_promo,
                    product.product_promotion_percent, product.product_promotion_price, null, null,product.category_name,product.color_name, function (er, purchaseOrderDetail) {
                        if (er) {
                            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                            return;
                        }

                })



            });
            list_product.forEach(function(product){
                console.log(43534534534535);
                console.log(product);
                db.getWarehouseByProductId(product.product_id, function (error13, rsmkz) {
                    if (error13) return;

                    console.log(rsmkz);
                    var current_quantity = rsmkz[0].product_quantity;
                    console.log(34384738478);
                    console.log(product.product_id);
                    console.log(current_quantity);
                    current_quantity -= product.product_quantity;
                    console.log(current_quantity);
                    db.updateWarehouse(current_quantity, created_date, created_by, product.product_id, function (error12, rsmz) {
                        if (error12) return;
                        var warehouse_history_id = uuidv1();
                        db.insertWarehouseHistory(warehouse_history_id, rsmkz[0].warehouse_id, product.product_id, -product.product_quantity, 3, created_by, created_date, 1, function (error15, rsmza) {
                            if (error15) return;
                        })
                    });

                })
            });



            var oh_id = uuidv1();
            db.insertPurchaseOrderHistory(oh_id, o_id, status, total_amount, total_quantity, null,
                created_date, created_by,function (er, purchaseOrderHistory) {
                    if (er) {
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                        return;
                    }
                    console.log(43534534534535);
                    console.log(purchaseOrderHistory);

                    res.json(api.getResponse(api.SUCC_EXEC, {
                        o_id: o_id
                    }, ""));
            })



    })

});


module.exports = router;
