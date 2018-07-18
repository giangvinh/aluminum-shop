var current_product_id = null;
var current_product_code = null;
var current_product_name = null;
var current_product_quantity = null;
var current_product_price=null;
var current_product_total=0;
var current_color=null;
var current_category=null;
var current_unit=null;
var all_product_total=0;
var second_code=null;
var second_name=null;
var isLoad=true;
var all_product=null;
var is_add_action = false;
var inc=0;
var incs=0;
var aldready=[];


function check_exist(product_id,callback) {
    $.ajax({
        url: "/admin/them-don-hang/count",
        type: "post", //send it through get method
        data: JSON.stringify({
            product_id: product_id
        }), contentType: "application/json",

        success: function (response) {

            if (response.response_code == "SUCC_EXEC") {
                var number = response.data;
                if(number > 0){
                    new PNotify({
                        title: 'Thông báo',
                        text: 'Sản phẩm này đã tồn tại trong danh sách',
                        type: 'error'
                    });
                }else {
                    callback();
                }
                return true;
            }

        },
        error: function (xhr) {

        }
    });
}


function all_total() {
    all_product_total=0;
    var table = document.getElementById('datatable-tabletools');
    if(table.rows[1].cells[0].innerHTML!='No data available in table'){
        for (var r = 1, n = table.rows.length; r < n; r++) {
            var total = table.rows[r].cells[8].getAttribute("data-value");
            all_product_total+=parseFloat(total);
            table.rows[r].cells[0].innerHTML=r;
        }
    }

    // var table1 = document.getElementById('datatable-tabletools-sub');
    // if(table1.rows[1].cells[0].innerHTML!='No data available in table'){
    //     for (var r = 1, n = table1.rows.length; r < n; r++) {
    //         var total = parseInt(revert_money_to_normal(table1.rows[r].cells[6].innerHTML));
    //         table1.rows[r].cells[6].setAttribute("data-value",parseFloat(total.toFixed(2)));
    //         table1.rows[r].cells[6].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
    //         table1.rows[r].cells[0].innerHTML=r;
    //         all_product_total+=parseFloat(total.toFixed(2));
    //     }
    // }

    all_product_total=format_money(all_product_total+"");
    $("#lb-tt").text(all_product_total);

}


// function change_money() {
//     var ckPercent=document.getElementById("ip-ck").value;
//     if(all_product_total!=null){
//         var total=revert_money_to_normal(all_product_total+"");
//         var money_after_ck= (total * ckPercent)/100;
//         document.getElementById("ip-cktt").value=format_money(money_after_ck+"");
//         $("#lb-cktt1").text(format_money(money_after_ck+""));
//         var thd=total-money_after_ck;
//         $("#lb-thd").text(format_money(thd+""));
//     }
//
// }
//
// function change_percent() {
//     var ckMoney=document.getElementById("ip-cktt").value;
//     ckMoney=revert_money_to_normal(ckMoney);
//     if(all_product_total!=null){
//         var total=revert_money_to_normal(all_product_total+"");
//
//         var ckPercent=ckMoney*100/total;
//         document.getElementById("ip-ck").value=ckPercent;
//
//         $("#lb-cktt1").text(format_money(ckMoney+""));
//         var thd=total-ckMoney;
//         $("#lb-thd").text(format_money(thd+""));
//     }
//
// }

function dynamicTotal(inp) {
    inp.addEventListener("input", function(e) {
        var sl=parseFloat(inp.parentElement.parentElement.children[6].children[0].value);
        var ck=parseInt(inp.parentElement.parentElement.children[7].children[0].value);
        var price=parseFloat(revert_money_to_normal(inp.parentElement.parentElement.children[5].innerHTML));
        if(isNaN(sl) && sl==0){
            inp.parentElement.parentElement.children[8].innerHTML="";
            inp.parentElement.parentElement.children[8].setAttribute("data-value",0);
            return;
        }
        if(price>0 && !isNaN(sl) && !isNaN(ck)){
            var total=sl*price;
            inp.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
            if(sl>0 && ck!=0){
                var tmp=total;
                total=total-total*ck/100;
                inp.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                inp.parentElement.parentElement.children[8].innerHTML='<span style="text-decoration: line-through;">('+format_money(parseFloat(tmp.toFixed(2))+"")+")</span>" +
                    '  <span style="color:red;">'+format_money(parseFloat(total.toFixed(2))+"")+"</span>";
            }else if(sl>0 && ck==0) {
                inp.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
            }
        }else {
            inp.parentElement.parentElement.children[8].innerHTML="";
            inp.parentElement.parentElement.children[8].setAttribute("data-value",0);
        }
    });

}


