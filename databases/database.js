var mysql = require('mysql');
var moment = require('moment-timezone');
moment.tz.setDefault("Asia/Ho_Chi_Minh");

var config = require('../config.json');
var dbconfig = require('../' + config.db_config_name);




var api = require('../api/response');
var pool = mysql.createPool({
    host: dbconfig.database_host,
    port: dbconfig.database_port,
    user: dbconfig.database_username,
    password: dbconfig.database_password,
    database: dbconfig.database_name,
    connectionLimit: 10,
    // socketPath: "/Applications/MAMP/tmp/mysql/mysql.sock",
    supportBigNumbers: true
});

// var pool = mysql.createPool({
//     host: 'localhost',
//     user: 'operamart',
//     password: 'mx5e3eDOM3Ps1Siy',
//     database: 'operamart',
//     connectionLimit: 10,
//     supportBigNumbers: true,
//     socketPath: "/Applications/MAMP/tmp/mysql/mysql.sock"
// });


exports.insertAccount = function(email, password, callback) {
    var sql = "INSERT INTO trUser (email, password, updated_at, created_at) " +
            "VALUES (?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [email, password, now, now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertLienHe = function(id, email, phone, note, created_date, created_by, address, name, status, callback) {
    var sql = "INSERT INTO Contact (id, email, phone, note, created_date, created_by, address, name, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, email, phone, note, created_date, created_by, address, name, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertNotification = function(id, title, icon, description, client_id, created_date, created_by, link, is_email, is_notification, requiring_id, requiring_entity_code, unread, callback) {
    var sql = "INSERT INTO Notification (id, title, icon, description, client_id, created_date, created_by, link, is_email, is_notification, requiring_id, requiring_entity_code, unread) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, title, icon, description, client_id, created_date, created_by, link, is_email, is_notification, requiring_id, requiring_entity_code, unread], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucNotInFooter = function( callback) {
    var sql = "SELECT pc.id as product_category_id, pc.name as product_category_name " +
        "FROM ProductCategory pc " +
        "WHERE pc.status > 0 AND pc.status IS NOT NULL " +
        "   AND pc.parent_id IS NOT NULL " +
        "   AND pc.footer = 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucInFooterWithLanguage = function(languageCode, callback) {
    var sql = "SELECT pc.id as product_category_id, pc.name as product_category_name " +
        "FROM ProductCategory pc " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON pc.id = dd.requiring_id " +
        "       AND dd.requiring_entity_code = pc.entity_code " +
        "WHERE dd.language = ? " +
        "   AND pc.status > 0 AND pc.status IS NOT NULL " +
        "   AND pc.parent_id IS NOT NULL " +
        "   AND pc.footer = 1 " +
        "ORDER BY pc.sort_order ASC, dd.title ASC ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [languageCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucInFooter = function( callback) {
    var sql = "SELECT pc.id as product_category_id, pc.name as product_category_name,pc.sort_order " +
        "FROM ProductCategory pc " +
        "WHERE pc.status > 0 AND pc.status IS NOT NULL " +
        "   AND (pc.parent_id IS NOT NULL " +
        "       OR pc.entity_code = 'GIF') " +
        "   AND pc.footer = 1;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamNotInGiftCategory = function( callback) {
    var sql = "SELECT p.id as product_id, p.code as product_code, p.name as product_name, " +
        "           p.sort_order as product_order, p.parent_id as product_parent_id " +
        "FROM Product p LEFT JOIN ProductCategory pc " +
        "   ON p.product_category_id = pc.id " +
        "WHERE p.status IS NOT NULL " +
        "   AND p.status > 0 " +
        "   AND pc.entity_code = 'CAT';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamInGiftCategory = function( callback) {
    var sql = "SELECT p.id as product_id, p.code as product_code, p.name as product_name, p.sort_order as product_order, " +
        "           p.parent_id as product_parent_id " +
        "from Product p LEFT JOIN ProductCategory pc " +
        "   ON p.product_category_id = pc.id " +
        "WHERE p.status IS NOT NULL " +
        "   AND p.status > 0 " +
        "   AND pc.entity_code = 'GIF';";
        // get a connection from the pool
        pool.getConnection(function(err, connection) {
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            // make the query
            var now = api.getNow();
            connection.query(sql, [], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        });
};

exports.getUnselectBestSeller = function( callback) {
    var sql = "SELECT pr.* " +
        "FROM Product pr " +
        "WHERE pr.status IS NOT NULL AND pr.status > 0 " +
        "   AND pr.parent_id IS NOT NULL " +
        "   AND pr.id NOT IN (SELECT b.product_id " +
        "                   FROM BestSellProduct b " +
        "                   WHERE b.status IS NOT NULL AND b.status > 0)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getUser_UserRoleExludeId = function( id,callback) {
    var sql = "SELECT * " +
        "FROM user " +
        "WHERE id NOT IN (SELECT us.user_id FROM role r INNER JOIN userrole us ON r.id=us.role_id " +
        "WHERE r.id = ?) and is_confirm=1 and type=1 and is_locked=0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getUser_UserRoleLikeId = function( id,callback) {
    var sql = "SELECT * " +
        "FROM user " +
        "WHERE id IN (SELECT us.user_id FROM role r LEFT JOIN userrole us ON r.id=us.role_id " +
        "WHERE r.id = ?) and is_confirm=1 and type=1 and is_locked=0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPham = function( callback) {
    var sql = "select * from Product where status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getSanPhamCombo = function( callback) {
    var sql = "select * from Product where status<>0 AND status IS NOT NULL and parent_id IS NOT NULL";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamDV = function( callback) {
    var sql = " select pr.id as product_id, pr.name as product_name, pr.color as product_color, " +
        "   pr.unit as product_unit, pr.price as product_price, pc.name as productcategory_name, wh.quantity as warehouse_quantity " +
        "   from `Product` pr  " +
        " LEFT JOIN `productcategory` pc  " +
        " ON pr.product_category_id = pc.id  " +
        " LEFT JOIN `warehouse` wh  " +
        " ON pr.id = wh.product_id  " +
        " where pr.status<>0 AND pr.status IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getTaiSan = function( callback) {
    var sql = " select pr.id as product_id, pr.name as product_name, pr.color as product_color, " +
        "   pr.unit as product_unit, pr.price as product_price, pc.name as productcategory_name, wh.quantity as warehouse_quantity " +
        "   from `Product` pr  " +
        " LEFT JOIN `productcategory` pc  " +
        " ON pr.product_category_id = pc.id  " +
        " LEFT JOIN `warehouse` wh  " +
        " ON pr.id = wh.product_id  " +
        " where pr.status<>0 AND pr.status IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBestSellProductOption = function( callback) {
    var sql = "select * from Config where name='spbc'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getConfig = function(name, callback) {
    var sql = "select * from Config where name=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [name], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getTinTucSliderSpeed = function( callback) {
    var sql = "select * from Config where name='tintuc-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getMonAnNgonSliderSpeed = function( callback) {
    var sql = "select * from Config where name='monanngon-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getHomeSliderSpeed = function( callback) {
    var sql = "select * from Config where name='home-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBestSellProduct = function( callback) {
    var sql = "SELECT b.*,p.name, p.code " +
        "FROM BestSellProduct b " +
        "   LEFT JOIN Product p " +
        "   ON p.id = b.product_id " +
        "WHERE b.status IS NOT NULL " +
        "   AND b.status > 0 " +
        "ORDER BY b.order;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.orderDetailAlias = function() {
    return "ordd1";
};

exports.orderDetailSelect = function() {
    return " " + this.orderDetailAlias()+".order_detail_price, "+this.orderDetailAlias()+".order_detail_quantity, "
        +this.orderDetailAlias()+".order_detail_price_promotion, "+this.orderDetailAlias()+".order_detail_total_amount, "
        +this.orderDetailAlias()+".order_detail_percent_promotion, "
        +this.orderDetailAlias()+".order_price_coupon, "+this.orderDetailAlias()+".order_code_coupon, "
        +this.orderDetailAlias()+".order_detail_is_promotion, "+this.orderDetailAlias()+".order_detail_id, "
        +this.orderDetailAlias()+".order_coupon_promotion_name, "+this.orderDetailAlias()+".order_coupon_promotion_id, "
        +this.orderDetailAlias()+".order_email, "+this.orderDetailAlias()+".order_fullname, "
        +this.orderDetailAlias()+".order_code, "+this.orderDetailAlias()+".order_address_delivery, "
        +this.orderDetailAlias()+".order_detail_category_name, "+this.orderDetailAlias()+".order_detail_color_name, "
        +this.orderDetailAlias()+".order_phone ";
};

exports.orderDetailFrom = function() {
    var data =  " (SELECT pod.purchase_order_id, pod.percent_promotion as order_detail_percent_promotion, pod.product_id, pod.price as order_detail_price, pod.quantity as order_detail_quantity, " +
        "               pod.price_promotion as order_detail_price_promotion, pod.total_amount as order_detail_total_amount, pod.category_name as order_detail_category_name, pod.color_name as order_detail_color_name, " +
        "               pod.is_promotion as order_detail_is_promotion, pod.id as order_detail_id, pod.promotion_name as order_detail_promotion_name, " +
        "               po.price_coupon as order_price_coupon, po.code_coupon as order_code_coupon, po.email as order_email, po.fullname as order_fullname, " +
        "               CONCAT(po.address_delivery, \", \", d3.title, \", \", d1.title) as order_address_delivery, po.code as order_code, po.phone as order_phone, " +
        "               po.coupon_promotion_name as order_coupon_promotion_name, po.coupon_promotion_id as order_coupon_promotion_id " +
        "           FROM PurchaseOrderDetail pod " +
        "               LEFT JOIN PurchaseOrder po " +
        "                   ON pod.purchase_order_id = po.id " +
        "               LEFT JOIN LookupData d1 " +
        "                   ON po.city_delivery_id = d1.id " +
        "               LEFT JOIN LookupData d3 " +
        "                   ON po.district_delivery_id = d3.id " +
        "           WHERE pod.status IS NOT NULL AND pod.status > 0 " +
        "               AND po.status IS NOT NULL AND po.status > 0  ) " + this.orderDetailAlias();
    return data;
};


exports.getPurchaseOrderDetails = function(order_id, callback) {
    var sql = "SELECT "+this.orderDetailSelect()+", "+this.productSelectOrder()+", "+this.promotionSelect()+" " +
        "FROM "+this.orderDetailFrom()+" " +
        "   INNER JOIN "+this.productFromOrder()+" " +
        "       ON "+this.orderDetailAlias()+".product_id = "+this.productAliasOrder()+".product_id " +
        "   LEFT JOIN "+this.promotionFrom()+" " +
        "       ON "+this.productAliasOrder()+".product_id = "+this.promotionAlias()+".product_id " +
        "WHERE "+this.orderDetailAlias()+".purchase_order_id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now, now, order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getStaticsSortPerson = function(status, start_date, end_date, callback) {
    var sql = "SELECT po.fullname,po.email,po.total_amount, COUNT(pd.id) as total_quantity  " +
        "FROM purchaseorder po  " +
        "LEFT JOIN purchaseorderdetail pd ON pd.purchase_order_id=po.id  " +
        "WHERE po.status = ? AND (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) " +
        "AND po.total_amount IS NOT NULL GROUP BY po.id";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getStaticsSortOrder = function(status, start_date, end_date, callback) {
    var sql = "SELECT po.fullname,po.email,po.total_amount,po.address_delivery,po.code," +
        "po.total_quantity FROM purchaseorder po  " +
        "WHERE po.status = ? AND (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?))" +
        "HAVING total_amount IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        console.log(sql);
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};






exports.getStaticsSortProduct = function(status, start_date, end_date, callback) {
    var sql = "SELECT pr.id as product_id, pr.code as product_code, pr.name as product_name, pr.price as product_price, " +
        "               SUM(pd.quantity) as total_product_quantity, " +
        "               SUM(po.total_amount) as total_after_promotion " +
        "FROM purchaseorder po " +
        "   INNER JOIN purchaseorderdetail pd " +
        "   ON po.id=pd.purchase_order_id " +
        "   LEFT JOIN product pr " +
        "   ON pr.id=pd.product_id " +
        "WHERE po.status = ? " +
        "   AND (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) "+
        "GROUP BY pd.product_id ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getStaticsSortPersonNoStatus = function(start_date, end_date, callback) {
    var sql = "SELECT po.fullname,po.email,po.total_amount," +
        "po.total_quantity FROM purchaseorder po  " +
        "WHERE (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) " +
        "HAVING total_amount IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getStaticsSortProductNoStatus = function( start_date, end_date, callback) {
    var sql = "SELECT pr.id as product_id, pr.code as product_code, pr.name as product_name, pr.price as product_price, " +
        "               SUM(pd.quantity) as total_product_quantity, " +
        "               SUM(po.total_amount) as total_after_promotion " +
        "       FROM purchaseorder po " +
        "       INNER JOIN purchaseorderdetail pd " +
        "       ON po.id=pd.purchase_order_id " +
        "       LEFT JOIN product pr " +
        "       ON pr.id=pd.product_id " +
        "       WHERE (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) "+
        "       GROUP BY pd.product_id ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};




exports.warehouseAlias = function() {
    return "wh1";
};

exports.warehouseSelect = function() {
    return " " + this.warehouseAlias()+".end_store ";
};


exports.dataEndDateToPresent = function() {
    var data =  " (SELECT pr.id as product_id, SUM(whh.quantity) as end_store " +
        "       FROM product pr "  +
        "       LEFT JOIN warehousehistory whh " +
        "       ON whh.product_id=pr.id " +
        "       WHERE (DATE(whh.created_date) BETWEEN DATE_ADD(?, INTERVAL 1 DAY) AND DATE(?)) AND whh.type=1 "+
        "       GROUP BY pr.id) " + this.warehouseAlias();
    return data;
};

exports.warehouseAliasfirst = function() {
    return "wh2";
};

exports.warehouseSelectfirst = function() {
    return " " + this.warehouseAliasfirst()+".first_store ";
};


exports.datafirstDateToPresent = function() {
    var data =  " (SELECT pr.id as product_id, SUM(whh.quantity) as first_store " +
        "       FROM product pr "  +
        "       LEFT JOIN warehousehistory whh " +
        "       ON whh.product_id=pr.id " +
        "       WHERE (DATE(whh.created_date) BETWEEN DATE(?) AND DATE(?)) AND whh.type=1 "+
        "       GROUP BY pr.id) " + this.warehouseAliasfirst();
    return data;
};

//type=3
exports.warehouseAliasfirstsell = function() {
    return "wh3";
};

exports.warehouseSelectfirstsell = function() {
    return " " + this.warehouseAliasfirstsell()+".first_sell ";
};


exports.datafirstsell = function() {
    var data =  " (SELECT pr.id as product_id, SUM(whh.quantity) as first_sell " +
        "       FROM product pr "  +
        "       LEFT JOIN warehousehistory whh " +
        "       ON whh.product_id=pr.id " +
        "       WHERE (DATE(whh.created_date) BETWEEN DATE(?) AND DATE(?)) AND whh.type=3 "+
        "       GROUP BY pr.id) " + this.warehouseAliasfirstsell();
    return data;
};

exports.warehouseAliasendsell = function() {
    return "wh4";
};

exports.warehouseSelectendsell = function() {
    return " " + this.warehouseAliasendsell()+".end_sell ";
};


exports.dataendsell = function() {
    var data =  " (SELECT pr.id as product_id, SUM(whh.quantity) as end_sell " +
        "       FROM product pr "  +
        "       LEFT JOIN warehousehistory whh " +
        "       ON whh.product_id=pr.id " +
        "       WHERE (DATE(whh.created_date) BETWEEN DATE_ADD(?, INTERVAL 1 DAY) AND DATE(?)) AND whh.type=3 "+
        "       GROUP BY pr.id) " + this.warehouseAliasendsell();
    return data;
};






exports.cateAlias = function() {
    return "pc2";
};

exports.cateSelect = function() {
    return " " + this.cateAlias()+".product_cate1_name, "+this.cateAlias()+".id ";
};


exports.datacate = function() {
    var data =  " (SELECT pc.name as product_cate1_name, pc.id as id "+
    "FROM productcategory pc) " + this.cateAlias();
    return data;
};


exports.getDataStatisticalDetail = function( start_date, end_date, callback) {
    var sql = "SELECT pr.id as product_id, pr.code as product_code, pr.name as product_name, pr.price as product_price," +
        "                w.quantity as store, pc.name as cate2_name, pc.parent_id, " +
        "                pr.quantity as combo_quantity, " + this.warehouseSelect()+", "+ this.warehouseSelectfirst()+ "," + this.warehouseSelectfirstsell()+ ","+ this.warehouseSelectendsell()+ ","+this.cateSelect()+" "+
        "       FROM product pr " +
        "       LEFT JOIN warehouse w"  +
        "       ON w.product_id=pr.id"+
        "       LEFT JOIN productcategory pc"  +
        "       ON pc.id=pr.product_category_id"+
        "       LEFT JOIN " + this.dataEndDateToPresent() + " " +
        "       ON pr.id=" + this.warehouseAlias() + ".product_id" +
        "       LEFT JOIN " + this.datafirstDateToPresent() + " " +
        "       ON pr.id=" + this.warehouseAliasfirst() + ".product_id" +
        "       LEFT JOIN " + this.datafirstsell() + " " +
        "       ON pr.id=" + this.warehouseAliasfirstsell() + ".product_id" +
        "       LEFT JOIN " + this.dataendsell() + " " +
        "       ON pr.id=" + this.warehouseAliasendsell() + ".product_id" +
        "       LEFT JOIN " + this.datacate() + " " +
        "       ON pc.parent_id=" + this.cateAlias() + ".id" +
        "       WHERE pr.status>0 AND pr.status!=0"
        "       GROUP BY pr.id " ;
    // get a connection from the pool
    console.log(sql);
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [end_date,now, start_date, end_date,start_date, end_date,end_date,now, start_date, end_date], function(err, results) {
            connection.release();
            console.log(sql);
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getDataThongKe = function( start_date, end_date, callback) {
    var sql = "SELECT pr.id as product_id, pr.code as product_code, pr.name as product_name, pr.price as product_price, " +
        "               po.created_date as product_date, SUM(pd.quantity) as total_product_quantity, " +
        "               SUM(po.total_amount) as total_after_promotion, po.id as order_id " +
        "       FROM purchaseorder po " +
        "       INNER JOIN purchaseorderdetail pd " +
        "       ON po.id=pd.purchase_order_id " +
        "       LEFT JOIN product pr " +
        "       ON pr.id=pd.product_id " +
        "       WHERE (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) "+
        "       GROUP BY po.created_date ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getDataNganhHangCap2 = function( start_date, end_date, callback) {
    var sql = "SELECT pr.id as product_id, pr.code as product_code, pr.name as product_name,  " +
        "               po.created_date as product_date, SUM(pd.quantity) as total_product_quantity, " +
        "               SUM(po.total_amount) as total_after_promotion, po.id as order_id, pc.name as cate_name, " +
        "               pc.parent_id as cate1_id, pc.id as cate2_id" +
        "       FROM purchaseorder po " +
        "       INNER JOIN purchaseorderdetail pd " +
        "       ON po.id=pd.purchase_order_id " +
        "       LEFT JOIN product pr " +
        "       ON pr.id=pd.product_id " +
        "       RIGHT JOIN productcategory pc"+
        "       ON pc.id=pr.product_category_id"+
        "       WHERE (DATE(po.created_date) BETWEEN DATE(?) AND DATE(?)) "+
        "       GROUP BY pr.id ";
    // get a connection from the pool
    console.log(sql);
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ start_date, end_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};





exports.getPriceTransport = function( callback) {
    var sql = "SELECT * FROM Config WHERE name='phi-van-chuyen';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getProductGiftByPurchaseOrderDetailId = function(purchase_order_detail_id, callback) {
    var sql = "SELECT pr.code as product_code, pr.name as product_name, "+this.orderDetailSelect()+" " +
        "FROM PurchaseOrderDetailGift g " +
        "   LEFT JOIN Product pr " +
        "       ON g.product_gift_id=pr.id " +
        "   LEFT JOIN "+this.orderDetailFrom()+" " +
        "       ON g.purchase_order_detail_id = "+this.orderDetailAlias()+".order_detail_id " +
        "WHERE g.purchase_order_detail_id=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [purchase_order_detail_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPurchaseOrderFromStep1 = function(order_id,  callback) {
    var sql = "SELECT o.code_coupon,pr.id as product_id, dd1.title as product_title, dd1.description as product_description, od.purchase_order_id as order_id, " +
        "           od.id as order_detail_id, pr.name as product_name, pr.price as product_price, " +
        "           pr.image as product_image, od.quantity as order_quantity, " + this.promotionSelect() + " " +
        "FROM PurchaseOrderDetail od " +
        "   LEFT JOIN PurchaseOrder o " +
        "   ON od.purchase_order_id = o.id " +
        "   LEFT JOIN Product pr " +
        "   ON od.product_id = pr.id " +
        "   LEFT JOIN "+this.promotionFrom()+" " +
        "   ON pr.id = "+this.promotionAlias()+".product_id " +
        "   LEFT JOIN DataDirectory dd1 " +
        "   ON pr.id = dd1.requiring_id " +
        "       AND pr.entity_code = dd1.requiring_entity_code " +
        "WHERE dd1.language = ? " +
        "   AND pr.parent_id IS NOT NULL " +
        "   AND od.purchase_order_id = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, now, now, langCode, order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPurchaseOrder = function( callback) {
    var sql = "SELECT o.*, o.id as order_id, o.code as order_code, o.fullname, o.email, o.phone, d1.title as city_name, d3.title as district_name, " +
        "           o.status as order_status, o.payment_method as order_payment_method " +
        "FROM PurchaseOrder o " +
        "   LEFT JOIN LookupData d1 " +
        "       ON o.city_delivery_id = d1.id " +
        "   LEFT JOIN LookupData d3 " +
        "       ON o.district_delivery_id = d3.id" +
        "   ORDER BY o.created_date DESC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPurchaseOrder = function( callback) {
    var sql = "SELECT o.*, o.id as order_id, o.code as order_code, o.fullname, o.email, o.phone, d1.title as city_name, d3.title as district_name, " +
        "           o.status as order_status, o.payment_method as order_payment_method " +
        "FROM PurchaseOrder o " +
        "   LEFT JOIN LookupData d1 " +
        "       ON o.city_delivery_id = d1.id " +
        "   LEFT JOIN LookupData d3 " +
        "       ON o.district_delivery_id = d3.id;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getOnlyPurchaseOrderById = function( id,callback) {
    var sql = "SELECT o.* FROM PurchaseOrder o WHERE o.id=? ;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getWarehouseAndProduct = function( callback) {
    var sql = "SELECT p.code, p.name, p.id AS product_id,w.quantity,w.id as row_id " +
        "FROM Product p LEFT JOIN Warehouse w " +
        "   ON p.id = w.product_id " +
        "WHERE p.status > 0 " +
        "   AND p.parent_id IS NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getWarehouseAndProductByProductCode = function(code, callback) {
    var sql = "SELECT pr.name,pr.id AS product_id,w.quantity,w.id as warehouse_id " +
        "FROM Product pr LEFT JOIN Warehouse w " +
        "   ON pr.id = w.product_id " +
        "WHERE pr.code=? " +
        "   AND pr.status IS NOT NULL AND pr.status > 0 " +
        "   AND pr.parent_id IS NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getWarehouseAndProductByProductId = function(id, callback) {
    var sql = "SELECT pr.name,pr.id AS product_id,w.quantity,w.id as warehouse_id " +
        "FROM Product pr LEFT JOIN Warehouse w " +
        "   ON pr.id = w.product_id " +
        "WHERE pr.id=? " +
        "   AND pr.status IS NOT NULL AND pr.status > 0 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllPromotionWithoutCoupon = function( callback) {
    var sql = "select * " +
        "from Promotion p " +
        "where p.status<>0" +
        "   AND p.entity_code <> 'COU' ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllCouponUseMultiTime = function( callback) {
    var sql = "select p.number_of_uses,p.id,p.status,p.name as promotion_name,p.start_date as start_date,p.end_date as end_date,p.coupon as coupon from Promotion p where p.status IS NOT NULL AND p.status>0 AND p.entity_code = 'COU' AND p.coupon IS NOT NULL";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllCouponUseOneTime = function( callback) {
    var sql = "SELECT pd.id,pd.promotion_id,pd.status,po.name as promotion_name,po.start_date as start_date,po.end_date as end_date,pd.coupon as coupon FROM Promotion po LEFT join PromotionDetail pd ON po.id = pd.promotion_id WHERE (po.entity_code = 'COU' || pd.entity_code = 'COU') AND po.status IS NOT NULL AND po.status > 0 AND pd.status IS NOT NULL AND pd.status > 0 HAVING coupon IS NOT NULL";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPromotionCanUseOneTime = function( callback) {
    var sql = "SELECT po.* FROM Promotion po " +
        "WHERE po.entity_code = 'COU' AND " +
        "po.status IS NOT NULL AND po.status = 1 " +
        "AND po.coupon IS NULL AND po.number_of_uses = 0 " +
        "AND po.start_date < ? " +
        "AND po.end_date > ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now,now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllPromotion = function( callback) {
    var sql = "select * from Promotion where status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllCoupon = function( callback) {
    var sql = "select * from Promotion where entity_code = 'COU' AND status IS NOT NULL AND status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUnselectedProductPromotionCoupon = function(promotion_id, callback) {
    var sql = "SELECT p.id as product_id, " +
        "           p.name as product_name, p.code as product_code " +
        "FROM Product p WHERE p.id NOT IN " +
        "                       (SELECT pd.product_id " +
        "                       FROM PromotionDetail pd " +
        "                           LEFT JOIN Promotion p ON p.id=pd.promotion_id " +
        "                       WHERE pd.status IS NOT NULL AND pd.status=1 " +
        "                           AND pd.entity_code = 'PCP' " +
        "                           AND p.status IS NOT NULL AND p.status > 0 " +
        "                           AND p.coupon_type = 2 " +
        "                           AND p.start_date < ? AND p.end_date > ?" +
        "                           AND p.id = ?) " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.parent_id IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now,now,promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUnselectedProductPromotionCouponWithOutPromotionId = function( callback) {
    var sql = "SELECT p.id as product_id, " +
        "           p.name as product_name, p.code as product_code " +
        "FROM Product p WHERE p.id NOT IN " +
        "                       (SELECT pd.product_id " +
        "                       FROM PromotionDetail pd " +
        "                           LEFT JOIN Promotion p ON p.id=pd.promotion_id " +
        "                       WHERE pd.status IS NOT NULL AND pd.status=1 " +
        "                           AND pd.entity_code = 'PCP' " +
        "                           AND p.status IS NOT NULL AND p.status > 0 " +
        "                           AND p.coupon_type = 2 " +
        "                           AND p.start_date < ? AND p.end_date > ?" +
        "                           ) " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.parent_id IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now,now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUnselectedPromotion = function(id, callback) {
    var sql = "SELECT p.id as product_id, " +
        "           p.name as product_name, p.code as product_code " +
        "FROM Product p WHERE p.id NOT IN " +
        "                       (SELECT pd.product_id " +
        "                       FROM PromotionDetail pd " +
        "                           LEFT JOIN Promotion p ON p.id=pd.promotion_id " +
        "                       WHERE pd.status IS NOT NULL AND pd.status=1 " +
        "                           AND (pd.entity_code = 'PGT' OR pd.entity_code = 'PSO') " +
        "                           AND p.status IS NOT NULL AND p.status > 0 " +
        "                           AND p.start_date < ? AND p.end_date > ?) " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.parent_id IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now,now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPromotionById = function(id, callback) {
    var sql = "select * from Promotion where id=? and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPersonById = function(id, callback) {
    var sql = "select * from Person where id=? and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getLookupData = function(parent_id, entity_code, callback) {
    var sql = "select * from LookupData where parent_id=? and entity_code=? and status<>0";
    if(parent_id){
        sql = "select * from LookupData where parent_id=? and entity_code=? and status<>0";
    }else {
        sql = "select * from LookupData where parent_id IS NULL and entity_code=? and status<>0";
    }

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        if(parent_id){
            connection.query(sql, [parent_id, entity_code], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }else {
            connection.query(sql, [ entity_code], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }

    });
};


exports.getLookupDataById = function(id, callback) {
    var sql = "select * from LookupData where id=? and status<>0";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });

    });
};


exports.getLookupDataByEntityCode = function(entity_code, callback) {
    var sql = "select * from LookupData where entity_code=? and status IS NOT NULL AND status > 0";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });

    });
};

exports.getUnRoleByUserId = function(user_id, callback) {

    var sql = "SELECT pm.* FROM permission pm WHERE " +
        "pm.id NOT IN (SELECT pm.id FROM permission pm INNER JOIN" +
        " rolepermission rm ON pm.id=rm.permission_id WHERE " +
        " rm.role_id IN (SELECT r.id FROM role r " +
        " INNER JOIN userrole ur ON r.id=ur.role_id " +
        " WHERE ur.user_id=?)) ORDER BY pm.master_group,pm.child_group;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUserAdmin = function( callback) {
    var sql = "select * from user where is_confirm=1 AND type=1 AND is_locked=0 ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });

    });
};


exports.getAllPermission = function(callback) {
    var sql = "SELECT * " +
        "FROM permission ORDER BY master_group,child_group ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getUserAdmin = function( callback) {
    var sql = "select * from user where is_confirm=1 AND type=1 AND is_locked=0 ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });

    });
};



