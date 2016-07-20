/**
 * Created by markrobin on 7/15/16.
 */
$(document).ready(function () {
    $('.user-type').change(function () {
        var add_store_field = $(".add_store_field");
        if ($(this).val() == "Store Owner"){
            $('.add_store_field').show();
        } else {
            $('.add_store_field').hide();
        }

        var add_menu_item = $(".add_menu_item");
        if ($(this).val() == "Store Owner"){
            $('.add_menu_item').show();
        } else {
            $('.add_menu_item').hide();
        }
    });
});
