function load_meta_product_detail() {
    var a = product_id;
    $.ajax({
        url: "chi-tiet-san-pham/getMeta",
        type: "post", //send it through get method
        data: JSON.stringify({
            product_id: product_id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}

function load_meta_tin_tuc_detail() {
    var a = content_id;
    $.ajax({
        url: "chi-tiet-tin-tuc/getMeta",
        type: "post", //send it through get method
        data: JSON.stringify({
            content_id: content_id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                if(!response.data) return;
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}

function load_meta_delicious_food_detail() {
    var a = content_id;
    $.ajax({
        url: "chi-tiet-mon-an-ngon/getMeta",
        type: "post", //send it through get method
        data: JSON.stringify({
            content_id: content_id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                if(!response.data) return;
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}


function load_meta_index_front_end() {
    $.ajax({
        url: "/getMeta",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}



function load_meta_product() {
    $.ajax({
        url: "san-pham/getMeta",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);

            }
        }
    });

}

function load_meta_promotion() {
    $.ajax({
        url: "khuyen-mai/getMeta",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}

function load_meta_tin_tuc() {
    $.ajax({
        url: "tin-tuc-su-kien/getMeta",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}

function load_meta_delicious_food() {
    $.ajax({
        url: "cam-nang-mon-ngon/getMeta",
        type: "post", //send it through get method
        data: "", contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                var title = response.data.meta_title;
                var key = response.data.meta_keywords;
                var description = response.data.meta_description;
                $('meta[name=keywords]').attr('content', key);
                $('meta[name=description]').attr('content', description);
                $('title').html(title);
            }
        }
    });

}

