var test = "ERRO_NOT_FOUND";
var moment = require('moment');
moment.tz.setDefault("Asia/Ho_Chi_Minh");
var fs = require('fs');
var image_json = require('../image-lib.json');
var db = require('../databases/database');
var _this = this;

exports.BASE_URL = "http://lazymining.com/";
exports.FRONT_END = this.BASE_URL+"frontend/";
exports.WEB_NAME = "";

exports.SUCC_LOGOUT = "SUCC_LOGOUT";
exports.SUCC_COUNT_MACHINE = "SUCC_COUNT_MACHINE";
exports.TOKEN_EXIST = "TOKEN_EXIST";
exports.SUCC_EXEC = "SUCC_EXEC";
exports.SUCC_DELETE = "SUCC_DELETE";
exports.SUCC_SIGNUP = "SUCC_SIGNUP";
exports.SUCC_LOGIN = "SUCC_LOGIN";
exports.SUCC_MINERS = "SUCC_MINERS";
exports.SUCC_GET_RIG_CONFIG = "SUCC_GET_RIG_CONFIG";
exports.SUCC_SUBMIT_ROOT_DIR = "SUCC_SUBMIT_ROOT_DIR";
exports.SUCC_DELETE_MINER = "SUCC_DELETE_MINER";
exports.SUCC_UPDATE_PUSH_TOKEN = "SUCC_UPDATE_PUSH_TOKEN";
exports.SUCC_DOWNLOAD_LINK = "SUCC_DOWNLOAD_LINK";
exports.SUCC_RUN_BATCH = "SUCC_RUN_BATCH";
exports.SUCC_RESET_MINER = "SUCC_RESET_MINER";
exports.SUCC_SEND_RESET_EMAIL = "SUCC_SEND_RESET_EMAIL";
exports.SUCC_UPDATE_PASSWORD = "SUCC_UPDATE_PASSWORD";
exports.SUCC_LOG_OUT = "SUCC_LOG_OUT";
exports.SUCC_UPDATE_RIG_MACHINE = "SUCC_UPDATE_RIG_MACHINE";
exports.SUCC_UPDATE_FEED_URL_AND_VERSION = "SUCC_UPDATE_FEED_URL_AND_VERSION";


exports.ERRO_DELETE_MINER = "ERRO_DELETE_MINER";

exports.ERRO_TOKEN_NOT_EXIST = "ERRO_TOKEN_NOT_EXIST";
exports.ERRO_EMAIL_NOT_FOUND = "ERRO_EMAIL_NOT_FOUND";
exports.ERRO_NOT_FOUND = "ERRO_NOT_FOUND";
exports.ERRO_INVALID_AUTH = "ERRO_INVALID_AUTH";
exports.ERRO_ACCOUNT_EXISTING = "ERRO_ACCOUNT_EXISTING";
exports.ERRO_FILE_NOT_FOUND = "ERRO_FILE_NOT_FOUND";

exports.ENUM_ENTITY_CODE = {
    BRA: "BRA", // Địa chỉ -- table LookupData
    MAN: "MAN", // quản lý chính sách bán hàng -- table Content
    MON: "MON",  // món ăn ngon -- table Content
    TIN: "TIN",  // tin tuc su kien -- table Content
    CGT: "CGT", // Giới thiệu -- table ContentCategory
    CBH: "CBH", // Chính sách bán hàng -- table ContentCategory
    CMA: "CMA", // Cẩm nang món ăn -- table ContentCategory
    PER: "PER", // Person -- table Person, UserSocial
    PRD: "PRD", // Product -- table Product
    CAT: "CAT", // ProductCategory -- table ProductCategory
    GTU: "GTU", // giới thiệu -- table Content,
    HOM: "HOM",  // slider hình ảnh -- table Slider
    EHC: "EHC",  // slider hình ảnh -- table Slider
    EBP: "EBP",  // banner sản phẩm -- table Content
    EBC: "EBC",  // banner món ngon -- table Content
    ETK: "ETK",  // banner tin tuc su kien -- table Content
    ELH: "ELH",  // banner liên hệ -- table Content
    PTN: "PTN", // table Promotion
    PSO: "PSO", // promotion giảm giá -- table Promotion va PromotionDetail
    PCP: "PCP", // promotion coupon -- table PromotionDetail
    PGT: "PGT", // promotion gift -- table Promotion va PromotionDetail
    TTP: "TTP", // thành phố -- table LookupData
    QUH: "QUH", // quận/huyện -- table LookupData
    PHU: "PHU", // phường/xã -- table LookupData
    AAA: "AAA", // quan ly Footer Gioi Thieu
    MTA: "MTA", // meta - backend
    PKL: "PKL",  // promotion product gift
    GIF: "GIF",  // for gift - table ProductCategory
    COU: "COU",  // promotion product gift - table Promotion
    BND: "BND"  // Thuong hiệu - table LookupData

};

