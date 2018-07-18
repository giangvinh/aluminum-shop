/*
Name: 			UI Elements / Modals - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.4.0
*/
start_date = null;
end_date = null;
$('#ip-begin-date').daterangepicker({
    timePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
        format: 'DD/MM/YYYY hh:mm A'
    }
});
$('#ip-begin-date').val("");
$('#ip-begin-date').on('apply.daterangepicker', function (ev, picker) {
    start_date = picker.startDate;
    end_date = picker.endDate;
    type_sort();
});
$('#ip-begin-date').on('hide.daterangepicker', function (ev, picker) {
    start_date = picker.startDate;
    end_date = picker.endDate;
});



function change_sort() {
    var e = document.getElementById("select-date");
    var option_date = e.options[e.selectedIndex].value;
    var e1 = document.getElementById("select-sort");
    $( "#btt-thongke" ).addClass( "hide" );
    if(option_date == 2||option_date == "2"){
        $( "#date" ).removeClass( "hide" );
        return;
    }else if(option_date == 1||option_date == "1"){
        $( "#date" ).addClass( "hide" );
        start_date=moment().subtract(30, 'days');
        end_date=moment();
    }
    type_sort();

}
function type_sort() {
    var e = document.getElementById("select-sort");
    var e1 = document.getElementById("select-date");
    var option_type = e.options[e.selectedIndex].value;
    var option_date= e1.options[e1.selectedIndex].value;
      $( "#btt-thongke" ).addClass( "hide" );
    if(option_date == 2||option_date == "2"){
        $( "#date" ).removeClass( "hide" );
    }else if(option_date == 1||option_date == "1"){
        $( "#date" ).addClass( "hide" );
        start_date=moment().subtract(30, 'days');
        end_date=moment();
    }
    if(option_type==1){
        $.ajax({
            url: "bao-cao-ban-hang-day-du/get-data-detail",
            type: "post", //send it through get method
            data: JSON.stringify({
                start_date: start_date,
                end_date: end_date,
            }), contentType: "application/json",

            success: function (response) {
                if (response.response_code == "SUCC_EXEC") {
                    handle_data(option_type,response);
                } else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Lọc thống kê thất bại',
                        type: 'error'
                    });
                }

            },
            error: function (xhr) {
                //Do Something to handle error
                new PNotify({
                    title: 'Thông báo',
                    text: 'Lọc thống kê thất bại',
                    type: 'error'
                });
            }
        });
    }
    if(option_type==2){
        $.ajax({
            url: "bao-cao-ban-hang-day-du/get-data-person",
            type: "post", //send it through get method
            data: JSON.stringify({
                start_date: start_date,
                end_date: end_date,
            }), contentType: "application/json",

            success: function (response) {
                if (response.response_code == "SUCC_EXEC") {
                    handle_data(option_type,response);
                } else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Lọc thống kê thất bại',
                        type: 'error'
                    });
                }

            },
            error: function (xhr) {
                //Do Something to handle error
                new PNotify({
                    title: 'Thông báo',
                    text: 'Lọc thống kê thất bại',
                    type: 'error'
                });
            }
        });
    }
    if(option_type==3){
        $.ajax({
            url: "bao-cao-ban-hang-day-du/get-data-order",
            type: "post", //send it through get method
            data: JSON.stringify({
                start_date: start_date,
                end_date: end_date,
            }), contentType: "application/json",

            success: function (response) {
                if (response.response_code == "SUCC_EXEC") {
                    handle_data(option_type,response);
                } else {
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Lọc thống kê thất bại',
                        type: 'error'
                    });
                }

            },
            error: function (xhr) {
                //Do Something to handle error
                new PNotify({
                    title: 'Thông báo',
                    text: 'Lọc thống kê thất bại',
                    type: 'error'
                });
            }
        });
    }


}


