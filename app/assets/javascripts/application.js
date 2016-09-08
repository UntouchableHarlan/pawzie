// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function initMap() {
  var mapDiv = document.getElementById('map');
  var map = new google.maps.Map(mapDiv, {
      center: {lat: 44.540, lng: -78.546},
      zoom: 8
  });
  var geocoder = new google.maps.Geocoder();
  geocodeAddress(geocoder, map);

  function geocodeAddress(geocoder, resultsMap) {
    var address = $.ajax({
      url: '/grab_zip',
      success: function(response){
        console.log("success");
        console.log(JSON.stringify(response.address));
      }
    });// end ajax
    geocoder.geocode({'address': JSON.stringify(address.address)}, function(results, status){
      if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
    })//end geocoder geocode
  }// end geocodeAddress
}



$(document).ready(function(){
  initMap();
});