exports.getPersonAddressByPersonId = function(id, callback) {
    var sql = "select * from PersonAddress where person_id=? and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPersonAddressById = function(id, callback) {
    var sql = "select * from PersonAddress where id=? and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.checkExistPersonAddress = function(type_name, email, city_id, district_id, address, phone, callback) {
    var sql = "select * from PersonAddress where type_name=? and email=? and city_id=? and district_id=? and address=? and phone=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [type_name, email, city_id, district_id, address, phone], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getPersonAddressDefault = function(person_id, callback) {
    var sql = "select * from PersonAddress where person_id=? and is_default=1 and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [person_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getBannerLienHe = function( callback) {
    var sql = "SELECT c.image, c.id as content_id, c.link as content_link " +
        "FROM Content c " +
        "WHERE c.id='a551e55a-3e3c-11e8-b467-0ed5f89f718b' " +
        "   AND c.status > 0 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerSanPham = function( callback) {
    var sql = "SELECT c.image, c.id as content_id, c.link as content_link " +
        "FROM Content c " +
        "WHERE c.entity_code='EBP' ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerKhuyenMai = function( callback) {
    var sql = "SELECT c.image, c.id as content_id, c.link as content_link " +
        "FROM Content c " +
        "WHERE c.entity_code='EPO' " +
        "   AND c.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getLienHe = function( callback) {
    var sql = "select * from Content where entity_code='ELH'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerTinTucBackend = function( callback) {
    var sql = "select * from Content where entity_code='ETK'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerMonNgonBackend = function( callback) {
    var sql = "select * from Content where entity_code='EBC'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerTinTuc = function( callback) {
    var sql = "select * from Content where entity_code='ETK' and status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerChiTietBaiViet = function(content_id, callback) {
    var sql = "SELECT c.link as content_link, c.image_banner_alternative as content_image_banner " +
        "FROM Content c " +
        "WHERE c.id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [content_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerTinTucTrongChiTiet = function( callback) {
    var sql = "SELECT c.link as content_link, c.image as content_image_banner " +
        "FROM Content c " +
        "WHERE c.entity_code='ETK' " +
        "   AND c.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerMonNgonTrongChiTiet = function( callback) {
    var sql = "SELECT c.link as content_link, c.image as content_image_banner " +
        "FROM Content c " +
        "WHERE c.entity_code='EBC' " +
        "   AND c.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerMonNgon = function( callback) {
    var sql = "SELECT c.* " +
        "FROM Content c " +
        "WHERE c.entity_code='EBC' " +
        "   AND c.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getMucDuLieu = function(entity_code, language, requiring_id, callback) {
    var sql = "SELECT * " +
        "from DataDirectory " +
        "WHERE entity_code=? and language=? and requiring_id=? ";
    if(entity_code == null){
        sql = "SELECT * " +
            "from DataDirectory " +
            "WHERE entity_code IS NULL and language=? and requiring_id=? ";
    }
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        if(entity_code == null){
            connection.query(sql, [ language, requiring_id], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }else {
            connection.query(sql, [entity_code, language, requiring_id], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }

    });
};

