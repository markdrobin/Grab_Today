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
    });
});
