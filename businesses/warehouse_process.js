var moment = require('moment');
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var db = require('../databases/database');
const uuidv1 = require('uuid/v1');
var api = require('../api/response');


exports.exportWarehouse = function(order_id, related_user) {
    db.getWarehouseByOrderId(order_id, function (error2, result2) {
        if (error2) {
            return;
        }

        if (result2 && result2.length > 0) {
            var quantityNeedUpdateTo = 0;
            var warehouse_id = 0;


            result2.forEach(function(orderDetail) {

                if (orderDetail == null) {
                    return;
                }

                if (orderDetail.product_id == null || orderDetail.product_id.length == 0) {
                    return;
                }

                var order_detail_quantity = orderDetail.order_detail_quantity;
                var warehouse_product_id = orderDetail.product_id;
                var warehouse_history_product_quantity = 0;
                if (orderDetail.root_product_id != null) {
                    var root_warehouse_product_quantity = orderDetail.root_warehouse_product_quantity ? orderDetail.root_warehouse_product_quantity : 0;
                    warehouse_history_product_quantity = parseInt(order_detail_quantity * orderDetail.product_quantity_unit);
                    quantityNeedUpdateTo = root_warehouse_product_quantity - warehouse_history_product_quantity;
                    warehouse_id = orderDetail.root_warehouse_id;
                } else {
                    var warehouse_product_quantity = orderDetail.warehouse_product_quantity ? orderDetail.warehouse_product_quantity : 0;
                    warehouse_history_product_quantity = order_detail_quantity;
                    quantityNeedUpdateTo = warehouse_product_quantity - warehouse_history_product_quantity;
                    warehouse_id = orderDetail.warehouse_id;
                }

                var updated_by = related_user;
                db.updateWarehouseByWarehouseID(quantityNeedUpdateTo, api.getNow(), updated_by, warehouse_id, function (error3, result3) {
                    if (error3) {
                        return;
                    }
                    var id = uuidv1();
                    var created_by = related_user;
                    db.insertWarehouseHistory(id, warehouse_id, warehouse_product_id,
                        -warehouse_history_product_quantity, 3 /* For seller */,
                        created_by, api.getNow(), 1, function (error4, rs1) {
                            if (error4) {
                                return;
                            }

                        })
                })
            });

        }
    });
};

exports.returnWarehouse = function(order_id, related_user) {
    db.getWarehouseByOrderId(order_id, function (error2, result2) {
        if (error2) {
            return;
        }
        console.log(result2);

        if (result2 && result2.length > 0) {
            var quantityNeedUpdateTo = 0;
            var warehouse_id = 0;

            result2.forEach(function(orderDetail) {
                if (orderDetail == null) {
                    return;
                }

                if (orderDetail.product_id == null || orderDetail.product_id.length == 0) {
                    return;
                }

                var order_detail_quantity = orderDetail.order_detail_quantity;
                var warehouse_product_id = orderDetail.product_id;
                var warehouse_history_product_quantity = 0;
                if (orderDetail.root_product_id != null) {
                    var root_warehouse_product_quantity = orderDetail.root_warehouse_product_quantity ? orderDetail.root_warehouse_product_quantity : 0;
                    warehouse_history_product_quantity = parseInt(order_detail_quantity * orderDetail.product_quantity_unit);
                    quantityNeedUpdateTo = root_warehouse_product_quantity + warehouse_history_product_quantity;
                    warehouse_id = orderDetail.root_warehouse_id;
                } else {
                    var warehouse_product_quantity = orderDetail.warehouse_product_quantity ? orderDetail.warehouse_product_quantity : 0;
                    warehouse_history_product_quantity = order_detail_quantity;
                    quantityNeedUpdateTo = warehouse_product_quantity + warehouse_history_product_quantity;
                    warehouse_id = orderDetail.warehouse_id;
                }

                var updated_by = related_user;
                db.updateWarehouseByWarehouseID(quantityNeedUpdateTo, api.getNow(), updated_by, warehouse_id, function (error3, result3) {
                    if (error3) {
                        return;
                    }
                    var id = uuidv1();
                    var created_by = related_user;
                    db.insertWarehouseHistory(id, warehouse_id, warehouse_product_id,
                        warehouse_history_product_quantity, 3 /* For seller */,
                        created_by, api.getNow(), 1, function (error4, rs1) {
                            if (error4) {
                                return;
                            }

                        })
                })
            });

        }
    });
};