exports.getNow = function () {
    var now = moment().format("YYYY-MM-DDTHH:mm:ss.SSSZ");
    return now;
};

exports.getPreviousDayFromNow = function () {
    var date = moment().subtract(1, 'days').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
    return date;
};

exports.getTwoBackDayFromNow = function () {
    var date = moment().subtract(2, 'days').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
    return date;
};

exports.getServerAddressBase = function (req) {
    var url = req.protocol + '://' + req.get('host')+"/";
    return url;
};

exports.getServerAddressUpload = function (req) {
    var url = req.protocol + '://' + req.get('host')+"/upload/";
    return url;
};

exports.getPreviousWeekDayFromNow = function () {
    var date = moment().subtract(7, 'days').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
    return date;
};

exports.getNowForImageLib = function () {
    var now = moment().format('MMMM Do YYYY, h:mm:ss a');
    return now;
};

exports.getNowEmail = function () {
    var now = moment().format('ddd MMMM D, YYYY');
    return now;
};

exports.getSqlNow = function () {
    var now = moment().format("YYYY-MM-DD HH:mm:ss");
    return now;
};

exports.convertDate = function (date, endOfDay) {
    var m = moment(date, 'MM/DD/YYYY');
    if (endOfDay == true) {
        m.set({hour:23,minute:59,second:59});
    }
    var s1 = m.format('YYYY-MM-DDTHH:mm:ss.SSSZ');
    return s1;
};
exports.randomString = function (number) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < number; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
};

exports.revertDate = function (date) {
    var s1 = moment(date, 'YYYY-MM-DDTHH:mm:ss.SSSZ').format('MM/DD/YYYY');
    return s1;
};

exports.revertDatePromotionFrontEnd = function (date) {
    var s1 = moment(date, 'YYYY-MM-DDTHH:mm:ss.SSSZ').format('DD/MM/YYYY HH:mm:ss ');
    return s1;
};

exports.sync_image_library = function (req,callback) {
    var walkPath = 'upload';
    var thiz = this;
    var array = [];
    var walk = function (temp, dir, done) {
        fs.readdir(dir, function (error, list) {
            if (error) {
                return done(error);
            }

            var i = 0;

            (function next () {
                var file = list[i++];

                if (!file) {
                    return done(null);
                }

                file = dir + '/' + file;

                fs.stat(file, function (error, stat) {

                    if (stat && stat.isDirectory()) {
                        walk(file, function (error) {
                            next();
                        });
                    } else {
                        // do stuff to file here
                        var file_name = file.substr(7,file.length);
                        var url = req.protocol + '://' + req.get('host')+"/upload/";
                        var full = url+file_name;
                        var exist = false;
                        var date = null;
                        console.log("temp "+ JSON.stringify(temp));
                        for(var index=0;index<temp.length;index++){
                            var temp1 = temp[index];
                            if(temp1.image == full && temp1.name == file_name){
                                temp[index].use_date = _this.getNowForImageLib();
                                exist = true;
                                date = temp1.use_date;
                                break;
                            }
                        }
                        if(exist && !date && date.length > 0) {
                            array.push({"image": full, "thumb": full, "folder": "Upload", "name": file_name,"use_date": date});
                        }else {
                            array.push({"image": full, "thumb": full, "folder": "Upload", "name": file_name});
                        }
                        next();
                    }
                });
            })();
        });
    };

// optional command line params
//      source for walk path
    process.argv.forEach(function (val, index, array) {
        if (val.indexOf('source') !== -1) {
            walkPath = val.split('=')[1];
        }
    });

    console.log('-------------------------------------------------------------');
    console.log('processing...');
    console.log('-------------------------------------------------------------');
    db.getImageLibJson(function (error, text) {
        if (error) return;
        var temp = JSON.parse(text[0].value);

        walk(temp,walkPath, function (error) {
            if (error) {
                throw error;
            } else {
                console.log('-------------------------------------------------------------');
                console.log('finished.');
                console.log('-------------------------------------------------------------');
                array.sort(function (a, b) {
                    var key1 = a.use_date;
                    var key2 = b.use_date;

                    if(key1 == null && key2 != null){
                        return 1;
                    }else if(key1 != null && key2 == null){
                        return -1;
                    }else {
                        if (key1 < key2) {
                            return 1;
                        } else if (key1 == key2) {
                            return 0;
                        } else {
                            return -1;
                        }
                    }


                });
                callback(JSON.stringify(array));
            }
        });
    })
};

exports.getResponse = function(response_code, data, description) {
    var response = {};
    response.response_code = response_code;
    response.data = data;
    response.description = description;
    response.test = "!";
    return response;
};