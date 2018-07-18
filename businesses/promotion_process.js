var moment = require('moment');
var db = require('../databases/database');
const uuidv1 = require('uuid/v1');
var api = require('../api/response');

var order_process = require('../businesses/order_process');

exports.getProductGiftByProductId = function (product_id, langCode, successCallback, errorCallback) {
    db.getProductGiftByProductId(product_id, langCode, function(err12, productGifts) {
        if (err12) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }
        if (!productGifts) {
            productGifts = [];
        }

        var available = true;
        productGifts.forEach(function(product) {
            if (product.product_parent_warehouse_quantity_root != null) { // is SP combo
                if (product.product_parent_warehouse_quantity_root < product.product_quantity) {
                    available = false;
                }
            } else if (product.product_parent_warehouse_quantity != null) { // is SP don vi
                if (product.product_parent_warehouse_quantity == 0) {
                    available = false;
                }
            }
        });

        if (successCallback) {
            successCallback(productGifts, available);
        }

    });
};

exports.getCouponDiscountByOrderId = function (order_id, sucessCallback, errorCallback) {
    db.getPurchaseOrderByID(order_id, function(error, results) {
        if (error) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }

        var couponApplied = false;
        var discount_amount = 0;
        if (results && results.length > 0) {
            couponApplied = results[0].code_coupon != null;
            if (couponApplied) {
                discount_amount = results[0].price_coupon;
            }
        }

        if (sucessCallback) {
            sucessCallback(couponApplied, discount_amount);
        }
    });
};

exports.calculateDiscount = function (total_before, promotionObj, isCoupon, sucessCallback, errorCallback) {

        if (isCoupon
            && promotionObj.minimum_price != null && total_before < promotionObj.minimum_price) { // no discount
            if (sucessCallback) {
                sucessCallback({
                    type: promotionObj.promotion_type,
                    valid: true,
                    no_discount: true
                });
            }
            return;
        }

        if (promotionObj.promotion_type == 1) {
            if (promotionObj.fix_price > total_before) {
                promotionObj.fix_price = total_before;
            }
            if (sucessCallback) {
                sucessCallback({
                    type: 1,
                    discount_amount: promotionObj.fix_price
                });
            }
        } else if (promotionObj.promotion_type == 2) {

            var discount_amount = total_before * promotionObj.percent / 100;
            if (isCoupon
                && promotionObj.maximum_price != null && promotionObj.maximum_price < discount_amount) {
                discount_amount = promotionObj.maximum_price;
            }
            if (sucessCallback) {
                sucessCallback({
                    type: 2,
                    discount_percent: promotionObj.percent,
                    discount_amount: discount_amount
                });
            }
        } else if (promotionObj.promotion_type == 3) {
            if (isCoupon) {
                return;
            }
            if (sucessCallback) {
                sucessCallback({
                    type: 3,
                    valid: true,
                    gift: promotionObj.gift
                });
            }
        } else {
            if (sucessCallback) {
                sucessCallback({
                    type: 4, // no discount
                    discount_amount: 0
                });
            }

        }

};

exports.getCouponPromotion = function (coupon, languageCode, sessionCart, sucessCallback, errorCallback) {

    db.findCoupon(coupon, function (error, rsfindCoupon) {
        if (error) {
            if (errorCallback) {
                errorCallback();
            }
            return;
        }

        if (rsfindCoupon.length > 0) {
                var couponPromotion = rsfindCoupon[0];
                var coupon_promotion_id = couponPromotion.promotion_id;
                var coupon_promotion_name = couponPromotion.promotion_name;
                var coupon_percent_promotion = null;
                var coupon_promotion_type = couponPromotion.promotion_type;

                if (couponPromotion.coupon_type == 1) { // for order

                    var totalPromotion = 0;


                    order_process.getProductInfoForCart(languageCode, sessionCart, function(products, totalCustomerHasToPay) {

                        // no engouth minimum amount for voucher
                        if (couponPromotion.minimum_price && couponPromotion.minimum_price > totalCustomerHasToPay) {
                            if (errorCallback) {
                                errorCallback();
                            }
                            return;
                        }

                        if (coupon_promotion_type == 1) { // fixed promotion
                            totalPromotion += couponPromotion.fix_price;
                        } else if (coupon_promotion_type == 2) { // percentage promotion
                            totalPromotion += couponPromotion.percent * totalCustomerHasToPay / 100;
                        }

                        if (couponPromotion.maximum_price && couponPromotion.maximum_price < totalPromotion) {
                            totalPromotion = couponPromotion.maximum_price;
                        }

                        if (sucessCallback) {
                            sucessCallback(coupon_promotion_id, coupon_promotion_name, coupon_percent_promotion,
                                totalPromotion, 1 /* coupon will be used */ );
                        }
                    }, function() {
                        if (errorCallback) {
                            errorCallback();
                        }
                    });

                } else if (couponPromotion.coupon_type == 2) { // for selected products

                    var productIds = [];
                    var cartValues = {};

                    if(sessionCart.length > 0) {
                        sessionCart.forEach(function (cartItem) {
                            var product_id = cartItem.product_id;
                            productIds.push(product_id);
                            cartValues[product_id] = cartItem.quantity;
                        });

                    }

                    db.findSelectedProductAffectedForCoupon(couponPromotion.promotion_id, productIds, function (errorFindCoupon, resultFindCou) {
                        if (errorFindCoupon) {
                            if (errorCallback) {
                                errorCallback();
                            }
                            return;
                        }

                        if (resultFindCou != null && resultFindCou.length > 0) {

                            var totalPromotion = 0;
                            resultFindCou.forEach(function (product) {
                                var product_order_quantity = cartValues[product.product_id];
                                var product_price = product.product_price;
                                if (coupon_promotion_type == 1) { // fixed promotion
                                    totalPromotion += couponPromotion.fix_price * product_order_quantity;
                                } else if (coupon_promotion_type == 2) { // percentage promotion
                                    totalPromotion = couponPromotion.percent * product_price * product_order_quantity / 100;
                                }

                            });

                            if (couponPromotion.maximum_price && couponPromotion.maximum_price < totalPromotion) {
                                totalPromotion = couponPromotion.maximum_price;
                            }

                            if (sucessCallback) {
                                sucessCallback(coupon_promotion_id, coupon_promotion_name, coupon_percent_promotion, totalPromotion);
                            }

                        } else {
                            if (errorCallback) {
                                errorCallback();
                            }
                        }
                    });


                }

        } else {
            if (errorCallback) {
                errorCallback();
            }
        }
    });
};

