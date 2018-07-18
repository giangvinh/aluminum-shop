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


    function format_data(data) {
        var list = [];
        for (var index = 0; index < data.length; index++) {
            var obj = data[index];
            var master_group = obj.master_group;
            var child_group = obj.child_group;
            if (index == 0) {
                var array = [];
                array.push(obj);
                var child_obj = {
                    name: child_group,
                    array: array
                }
                var temp  = [];
                temp.push(child_obj);
                list.push({
                    master_group: master_group,
                    child_group: temp
                })
            } else {
                if (master_group == list[list.length - 1].master_group) {
                    var list_number = list.length - 1;
                    var child_group_number = list[list_number].child_group.length-1;
                    if (child_group == list[list_number].child_group[child_group_number].name) {
                        list[list_number].child_group[child_group_number].array.push(obj);
                    } else {
                        var array = [];
                        array.push(obj);
                        var child_obj = {
                            name: child_group,
                            array: array
                        }
                        list[list_number].child_group.push(child_obj);
                    }
                } else {
                    var array = [];
                    array.push(obj);
                    var child_obj = {
                        name: child_group,
                        array: array
                    }
                    var temp  = [];
                    temp.push(child_obj);
                    list.push({
                        master_group: master_group,
                        child_group: temp
                    })
                }
            }
        }
        return list;
    }

    db.getAllPermission(function (error1, permisionObj) {
        if (error1) {
            return;
        }
        var permission_list = format_data(permisionObj);
        db.getUser_UserRoleExludeId(id, function (error3, user_in_select) {
            if(error3){
                return;
            }
            db.getUser_UserRoleLikeId(id, function (error3, user_in_table) {
                if (error3) {
                    return;
                }
                db.getRoleById(id, function (error, data) {
                    if (error) {
                        return;
                    }
                    db.getRolePermissionByRoleId(id, function (error, role_permission) {
                        if (error) {
                            return;
                        }

                        var permission_exist = {};
                        for(var index=0;index<role_permission.length;index++){
                            permission_exist[role_permission[index].permission_id] = true;
                        }
                        res.render('admin/sua-quyen', {
                            data: data[0],
                            role_id: id,
                            permission_exist: permission_exist,
                            permission_list: permission_list,
                            user_in_select: user_in_select,
                            user_in_table: user_in_table
                        });
                    })
                })
            })
        })

    })


});


router.post('/sua', function (req, res, next) {
    var obj = req.body;
    var id = obj.id;
    var des = obj.des;
    var name = obj.name;
    var list_permission = obj.listPermission;
    var created_date = api.getNow();
    var created_by = req.session.username;
    db.updateRoleById(name, des, id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        db.deleteRolePermission(id,function (error2, rs) {
            if(error2){
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            if (list_permission.length == 0) {
                res.json(api.getResponse(api.SUCC_EXEC, "", ""));
            } else {
                var list_id = [];
                for (var index = 0; index < list_permission.length; index++) {
                    var temp_id = uuidv1();
                    list_id.push(temp_id);
                }
                db.insertRolePermission(id, list_id, list_permission, created_date, created_by, function (error2, rs4) {
                    if (error2) {
                        return;
                    }
                    res.json(api.getResponse(api.SUCC_EXEC, "", ""));
                })
            }
        })
    })
});


router.post('/them-user', function (req, res, next) {
    var obj = req.body;
    var role_id = obj.role_id;
    var user_id = obj.user_id;
    var id = uuidv1();
    var created_date = api.getNow();
    var created_by = req.session.username;

    db.insertUserRole(id,role_id,user_id,created_date,created_by,null,null, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, id, ""));
    })
});

router.post('/xoa-user', function (req, res, next) {
    var obj = req.body;
    var role_id = obj.role_id;
    var user_id = obj.user_id;

    db.deleteUserRole(role_id,user_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC,"", ""));
    })
});


module.exports = router;
