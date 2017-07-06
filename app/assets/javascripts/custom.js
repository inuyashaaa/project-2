$(document).ready(function(){
  $('#message-tag').hide();
  let message_type = $('#message-tag').attr('class');
  let message = $('#message-tag').text();
  switch(message_type){
    case "success":
      toastr.success(message);
      break;
    case "info":
      toastr.info(message);
      break;
    case "warning":
      toastr.warning(message);
      break;
    case "error":
      toastr.error(message);
      break;
  }
});
