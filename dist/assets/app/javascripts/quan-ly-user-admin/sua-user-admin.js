










function update() {

    var flag=false;
    var selected_role = [];
    var un_selected_role = [];
    $('#checkboxes input').each(function() {
        if($(this).prop('checked')==true){
            selected_role.push($(this).attr('name'));
            flag=true;
        }
        else
            un_selected_role.push($(this).attr('name'));
    });
    var username = $("#ip-username").val();
    var user_id=$("#ip-username").attr('name');
    if(username.length == 0){
        alert("Tên người dùng còn trống");
        return;
    }
    var password = $("#ip-password").val();
    if(password.length == 0){
        alert("Mật khẩu còn trống");
        return;
    }

    var retype = $("#ip-retype").val();
    if(retype.length == 0){
        alert("Chưa nhập lại mật khẩu");
        return;
    }


    if(retype != password){
        alert("Mật khẩu nhập lại chưa trùng khớp");
        return;
    }
    $.ajax({
        url: "/admin/sua-user-admin/sua",
        type: "post", //send it through get method
        data: JSON.stringify({
            username: username,
            password: password,
            selected_role:selected_role,
            un_selected_role:un_selected_role,
            user_id:user_id
        }),
        contentType: "application/json",
        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa thông tin người dùng '+ username +" thành công",
                    type: 'success'
                });
            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa thông tin người dùng '+ username +" thất bại\n"+response.description,
                    type: 'error'
                });
            }
        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Sửa thông tin người dùng '+ username +" thất bại",
                type: 'error'
            });
        }
    });

}