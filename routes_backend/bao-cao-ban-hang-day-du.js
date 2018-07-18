var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');


function get_data_detail(start_date, end_date, callback) {
    db.getDataStatisticalDetail(start_date,end_date,function (error, data) {
        if (error) {
            return;
        }

        callback(data);

    })
}



// GET home page
router.get('/', function (req, res, next) {
    var obj = req.body;
    var previous_date = api.getPreviousWeekDayFromNow();
    var now = api.getNow();

    db.getDataStatisticalDetail(now,previous_date,function (error, data) {



        res.render('admin/bao-cao-ban-hang-day-du', {
            data:data
        });
    });


});

router.post('/get-data-detail', function (req, res, next) {
    var obj = req.body;
    var option_sort = obj.option_sort;
    var start_date = obj.start_date;
    var end_date = obj.end_date;

    console.log(6677);
    console.log("start_date "+ start_date);
    console.log("end_date "+ end_date);
    console.log("option_sort "+ option_sort);
    get_data_detail(start_date,end_date, function (data) {
        console.log("data "+ data.length);
        console.log(9898989);
        res.json(api.getResponse(api.SUCC_EXEC, data, ""));
    })

});


router.post('/get-data-person', function (req, res, next) {
    var obj = req.body;
    var start_date = obj.start_date;
    var end_date = obj.end_date;
    get_data_person(start_date,end_date, function (data) {
        console.log("data "+ data.length);
        console.log(9898989);
        res.json(api.getResponse(api.SUCC_EXEC, data, ""));
    })


});

function get_data_person(start_date, end_date, callback) {
    db.getStaticsSortPerson(1,start_date,end_date,function (error,data) {
        if (error) {
            return;
        }
        callback(data);
    })
}


router.post('/get-data-order', function (req, res, next) {
    var obj = req.body;
    var start_date = obj.start_date;
    var end_date = obj.end_date;
    get_data_order(start_date,end_date, function (data) {
        console.log("data "+ data.length);
        console.log(9898989);
        res.json(api.getResponse(api.SUCC_EXEC, data, ""));
    })


});

function get_data_order(start_date, end_date, callback) {
    db.getStaticsSortOrder(1,start_date,end_date,function (error,data) {
        if (error) {
            return;
        }
        callback(data);
    })
}


module.exports = router;
