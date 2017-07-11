$(document).ready(function() {
  var imagePostUrl = $('#images-url').val();
  $('#cover-title-image').css('background-image', 'url(' + imagePostUrl + ')');

  $('body').on('click', '.edit-post', function(event) {
    event.preventDefault();
    var urlEdit = $(this).attr('href');
    $.ajax({
      url: urlEdit,
      type: 'GET',
      dataType: 'json',
      data: {},
    }).done(function(response) {
      if (response.status == 'success') {
        $('body').prepend(response.html);
        $('#myModal').modal('show');
      }
    }).fail(function(error) {
      toastr.error(error);
    });
    return false;
  });

  $('body').on('click', '.edit-button', function(event) {
    event.preventDefault();

    var editPostForm = $('.edit_post');
    var ck = CKEDITOR.instances.post_content.getData();
    var params = editPostForm.serialize();
    $.ajax({
      url: editPostForm.attr('action'),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
      type: 'PUT',
      dataType: 'json',
      data: params,
    }).done(function(response){
      if (response.status == 'success') {
        $('#myModal').modal('hide');
        $('#' + response.id).html(response.html);
      }
    }).fail(function(error){
      toastr.error(error);
    });
    return false;
  });

  $('body').on('click', '.delete-post', function(event) {
    event.preventDefault();
    var del = $(this);
    $.ajax({
      url: del.attr('href'),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
      type: 'delete',
      dataType: 'json',
      data: {},
    }).done(function(response) {
      toastr.success('Post deleted <3');
      del.closest('.card').fadeOut('slow');
    }).fail(function() {
    });
    return false;
  });
});
