var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var utility = require('./utility');
const uuidv1 = require('uuid/v1');
var api = require('../api/response');
var formidable = require('formidable')
var util = require('util');
var fs = require('fs');
var multipart = require('connect-multiparty');
var multipartMiddleware = multipart();




router.post('/uploader', multipartMiddleware, function(req, res) {

    fs.readFile(req.files.upload.path, function (err, data) {
        var form = new formidable.IncomingForm(),
            files = [],
            fields = [];

        form.uploadDir = "upload";
        var newPath = form.uploadDir + "/" + req.files.upload.name;
        fs.writeFile(newPath, data, function (err) {
            if (err) console.log({err: err});
            else {
                html = "";
                html += "<script type='text/javascript'>";
                html += "    var funcNum = " + req.query.CKEditorFuncNum + ";";
                html += "    var url     = \"/upload/" + req.files.upload.name + "\";";
                html += "    var message = \"Uploaded file successfully\";";
                html += "";
                html += "    window.parent.CKEDITOR.tools.callFunction(funcNum, url, message);";
                html += "</script>";
                api.sync_image_library(req,function (text) {
                    db.updateImageLibJson(text,function (error23, rsos) {

                    })
                });
                res.send(html);
            }
        });
    });
});


router.post('/upload', function (req, res, next) {
    var form = new formidable.IncomingForm(),
        files = [],
        fields = [];

    form.uploadDir = "upload";
    var file_name = "";
    form
        .on('field', function (field, value) {
            // console.log(field, value);
            fields.push([field, value]);
        })
        .on('file', function (field, file) {
            // console.log(field, file);
            files.push([field, file]);
            fs.rename(file.path, form.uploadDir + "/" + file.name);
            file_name = file.name;
        })
        .on('end', function () {
            console.log('-> upload done');
            // res.writeHead(200, {'content-type': 'text/plain'});
            // res.write('received fields:\n\n '+util.inspect(fields));
            // res.write('\n\n');
            // res.end('received files:\n\n '+util.inspect(files));
            console.log(9876);
            api.sync_image_library(req,function (text) {
                db.updateImageLibJson(text,function (error23, rsos) {

                })
            });
            res.json(api.getResponse(api.SUCC_EXEC, file_name, ""));

        });
    form.parse(req);
});

router.post('/', function (req, res, next) {
    var form = new formidable.IncomingForm(),
        files = [],
        fields = [];

    form.uploadDir = "upload";
    var file_name = "";
    form
        .on('field', function (field, value) {
            // console.log(field, value);
            fields.push([field, value]);
        })
        .on('file', function (field, file) {
            // console.log(field, file);
            files.push([field, file]);
            fs.rename(file.path, form.uploadDir + "/" + file.name);
            file_name = file.name;
        })
        .on('end', function () {
            console.log('-> upload done');
            // res.writeHead(200, {'content-type': 'text/plain'});
            // res.write('received fields:\n\n '+util.inspect(fields));
            // res.write('\n\n');
            // res.end('received files:\n\n '+util.inspect(files));
            console.log(9876);
            api.sync_image_library(req,function (text) {
                db.updateImageLibJson(text,function (error23, rsos) {

                })
            });
            res.json(api.getResponse(api.SUCC_EXEC, file_name, ""));
        });
    form.parse(req);
});
module.exports = router;
