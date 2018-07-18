function setBadge(number) {
    if (number == 0) {
        $('#notification-span').hide();
        $('#notification-span1').hide();
        return;
    }
    $('#notification-span').show();
    $('#notification-span1').show();
    $('#notification-span').text(number);
    $('#notification-span1').text(number);
}

function applyUsernameFromSession() {
    $.ajax({
        url: "utility/getUsername",
        type: "post", //send it through get method
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var username =  response.data.username;
                var user_id =  response.data.user_id;
                if (username == null) {
                    window.location.href =  "/admin/login";
                    return;
                }
                var socket = io('https://lazymining.com:1234');
                socket.on('connect', function () {
                    socket.emit("update_user_socket",user_id,socket.id);
                });
                socket.on('on-notification', function (title,description,icon,link) {
                    new PNotify({
                        title: title,
                        text: description,
                        type: 'custom',
                        addclass: 'notification-primary'
                    });

                    applyUserNotification();
                    applyUnreadNotification();

                    // var current_number = $('#notification-span').text();
                    // if(current_number < 5) {
                    //     $("#ul-notification").append(
                    //         '<li>' +
                    //         '   <a class="clearfix" href=\'' + link + '\'>' +
                    //         '       <div class="image">' +
                    //         '           <i class=\'' + icon + ' bg-danger\'></i></div>' +
                    //         '       <span class="title">' + title + '</span>' +
                    //         '       <span class="message">' + description + '</span></a></li>');
                    // }
                    // setBadge(current_number+1);
                });
                $("#logged_username").html(username);
            }

        },
        error: function (xhr) {
            // nothing
        }
    });
}



function applyUserNotification() {
    $.ajax({
        url: "utility/getUserNotification",
        type: "post", //send it through get method
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var newsItem = $("#ul-notification");
                var htmlList = "";
                for(var index=0;index<response.data.length;index++){
                    var obj = response.data[index];
                    var description = moment(obj.created_date).fromNow();
                    var item = newsItem.clone();
                    item.html($("li:first-child", item));

                    $("a", item).attr("href", obj.link);
                    $(".image i", item).addClass(obj.icon);
                    $(".title", item).html(obj.title);
                    $(".message", item).html(description);

                    $(".title", item).css("font-weight", "initial");
                    $(".message", item).css("font-weight", "initial");
                    if (obj.unread == 1) {
                        $(".title", item).css("font-weight", "bold");
                        $(".message", item).css("font-weight", "bold");
                    }

                    htmlList += item.html();

                }
                newsItem.html(htmlList);
            }

        },
        error: function (xhr) {
            // nothing
        }
    });
}


function applyUserRole() {
    $.ajax({
        url: "utility/getUserRole",
        type: "post", //send it through get method
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                // chính sách bán hàng
                var array = response.data.user_role;
                var user_id = response.data.user_id;

                // ẩn menu quan ly user neu 0 phai user admin
                if(user_id == "719AD10A-04F9-4FD8-9351-1B2602277967"){
                    return;
                }else {
                    $("#user-page").remove();
                }

                for (var index=0;index<array.length;index++){
                    var obj = array[index];
                    var master_group = obj.master_group;
                    var child_group = obj.child_group;
                    var name = obj.name;
                    handle_process(master_group,child_group,name);
                }


            }

        },
        error: function (xhr) {
            // nothing
        }
    });
}

function handle_process(master_group,child_group,name) {
    if(master_group == "CMS"){
        if(child_group == "Thông tin chung") {
            if (name == "Thêm bài viết") {

            }else if(name == "Sửa bài viết"){
                $("#gioithieu_page").remove();
                $("#quan_ly_footer_page").remove();
                $("#quan-ly-meta-trang-chu").remove();
                $("#quan-ly-toc-do-slider-trang-chu").remove();
                $("#chinh-sua-banner-san-pham").remove();
                $("#quan-ly-meta-tong-quan-khuyen-mai").remove();
                $("#quan-ly-meta-tong-quan-san-pham").remove();
            }else if(name == "Xóa bài viết"){

            }
        }else if(child_group == "Quản lý món ăn ngon"){
            if (name == "Thêm bài viết") {
                $("#them-mon-an-ngon").remove();
            }else if(name == "Sửa bài viết"){
                $("#chinh-sua-banner-san-pham").remove();
                $("#quan-ly-meta-tong-quan-mon-ngon").remove();
                $("#quan-ly-bai-viet-mon-an-ngon").remove();
                $("#quan-ly-toc-do-slider-mon-an-ngon").remove();
            }else if(name == "Xóa bài viết"){

            }
        }else if(child_group == "Quản lý tin tức sự kiện"){
            if (name == "Thêm bài viết") {
                $("#them-tin-tuc-su-kien").remove();
            }else if(name == "Sửa bài viết"){
                $("#chinh-sua-banner-tin-tuc-su-kien").remove();
                $("#quan-ly-meta-tin-tuc-su-kien").remove();
                $("#quan-ly-bai-viet-tin-tuc-su-kien").remove();
                $("#quan-ly-toc-do-slider-tin-tuc").remove();
            }else if(name == "Xóa bài viết"){

            }
        }
    }else if(master_group == "Business"){
        if(child_group == "Quản lý sản phẩm"){
            if (name == "Thêm danh mục") {
                $("#them-danh-muc-san-pham").remove();
            }else if(name == "Thêm sản phẩm"){
                $("#them-san-pham-don-vi").remove();
                $("#themSanPhamCombo").remove();
            }else if(name == "Quản lý sản phẩm bán chạy"){
                $("#quan-ly-san-pham-ban-chay").remove();
            }else if(name == "Quản lý sản phẩm quà tặng"){
                $("#quan-ly-san-pham-qua-tang").remove();
            }else if(name == "Thêm thương hiệu"){
                $("#them-thuong-hieu").remove();
            }
        }
    }
}


function applyUnreadNotification() {
    $.ajax({
        url: "utility/getUnreadNotification",
        type: "post", //send it through get method
        data: JSON.stringify({}),
        contentType: "application/json",
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                setBadge(response.data);
            }

        },
        error: function (xhr) {
            // nothing
        }
    });
}

function seenNotifications() {
    setBadge(0);
    $.ajax({
        url: "utility/seenNotifications",
        type: "post", //send it through get method
        data: JSON.stringify({}),
        contentType: "application/json",
        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                // nothing
            }

        },
        error: function (xhr) {
            // nothing
        }
    });
    return true;
};

function handle_ui_left_menu() {

    $("#"+page_name).addClass('nav-active');
    $("#"+page_name).addClass('nav-expanded');
    $("#"+page_sub_name).addClass('nav-active');

}

applyUsernameFromSession();
applyUserNotification();
applyUnreadNotification();
handle_ui_left_menu();
applyUserRole();
