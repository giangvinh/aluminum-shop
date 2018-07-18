var moment = require('moment');
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var db = require('../databases/database');

var nodemailer = require('nodemailer');


exports.sendEmail = function (receiver_email,subject,html) {

    secure = false;

    var email_name = "email_for_host";
    var password_name = "password_for_host";
    var mail_host_url = "mail_host_url";
    var mail_host_port = "mail_host_port";


    db.getConfig(email_name, function (error2, emailObj) {
        if (error2) {
            return;
        }
        db.getConfig(password_name, function (error3, passwordObj) {
            if (error3) {
                return;
            }
            db.getConfig(mail_host_url, function (error4, hostObj) {
                if (error4) {
                    return;
                }
                db.getConfig(mail_host_port, function (error5, portObj) {
                    if (error5) {
                        return;
                    }

                    var auth_user = emailObj[0].value;
                    var auth_password = passwordObj[0].value;
                    var host = hostObj[0].value;
                    var port = portObj[0].value;

                    var options = {
                        host: host,
                        port: port
                    };
                    var config = require('../config.json');
                    console.log("config "+ JSON.stringify(config));
                    if (config.env != "prod") {
                        var auth = {
                            user: auth_user,
                            pass: auth_password
                        };
                        options.port = port;
                        options.auth = auth;
                        var tls = {
                            // do not fail on invalid certs
                            rejectUnauthorized: false
                        };
                        options.tls = tls;
                    }
                    console.log("options "+ JSON.stringify(options));


                    var transporter = nodemailer.createTransport(options);
                    const mailOptions = {
                        from: auth_user, // sender address
                        to: receiver_email, // list of receivers
                        subject: subject,
                        html: html
                        // attachments: attachment
                    };
                    transporter.sendMail(mailOptions, function (err, info) {
                        if (err)
                            console.log(err);
                        else {
                            console.log(info);
                        }
                    });
                })
            })
        })
    });



};