function autocompleteCate(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        var signedChars     = "àảãáạăằẳẵắặâầẩẫấậđèẻẽéẹêềểễếệìỉĩíịòỏõóọôồổỗốộơờởỡớợùủũúụưừửữứựỳỷỹýỵÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬĐÈẺẼÉẸÊỀỂỄẾỆÌỈĨÍỊÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢÙỦŨÚỤƯỪỬỮỨỰỲỶỸÝỴ";
        var unsignedChars   = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";
        var pattern = new RegExp("[" + signedChars + "]", "g");
        var diction="phụ kiện";
        diction = diction.toUpperCase().replace(pattern, function (m, key, value) {
            return unsignedChars.charAt(signedChars.indexOf(m));
        });
        var inputText = inp.value.toUpperCase().replace(pattern, function (m, key, value) {
            return unsignedChars.charAt(signedChars.indexOf(m));
        });


        if(inputText.indexOf(diction)>=0){
            inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].disabled=true;
            inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].disabled=true;
            inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value="";
            inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].value=0;

        }else {
            inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].disabled=false;
            inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].disabled=false;

        }


        for(var c in all_product.data){
            if(all_product.data[c].productcategory_name.toLowerCase() == inp.value.toLowerCase()){
                if(all_product.data[c].product_color.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value.toLowerCase()){
                    if(all_product.data[c].name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[1].children[0].children[0].children[0].value.toLowerCase()){
                        inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                        inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                        var sl=parseFloat(all_product.data[c].product_unit);
                        var price=format_money(all_product.data[c].price+"");;
                        if(price>0 && !isNaN(sl)){
                            if(sl>0) {
                                var total=sl*price;
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                            }
                        }else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                        }
                        break;
                    }
                }
            } else {
                inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
            }
        }

        if (!val) { return false;}
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        a.setAttribute("style", "important");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        var incIndex=0;
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            /*check if the item starts with the same letters as the text field value:*/
            var signedChars     = "àảãáạăằẳẵắặâầẩẫấậđèẻẽéẹêềểễếệìỉĩíịòỏõóọôồổỗốộơờởỡớợùủũúụưừửữứựỳỷỹýỵÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬĐÈẺẼÉẸÊỀỂỄẾỆÌỈĨÍỊÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢÙỦŨÚỤƯỪỬỮỨỰỲỶỸÝỴ";
            var unsignedChars   = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";
            var pattern = new RegExp("[" + signedChars + "]", "g");
            var diction = arr[i].substr(0, val.length).toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });
            var inputText = val.toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });

            if (diction == inputText) {
                /*create a DIV element for each matching element:*/
                b = document.createElement("DIV");
                /*make the matching letters bold:*/
                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                b.innerHTML += arr[i].substr(val.length);
                /*insert a input field that will hold the current array item's value:*/
                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                /*execute a function when someone clicks on the item value (DIV element):*/
                b.addEventListener("click", function(e) {
                    /*insert the value for the autocomplete text field:*/
                    inp.value = this.getElementsByTagName("input")[0].value;


                    if(inp.value.toLowerCase().indexOf("phụ kiện")>=0){
                        inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].disabled=true;
                        inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].disabled=true;
                        inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value="";
                        inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].value=0;


                    }else {
                        inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].disabled=false;
                        inp.parentElement.parentElement.parentElement.parentElement.children[7].children[0].disabled=false;

                    }
                    for(var c in all_product.data){
                        if(all_product.data[c].productcategory_name.toLowerCase() == inp.value.toLowerCase()){
                            if(all_product.data[c].product_color.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value.toLowerCase()){
                                if(all_product.data[c].name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[1].children[0].children[0].children[0].value.toLowerCase()){
                                    inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                                    inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                                    var sl=parseFloat(all_product.data[c].product_unit);
                                    var price=format_money(all_product.data[c].price+"");;
                                    if(price>0 && !isNaN(sl)){
                                        if(sl>0) {
                                            var total=sl*price;
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                                        }
                                    }else {
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                                    }
                                    break;
                                }
                            }
                        } else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                            inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
                        }
                    }


                    /*close the list of autocompleted values,
                    (or any other open lists of autocompleted values:*/
                    closeAllLists();
                });
                a.appendChild(b);
                incIndex++;
                if(incIndex>4){
                    break;
                }
            }
        }
    });



    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function(e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });
    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}


function autocompleteColor(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();



        for(var c in all_product.data){
            if(all_product.data[c].product_color.toLowerCase() == inp.value.toLowerCase()){
                if(all_product.data[c].productcategory_name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[2].children[0].children[0].children[0].value.toLowerCase()){
                    if(all_product.data[c].name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[1].children[0].children[0].children[0].value.toLowerCase()){
                        inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                        inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                        var sl=parseFloat(all_product.data[c].product_unit);
                        var price=format_money(all_product.data[c].price+"");;
                        if(price>0 && !isNaN(sl)){
                            if(sl>0) {
                                var total=sl*price;
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                            }
                        }else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                        }
                        break;
                    }
                }
            } else {
                inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
            }
        }

        if (!val) { return false;}
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        a.setAttribute("style", "important");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        var incIndex=0;
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            /*check if the item starts with the same letters as the text field value:*/
            var signedChars     = "àảãáạăằẳẵắặâầẩẫấậđèẻẽéẹêềểễếệìỉĩíịòỏõóọôồổỗốộơờởỡớợùủũúụưừửữứựỳỷỹýỵÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬĐÈẺẼÉẸÊỀỂỄẾỆÌỈĨÍỊÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢÙỦŨÚỤƯỪỬỮỨỰỲỶỸÝỴ";
            var unsignedChars   = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";
            var pattern = new RegExp("[" + signedChars + "]", "g");
            var diction = arr[i].substr(0, val.length).toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });
            var inputText = val.toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });

            if (diction == inputText) {
                /*create a DIV element for each matching element:*/
                b = document.createElement("DIV");
                /*make the matching letters bold:*/
                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                b.innerHTML += arr[i].substr(val.length);
                /*insert a input field that will hold the current array item's value:*/
                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                /*execute a function when someone clicks on the item value (DIV element):*/
                b.addEventListener("click", function(e) {
                    /*insert the value for the autocomplete text field:*/
                    inp.value = this.getElementsByTagName("input")[0].value;

                    for(var c in all_product.data){
                        if(all_product.data[c].product_color.toLowerCase() == inp.value.toLowerCase()){
                            if(all_product.data[c].productcategory_name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[2].children[0].children[0].children[0].value.toLowerCase()){
                                if(all_product.data[c].name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[1].children[0].children[0].children[0].value.toLowerCase()){
                                    inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                                    inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                                    var sl=parseFloat(all_product.data[c].product_unit);
                                    var price=format_money(all_product.data[c].price+"");;
                                    if(price>0 && !isNaN(sl)){
                                        if(sl>0) {
                                            var total=sl*price;
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                                        }
                                    }else {
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                                    }
                                    break;
                                }
                            }
                        } else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                            inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
                        }
                    }




                    /*close the list of autocompleted values,
                    (or any other open lists of autocompleted values:*/
                    closeAllLists();
                });
                a.appendChild(b);
                incIndex++;
                if(incIndex>4){
                    break;
                }
            }
        }
    });



    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function(e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });
    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}



