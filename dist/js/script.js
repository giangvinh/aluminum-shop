function smoothScrolling() { /*-------------------------------------------------*/
/* =  smooth scroll in chrome
	/*-------------------------------------------------*/
  try {
    $.browserSelector();
    // Adds window smooth scroll on chrome.
    if ($("html").hasClass("chrome")) {
      $.smoothScroll();
    }
  } catch (err) {

  }

}
$().ready(function(){
	smoothScrolling();
})