var total_amount = 0;
var total_quantity = 0;
var cart = null;


function change_city(e) {
    var e = document.getElementById("city");
    var value = e.options[e.selectedIndex].value;
    if(value == -1){
        // $('#district')
        //     .find('option')
        //     .remove()
        //     .end();
        $('#district').find('option').not(':first').remove();
        $('#ward').find('option').not(':first').remove();

    }else {
        get_district(value,function (district_list) {
            $('#district').append($('<option>', {
                value: -1,
                text: ""
            }));
            for (var district in district_list) {
                var district_id = district_list[district].id;
                var title = district_list[district].title;

                $('#district').append($('<option>', {
                    value: district_id,
                    text: title
                }));
            }

        })
    }


}

function change_district(e) {
    var e = document.getElementById("district");
    var value = e.options[e.selectedIndex].value;
    if(value == -1){
        $('#ward').find('option').not(':first').remove();
    }else {
        get_ward(value,function (ward_list) {
            $('#ward')
                .find('option')
                .remove()
                .end();
            $('#ward').append($('<option>', {
                value: -1,
                text: ""
            }));
            for (var ward in ward_list) {
                var ward_id = ward_list[ward].id;
                var title = ward_list[ward].title;
                $('#ward').append($('<option>', {
                    value: ward_id,
                    text: title
                }));
            }
        })
    }
}

function get_ward(id, callback) {
    $.ajax({
        url: "so-dia-chi/get_ward",
        type: "post", //send it through get method
        data: JSON.stringify({
            district_id : id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var ward_list = response.data.ward_list;
                callback(ward_list);
            }
        }
    });
}

function get_district(id, callback) {
    $.ajax({
        url: "so-dia-chi/get_district",
        type: "post", //send it through get method
        data: JSON.stringify({
            city_id : id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var district_list = response.data.district_list;
                callback(district_list);
            }
        }
    });
}


function create_order() {
    if((total_amount == 0 && total_quantity == 0) || !cart){
        alert("chưa chọn sản phẩm");
        return;
    }
    var email = $('#email').val();
    var name = $('#name').val();
    var address = $('#address').val();
    var phone = $('#phone').val();
    var e = document.getElementById("city");
    var city_id = e.options[e.selectedIndex].value;
    var a = document.getElementById("district");
    var diff = $('#diff').prop( "checked" );
    var district_id = -1;
    if(a.selectedIndex == -1){
        alert("Chưa chọn tỉnh/thành phố");
        return;
    }
    if(a.options.length > 0){
        district_id = a.options[a.selectedIndex].value;
    }

    if(email.length == 0){
        alert("Chưa nhập email");
        return;
    }

    if(name.length == 0){
        alert("Chưa nhập tên");
        return;
    }

    if(city_id == -1){
        alert("Chưa chọn tỉnh/thành phố");
        return;
    }
    if(district_id == -1){
        alert("Chưa chọn quận/huyện");
        return;
    }

    if(address.length == 0){
        alert("Chưa nhập địa chỉ");
        return;
    }

    if(phone.length == 0){
        alert("Chưa nhập số điện thoại");
        return;
    }
    var coupon = null;
    if (couponActive) {
        coupon = $("#promotion").val();
    }

    $.ajax({
        url: "chon-dia-chi-giao-hang/create_order",
        type: "post", //send it through get method
        data: JSON.stringify({
            email:email,
            name:name,
            address:address,
            phone:phone,
            city_id:city_id,
            district_id:district_id,
            total_amount: total_amount,
            total_quantity: total_quantity,
            cart: cart,
            diff:diff,
            coupon: coupon
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                location.href = "chon-phuong-thuc-thanh-toan?id="+response.data;
            }
        }
    });
}

function get_user_info() {
    $.ajax({
        url: "chon-dia-chi-giao-hang/get_user_info",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var obj = response.data.personAddress;
                var email = obj.email;
                var name = obj.type_name;
                if(!name){
                    name = obj.name;
                }
                var address = obj.address;
                var phone = obj.phone;
                var city_id = obj.city_id;
                var district_id = obj.district_id;
                var ward_id = obj.ward_id;

                $('#email').val(email);
                $('#name').val(name);
                $('#address').val(address);
                $('#phone').val(phone);

                load_city(response.data.city_list,city_id);
                load_district(response.data.district_list,district_id)
                load_ward(response.data.ward_list,ward_id)
            }else {
                load_city(response.data,"-1");
            }
        }
    });
}

function load_city(city_list,selected_city_id) {
    var option =  $("#city option:first").clone();
    for (var city in city_list) {
        var city_id = city_list[city].id;
        var title = city_list[city].title;
        if(selected_city_id == city_id){
            $('#city').append('<option value="'+city_id+'" selected="selected">'+title+'</option>');
        }else {
            $('#city').append($('<option>', {
                value: city_id,
                text: title
            }));
        }

    }
}

function load_district(district_list,selected_district_id) {
    for (var district in district_list) {
        var district_id = district_list[district].id;
        var title = district_list[district].title;
        if(selected_district_id == district_id){
            $('#district').append('<option value="'+district_id+'" selected="selected">'+title+'</option>');
        }else {
            $('#district').append($('<option>', {
                value: district_id,
                text: title
            }));
        }

    }
}

function load_ward(ward_list,selected_ward_id) {
    for (var ward in ward_list) {
        var ward_id = ward_list[ward].id;
        var title = ward_list[ward].title;
        if(selected_ward_id == ward_id){
            $('#ward').append('<option value="'+ward_id+'" selected="selected">'+title+'</option>');
        }else {
            $('#ward').append($('<option>', {
                value: ward_id,
                text: title
            }));
        }

    }
}

function change_city(e) {
    var e = document.getElementById("city");
    var value = e.options[e.selectedIndex].value;
    if(value == -1){
        $('#district')
            .find('option')
            .remove()
            .end();
        $('#ward')
            .find('option')
            .remove()
            .end();
    }else {
        get_district(value,function (district_list) {
            $('#district')
                .find('option')
                .remove()
                .end();
            $('#district').append($('<option>', {
                value: -1,
                text: ""
            }));
            for (var district in district_list) {
                var district_id = district_list[district].id;
                var title = district_list[district].title;

                $('#district').append($('<option>', {
                    value: district_id,
                    text: title
                }));
            }
        })
    }


}

function change_district(e) {
    var e = document.getElementById("district");
    var value = e.options[e.selectedIndex].value;
    if(value == -1){
        $('#ward')
            .find('option')
            .remove()
            .end();
        $('#ward').append($('<option>', {
            value: -1,
            text: ""
        }));
    }else {
        get_ward(value,function (ward_list) {
            $('#ward')
                .find('option')
                .remove()
                .end();
            $('#ward').append($('<option>', {
                value: -1,
                text: ""
            }));
            for (var ward in ward_list) {
                var ward_id = ward_list[ward].id;
                var title = ward_list[ward].title;
                $('#ward').append($('<option>', {
                    value: ward_id,
                    text: title
                }));
            }
        })
    }
}


function get_ward(id, callback) {
    $.ajax({
        url: "so-dia-chi/get_ward",
        type: "post", //send it through get method
        data: JSON.stringify({
            district_id : id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var ward_list = response.data.ward_list;
                callback(ward_list);
            }
        }
    });
}

function get_district(id, callback) {
    $.ajax({
        url: "so-dia-chi/get_district",
        type: "post", //send it through get method
        data: JSON.stringify({
            city_id : id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var district_list = response.data.district_list;
                callback(district_list);
            }
        }
    });
}

get_user_info();