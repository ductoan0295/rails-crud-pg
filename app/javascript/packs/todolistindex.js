(function ($) {
    'use strict';
    $(function () {
        var todoListItem = $('.todo-list');
        var todoListInput = $('.todo-list-input');

        $('.todo-list-add-btn').on("click", function (event) {
            var item = $(this).prevAll('.todo-list-input').val();
            if (item) {
                $.ajax({
                    type: "POST",
                    url: '/todoitems/create',
                    data: { itemDescription: item },
                    dataType: "json",
                    success: function (response) {
                        todoListItem.append(`<li><div class= 'form-check' > <label class='form-check-label'><input id='${response.id}' class='checkbox' type='checkbox' /> ${item} <i class='input-helper'></i></label></div > <i id='${response.id}' class='remove mdi mdi-close-circle-outline'></i></li >`);
                        todoListInput.val("");
                    },
                    error: function (error) {
                        alert("Cannot add the todo item to the current list!!!")
                    }
                });
            }
        });

        todoListItem.on('change', '.checkbox', function () {
            if ($(this).attr('checked')) {
                $.ajax({
                    type: "POST",
                    url: '/todoitems/update',
                    data: { id: $(this).attr('id'), done: false },
                    dataType: "json",
                    success: function (response) {
                        $(this).removeAttr('checked');
                    },
                    error: function (error) {
                        alert("Cannot update the todo item to the current list!!!")
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: '/todoitems/update',
                    data: { id: $(this).attr('id'), done: true },
                    dataType: "json",
                    success: function (response) {
                        $(this).attr('checked', 'checked');
                    },
                    error: function (error) {
                        alert("Cannot update the todo item to the current list!!!");
                    }
                });
                $(this).closest("li").toggleClass('completed');
            }
        });

        todoListItem.on('click', '.remove', function () {
            $(this).parent().remove();
            $.ajax({
                type: "POST",
                url: '/todoitems/delete',
                data: { id: $(this).attr('id') },
                dataType: "json",
                success: function (response) {
                    $(this).parent().remove();
                },
                error: function (error) {
                    if(error.status === 200){
                        $(this).parent().remove();
                    } else {
                        alert(error.status);
                    }
                }
            });
        });

    });
})(jQuery);