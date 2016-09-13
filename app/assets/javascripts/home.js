 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

 var longs = $.ajax({
   url: '/grab_zip',
   success: function(response){
     // console.log(response);
     // longitude += response
   } //end ajax
 });

 console.log(longs);

 function initMap() {
   var longs = $.ajax({
     url: '/grab_zip',
     success: function(response){
       // console.log(response);
       // longitude += response
       var mapDiv = document.getElementById('map');
       var myLating = {lat: response.latitude, lng: response.longitude}
       var map = new google.maps.Map(mapDiv, {
           center: myLating,
           zoom: 11
       }); //end map
       var homeMarker = new google.maps.Marker({
         position: myLating,
         map: map,
         label: 'Home',
         title: 'Hello World!'
       }); //end marker

       var service;
       var infowindow = new google.maps.InfoWindow();;
        service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
           location: myLating,
           radius: '16100',
           types: ['park'],
           name: ['dog park']
         }, callback);

        function callback(results, status) {
          if (status == google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
              var place = results[i];
              createMarker(results[i]);
            }
          }
        } //end callback

        function createMarker(place) {
          var placeLoc = place.geometry.location;
          var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
          });

          google.maps.event.addListener(marker, 'click', function() {
            var thePlace = "<ul>"
            thePlace += "<li style='list-style-type: none;'>" + place.name + "</li>"
            thePlace += "<li style='list-style-type: none;'>" + place.vicinity + "</li>"
            thePlace += "</ul>"
            infowindow.setContent(thePlace);
            infowindow.open(map, this);
          });
        }

     } //end success
   }); //end ajax
 }



 $(document).ready(function(){
   initMap();
 });