function autocompleteName(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();


        for(var c in all_product.data){
            if(all_product.data[c].name.toLowerCase() == inp.value.toLowerCase()){
                if(all_product.data[c].productcategory_name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[2].children[0].children[0].children[0].value.toLowerCase()){
                    if(all_product.data[c].product_color.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value.toLowerCase()){
                        inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                        inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                        var sl=parseFloat(all_product.data[c].product_unit);
                        var price=format_money(all_product.data[c].price+"");;
                        if(price>0 && !isNaN(sl)){
                            if(sl>0) {
                                var total=sl*price;
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                            }
                        }else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                        }
                        break;
                    }
                }
            } else {
                inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
            }
        }

        if (!val) { return false;}
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        a.setAttribute("style", "important");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        var incIndex=0;
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            /*check if the item starts with the same letters as the text field value:*/
            var signedChars     = "àảãáạăằẳẵắặâầẩẫấậđèẻẽéẹêềểễếệìỉĩíịòỏõóọôồổỗốộơờởỡớợùủũúụưừửữứựỳỷỹýỵÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬĐÈẺẼÉẸÊỀỂỄẾỆÌỈĨÍỊÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢÙỦŨÚỤƯỪỬỮỨỰỲỶỸÝỴ";
            var unsignedChars   = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";
            var pattern = new RegExp("[" + signedChars + "]", "g");
            var diction = arr[i].substr(0, val.length).toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });
            var inputText = val.toUpperCase().replace(pattern, function (m, key, value) {
                return unsignedChars.charAt(signedChars.indexOf(m));
            });

            if (diction == inputText) {
                /*create a DIV element for each matching element:*/
                b = document.createElement("DIV");
                /*make the matching letters bold:*/
                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                $(b).attr("data",JSON.stringify(all_product.data[i]));
                b.innerHTML += arr[i].substr(val.length);
                /*insert a input field that will hold the current array item's value:*/
                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                /*execute a function when someone clicks on the item value (DIV element):*/
                b.addEventListener("click", function(e) {
                    /*insert the value for the autocomplete text field:*/
                    inp.value = this.getElementsByTagName("input")[0].value;

                    for(var c in all_product.data){
                        if(all_product.data[c].name.toLowerCase() == inp.value.toLowerCase()){
                            if(all_product.data[c].productcategory_name.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[2].children[0].children[0].children[0].value.toLowerCase()){
                                if(all_product.data[c].product_color.toLowerCase() == inp.parentElement.parentElement.parentElement.parentElement.children[3].children[0].children[0].children[0].value.toLowerCase()){
                                    inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                                    inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                                    var sl=parseFloat(all_product.data[c].product_unit);
                                    var price=format_money(all_product.data[c].price+"");;
                                    if(price>0 && !isNaN(sl)){
                                        if(sl>0) {
                                            var total=sl*price;
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                                            inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                                        }
                                    }else {
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].setAttribute("data-value",0);
                                        inp.parentElement.parentElement.parentElement.parentElement.children[8].innerHTML="";
                                    }
                                    break;
                                }
                            }
                        } else {
                            inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                            inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
                        }
                    }



                    // var data = JSON.parse($(this).attr("data"));
                    // var unit = data.product_unit;
                    // var price = format_money(data.price+"");
                    // inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=unit
                    // inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=price;
                    // for(var c in all_product.data){
                    //     if(all_product.data[c].name.toLowerCase() == inp.value.toLowerCase()){
                    //         inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML=all_product.data[c].product_unit;
                    //         inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML=format_money(all_product.data[c].price+"");
                    //         break;
                    //     } else {
                    //         inp.parentElement.parentElement.parentElement.parentElement.children[4].innerHTML="";
                    //         inp.parentElement.parentElement.parentElement.parentElement.children[5].innerHTML="";
                    //     }
                    // }

                    /*close the list of autocompleted values,
                    (or any other open lists of autocompleted values:*/
                    closeAllLists();
                });
                a.appendChild(b);
                incIndex++;
                if(incIndex>4){
                    break;
                }
            }
        }
    });



    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function(e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });
    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}




/*An array containing all the country names in the world:*/
var countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];







// function set_select_option_data(product_id,is_major) {
//     if(is_major){
//         var e = document.getElementById("product_select");
//     }else {
//         var e = document.getElementById("product_select_sub");
//     }
//     var product_id = product_id;
//     var option = document.createElement("option");
//
//     for (var i=0;i<all_product.data.length;i++){
//         if(all_product.data[i].id==product_id){
//             option.id=all_product.data[i].code;
//             option.value=all_product.data[i].id;
//             option.text=all_product.data[i].name;
//             option.setAttribute("data-price",all_product.data[i].price);
//             option.setAttribute("data-name",all_product.data[i].name);
//             e.add(option);
//             return;
//         }
//     }
// }

function get_all_product() {
    $.ajax({
        url: "/admin/them-don-hang/getAllProduct",
        type: "post", //send it through get method
        data: JSON.stringify({
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                all_product=response;
                return true;
            }

        },
        error: function (xhr) {
        }
    });
}
get_all_product();

function add_product() {
    $('#addToTable').click();
}



function them_san_pham(isMajor) {

    if(isMajor){
        var e = document.getElementById("product_select");
    }else {
        var e = document.getElementById("product_select_sub");
    }
    current_product_id = e.options[e.selectedIndex].value;
    if (current_product_id == -1) {
        alert("Chưa chọn sản phẩm để thêm");
        return;
    }
    current_product_code = e.options[e.selectedIndex].id;
    current_product_name = e.options[e.selectedIndex].getAttribute("data-name");
    current_product_price = e.options[e.selectedIndex].getAttribute("data-price");

    var flag=true;
    for(var i=0;i<all_product.data.length;i++){
        if (all_product.data[i].id==current_product_id) {
            if(all_product.data[i].quantity<=0){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sản phẩm đã hết hàng',
                    type: 'error'
                });
                flag=false;
            }
        }
    }
    if(flag){
        for(var i=0;i<all_product.data.length;i++){
            if(current_product_id==all_product.data[i].id){
                current_category = all_product.data[i].productcategory_name;
                current_color = all_product.data[i].product_color;
                current_unit= all_product.data[i].product_unit;
            }
        }


        current_product_price = revert_money_to_normal(current_product_price);
        if(current_product_price == "") return;
        current_product_price = format_money(current_product_price);
        current_product_quantity = 1;
        e.remove(e.selectedIndex);


        var selector = $("#product_select").select2();
        selector.trigger("change");
        if(isMajor){
            var selector = $("#product_select").select2();
            selector.trigger("change");
            $('#addToTable').click();
        }else {
            var selector = $("#product_select_sub").select2();
            selector.trigger("change");
            $('#addToTableSub').click();
        }
    }




}


