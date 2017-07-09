$(document).ready(function(){
  $('#message-tag').hide();
  var messageType = $('#message-tag').attr('class');
  var message = $('#message-tag').text();
  switch(messageType){
  case 'success':
    toastr.success(message);
    break;
  case 'info':
    toastr.info(message);
    break;
  case 'warning':
    toastr.warning(message);
    break;
  case 'error':
    toastr.error(message);
    break;
  }
});
