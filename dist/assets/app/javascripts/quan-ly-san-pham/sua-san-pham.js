function uploadFile(callback)
{
    if($("#file_to_upload").val() != "")
    {
        var file_data = $('#file_to_upload').prop('files')[0];
        var form_data = new FormData();

        form_data.append('file', file_data);

        $.ajax({
            url: 'upload-hinh', // point to server-side PHP script
            dataType: 'text',  // what to expect back from the PHP script, if anything
            cache: false,
            contentType: false,
            processData: false,
            data: form_data,
            type: 'post',
            success: function(data){
                // get server responce here
                data = JSON.parse(data);
                // clear file field
                $("#file_to_upload").val("");
                if(data.response_code == "SUCC_EXEC"){
                    callback(data.data);
                }else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'upload hình ảnh thất bại',
                        type: 'error'
                    });
                }
            }
        });
    }
    else if(image_link.length)
    {
        callback(image_link);
    }
}

function xoa_lien_ket(id,name,content_id) {
    $.ajax({
        url: "sua-san-pham/xoa-lien-ket",
        type: "post", //send it through get method
        data: JSON.stringify({
            id: id
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa liên kết sản phẩm '+ name +" thành công",
                    type: 'success'
                });
                var temp = 'monngon'+id;
                var row = document.getElementById(temp);
                row.parentNode.removeChild(row);
                $("#mon_ngon_select").append("<option value='"+content_id+"' selected>"+name+"</option>");
                $('#mon_ngon_select').trigger('change');

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa liên kết sản phẩm '+ name +" thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Xóa liên kết sản phẩm ['+ name +"] thất bại",
                type: 'error'
            });
        }
    });
}

function add() {
    var content_name = $("#mon_ngon_select option:selected").text();
    var content_id = $("#mon_ngon_select option:selected").val();
    if(!content_id || content_id.length == 0 || content_name.length == 0){
        alert("chưa chọn món ngon")
        return;
    }
    $.ajax({
        url: "sua-san-pham/them-lien-ket",
        type: "post", //send it through get method
        data: JSON.stringify({
            content_id: content_id,
            product_id: product_id
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm liên kết sản phẩm '+ content_name +" thành công",
                    type: 'success'
                });
                var link_id = response.data;
                var temp_id = "monngon"+link_id;
                $("#mon_ngon_select option:selected").empty();
                $('#mon_ngon_select').select2('val','');
                $("#mon_ngon_select option[value='" + content_id + "']").remove();
                $('#mon_ngon_select').trigger('change');
                var text = 'onclick=\'xoa_lien_ket("'+link_id+'","'+content_name+'","'+content_id+'")\'';
                $('#tb-mon-ngon').append('<tr id=\''+temp_id+'\'>' +
                    '<td>'+content_name+'</td>' +
                    '<td><button class="btn btn-primary" '+ text +' >Xóa</button></td></tr>');

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm liên kết sản phẩm '+ content_name +" thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm liên kết sản phẩm ['+ content_name +"] thất bại",
                type: 'error'
            });
        }
    });

}
function xoa_hinh_anh(id) {
    $.ajax({
        url: "sua-san-pham/xoa-hinh-anh",
        type: "post", //send it through get method
        data: JSON.stringify({
            id: id
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa hình ảnh sản phẩm  thành công',
                    type: 'success'
                });
                var temp = 'hinhanh'+id;
                var row = document.getElementById(temp);
                row.parentNode.removeChild(row);


            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa hình ảnh sản phẩm  thất bại\n'+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Xóa hình ảnh sản phẩm thất bại',
                type: 'error'
            });
        }
    });
}

