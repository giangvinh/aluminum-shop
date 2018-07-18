var moment = require('moment');
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var db = require('../databases/database');
var api = require('../api/response');
const uuidv1 = require('uuid/v1');


exports.sendNotification = function (order_id, email, socket) {

    db.getUserAdmin(function (error3, adminList) {
        if(error3){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }

        for(var index=0;index<adminList.length;index++){
            var obj = adminList[index];
            var notif_id = uuidv1();
            var titleNotification = "Nhận 01 đơn hàng";
            var descriptionNotification = "Người dùng [" + email + "] vừa tạo đơn hàng mới thành công";

            var icon = "glyphicon glyphicon-file";
            db.insertNotification(notif_id,titleNotification,icon,
                descriptionNotification,obj.id,api.getNow(),
                "System","danh-sach-don-hang",0,1,order_id,"",1,function (error1, resultA) {
                    if(error1){
                        return;
                    }
                });

            var socket = socket;
            if(socket) {
                if(socket.nsp.connected[obj.socket_id]){
                    socket.nsp.connected[obj.socket_id].emit('on-notification', titleNotification, descriptionNotification, icon, "danh-sach-lien-he");
                }

            }
        }

    })

};