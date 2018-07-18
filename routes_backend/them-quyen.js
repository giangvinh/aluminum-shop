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

    db.getUserAdmin(function (error1, userList) {
        if (error1) {
            return;
        }
        console.log(2343244);
        console.log(userList);

        db.getAllPermission(function (error, data) {
            if (error) {
                return;
            }
            console.log(56546546456);
            var list = format_data(data);
            console.log(list);
            res.render('admin/them-quyen', {
                data: list,
                user_list: userList
            });
        })
    })

});


router.post('/them', function (req, res, next) {

    var obj = req.body;
    var name = obj.name;
    var des = obj.des;
    var list_permission = obj.listPermission;
    var user_array = obj.user_array;
    var id = uuidv1();
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;

    db.getRoleByName(name, function (er, codeRs) {
        if (er) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }
        if (codeRs.length > 0) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Quyền này đã tồn tại rồi"));
            return;
        } else {
            db.insertRole(id, name, des, created_date, created_by, function (error, rs) {
                if (error) {
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                    return;
                }
                if (list_permission.length == 0) {
                    if (user_array.length == 0) {
                        res.json(api.getResponse(api.SUCC_EXEC, id, ""));
                    } else {
                        var list_id = [];
                        for (var index = 0; index < user_array.length; index++) {
                            var temp_id = uuidv1();
                            list_id.push(temp_id);
                        }
                        db.insertUserRoleCustom(id, list_id, user_array, created_date, created_by, function (error2, rs4) {
                            if (error2) {
                                return;
                            }
                            res.json(api.getResponse(api.SUCC_EXEC, id, ""));
                        })
                    }

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
                        if (user_array.length == 0) {
                            res.json(api.getResponse(api.SUCC_EXEC, id, ""));
                        } else {
                            var list_temp = [];
                            for (var index = 0; index < user_array.length; index++) {
                                var temp_id = uuidv1();
                                list_temp.push(temp_id);
                            }
                            db.insertUserRoleCustom(id, list_temp, user_array, created_date, created_by, function (error2, rs4) {
                                if (error2) {
                                    return;
                                }
                                res.json(api.getResponse(api.SUCC_EXEC, id, ""));
                            })
                        }

                    })
                }

            })
        }
    })
});

module.exports = router;
