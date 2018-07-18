/*global $, window*/
var current_id = null;

function update_order(order,callback) {
    $.ajax({
        url: "danh-sach-danh-muc-san-pham/update_order",
        type: "post", //send it through get method
        data: JSON.stringify({
            id: current_id,
            order: order
        }), contentType: "application/json",

        success: function (response) {
            if (response.response_code == "SUCC_EXEC") {
                callback();
            } else {
                new PNotify({
                    title: 'Thông báo',
                    text: 'Sửa thứ tự chương trình khuyến mãi thất bại\n' + response.description,
                    type: 'error'
                });
            }

        },
        error: function (xhr) {
            new PNotify({
                title: 'Thông báo',
                text: 'Sửa thứ tự chương trình khuyến mãi thất bại',
                type: 'error'
            });
        }
    });
}

$.fn.editableTableWidget = function (options) {
    'use strict';
    return $(this).each(function () {
        var buildDefaultOptions = function () {
                var opts = $.extend({}, $.fn.editableTableWidget.defaultOptions);
                opts.editor = opts.editor.clone();
                return opts;
            },
            activeOptions = $.extend(buildDefaultOptions(), options),
            ARROW_LEFT = 37, ARROW_UP = 38, ARROW_RIGHT = 39, ARROW_DOWN = 40, ENTER = 13, ESC = 27, TAB = 9,
            element = $(this),
            editor = activeOptions.editor.css('position', 'absolute').hide().appendTo(element.parent()),
            active,
            showEditor = function (select) {
                var can_edit = select.target.className.includes("canEdit");
                if(!can_edit) return;
                var id = select.target.id.substr(2,select.target.id.length);
                current_id = id;
                active = element.find('td:focus');
                if (active.length) {
                    editor.val(active.text())
                        .removeClass('error')
                        .show()
                        .offset(active.offset())
                        .css(active.css(activeOptions.cloneProperties))
                        .width(active.width())
                        .height(active.height())
                        .focus();
                    if (select) {
                        editor.select();
                    }
                }
            },
            setActiveText = function (need_save) {
                var text = editor.val(),
                    evt = $.Event('change'),
                    originalContent;
                // if (active.text() === text || editor.hasClass('error')) {
                //     return true;
                // }
                if(need_save) {
                    if (current_id != null) {
                        update_order(text, function () {
                            originalContent = active.html();
                            active.text(text).trigger(evt, text);
                            if (evt.result === false) {
                                active.html(originalContent);
                            }
                            current_id = null;
                        })
                    }
                }else {
                    originalContent = active.html();
                    active.text(text).trigger(evt, text);
                    if (evt.result === false) {
                        active.html(originalContent);
                    }
                }

            },
            movement = function (element, keycode) {
                if (keycode === ARROW_RIGHT) {
                    return element.next('td');
                } else if (keycode === ARROW_LEFT) {
                    return element.prev('td');
                } else if (keycode === ARROW_UP) {
                    return element.parent().prev().children().eq(element.index());
                } else if (keycode === ARROW_DOWN) {
                    return element.parent().next().children().eq(element.index());
                }
                return [];
            };
        editor.blur(function () {
            var text = editor.val();
            if(text.length == 0){
                alert("Chưa thêm thứ tự sắp xếp");
                return;
            }

            setActiveText(true);
            editor.hide();
        }).keyup(function (e) {
            var key = window.event ? e.keyCode : e.which;

            if (e.keyCode === 8 || e.keyCode === 46) {
                setActiveText();
            } else if ( key < 48 || key > 57 ) {
                // return false;
                e.preventDefault();
                e.stopPropagation();;
                return;
            } else {
                setActiveText();
            }
            if (e.which === ENTER) {
                var text = editor.val();
                if(text.length == 0){
                    alert("Chưa thêm thứ tự sắp xếp");
                    return;
                }
                setActiveText();
                editor.hide();
            } else if (e.which === ESC) {
                var text = editor.val();
                if(text.length == 0){
                    alert("Chưa thêm thứ tự sắp xếp");
                    return;
                }
                editor.val(active.text());
                e.preventDefault();
                e.stopPropagation();
                editor.hide();
                active.focus();
            } else if (e.which === TAB) {
                var text = editor.val();
                if(text.length == 0){
                    alert("Chưa thêm thứ tự sắp xếp");
                    return;
                }
                active.focus();
            } else if (this.selectionEnd - this.selectionStart === this.value.length) {
                var possibleMove = movement(active, e.which);
                if (possibleMove.length > 0) {
                    possibleMove.focus();
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        }).keydown(function (e) {
            var key = window.event ? e.keyCode : e.which;

             if ( (key < 48 || key > 57 ) && key != 8) {
                // return false;
                editor.val(active.text());
                e.preventDefault();
                e.stopPropagation();

            }
        })
            .on('input paste', function () {
                var evt = $.Event('validate');
                active.trigger(evt, editor.val());
                if (evt.result === false) {
                    editor.addClass('error');
                } else {
                    editor.removeClass('error');
                }
            });
        element.on('click keypress dblclick', showEditor)
            .css('cursor', 'pointer')
            .keydown(function (e) {
                var prevent = true,
                    possibleMove = movement($(e.target), e.which);
                if (possibleMove.length > 0) {
                    possibleMove.focus();
                } else if (e.which === ENTER) {
                    showEditor(false);
                } else if (e.which === 17 || e.which === 91 || e.which === 93) {
                    showEditor(true);
                    prevent = false;
                } else {
                    prevent = false;
                }
                if (prevent) {
                    e.stopPropagation();
                    e.preventDefault();
                }
            });

        element.find('td').prop('tabindex', 1);

        $(window).on('resize', function () {
            if (editor.is(':visible')) {
                editor.offset(active.offset())
                    .width(active.width())
                    .height(active.height());
            }
        });
    });

};
$.fn.editableTableWidget.defaultOptions = {
    cloneProperties: ['padding', 'padding-top', 'padding-bottom', 'padding-left', 'padding-right',
        'text-align', 'font', 'font-size', 'font-family', 'font-weight',
        'border', 'border-top', 'border-bottom', 'border-left', 'border-right'],
    editor: $('<input>')
};