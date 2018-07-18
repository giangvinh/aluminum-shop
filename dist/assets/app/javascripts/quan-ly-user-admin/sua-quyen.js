










function update(id) {


    var name = $("#ip-name").val();
    if(name.length == 0){
        alert("Tên quyền còn trống");
        return;
    }
    var des = $("#ip-des").val();
    if(des.length == 0){
        alert("Mô tả còn trống");
        return;
    }
    var listPermission = [];
    $('.hummingbird-end-node:checkbox:checked').each(function () {
        var check = $(this).is(":checked");
        var str = $(this).attr("data-obj");
        var obj = JSON.parse(str);
        listPermission.push(obj.id);
    })
    $.ajax({
        url: "/admin/sua-quyen/sua",
        type: "post", //send it through get method
        data: JSON.stringify({
            name: name,
            des: des,
            id: id,
            listPermission: listPermission
        }),
        contentType: "application/json",
        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa quyền '+ name +" thành công",
                    type: 'success'
                });
            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa quyền '+ name +" thất bại\n"+response.description,
                    type: 'error'
                });
            }
        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Sửa quyền '+ name +" thất bại",
                type: 'error'
            });
        }
    });

}

function add_user_admin() {
    var user_id = $("#user_select option:selected").val();
    var user_name = $("#user_select option:selected").html();
    if(user_id == -1){
        alert("chưa chọn người dùng");
        return;
    }
    $.ajax({
        url: "sua-quyen/them-user",
        type: "post", //send it through get method
        data: JSON.stringify({
            user_id: user_id,
            role_id: role_id
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm người dùng ['+ user_name +"] thành công",
                    type: 'success'
                });
                var detail_id = response.data;
                var temp_id = "user"+user_id;
                $("#user_select option[value='" + user_id + "']").remove();
                $('#user_select').trigger('change');
                var text = 'onclick=\'xoa_user("'+user_name+'","'+user_id+'")\'';
                $('#tb-user').append('<tr id=\''+temp_id+'\'>' +
                    '<td>'+user_name+'</td>' +
                    '<td><button class="btn btn-primary" '+ text +' >Xóa</button></td></tr>');

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm người dùng '+ user_name +" thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm người dùng ['+ user_name +"] thất bại",
                type: 'error'
            });
        }
    });

}

function xoa_user(user_name,user_id) {
    $.ajax({
        url: "sua-quyen/xoa-user",
        type: "post", //send it through get method
        data: JSON.stringify({
            role_id: role_id,
            user_id: user_id
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa người dùng ['+ user_name +"] thành công",
                    type: 'success'
                });
                var temp = 'user'+user_id;
                var row = document.getElementById(temp);
                row.parentNode.removeChild(row);
                $("#user_select").append("<option value='"+user_id+"' selected>"+user_name+"</option>");
                $('#user_select').trigger('change');

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Xóa người dùng ['+ user_name +"] thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Xóa người dùng ['+ user_name +"] thất bại",
                type: 'error'
            });
        }
    });
}


function search_role() {
    // var search = $("#ip-search").val();
    $("#treeview").hummingbird("search",{treeview_container:"treeview_container", search_input:"search_input", search_output:"search_output", search_button:"search_button", scrollOffset:-515, onlyEndNodes:false});


}