/*
Name: 			UI Elements / Modals - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.4.0
*/

var all_pr_total=0;
function get_gift_product(purchase_order_detail_id, callback) {
    $.ajax({
        url: "danh-sach-don-hang/getGiftProduct",
        type: "post", //send it through get method
        data: JSON.stringify({
            purchase_order_detail_id : purchase_order_detail_id
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
               callback(response.data);
            }
        }
    });
}

function showProductWithoutPromotion(html, product) {
    html.push(
        '<tr class="b-top-none">',
        '<td><label class="mb-none"><strong>Tên sản phẩm:</strong></label></td>',
        '<td>' + product.product_title + (product.order_detail_color_name ? ' (Màu sắc: ' + product.order_detail_color_name + ')' : '') +'</td>',
        '</tr>',
        '<tr class="b-top-none">',
        '<td><label class="mb-none"><strong>Danh mục:</strong></label></td>',
        '<td>' + (product.order_detail_category_name ? product.order_detail_category_name : 'Không có') + '</td>',
        '</tr>',
        '<tr class="b-top-none">',
        '<td><label class="mb-none"><strong>Số lượng:</strong></label></td>',
        '<td>' + product.order_detail_quantity + '</td>',
        '<td></td>',
        '<td></td>',
        '<td></td>',
        '<td><label class="mb-none"><strong>Thành tiền:</strong></label></td>',
        '<td colspan="2" align="right" id="price_product" >' + format(Math.floor(parseInt(product.order_detail_total_amount))) + ' VNĐ</td>',
        '</tr>'
    );
    all_pr_total+=Math.floor(parseInt(product.order_detail_total_amount));



}

function showProductWithPromotion(html, product, index) {
    var type = null;

    if (product.order_detail_price_promotion != null) {
        html.push(
            '<tr class="b-top-none">',
            '<td><label class="mb-none"><strong>Tên sản phẩm:</strong></label></td></td>',
            '<td>' + product.product_title + (product.order_detail_color_name ? ' (Màu sắc: ' + product.order_detail_color_name + ')' : '') + '</td>',
            '</tr>',
            '<tr class="b-top-none">',
            '<td><label class="mb-none"><strong>Danh mục:</strong></label></td>',
            '<td>' + (product.order_detail_category_name ? product.order_detail_category_name : 'Không có') + '</td>',
            '</tr>'
        );
        html.push(
            '<tr class="b-top-none">',
            '<td><label class="mb-none"><strong>Phần trăm chiết khấu được giảm:</strong></label></td>',
            '<td>' + product.order_detail_percent_promotion + ' %</td>',
            '</tr>',
            '<tr class="b-top-none">',
            '<td><label class="mb-none"><strong>Số lượng:</strong></label></td>',
            '<td>' + product.order_detail_quantity + '</td>',
            '<td></td>',
            '<td></td>',
            '<td></td>',
            '<td><label class="mb-none"><strong>Giá sau chiết khấu:</strong></label></td>',
            '<td colspan="2" align="right" id="price_product' + index + '" >' + format(Math.floor(parseInt(product.order_detail_price_promotion))) + ' VNĐ</td>',
            '</tr>'
        );
        all_pr_total+=Math.floor(parseInt(product.order_detail_price_promotion));
    }
}

function handle_data(index,temp,html,src,datatable,tr) {
    if(index > (temp.length-1)) return;


    if (temp != null) {
        all_pr_total=0;

        temp.products.forEach(function (product, index) {



            if (!product.order_detail_is_promotion) {
                showProductWithoutPromotion(html, product);
            } else {
                showProductWithPromotion(html, product, index);
            }
            html.push(
                '<tr class="bottom-line-break">',
                '<td colspan="30"></td>',
                '</tr>'
            );

        });

        // html.push(
        //     '<tr class="b-top-none">',
        //     '<td><label class="mb-none"></label></td>',
        //     '<td></td>',
        //     '<td><label class="mb-none"></label></td></td>',
        //     '<td></td>',
        //     '<td><label class="mb-none"></label></td>',
        //     '<td><label class="mb-none"><strong>Giá vận chuyển:</strong></label></td>',
        //     '<td colspan="2" align="right">' + format(temp.phi_van_chuyen) + ' VNĐ</td>',
        //     '</tr>'
        // );

        if (temp.couponApplied) {
            html.push(
                '<tr class="b-top-none">',
                '<td><label class="mb-none"></label></td>',
                '<td></td>',
                '<td><label class="mb-none"></label></td></td>',
                '<td></td>',
                '<td><label class="mb-none"></label></td>',
                '<td><label class="mb-none"><strong>Khuyễn mãi coupon:</strong></label></td>',
                '<td colspan="2" align="right">' + format(temp.coupon_discount) + ' VNĐ</td>',
                '</tr>'
            );
        }

        html.push(
            '<tr class="b-top-none">',
            '<td><label class="mb-none"></label></td>',
            '<td></td>',
            '<td><label class="mb-none"></label></td></td>',
            '<td></td>',
            '<td><label class="mb-none"></label></td>',
            '<td><label class="mb-none"><strong>Tổng cộng:</strong></label></td>',
            '<td colspan="2" align="right">' + format(all_pr_total) + ' VNĐ</td>',
            '</tr>'
        );
        html.push('</table>');
        datatable.fnOpen(tr, html.join(""), 'details');
    }
}