function handle_data(option_type,response) {
    if(option_type==1){
        $('#product').removeClass("hide");
        $('#person').addClass("hide");
        $('#order').addClass("hide");
        var table = $('#table-product').DataTable();
        table
            .clear()
            .draw();
        for(var index=0;index<response.data.length;index++){
            var obj = response.data[index];
            var product_code = obj.product_code;
            var product_name = obj.product_name;
            var total_product_quantity=null;

            var first_store=obj.first_store;
            var end_store=obj.end_store;
            var first_sell=obj.first_sell;
            var end_sell=obj.end_sell;
            var present_store=obj.store;
            if(end_store==null && end_sell==null) {
                first_store=parseInt(first_store);
                end_store=parseInt(present_store);
                total_product_quantity=Math.abs(first_sell);
            }else if(first_sell==null && first_store==null){
                end_store=parseInt(end_store);
                first_store=0;
                total_product_quantity=Math.abs(first_sell);
            }else {
                end_store=parseInt(present_store)+parseInt(end_sell);
                first_store=parseInt(first_store);
                total_product_quantity=Math.abs(first_sell);
            }




            var total = total_product_quantity*obj.product_price;
            total = revert_money_to_normal(total+"");

            var NHC1=obj.product_cate1_name;
            var NHC2=obj.cate2_name;
            if(NHC1==null){
                NHC1=NHC2;
                NHC2=null;
            }


            if(total == "") {
                return;
            }
            total = format_money(total);

            console.log(total);
            console.log(445);
            table.row.add( [
                product_code,
                product_name,
                NHC1,
                first_store,
                end_store,
                total_product_quantity,
                total
            ] ).draw();
        }
    }
    else if(option_type==2){
        $('#person').removeClass("hide");
        $('#product').addClass("hide");
        $('#order').addClass("hide");
        var table = $('#table-person').DataTable();
        table
            .clear()
            .draw();
        for(var index=0;index<response.data.length;index++){
            var obj = response.data[index];
            var fullname = obj.fullname;
            var email = obj.email;
            var total_amount = obj.total_amount;
            total_amount = revert_money_to_normal(total_amount+"");
            if(total_amount == "") return;
            total_amount = format_money(total_amount);

            var total_quantity = obj.total_quantity;
            table.row.add( [
                fullname,
                email,
                total_quantity,
                total_amount
            ] ).draw();
        }
    }
    else if(option_type==3){
        $('#order').removeClass("hide");
        $('#product').addClass("hide");
        $('#person').addClass("hide");
        var table = $('#table-order').DataTable();
        table
            .clear()
            .draw();
        for(var index=0;index<response.data.length;index++){
            var obj = response.data[index];
            var fullname = obj.fullname;
            var code=obj.code;
            var address= obj.address_delivery;



            var total_amount = obj.total_amount;
            total_amount = revert_money_to_normal(total_amount+"");
            if(total_amount == "") return;
            total_amount = format_money(total_amount);

            table.row.add( [
                code,
                fullname,
                address,
                total_amount

            ] ).draw();
        }

    }

}




// Dữ liệu table
(function( $ ) {

    'use strict';

    var datatableInit = function() {
        var $table = $('#table-product');

        $table.dataTable({
            sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
            oTableTools: {
                sSwfPath: $table.data('swf-path'),
                aButtons: []
            }
        });

        var $table1 = $('#table-person');

        $table1.dataTable({
            sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
            oTableTools: {
                sSwfPath: $table.data('swf-path'),
                aButtons: []
            }
        });

        var $table2 = $('#table-order');

        $table2.dataTable({
            sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
            oTableTools: {
                sSwfPath: $table.data('swf-path'),
                aButtons: []
            }
        });

    };

    $(function() {
        datatableInit();
    });

}).apply( this, [ jQuery ]);

(function( $ ) {

	'use strict';

	/*
	Basic
	*/
	$('.modal-basic').magnificPopup({
		type: 'inline',
		preloader: false,
		modal: true
	});

	/*
	Sizes
	*/
	$('.modal-sizes').magnificPopup({
		type: 'inline',
		preloader: false,
		modal: true
	});

	/*
	Modal with CSS animation
	*/
	$('.modal-with-zoom-anim').magnificPopup({
		type: 'inline',

		fixedContentPos: false,
		fixedBgPos: true,

		overflowY: 'auto',

		closeBtnInside: true,
		preloader: false,

		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in',
		modal: true
	});

	$('.modal-with-move-anim').magnificPopup({
		type: 'inline',

		fixedContentPos: false,
		fixedBgPos: true,

		overflowY: 'auto',

		closeBtnInside: true,
		preloader: false,

		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-slide-bottom',
		modal: true
	});

	/*
	Modal Dismiss
	*/
	$(document).on('click', '.modal-dismiss', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
	});

	/*
	Modal Confirm
	*/


	/*
	Form
	*/
	$('.modal-with-form').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#name',
		modal: true,

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#name';
				}
			}
		}
	});

	/*
	Ajax
	*/
	$('.simple-ajax-modal').magnificPopup({
		type: 'ajax',
		modal: true
	});

}).apply( this, [ jQuery ]);