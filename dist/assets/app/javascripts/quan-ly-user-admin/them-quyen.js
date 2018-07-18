var user_array = [];

function add() {
    var name = $("#ip-name").val();
    var des = $("#ip-des").val();

    if(name == ""){
        alert("Tên quyền còn trống");
        return;
    }

    if(des == ""){
        alert("Mô tả còn trống");
        return;
    }
    var listPermission = [];
    $('.hummingbird-end-node:checkbox:checked').each(function () {
        var check = $(this).is(":checked");
        var obj = JSON.parse($(this).attr("data-obj"));
        listPermission.push(obj.id);
    })




    $.ajax({
        url: "/admin/them-quyen/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            name: name,
            des: des,
            listPermission: listPermission,
            user_array: user_array
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm quyền ['+ name +"] thành công",
                    type: 'success'
                });
                window.location = "sua-quyen?id="+response.data;

            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm quyền ['+ name +"] thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm quyền ['+ name +"] thất bại",
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
    new PNotify({
        title: 'Thông báo',
        text: 'Thêm người dùng ['+ user_name +"] thành công",
        type: 'success'
    });
    user_array.push({user_id:user_id,user_name:user_name});
    var temp_id = "user"+user_id;
    $("#user_select option[value='" + user_id + "']").remove();
    $('#user_select').trigger('change');
    var text = 'onclick=\'xoa_user("'+user_name+'","'+user_id+'")\'';
    $('#tb-user').append('<tr id=\''+temp_id+'\'>' +
        '<td>'+user_name+'</td>' +
        '<td><button class="btn btn-primary" '+ text +' >Xóa</button></td></tr>');

}


function xoa_user(user_name,user_id) {
    new PNotify({
        title: 'Thông báo',
        text: 'Xóa người dùng ['+ user_name +"] thành công",
        type: 'success'
    });
    var pos=null;
    for(var index=0;index<user_array.length;index++){
        var obj = user_array[index];
        if(obj.user_id == user_id){
            pos=index;
            break;
        }
    }
    if(pos!=null){
        user_array.splice(pos,1);
    }

    var temp = 'user'+user_id;
    var row = document.getElementById(temp);
    row.parentNode.removeChild(row);
    $("#user_select").append("<option value='"+user_id+"' selected>"+user_name+"</option>");
    $('#user_select').trigger('change');

}



function search_role() {
    // var search = $("#ip-search").val();
    $("#treeview").hummingbird("search",{treeview_container:"treeview_container", search_input:"search_input", search_output:"search_output", search_button:"search_button", scrollOffset:-515, onlyEndNodes:false});


}