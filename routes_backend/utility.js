var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var api = require('../api/response');
var session = require('express-session');
var json = require("../image-lib.json");
const uuidv1 = require('uuid/v1');

var SnippetPreview = require( "yoastseo" ).SnippetPreview;
var App = require( "yoastseo" ).App;
var Researcher = require( "yoastseo" ).Researcher;
var Paper = require( "yoastseo" ).Paper;

exports.reDirectToLogin = function(res) {
    res.redirect("login");
};

exports.reDirectToLogin1 = function(res) {
    res.redirect("../login");
};

exports.renderLogin = function(res) {
    res.render('loginPage');
};

exports.renderLogin1 = function(res) {
    res.render('../loginPage');
};

exports.returnToErrorPage = function(res) {
    res.redirect("error");
};

router.post('/getUsername', function (req, res, next) {
    var username = req.session.username;
    var user_id = req.session.user_id;
    res.json(api.getResponse(api.SUCC_EXEC, {
        username: username,
        user_id: user_id
    }, ""));
});

router.get('/getImageList', function (req, res, next) {
    db.getImageLibJson(function (error, text) {
        if(error) return;
        res.json(JSON.parse(text[0].value));
    })
});

router.post('/getUserRole', function (req, res, next) {
    // var user_role = req.session.user_role;
    var user_id = req.session.user_id;
    db.getUnRoleByUserId(user_id,function (error,array) {
        if(error){
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, {
                user_role: array,
                user_id: user_id
            }
            , ""));
    })

});

router.post('/update-main-content', function (req, res, next) {

    var obj = req.body;
    var html_vi = obj.html_vi;
    var html_en = obj.html_en;
    var id = obj.id;
    var entity_code = obj.entity_code;
    var meta_title_vi = obj.meta_title_vi;
    var meta_description_vi = obj.meta_description_vi;
    var meta_keyword_vi = obj.meta_keyword_vi;
    var meta_description_en = obj.meta_description_en;
    var meta_keyword_en = obj.meta_keyword_en;
    var meta_title_en = obj.meta_title_en;

    var updated_date = api.getNow();
    var updated_by = req.session.username;
    var status = 1;
    var rating = 0;
    db.updateMainContent(entity_code, updated_by, updated_date, "", html_vi, status, id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
            return;
        }

        db.updateMucDuLieuMainMeta(id, html_vi, updated_by, updated_date, entity_code, 'vi', meta_keyword_vi,meta_description_vi,meta_title_vi, function (e1, ressult) {
            if (e1) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật vào mục dữ liệu tiếng việt"));
                return;
            }
            db.updateMucDuLieuMainMeta(id, html_en, updated_by, updated_date, entity_code, 'en', meta_keyword_en,meta_description_en,meta_title_en, function (e3, ressult) {
                if (e3) {
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật vào mục dữ liệu tiếng anh"));
                    return;
                }
                res.json(api.getResponse(api.SUCC_EXEC, null, ""));

            });

        });




    })


});



router.post('/get-language-content', function (req, res, next) {

    var obj = req.body;
    var content_id = obj.content_id;
    var entity_code = obj.entity_code;
    var language = obj.language;

    db.getMucDuLieu(entity_code, language, content_id, function (error3, content) {
        if (error3) {
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, content[0], ""));
    });

});

router.post('/get-banner-content', function (req, res, next) {

    var obj = req.body;
    var banner_content_id = obj.banner_content_id;

    db.getBannerContent(banner_content_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, ""));
            return;
        }

        res.json(api.getResponse(api.SUCC_EXEC, result[0], ""));
    });

});

router.post('/get-content', function (req, res, next) {

    var obj = req.body;
    var content_id = obj.content_id;

    db.getContentModernByID(content_id, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, ""));
            return;
        }

        res.json(api.getResponse(api.SUCC_EXEC, result[0], ""));
    });



});


router.post('/add-content', function (req, res, next) {
    var obj = req.body;
    var tag = obj.tag;
    var order = obj.order;
    var image = obj.image;
    var image_large = obj.image_large;
    var image_banner = obj.image_banner;
    var content_link = obj.banner_link;
    var title_vi = obj.title_vi;
    var des_vi = obj.des_vi;
    var html_vi = obj.html_vi;
    var title_en = obj.title_en;
    var des_en = obj.des_en;
    var html_en = obj.html_en;
    var content_category_id = obj.category_id;
    var id = uuidv1(); // ⇨ 'f64f2940-fae4-11e7-8c5f-ef356f279131'
    var entity_code = obj.entity_code;
    var created_date = api.getNow();
    var meta_title_vi = obj.meta_title_vi;
    var meta_description_vi = obj.meta_description_vi;
    var meta_keyword_vi = obj.meta_keyword_vi;
    var meta_description_en = obj.meta_description_en;
    var meta_keyword_en = obj.meta_keyword_en;
    var meta_title_en = obj.meta_title_en;
    var created_by = req.session.username;
    var status = 1;
    db.insertMonAnNgon(id, title_vi, tag, des_vi, html_vi, entity_code,
        created_date, created_by, status, order, image, image_large,
        image_banner, content_category_id, content_link, function (error, result) {
            if (error) {
                console.log(error);
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }
            var idVi = uuidv1(); // ⇨ 'f64f2940-fae4-11e7-8c5f-ef356f279131'

            db.insertMucDuLieu(id,"",title_vi,des_vi,html_vi,created_by,created_date,entity_code,status,"vi",meta_keyword_vi,meta_description_vi,meta_title_vi,idVi, function (e1, ressult) {
                if (e1) {
                    console.log(e1);
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "không thể nhập dữ liệu tiếng việt"));
                    return;
                }
                var idEn = uuidv1(); // ⇨ 'f64f2940-fae4-11e7-8c5f-ef356f279131'

                db.insertMucDuLieu(id,"",title_en,des_en,html_en,created_by,created_date,entity_code,status,"en",meta_keyword_en,meta_description_en,meta_title_en,idEn, function (e1, ressult) {
                    if (e1) {
                        console.log(e1);
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "không thể nhập dữ liệu tiếng anh"));
                        return;
                    }
                    res.json(api.getResponse(api.SUCC_EXEC, {
                        content_id: id
                    }, ""));
                });
            });
        });
});

