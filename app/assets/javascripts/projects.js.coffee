$ ->
  $(".request_finish_project.disabled").tooltip
    title: "你的任务正在跑分中，有分了，才能进行此操作"
    placement: 'left'

  $(".request_finish_project.disabled").mouseover ->
    $('.tooltip').css('left', parseInt($('.tooltip').css('left')) - 6 + "px")

  $(".request_finish_project.disabled").click ->
    false
