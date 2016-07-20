/**
 * Created by markrobin on 7/15/16.
 */

$(document).ready(function () {
    // $('.user-type').change(function () {
    //     var add_store_field = $(".add_store_field");
    //     if ($(this).val() == "Store Owner") {
    //         $('.add_store_field').show();
    //     } else {
    //         $('.add_store_field').hide();
    //     }
    // });
    $("input[type='checkbox'].user-type").on('change', function () {
        // $('.add_store_field').removeClass('hidden')
        $('.add_store_field').toggleClass('hidden',!$(this).is(':checked'))
    });
});
