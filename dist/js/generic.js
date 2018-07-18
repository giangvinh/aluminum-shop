function changeLanguage(languageCode) {
    $.ajax({
        url: "/lang",
        type: "post", //send it through get method
        data: JSON.stringify({
            lang: languageCode
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                window.location.reload();
            }
        },
        error: function (xhr) {

        }
    });
}