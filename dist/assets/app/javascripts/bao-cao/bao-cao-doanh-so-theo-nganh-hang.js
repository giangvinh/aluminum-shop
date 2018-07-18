/*
Name: 			UI Elements / Modals - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.4.0
*/

start_date = null;
end_date = null;
var diff;
var chartBaoCao;
var isNhCap1=false;
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
    custom_sort(start_date,end_date)

});
$('#ip-begin-date').on('hide.daterangepicker', function (ev, picker) {
    start_date = picker.startDate;
    end_date = picker.endDate;

});
var chartCap2 = {
    productAmount:[],
    productCateId:[],
    productCateName:[],
    productCateParentId:[],
    productCateParentName:[]
};


function nganhang_sort() {
    var e1 = document.getElementById("select-date");
    var option_date = e1.options[e1.selectedIndex].value;

    if(option_date==1||option_date=="1"){
        isNhCap1=true;
        change_sort(start_date,end_date);
    } else if (option_date==2||option_date=="2") {
        isNhCap1=true;
        custom_sort(start_date,end_date);
    }

}


function custom_sort(start_date,end_date) {

    $.ajax({
        url: "bao-cao-doanh-so-theo-nganh-hang/get-data-custom-nostatus",
        type: "post", //send it through get method
        data: JSON.stringify({
            start_date: start_date.format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
            end_date: end_date.format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                chartCap2.productAmount=[];
                chartCap2.productCateId=[];
                chartCap2.productCateName=[];
                chartCap2.productCateParentId=[];
                chartCap2.productCateParentName=[];

                //khoitao

                if(response.data.length>0) {
                    chartCap2.productCateId[0]=response.data[0].cate2_id;
                    chartCap2.productCateName[0]=response.data[0].cate_name;
                    chartCap2.productCateParentId[0]=response.data[0].cate1_id;
                    chartCap2.productCateParentName[0]=response.data[0].cate1_name;
                    chartCap2.productAmount[0]=0;
                    var o=0;
                    for (i=0;i<response.data.length;i++){
                        var des=chartCap2.productCateId.length;
                        var flag=false;
                        while (des>0){
                            if(chartCap2.productCateId[des-1]==response.data[i].cate2_id){
                                flag=false;
                                break;
                            }
                            else {
                                flag=true;
                            }
                            des--;
                        }
                        if(flag){
                            o++;
                            chartCap2.productCateId[o]=response.data[i].cate2_id;
                            chartCap2.productCateName[o]=response.data[i].cate_name;
                            chartCap2.productCateParentId[o]=response.data[i].cate1_id;
                            chartCap2.productCateParentName[o]=response.data[i].cate1_name;
                            chartCap2.productAmount[o]=0;
                        }

                    }
                    for (i=0;i<response.data.length;i++){
                        for (j=0;j<chartCap2.productCateId.length;j++){
                            if(response.data[i].cate2_id==chartCap2.productCateId[j]){
                                chartCap2.productAmount[j]+= response.data[i].total_after_promotion;
                            }

                        }
                    }
                }

                // findChart1();

                thongKeBanHangChart(false,isNhCap1);
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





function change_sort(start_date,end_date) {
    var e = document.getElementById("select-date");
    var option_date = e.options[e.selectedIndex].value;

    if(option_date == 2){
        $( "#date" ).removeClass( "hide" );
        return;
    }else {
        $( "#date" ).addClass( "hide" );
        start_date =  moment().subtract(7, 'days');
        end_date = moment();
    }


    $.ajax({
        url: "bao-cao-doanh-so-theo-nganh-hang/get-data-custom-nostatus",
        type: "post", //send it through get method
        data: JSON.stringify({
            start_date: start_date.format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
            end_date: end_date.format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                chartCap2.productAmount=[];
                chartCap2.productCateId=[];
                chartCap2.productCateName=[];
                chartCap2.productCateParentId=[];
                chartCap2.productCateParentName=[];

                //khoitao

                if(response.data.length>0) {
                    chartCap2.productCateId[0]=response.data[0].cate2_id;
                    chartCap2.productCateName[0]=response.data[0].cate_name;
                    chartCap2.productCateParentId[0]=response.data[0].cate1_id;
                    chartCap2.productCateParentName[0]=response.data[0].cate1_name;
                    chartCap2.productAmount[0]=0;
                    var o=0;
                    for (i=0;i<response.data.length;i++){
                        var des=chartCap2.productCateId.length;
                        var flag=false;
                        while (des>0){
                            if(chartCap2.productCateId[des-1]==response.data[i].cate2_id){
                                flag=false;
                                break;
                            }
                            else {
                                flag=true;
                            }
                            des--;
                        }
                        if(flag){
                            o++;
                            chartCap2.productCateId[o]=response.data[i].cate2_id;
                            chartCap2.productCateName[o]=response.data[i].cate_name;
                            chartCap2.productCateParentId[o]=response.data[i].cate1_id;
                            chartCap2.productCateParentName[o]=response.data[i].cate1_name;
                            chartCap2.productAmount[o]=0;
                        }

                    }
                    for (i=0;i<response.data.length;i++){
                        for (j=0;j<chartCap2.productCateId.length;j++){
                            if(response.data[i].cate2_id==chartCap2.productCateId[j]){
                                chartCap2.productAmount[j]+= response.data[i].total_after_promotion;
                            }

                        }
                    }
                }

                // findChart1();

                thongKeBanHangChart(false,isNhCap1);
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

// function findChart1() {
//     chartCap1.productCate1Id[0]=chartCap2.productCateParentId[0];
//     chartCap1.productCate2Amount[0]=0;
//     chartCap1.productCate1Name[0]=chartCap2.productCateParentName[0];
//
//     if(chartCap2.productCateId.length>0){
//         var o=0;
//         for (i=0;i<chartCap2.productCateParentId.length;i++){
//             var des=chartCap1.productCate1Id.length;
//             var flag=false;
//             while (des>0){
//                 if(chartCap1.productCate1Id[des-1]==chartCap2.productCateParentId[i]){
//                     flag=false;
//                     break;
//                 }
//                 else {
//                     flag=true;
//                 }
//                 des--;
//             }
//             if(flag){
//                 o++;
//                 chartCap1.productCate1Id[o]=chartCap2.productCateParentId[i];
//                 chartCap1.productCate2Amount[o]=0;
//                 chartCap1.productCate1Name[o]=chartCap2.productCateParentName[i];
//             }
//
//         }
//     }
//
//     for (i=0;i<chartCap2.productCateId.length;i++){
//         for (j=0;j<chartCap1.productCate1Id.length;j++){
//             if(chartCap1.productCate1Id[j]==chartCap2.productCateParentId[i]){
//                 chartCap1.productCate2Amount[j]+= chartCap2.productAmount[i];
//             }
//
//         }
//     }
// }


function thongKeBanHangChart(isLoad,isCap1) {

    if(isLoad==true){
        change_sort(moment().subtract(7, 'days').format("YYYY-MM-DDTHH:mm:ss.SSSZ"),moment().format("YYYY-MM-DDTHH:mm:ss.SSSZ"));
    }
    $( "#btt-loadChart" ).addClass( "hide" );




    if( chartBaoCao){
        chartBaoCao.destroy();
    }


    var chartData = {
        labels: chartCap2.productCateName,
        datasets: [{
            label: 'Doanh số',
            data: chartCap2.productAmount,
            backgroundColor: [
                "rgba(220,20,60 ,1)",
                "rgba(47,79,79 ,1)",
                "rgba(165,42,42 ,1)",
                "rgba(255,255,0 ,1)",
                "rgba(64,224,208 ,1)",
                "rgba(123,104,238 ,1)",
                "rgba(148,0,211 ,1)",
                "rgba(105,105,105 ,1)",
                "rgba(205,92,92 ,1)",
                "rgba(240,128,128 ,1)",
                "rgba(219,112,147 ,1)",
                "rgba(250,128,114 ,1)",
                "rgba(60,179,113 ,1)",
                "rgba(154,205,50 ,1)",
                "rgba(0,128,128 ,1)",
                "rgba(230,230,250 ,1)",
                "rgba(216,191,216 ,1)",
                "rgba(221,160,221 ,1)",

            ],
        }]
    }
    var ctx = document.getElementById('Chart-bcdstnh').getContext('2d');
    chartBaoCao = new Chart(ctx, {
        type: 'polarArea',
        data: chartData
        ,options: {
            tooltips: {
                callbacks: {
                    label: function(t, d) {
                        var xLabel = d.datasets[t.datasetIndex].label;
                        var yLabel = t.yLabel >= 1000 ?  t.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") :  t.yLabel;
                        return xLabel + ': ' + yLabel;
                    }
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        callback: function(value, index, values) {
                            if (parseInt(value) >= 1000) {
                                return  value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            } else {
                                return  value;
                            }
                        }
                    }
                }]
            }
        }

    });



}


