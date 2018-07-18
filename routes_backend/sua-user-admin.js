var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
const uuidv1 = require('uuid/v1');
const html2pug = require('html2pug')
var crypto = require('crypto');

// GET home page
router.get('/', function (req, res, next) {

    var id = req.query.id;
    db.getUserById(id,function (error, data) {
        if(error) return;
        console.log(data);
        console.log(454645);
        var user_name=data[0].user_name;
        var password=data[0].password;
        var user_id=data[0].id;
        res.render('admin/sua-user-admin', {
            user_name:user_name,
            password:password,
            user_id:user_id
        });
    })

});







router.post('/sua', function (req, res, next) {
    var obj = req.body;
    var username = obj.username;
    var password = crypto.createHash('md5').update(obj.password).digest("hex");
    var first_password=obj.password;
    var un_selected_role=obj.un_selected_role;
    var selected_role = obj.selected_role;
    var user_id=obj.user_id;

    var created_date = api.getNow();
    var created_by = req.session.username;

    db.selectAllUserRole(user_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(result!=null){
            for(i=0;i<un_selected_role.length;i++){
                for(j=0;j<result.length;j++){
                    if(result[j].role_id==un_selected_role[i]){
                        delete_id= result[j].id;
                        db.xoaUserRole(delete_id, function (error, result) {
                            if (error) {
                                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                                return;
                            }
                        })
                    }


                }
            }
            var flagRole=false;

            for(i=0;i<selected_role.length;i++){
                for(j=0;j<result.length;j++){
                    if(result[j].role_id==selected_role[i]){
                        flagRole=true;
                        break;
                    }
                }
                if (flagRole==false){
                    var user_role_id = uuidv1();
                    var role_id=selected_role[i];
                    db.insertUserRole(user_role_id, role_id, user_id, created_date, created_by, null, null,function (error, rs) {
                        if (error) {
                            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                            return;
                        }
                    })
                }
                flagRole=false;
            }

        }

    })

    db.updateUserPassword(username,password, first_password, function (error, result) {
            if (error) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            res.json(api.getResponse(api.SUCC_EXEC, null, ""));
    })
});


module.exports = router;
