function convert_money() {
    $('.price').each(function (i, obj) {
        //test
        var innerText = obj.innerText;
        obj.innerText = format_price(innerText);
    });
}
jQuery(window).load(function () {
    convert_money();
});