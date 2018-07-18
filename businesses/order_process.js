var moment = require('moment');
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var db = require('../databases/database');
var api = require('../api/response');
const uuidv1 = require('uuid/v1');

var promotion_process = require('../businesses/promotion_process');

var thiz = this;

exports.getPriceTransport = function (successCallback, errorCallback) {
    db.getPriceTransport(function(err6, phivanchuyen) {
        if (err6) {
            if (errorCallback) {
                errorCallback();
            }
            return err6;
        }
        if (phivanchuyen.length > 0) {
            var shipFee = parseInt(phivanchuyen[0].value);
            if (successCallback) {
                successCallback(shipFee);
            }
        }
    });
};

exports.getOrderInformation = function (order_id, successCallback, errorCallback) {
    db.getPurchaseOrderDetails(order_id, function (error, orderDetails) {
        if (error) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }
        console.log(393933);
        console.log(orderDetails);

        if (orderDetails && orderDetails.length > 0) {
            thiz.getPriceTransport(function(ship_fee) {
                var total_amount_after_promotion = 0;
                orderDetails.forEach(function(obj) {
                    var order_detail_price_promotion = 0;
                    if (obj.order_detail_price_promotion != null) {
                        order_detail_price_promotion = obj.order_detail_price_promotion;
                    }
                    // total_amount_after_promotion += obj.order_detail_total_amount - order_detail_price_promotion;
                    console.log(324343);
                    console.log(total_amount_after_promotion);
                    total_amount_after_promotion += obj.order_detail_total_amount;
                });

                var orderInfo = orderDetails[0];

                var couponApplied = false;
                var coupon_discount = 0;
                if (orderInfo.order_code_coupon != null && orderInfo.order_code_coupon.length > 0) {
                    couponApplied = true;
                    coupon_discount = orderInfo.order_price_coupon;
                }

                if (successCallback) {
                    successCallback(total_amount_after_promotion, ship_fee, couponApplied, coupon_discount, orderDetails, orderInfo);
                }

            });

        }
    });
};

exports.getPurchaseOrderDetails = function (order_id, langCode, sucessCallback, errorCallback) {

    db.getPurchaseOrderDetails(order_id, langCode, function (error, result) {
        if (error) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }
        if (result) {
            if (sucessCallback) {
                sucessCallback(result);
            }
        }
    });
};

exports.insertPurchaseOrder = function(langCode, sessionCart, diff, email, name, address, phone, city_id,
                                       district_id, ward_id, coupon, successCallback, errorCallback) {

    var order_id = uuidv1();
    var created_at = api.getNow();
    var created_by = name;
    if (diff) {
        diff = 1;
    } else {
        diff = 0;
    }

    thiz.getProductInfoForCart(langCode, sessionCart, function(products, totalCustomerHasToPay) {

        var total_original_amount = 0;
        if (products && products.length > 0) {
            products.forEach(function(cartItem) {

                var detail_id = uuidv1();
                var product_total_amount = cartItem.product_order_quantity * cartItem.product_price;
                total_original_amount += product_total_amount;
                // no thread in this function
                promotion_process.calculateDiscount(product_total_amount, cartItem, false, function(data) {

                    var is_promotion = 0;
                    var promotion_id = cartItem.promotion_id;
                    var promotion_name = cartItem.promotion_name;
                    var percent_promotion = null;
                    var price_promotion = null;
                    if (data.type == 1) {
                        is_promotion = 1;
                        price_promotion = data.discount_amount;
                    } else if (data.type == 2) {
                        is_promotion = 1;
                        percent_promotion = data.discount_percent;
                        price_promotion = data.discount_amount;
                    } else if (data.type == 3) {
                        is_promotion = 1;
                        promotion_process.insertProductGifts(
                            detail_id,
                            cartItem.product_id,
                            created_by,
                            created_at,
                            promotion_id);
                    }




                    db.insertPurchaseOrderDetail(
                        detail_id,
                        order_id,
                        cartItem.product_id,
                        cartItem.product_order_quantity,
                        cartItem.product_price,
                        product_total_amount,
                        created_at,
                        created_by,
                        1 /* status */,
                        is_promotion,
                        percent_promotion,
                        price_promotion,
                        null, /* code_promotion */
                        promotion_id,
                        promotion_name, function (error1, temp_id) {
                            if (error1) {
                                return;
                            }

                        });
                });

            });
        }


        db.insertPurchaseOrder(order_id, null, name, email, phone, diff, address, city_id, ward_id, district_id, created_at,
                            created_by, 5 /* not ready */, total_original_amount, products.length, null, null, null, coupon, null, function (error, rs) {
            // nothing
        });

        if (successCallback) {
            successCallback(order_id)
        }


        var history_id = uuidv1();
        db.insertPurchaseOrderHistory(
            history_id,
            order_id,
            1 /* status */,
            total_original_amount,
            products.length,
            null, /* remark */
            created_at,
            email, function (error4, rsl) {
            // nothing
        });

        promotion_process.getCouponPromotion(coupon, langCode, sessionCart,
            function(coupon_promotion_id, coupon_promotion_name, coupon_percent_promotion,
                     total_promotion, coupon_count_will_be_used) {

                db.updateCouponCalcInPurchasedOrder(order_id, coupon_percent_promotion, total_promotion,
                    coupon_promotion_id, coupon_promotion_name, function(errorFindCoupon, resultFindCou) {
                        // nothing
                    });
            }, function() {
                // nothing
            });

        promotion_process.markAsUsedCoupon(order_id, function() {
            // nothing
        });


    }, function() {
        // nothing
    });
};

exports.getOrder = function(languageCode, sessionCart, sucessCallback, errorCallback) {

};

exports.getProductInfoForCart = function(languageCode, sessionCart, sucessCallback, errorCallback) {
    var productIds = [];
    var cartValues = {};

    if(sessionCart.length > 0) {
        sessionCart.forEach(function (cartItem) {
            var product_id = cartItem.product_id;
            productIds.push(product_id);
            cartValues[product_id] = cartItem.quantity;
        });

    }

    db.getProductInfoForCart(languageCode, productIds, function(error6, products) {
        if (error6) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }

        var totalCustomerHasToPay = 0;
        if (products && products.length > 0) {
            products.forEach(function (product) {
                product.product_order_quantity = cartValues[product.product_id];
                var discount_amount = 0;
                promotion_process.calculateDiscount(product.product_price, product, false, function(data) {
                    if (data && data.type == 1 || data.type == 2) {
                        discount_amount = data.discount_amount;
                    }
                });
                totalCustomerHasToPay += (product.product_price - discount_amount) * product.product_order_quantity;

            });
        }

        if (sucessCallback) {
            sucessCallback(products, totalCustomerHasToPay);
        }
    });

};


exports.getPaymentMethodString = function(pay_method) {
    var payment_method = "COD";
    if (pay_method == 1) {
        payment_method == "COD";
    } else if (pay_method == 2) {
        payment_method == "Thẻ ATM";
    } else if (pay_method == 3) {
        payment_method == "Thẻ quốc tế";
    }
    return payment_method;
};