function them_hinh() {
    upload_lib_hinh(function (url) {
        $.ajax({
            url: "sua-san-pham/upload-them-hinh",
            type: "post", //send it through get method
            data: JSON.stringify({
                url: url,
                product_id: product_id
            }),    contentType: "application/json",

            success: function (response) {
                if(response.response_code == "SUCC_EXEC"){
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Thêm hình ảnh sản phẩm thành công',
                        type: 'success'
                    });
                    var link_id = response.data.id;
                    var address = response.data.address;
                    var temp_id = "hinhanh"+link_id;
                    var text = 'onclick=\'xoa_hinh_anh("'+link_id+'")\'';

                    $('#tb-hinh-anh').append('<tr id=\''+temp_id+'\'>' +
                        '<td><img class="image-sample" src="'+address+url+'"></td>' +
                        '<td><button class="btn btn-primary" '+ text +' >Xóa</button></td></tr>');

                }else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Thêm liên kết sản phẩm '+ content_name +" thất bại\n"+response.description,
                        type: 'error'
                    });
                }

            },
            error: function (xhr) {
                //Do Something to handle error
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm liên kết sản phẩm ['+ content_name +"] thất bại",
                    type: 'error'
                });
            }
        });
    })


}

function upload_lib_hinh(callback) {
    if($("#file_to_upload3").val() != "")
    {
        var file_data = $('#file_to_upload3').prop('files')[0];
        var form_data = new FormData();

        form_data.append('file', file_data);

        $.ajax({
            url: 'upload-hinh', // point to server-side PHP script
            dataType: 'text',  // what to expect back from the PHP script, if anything
            cache: false,
            contentType: false,
            processData: false,
            data: form_data,
            type: 'post',
            success: function(data){
                // get server responce here
                data = JSON.parse(data);
                // clear file field
                $("#file_to_upload3").val("");
                if(data.response_code == "SUCC_EXEC"){
                    var url = data.data;
                    callback(url);
                    return false;
                }else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'upload hình ảnh thất bại',
                        type: 'error'
                    });
                    return false;
                }
            }
        });
    }
    else
    {
        alert("Chưa chọn hình ảnh");
        return false;
    }
}
function setDataCkeditor() {
    var vi = $( "#vi-label" ).attr( "data" );
    CKEDITOR.instances.editor1.setData(vi);
    var en = $( "#en-label" ).attr( "data" );
    CKEDITOR.instances.editor2.setData(en);
}

function parse_number(number) {
    return parseFloat(Math.round(number * 100) / 100).toFixed(2);
}

