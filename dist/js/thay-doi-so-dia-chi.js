function add_address() {
    var b = 0;
    var item = $("#item").clone();
    var id = "item"+global_array.length;
    item.id = id;
    item.removeClass("bottom").insertAfter(".info-book-address:last");
    item.find(".city").attr("id","city"+global_array.length);
    item.find(".district").attr("id","district"+global_array.length);
    item.find(".fullName").attr("id","fullName"+global_array.length);
    item.find(".phoneNumber").attr("id","phoneNumber"+global_array.length);
    item.find(".email").attr("id","email"+global_array.length);
    item.find(".address").attr("id","address"+global_array.length);
    item.find(".button-sua").attr("id","button"+global_array.length);
    item.find(".address_default").attr("id","default"+global_array.length);
    item.find(".delete").attr("id","delete"+global_array.length);
    global_array.push({id: null});
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

function delete_address(id) {
    $.ajax({
        url: "thay-doi-so-dia-chi/remove-person-address",
        type: "post", //send it through get method
        data: JSON.stringify({
            person_address_id : id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                location.href = "so-dia-chi";
            }
        }
    });
}

function add(e) {
    var id = e.id;
    id= id.substr(6,id.length);
    var fullName = $('#fullName'+id).val();
    var phoneNumber = $('#phoneNumber'+id).val();
    var email = $('#email'+id).val();
    var address = $('#address'+id).val();
    var e = document.getElementById("city"+id);
    var city_id = e.options[e.selectedIndex].value;
    var a = document.getElementById("district"+id);
    var district_id = -1;
    if(a.options.length > 0){
        district_id = a.options[a.selectedIndex].value;
    }
    var b = document.getElementById("ward"+id);



    var is_default = $('#default'+id).is(":checked");
    if(fullName.length == 0){
        alert("Chưa nhập họ tên");
        return;
    }
    if(phoneNumber.length == 0){
        alert("Chưa nhập số điện thoại");
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
        alert("Chưa nhập địa chỉ chi tiết");
        return;
    }
    add_item(id,fullName,phoneNumber,email,city_id,district_id,address,is_default);

}

function deleted(e) {
    var id = e.id;
    id= id.substr(6,id.length);
    var person_address_id = global_array[id].id;
    if(person_address_id== null){
        var a = $('.info-book-address');
        a[Number(id)+1].remove();
        a = a.splice(Number(id)+1,1);
        global_array.splice(Number(id),1);
    }else {
        $.ajax({
            url: "so-dia-chi/remove_person_address",
            type: "post", //send it through get method
            data: JSON.stringify({
                person_address_id : person_address_id
            }), contentType: "application/json",

            success: function (response) {
                if (response.response_code == "SUCC_EXEC") {
                    alert("thay đổi thành công");
                    var a = $('.info-book-address');
                    a[Number(id)+1].remove();
                    a = a.splice(Number(id)+1,1);
                    global_array.splice(Number(id),1);
                }
            }
        });
    }


}


function update(id) {
    var fullName = $('#fullName').val();
    var phoneNumber = $('#phoneNumber').val();
    var email = $('#email').val();
    var address = $('#address').val();
    var e = document.getElementById("city");
    var city_id = e.options[e.selectedIndex].value;
    var a = document.getElementById("district");
    var district_id = -1;
    if(a.options.length > 0){
        district_id = a.options[a.selectedIndex].value;
    }
    var b = document.getElementById("ward");



    var is_default = $('#default').is(":checked");
    if(fullName.length == 0){
        alert("Chưa nhập họ tên");
        return;
    }
    if(phoneNumber.length == 0){
        alert("Chưa nhập số điện thoại");
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
        alert("Chưa nhập địa chỉ chi tiết");
        return;
    }
    var person_address_id = id;
    update_item(person_address_id,fullName,phoneNumber,email,city_id,district_id,address,is_default);

}

function update_item(id,fullName,phoneNumber,email,city_id,district_id,address,is_default) {
    $.ajax({
        url: "thay-doi-so-dia-chi/update_info",
        type: "post", //send it through get method
        data: JSON.stringify({
            fullName : fullName,
            phoneNumber: phoneNumber,
            email: email,
            city_id: city_id,
            district_id: district_id,
            address: address,
            is_default: is_default,
            person_address_id: id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                alert("thay đổi thành công");
                location.href = "so-dia-chi"
            }
        }
    });
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