exports.getMucDuLieuByRequiringId = function( requiring_id, callback) {
    var sql = "select * from DataDirectory WHERE requiring_id=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [requiring_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPham_ID_CODE_NAME = function(product_id,  callback) {
    var sql = "select id,code,name,type,brand " +
        "from Product " +
        "where status<>0 " +
        "   AND status IS NOT NULL " +
        "   AND id <> ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamDonVi_ID_CODE_NAME = function(product_id,  callback) {
    var sql = "select id,code,name,type,brand " +
        "from Product " +
        "where status<>0 " +
        "   AND status IS NOT NULL AND status > 0 AND parent_id IS NULL " +
        "   AND id = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamDonVi = function(product_id,  callback) {
    var sql = "select id,code,name,type " +
        "from Product " +
        "where status<>0 " +
        "   AND status IS NOT NULL " +
        "   AND parent_id IS NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.loadCouponDiscountFromOrder = function(order_id, callback) {


    var sql = "SELECT o.price_coupon " +
        "FROM PurchaseOrder o " +
        "WHERE o.id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ order_id ], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.findCouponManyTime = function(coupon, callback) {


    var sql = "SELECT p.id as promotion_id, p.coupon_type, p.name as promotion_name, p.type as promotion_type, p.fix_price," +
        "               p.percent, p.minimum_price, p.maximum_price " +
        "FROM Promotion p " +
        "   LEFT JOIN PromotionDetail pd " +
        "   ON p.id = pd.promotion_id " +
        "WHERE p.start_date < ? AND p.end_date > ? " +
        "   AND p.coupon = ? " +
        "   AND p.entity_code = 'COU' " +
        "   AND p.status = 1 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ now, now, coupon, coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.findCouponOneTime = function(coupon, callback) {


    var sql = "SELECT p.id as promotion_id, p.coupon_type, p.name as promotion_name, p.type as promotion_type, p.fix_price," +
        "               p.percent, p.minimum_price, p.maximum_price " +
        "FROM PromotionDetail pd " +
        "   LEFT JOIN Promotion p " +
        "   ON p.id = pd.promotion_id " +
        "WHERE p.start_date < ? AND p.end_date > ? " +
        "   AND pd.coupon = ? " +
        "   AND pd.entity_code = 'COU' " +
        "   AND pd.status = 1 " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.status <> 2 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ now, now, coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.findCoupon = function(coupon, callback) {


    var sql = "SELECT p.id as promotion_id, p.coupon_type, p.name as promotion_name, p.type as promotion_type, p.fix_price," +
    "               p.percent, p.minimum_price, p.maximum_price " +
    "FROM Promotion p " +
    "   LEFT JOIN PromotionDetail pd " +
    "   ON p.id = pd.promotion_id " +
    "WHERE (p.start_date < ? AND p.end_date > ?) " +
    "   AND ((p.coupon = ? AND p.entity_code = 'COU' AND p.status = 1) " +
    "       OR (pd.coupon = ? AND pd.entity_code = 'COU' AND pd.status = 1))";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ now, now, coupon, coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getWarehouseByOrderId = function(orderID, callback) {
    var sql = "SELECT pr.id as product_id, pr.parent_id as root_product_id, pr.unit as product_unit, pr.quantity as product_quantity_unit, " +
        "           wh.quantity as warehouse_product_quantity, wh.id as warehouse_id, wh1.quantity as root_warehouse_product_quantity, " +
        "           wh1.id as root_warehouse_id, pod.quantity as order_detail_quantity " +
        "FROM PurchaseOrderDetail pod " +
        "   LEFT JOIN Product pr " +
        "       ON pod.product_id = pr.id " +
        "   LEFT JOIN PurchaseOrder po " +
        "       ON pod.purchase_order_id = po.id " +
        "   LEFT JOIN Warehouse wh " +
        "       ON pr.id = wh.product_id " +
        "           AND wh.status IS NOT NULL AND wh.status > 0 " +
        "   LEFT JOIN Warehouse wh1 " +
        "       ON pr.parent_id = wh1.product_id " +
        "           AND wh1.status IS NOT NULL AND wh1.status > 0 " +
        "WHERE po.id = ? " +
        "   AND po.status IS NOT NULL AND po.status > 0 " +
        "   AND pod.status IS NOT NULL AND pod.status > 0 ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [orderID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getWarehouseByProductId = function(productID, callback) {
    var sql = "SELECT wh.quantity as product_quantity, wh.id as warehouse_id " +
        "   FROM Warehouse  wh " +
        "   WHERE wh.product_id = ? AND wh.status IS NOT NULL AND wh.status > 0;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        console.log(sql);
        connection.query(sql, [productID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getWarehouseNumberByProductId = function(productID, callback) {
    var sql = "SELECT wh.quantity " +
        "FROM Warehouse wh " +
        "WHERE wh.product_id = ?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [productID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getProductInfoForCart = function(langCode, productIDs, callback) {
    var sql = "SELECT " + this.promotionAlias() + ".promotion_detail_entity_code as entity_code, " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "        FROM "+this.productFrom()+" " +
        "           LEFT JOIN "+this.promotionFrom()+" \n" +
        "               ON "+this.productAlias()+".product_id = "+this.promotionAlias()+".product_id \n" +
        "        WHERE "+this.productAlias()+".product_parent_id IS NOT NULL " +
        "           AND "+this.productAlias()+".product_id IN (?);";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, langCode, now, now, productIDs], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSpecialContent = function( product_id,entity_code,callback) {
    var sql = "SELECT Content.id,Content.title FROM " +
        "Content WHERE Content.id NOT IN " +
        "(SELECT ProductLinkContent.content_id from " +
        "ProductLinkContent WHERE ProductLinkContent.product_id" +
        " = ?)" +
        " AND status IS NOT NULL AND " +
        "status<>0 AND Content.entity_code = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id,entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllSpecialContent = function( entity_code,callback) {
    var sql = "SELECT Content.id,Content.title FROM " +
        "Content WHERE status IS NOT NULL AND " +
        "status<>0 AND Content.entity_code = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.xoaProductLinkContent = function(id, callback) {
    var sql = "DELETE FROM `ProductLinkContent` WHERE id=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });


};

exports.xoaPromotionDetail = function(id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `status`=0 WHERE `product_id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updatePromotionDetailStatus = function(status,id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `status`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionStatus = function(status,id, callback) {
    var sql = "UPDATE `Promotion` Set `status`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionNumber = function(number,id, callback) {
    var sql = "UPDATE `Promotion` Set `number_of_uses`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [number,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionDetailNumber = function(number,id, callback) {
    var sql = "UPDATE `Promotion` Set `number_of_uses`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [number,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.xoaProductImageList = function(id, callback) {
    var sql = "UPDATE `Slider` Set `status`=0 WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.xoaPromotionDetail = function(id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `status`=0 WHERE `product_id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.updateCouponStatus = function(option, id, callback) {
    var sql = "UPDATE `Promotion` Set `coupon_type`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [option, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateCouponMultiStatus = function(status, id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `status`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updateCouponForSignup = function( id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `already_used_sign_up`=1 WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.xoaGiftProduct = function(promotion_id,product_id, callback) {
    var sql = "UPDATE `PromotionDetail` Set `status`=0 WHERE `promotion_id`=? AND `product_id`=? AND `entity_code`='PKL'";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [promotion_id,product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateWarehouseByWarehouseID = function(quantity,updated_date,updated_by,warehouse_id, callback) {
    var sql = "UPDATE `Warehouse` " +
        "SET quantity=?, updated_date=?, updated_by=? " +
        "WHERE `id`=? ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [quantity,updated_date,updated_by,warehouse_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateWarehouse = function(quantity,updated_date,updated_by,product_id, callback) {
    var sql = "UPDATE `Warehouse` Set quantity=?,updated_date=?,updated_by=? WHERE `product_id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [quantity,updated_date,updated_by,product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePersonAddressDefault = function(person_id, callback) {
    var sql = "UPDATE `PersonAddress` Set is_default=0 WHERE `person_id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [person_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.removePersonAddress = function(id, updated_date, updated_by, callback) {
    var sql = "UPDATE `PersonAddress` Set updated_date=?, updated_by=?, status=0 WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [updated_date, updated_by, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePersonAddress = function(person_id, type_name, city_id, district_id, ward_id, street, email, phone, address, is_default, updated_date, updated_by	, status, id, callback) {
    var sql = "UPDATE `PersonAddress` Set person_id=?, type_name=?, city_id=?, district_id=?, ward_id=?, street=?, email=?, phone=?, address=?, is_default=?, updated_date=?, updated_by=?, status=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [person_id, type_name, city_id, district_id, ward_id, street, email, phone, address, is_default, updated_date, updated_by	, status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionCoupon = function(code, name, minimum_price, maximum_price, image, updated_by, updated_date, sort_order, promotion_id, callback) {
    var sql = "UPDATE `Promotion` Set `code`=?,`name`=?,`minimum_price`=?,`maximum_price`=?,`image`=?,`updated_by`=?,`updated_date`=?,`sort_order`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [code, name, minimum_price, maximum_price, image, updated_by, updated_date, sort_order, promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotion = function(code, name, start_date, end_date, minimum_price, maximum_price, image, updated_by, updated_date, sort_order, promotion_id, coupon, callback) {
    var sql = "UPDATE `Promotion` Set `code`=?,`name`=?,`start_date`=?,`end_date`=?,`minimum_price`=?,`maximum_price`=?,`image`=?,`updated_by`=?,`updated_date`=?,`sort_order`=?,`coupon`=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [code, name, start_date, end_date, minimum_price, maximum_price, image, updated_by, updated_date, sort_order, coupon, promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePerson = function(identification, name, avatar, birthday, points, phone, gender, email, updated_date, updated_by, entity_code, status, id, callback) {
    var sql = "UPDATE `Person` Set identification=?, name=?, avatar=?, birthday=?, points=?, phone=?, gender=?, email=?, updated_date=?, updated_by=?, entity_code=?, status=? WHERE `id`=?";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [identification, name, avatar, birthday, points, phone, gender, email, updated_date, updated_by, entity_code, status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSanPhamById = function(id, callback) {
    var sql = "select * from Product WHERE id=? AND status > 0 AND status IS NOT NULL";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getTenSanPhamById = function(id, callback) {
    var sql = "select name as product_name from Product where id=? and status<>0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhSachLienHe = function( callback) {
    var sql = "SELECT * " +
        "FROM Contact " +
        "WHERE status IS NOT NULL AND status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getPurchaseOrderHistory = function( email,callback) {
    var sql = "SELECT h.*,o.code,d1.title as city_name,d2.title as ward_name,d3.title as district_name,o.address_delivery FROM PurchaseOrderHistory h INNER JOIN PurchaseOrder o on o.id=h.purchase_order_id LEFT JOIN LookupData d1 ON d1.id=o.city_delivery_id LEFT JOIN LookupData d2 ON o.ward_delivery_id=d2.id LEFT JOIN LookupData d3 ON o.district_delivery_id=d3.id WHERE h.status IS NOT NULL AND h.status > 0 AND h.action_by=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [email], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllChiNhanhCuaHang = function(entity, callback) {
    var sql = "SELECT * " +
        "FROM LookupData " +
        "WHERE status IS NOT NULL " +
        "   AND status > 0 " +
        "   AND entity_code = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucSanPham = function( callback) {
    var sql = "select pc.*, pc2.name as parent_name " +
        "from ProductCategory pc LEFT JOIN ProductCategory pc2 " +
        "   ON pc.parent_id = pc2.id " +
        "where pc.status IS NOT NULL " +
        "   AND pc.status > 0 AND pc.entity_code='CAT';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getChiNhanhCuaHangById = function(id, callback) {
    var sql = "SELECT * " +
        "FROM LookupData " +
        "WHERE id=? and status > 0 AND status IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucSanPhamById = function(id, callback) {
    var sql = "SELECT * " +
        "FROM ProductCategory " +
        "WHERE id=? and status > 0 AND status IS NOT NULL AND entity_code='CAT';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllDanhMucSanPham = function(callback) {
    var sql = "SELECT id, name " +
        "FROM ProductCategory " +
        "WHERE status > 0 AND status IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getDanhMucRootOnly = function(currentDanhMucID,  callback) {
    var sql = "SELECT id, name " +
        "FROM ProductCategory " +
        "WHERE status > 0 AND status IS NOT NULL " +
        "   AND parent_id IS NULL AND entity_code='CAT' " +
        "   AND id <> ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [currentDanhMucID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getDanhMucSanPham_ID_NAME = function( callback) {
    var sql = "SELECT id, name " +
        "FROM ProductCategory " +
        "WHERE status > 0 AND status IS NOT NULL " +
        "   AND parent_id IS NOT NULL AND entity_code='CAT';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getOnlyDanhMucSanPham_ID_NAME = function( callback) {
    var sql = "SELECT id, name " +
        "FROM ProductCategory " +
        "WHERE status > 0 AND status IS NOT NULL " +
        "   AND (parent_id IS NOT NULL " +
        "       OR entity_code = 'GIF');";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSpecialProductLinkContent = function( id,callback) {
    var sql = "SELECT p.id,c.title,c.id as content_id FROM ProductLinkContent p " +
        " LEFT JOIN Content c ON p.content_id = c.id " +
        " WHERE p.product_id = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getProductImageList = function(product_id,callback) {
    var sql = "SELECT * FROM Slider s " +
        " WHERE s.status IS NOT NULL AND s.status > 0 " +
        "   AND s.requiring_entity_code = 'PRD' " +
        "   AND s.requiring_id=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSelectedNewPromotion = function( callback) {
    var sql = "SELECT prom.id as promotion_detail_id, prod.name as product_name, prod.code as product_code, prod.id as product_id " +
        "FROM PromotionDetail prom " +
        " LEFT JOIN Product prod ON prod.id = prom.product_id " +
        " WHERE (prom.entity_code = 'PGT' OR prom.entity_code = 'PSO') " +
        "   AND prom.status=1 " +
        "   AND prod.status IS NOT NULL AND prod.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSelectedProductionPromotionCoupon = function( id,callback) {
    var sql = "SELECT prom.id as promotion_detail_id, prod.name as product_name, prod.code as product_code, prod.id as product_id " +
        "FROM PromotionDetail prom" +
        " LEFT JOIN Product prod ON prod.id = prom.product_id " +
        " WHERE (prom.entity_code = 'PCP') " +
        "   AND prom.promotion_id = ? " +
        "   AND prom.status=1 " +
        "   AND prod.status IS NOT NULL AND prod.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getSelectedPromotion = function( id,callback) {
    var sql = "SELECT prom.id as promotion_detail_id, prod.name as product_name, prod.code as product_code, prod.id as product_id " +
    "FROM PromotionDetail prom" +
    " LEFT JOIN Product prod ON prod.id = prom.product_id " +
    " WHERE (prom.entity_code = 'PGT' OR prom.entity_code = 'PSO') " +
    "   AND prom.promotion_id = ? " +
    "   AND prom.status=1 " +
    "   AND prod.status IS NOT NULL AND prod.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getSanPhamKhuyenMai = function( callback) {
    var sql = "SELECT pr.id,pr.code,pr.name,pr.sort_order," +
        "po.name as promotion_name FROM " +
        "PromotionDetail pd LEFT JOIN Promotion po " +
        "ON po.id=pd.promotion_id LEFT JOIN Product pr " +
        "ON pd.product_id=pr.id WHERE " +
        "pd.status IS NOT NULL AND pd.status > 0 " +
        "AND po.status IS NOT NULL " +
        "AND po.status > 0 AND " +
        "po.start_date < ? AND po.end_date > ? " +
        "AND pr.status IS NOT NULL AND pr.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now,now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getGiftProduct = function(promotion_id, callback) {
    var sql = "SELECT d.*, p.name as product_name, " +
        "p.code as product_code " +
        "FROM PromotionDetail d LEFT JOIN Product p " +
        "   ON d.product_id=p.id " +
        "   LEFT JOIN ProductCategory pc " +
        "   ON pc.id=p.product_category_id " +
        "WHERE d.status IS NOT NULL " +
        "   AND d.entity_code='PKL' " +
        "   AND d.status=1 " +
        "   AND d.promotion_id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.findPromotionGiftByProductId = function(product_id,callback) {
    var sql = "SELECT * FROM PromotionDetail pd " +
        "RIGHT JOIN Promotion p ON p.id=pd.promotion_id " +
        "LEFT JOIN Product pr ON pd.product_id = pr.id " +
        "WHERE pd.product_id = ? AND " +
        "(pd.status IS NOT NULL AND p.status IS NOT NULL " +
        "AND pr.status IS NOT NULL AND pd.status > 0 " +
        "AND p.status > 0 AND pr.status > 0) " +
        "AND pd.entity_code = 'PKL'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.findPrductGiftByPromotionId = function(promotion_id,callback) {
    var sql = "SELECT pr.id as product_id, pr.name as product_name, pr.image as product_image, " +
        "           pr.parent_id as product_parent_id, pr.quantity as product_parent_quantity " +
        "FROM PromotionDetail pd RIGHT JOIN " +
        "Promotion p ON p.id=pd.promotion_id LEFT JOIN " +
        "Product pr ON pd.product_id = pr.id " +
        "WHERE pd.promotion_id = ? " +
        "AND (pd.status IS NOT NULL AND p.status IS NOT NULL AND " +
        "pr.status IS NOT NULL AND pd.status > 0 " +
        "AND p.status > 0 AND pr.status > 0) " +
        "AND pd.entity_code = 'PKL'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUnGiftProduct = function(callback) {
    var sql = "SELECT p.id as product_id, " +
        "p.name as product_name, " +
        "p.code as product_code " +
        "FROM Product p LEFT JOIN ProductCategory pc " +
        "   ON p.product_category_id=pc.id " +
        "WHERE p.id NOT IN ( SELECT d.product_id " +
        "                   FROM PromotionDetail d LEFT JOIN Product pr " +
        "                       ON pr.id = d.product_id " +
        "                       LEFT JOIN ProductCategory pc " +
        "                       ON pc.id=pr.product_category_id " +
        "                   WHERE d.status IS NOT NULL " +
        "                       AND (pc.entity_code = 'GIF' OR pc.entity_code = 'CAT') " +
        "                       AND d.entity_code='PKL' AND d.status=1 ) " +
        "AND (pc.entity_code = 'GIF' OR pc.entity_code='CAT') ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllGiftAndProduct = function(callback) {
    var sql = "SELECT p.id as product_id, \n" +
        "        p.name as product_name, \n" +
        "        p.code as product_code FROM \n" +
        "        Product p LEFT JOIN ProductCategory pc \n" +
        "        ON p.product_category_id=pc.id \n" +
        "        WHERE (pc.entity_code = 'GIF' OR pc.entity_code = 'CAT') " +
        "               AND pc.status IS NOT NULL AND pc.status > 0 " +
        "               AND p.status IS NOT NULL AND p.status > 0";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getCouponList = function(promotion_id,callback) {
    var sql = "SELECT * " +
        "FROM PromotionDetail " +
        "WHERE promotion_id=? " +
        "   AND status IS NOT NULL AND status <> 0 " +
        "   AND entity_code='COU' ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getCouponListForSignup = function(promotion_id,callback) {
    var sql = "SELECT * " +
        "FROM PromotionDetail " +
        "WHERE promotion_id=? " +
        "   AND status IS NOT NULL AND status = 1 " +
        "   AND entity_code='COU' AND already_used_sign_up = 0 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getMultiCoupon = function(coupon,callback) {
    var sql = "SELECT * FROM PromotionDetail " +
        "WHERE coupon=? " +
        "   AND status IS NOT NULL " +
        "   AND status > 0 AND entity_code='COU'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getSingleCoupon = function(coupon,callback) {
    var sql = "SELECT * FROM Promotion WHERE coupon=? AND status IS NOT NULL AND status <> 0 AND entity_code='COU'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getSanPhamLienKet = function(product_id,callback) {
    var sql = "SELECT * FROM PromotionDetail pd " +
        "LEFT JOIN Promotion p ON " +
        "p.id=pd.promotion_id LEFT JOIN " +
        "Product pr ON pr.id=pd.product_id LEFT JOIN ProductCategory pc ON pc.id=pr.product_category_id AND pc.entity_code = 'GIF' WHERE pd.status IS NOT NULL AND pd.status > 0 AND (pd.entity_code='PSO' OR pd.entity_code = 'PGT') AND pd.product_id=? AND p.status IS NOT NULL AND p.status > 0 AND p.status > 0 AND p.start_date = ? AND p.end_date = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id,now,now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.insertMonAnNgon = function(id, title, tags, description, contentHTML, entity_code,
                                   created_date, created_by, status, order, image, image_large,
                                   image_banner, content_category_id, content_link, callback) {
    var sql = "INSERT INTO Content (id, title, tags, description, contentHTML, entity_code, " +
        "                           created_date, created_by, status, sort_order, image, " +
        "                           image_large, image_banner_alternative, content_category_id, " +
        "                           link) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, title, tags, description, contentHTML, entity_code,
                                created_date, created_by, status, order, image,
                                image_large, image_banner, content_category_id, content_link], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPurchaseOrder = function(id, code, fullname, email, phone, delivery_different, address_delivery,
                                       city_delivery_id, ward_delivery_id, district_delivery_id, created_date,
                                       created_by, status, total_amount, total_quantity, note, percent_promotion,
                                       price_coupon, code_coupon, payment_method, callback) {
    var sql = "INSERT INTO PurchaseOrder (id, code, fullname, email, phone, delivery_different, address_delivery, " +
        "           city_delivery_id, ward_delivery_id, district_delivery_id, created_date, created_by, status, " +
        "           total_amount, total_quantity, note, percent_promotion, price_coupon, code_coupon, payment_method) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, code, fullname, email, phone, delivery_different, address_delivery, city_delivery_id, ward_delivery_id, district_delivery_id, created_date, created_by, status, total_amount, total_quantity, note, percent_promotion, price_coupon, code_coupon, payment_method], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPurchaseOrderDetail = function(id, purchase_order_id, product_id, quantity, price, total_amount,
                                            created_date, created_by, status, is_promotion, percent_promotion,
                                             price_promotion, code_promotion, promotion_name,category_name,color_name, callback) {
    var sql = "INSERT INTO PurchaseOrderDetail (id, purchase_order_id, product_id, quantity, price, total_amount," +
        "created_date, created_by, status, is_promotion, percent_promotion, price_promotion, code_promotion, promotion_name, category_name, color_name) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, purchase_order_id, product_id, quantity, price, total_amount,
                            created_date, created_by, status, is_promotion, percent_promotion, price_promotion,
                            code_promotion, promotion_name, category_name, color_name], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, id); }
        });
    });
};

exports.insertPurchaseOrderHistory = function(id, purchase_order_id, status, total_amount, total_quantity, remark, action_date, action_by, callback) {
    var sql = "INSERT INTO PurchaseOrderHistory (id, purchase_order_id, status, total_amount, total_quantity, remark, action_date, action_by) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, purchase_order_id, status, total_amount, total_quantity, remark, action_date, action_by], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertPurchaseOrderDetailGift = function(id, purchase_order_detail_id, product_gift_id, created_date, created_by, status, callback) {
    var sql = "INSERT INTO PurchaseOrderDetailGift (id, purchase_order_detail_id, product_gift_id, created_date, created_by, status) " +
        "VALUES (?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, purchase_order_detail_id, product_gift_id, created_date, created_by, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPersonAddress = function(id, person_id, type_name, city_id, district_id, ward_id, street, email, phone, address, is_default, created_by, created_date	, status, callback) {
    var sql = "INSERT INTO PersonAddress (id, person_id, type_name, city_id, district_id, ward_id, street, email, phone, address, is_default, created_by, created_date, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, person_id, type_name, city_id, district_id, ward_id, street, email, phone, address, is_default, created_by, created_date	, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};




exports.insertUser = function(id, user_name, password, is_confirm, type, login_fail, last_login, is_locked, created_date, created_by, entity_code, socket_id, callback) {
    var sql = "INSERT INTO User (id, user_name, password, is_confirm, type, login_fail, last_login, is_locked, created_date, created_by, entity_code, socket_id) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, user_name, password, is_confirm, type, login_fail, last_login, is_locked, created_date, created_by, entity_code, socket_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertRole = function(id, name, description, created_date, created_by, callback) {
    var sql = "INSERT INTO role (id, name, description, created_date, created_by) " +
        "VALUES (?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, name, description, created_date, created_by], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertRolePermission = function(role_id, id_list, list_permission, created_date, created_by, callback) {
    var sql = "INSERT INTO rolepermission (id, role_id, permission_id, created_by, created_date) " +
        "VALUES ";
    var text = '';
    for(var index=0;index<id_list.length;index++){
        var role_permission_id = id_list[index];
        var permission_id = list_permission[index];
        if(index == 0){
            text+="('"+role_permission_id+"','"+role_id+"','"+permission_id+"','"+created_by+"','"+created_date+"')";
        }else {
            text+=",('"+role_permission_id+"','"+role_id+"','"+permission_id+"','"+created_by+"','"+created_date+"')";
        }
    }
    console.log("text "+ text);
    sql+=text;
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertUserRoleCustom = function(role_id, id_list, user_array, created_date, created_by, callback) {
    var sql = "INSERT INTO userrole (id, role_id, user_id, created_by, created_date) " +
        "VALUES ";
    var text = '';
    for(var index=0;index<id_list.length;index++){
        var user_role_id = id_list[index];
        var user_id = user_array[index].user_id;
        if(index == 0){
            text+="('"+user_role_id+"','"+role_id+"','"+user_id+"','"+created_by+"','"+created_date+"')";
        }else {
            text+=",('"+user_role_id+"','"+role_id+"','"+user_id+"','"+created_by+"','"+created_date+"')";
        }
    }
    sql+=text;
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertUserRole = function(id, role_id, user_id, created_date, created_by, updated_by, updated_date, callback) {
    var sql = "INSERT INTO userrole (id, role_id, user_id, created_date, created_by, updated_by, updated_date) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, role_id, user_id, created_date, created_by, updated_by, updated_date], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.deleteUserRole = function(role_id, user_id, callback) {
    var sql = "DELETE FROM `userrole` WHERE role_id=? AND user_id=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [role_id, user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.deleteRole = function(role_id, callback) {
    var sql = "DELETE FROM `role` WHERE id=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [role_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.deleteOrder = function(order_id, callback) {
    var sql = " DELETE FROM `PurchaseOrder` " +
        " WHERE id = ? ";
    // get a connection from the pool
    console.log(sql);
    console.log(43543345345);

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.deleteOrderDetail = function(order_id, callback) {
    var sql = " DELETE FROM `purchaseorderdetail` " +
        " WHERE purchase_order_id = ? ";
    // get a connection from the pool
    console.log(sql);
    console.log(43543345345);

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.deleteOrderHistory = function(order_id, callback) {
    var sql = " DELETE FROM `purchaseorderhistory` " +
        " WHERE purchase_order_id = ? ";
    // get a connection from the pool
    console.log(sql);
    console.log(43543345345);

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.deleteRolePermission = function(role_id, callback) {
    var sql = "DELETE FROM `rolepermission` WHERE role_id=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [role_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertUserSocial = function(id, user_id, title, code, client_id, email, image, created_by, created_date, status, callback) {
    var sql = "INSERT INTO UserSocial (id, user_id, title, code, client_id, email, image, created_by, created_date, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, user_id, title, code, client_id, email, image, created_by, created_date, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPerson = function(id, identification, name, avatar, birthday, points, phone, gender, email, created_date, updated_by, entity_code, status, callback) {
    var sql = "INSERT INTO Person (id, identification, name, avatar, birthday, points, phone, gender, email, created_date, updated_by, entity_code, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, identification, name, avatar, birthday, points, phone, gender, email, created_date, updated_by, entity_code, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertBestSellProduct = function(id, product_id, created_by, created_date, status, callback) {
    var sql = "INSERT INTO BestSellProduct (id, product_id, created_by, created_date, status) " +
        "VALUES (?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, product_id, created_by, created_date, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertSlider = function(id, image, title, contentHTML, description, created_by,
                          created_date, requiring_id, requiring_entity_code, sort_order, status, callback) {
    var sql = "INSERT INTO Slider (id, image, title, contentHTML, description, created_by, " +
        "                           created_date, requiring_id, requiring_entity_code, sort_order, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, image, title, contentHTML, description, created_by,
            created_date, requiring_id, requiring_entity_code, sort_order, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.insertProductLinkContent = function(id, content_id, product_id, created_date, created_by, callback) {
    var sql = "INSERT INTO ProductLinkContent (id, content_id, product_id, created_date, created_by) " +
        "VALUES (?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, content_id, product_id, created_date, created_by], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPromotionDetail = function(id, promotion_id, product_id, created_date, created_by, status, entity_code, callback) {
    var sql = "INSERT INTO PromotionDetail (id, promotion_id, product_id, created_date, created_by, status, entity_code) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, promotion_id, product_id, created_date, created_by, status, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertCoupon = function(id, promotion_id, created_date, created_by, status, entity_code, coupon, callback) {
    var sql = "INSERT INTO PromotionDetail (id, promotion_id, created_date, created_by, status, entity_code, coupon) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, promotion_id, created_date, created_by, status, entity_code, coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.insertChinhSachBanHang = function(id, entity_code, created_date, created_by, title, tags, content_category_id, contentHTML, status, sort_order, image, callback) {
    var sql = "INSERT INTO Content (id, entity_code, created_date, created_by, title, " +
        "                           tags, content_category_id, contentHTML, status, sort_order, image) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, entity_code, created_date, created_by, title,
            tags, content_category_id, contentHTML, status, sort_order,image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertSanPham = function(id, product_category_id, code, name, title, quantity, image, description, contentHTML,
                                 price, weight, parent_id, entity_code, created_date, created_by, unit, brand , tags, status,
                                 sort_order, rating, is_important, type,color, callback) {
    var sql = "INSERT INTO `Product`(`id`, `product_category_id`, `code`, `name`, `title`, `quantity`, `image`, " +
        "                       `description`, `contentHTML`, `price`, `weight`, `parent_id`, `entity_code`, " +
        "                       `created_date`, `created_by`, `unit`, `brand`, `tags`, `status`, `sort_order`, `rating`, " +
        "                       `is_important`, `type`, `color`) " +
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, product_category_id, code, name, title, quantity, image, description,
                                contentHTML, price, weight, parent_id, entity_code, created_date, created_by,
                                unit, brand, tags, status, sort_order, rating, 0, 1,color], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertPromotion = function(id, code, name, beginDate, endDate, type, image, giamGiaCoDinh, giamGiaPhanTram,
                                   giaThap, giaCao, created_date, created_by,  status, sort_order, entity_code, coupon, time_use_coupon, callback) {
    var sql = "INSERT INTO `Promotion`(`id`, `code`, `name`, `start_date`, `end_date`, `type`, " +
        "`image`, `fix_price`, `percent`, `minimum_price`, `maximum_price`, `created_date`, " +
        "`created_by`, `updated_date`, `updated_by`, `status`, `sort_order`, `entity_code`, `coupon`, `number_of_uses`)" +
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();

        connection.query(sql, [id, code, name, beginDate, endDate, type,
                                image, giamGiaCoDinh, giamGiaPhanTram, giaThap, giaCao,
                                created_date, created_by, created_date, created_by, status, sort_order, entity_code, coupon, time_use_coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertDanhMucSanPham = function(id, name, title, description, contentHTML, created_date, created_by, entity_code, status, sort_order, parent_id, image, banner, link, callback) {
    var sql = "INSERT INTO `ProductCategory`(`id`, `name`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `entity_code`, `status`, `sort_order`, `parent_id`, `image`, `banner_image`, `link`)" +
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, name, title, description, contentHTML, created_date, created_by, entity_code, status, sort_order, parent_id, image, banner, link], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertChiNhanhCuaHang = function(id, title, description, contentHTML, created_date, created_by, entity_code, status, parent_id, callback) {
    var sql = "INSERT INTO `LookupData`(`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `entity_code`, `status`, `parent_id`)" +
        " VALUES (?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, title, description, contentHTML, created_date, created_by, entity_code, status, parent_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertLookupData = function(id, title, description, contentHTML, created_date, created_by, entity_code, status, parent_id, callback) {
    var sql = "INSERT INTO `LookupData`(`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `entity_code`, `status`, `parent_id`)" +
        " VALUES (?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, title, description, contentHTML, created_date, created_by, entity_code, status, parent_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.findSelectedProductAffectedForCoupon = function(coupon_promotion_id, productIds, callback) {
    var sql = "SELECT pr.id as product_id, pr.price as product_price " +
        "FROM PromotionDetail pd " +
        "   LEFT JOIN Product pr " +
        "   ON pd.product_id = pr.id " +
        "   LEFT JOIN Promotion p " +
        "   ON pd.promotion_id = p.id " +
        "WHERE pr.status IS NOT NULL AND pr.status > 0 " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.status = 1 " +
        "   AND p.id = ? " +
        "   AND pd.status IS NOT NULL AND pd.status > 0 " +
        "   AND pd.entity_code = 'PCP' " +
        "   AND pd.product_id IN (?) ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [coupon_promotion_id, productIds], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateCouponCalcInPurchasedOrder = function(order_id, coupon_percent_promotion, price_coupon, coupon_promotion_id,
                                                    coupon_promotion_name, callback) {
    var sql = "UPDATE `PurchaseOrder` " +
        "SET `percent_promotion`=?, `price_coupon`=?, `coupon_promotion_id`=?, `coupon_promotion_name`=? " +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [coupon_percent_promotion, price_coupon, coupon_promotion_id, coupon_promotion_name, order_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateSanPham = function(id, product_category_id, code, name, title, quantity, image, description,
                                 contentHTML, price, weight, parent_id, entity_code, updated_date, updated_by,
                                 unit, brand, tags, status, sort_order, rating, is_important, type,color, callback) {
    var sql = "UPDATE `Product` Set `product_category_id`=?," +
        "`code`=?, `name`=?, `title`=?, `quantity`=?, `image`=?," +
        " `description`=?, `contentHTML`=?, `price`=?, `weight`=?," +
        " `parent_id`=?, `entity_code`=?, `updated_date`=?," +
        " `updated_by`=?, `unit`=?, `brand`=?, `tags`=?, `status`=?, `sort_order`=?," +
        " `rating`=?, `is_important`=?, `type`=?, `color`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_category_id, code, name, title, quantity, image, description, contentHTML,
                                price, weight, parent_id, entity_code, updated_date, updated_by, unit, brand, tags,
                                status, sort_order, rating, is_important, type,color, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateSlider = function(image, title, contentHTML, description, updated_by, updated_date, requiring_id, requiring_entity_code, sort_order, status, id, callback) {
    var sql = "UPDATE `Slider` Set `image`=?," +
        "`title`=?, `contentHTML`=?, `description`=?, `updated_by`=?, `updated_date`=?," +
        " `requiring_id`=?, `requiring_entity_code`=?, `sort_order`=?, `status`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [image, title, contentHTML, description, updated_by, updated_date, requiring_id, requiring_entity_code, sort_order, status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateUserSocket = function(user_id,socket_id, callback) {
    var sql = "UPDATE `User` Set `socket_id`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [socket_id,user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updateUserLogin = function(id, last_login, callback) {
    var sql = "UPDATE `User` Set `last_login`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [last_login,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.updateUserSocketByUsername = function(user_name,socket_id, callback) {
    var sql = "UPDATE `User` Set `socket_id`=? WHERE `user_name`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [socket_id,user_name], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateBannerContent = function( content_id, content_link, content_image, content_status, callback) {
    var sql = "UPDATE `Content` " +
        "SET `link`=?, `image`=?, `status`=? " +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [content_link, content_image, content_status, content_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.capnhatBannerSanPham = function( image,callback) {
    var sql = "UPDATE `Content` Set `image`=? WHERE `entity_code`='EBP'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getBannerContent = function( banner_content_id, callback) {
    var sql = "SELECT c.id as content_id, c.image as content_image, " +
        "           c.link as content_link, c.status as content_status," +
        "           c.entity_code as content_entity_code, c.tags as content_tags " +
        "FROM content c " +
        "WHERE c.id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [banner_content_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.capnhatBannerTinTuc = function( image,callback) {
    var sql = "UPDATE `Content` Set `image`=? WHERE `entity_code`='ETK'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.capnhatBannerMonNgon = function( image,callback) {
    var sql = "UPDATE `Content` Set `image`=? WHERE `entity_code`='EBC'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.capnhatTrangThaiBannerTinTucSuKien = function( status,image,callback) {
    var sql = "UPDATE `Content` Set `status`= ?,`image`= ? WHERE `entity_code`='ETK'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status,image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.capnhatTrangThaiBannerMonNgon = function( status,image,callback) {
    var sql = "UPDATE `Content` Set `status`= ?,`image`= ? WHERE `entity_code`='EBC'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status,image], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateChiNhanhCuaHang = function(title, description, updated_by, updated_date, entity_code, id, callback) {
    var sql = "UPDATE `LookupData` " +
        "SET " +
        "`title`=?,`description`=?, " +
        "`updated_by`=?,`updated_date`=?,`entity_code`=? " +
        "WHERE `id`=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [title, description, updated_by, updated_date, entity_code, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateLoopkupData = function(title, description, contentHTML, updated_by, updated_date, parent_id, entity_code, id, callback) {
    var sql = "UPDATE `LookupData` " +
        "SET " +
        "`title`=?,`description`=?,`contentHTML`=?, " +
        "`updated_by`=?,`updated_date`=?, `parent_id`=?,`entity_code`=? " +
        "WHERE `id`=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [title, description, contentHTML, updated_by, updated_date, parent_id, entity_code, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateUserPassword = function(username, password, first_password, callback) {
    var sql = "UPDATE `user` " +
        "SET " +
        "`password`=?,`updated_date`=? " +
        "WHERE `user_name`=? and password!=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [password,now, username,first_password], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateRoleById = function(name,des,id, callback) {
    var sql = "UPDATE `role` " +
        "SET " +
        "`name`=?,`description`=? " +
        "WHERE `id`=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [name,des,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.xoaUserRole = function(id, callback) {
    var sql = "DELETE FROM `userrole` WHERE id=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });


};

exports.selectAllUserRole = function(user_id,callback) {
    var sql = "Select ur.id as id, ur.role_id as role_id, ur.user_id as user_id " +
        " FROM userrole ur "+
        " WHERE ur.user_id=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updateDanhMucSanPham = function(name, title, description, contentHTML, updated_by, updated_date, entity_code, status, sort_order, parent_id, image, banner, id, link, callback) {
    var sql = "UPDATE `ProductCategory` SET " +
        "`name`=?,`title`=?,`description`=?,`contentHTML`=?," +
        "`updated_by`=?,`updated_date`=?,`entity_code`=?," +
        "`status`=?,`sort_order`=?,`parent_id`=?," +
        "`image`=?,`banner_image`=?, `link`=? WHERE `id`=?";
    // get a connection from the pool
    console.log(sql);
    console.log(345435345345);
    console.log(link);

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [name, title, description, contentHTML, updated_by, updated_date, entity_code, status, sort_order, parent_id, image, banner,link, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMainContent = function(entity_code, updated_by, updated_date, tags, contentHTML, status, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`entity_code`=?,`updated_by`=?,`updated_date`=?, " +
        "`tags`=?,`contentHTML`=?," +
        "`status`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code, updated_by, updated_date, tags, contentHTML, status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateGioiThieuContent = function(entity_code, updated_by, updated_date, tags, contentHTML, status, image, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`entity_code`=?,`updated_by`=?,`updated_date`=?, " +
        "`tags`=?,`contentHTML`=?," +
        "`status`=?,`image`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code, updated_by, updated_date, tags, contentHTML, status, image, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateQuanLy = function(updated_by, updated_date, contentHTML, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`updated_by`=?,`updated_date`=?, " +
        "`contentHTML`=? " +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [updated_by, updated_date, contentHTML, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMonNgonType = function(type, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`type`=? " +
        " WHERE `id`=?";
    if(type == null){
        sql = "UPDATE `Content` SET " +
            "`type`= NULL " +
            " WHERE `id`=?";
    }
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        if(type != null) {
            connection.query(sql, [type, id], function (err, results) {
                connection.release();
                if (err) {
                    console.log(err);
                    if (callback) {
                        callback(true);
                    }
                    return;
                }
                if (callback) {
                    callback(false, results);
                }
            });
        }else {
            connection.query(sql, [id], function (err, results) {
                connection.release();
                if (err) {
                    console.log(err);
                    if (callback) {
                        callback(true);
                    }
                    return;
                }
                if (callback) {
                    callback(false, results);
                }
            });
        }
    });
};

exports.updateUsedCouponForOnceUseCoupon = function(coupon, callback) {
    var sql = "UPDATE `Promotion` SET status=3 WHERE `coupon`=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [coupon], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePurchaseOrder = function(status, payment_method, id, callback) {
    var sql = "UPDATE `PurchaseOrder` SET status=?, payment_method=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, payment_method, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateBestSellProduct = function(order, updated_by, updated_date,product_id, callback) {
    var sql = "UPDATE `BestSellProduct` SET `updated_by` = ?,`updated_date` = ?,`order` = ? WHERE `product_id` = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [updated_by, updated_date, order, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.removeBestSellProduct = function(product_id, callback) {
    var sql = "UPDATE `BestSellProduct` SET `status` = 0 WHERE `product_id` = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateBestSellProductOption = function(option_number, callback) {
    var sql = "UPDATE `Config` SET `value` = ? WHERE `name` = 'spbc'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [option_number], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updateConfig = function(value,name, callback) {
    var sql = "UPDATE `Config` SET `value` = ? WHERE `name` = ?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [value,name], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMonAnNgonSliderSpeed = function(speed, callback) {
    var sql = "UPDATE `Config` SET `value` = ? WHERE `name` = 'monanngon-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [speed], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateTinTucSliderSpeed = function(speed, callback) {
    var sql = "UPDATE `Config` SET `value` = ? WHERE `name` = 'tintuc-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [speed], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateHomeSliderSpeed = function(speed, callback) {
    var sql = "UPDATE `Config` SET `value` = ? WHERE `name` = 'home-slider-main-speed'";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [speed], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateLinkBanner = function(link, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`link`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [link, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateBannerImage = function(bannerImage, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`image_banner_alternative`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [bannerImage, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateLargeImage = function(largeImage, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`image_large`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [largeImage, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateContent = function(entity_code, updated_by, updated_date, title, tags, contentHTML, status, sort_order, image, id, callback) {
    var sql = "UPDATE `Content` SET " +
        "`entity_code`=?,`updated_by`=?,`updated_date`=?,`title`=?," +
        "`tags`=?,`contentHTML`=?," +
        "`status`=?,`sort_order`=?,`image`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [entity_code, updated_by, updated_date, title, tags, contentHTML, status, sort_order, image, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.removeSanPham = function(id, callback) {
    var sql = "UPDATE `Product` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.updatePurchaseOrderStatus = function(status,id, callback) {
    var sql = "UPDATE `PurchaseOrder` Set `status`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status,id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.removePromotion = function(id, callback) {
    var sql = "UPDATE `Promotion` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderContent = function(order,id, callback) {
    var sql = "UPDATE `Content` Set `sort_order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderPromotion = function(order,id, callback) {
    var sql = "UPDATE `Promotion` Set `sort_order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionStatus = function(status,id, callback) {
    var sql = "UPDATE `Promotion` Set `status`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderBestSellProduct = function(order,id, callback) {
    var sql = "UPDATE `BestSellProduct` Set `order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateProductStatus = function(status, product_id, callback) {
    var sql = "UPDATE `Product` Set `status`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateProductCategoryStatus = function(status, product_id, callback) {
    var sql = "UPDATE `productcategory` Set `status`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderProduct = function(order,id, callback) {
    var sql = "UPDATE `Product` Set `sort_order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderProductCategory = function(order,id, callback) {
    var sql = "UPDATE `ProductCategory` Set `sort_order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateOrderSliderHome = function(order,id, callback) {
    var sql = "UPDATE `Slider` Set `sort_order`= ? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [order, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionStatus = function(status, id, callback) {
    var sql = "UPDATE `Promotion` Set `status`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updatePromotionCouponTimeUse = function(number, id, callback) {
    var sql = "UPDATE `Promotion` Set `number_of_uses`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [number, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateLienHe = function(status, id, callback) {
    var sql = "UPDATE `Contact` Set `status`=? WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [status, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};




exports.removeChiNhanhCuaHang = function(id, callback) {
    var sql = "UPDATE `LookupData` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.removeLookupData = function(id, callback) {
    var sql = "UPDATE `LookupData` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.lockUser = function(id, callback) {
    var sql = "UPDATE `user` Set `is_locked`= 1 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.removeDanhMucSanPham = function(id, callback) {
    var sql = " UPDATE `ProductCategory` Set `status`= 0 WHERE `id`=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.removeSanPhamCuaDanhMuc = function(id, callback) {
    var sql = " UPDATE `Product` Set `status`= 0 WHERE `product_category_id`=?; ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.removeSlider = function(id, callback) {
    var sql = "UPDATE `Slider` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.removeContent = function(id, callback) {
    var sql = "UPDATE `Content` Set `status`= 0 WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertMucDuLieu = function(requiring_id, name, title, description, contentHTML, created_by, created_date, entity_code, status, language, meta_keywords, meta_description, meta_title, id, callback) {
    var sql = "INSERT INTO `DataDirectory`(`id`, `name`, `title`, `description`, `contentHTML`, `created_by`, `created_date`, `entity_code`, `status`, `language`, `meta_keywords`, `meta_description`, `meta_title`, `requiring_id`, `requiring_entity_code`) " +
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, name, title, description, contentHTML, created_by, created_date, entity_code, status, language, meta_keywords, meta_description, meta_title, requiring_id, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertWarehouse = function(id, product_id, quantity, created_date, created_by, status, callback) {
    var sql = "INSERT INTO `Warehouse`(id, product_id, quantity, created_date, created_by, status) " +
        " VALUES (?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, product_id, quantity, created_date, created_by, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.insertWarehouseHistory = function(id, warehouse_id, product_id, quantity, type, created_by, created_date, status, callback) {
    var sql = "INSERT INTO `WarehouseHistory`(id, warehouse_id, product_id, quantity, type, created_by, created_date, status) " +
        " VALUES (?,?,?,?,?,?,?,?)";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id, warehouse_id, product_id, quantity, type, created_by, created_date, status], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMucDuLieu = function(requiring_id, name, title, description, contentHTML, updated_by , updated_date, meta_keywords, meta_description, meta_title, entity_code, language, callback) {
    var sql = "UPDATE `DataDirectory` Set `name`=?," +
        "`title`=?, `description`=?, `contentHTML`=?, `updated_by`=?, `updated_date`=?, `requiring_entity_code`=?, `meta_keywords`=?, `meta_description`=?, `meta_title`=? " +
        "WHERE `requiring_id`=? AND language=? AND entity_code=?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        console.log([ name, title, description, contentHTML,  updated_by, updated_date, entity_code, meta_keywords, meta_description, meta_title, requiring_id, language, entity_code]);
        console.log(sql);
        connection.query(sql, [ name, title, description, contentHTML,  updated_by, updated_date, entity_code, meta_keywords, meta_description, meta_title, requiring_id, language, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });

    });
};

exports.updateMucDuLieuMainMeta = function(requiring_id, contentHTML, updated_by , updated_date, entity_code, language, meta_keywords, meta_description, meta_title, callback) {
    var sql = "UPDATE `DataDirectory` " +
        "Set `contentHTML`=?, `updated_by`=?, `updated_date`=?, `requiring_entity_code`=?, `meta_keywords`=?, `meta_description`=?, `meta_title`=? " +
        "WHERE `requiring_id`=? AND language=? AND entity_code=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ contentHTML,  updated_by, updated_date, entity_code, meta_keywords, meta_description, meta_title, requiring_id, language, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMucDuLieuGioiThieuMeta = function(requiring_id, contentHTML, updated_by , updated_date, entity_code, language, meta_keywords, meta_description, meta_title, callback) {
    var sql = "UPDATE `DataDirectory` " +
        "Set `contentHTML`=?, `updated_by`=?, `updated_date`=?, `requiring_entity_code`=?, `meta_keywords`=?, `meta_description`=?, `meta_title`=? " +
        "WHERE `requiring_id`=? AND language=? AND entity_code=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ contentHTML,  updated_by, updated_date, entity_code, meta_keywords, meta_description, meta_title, requiring_id, language, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateMucDuLieuGioiThieu = function(requiring_id, name, description, contentHTML, updated_by , updated_date, entity_code, language, callback) {
    var sql = "UPDATE `DataDirectory` Set `name`=?, " +
        "`description`=?, `contentHTML`=?, `updated_by`=?, `updated_date`=?, `requiring_entity_code`=? " +
        "WHERE `requiring_id`=? AND language=? AND entity_code=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ name, description, contentHTML,  updated_by, updated_date, entity_code, requiring_id, language, entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};





exports.getViLanCode = function(callback) {
    var sql = "SELECT * FROM Language " +
        "WHERE code='VI';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.checkUserExist = function(role_id,callback) {
    var sql = "SELECT * FROM userrole us LEFT JOIN user u ON" +
        " u.id = us.user_id WHERE " +
        "us.role_id = ? AND u.is_locked = 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [role_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getNotificationById = function(user_id,callback) {
    var sql = "SELECT * FROM Notification " +
        "WHERE client_id=? " +
        "ORDER BY created_date DESC " +
        "LIMIT 8;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getImageLibJson = function(callback) {
    var sql = "SELECT * FROM Config " +
        "WHERE name='image-library-json' ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateImageLibJson = function(text,callback) {
    var sql = "UPDATE Config SET value=? " +
        "WHERE name='image-library-json' ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [text], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateSeenNotifications = function(user_id,callback) {
    var sql = "UPDATE `Notification` " +
        "SET unread=0 " +
        "WHERE client_id=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};
exports.getUnreadNotificationById = function(user_id,callback) {
    var sql = "SELECT COUNT(*) as total FROM Notification " +
        "WHERE client_id=? " +
        "   AND unread=1";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [user_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};
exports.getEnLanCode = function(callback) {
    var sql = "SELECT * FROM Language " +
        "WHERE code='EN';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllTinTucSuKienContent = function(callback) {
    var sql = "SELECT * FROM Content " +
        "WHERE content_category_id='65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonContent = function(callback) {
    var sql = "SELECT * FROM Content " +
        "WHERE content_category_id='9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getAllBestSellersPagingWithLanguage = function(firstRow, secondRow, langCode, callback) {
    var sql = "SELECT " + this.productSelect() + ", "+this.promotionSelect()+", \n" +
        "                                           SUM(pod.quantity) as pd_quantity \n" +
        "                FROM PurchaseOrderDetail pod \n" +
        "                LEFT JOIN PurchaseOrder p " +
        "                   ON p.id=pod.purchase_order_id \n" +
        "                LEFT JOIN " + this.productFrom() + " " +
        "                   ON " + this.productAlias() + ".product_id=pod.product_id " +
        "                LEFT JOIN " + this.promotionFrom() + " " +
        "                   ON " + this.productAlias() + ".product_id = "+this.promotionAlias()+".product_id " +
        "                WHERE pod.status IS NOT NULL AND pod.status > 0 " +
        "                   AND " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "                ORDER BY pd_quantity DESC " +
        "       LIMIT ?,? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        console.log("now "+ now);
        connection.query(sql, [ langCode, langCode, now, now, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getCustomAllBestSellersPagingWithLanguage = function (firstRow, secondRow, langCode, callback) {
    var promotionAlias = this.promotionAlias();

    var sql  = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "FROM  BestSellProduct b " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "       ON "+this.promotionAlias()+".product_id=b.product_id" +
        "   LEFT JOIN " + this.productFrom() + " " +
        "       ON "+this.productAlias()+".product_id = b.product_id "+
        "                   AND "+this.productAlias()+".product_parent_id IS NOT NULL  " +
        "HAVING product_id in (" +
        "               SELECT product_id " +
        "               FROM bestsellproduct " +
        "               WHERE status = 1) " +
        "ORDER BY b.order " +
        "LIMIT ?,? ";
    // get a connection from the pool
    pool.getConnection(function (err, connection) {
        if (err) {
            console.log(err);
            if (callback) {
                callback(true);
            }
            return;
        }
        // make the query
        var now = api.getNow();
        connection.query(sql, [ langCode, now, now, langCode, firstRow, secondRow], function (err, results) {
            connection.release();
            if (err) {
                console.log(err);
                if (callback) {
                    callback(true);
                }
                return;
            }
            if (callback) {
                callback(false, results);
            }
        });
    });
};

exports.getAllProductsPagingWithLanguageAndLatest = function(firstRow, secondRow, langCode, callback) {

    var sql = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "FROM " + this.productFrom() + " LEFT JOIN " + this.promotionFrom() + " " +
        "   ON " + this.productAlias() + ".product_id = "+this.promotionAlias()+".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "ORDER BY " + this.productAlias() + ".product_created_date DESC " +
        "LIMIT ?,?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, langCode, now, now, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllProduct = function(callback) {
    var sql = "SELECT pr.id, pr.name, pr.code, pr.price , wh.quantity as quantity, pr.product_category_id, " +
        " pc.name as productcategory_name, pr.color as product_color,pr.unit as product_unit "+
    " FROM Product pr "+
    " LEFT JOIN warehouse wh "+
    " ON wh.product_id=pr.id "+
    " LEFT JOIN productcategory pc "+
    " ON pr.product_category_id=pc.id "+
    " WHERE pr.status > 0 AND pr.status IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllProductsPagingWithLanguageAndType = function(firstRow, secondRow, langCode, type, callback) {

    var sql = "SELECT dd1.title as product_title, dd1.description as product_description, " +
        "           dd1.contentHTML as product_contentHTML, " +
        "           pr.id as product_id, pr.image as product_image, pr.price as product_price, " +
        "           p.type as promotion_type, dd.title as gift, p.fix_price, p.percent, " +
        "           p.minimum_price, p.maximum_price, p.image as promotion_image " +
        "FROM Product pr LEFT JOIN PromotionDetail pd " +
        "   ON pr.id = pd.product_id " +
        "       AND pd.status IS NOT NULL AND pd.status > 0 " +
        "   LEFT JOIN Promotion p " +
        "   ON pd.promotion_id = p.id " +
        "       AND p.start_date < ? AND p.end_date > ? " +
        "   LEFT JOIN DataDirectory dd1 " +
        "   ON pr.id = dd1.requiring_id " +
        "       AND pr.entity_code = dd1.requiring_entity_code " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON p.id = dd.requiring_id " +
        "       AND p.entity_code = dd.requiring_entity_code " +
        "WHERE (dd.language = ? OR dd.language IS NULL) " +
        "   AND dd1.language = ? " +
        "   AND pr.status IS NOT NULL AND pr.status > 0 " +
        "   AND pr.type = ? " +
        "LIMIT ?,?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [now, now, langCode, langCode, type, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllProductsPromotionPagingWithLanguage = function(firstRow, secondRow, langCode, callback) {
    var sql = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "        FROM " + this.promotionFrom() + " LEFT JOIN " + this.productFrom() + " \n" +
        "           ON "+this.promotionAlias()+".product_id = "+this.productAlias()+".product_id \n" +
        "        WHERE "+this.productAlias()+".product_parent_id IS NOT NULL "+
        "LIMIT ?,?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, now, now, langCode, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.searchAllProductPagingWithLanguage = function(firstRow, secondRow, langCode, searchKey, callback) {
    var sql = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "FROM " + this.productFrom() + " LEFT JOIN " + this.promotionFrom() + " " +
        "   ON " + this.productAlias() + ".product_id = "+this.promotionAlias()+".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "   AND (" + this.productAlias() + ".product_tags LIKE '%"+searchKey+"%' " +
        "       OR " + this.productAlias() + ".product_code LIKE '%"+searchKey+"%' " +
        "       OR " + this.productAlias() + ".product_title LIKE '%"+searchKey+"%' " +
        "       OR " + this.productAlias() + ".product_description LIKE '%"+searchKey+"%' " +
        "       OR " + this.productAlias() + ".product_contentHTML LIKE '%"+searchKey+"%') " +
        "LIMIT ?,? ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, langCode, now, now, firstRow, secondRow], function(err, results) {
            connection.release();

            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.searchAllProductsPromotionPagingWithLanguage = function(firstRow, secondRow, langCode, tag, callback) {

    var sql = "SELECT dd1.title as product_title, dd1.description as product_description, " +
        "           dd1.contentHTML as product_contentHTML, " +
        "           pr.id as product_id, pr.image as product_image, pr.price as product_price, " + this.promotionSelect() + " " +
        "FROM "+this.promotionFrom()+" LEFT JOIN " + this.productFrom() + " " +
        "   ON "+this.promotionAlias()+".product_id = " + this.productAlias() + ".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "   AND (" + this.productAlias() + ".product_tags LIKE '%"+tag+"%' " +
        "       OR " + this.productAlias() + ".product_code LIKE '%"+tag+"%' " +
        "       OR " + this.productAlias() + ".product_title LIKE '%"+tag+"%' " +
        "       OR " + this.productAlias() + ".product_description LIKE '%"+tag+"%' " +
        "       OR " + this.productAlias() + ".product_contentHTML LIKE '%"+tag+"%') " +
        "LIMIT ?,? ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, now, now, langCode, firstRow, secondRow], function(err, results) {
            connection.release();

            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonLienQuanSanPhamPagingWithLanguage = function(firstRow, secondRow, langCode, product_id, callback) {
    var sql = "SELECT c.image, dd.* " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "   RIGHT JOIN ProductLinkContent plc " +
        "   ON plc.content_id = c.id " +
        "WHERE c.status IS NOT NULL AND c.status > 0 " +
        "   AND dd.language = ? " +
        "   AND plc.product_id = ? " +
        "ORDER BY c.sort_order ASC " +
        "LIMIT ?,?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode, product_id, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllLatestTinTucSuKienContentWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, dd.title, c.created_date " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "       ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code "+
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 and c.type IS NULL " +
        "   AND c.content_category_id='65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'TIN' " +
        "ORDER BY c.created_date DESC " +
        "LIMIT 6;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllLatestMonAnNgonContentWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, dd.title, c.created_date " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "       ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code "+
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 and c.type IS NULL " +
        "   AND c.content_category_id='9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'MON' " +
        "ORDER BY c.created_date DESC " +
        "LIMIT 6;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllTinTucContentPagingWithLanguage = function(firstRow, secondRow, langCode, callback) {
    var sql = "SELECT c.id, c.image, dd.title, dd.description " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code "+
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type IS NULL AND c.content_category_id='65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'TIN' " +
        "LIMIT ?,?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonContentPagingWithLanguage = function(firstRow, secondRow, langCode, callback) {
    var sql = "SELECT c.id, c.image, dd.title, dd.description " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code "+
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type IS NULL AND c.content_category_id='9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'MON' " +
        "LIMIT ?,?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode, firstRow, secondRow], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllTinTucSuKienContent = function(callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Content c " +
        "WHERE c.content_category_id='65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type IS NULL " +
        "   AND c.entity_code = 'MTK';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllMonAnNgonContent = function(callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Content c " +
        "WHERE c.content_category_id='9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type IS NULL " +
        "   AND c.entity_code = 'MON';";
    // get a connection from the pool
    console.log(sql);
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllWishProducts = function(languageCode, product_ids, callback) {

    var sql = "SELECT pr.*, p.type, p.coupon, p.fix_price, p.percent, dd.title as gift " +
        "FROM Product pr LEFT JOIN DataDirectory dd " +
        "   ON pr.id = dd.requiring_id " +
        "       AND pr.entity_code = dd.requiring_entity_code " +
        "   LEFT JOIN PromotionDetail pd " +
        "   ON pd.product_id = pr.id " +
        "   LEFT JOIN Promotion p " +
        "   ON pd.promotion_id = p.id " +
        "WHERE dd.language = ? " +
        "   AND pd.status IS NOT NULL AND pd.status > 0 " +
        "   AND pr.id IN (?) " +
        "LIMIT 8;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [languageCode, product_ids], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getAllSanPhamLienQuan = function(languageCode, product_category_id, product_id, callback) {


    var sql = "SELECT dd1.title as product_title, dd1.description as product_description, " +
        "           dd1.contentHTML as product_contentHTML, " +
        "           pr.id as product_id, pr.image as product_image, pr.price as product_price, " + this.promotionSelect() + " " +
        "FROM Product pr LEFT JOIN " + this.promotionFrom() + " " +
        "   ON pr.id = "+ this.promotionAlias() +".product_id " +
        "   LEFT JOIN DataDirectory dd1 " +
        "   ON pr.id = dd1.requiring_id " +
        "       AND pr.entity_code = dd1.requiring_entity_code " +
        "WHERE dd1.language = ? " +
        "   AND pr.status IS NOT NULL AND pr.status > 0 " +
        "   AND pr.product_category_id = ? " +
        "   AND pr.id <> ? " +
        "   AND pr.parent_id IS NOT NULL " +
        "LIMIT 4;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [languageCode, now, now, languageCode, product_category_id, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllMonAnNgonLienQuanSanPham = function(product_id, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Content c LEFT JOIN ProductLinkContent p " +
        "   ON c.id = p.content_id " +
        "WHERE p.product_id=? " +
        "   AND c.status IS NOT NULL AND c.status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonLienQuanSanPham = function(product_id, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Content c LEFT JOIN ProductLinkContent p " +
        "   ON c.id = p.content_id " +
        "WHERE p.product_id=? " +
        "   AND c.status IS NOT NULL AND c.status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllBestSellers = function(callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Product pr " +
        "WHERE pr.is_important = 1" +
        "   AND pr.status IS NOT NULL AND pr.status > 0 AND pr.parent_id IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllProductsWithLatest = function(callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM " + this.productFrom() + " " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "   ON " + this.productAlias() + ".product_id = "+this.promotionAlias()+".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "ORDER BY " + this.productAlias() + ".product_created_date DESC " +
        "LIMIT 20;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, ["vi", "vi", now, now], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllProductsWithType = function(type, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM Product pr " +
        "WHERE pr.status IS NOT NULL " +
        "   AND pr.status > 0 " +
        "   AND pr.type = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [type], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.countSearchAllProductsPromotions = function(tag, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM "+this.promotionFrom()+" LEFT JOIN " + this.productFrom() + " " +
        "   ON "+this.promotionAlias()+".product_id = " + this.productAlias() + ".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "   AND (" + this.productAlias() + ".product_tags LIKE '%"+tag+"%' " +
        "       OR " + this.productAlias() + ".product_code LIKE '%"+tag+"%') ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, ["vi", now, now, "vi"], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllProductsPromotions = function(callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM " + this.promotionFrom() + " LEFT JOIN " + this.productFrom() + " " +
        "   ON " + this.promotionAlias() + ".product_id = " + this.productAlias() + ".product_id " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, ["vi", now, now, "vi"], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countSearchAllProducts = function(searchKey, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM " + this.productFrom() + " " +
        "WHERE " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "   AND (" + this.productAlias() + ".product_tags LIKE '%"+searchKey+"%' " +
        "       OR " + this.productAlias() + ".product_code LIKE '%"+searchKey+"%') ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, ["vi"], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.promotionAlias = function() {
    return "pd1";
};

exports.promotionSelect = function() {
    return " " + this.promotionAlias()+".minimum_price, "+this.promotionAlias()+".maximum_price, "
        +this.promotionAlias()+".promotion_image, "+this.promotionAlias()+".promotion_type, "
        +this.promotionAlias()+".gift, "+this.promotionAlias()+".fix_price, "
        +this.promotionAlias()+".percent, "+this.promotionAlias()+".promotion_name, "
        +this.promotionAlias()+".promotion_entity, "+this.promotionAlias()+".promotion_id ";
};

exports.promotionFrom = function() {
    var data =  " (SELECT pd.product_id, pd.entity_code as promotion_detail_entity_code, p.image as promotion_image, p.fix_price, p.percent, p.title as gift, " +
    "                       p.minimum_price, p.maximum_price, p.type as promotion_type, p.start_date, p.end_date, p.status, " +
    "                       p.name as promotion_name, p.entity_code as promotion_entity, p.id as promotion_id " +
    "               FROM PromotionDetail pd " +
    "                   LEFT JOIN Promotion p " +
    "                       ON pd.promotion_id = p.id " +
    "                   WHERE pd.status IS NOT NULL AND pd.status > 0 " +
    "                       AND (pd.entity_code = 'PGT' OR pd.entity_code = 'PSO') " +
    "                           AND p.start_date < ? AND p.end_date > ? " +
    "                           AND p.status IS NOT NULL AND p.status > 0 " +
    "                           AND p.status <> 2) " + this.promotionAlias();
    return data;
};


exports.productAlias = function() {
    return "prd1";
};

exports.productSelect = function() {
    return " " + this.productAlias()+".product_title, "+this.productAlias()+".product_description, "
        +this.productAlias()+".product_contentHTML, "+this.productAlias()+".product_id, "
        +this.productAlias()+".product_image, " +this.productAlias()+".product_code, "+this.productAlias()+".product_price ";
};

exports.productFrom = function() {
    var data =  " (SELECT pr.name as product_title, pr.description as product_description, " +
        "               pr.contentHTML as product_contentHTML, pr.id as product_id, pr.image as product_image, " +
        "               pr.price as product_price, pr.product_category_id as product_category_id, " +
        "               pr.parent_id as product_parent_id, pr.created_date as product_created_date," +
        "               pr.code as product_code, pr.tags as product_tags " +
        "           FROM Product pr " +
        "           WHERE pr.status IS NOT NULL AND pr.status = 1 ) " + this.productAlias();
    return data;
};

exports.productAliasOrder = function() {
    return "prd1";
};

exports.productSelectOrder = function() {
    return " " + this.productAlias()+".product_title, "+this.productAlias()+".product_description, "
        +this.productAlias()+".product_contentHTML, "+this.productAlias()+".product_id, "
        +this.productAlias()+".product_image, " +this.productAlias()+".product_code, "+this.productAlias()+".product_price ";
};

exports.productFromOrder = function() {
    var data =  " (SELECT pr.name as product_title, pr.description as product_description, " +
        "               pr.contentHTML as product_contentHTML, pr.id as product_id, pr.image as product_image, " +
        "               pr.price as product_price, pr.product_category_id as product_category_id, " +
        "               pr.parent_id as product_parent_id, pr.created_date as product_created_date," +
        "               pr.code as product_code, pr.tags as product_tags " +
        "           FROM Product pr " +
        "           WHERE pr.status IS NOT NULL) " + this.productAlias();
    return data;
};



exports.productCategoryAlias = function() {
    return "procate1";
};

exports.productCategorySelect = function() {
    return " " + this.productCategoryAlias()+".product_category_id, "+this.productCategoryAlias()+".product_category_title, "
        +this.productCategoryAlias()+".product_category_sort_order, "+this.productCategoryAlias()+".product_category_image ";
};

exports.productCategoryFrom = function() {
    var data =  " (SELECT c.id as product_category_id, dd.title as product_category_title, " +
        "               c.sort_order as product_category_sort_order, c.image as product_category_image, " +
        "               c.parent_id as product_category_parent_id, c.entity_code as product_category_entity_code " +
        "           FROM ProductCategory c " +
        "               LEFT JOIN DataDirectory dd " +
        "                   ON c.entity_code = dd.requiring_entity_code " +
        "                       AND c.id = dd.requiring_id " +
        "           WHERE c.status IS NOT NULL AND c.status > 0 " +
        "               AND c.status != 2 " +
        "               AND dd.language = ? ) " + this.productCategoryAlias();
    return data;
};

exports.getAllProductsWithCategoriesRoot = function(first, second, langCode, rootCategoryID, callback) {
    var sql = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "FROM " + this.productFrom() + " " +
        "   LEFT JOIN ProductCategory pc " +
        "       ON pc.id = " + this.productAlias() + ".product_category_id " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "       ON " + this.productAlias() + ".product_id = " + this.promotionAlias() + ".product_id " +
        "WHERE pc.parent_id = ? " +
        "   AND pc.entity_code='CAT' " +
        "   AND " + this.productAlias() + ".product_parent_id IS NOT NULL " +
    "LIMIT ?,? ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        console.log(now);
        connection.query(sql, [langCode, langCode, now, now, rootCategoryID, first, second], function(err, results) {
        // connection.query(sql, [langCode, now, now , first, second], function(err, results) {
            connection.release();
            console.log(results);
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getProductDetails = function(langCode, product_id, callback) {
    var sql = "SELECT pr.*, dd.title as title1, dd.description as description1, " + this.promotionSelect() + " " +
        "FROM Product pr " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "   ON pr.id = "+this.promotionAlias()+".product_id " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON pr.id = dd.requiring_id " +
        "       AND pr.entity_code = dd.requiring_entity_code " +
        "WHERE dd.language=? " +
        "   AND pr.id=? " +
        "   AND pr.status IS NOT NULL AND pr.status > 0 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, now, now, langCode, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllProductsWithCategories = function(first, second, langCode, categoryID, callback) {

    var sql = "SELECT " + this.productSelect() + ", " + this.promotionSelect() + " " +
        "FROM " + this.productFrom() + " " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "   ON " + this.productAlias() + ".product_id = " + this.promotionAlias() + ".product_id " +
        "WHERE " + this.productAlias() + ".product_category_id = ? " +
        "   AND " + this.productAlias() + ".product_parent_id IS NOT NULL " +
        "LIMIT ?,? ";



    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query

        var now = api.getNow();
        connection.query(sql, [langCode, langCode, now, now, categoryID, first, second], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllProductsWithCategories = function(langCode, categoryID, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM " + this.productFrom() + " " +
        "WHERE " + this.productAlias() + ".product_category_id=? " +
        "   AND " + this.productAlias() + ".product_parent_id IS NOT NULL ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode, categoryID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllProductsWithCategoriesRoot = function(langCode, rootCategoryID, callback) {
    var sql = "SELECT COUNT(*) as SUM " +
        "FROM " + this.productFrom() + " " +
        "   LEFT JOIN ProductCategory pc " +
        "   ON pc.id = " + this.productAlias() + ".product_category_id " +
        "WHERE pc.parent_id=? " +
        "   AND pc.entity_code='CAT' " +
        "   AND " + this.productAlias() + ".product_parent_id IS NOT NULL";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode, rootCategoryID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.countProductKhuyenMai = function(callback) {
    var sql = "SELECT COUNT(*) as total " +
        "FROM Product " +
        "WHERE requiring_entity_code='EHC' " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllMonAnNgonSliders = function(callback) {
    var sql = "SELECT COUNT(*) as total " +
        "FROM Slider " +
        "WHERE requiring_entity_code='EHC' " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllTinTucTop = function(callback) {
    var sql = "SELECT COUNT(*) as total " +
        "FROM Content c " +
        "WHERE c.type=2 " +
        "   AND c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.entity_code = 'MTK';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countAllMonNgonTop = function(callback) {
    var sql = "SELECT COUNT(*) as total " +
        "FROM Content c " +
        "WHERE c.type=2 " +
        "   AND c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.entity_code = 'MON';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countProductByCode = function(code,callback) {
    var sql = "SELECT COUNT(*) as count " +
        "FROM Product " +
        "WHERE code=? " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countBrandByName = function(title,entity_code,callback) {
    var sql = "SELECT COUNT(*) as count " +
        "FROM LookupData " +
        "WHERE title=? " +
        "   AND status IS NOT NULL AND status > 0 AND entity_code=?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [title,entity_code], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUserByUsername = function(username,callback) {
    var sql = "SELECT * " +
        "FROM user " +
        "WHERE user_name=? and is_locked = 0 ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [username], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getAllRole = function(callback) {
    var sql = "SELECT r.id as role_id, r.name as role_name, r.description as description " +
        "FROM role r ";
    // get a connection from the pool

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql,[], function(err, results) {

            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getRoleByName = function(name,callback) {
    var sql = "SELECT * " +
        "FROM role " +
        "WHERE name=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [name], function(err, results) {

            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getRoleIdByName = function(rolename,callback) {
    var sql = "SELECT r.id as role_id, r.name as role_name " +
        "FROM role r " +
        "WHERE r.name= ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [rolename], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getUserById = function(id,callback) {
    var sql = "SELECT * " +
        "FROM user " +
        "WHERE id=? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.getUserAndRoleById = function(id,callback) {
    var sql = "SELECT u.id as user_id, u.user_name as user_name, u.password as user_password, ur.id as user_role_id, " +
            " r.name as role_name, r.id as role_id" +
            "   FROM user u " +
            "   LEFT JOIN userrole ur  " +
            "   ON u.id=ur.user_id AND u.id=?" +
            "   RIGHT OUTER JOIN role r " +
            "   ON r.id=ur.role_id ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getRoleById = function(id,callback) {
    var sql = "SELECT * " +
        "FROM role " +
        "WHERE id=? ";
    // get a connection from the pool

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getRolePermissionByRoleId = function(role_id,callback) {
    var sql = "SELECT * " +
        "FROM rolepermission " +
        "WHERE role_id=? ";
    // get a connection from the pool

    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [role_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllPermission = function(callback) {
    var sql = "SELECT * " +
        "FROM permission ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};



exports.removeDanhMucFromFooter = function(category_id,updated_date, updated_by,callback) {
    var sql = "UPDATE `ProductCategory` " +
        "Set `footer`=0, " +
        "   `updated_date`=?, `updated_by`=?" +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [updated_date, updated_by, category_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateDanhMucToShowInFooter = function(category_id,updated_date, updated_by,callback) {
    var sql = "UPDATE `ProductCategory` " +
        "Set `footer`=1, " +
        "   `updated_date`=?, `updated_by`=?" +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [updated_date, updated_by, category_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateToProductGift = function(product_id,updated_date, updated_by,callback) {
    var sql = "UPDATE `Product` " +
        "Set `product_category_id`='9291ed3a-4f48-11e8-9c2d-fa7ae01bbebc', " +
        "   `updated_date`=?, `updated_by`=?" +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [updated_date, updated_by, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.updateToUnProductGift = function(product_id,updated_date, updated_by,callback) {
    var sql = "UPDATE `Product` " +
        "Set `product_category_id`='9291ed3a-4f48-11e8-9c2d-fa7ae01bbebc', " +
        "   `updated_date`=?, `updated_by`=?" +
        "WHERE `id`=?";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [updated_date, updated_by, product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countProductGiftExisting = function(product_id,callback) {
    var sql = "SELECT COUNT(*) as count " +
        "FROM Product p " +
        "WHERE p.id=? " +
        "   AND p.status IS NOT NULL AND p.status > 0 " +
        "   AND p.product_category_id = '9291ed3a-4f48-11e8-9c2d-fa7ae01bbebc';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countBestSellProduct = function(product_id,callback) {
    console.log(product_id);
    var sql = "SELECT COUNT(*) as count " +
        "FROM BestSellProduct " +
        "WHERE product_id=? " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.countProduct = function(product_id,callback) {
    console.log(product_id);
    var sql = "SELECT COUNT(*) as count " +
        "FROM product " +
        "WHERE id=? " +
        "   AND status IS NOT NULL AND status > 0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.countAllBestSellProduct = function(callback) {
    var sql = "SELECT COUNT(*) as count " +
        "FROM BestSellProduct bs " +
        "   LEFT JOIN " + this.productFrom() + " " +
        "       ON " + this.productAlias() + ".product_id = bs.product_id " +
        "WHERE bs.status IS NOT NULL AND bs.status > 0 " +
        "   AND " + this.productAlias() + ".product_parent_id IS NOT NULL";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, ["vi"], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonSlidersByOrder = function(langCode, order, callback) {
    var sql = "SELECT s.image, dd.* " +
        "FROM Slider s LEFT JOIN DataDirectory dd " +
        "   ON s.id = dd.requiring_id " +
        "   AND s.requiring_entity_code = dd.requiring_entity_code " +
        "WHERE s.requiring_entity_code='EHC' " +
        "   AND dd.language = ? " +
        "   AND s.status IS NOT NULL AND s.status > 0 " +
        "ORDER BY s.sort_order ASC " +
        "LIMIT ?, 1;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [order, langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getTopTinTucSlidersByOrder = function(langCode, order, callback) {
    var sql = "SELECT c.id, dd.title, dd.description, c.image_large " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code " +
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type=2 " +
        "   AND c.content_category_id='65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'TIN' " +
        "LIMIT 0, 5;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getTopMonAnNgonSlidersByOrder = function(langCode, order, callback) {
    var sql = "SELECT c.id, dd.title, dd.description, c.image_large " +
        "FROM Content c " +
        "   LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code " +
        "WHERE c.status IS NOT NULL " +
        "   AND c.status > 0 " +
        "   AND c.type=2 " +
        "   AND c.content_category_id='9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND dd.language = ? " +
        "   AND c.entity_code = 'MON' " +
        "LIMIT 0, 5;";
    console.log(sql);
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllMonAnNgonSliders = function(callback) {
    var sql = "SELECT * " +
        "FROM Slider " +
        "WHERE requiring_entity_code='EHC' " +
        "   AND status IS NOT NULL AND status > 0 " +
        "ORDER BY sort_order ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllHomeSliders = function(callback) {
    var sql = "SELECT * " +
        "FROM Slider " +
        "WHERE requiring_entity_code='HOM' " +
        "   AND status IS NOT NULL AND status > 0 " +
        "ORDER BY sort_order ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getProductGiftByPromotionId = function(promotion_id,callback) {
    var sql = "SELECT pr.* FROM PromotionDetail pd " +
        "LEFT JOIN Promotion po ON po.id=pd.promotion_id " +
        "LEFT JOIN Product pr ON pr.id=pd.product_id " +
        "WHERE pd.promotion_id = ? " +
        "AND pd.entity_code = 'PKL' " +
        "AND pd.status IS NOT NULL " +
        "AND pd.status > 0 AND po.status IS NOT NULL" ;
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [promotion_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getPromotionGiftByProductId = function(product_id,lang,callback) {
    var sql = "SELECT pd.*,dd.title as promotion_name FROM PromotionDetail pd LEFT JOIN Promotion po ON po.id=pd.promotion_id LEFT JOIN DataDirectory dd ON dd.requiring_id = po.id\n" +
        "                WHERE pd.product_id = ? AND \n" +
        "                pd.status IS NOT NULL AND \n" +
        "                pd.status > 0 AND pd.entity_code = 'PGT' \n" +
        "                AND po.status IS NOT NULL \n" +
        "                AND po.status > 0 \n" +
        "                AND po.start_date < ?\n" +
        "                AND po.end_date > ?\n" +
        "                AND dd.language = ?" ;
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [product_id,now,now,lang], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getContentModernByID = function(contentID, callback) {
    var sql = "SELECT c.id as content_id, c.image as content_image, c.image_large as content_image_large, " +
        " c.link as content_link, c.status as content_status, c.tags as content_tags, c.sort_order as content_sort_order, " +
        " c.entity_code as content_entity_code, c.image_banner_alternative as content_image_banner_alternative " +
        "FROM Content c " +
        "WHERE c.id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [contentID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getContentByID = function(contentID, callback) {
    var sql = "SELECT * " +
        "FROM Content c " +
        "WHERE c.id = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [contentID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.validate_promotion_product = function(product_id, callback) {
    var sql = "SELECT " + this.promotionSelect() + ", " +
        "               pr.name as product_name,pr.price as product_price, pr.id as product_id " +
        "FROM Product pr " +
        "   LEFT JOIN " + this.promotionFrom() + " " +
        "       ON "+this.promotionAlias()+".product_id=pr.id " +
        "WHERE pr.id = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, ["vi", now,now,product_id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getMonNgonByType = function(type, callback) {
    var sql = "SELECT c.id, dd.title " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code " +
        "WHERE c.content_category_id = '9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
        "   AND c.type=? " +
        "   AND dd.language = 'vi' " +
        "   AND c.status IS NOT NULL AND c.status > 0;";
    if(type == null){
        sql = "SELECT c.id, dd.title " +
            "FROM Content c LEFT JOIN DataDirectory dd " +
            "   ON c.id = dd.requiring_id " +
            "       AND c.entity_code = dd.requiring_entity_code " +
            "WHERE c.content_category_id = '9C50E7B6-A76B-4115-9EDA-F9E3604CB304' " +
            "   AND c.type IS NULL " +
            "   AND dd.language = 'vi' " +
            "   AND c.status IS NOT NULL AND c.status > 0;";
    }
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        if(type){
            connection.query(sql, [type], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }else {
            connection.query(sql, [], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }
    });
};

exports.getTinTucByType = function(type, callback) {
    var sql = "SELECT c.id, dd.title " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.id = dd.requiring_id " +
        "       AND c.entity_code = dd.requiring_entity_code " +
        "WHERE c.content_category_id = '65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
        "   AND c.type=? " +
        "   AND dd.language = 'vi' " +
        "   AND c.status IS NOT NULL AND c.status > 0;";
    if(type == null){
        sql = "SELECT c.id, dd.title " +
            "FROM Content c LEFT JOIN DataDirectory dd " +
            "   ON c.id = dd.requiring_id " +
            "       AND c.entity_code = dd.requiring_entity_code " +
            "WHERE c.content_category_id = '65b136dc-5122-11e8-9c2d-fa7ae01bbebc' " +
            "   AND c.type IS NULL " +
            "   AND dd.language = 'vi' " +
            "   AND c.status IS NOT NULL AND c.status > 0;";
    }
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        if(type){
            connection.query(sql, [type], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }else {
            connection.query(sql, [], function(err, results) {
                connection.release();
                if(err) { console.log(err); if (callback) {callback(true);} return; }
                if (callback) { callback(false, results); }
            });
        }
    });
};



exports.getSliderById = function(id, callback) {
    var sql = "SELECT * " +
        "FROM Slider " +
        "WHERE id = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [id], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getContentByLanguageCode = function(languageCode, contentID, callback) {
    var sql = "SELECT dd.title, dd.contentHTML " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code" +
        "   AND c.id = dd.requiring_id  " +
        "WHERE c.id = ? " +
        "   AND dd.language = ?;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [contentID, languageCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getChinhSachBanHangContent = function(callback) {
    var sql = "SELECT * FROM Content " +
        "WHERE content_category_id='6B89C7E1-B3EF-45AF-AA42-7D8053F8C10A' and status<>0;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getGioiThieuContentWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, c.image, dd.title, dd.contentHTML, c.sort_order, c.link as content_link " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "WHERE c.content_category_id='20145F90-55BD-4475-9B7F-A915AC5C9A06' " +
        "   AND c.status > 0 AND c.status IS NOT NULL " +
        "   AND dd.language = ? " +
        "ORDER BY c.sort_order ASC, dd.title ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getLienHeContentWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, c.image, dd.title, dd.contentHTML, c.link as content_link " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "WHERE c.id='a551e55a-3e3c-11e8-b467-0ed5f89f718b' " +
        "   AND dd.language = ? ";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getChinhSachContentWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, c.image, dd.title, dd.contentHTML, c.sort_order, c.link as content_link " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "WHERE c.content_category_id='6B89C7E1-B3EF-45AF-AA42-7D8053F8C10A' " +
        "   AND c.status IS NOT NULL AND c.status > 0 " +
        "   AND dd.language = ? " +
        "ORDER BY c.sort_order ASC, dd.title ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllChinhSachTitlesWithLanguage = function(langCode, callback) {
    var sql = "SELECT c.id, dd.title, c.sort_order " +
        "FROM Content c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "WHERE c.content_category_id='6B89C7E1-B3EF-45AF-AA42-7D8053F8C10A' " +
        "   AND c.status IS NOT NULL AND c.status > 0 " +
        "   AND dd.language = ? " +
        "ORDER BY c.sort_order ASC, dd.title ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getCategoryWithLanguage = function(categoryID, langCode, callback) {
    var sql = "SELECT c.id, dd.title, c.sort_order, c.image, c.parent_id " +
        "FROM ProductCategory c LEFT JOIN DataDirectory dd " +
        "   ON c.entity_code = dd.requiring_entity_code " +
        "   AND c.id = dd.requiring_id " +
        "WHERE c.status IS NOT NULL AND c.status > 0 " +
        "   AND dd.language = ? " +
        "   AND c.id = ? AND c.entity_code='CAT';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, categoryID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllProductCategoriesRootWithLanguage = function(langCode, callback) {
    var sql = "SELECT " + this.productCategorySelect() + " " +
        "FROM " + this.productCategoryFrom() + " " +
        "WHERE " + this.productCategoryAlias() + ".product_category_parent_id IS NULL " +
        "   AND " + this.productCategoryAlias() + ".product_category_entity_code='CAT' " +
        "ORDER BY " + this.productCategoryAlias() + ".product_category_sort_order ASC, " +
        "           " + this.productCategoryAlias() + ".product_category_title ASC;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllBranches = function(langCode, callback) {
    var sql = "SELECT * " +
        "FROM LookupData " +
        "WHERE status IS NOT NULL AND status > 0" +
        "   AND entity_code = 'BRA';";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        var now = api.getNow();
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getAllProductCategoriesChildrenWithLanguage = function(parentID, langCode, callback) {
    var sql = "SELECT " + this.productCategorySelect() + " " +
        "FROM " + this.productCategoryFrom() + " " +
        "WHERE " + this.productCategoryAlias() + ".product_category_parent_id = ? " +
        "   AND " + this.productCategoryAlias() + ".product_category_entity_code='CAT' " +
        "ORDER BY " + this.productCategoryAlias() + ".product_category_sort_order ASC, " +
        "           " + this.productCategoryAlias() + ".product_category_title ASC ";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [langCode, parentID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getProductByProductID = function(productId, callback) {
    var sql = "SELECT pr.code, pr.name FROM Product pr " +
        " WHERE id=? " +
        "   AND status > 0 AND status IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [productId], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.getProductByCategoryID = function(categoryID, callback) {
    var sql = "SELECT * FROM Product " +
        "WHERE product_category_id=? " +
        "   AND status > 0 AND status IS NOT NULL;";
    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        var now = api.getNow();
        connection.query(sql, [categoryID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.validateSocialClientID = function(clientID, callback) {

    var sql = "SELECT u.* " +
        "FROM UserSocial us LEFT JOIN User u " +
        "   ON us.user_id = u.id " +
        "WHERE us.client_id = ?;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [clientID], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};

exports.validateUser = function(username, callback) {

    var sql = "SELECT us.user_name, us.password, us.id " +
        "FROM User us " +
        "WHERE us.user_name=? and us.is_locked = 0;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [username], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};


exports.getUserAdmin = function( callback) {

    var sql = "SELECT * " +
        "FROM User us " +
        "WHERE us.is_confirm=1 and us.type = 1 and us.is_locked=0;";

    // get a connection from the pool
    pool.getConnection(function(err, connection) {
        if(err) { console.log(err); if (callback) {callback(true);} return; }
        // make the query
        connection.query(sql, [], function(err, results) {
            connection.release();
            if(err) { console.log(err); if (callback) {callback(true);} return; }
            if (callback) { callback(false, results); }
        });
    });
};