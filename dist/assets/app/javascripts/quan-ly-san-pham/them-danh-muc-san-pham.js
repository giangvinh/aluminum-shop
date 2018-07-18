
function add() {

    var name = $("#ip-name").val();

    if (name.length == 0) {
        alert("Chưa thêm tên danh mục sản phẩm");
        return;
    }
    $.ajax({
        url: "them-danh-muc-san-pham/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            name: name
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm danh mục ['+ name +"] thành công",
                    type: 'success'
                });
                window.location.href = "sua-danh-muc-san-pham?id="+response.data.id;
            } else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm danh mục ['+ name +"] thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm danh mục ['+ name +"] thất bại",
                type: 'error'
            });
        }
    });

}