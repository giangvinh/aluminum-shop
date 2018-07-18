var express = require('express');
var router = express.Router();
var db = require('../databases/database');


router.get('/', function(req, res, next) {
    console.log(24424);
    var token = req.query.token;
    if (token) {
        db.countToken(token,function (e, result) {
            if(e){
                res.render("error");
                return;
            }

            if(result && result.length > 0 && result[0].count > 0){
                res.render('changeUserPasswordPage', {
                   token: token
                });
            } else {
                res.render("error");
            }
        });

    } else {
        console.log(255555);
        res.render('admin/resetPasswordUserPage',{});
    }



});


module.exports = router;
