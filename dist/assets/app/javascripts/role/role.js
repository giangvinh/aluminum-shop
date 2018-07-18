function apply_role() {
    $.ajax({
        url: "utility/getUserRole",
        type: "post", //send it through get method
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {


                var array = response.data.user_role;
                var user_id = response.data.user_id;
                console.log(user_id);
                console.log(3435435545);

                // ẩn menu quan ly user neu 0 phai user admin
                if(user_id == "719AD10A-04F9-4FD8-9351-1B2602277967"){
                    return;
                }else {
                    $("#user-page").remove();
                    $("#sanpham-page").remove();
                    $("#danh-sach-don-hang").remove();
                    $("#statics-page").remove();

                }
                var full = page_name;
                var sub = page_sub_name;

                for (var index=0;index<array.length;index++){
                    var obj = array[index];
                    var master_group = obj.master_group;
                    var child_group = obj.child_group;
                    var name = obj.name;
                    // handle_process(master_group,child_group,name,full,sub);
                }
            }

        },
        error: function (xhr) {
            // nothing
        }
    });
}

function handle_process(master_group,child_group,name,page_name,page_sub_name) {
    if(page_name == "warehouse-page" && page_sub_name == "danh-sach-nhap-kho"){
        handle_Quan_Ly_Kho(master_group,child_group,name);
    }else if(page_name == "order-page" && (page_sub_name == "them-don-hang" || page_sub_name == "danh-sach-don-hang")){
        handle_Quan_Ly_Don-Hang(master_group,child_group,name);
    }
}



function handle_Quan_Ly_Kho(master_group,child_group,name){
    if(master_group == "Business"){
        if(child_group == "Quản lý kho") {
            if (name == "Kho hàng") {
                $("#btn-add").remove();
            }else if(name == "Sửa sản phẩm"){
                $(".btn-edit").remove();
            }else if(name == "Xóa sản phẩm"){
                $(".btn-del").remove();
            }
        }
    }
}
// function handle_Quan_Ly_Thuong_Hieu(master_group,child_group,name){
//     if(master_group == "Business"){
//         if(child_group == "Quản lý sản phẩm") {
//             if (name == "Thêm thương hiệu") {
//                 $("#btn-add").remove();
//             }else if(name == "Sửa thương hiệu"){
//                 $(".btn-edit").remove();
//             }else if(name == "Xóa thương hiệu"){
//                 $(".btn-del").remove();
//             }
//         }
//     }
// }

apply_role();