router.post('/update-content', function (req, res, next) {

    var obj = req.body;
    var tag = obj.tag;
    var order = obj.order;
    var image = obj.image;
    var imageLarge = obj.image_large;
    var image_banner = obj.image_banner;
    var title_vi = obj.title_vi;
    var des_vi = obj.des_vi;
    var html_vi = obj.html_vi;
    var title_en = obj.title_en;
    var des_en = obj.des_en;
    var html_en = obj.html_en;
    var id = obj.id;
    var entity_code = obj.entity_code;
    var updated_date = api.getNow();
    var updated_by = req.session.username;
    var status = 1;
    var meta_title_vi = obj.meta_title_vi;
    var meta_description_vi = obj.meta_description_vi;
    var meta_keyword_vi = obj.meta_keyword_vi;
    var meta_description_en = obj.meta_description_en;
    var meta_keyword_en = obj.meta_keyword_en;
    var meta_title_en = obj.meta_title_en;

    var content_link = obj.banner_link;

    db.updateLargeImage(imageLarge, id);
    db.updateBannerImage(image_banner, id);
    db.updateLinkBanner(content_link, id);


    db.updateContent(entity_code,updated_by,updated_date,title_vi,tag,html_vi,status,order,image,id,function (error, result) {
        if(error){
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Lỗi mạng"));
            return;
        }
        db.updateMucDuLieu(id,"",title_vi,des_vi,html_vi,updated_by,updated_date,meta_keyword_vi,meta_description_vi,meta_title_vi,entity_code,"vi",function (error1, a) {
            if(error1){
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật mục dữ liệu tiếng việt"));
                return;
            }
            db.updateMucDuLieu(id,"",title_en,des_en,html_en,updated_by,updated_date,meta_keyword_en,meta_description_en,meta_title_en,entity_code,"en",function (error1, a) {
                if(error1){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể cập nhật mục dữ liệu tiếng anh"));
                    return;
                }
                res.json(api.getResponse(api.SUCC_EXEC, null, ""));

            })
        })
    });
});

router.post('/update-banner-content', function (req, res, next) {

    var obj = req.body;
    var content_id = obj.content_id;
    var content_link = obj.banner_link;
    var content_image = obj.banner_image;
    var content_status = obj.show_banner;

    db.updateBannerContent(content_id, content_link, content_image, content_status, function (error, result) {
        if (error) {
            res.json(api.getResponse(api.ERRO_NOT_FOUND, null, ""));
            return;
        }
        res.json(api.getResponse(api.SUCC_EXEC, null, ""));
    });



});

router.post('/analyze-seo', function (req, res, next) {

    var obj = req.body;
    var focusKeyword = obj.focusKeyword;
    var content = obj.content;
    var snippet = obj.snippet;
    var target = obj.target;

    var focusKeywordField = focusKeyword;
    var contentField = content;

    // console.log(42221);
    // var snippetPreview = new SnippetPreview({
    //     targetElement: target
    // });
    // console.log(snippetPreview);

    var app = new App({
        targets: {
            output: "output"
        },
        callbacks: {
            getData: function() {
                return {
                    keyword: focusKeywordField.value,
                    text: contentField.value
                };
            }
        }
    });

    app.refresh();

    res.json(api.getResponse(api.SUCC_EXEC, "aaaa", ""));

    //focusKeywordField.addEventListener( 'change', app.refresh.bind( app ) );
    //contentField.addEventListener( 'change', app.refresh.bind( app ) );
});

router.get('/updateImageDateLib', function (req, res, next) {
    var image_name = req.query.image_name;
    var image_url = req.query.image_url;
    console.log("image_name "+ image_name);
    console.log("image_url "+ image_url);
    db.getImageLibJson(function (error, text) {
        if(error) return;
        var array = JSON.parse(text[0].value);
        for(var index=0;index<array.length;index++){
            var temp = array[index];
            if(temp.image == image_url && temp.name == image_name){
                array[index].use_date = api.getNowForImageLib();
                console.log("FOUND")
                break;
            }
        }

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
        db.updateImageLibJson(JSON.stringify(array),function (error23, rsos) {

        })

    })
});
router.post('/getUserNotification', function (req, res, next) {
    var user_id = req.session.user_id;
    db.getNotificationById(user_id,function (e, data) {
        res.json(api.getResponse(api.SUCC_EXEC, data
        , ""));
    })
});
router.post('/getUnreadNotification', function (req, res, next) {
    var user_id = req.session.user_id;
    db.getUnreadNotificationById(user_id,function (e, result) {
        console.log(result[0]);
        console.log(result[0].total);
        res.json(api.getResponse(api.SUCC_EXEC, result[0].total, ""));
    })
});
router.post('/seenNotifications', function (req, res, next) {
    var user_id = req.session.user_id;
    db.updateSeenNotifications(user_id,function (e, result) {
        res.json(api.getResponse(api.SUCC_EXEC, null, ""));
    })
});

module.exports = router;
