
function update() {

    var des_vi = $("#ip-des-vi").val();
    var name_vi = $("#ip-name-vi").val();
    var title_vi = $("#ip-title-vi").val();
    if (name_vi.length == 0) {
        alert("Chưa thêm tên sản phẩm");
        return;
    }
    $.ajax({
        url: "sua-danh-muc-san-pham/sua",
        type: "post", //send it through get method
        data: JSON.stringify({
            des_vi: des_vi,
            name_vi: name_vi,
            title_vi: title_vi,
            category_id: category_id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa danh mục [' + name_vi + "] thành công",
                    type: 'success'
                });
                window.location.href = "danh-sach-danh-muc-san-pham";

            } else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa danh mục [' + name_vi + "] thất bại\n" + response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Sửa danh mục [' + name_vi + "] thất bại",
                type: 'error'
            });
        }
    });
}