function Popup(data) {


    var fullname = $("#ip-name-kh").val();
    if (fullname.length == 0) {
        alert("Chưa thêm tên khách hàng");
        return;
    }else {
        $("#lb-name-kh").html('<strong>'+fullname+"</strong>");
    }

    var table = document.getElementById('datatable-tabletools');
    var inc=0;
    if(table.rows[1].cells[0].innerHTML!='No data available in table'){
        for (var r = 1, n = table.rows.length; r < n; r++) {
            var table_print = document.getElementById("datatable-print");
            var row = table_print.insertRow(r);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            var cell7 = row.insertCell(6);
            var cell8 = row.insertCell(7);
            var cell9 = row.insertCell(8);
            cell1.innerHTML = table.rows[r].cells[0].innerHTML;
            cell2.innerHTML = table.rows[r].cells[1].innerHTML;
            cell3.innerHTML = table.rows[r].cells[2].innerHTML;
            cell4.innerHTML = table.rows[r].cells[3].innerHTML;
            cell4.innerHTML = table.rows[r].cells[3].innerHTML;
            cell5.innerHTML = table.rows[r].cells[4].innerHTML;
            cell6.innerHTML = table.rows[r].cells[5].innerHTML;
            if(table.rows[r].cells[6].innerHTML.length > 60){
                cell7.innerHTML = table.rows[r].cells[6].children[0].value;
            }else {

                cell7.innerHTML = table.rows[r].cells[6].innerHTML;
            }

            if(table.rows[r].cells[7].innerHTML.length > 60){
                cell8.innerHTML = table.rows[r].cells[7].children[0].value;
            }else {

                cell8.innerHTML = table.rows[r].cells[7].innerHTML;
            }
            cell9.innerHTML = format_money(table.rows[r].cells[8].getAttribute("data-value"));
            cell9.style.textAlign="right";
            cell6.style.textAlign="right";
            cell7.style.textAlign="right";
            cell8.style.textAlign="right";

            inc=n;
        }

    }
    // inc--;
    //
    // var table = document.getElementById('datatable-tabletools-sub');
    // if(table.rows[1].cells[0].innerHTML!='No data available in table'){
    //     for (var r = 1, n = table.rows.length; r < n; r++) {
    //         inc++;
    //         if(inc==0){
    //             inc=1;
    //         }
    //         var table_print = document.getElementById("datatable-print");
    //         var row = table_print.insertRow(inc);
    //         var cell1 = row.insertCell(0);
    //         var cell2 = row.insertCell(1);
    //         var cell3 = row.insertCell(2);
    //         var cell4 = row.insertCell(3);
    //         var cell5 = row.insertCell(4);
    //         var cell6 = row.insertCell(5);
    //         var cell7 = row.insertCell(6);
    //         var cell8 = row.insertCell(7);
    //         var cell9 = row.insertCell(8);
    //         cell1.innerHTML = inc;
    //         cell2.innerHTML = table.rows[r].cells[1].innerHTML;
    //         cell3.innerHTML = table.rows[r].cells[2].innerHTML;
    //         cell4.innerHTML = "";
    //         cell5.innerHTML = table.rows[r].cells[3].innerHTML;
    //         cell6.innerHTML = table.rows[r].cells[4].innerHTML;
    //         if(table.rows[r].cells[5].innerHTML.length > 60){
    //             cell7.innerHTML = table.rows[r].cells[5].children[0].value;
    //         }else {
    //
    //             cell7.innerHTML = table.rows[r].cells[5].innerHTML;
    //         }
    //
    //         cell8.innerHTML = "";
    //
    //         cell9.innerHTML = format_money(table.rows[r].cells[6].getAttribute("data-value"));
    //         cell9.style.textAlign="right";
    //         cell6.style.textAlign="right";
    //         cell7.style.textAlign="right";
    //         cell8.style.textAlign="right";
    //     }
    // }

    var dt = new Date();
    var month = moment().format('MM'); //months from 1-12
    var day = moment().format('DD');
    var year = moment().format('YYYY');
    document.getElementById("day_print").innerHTML = " "+day+" ";
    document.getElementById("month_print").innerHTML = " "+month+" ";
    document.getElementById("year_print").innerHTML = " "+year+" ";

    $("#lb-thd-print").text($("#lb-tt").text());

    var printContents = document.getElementById(data).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    // $("#printable").printThis({
    //     importCSS: false,
    //     loadCSS: "",
    //     header: "",
    //     footer: ""
    // });

    window.location.href = "danh-sach-don-hang";

}

function removeA(arr) {
    var what, a = arguments, L = a.length, ax;
    while (L > 1 && arr.length) {
        what = a[--L];
        while ((ax= arr.indexOf(what)) !== -1) {
            arr.splice(ax, 1);
        }
    }
    return arr;
}


function add() {

    // purchaseOrder
    var fullname = $("#ip-name-kh").val();

    var chietKhau = null;
    var o_status = 1;
    var total_amount = 0;
    var total_quantity = 1;
    var percent_promotion = 0;
    var price_coupon = 0;
    var type=3;
    var list_product = [];
    var isPromo=0;
    var flag=false;
    var table = document.getElementById('datatable-tabletools');
    if(table.rows[1].cells[0].innerHTML!='No data available in table'){
        for (var r = 1, n = table.rows.length; r < n; r++) {
            var promo=0;
            var number_price = revert_money_to_normal(table.rows[r].cells[5].innerHTML);
            var product_promotion_percent=parseInt(table.rows[r].cells[7].innerHTML);
            var category_name=table.rows[r].cells[2].innerHTML;
            var color_name=table.rows[r].cells[3].innerHTML;
            var product_ishere=null;

            for(var c in all_product.data){
                if(all_product.data[c].name.toLowerCase()==table.rows[r].cells[1].innerHTML.toLowerCase()){
                    if(all_product.data[c].product_color.toLowerCase()==table.rows[r].cells[3].innerHTML.toLowerCase()){
                        if(all_product.data[c].productcategory_name.toLowerCase()==table.rows[r].cells[2].innerHTML.toLowerCase()){
                            product_ishere=all_product.data[c].id
                        }
                    }
                }
            }

            if(table.rows[r].cells[1].innerHTML.length>100){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Cần hoàn tất đơn hàng mới có thể in',
                    type: 'error'
                });
                return;
            }

            var product_promotion_price=0;
            if(product_promotion_percent!=0){
                flag=true;
                promo=1;
            }
            var total_amount=table.rows[r].cells[6].innerHTML * number_price;
            if(product_promotion_percent!=0){
                product_promotion_price=total_amount-product_promotion_percent*total_amount/100;
                product_promotion_price=parseFloat(product_promotion_price.toFixed(2));
            }
            list_product.push({
                product_id: product_ishere,
                product_quantity:parseFloat(table.rows[r].cells[6].innerHTML),
                product_total:total_amount,
                product_price:number_price,
                category_name:category_name,
                color_name:color_name,
                product_promotion_percent:product_promotion_percent,
                product_promotion_price:product_promotion_price,
                is_promo:promo
            });
        }

    }
    // var table1 = document.getElementById('datatable-tabletools-sub');
    // if(table1.rows[1].cells[0].innerHTML!='No data available in table'){
    //     for (var r = 1, n = table1.rows.length; r < n; r++) {
    //         var number_price = revert_money_to_normal(table1.rows[r].cells[4].innerHTML);
    //         var total_amount=table1.rows[r].cells[5].innerHTML * number_price;
    //         list_product.push({
    //             product_id: table1.rows[r].id.substring(8,table1.rows[r].id.length),
    //             product_quantity:revert_money_to_normal(table1.rows[r].cells[5].innerHTML),
    //             product_total:total_amount,
    //             product_price:number_price,
    //             product_promotion_percent:0,
    //             product_promotion_price:0,
    //             is_promo:0
    //         });
    //     }
    //
    // }

    // if(table1.rows.length<1 && table.rows.length<1){
    //     alert("Cần thêm sản phẩm cho đơn hàng");
    //     return;
    // }


    if (fullname.length == 0) {
        alert("Chưa thêm tên khách hàng");
        return;
    }

    all_product_total=revert_money_to_normal(all_product_total+"");

    $.ajax({
        url: "/admin/them-don-hang/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            fullname: fullname,
            email  : null,
            phone: null,
            address_delivery: null,
            total_amount: all_product_total,
            total_quantity: total_quantity,
            percent_promotion: null,
            price_coupon: null,
            list_product: list_product,
            type:type
        }),    contentType: "application/json",

        success: function (response) {
            if(response.response_code == "SUCC_EXEC"){
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm đơn hàng thành công',
                    type: 'success'
                });
                Popup("printable");
            }else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Thêm đơn hàng thất bại\n'+response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm đơn hàng thất bại',
                type: 'error'
            });
        }
    });

}





