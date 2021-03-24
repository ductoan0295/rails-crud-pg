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
                        todoListItem.append("<li><div class= 'form-check' > <label class='form-check-label'><input class='checkbox' type='checkbox' />" + item + "<i class='input-helper'></i></label></div > <i class='remove mdi mdi-close-circle-outline'></i></li > ");
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
                    url: '/todoitems',
                    data: { itemDescription: item },
                    dataType: "json",
                    success: function (response) {
                        $(this).removeAttr('checked');
                    },
                    error: function (error) {
                        alert("Cannot update the todo item to the current list!!!")
                    }
                });
            } else {
                $(this).attr('checked', 'checked');
            }

            $(this).closest("li").toggleClass('completed');

        });

        todoListItem.on('click', '.remove', function () {
            $(this).parent().remove();
        });

    });
})(jQuery);