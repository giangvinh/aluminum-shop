/* Add here all your JS customizations */

function addTagInput() {
    tagsInput(document.querySelector('input[type="tags"]'));
    $(".tags-input").css("display","inherit");
    $(".tags-input").css("width","auto");

}

function parse_number(number) {
    return parseFloat(Math.round(number * 100) / 100).toFixed(2);
}



function format_sort_order() {
    $("#ip-order").val(parseInt($("#ip-order").val()));
}

function analyzeSEO(focusKeyword, content, snippet, targetEle) {
    $.ajax({
        url: "utility/analyze-seo",
        type: "post", //send it through get method
        data: JSON.stringify({
            focusKeyword: focusKeyword,
            content: content,
            snippet: snippet,
            target: targetEle
        })
        , contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa nội dung ssss thành công',
                    type: 'success'
                });

            }

        }
    });
}

function show_image_lib_ori(callbackid) {
    $(".modal-confirm").attr("id", callbackid);
    $('#trigger-lib').click();
    $.ajax({
        url: "utility/getImageList",
        type: "get", //send it through get method
        data: ""
        , contentType: "application/json",

        success: function (response) {
            var json = response;
            var text = "";
            $("#body-modal").html("");

            for (var index = 0; index < json.length; index++) {
                var object = json[index];
                var url = object.image;
                var name = object.name;
                text += '<div image-name="' + name + '"  class="col-md-4 image-lib-div"><img image-name="' + name + '" image-url="' + url + '" class="image-lib" image-name='+name+' image-url='+url+' onclick="pick_image(this)" src="' + url + '"></div>';
            }
            var row = '<div class="row">' + text + '</div>';
            $("#body-modal").append(row);
        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Không thể lấy link hình ảnh',
                type: 'error'
            });
        }
    });
}

function updatedate_image_lib(image_name,image_url) {
    $.ajax({
        url: "utility/updateImageDateLib",
        type: "get", //send it through get method
        data: {
                "image_name": image_name,
                "image_url": image_url
            }
        , contentType: "application/json",
        success: function (response) {}, error: function (xhr) {}});
}
$(document).on('click', '.modal-save-image', function (e) {
    var name = $(".image-lib.has-border").attr("image-name");
    var url = $(".image-lib.has-border").attr("image-url");
    if(!name && !url) {
        if(!image_lib_name && !image_lib_url){
            return;
        }else {
            name = image_lib_name;
            url = image_lib_url;
        }
    }
    updatedate_image_lib(name,url);
    image_lib_name = null;
    image_lib_url = null;
});

function review_vi() {
    var contents = CKEDITOR.instances.editor1.getData();
    var mywin = window.open("", "ckeditor_preview", "location=0,status=0,scrollbars=0,width=500,height=500");
    $(mywin.document.body).html(contents);
}

function review_en() {
    var contents = CKEDITOR.instances.editor2.getData();
    var mywin = window.open("", "ckeditor_preview", "location=0,status=0,scrollbars=0,width=500,height=500");
    $(mywin.document.body).html(contents);
}
function pick_image(e) {
    var name = $(e).attr('image-name');
    var url = $(e).attr("image-url");
    image_lib_name = name;
    image_lib_url = url;
    $('.image-lib').removeClass("has-border");
    $(e).addClass("has-border");
}
function log_out() {
    $.ajax({
        url: "logout",
        type: "post", //send it through get method

        success: function (response) {
            //Do Something
            if (response.response_code == "ERRO_TOKEN_NOT_EXIST") {
                new PNotify({
                    title: 'Thất bại!',
                    text: "Token không tồn tại",
                    type: 'error'
                });
            }else if(response.response_code == "SUCC_LOG_OUT"){
            }else {
                new PNotify({
                    title: 'Thất bại!',
                    text: "Server bảo trì",
                    type: 'error'
                });
            }
            window.location.href = "login";

        },
        error: function (xhr) {
            new PNotify({
                title: 'Thất bại!',
                text: "Server bảo trì",
                type: 'error'
            });
            window.location.href = "login";

        }
    });
}





$('.login').keydown(function (event) {
    if (event.keyCode == 13) {
        // this.form.submit();
        login();
        return false;
    }
});

function format(number) {
    // var a = new Intl.NumberFormat().format(number);
    // return a;

    number = new Intl.NumberFormat('vi-VI', { maximumFractionDigits: 3 }).format(number);
    return number;
}

function revert_money_to_normal(number) {
    // var a = new Intl.NumberFormat().format(number);
    // return a;

    number = number.replace(/[^0-9 ]/g, "");
    return number;
}



