$ ->
  $(window).scroll ->
    max = 200
    top = if $(this).scrollTop() > max then max else $(this).scrollTop()
    transparency = top / max
    $('.navbar').css('background-color', "rgba(32,32,32,#{transparency})")
#    $('.navbar').toggleClass('with-bg', $(this).scrollTop() > max)