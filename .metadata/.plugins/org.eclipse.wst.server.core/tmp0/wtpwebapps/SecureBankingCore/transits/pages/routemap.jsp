<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Route Map</title>
  </head>
  
      <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
      <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&callback=initMap">
    </script>
    <script>
		function initMap() {
		  var directionsDisplay = new google.maps.DirectionsRenderer;
		  var directionsService = new google.maps.DirectionsService;
		  var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 14,
			center: {lat:30.716446, lng: 76.74411}
		  });
		  directionsDisplay.setMap(map);

		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		  //var selectedMode = document.getElementById('mode').value;
		  directionsService.route({
			origin: {lat:30.716446, lng: 76.74411},  				// Kapasher border.
			destination: {lat: 30.73532	, lng:76.77924},  // Anand Vihar Terminal.
			travelMode: google.maps.TravelMode.TRANSIT
		  }, function(response, status) {
			if (status == 'OK') {
			  directionsDisplay.setDirections(response);
			} else {
			  window.alert('Directions request failed due to ' + status);
			}
		  });
		}
    </script>
  <body>
    
    <div id="map"></div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&callback=initMap">
    </script>
    <script>
		function initMap() {
		  var directionsDisplay = new google.maps.DirectionsRenderer;
		  var directionsService = new google.maps.DirectionsService;
		  var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 14,
			center: {lat:30.716446, lng: 76.74411}
		  });
		  directionsDisplay.setMap(map);

		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		  //var selectedMode = document.getElementById('mode').value;
		  directionsService.route({
			origin: {lat:30.716446, lng: 76.74411},  				// Kapasher border.
			destination: {lat: 30.73532	, lng:76.77924},  // Anand Vihar Terminal.
			travelMode: google.maps.TravelMode.TRANSIT
		  }, function(response, status) {
			if (status == 'OK') {
			  directionsDisplay.setDirections(response);
			} else {
			  window.alert('Directions request failed due to ' + status);
			}
		  });
		}
    </script>
  </body>
</html>