get_gia_van_chuyen();


(function( $ ) {

    'use strict';

    var datatableInit = function() {
        var $table = $('#datatable-tabletools');

        // format function for row details
        var fnFormatDetails = function( datatable, tr ) {
            var data = datatable.fnGetData( tr );
			var src = JSON.parse(tr.attributes.object.value);
            return [
                '<table class="table mb-none">',
                '<tr class="b-top-none">',
                '<td><label class="mb-none"><strong>Tên sản phẩm:</strong></label></td></td>',
                '<td>' + src.product_title+ '</td>',
                '<td><label class="mb-none"><strong>Giá:</strong></label></td>',
                '<td>' + format(src.price)+ '</td>',
                '<td><label class="mb-none"><strong>Số lượng:</strong></label></td>',
                '<td>' + src.quantity+ '</td>',
                '</tr>',
                '</div>'
            ].join('');


        };

        // insert the expand/collapse column
        var th = document.createElement( 'th' );
        var td = document.createElement( 'td' );
        td.innerHTML = '<i data-toggle class="fa fa-plus-square-o text-primary h5 m-none" style="cursor: pointer;"></i>';
        td.className = "text-center";

        $table
            .find( 'thead tr' ).each(function() {
            this.insertBefore( th, this.childNodes[0] );
        });

        $table
            .find( 'tbody tr' ).each(function() {
            this.insertBefore(  td.cloneNode( true ), this.childNodes[0] );
        });

        // initialize
        var datatable = $table.dataTable({
            aoColumnDefs: [{
                type: 'extract-date',
                targets: [1]
            }],

            aaSorting: [
                [1, 'desc']
            ]
        });

        // add a listener
        $table.on('click', 'i[data-toggle]', function() {
            var $this = $(this),
                tr = $(this).closest( 'tr' ).get(0);

            if ( datatable.fnIsOpen(tr) ) {
                $this.removeClass( 'fa-minus-square-o' ).addClass( 'fa-plus-square-o' );
                datatable.fnClose( tr );
            } else {
                $this.removeClass( 'fa-plus-square-o' ).addClass( 'fa-minus-square-o' );
                var src = JSON.parse(tr.attributes.object.value);
                $.ajax({
                    url: "danh-sach-don-hang/getPurchaseDetails",
                    type: "post", //send it through get method
                    data: JSON.stringify({
                        order_id: src.id
                    }), contentType: "application/json",
                    success: function (response) {
                        if (response.response_code == "SUCC_EXEC") {
                            var html = ['<table class="table mb-none">'];
                            handle_data(0,response.data,html,src,datatable,tr);
                            console.log(response.data);
                            console.log(4385934875);


                        }
                    }
                });

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


//
// $(document).ready(function () {
//
//     $.extend(jQuery.fn.dataTableExt.oSort, {
//         "extract-date-pre": function(value) {
//             var date = $(value, 'span')[0].innerHTML;
//             date = date.split('-');
//             return Date.parse(date[1] + '-' + date[0] + '-' + date[2])
//         },
//         "extract-date-asc": function(a, b) {
//             return ((a < b) ? -1 : ((a > b) ? 1 : 0));
//         },
//         "extract-date-desc": function(a, b) {
//             return ((a < b) ? 1 : ((a > b) ? -1 : 0));
//         }
//     });
// });


//New code
