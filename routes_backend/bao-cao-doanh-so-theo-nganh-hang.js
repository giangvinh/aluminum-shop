var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');


router.post('/get-data-custom-nostatus', function (req, res, next) {
    var obj = req.body;
    var start_date = obj.start_date;
    var end_date = obj.end_date;

    console.log(454545456);
    console.log("start_date "+ start_date);
    console.log("end_date "+ end_date);
    get_data_nostatus(start_date,end_date,function (data) {
        console.log("data "+ data.length);
        console.log(9898989);
        res.json(api.getResponse(api.SUCC_EXEC, data, ""));
    })

});

function get_data_nostatus(start_date, end_date, callback) {

    db.getDataNganhHangCap2(start_date,end_date,function (error, data) {
        if (error) {
            return;
        }
        callback(data);

    })

}



// GET home page
router.get('/', function (req, res, next) {
    var obj = req.body;

    var previous_date = api.getPreviousDayFromNow();
    var now = api.getNow();

    db.getDataNganhHangCap2(now,previous_date,function (error, data) {

        if (error) {
            return;
        }

        res.render('admin/bao-cao-doanh-so-theo-nganh-hang', {
            data:data
        });
    });


});





module.exports = router;
