$(document).ready(function(){
  $('#new_comment').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
      success: function(response) {
        console.log(response);
      }// end success
    })// end ajax
  }); // end new post submit
});
