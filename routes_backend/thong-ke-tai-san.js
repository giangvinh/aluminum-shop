var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');


router.get('/', function (req, res, next) {

    db.getSanPhamDV(function (error, data) {
        if(error){
            return;
        }
        res.render('admin/thong-ke-tai-san', {data:data});
    })

});


module.exports = router;