exports.insertProductGifts = function (order_detail_id, product_id,created_by,created_at, promotion_id, callback) {
        db.findPrductGiftByPromotionId(promotion_id, function (error11, productList) {
            if (error11) {
                return;
            }

            if (productList == null || productList.length == 0) {
                return;
            }
            for (var index = 0; index < productList.length; index++) {
                var productObj = productList[index];
                if (productObj) {
                    var purchase_order_detail_gift_id = uuidv1();
                    db.insertPurchaseOrderDetailGift(purchase_order_detail_gift_id, order_detail_id, productObj.product_id, created_at, created_by, 1, function (error9, rsm) {
                    });

                    var product_parent_quantity = productObj.product_parent_quantity;
                    var parent_id = productObj.product_parent_id;
                    if (parent_id != null) {
                        db.getSanPhamById(parent_id, function (error12, rsmz) {
                            if (error12) return;
                            if (rsmz) {
                                var parent_obj = rsmz[0];
                                var parent_product_id = parent_obj.id;
                                product_parent_quantity *= parent_obj.quantity;
                                db.getWarehouseByProductId(parent_product_id, function (error13, rsmkz) {
                                    if (error13) return;
                                    var current_quantity = rsmkz[0].product_quantity;
                                    current_quantity -= product_parent_quantity;



                                    db.updateWarehouse(current_quantity, created_at, created_by, parent_product_id, function (error12, rsmz) {

                                    });
                                    var warehouse_history_id = uuidv1();
                                    db.insertWarehouseHistory(warehouse_history_id, rsmkz[0].id, parent_product_id, current_quantity, 1, created_by, created_at, 1, function (error15, rsmza) {

                                    })
                                })

                            }
                        })
                    } else {
                        db.getWarehouseByProductId(product_id, function (error13, rsmkz) {
                            if (error13) return;
                            var current_quantity = rsmkz[0].product_quantity;
                            current_quantity -= product_parent_quantity;

                            db.updateWarehouse(current_quantity, created_at, created_by, product_id, function (error12, rsmz) {

                            });
                            var warehouse_history_id = uuidv1();

                            db.insertWarehouseHistory(warehouse_history_id, rsmkz[0].id, product_id, current_quantity, 1, created_by, created_at, 1, function (error15, rsmza) {

                            })
                        })

                    }
                }
            }
        })
};

exports.markAsUsedCoupon = function (coupon, count_will_be_used, callback) {

    db.getMultiCoupon(coupon, function (error, rs) {
        if (error) return;
        if (rs.length > 0) { // check if coupon is once use
            var promotion_detail_id = rs[0].id;
            db.updateCouponMultiStatus(3, promotion_detail_id, function (e1, rs1) {
                // nothing
            })
        }
    });

    db.getSingleCoupon(coupon, function (error, rs) {
        if (error) return;
        if (rs.length > 0) {
            var number = rs[0].number_of_uses - count_will_be_used;
            if (number < 0) {
                number = 0;
            }
            if (number >= 0) {
                db.updatePromotionCouponTimeUse(number, rs[0].id, function (e2, fd) {
                    // nothing
                });
                if (number == 0) {
                    db.updateUsedCouponForOnceUseCoupon(coupon, function (error, rsa) {
                        if (error) {
                            return;
                        }
                    });
                }
            }

        }
    })

};
