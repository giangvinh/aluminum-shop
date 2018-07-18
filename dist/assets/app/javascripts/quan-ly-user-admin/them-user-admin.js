
function add() {
    var username = $("#ip-username").val();
    var flag=false;
    var selected_role = [];
    $('#checkboxes input:checked').each(function() {
        selected_role.push($(this).attr('name'));
        flag=true;
    });

    // if(flag==false){
    //     alert("Cần thêm Quyền cho User");
    //     return;
    // }

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
        url: "/admin/them-user-admin/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            username: username,
            password: password,
            selected_role:selected_role,
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm người dùng ['+ username +"] thành công",
                    type: 'success'
                });
                window.location = "sua-user-admin?id="+response.data.id;

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm người dùng ['+ username +"] thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm người dùng ['+ username +"] thất bại",
                type: 'error'
            });
        }
    });
}