function format_money_and_edit() {
    var number = $("#ip-price").val();
    number = revert_money_to_normal(number);
    if(number == "") return;
    number = format_money(number);
    $("#ip-price").val(number);
}
function update() {
    var important = document.getElementById("ip-important").checked;
    var e = document.getElementById("product_category_id");
    var product_category_id = e.options[e.selectedIndex].value;
    var e1 = document.getElementById("parent_id");
    var parent_id = e1.options[e1.selectedIndex].value;
    var e2 = document.getElementById("ip-type");
    var type = e2.options[e2.selectedIndex].value;


    var code = $("#ip-ma-sp").val();
    var quantity = $("#ip-sl").val();
    var price = $("#ip-price").val();
    var weight = $("#ip-weight").val();
    var unit = $("#ip-unit").val();
    var tag = $("#ip-tag").val();
    var order = $("#ip-order").val();
    var des_vi = $("#ip-des-vi").val();
    var name_vi = $("#ip-name-vi").val();
    var title_vi = $("#ip-title-vi").val();
    var html_vi = CKEDITOR.instances.editor1.getData();
    var meta_keyword_vi = $("#meta-keyword-vi").val();
    var meta_description_vi = $("#meta-description-vi").val();
    var meta_title_vi = $("#meta-title-vi").val();


    var des_en = $("#ip-des-en").val();
    var name_en = $("#ip-name-en").val();
    var title_en = $("#ip-title-en").val();
    var html_en = CKEDITOR.instances.editor2.getData();
    var meta_keyword_en = $("#meta-keyword-en").val();
    var meta_description_en = $("#meta-description-en").val();
    var meta_title_en = $("#meta-title-en").val();

    if(code.length == 0){
        alert("Chưa thêm mã sản phẩm");
        return;
    }
    if (quantity.length == 0) {
        alert("Chưa thêm số lượng sản phẩm");
        return;
    }
    if (price.length == 0) {
        alert("Chưa thêm giá sản phẩm");
        return;
    }
    if (weight.length == 0) {
        alert("Chưa thêm trọng lượng sản phẩm");
        return;
    }
    if (unit.length == 0) {
        alert("Chưa thêm đơn vị tính");
        return;
    }
    if (order.length == 0) {
        alert("Chưa thêm thứ tự sắp xếp");
        return;
    }
    if (tag.length == 0) {
        alert("Chưa thêm nhãn");
        return;
    }
    if (des_vi.length == 0) {
        alert("Chưa thêm mô tả tiếng việt");
        return;
    }
    if (name_vi.length == 0) {
        alert("Chưa thêm tên sản phẩm tiếng việt");
        return;
    }
    if (meta_keyword_vi.length == 0) {
        alert("Chưa thêm meta key tiếng việt");
        return;
    }
    if (meta_description_vi.length == 0) {
        alert("Chưa thêm meta description tiếng việt");
        return;
    }
    if (meta_title_vi.length == 0) {
        alert("Chưa thêm meta title tiếng việt");
        return;
    }
    // if (title_vi.length == 0) {
    //     alert("Chưa thêm tiêu đề sản phẩm tiếng việt");
    //     return;
    // }
    if (html_vi.length == 0) {
        alert("Chưa thêm HTML sản phẩm tiếng việt");
        return;
    }
    if (des_en.length == 0) {
        des_en = des_vi;
    }
    if (name_en.length == 0) {
        name_en = name_vi;
    }
    if (meta_keyword_en.length == 0) {
        meta_keyword_en = meta_keyword_vi;
    }
    if (meta_description_en.length == 0) {
        meta_description_en = meta_description_vi;
    }
    if (meta_title_en.length == 0) {
        meta_title_en = meta_title_vi;
    }
    // if (title_en.length == 0) {
    //     alert("Chưa thêm tiêu đề sản phẩm tiếng anh");
    //     return;
    // }
    if (html_en.length == 0) {
        html_en = html_vi;
    }
    price = revert_money_to_normal(price);
    uploadFile(function (url) {
        $.ajax({
            url: "/admin/sua-san-pham/sua",
            type: "post", //send it through get method
            data: JSON.stringify({
                product_category_id: product_category_id,
                code: code,
                quantity: quantity,
                price: price,
                weight: weight,
                unit: unit,
                tag: tag,
                order: order,
                des_vi: des_vi,
                name_vi: name_vi,
                title_vi: title_vi,
                html_vi: html_vi,
                des_en: des_en,
                name_en: name_en,
                title_en: title_en,
                html_en: html_en,
                parent_id: parent_id,
                image: url,
                important: important,
                product_id: product_id,
                type: type,
                meta_title_vi:meta_title_vi,
                meta_description_vi:meta_description_vi,
                meta_keyword_vi:meta_keyword_vi,
                meta_description_en:meta_description_en,
                meta_keyword_en:meta_keyword_en,
                meta_title_en:meta_title_en
            }),    contentType: "application/json",

            success: function (response) {
                if(response.response_code == "SUCC_EXEC"){
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Sửa sản phẩm '+ name_vi +" thành công",
                        type: 'success'
                    });
                }else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Sửa sản phẩm '+ name_vi +" thất bại\n"+response.description,
                        type: 'error'
                    });
                }

            },
            error: function (xhr) {
                //Do Something to handle error
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa sản phẩm '+ name_vi +" thất bại",
                    type: 'error'
                });
            }
        });
    })
}
addTagInput();
setDataCkeditor();