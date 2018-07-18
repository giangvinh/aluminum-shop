var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
const uuidv1 = require('uuid/v1');

// GET home page
router.get('/', function (req, res, next) {

    db.getUnselectBestSeller(function (error, sanpham) {
        if(error) return;
        db.getBestSellProduct(function (error1, bestSell) {
            if(error1) return;
            db.getBestSellProductOption(function (erro2, option) {
                if (erro2) return;

                res.render('admin/quan-ly-san-pham-ban-chay', {
                    sanpham: sanpham,
                    bestSell: bestSell,
                    option: option[0]
                });
            })

        })

    })

});


router.post('/them', function (req, res, next) {
    var obj = req.body;
    var product_id = obj.product_id;
    console.log('product_id '+ product_id);
    var order = obj.order;
    order = Number(order);
    db.countBestSellProduct(product_id,function (error, countResult) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        var created_date = api.getNow();
        var created_by = req.session.username;
        if(countResult[0].count == 0){
            var id = uuidv1();

            var status = 1;
            db.insertBestSellProduct(id,product_id,created_by,created_date,status,function (error1, rs) {
                if(error1){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
                    return;
                }
                db.updateBestSellProduct(order,created_by,created_date,product_id,function (error2, rs1) {
                    if(error2){
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
                        return;
                    }
                    res.json(api.getResponse(api.SUCC_EXEC, "insert", ""));
                })

            });
        }else {
            db.updateBestSellProduct(order,created_by,created_date,product_id,function (error1, result) {
                if(error1){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
                    return;
                }
                res.json(api.getResponse(api.SUCC_EXEC, "update", ""));

            })
        }
    })
});


router.post('/xoa', function (req, res, next) {
    var obj = req.body;
    var product_id = obj.product_id;
    db.removeBestSellProduct(product_id,function (error, countResult) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, "", ""));

    })
});


router.post('/update_order', function (req, res, next) {


    var obj = req.body;
    var id = obj.id;
    var order = obj.order;

    db.updateOrderBestSellProduct(order,id,function (error,result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(result){
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
        }

    });

});


router.post('/change_option', function (req, res, next) {
    var obj = req.body;
    var option_number = obj.option_number;
    db.updateBestSellProductOption(option_number,function (error, countResult) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, "", ""));

    })
});


router.post('/count', function (req, res, next) {
    var obj = req.body;
    var product_id = obj.product_id;
    db.countBestSellProduct(product_id,function (error, countResult) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, countResult[0].count, "SUCCESS"));

    })
});


module.exports = router;
