$(document).ready(function(){
  $('#new_post').submit(function(){
    $.ajax({
      url: this.attr('action'),
      type: this.attr('method'),
      data: this.serialize();
      success: function(response) {
        console.log(success);
        console.log(response);
        $("#pawzie-feed").load()
      }// end success
    })// end ajax
  }); // end new post submit
});