(function ($) {

    'use strict';

    var EditableTable = {

        options: {
            addButton: '#addToTable',
            table: '#datatable-tabletools',
            dialog: {
                wrapper: '#dialog',
                cancelButton: '#dialogCancel',
                confirmButton: '#dialogConfirm',
            }
        },

        initialize: function () {
            this
                .setVars()
                .build()
                .events();
        },

        setVars: function () {
            this.$table = $(this.options.table);
            this.$addButton = $(this.options.addButton);

            // dialog
            this.dialog = {};
            this.dialog.$wrapper = $(this.options.dialog.wrapper);
            this.dialog.$cancel = $(this.options.dialog.cancelButton);
            this.dialog.$confirm = $(this.options.dialog.confirmButton);

            return this;
        },

        build: function () {
            this.datatable = this.$table.DataTable({
                scrollX: true,
                paging: false,
                searching: false,
                aoColumns: [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    {"bSortable": false}
                ]
            });

            window.dt = this.datatable;
            this.datatable.order([0, 'asc']).draw();

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
                .on('click', 'a.save-row', function (e) {
                    e.preventDefault();
                    var _self = this;
                    var $row = $(this).closest('tr');

                    var product_id = $row[0].id.substr(8, $row[0].id.length);

                    var action="insert";
                    if (action == "insert") {
                        $row[0].id="product-"+product_id;
                        EditableTable.rowSave($row);
                        is_add_action = false;
                    }else if(action == "update"){
                        var id = "product-"+product_id;
                        if(is_add_action) {
                            if ($row[0].id == id) {

                                EditableTable.rowRemove($("#"+id));
                                EditableTable.rowSave($row);
                            }
                            is_add_action = false;
                        }else {
                            EditableTable.rowSave($row);
                        }
                        // $( "#"+id+" td:eq( 2 )" ).html(order);

                        var $actions = $row.find('td.actions');
                        if ( $actions.get(0) ) {
                            EditableTable.rowSetActionsDefault( $row );
                        }

                    }
                    EditableTable.datatable.order([0, 'asc']).draw();


                })
                .on('click', 'a.cancel-row', function (e) {
                    e.preventDefault();

                    _self.rowCancel($(this).closest('tr'));
                })
                .on('click', 'a.edit-row', function (e) {
                    e.preventDefault();
                    _self.rowEdit($(this).closest('tr'));
                })
                .on('click', 'a.remove-row', function (e) {
                    e.preventDefault();

                    var $row = $(this).closest('tr');
                    $.magnificPopup.open({
                        items: {
                            src: '#dialog',
                            type: 'inline'
                        },
                        preloader: false,
                        modal: true,
                        callbacks: {
                            change: function () {
                                _self.dialog.$confirm.on('click', function (e) {
                                    e.preventDefault();
                                    var product_id = $row[0].id.substr(8, $row[0].id.length);
                                    _self.rowRemove($row);
                                    $.magnificPopup.close();
                                    // remove_product(product_id,function () {
                                    //     _self.rowRemove($row);
                                    //     $.magnificPopup.close();
                                    // })

                                });
                            },
                            close: function () {
                                _self.dialog.$confirm.off('click');
                            }
                        }
                    });
                });

            this.$addButton.on('click', function (e) {
                e.preventDefault();


                _self.rowAdd();
            });

            this.dialog.$cancel.on('click', function (e) {
                e.preventDefault();
                $.magnificPopup.close();
            });

            return this;
        },

        // ==========================================================================================
        // ROW FUNCTIONS
        // ==========================================================================================
        rowAdd: function () {
            this.$addButton.attr({'disabled': 'disabled'});

            var actions,
                data,
                $row;

            actions = [
                '<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
                '<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
                '<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
                '<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
            ].join(' ');

                // current_product_total=revert_money_to_normal(current_product_price)*current_product_quantity;
                //
                // current_product_total=format_money(current_product_total+"");
                inc++;

                data = this.datatable.row.add([inc, "", "", "", current_unit, current_product_price,0,0,current_product_total,  actions]);
                $row = this.datatable.row(data[0]).nodes().to$();

                //set row id(custom)
                $row[0].id = "product-" + inc;
                is_add_action = true;
                $row
                    .addClass('adding')
                    .find('td:last')
                    .addClass('actions');



                this.rowEdit($row);

                this.datatable.order([0, 'asc']).draw();
                // this.rowSave( $row )// always show fields

        },

        rowCancel: function ($row) {
            var _self = this,
                $actions,
                i,
                data;
            this.rowRemove($row);

            // if ($row.hasClass('adding')) {
            //     this.rowRemove($row);
            //
            // } else {
            //
            //     data = this.datatable.row($row.get(0)).data();
            //     this.datatable.row($row.get(0)).data(data);
            //
            //     $actions = $row.find('td.actions');
            //     if ($actions.get(0)) {
            //         this.rowSetActionsDefault($row);
            //     }
            //
            //     this.datatable.draw();
            // }
        },

        rowEdit: function ($row) {
            var _self = this,
                data;

            data = this.datatable.row($row.get(0)).data();
            // var product_id = $row[0].id.substr(8, $row[0].id.length);
            // current_product_id = product_id;
            $row.children('td').each(function (i) {
                var $this = $(this);

                if (i == 7) {
                    $this.html('<input type="number" style="width:70px;" class="form-control input-block" value="' + data[i] + '"/>');
                    dynamicTotal($("input",$this)[0]);
                }
                if (i == 6) {
                    $this.html('<input type="text" style="width:70px;" class="form-control input-block" value="' + data[i] + '"/>');
                    dynamicTotal($("input",$this)[0]);
                }
                if(i==1){
                    $this.html(
                        '<div autocomplete="off" class="form-group">\n' +
                        '  <div class="autocomplete" style="width:200px;">\n' +
                        '    <input type="text" class="form-control namesp" name="myCountry" placeholder="Tên sản phẩm" value="' + data[i] + '"/>'+
                        '  </div>\n' +
                        '</div>'
                    );
                    var listName=[];
                    for(var i in all_product.data){
                        listName.push(all_product.data[i].name);
                    }
                    for(var i in listName){
                        for(var j in aldready){
                            if(aldready[i]==listName[i]){
                                removeA(listName, aldready[i]);
                            }
                        }
                    }
                    var uniqueNames = [];
                    $.each(listName, function(i, el){
                        if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
                    });


                    autocompleteName($("input",$this)[0], uniqueNames);
                }

                if(i==2){
                    var arr=$this;
                    $this.html(
                        '<div autocomplete="off" class="form-group">\n' +
                        '  <div class="autocomplete" style="width:200px;">\n' +
                        '    <input type="text" class="form-control catesp" name="myCountry" placeholder="Loại sản phẩm" value="' + data[i] + '"/>'+
                        '  </div>\n' +
                        '</div>'
                    );
                    var listName=[];
                    for(var i in all_product.data){
                        listName.push(all_product.data[i].productcategory_name);
                    }

                    var uniqueNames = [];
                    $.each(listName, function(i, el){
                        if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
                    });

                    arr=$("input",$this)[0];
                    autocompleteCate($("input",$this)[0], uniqueNames);
                }

                if(i==3){
                    $this.html(
                        '<div autocomplete="off" class="form-group">\n' +
                        '  <div class="autocomplete" style="width:130px;">\n' +
                        '    <input type="text" class="form-control colorsp" name="myCountry" placeholder="Màu" value="' + data[i] + '"/>'+
                        '  </div>\n' +
                        '</div>'
                    );

                    if($this[0].parentElement.children[2].children[0].children[0].children[0].value.toLowerCase().indexOf("phụ kiện")>=0){
                        $this[0].parentElement.children[3].children[0].children[0].children[0].disabled=true;
                    }

                    var listName=[];
                    for(var i in all_product.data){
                        listName.push(all_product.data[i].product_color);
                    }

                    var uniqueNames = [];
                    $.each(listName, function(i, el){
                        if($.inArray(el, uniqueNames) === -1) uniqueNames.push(el);
                    });

                    autocompleteColor($("input",$this)[0], uniqueNames);
                }
                if ($this.hasClass('actions')) {
                    _self.rowSetActionsEditing($row);
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
                $actions,
                values = [],
                total=[],
                flagEdit=false;

            if ( $row.hasClass( 'adding' ) ) {
                this.$addButton.removeAttr( 'disabled' );
                $row.removeClass( 'adding' );
            }
            var index = 0;
            var value=0;
            var price=0;
            var product_id = $row[0].id.substr(8, $row[0].id.length);

            values = $row.find('td').map(function() {
                var $this = $(this);
                var chietKhau=0;

                if ( $this.hasClass('actions')) {
                    _self.rowSetActionsDefault( $row );
                    return _self.datatable.cell( this ).data();
                }
                if (index != 6) {
                    if (index == 5){
                        if($this[0].innerText=="" || $this[0].innerText==null){
                            new PNotify({
                                title: 'Thông báo',
                                text: 'Chưa nhập đúng tên sản phẩm',
                                type: 'error'
                            });
                            flagEdit=true;
                        }
                        price=$this[0].innerText;
                        price=revert_money_to_normal(price);
                        index++;
                        return $.trim($this[0].innerText);
                    }
                    if (index == 7){
                        if(isNaN($this[0].children[0].value)){

                            index++;
                            return $.trim(0);
                        }else{
                            chietKhau=parseInt($this[0].children[0].value);

                            index++;
                            return $.trim(chietKhau);
                        }
                    }
                    if(index==1){
                        aldready.push($this[0].children[0].children[0].children[0].value);
                    }

                    if(index==1 || index==2 || index==3){

                        index++;
                        return $.trim($this[0].children[0].children[0].children[0].value);
                    }


                    index++;
                    return $.trim($this[0].innerText);
                } else  {
                    value = $this[0].children[0].value;
                    for(var i=0;i<all_product.data.length;i++){
                        if (all_product.data[i].name.toLowerCase()==$this[0].parentElement.children[1].children[0].children[0].children[0].value.toLowerCase()) {
                            if (all_product.data[i].productcategory_name.toLowerCase()==$this[0].parentElement.children[2].children[0].children[0].children[0].value.toLowerCase()) {
                                if (all_product.data[i].product_color.toLowerCase()==$this[0].parentElement.children[3].children[0].children[0].children[0].value.toLowerCase()) {
                                    if (all_product.data[i].quantity==0){
                                        new PNotify({
                                            title: 'Thông báo',
                                            text: 'Sản phẩm '+ $this[0].parentElement.children[1].children[0].children[0].children[0].value +" đã hết hàng",
                                            type: 'error'
                                        });
                                        flagEdit=true;
                                        value=0;
                                        break;

                                    } else if(parseFloat(value)>all_product.data[i].quantity){
                                        new PNotify({
                                            title: 'Thông báo',
                                            text: 'Chỉ còn '+all_product.data[i].quantity+" sản phẩm trong kho",
                                            type: 'error'
                                        });
                                        value=all_product.data[i].quantity;

                                        break;
                                    }

                                }
                            }


                        }
                    }

                    index++;
                    return $.trim(value);

                }

            });





            this.datatable.row( $row.get(0) ).data( values );
            var flagSL=false;

            var sl=parseFloat($row[0].children[6].innerHTML);
            var ck=parseInt($row[0].children[7].innerHTML);
            var price=parseFloat(revert_money_to_normal($row[0].children[5].innerHTML));

            if(price>0 && !isNaN(sl) && !isNaN(ck)){
                var total=sl*price;
                $row[0].children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                if(sl>0 && ck!=0){
                    var tmp=total;
                    total=total-total*ck/100;
                    $row[0].children[8].setAttribute("data-value",parseFloat(total.toFixed(2)));
                    $row[0].children[8].innerHTML='<span style="text-decoration: line-through;">('+format_money(parseFloat(tmp.toFixed(2))+"")+")</span>" +
                        '  <span style="color:red;">'+format_money(parseFloat(total.toFixed(2))+"")+"</span>";
                }else if(sl>0 && ck==0) {
                    $row[0].children[8].innerHTML=format_money(parseFloat(total.toFixed(2))+"");
                }
            }else {
                $row[0].children[8].innerHTML="";
                $row[0].children[8].setAttribute("data-value",0);
            }
            if(!isNaN(sl) && sl==0 && !flagEdit){
                flagSL=true;
                new PNotify({
                    title: 'Thông báo',
                    text: 'Số lượng không được bằng 0',
                    type: 'error'
                });
                $row[0].children[8].innerHTML="";
                $row[0].children[8].setAttribute("data-value",0);
            }

            if(isNaN(sl)){
                flagSL=true;
                new PNotify({
                    title: 'Thông báo',
                    text: 'Số lượng phải là chữ số',
                    type: 'error'
                });
                $row[0].children[8].innerHTML="";
                $row[0].children[8].setAttribute("data-value",0);
            }

            if(isNaN(ck)){
                flagSL=true;
                new PNotify({
                    title: 'Thông báo',
                    text: 'chiết khấu phải là chữ số',
                    type: 'error'
                });
                $row[0].children[8].innerHTML="";
                $row[0].children[8].setAttribute("data-value",0);
            }


            $actions = $row.find('td.actions');
            if ( $actions.get(0) && (!flagEdit || !flagSL)) {
                this.rowSetActionsDefault( $row );
            }else if($actions.get(0)&& (flagEdit || flagSL)){
                this.rowSetActionsEditing( $row );
            }
            if(!flagEdit && !flagSL){
                this.datatable.draw();
                all_total();
            }else {
                _self.rowEdit($row);
            }




        },

        rowRemove: function ($row) {
            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
            }
            var product_id = $row[0].id.substr(8, $row[0].id.length);
            // set_select_option_data(product_id,true);

            for(var i in aldready){
                if($row[0].children[1].innerHTML==aldready[i]){
                    removeA(aldready, aldready[i]);
                }
            }




            this.datatable.row($row.get(0)).remove().draw();
            this.datatable.order([0, 'asc']).draw();
            all_total();
            inc--;
        },

        rowSetActionsEditing: function ($row) {
            $row.find('.on-editing').removeClass('hidden');
            $row.find('.on-default').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');
        }

    };

    // var EditableTable1 = {
    //
    //     options: {
    //         addButton: '#addToTableSub',
    //         table: '#datatable-tabletools-sub',
    //         dialog: {
    //             wrapper: '#dialog',
    //             cancelButton: '#dialogCancel',
    //             confirmButton: '#dialogConfirm',
    //         }
    //     },
    //
    //     initialize: function () {
    //         this
    //             .setVars()
    //             .build()
    //             .events();
    //     },
    //
    //     setVars: function () {
    //         this.$table = $(this.options.table);
    //         this.$addButton = $(this.options.addButton);
    //
    //         // dialog
    //         this.dialog = {};
    //         this.dialog.$wrapper = $(this.options.dialog.wrapper);
    //         this.dialog.$cancel = $(this.options.dialog.cancelButton);
    //         this.dialog.$confirm = $(this.options.dialog.confirmButton);
    //
    //         return this;
    //     },
    //
    //     build: function () {
    //         this.datatable = this.$table.DataTable({
    //             scrollX: true,
    //             paging: false,
    //             aoColumns: [
    //                 null,
    //                 null,
    //                 null,
    //                 null,
    //                 null,
    //                 null,
    //                 null,
    //                 {"bSortable": false}
    //             ]
    //         });
    //
    //         window.dt = this.datatable;
    //         this.datatable.order([2, 'asc']).draw();
    //
    //         return this;
    //     },
    //
    //     events: function () {
    //         var _self = this;
    //
    //         this.$table
    //             .on('click', 'a.save-row', function (e) {
    //                 e.preventDefault();
    //                 var _self = this;
    //                 var $row = $(this).closest('tr');
    //
    //                 var product_id = $row[0].id.substr(8, $row[0].id.length);
    //
    //                 var action="insert";
    //                 if (action == "insert") {
    //                     $row[0].id="product-"+product_id;
    //                     EditableTable1.rowSave($row);
    //                     is_add_action = false;
    //                 }else if(action == "update"){
    //                     var id = "product-"+product_id;
    //                     if(is_add_action) {
    //                         if ($row[0].id == id) {
    //
    //                             EditableTable1.rowRemove($("#"+id));
    //                             EditableTable1.rowSave($row);
    //                         }
    //                         is_add_action = false;
    //                     }else {
    //                         EditableTable1.rowSave($row);
    //                     }
    //                     // $( "#"+id+" td:eq( 2 )" ).html(order);
    //
    //                     var $actions = $row.find('td.actions');
    //                     if ( $actions.get(0) ) {
    //                         EditableTable1.rowSetActionsDefault( $row );
    //                     }
    //
    //                 }
    //                 EditableTable1.datatable.order([2, 'asc']).draw();
    //
    //
    //             })
    //             .on('click', 'a.cancel-row', function (e) {
    //                 e.preventDefault();
    //
    //                 _self.rowCancel($(this).closest('tr'));
    //             })
    //             .on('click', 'a.edit-row', function (e) {
    //                 e.preventDefault();
    //                 _self.rowEdit($(this).closest('tr'));
    //             })
    //             .on('click', 'a.remove-row', function (e) {
    //                 e.preventDefault();
    //
    //                 var $row = $(this).closest('tr');
    //                 $.magnificPopup.open({
    //                     items: {
    //                         src: '#dialog',
    //                         type: 'inline'
    //                     },
    //                     preloader: false,
    //                     modal: true,
    //                     callbacks: {
    //                         change: function () {
    //                             _self.dialog.$confirm.on('click', function (e) {
    //                                 e.preventDefault();
    //                                 var product_id = $row[0].id.substr(8, $row[0].id.length);
    //                                 _self.rowRemove($row);
    //                                 $.magnificPopup.close();
    //                                 // remove_product(product_id,function () {
    //                                 //     _self.rowRemove($row);
    //                                 //     $.magnificPopup.close();
    //                                 // })
    //
    //                             });
    //                         },
    //                         close: function () {
    //                             _self.dialog.$confirm.off('click');
    //                         }
    //                     }
    //                 });
    //             });
    //
    //         this.$addButton.on('click', function (e) {
    //             e.preventDefault();
    //
    //
    //             _self.rowAdd();
    //         });
    //
    //         this.dialog.$cancel.on('click', function (e) {
    //             e.preventDefault();
    //             $.magnificPopup.close();
    //         });
    //
    //         return this;
    //     },
    //
    //     // ==========================================================================================
    //     // ROW FUNCTIONS
    //     // ==========================================================================================
    //     rowAdd: function () {
    //         this.$addButton.attr({'disabled': 'disabled'});
    //
    //         var actions,
    //             data,
    //             $row;
    //
    //         actions = [
    //             '<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
    //             '<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
    //             '<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
    //             '<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
    //         ].join(' ');
    //
    //         // current_product_total=revert_money_to_normal(current_product_price)*current_product_quantity;
    //         //
    //         // current_product_total=format_money(current_product_total+"");
    //         incs++;
    //
    //         data = this.datatable.row.add([incs, current_product_name,current_category, current_unit, current_product_price,current_product_quantity,current_product_total,  actions]);
    //         $row = this.datatable.row(data[0]).nodes().to$();
    //
    //         //set row id(custom)
    //         $row[0].id = "product-" + current_product_id;
    //         is_add_action = true;
    //         $row
    //             .addClass('adding')
    //             .find('td:last')
    //             .addClass('actions');
    //
    //
    //
    //         this.rowEdit($row);
    //
    //         this.datatable.order([2, 'asc']).draw();
    //         // this.rowSave( $row )// always show fields
    //
    //     },
    //
    //     rowCancel: function ($row) {
    //         var _self = this,
    //             $actions,
    //             i,
    //             data;
    //
    //         if ($row.hasClass('adding')) {
    //             this.rowRemove($row);
    //
    //         } else {
    //
    //             data = this.datatable.row($row.get(0)).data();
    //             this.datatable.row($row.get(0)).data(data);
    //
    //             $actions = $row.find('td.actions');
    //             if ($actions.get(0)) {
    //                 this.rowSetActionsDefault($row);
    //             }
    //
    //             this.datatable.draw();
    //         }
    //     },
    //
    //     rowEdit: function ($row) {
    //         var _self = this,
    //             data;
    //
    //         data = this.datatable.row($row.get(0)).data();
    //         var product_id = $row[0].id.substr(8, $row[0].id.length);
    //         current_product_id = product_id;
    //         $row.children('td').each(function (i) {
    //             var $this = $(this);
    //
    //             if (i == 5) {
    //                 $this.html('<input type="text" class="form-control input-block" value="' + data[i] + '"/>');
    //             }
    //             if ($this.hasClass('actions')) {
    //                 _self.rowSetActionsEditing($row);
    //             }
    //         });
    //     },
    //
    //     rowSave: function ($row) {
    //         var _self = this,
    //             $actions,
    //             values = [],
    //             total=[];
    //         if ( $row.hasClass( 'adding' ) ) {
    //             this.$addButton.removeAttr( 'disabled' );
    //             $row.removeClass( 'adding' );
    //         }
    //         var index = 0;
    //         var value=0;
    //         var price=0;
    //         var product_id = $row[0].id.substr(8, $row[0].id.length);
    //
    //         values = $row.find('td').map(function() {
    //             var $this = $(this);
    //             var chietKhau=0;
    //
    //             if ( $this.hasClass('actions') ) {
    //                 _self.rowSetActionsDefault( $row );
    //                 return _self.datatable.cell( this ).data();
    //             } else {
    //                 if (index != 5) {
    //                     if (index == 4){
    //                         price=$this[0].innerText;
    //                         price=revert_money_to_normal(price);
    //                         index++;
    //                         return $.trim($this[0].innerText);
    //                     }
    //                     if (index == 6){
    //                         var total=value*price;
    //                         total=format_money(total+"");
    //                         index++;
    //                         return $.trim(total);
    //                     }
    //                     index++;
    //                     return $.trim($this[0].innerText);
    //                 } else  {
    //                     value = $this[0].children[0].value;
    //                     if(value>1){
    //                         for(var i=0;i<all_product.data.length;i++){
    //                             if (all_product.data[i].id==product_id) {
    //                                 if(parseInt(value)>all_product.data[i].quantity){
    //                                     new PNotify({
    //                                         title: 'Thông báo',
    //                                         text: 'Chỉ còn '+all_product.data[i].quantity+" sản phẩm trong kho",
    //                                         type: 'error'
    //                                     });
    //                                     value=all_product.data[i].quantity;
    //                                     break;
    //                                 }
    //
    //                             }
    //                         }
    //
    //                     }else {
    //                         value=1
    //                     }
    //
    //                     index++;
    //                     return $.trim(value);
    //
    //                 }
    //
    //
    //
    //
    //             }
    //         });
    //
    //
    //         this.datatable.row( $row.get(0) ).data( values );
    //
    //         $actions = $row.find('td.actions');
    //         if ( $actions.get(0) ) {
    //             this.rowSetActionsDefault( $row );
    //         }
    //
    //         this.datatable.draw();
    //         all_total();
    //
    //
    //     },
    //
    //     rowRemove: function ($row) {
    //         if ($row.hasClass('adding')) {
    //             this.$addButton.removeAttr('disabled');
    //         }
    //         var product_id = $row[0].id.substr(8, $row[0].id.length);
    //         set_select_option_data(product_id,false);
    //
    //
    //
    //         this.datatable.row($row.get(0)).remove().draw();
    //         all_total();
    //         incs--;
    //     },
    //
    //     rowSetActionsEditing: function ($row) {
    //         $row.find('.on-editing').removeClass('hidden');
    //         $row.find('.on-default').addClass('hidden');
    //     },
    //
    //     rowSetActionsDefault: function ($row) {
    //         $row.find('.on-editing').addClass('hidden');
    //         $row.find('.on-default').removeClass('hidden');
    //     }
    //
    // };

    $(function () {
        EditableTable.initialize();
        // EditableTable1.initialize();
    });

}).apply(this, [jQuery]);