function smoothScrolling() {
  try {
  $.browserSelector();
  if ($("html").hasClass("chrome")) {
    $.smoothScroll();
  }
  } catch (err) {

  }
}

$(document).ready(function() {
    smoothScrolling();
    $('.totop').fadeOut(300);
    $("a[href='#top']").click(function() {
      $("html, body").animate({ scrollTop: 0 }, "slow");
      return false;
    });
    var wei = $('body,html').innerWidth();
    if( wei<992){
      $('.icon-menu-acc').click(function(event) {
        if($(this).hasClass('active')){
          $(this).next().slideUp(200);
          $(this).removeClass('active');
        }else{
          $(this).addClass('active');
          $(this).next().slideDown(200);
        }
      });
    }
    ddsmoothmenu.init({
      mainmenuid: "smoothmenu1", //menu DIV id
      orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
      classname: 'ddsmoothmenu', //class added to menu's outer DIV
      //customtheme: ["#1c5a80", "#18374a"],
      contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })
    $(window).scroll(function(e) {
        var top = $(window).scrollTop();
        if(top > 0)
        {
            $('.totop').fadeIn(300);
        }
        else
        {
          $('.totop').fadeOut(300);
        }

        var headerHeight = $("#header").height() - 60;
        if (top > headerHeight ){
          $('#top').css({position:'fixed', top: '0px', left: '0px'});
        }
        else {
          $('#top').css({position:'relative', top: 'auto', left: 'auto'});
        }
    });
    $('.totop').click(function(e) {
        $('html,body').animate({
            scrollTop: $('body').offset().top},'slow'
        );
    });
    $('#login_mobi img').click(function(event) {
      if($(this).hasClass('active')){
        $(this).next().slideUp(200);
        $(this).removeClass('active');
      }else{
        $(this).addClass('active');
        $(this).next().slideDown(200);
      }
    });
    $("#owl-pro").owlCarousel({
          items:1,
           autoplay: true,
           smartSpeed : 1000,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            scrollPerPage : 1,
            slideSpeed: 300,
            navigation : true,
            navText:['',''],
            slideSpeed : 300,
            paginationSpeed : 400,
            loop:true,
            responsive:{
              0:{
                  items:1,
                  loop:true
              },
              600:{
                  items:1,
                  loop:true
              },
              900:{
                  items:1,
                  loop:true
              },
              1000:{
                  items:1,
                  loop:true
              }
          }
      });
    $("#owl-handbook").owlCarousel({
          items:1,
           autoplay: true,
           smartSpeed : 1000,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            scrollPerPage : 1,
            slideSpeed: 300,
            navigation : true,
            navText:['',''],
            slideSpeed : 300,
            paginationSpeed : 400,
            loop:true,
            responsive:{
              0:{
                  items:1,
                  loop:true
              },
              600:{
                  items:1,
                  loop:true
              },
              900:{
                  items:1,
                  loop:true
              },
              1000:{
                  items:1,
                  loop:true
              }
          }
      });
    $("#owl-pro-viewed").owlCarousel({
          items:6,
           autoplay: true,
           smartSpeed : 1000,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            scrollPerPage : 1,
            slideSpeed: 300,
            navigation : true,
            navText:['',''],
            slideSpeed : 300,
            paginationSpeed : 400,
            loop:true,
            responsive:{
              0:{
                  items:2,
                  loop:true
              },
              600:{
                  items:3,
                  loop:true
              },
              900:{
                  items:5,
                  loop:true
              },
              1000:{
                  items:5,
                  loop:true
              }
          }
      });
    $('#foo3').carouFredSel({
            width: '100%',
            height: 'auto',
            prev: '#prev13',
            next: '#next13',
            auto: false,
            scroll: 1
        });
    $('.second_title').each(function() {
            var me = $(this).html();
            var dodai = me.split(' ');
            var str = '<span>';
            for ($i=0; $i<dodai.length; $i++) {
                if($i+1==2){
                    str = str + dodai[$i] + ' </span>';
                }else{
                    str = str + dodai[$i] + ' ';
                }
            }
            $(this).html(str);
        });
    $('#tabs a').click(function(event) {
        event.preventDefault();
        $(".hidden1").hide();
        $("#tabs li").attr("class",""); 
        $("#tabs li a").attr("class","");//Reset id's
        $(this).parent().attr("class","current"); 
        $(this).attr("class","active");// Activate this
        $('#' + $(this).attr('title')).fadeIn();
       return false;
    });
    $("#account li:last-child a").click(function(event) {
      event.preventDefault();
      if($(this).next().length > 0){
        if($(this).next().hasClass('active')){
          $(this).next().slideUp();
          $(this).next().removeClass('active')
        }else{
          $(this).next().addClass('active')
          $(this).next().slideDown();
        }
      }
    });
    if($(".login").colorbox)
    {
      $(".login")
      .colorbox({inline:true, width:"90%", height:"95%", maxHeight: '300px', maxWidth: '600px'});
    }
    if($(".viewCart").colorbox)
    {
    $(".viewCart").colorbox(
      {inline:true, width:"90%", height:"90%", maxHeight: '600px', maxWidth: '900px'});
    }
    $('.cols_left ul li a').click(function(event) {
      var links = $(this).attr('href');
      var sl = $(this).parent().find('ul').length;
      if(sl>0){
        if($(this).hasClass('active')){
          $(this).next().slideUp(200);
          $(this).removeClass('active');
          $(this).prev().removeClass('active');
        }else{
          $(this).parent().parent().find('ul').slideUp(200);
          $(this).next().slideDown(200);
          $(this).prev().addClass('active');
          $(this).addClass('active');

        }
      }else{
        window.href = links;
      }
      return false;
    });
    $('[data-toggle="tooltip"]').tooltip();  
});
$(function() {
  
  $('nav#menu_mobi').mmenu({
    extensions  : [ 'effect-slide-menu', 'pageshadow' ],
    searchfield : false,
    counters  : true,
    navbar    : {
      title   : 'Menu'
    },
    navbars   : [
      {
        position  : 'top',
        content   : [ 'searchfield' ]
      }, {
        position  : 'top',
        content   : [
          'prev',
          'title',
          'close'
        ]
      }
    ]
  });
});