#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require rails.validations
#= require rails.validations.simple_form
#= require highcharts
#= require projects
#= require_self

$ ->
  # Go Top
  $("a.go_top").click () ->
    $('html, body').animate({ scrollTop: 0 },300)
    return false

  $(window).bind 'scroll resize', ->
    scroll_from_top = $(window).scrollTop()
    if scroll_from_top >= 1
      $("a.go_top").show()
    else
      $("a.go_top").hide()



