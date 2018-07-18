var express = require('express');
var router = express.Router();
var db = require('../databases/database');
const uuidV4 = require('uuid/v4');
var crypto = require('crypto');
var api = require('../api/response');
var session = require('express-session');
var utility = require('./utility');

// GET home page
router.get('/', function (req, res, next) {
    var url = req.protocol + '://' + req.get('host')+"/upload/";
    res.render('admin/email-order', {address: url
    });
});

module.exports = router;
