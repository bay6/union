$('#award-form-modal').modal
  keyboard: true,
  show: true

$('#badge_id').attr('value', "<%=@badge.id%>")

$('#award-users').select2({width: 'resolve' })



