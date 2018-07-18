var express = require('express');
var router = express.Router();
var db = require('../databases/database');
const uuidV4 = require('uuid/v4');
var crypto = require('crypto');
var api = require('../api/response');

// GET home page
router.get('/', function(req, res, next) {
    if(req.session.username) {
        res.redirect('danh-sach-san-pham-don-vi');
    }else {
        res.render('admin/loginPage');
    }

});


router.post('/validate', function (req, res) {
    if(req.session.token && req.session.email) {
        res.json(api.getResponse(api.TOKEN_EXIST, null, "Response from login"));
    }else {
        res.json(api.getResponse(api.ERRO_TOKEN_NOT_EXIST, null, "Response from login"));
    }
});

router.post('/', function (req, res) {

    var obj = req.body;
    var username = obj.username;
    var app_code_name = obj.app_code_name;
    var app_name = obj.app_name;
    var app_version = obj.app_version;
    var platform = obj.platform;
    var user_agent = obj.user_agent;
    var product = obj.product;
    var product_sub = obj.product_sub;
    var vendor = obj.vendor;

    function getClientIp(req) {
        return (req.headers["X-Forwarded-For"] ||
            req.headers["x-forwarded-for"] ||
            '').split(',')[0] ||
            req.client.remoteAddress;
    }
    var ip = getClientIp(req);

    var password = crypto.createHash('md5').update(obj.password).digest("hex");

    db.validateUser(username, function (err, results) {
        if (err) {
            return;
        }
        if (results.length > 0) {

            var socket = req.app.get('socket');
            if (username == results[0].user_name && password == results[0].password) {
                req.session.username = username;
                req.session.user_id = results[0].id;
                res.json(api.getResponse(api.SUCC_LOGIN, results[0].id, "Response from login"));
            } else {
                res.json(api.getResponse(api.ERRO_INVALID_AUTH, null, "Wrong username or password."));
            }

        } else {
            res.json(api.getResponse(api.ERRO_INVALID_AUTH, null, "Wrong username or password."));
        }
    });




});
module.exports = router;
