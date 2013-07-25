$ ->
  $("#activity_start_at").datetimepicker
    stepMinute: 5
    dateFormat: "yy-mm-dd"

  $(".registry-activity.disabled").tooltip
    title: "只有登录用户才可以报名参加工会活动"
    placement: 'left'

  $(".registry-activity.disabled").mouseover ->
    $('.tooltip').css('left', parseInt($('.tooltip').css('left')) - 6 + "px")

  $(".registry-activity.disabled").click ->
    false
