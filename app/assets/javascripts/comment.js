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
});
