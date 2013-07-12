$ ->
  $(".request_finish_project.disabled").qtip
    content: "你的任务正在跑分中，有分了，才能进行此操作"
    position:
      my: 'middle right'
      at: 'middle left'
      target: $(".request_finish_project")
    style:
      classes: 'qtip-blue qtip-bootstrap'

  $(".request_finish_project.disabled").click ->
    return false
