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

$(function () {
    tokenize($(".tokens"))
});

function tokenize(element){
    element.tokenInput("/variants.json", {
        crossDomain: false,
        theme: "facebook"
    });
}

$(document).ready(function () {
    $("#addNewVariant").click(function () {
        $.ajax({
            url: "/store_products/new_variant_fields",
            type: "GET",
            success: function (data) {
                $("#addVariant").append('<li>'
                    + data
                    + '<a href="#" id="cancel_variant">X</a>'
                    + '</li>').html();
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
        $('#f-name').change(function () {
            var field_name = $(this).val();
            $.ajax({
                type: 'POST',
                url: '/store_products/get_attributes',
                data: {
                    name: $(this).val()
                },
                dataType: 'json',
                success: function (data)
                {
                    if (data != null) {
                        if (data.product_type != null) {
                            $('#f-category-select').val(data.product_type);
                        }
                        if (data.brand != null) {
                            $('#f-brand').val(data.brand);
                        }
                        if (data.manufacturer != null) {
                            $('#f-manufacturer').val(data.manufacturer);
                        }
                    }
                },
                error: function () {

                }
            });
        });
    });

    new Awesomplete(document.getElementById("f-name"), {list: "#namelist", minChars: 1, autoFirst: true});
    new Awesomplete(document.getElementById("f-brand"), {list: "#brandlist", minChars: 1, autoFirst: true});
    new Awesomplete(document.getElementById("f-manufacturer"), {list: "#manuflist", minChars: 1, autoFirst: true});
    new Awesomplete(document.getElementById("f-product_type"), {list: "#producttypelist", minChars: 1, autoFirst: true});
    new Awesomplete(document.getElementById("f-variant"), {list: "#variantnamelist", minChars: 1, autoFirst: true});
});

$(function () {
    function newUrl(e) {
        return function () {
            return '/variants.json?name=' + e.closest('.form-group').find('.variant-name').val();
        }
    }

    $(".variant-value").each(function () {
        $(this).tokenInput(newUrl($(this)), {
            queryParam: 'q',
            crossDomain: false,
            // propertyToSearch: "value",
            theme: "facebook",
        });
    })

});