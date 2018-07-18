var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
var nodemailer = require('nodemailer');
const uuidv1 = require('uuid/v1');
var pug = require('pug');
var moment = require('moment-timezone');
moment.tz.setDefault("Asia/Ho_Chi_Minh");

var order_process = require('../businesses/order_process');
var email_process = require('../businesses/email_process');
var warehouse_process = require('../businesses/warehouse_process');
var promotion_process = require('../businesses/promotion_process');



// GET home page
router.get('/', function (req, res, next) {

    db.getPurchaseOrder(function (error, data) {
        if (error) {
            return;
        }
        var promotion_type = [];
        for(var index=0;index<data.length;index++){
            var content = data[index];
            var type = null;
            if (content.percent_promotion == null && content.price_promotion == null) {
                type = 3;
            } else if (content.percent_promotion == null && content.price_promotion != null) {
                type = 1;
            } else if (content.percent_promotion != null) {
                type = 2;
            }
            var unformat_date = content.created_date;
            var date = moment(unformat_date,"YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD-MM-YYYY HH:mm');
            data[index].formatted_date = date;
            data[index].data_order_sort = unformat_date;
            promotion_type.push({type: type});
        }
        console.log(data)
        var statuses = [
            {value: 1, name: "Đơn hàng mới", relate: [2, 3, 4, 7]},
            {value: 2, name: "Nhân viên đã gọi xác nhận", relate: [3, 4, 7]},
            {value: 3, name: "Đã xuất hàng", relate: [4, 7]},
            {value: 4, name: "Đã giao và thanh toán", relate: []},
            {value: 5, name: "Đang tạo đơn hàng", relate: [7]},
            {value: 6, name: "Đang thanh toán", relate: [7]},
            {value: 7, name: "Đã huỷ đơn hàng", relate: []}
        ];

        res.render('admin/danh-sach-don-hang', {
            data: data,
            data_text: JSON.stringify(data),
            statuses: statuses,
            payment_methods: [
                {value: 1, name: "COD"},
                {value: 2, name: "Thẻ ATM"},
                {value: 3, name: "Thẻ quốc tế"}
            ]
        });
    });
});


router.post('/xoa', function (req, res, next) {
    var obj = req.body;
    var id = obj.id;

    db.deleteOrder(id,function (error1, rs1) {
        if(error1){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        db.deleteOrderDetail(id,function (error1, rs1) {
            if(error1){
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            db.deleteOrderHistory(id,function (error1, rs1) {
                if(error1){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                    return;
                }
                res.json(api.getResponse(api.SUCC_EXEC, null, ""));
            });
        });
    });

});


router.post('/getPurchaseDetails', function (req, res, next) {

    var obj = req.body;
    var order_id = obj.order_id;

    order_process.getOrderInformation(order_id, function (total_amount_after_product_promotion, ship_fee,
                                                                              couponApplied, coupon_discount, orderDetails, orderInfo) {
        if (!orderDetails) {
            orderDetails = [];
        }
        console.log(4534534);

        res.json(api.getResponse(api.SUCC_EXEC, {
            products: orderDetails,
            orderInfo: orderInfo,
            total_amount_after_product_promotion: total_amount_after_product_promotion,
            phi_van_chuyen: ship_fee,
            couponApplied: couponApplied,
            coupon_discount: coupon_discount,
            final_total_amount: total_amount_after_product_promotion
        }, ""));

    });

});

router.post('/getTableExcel', function (req, res, next) {

    var obj = req.body;
    var data = obj.data;
    console.log(data);
});

router.post('/getPriceTransport', function (req, res, next) {
    db.getPriceTransport(function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if (result) {
            res.json(api.getResponse(api.SUCC_EXEC, result[0].value, ""));
        }
    });
});

router.post('/getGiftProduct', function (req, res, next) {
    var obj = req.body;
    var purchase_order_detail_id = obj.purchase_order_detail_id;
    db.getProductGiftByPurchaseOrderDetailId(purchase_order_detail_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if (result) {
            res.json(api.getResponse(api.SUCC_EXEC, result, ""));
        }
    });
});

router.post('/update', function (req, res, next) {
    var obj = req.body;
    var order_id = obj.order_id;
    var old_status = obj.old_status;
    var new_status = obj.new_status;
    var name = obj.name;
    var email = obj.email;

    function send_mail(res, req) {


        order_process.getOrderInformation(order_id, "vi", function(total_amount_after_product_promotion, ship_fee,
                                                                   couponApplied, coupon_discount, orderDetails, orderInfo) {


            var client_name = orderInfo.order_fullname;
            var client_email = orderInfo.order_email;
            var address = orderInfo.order_address_delivery;
            var phone = orderInfo.order_phone;
            var code = orderInfo.order_code;
            var now = api.getNowEmail();
            var baseUrl = api.getServerAddressBase(req);

            var payment_method = order_process.getPaymentMethodString(orderInfo.payment_method);


            res.render('admin/email-successfull-delevery', {
                client_name: client_name,
                payment_method: payment_method,
                code: code,
                now: now,
                address: address,
                phone: phone,
                products: orderDetails,
                total_amount_after_product_promotion: total_amount_after_product_promotion,
                ship_fee: ship_fee,
                base_url: baseUrl,
                discount_voucher: coupon_discount,
                final_total_amount: total_amount_after_product_promotion - ship_fee - coupon_discount
            }, function (err, html) {
                email_process.sendEmail(client_email, "Opera giao hàng thành công", html);
            });



        });





    }


    db.updatePurchaseOrderStatus(new_status, order_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }

        if (result) {

            if (new_status == 4) { // Đã giao và thanh toán
                if (old_status != 3) { // Chưa xuất hàng
                    warehouse_process.exportWarehouse(order_id, req.session.username);
                }

                send_mail(res, req);

            } else if (new_status == 3) { // Đã xuất hàng
                warehouse_process.exportWarehouse(order_id, req.session.username);

            } else if (new_status == 7) { // Hủy đơn hàng
                if (old_status == 3 || old_status == 4) { // Chưa xuất hàng
                    warehouse_process.returnWarehouse(order_id, req.session.username);
                }

            }
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
        }
    });

});

module.exports = router;