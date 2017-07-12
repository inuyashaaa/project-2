$(document).ready(function() {
  $('body').on('click', '#submit-comment', function(event) {
    event.preventDefault();
    var content = $(this).closest('.coment-form').find('#comment_content').val();
    var params = {
      comment: {
        content: content
      }
    };
    $.ajax({
      url: $(this).closest('.coment-form').find('#new_comment').attr('action'),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
      type: 'POST',
      dataType: 'json',
      data: params
    }).done(function(response) {
      toastr.success("Comment created <3");
      $('.list-comment').append(response.html);
      var totalComment = $('#total-comment').text();
      totalComment = parseInt(totalComment) + 1;
      $('#total-comment').text(totalComment);
      $('#comment_content').val('');
    }).fail(function() {
      toastr.warning('Can not create comment');
    });
    return false;
  });

  $('body').on('click', '.edit-comment', function(event) {
    event.preventDefault();
    var editCommentUrl = $(this).attr('href');
    $.ajax({
      url: editCommentUrl,
      type: 'GET',
      dataType: 'json',
      data: {},
    })
    .done(function(response) {
      $('body').prepend(response.html);
      $('#myModal').modal('show');
    })
    .fail(function() {
      console.log("error");
    });
    return false;
  });

  $('body').on('click', '#edit-comment', function(event){
    event.preventDefault();
    var editUrl = $(this).closest('form').attr('action');
    var content = $('#comment_content').val();
    var params = {
      comment: {
        content: content
      }
    };
    $.ajax({
      url: editUrl,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
      type: 'PUT',
      dataType: 'json',
      data: params,
    })
    .done(function(response) {
      toastr.success('Comment updated <3');
      $('#' + response.id).html(response.html);
      $('#myModal').modal('hide');
    })
    .fail(function(error) {
      toastr.error(error.message);
    });
    return false;
  });
});
