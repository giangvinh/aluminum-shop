var product_id_global = null;
var image_link = null;


function format_money_and_edit() {
    var number = $("#ip-price").val();
    number = revert_money_to_normal(number);
    if(number == "") return;
    number = format_money(number);
    $("#ip-price").val(number);
}

function change_cate() {
    var e = document.getElementById("product_category_id");
    var product_category_name = e.options[e.selectedIndex].text;
    if(product_category_name.toLowerCase().indexOf("phụ kiện")>=0){
        $("#color-form").addClass("hide");
        $("#ip-corlor").val("null");
    }else {
        $("#color-form").removeClass("hide");
    }
}
change_cate();

function add() {
    var e = document.getElementById("product_category_id");
    var product_category_id = e.options[e.selectedIndex].value;
    var product_category_name = e.options[e.selectedIndex].text;

    var price = $("#ip-price").val();
    var unit = $("#ip-unit").val();
    var color = $("#ip-color").val();
    var name = $("#ip-name").val();
    var check=revert_money_to_normal(price);
    if (price.length == 0) {
        alert("Chưa thêm giá của sản phẩm");
        return;
    }else if(check.length==0){
        alert("Giá phải là chữ số");
        return;
    }
    if(product_category_name.toLowerCase().indexOf("phụ kiện")<0){
        if (color.length == 0) {
            alert("Chưa thêm màu của sản phẩm");
            return;
        }
    }


    if (unit.length == 0) {
        alert("Chưa thêm đơn vị tính của sản phẩm");
        return;
    }

    if (name.length == 0) {
        alert("Chưa thêm tên của sản phẩm");
        return;
    }

    price = revert_money_to_normal(price);
    $.ajax({
        url: "/admin/them-san-pham-don-vi/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            product_category_id: product_category_id,
            code: null,
            price: price,
            weight: null,
            unit: unit,
            name: name,
            color:color,
            sl:1,
            order:0
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm sản phẩm ['+ name +"] thành công",
                    type: 'success'
                });
                product_id_global = response.data.id;
                window.location.href = "sua-san-pham-don-vi?id="+response.data.id;
            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm sản phẩm ['+ name +"] thất bại\n"+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm sản phẩm ['+ name +"] thất bại",
                type: 'error'
            });
        }
    });
}