var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
const uuidv1 = require('uuid/v1');
var crypto = require('crypto');

// GET home page
router.get('/', function (req, res, next) {
    db.getAllRole(function (error, data) {
        res.render('admin/them-user-admin', {
            data:data
        });
        console.log(data);
    })
});


router.post('/them', function (req, res, next) {

    var obj = req.body;
    var username = obj.username;
    var password = crypto.createHash('md5').update(obj.password).digest("hex");

    var id = uuidv1();

    var entity_code = api.ENUM_ENTITY_CODE.BND;
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;
    var selected_role=obj.selected_role;


    db.getUserByUsername(username,function (er, codeRs) {
        if(er){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if(codeRs.length > 0){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Người dùng này đã tồn tại rồi"));
            return;
        }else {
            db.insertUser(id,username,password,1,1,0,created_date,0,created_date,created_by,api.ENUM_ENTITY_CODE.PER,null,function (error, rs) {
                if (error) {
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                    return;
                }

            })
            for(i=0;i<selected_role.length;i++){
                var user_role_id = uuidv1();
                var role_id=selected_role[i];
                db.insertUserRole(user_role_id, role_id, id, created_date, created_by, null, null,function (error, rs) {
                    if (error) {
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                        return;
                    }
                })
            }

            res.json(api.getResponse(api.SUCC_EXEC, {
                id: id
            }, ""));

        }
    })

});
// function get_Role_id(role_name, callback){
//     db.getRoleIdByName(role_name,function (er, codeRs) {
//         if (er) {
//             res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
//             return;
//         }
//
//         var role_id_unit=codeRs[0].role_id;
//         console.log(9384938493894);
//         console.log(role_id_unit);
//         console.log(role_name);
//         callback(role_id_unit);
//     })
//
// }

module.exports = router;
