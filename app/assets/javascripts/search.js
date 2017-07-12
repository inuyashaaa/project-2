$(document).ready(function() {
  $('body').on('click', '#search-button', function(event) {
    event.preventDefault();
    var params = $('#search-form').serialize();
    var searchUrl = $('#search-form').attr('action');
    $.ajax({
      url: searchUrl,
      type: 'GET',
      dataType: 'json',
      data: params,
    })
    .done(function(respon) {
      $('body').prepend(respon.html);
      $('#myModal').modal('show');
    })
    .fail(function() {
      console.log("error");
    });
    return false;
  });
});
