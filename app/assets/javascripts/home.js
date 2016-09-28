// Google Maps ready function
function initMap() {
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var infowindow = new google.maps.InfoWindow();

  // location lookup success
  function locationSuccess(response) {
    // parse location
    var myLating = {lat: response.latitude, lng: response.longitude}

    // make map
    var mapDiv = document.getElementById('map');
    if (!mapDiv) {
      return;
    }
    
    var map = new google.maps.Map(mapDiv, {
      center: myLating,
      zoom: 11
    }); //end map
    directionsDisplay.setMap(map);

    // creating home marker
    var homeMarker = new google.maps.Marker({
      position: myLating,
      map: map,
      label: 'Home',
      title: 'Hello World!'
    }); //end marker

    searchNearbyDogParks(myLating, map);
  } //end locationSuccess

  function searchNearbyDogParks(myLating, map) {
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch({
      location: myLating,
      radius: '16100',
      types: ['park'],
      name: ['dog park']
    }, onSearchSuccess);

    function onSearchSuccess(results, status) {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
          var place = results[i];
          createMarker(place, map, myLating);
        }
      }
    } //end onSearchSuccess
  }

  function createMarker(place, map, myLating) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function() {
      var thePlace = "<ul class='marker'>";
      thePlace += "<li>" + place.name + "</li>";
      thePlace += "<li id='theAddress'>" + place.vicinity + "</li>";
      thePlace += "<li><input type='button' class='btn btn-sm' id='getDir' value='Directions Here!'></li>";
      thePlace += "</ul>";

      infowindow.setContent(thePlace);
      infowindow.open(map, this);

      $('#getDir').on('click', function(){
        calculateDirections(directionsDisplay, myLating, place)
      });
    });
  }

  function calculateDirections(directionsDisplay, myLating, place){
    var directionsService = new google.maps.DirectionsService;
    directionsService.route({
      origin: myLating,
      destination: place.vicinity,
      travelMode: 'DRIVING'
    }, function(response, status){
      console.log(response);
      if (status === "OK"){
        directionsDisplay.setDirections(response)
      } else {
        console.log('Directions request failed due to ' + status);
      }
    })// end route
  }


  // get location from geocoder
  var longs = $.ajax({
    url: '/grab_zip',
    success: locationSuccess
  }); //end ajax
}
