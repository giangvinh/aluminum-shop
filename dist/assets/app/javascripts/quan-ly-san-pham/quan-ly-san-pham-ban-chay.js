/*
Name: 			Tables / Editable - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.4.0
*/
var current_product_id = null;
var current_product_code = null;
var current_product_name = null;
var current_product_order = null;
var is_add_action = false;
var can_add_new = true;
function them_san_pham() {

    var e = document.getElementById("product_select");
    current_product_id = e.options[e.selectedIndex].value;
    if (current_product_id == -1) {
        alert("Chưa chọn sản phẩm để thêm");
        return;
    }
    if(option_value == 1) return;
    current_product_code = e.options[e.selectedIndex].getAttribute("data-code");
    current_product_name = e.options[e.selectedIndex].text;
    current_product_order = 1;
    check_exist(current_product_id,function () {
        $('#addToTable').click();
    })

}

function change_option(option_number) {
    $.ajax({
        url: "/admin/quan-ly-san-pham-ban-chay/change_option",
        type: "post", //send it through get method
        data: JSON.stringify({
            option_number: option_number
        }), contentType: "application/json",

        success: function (response) {

            if (response.response_code == "SUCC_EXEC") {
                option_value = option_number;
                return true;
            }
            return false;

        },
        error: function (xhr) {

        }
    });
}

function check_exist(product_id,callback) {
    $.ajax({
        url: "/admin/quan-ly-san-pham-ban-chay/count",
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

function add_database(order,product_id,product_name, callback) {
    $.ajax({
        url: "/admin/quan-ly-san-pham-ban-chay/them",
        type: "post", //send it through get method
        data: JSON.stringify({
            product_id: product_id,
            order: order
        }), contentType: "application/json",

        success: function (response) {
            var action = "";
            if(response.data == "insert"){
                action = "Thêm";
            }else {
                action = "Sửa";
            }
            if (response.response_code == "SUCC_EXEC") {
                new PNotify({
                    title: 'Thông báo',
                    text: action+' sản phẩm [' + product_name + "] thành công",
                    type: 'success'
                });
                callback(true, response.data);
            } else {
                new PNotify({
                    title: 'Thông báo',
                    text: action+' sản phẩm [' + product_name + "] thất bại\n" + response.description,
                    type: 'error'
                });
                callback(false);
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Thêm(Sửa) sản phẩm [' + product_name + "] thất bại",
                type: 'error'
            });
        }
    });
}

function remove_product(product_id, callback) {
    $.ajax({
        url: "/admin/quan-ly-san-pham-ban-chay/xoa",
        type: "post", //send it through get method
        data: JSON.stringify({
            product_id: product_id
        }), contentType: "application/json",

        success: function (response) {

            if (response.response_code == "SUCC_EXEC") {
                new PNotify({
                    title: 'Thông báo',
                    text: "Xóa sản phẩm thành công",
                    type: 'success'
                });
                callback();
            } else {
                new PNotify({
                    title: 'Thông báo',
                    text: "Xóa sản phẩm thất bại\n" + response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            //Do Something to handle error
            new PNotify({
                title: 'Thông báo',
                text: 'Xóa sản phẩm thất bại',
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
                aoColumns: [
                    null,
                    null,
                    null,
                    {"bSortable": false}
                ]
            });

            window.dt = this.datatable;
            this.datatable.order([2, 'asc']).draw();

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
                    var order = $row[0].children[2].children[0].value;
                    var product_name = $row[0].children[1].innerText;
                    add_database(order,product_id,product_name, function (success, action) {

                            if (success) {
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
                                EditableTable.datatable.order([2, 'asc']).draw();
                                can_add_new = true;
                            }
                        })

                })
                .on('click', 'a.cancel-row', function (e) {
                    e.preventDefault();

                    _self.rowCancel($(this).closest('tr'));
                })
                .on('click', 'a.edit-row', function (e) {
                    e.preventDefault();
                    if (option_value == 1) return;
                    _self.rowEdit($(this).closest('tr'));
                })
                .on('click', 'a.remove-row', function (e) {
                    e.preventDefault();
                    if (option_value == 1) return;

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
                                    remove_product(product_id,function () {
                                        _self.rowRemove($row);
                                        $.magnificPopup.close();
                                    })

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
            if(!can_add_new) return;
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

            data = this.datatable.row.add([current_product_code, current_product_name, current_product_order, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            //set row id(custom)
            $row[0].id = "product-" + current_product_id;
            is_add_action = true;
            $row
                .addClass('adding')
                .find('td:last')
                .addClass('actions');

            this.rowEdit($row);

            this.datatable.order([2, 'asc']).draw();
            // this.rowSave( $row )// always show fields
        },

        rowCancel: function ($row) {
            var _self = this,
                $actions,
                i,
                data;

            if ($row.hasClass('adding')) {
                this.rowRemove($row);
            } else {

                data = this.datatable.row($row.get(0)).data();
                this.datatable.row($row.get(0)).data(data);

                $actions = $row.find('td.actions');
                if ($actions.get(0)) {
                    this.rowSetActionsDefault($row);
                }

                this.datatable.draw();
            }
        },

        rowEdit: function ($row) {
            can_add_new = false;
            var _self = this,
                data;

            data = this.datatable.row($row.get(0)).data();
            var product_id = $row[0].id.substr(8, $row[0].id.length);
            current_product_id = product_id;
            $row.children('td').each(function (i) {
                var $this = $(this);

                if (i == 2) {
                    $this.html('<input type="text" class="form-control input-block" value="' + data[i] + '"/>');
                }
                if ($this.hasClass('actions')) {
                    _self.rowSetActionsEditing($row);
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
                $actions,
                values = [];
            if ( $row.hasClass( 'adding' ) ) {
                this.$addButton.removeAttr( 'disabled' );
                $row.removeClass( 'adding' );
            }
            var index = 0;
            values = $row.find('td').map(function() {
                var $this = $(this);

                if ( $this.hasClass('actions') ) {
                    _self.rowSetActionsDefault( $row );
                    return _self.datatable.cell( this ).data();
                } else {
                    if (index != 2) {
                        index++;
                        return $.trim($this[0].innerText);
                    } else {
                        index++;
                        var value = $this[0].children[0].value;
                        return $.trim(value);
                    }
                }
            });

            this.datatable.row( $row.get(0) ).data( values );

            $actions = $row.find('td.actions');
            if ( $actions.get(0) ) {
                this.rowSetActionsDefault( $row );
            }

            this.datatable.draw();


        },

        rowRemove: function ($row) {
            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
            }

            this.datatable.row($row.get(0)).remove().draw();
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

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);