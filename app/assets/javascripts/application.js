// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tokeninput
//= require twitter/bootstrap
//= require awesomplete
//= require_tree .

$(document).ready(function () {
    if ($(".splash").is(":visible")) {
        $(".wrapper").css({"opacity": "0"});
    }
    $(".splash-arrow").click(function () {
        $(".splash").slideUp("800", function () {
            $(".wrapper").delay(100).animate({"opacity": "1.0"}, 800);
        });
    });
});

$(".closebtn").ready(function () {
    var close = document.getElementsByClassName("closebtn");
    var i;

    // Loop through all close buttons
    for (i = 0; i < close.length; i++) {
        // When someone clicks on a close button
        close[i].onclick = function () {

            // Get the parent of <span class="closebtn"> (<div class="alert">)
            var div = this.parentElement;

            // Set the opacity of div to 0 (transparent)
            div.style.opacity = "0";

            // Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
            setTimeout(function () {
                div.style.display = "none";
            }, 600);
        }

        $(".notifiers").alert();
        window.setTimeout(function () {
            $(".notifiers").alert('.closebtn');
        }, 2000);
    }
});

$(document).ready(function () {
    $("#addNewVariant").click(function () {
        $.ajax({
            url: "/store_products/new_variant_fields",
            type: "GET",
            success: function (data) {
                $("#addVariant").append('<li>'
                    + data
                    + '<a href="#" id="cancel_variant" class="btn btn-default">Cancel Variant</a><br><br>'
                    + '</li>').html();
                addOnChangeBehavior($('#addVariant .variant-name').last())
                addTokenBehavior($('#addVariant .variant-value').last())
            }
        })
    });

    $("#addVariant").on('click', '#cancel_variant', function () {
        $(this).parent().find('.destroy-flag').val('true')
        $(this).parent().hide()
    });

    $('form').submit(function (e) {
        $("#new_variant_form").remove()
    })

    $(function () {
        $('#f-name').on('change', function () {
            var field_name = $(this).val();
            $.ajax({
                type: 'POST',
                url: '/store_products/get_attributes',
                data: {
                    name: $(this).val()
                },
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        if (data.product_type != "") {
                            $('#f-product_type').val(data.product_type);
                        }
                        if (data.brand != "") {
                            $('#f-brand').val(data.brand);
                        }
                        if (data.manufacturer != "") {
                            $('#f-manufacturer').val(data.manufacturer);
                        }
                    }
                },
                error: function () {

                }
            });
        });
    });

    $('form').submit(function (e) {
        $(this).find('.variant-value').each(function () {
            var parent = $(this).closest('.form-group')
            var input = parent.find('.variant-value')
            var values = []
            parent.find('li.token-input-token-facebook p').each(function () {
                values.push($(this).text().trim())
            })
            input.val($.unique(values).join(","))
        })
    })

    $(".variant-value").each(function () {
        addTokenBehavior($(this))
    })

    $(".variant-name").each(function () {
        addOnChangeBehavior($(this))
    })
});

function newValueUrl(e) {
    return function () {
        return '/variants.json?name=' + e.closest('.form-group').find('.variant-name').val();
    }
}

function newTypeUrl() {
    return function () {
        return '/variants.json?';
    }
}

function addTokenBehavior(element) {
    if (element.attr("class") == 'variant-name') {
        element.tokenInput(newTypeUrl(), {
            queryParam: 'name',
            crossDomain: false,
            tokenLimit: 1,
            prePopulate: element.data('load'),
            theme: "facebook",
        })
    }
    else {
        element.tokenInput(newValueUrl(element), {
            queryParam: 'q',
            crossDomain: false,
            prePopulate: element.data('load'),
            theme: "facebook",
        })
    }
}

function addOnChangeBehavior(element){
    element.on('change', function () {
        var parent = $(this).closest('.form-group')
        var input = parent.find('.variant-value')
        var type = []
        parent.find('li.token-input-token-facebook').remove()
    })
}