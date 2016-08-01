$ ->
  $(window).scroll ->
    max = if $('.with-banner').length then 200 else 10
    top = if $(this).scrollTop() > max then max else $(this).scrollTop()
    transparency = top / max
    $('.navbar').css('background-color', "rgba(32,32,32,#{transparency})")
