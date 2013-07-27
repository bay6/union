Activity = {
  edit_click_callback: ->
    $(".editor_toolbar .preview").removeClass("active")
    $(".create_comment #preview").addClass("hidden")

    $(".create_comment #comment_content").css("display", "block")
    $(".editor_toolbar .edit").addClass("active")
    false

  preview_click_callback: ->
    $(".editor_toolbar .edit").removeClass("active")
    $(".editor_toolbar .preview").addClass("active")

    $(".create_comment #comment_content").css("display", "none")
    $(".create_comment #preview").removeClass("hidden")

    $(".create_comment #preview").html('Loading...')

    post_data = $(".create_comment form.new_comment").serialize()
    url = $(".editor_toolbar .preview").find("a").attr('href')

    $.ajax
      url: url
      data: post_data
      type: "post"
      dataType: "html"
      success: (data) ->
        $(".create_comment #preview").html(data)

    false
}

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

  $(".editor_toolbar .edit").click ->
    Activity.edit_click_callback()

  $(".editor_toolbar .preview").click ->
    Activity.preview_click_callback()
