# *************************************
#
#   Application
#
# *************************************

# -------------------------------------
#   Components
# -------------------------------------
#= require components/_components.fastclick

# -------------------------------------
#   Inbox
# -------------------------------------
$ ->
  "use strict"


  # PARALLAX
  if $("html").hasClass("no-touch")
    lastScroll = undefined
    $(window).scroll ->
      lastScroll = window.scrollY
      $(".hero--home .hero__body").css
        transform: "translate3d(0," + lastScroll / 2 + "px,0)"
        opacity: (100 - lastScroll / 6) / 100
        top: -(lastScroll / 4)

  # MightyScroll
  $.fn.scrollTo = ->
    $(this).click (e) ->
      h = $(this).attr("href")
      target = undefined
      if h.charAt(0) is "#" and h.length > 1 and (target = $(h)).length > 0
        pos = Math.max(target.offset().top, 0)
        e.preventDefault()
        $("body,html").animate
          scrollTop: pos
        , 500, "swing"
      return

    return

  $(".js-scrollto").scrollTo()
