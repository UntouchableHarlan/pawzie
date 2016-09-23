$(document).ready(function(){
  $('#like-button').on('click', function(event){
    event.preventDefault();
    var img = $('#like-button').attr('src');
    $('#like-button').attr('pawl.png', img)
  });
});
