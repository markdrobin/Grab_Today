/**
 * Created by markrobin on 7/15/16.
 */

$(document).ready(function () {
    $("input[type='checkbox'].user-type").on('change', function () {
        // $('.add_store_field').removeClass('hidden')
        $('.add_store_field').toggleClass('hidden',!$(this).is(':checked'))
    });
});
