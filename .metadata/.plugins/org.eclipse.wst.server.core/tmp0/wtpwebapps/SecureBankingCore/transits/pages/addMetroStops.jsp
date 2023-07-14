<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">  
  <title> Metro Stop Management</title>  
</head>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	

 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addStop.js"></script>
     <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 300px;
        width:  600px;
        align:center;

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
      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }      
    </style>
    <style>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
    </style>    
<script type="text/javascript">
	function validate()	
	 { 
        		var check=true;
				var stopName = $("#stopName").val();
				var area  = $("#areaId").val();
				var stopLandmark  = $("#stopLandmark").val();
				var stopLat  = $("#stopLat").val();
				var stopLong  = $("#stopLong").val();
				
				if (stopName.length == 0) {
					
					$('#DivIDstopName').addClass('has-error');
					//$('#stopNameErrorId').append("Enter Stop Name");
				
					
					check=false;
					}
					
				if (stopLandmark.length == 0) {
					
					$('#DivIDstopLandmark').addClass('has-error');
					check=false;
					}
					
				if (area.length == 0) {
					
					$('#DivIdAreaId').addClass('has-error');
					check=false;
					}
				if (stopLat == 0.0) {
					
					$('#DivIdstopLat').addClass('has-error');
					check=false;
					}
				if (stopLong == 0.0) {
					
					$('#DivIdstopLong').addClass('has-error');
					check=false;
					}
				
					
				if(!check){
					return false;
					}
				/*else if()
				{
				$('#stopNameID').hide();
				$('#stopNameErrorId').show();
				$('#stopNameErrorId').html(
					"<p><font color='red'>Stop name is required!</font></p>");} */
		}
</script>

    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
		var lat1,lng1;
		var map;
      function initMap() {

    	  if (!lat1)
    		  lat1 = 30.7333;
    	  if (!lng1)
    	  	  lng1 = 76.7794;
    	  var loc1 = {lat: lat1, lng: lng1};
         map = new google.maps.Map(document.getElementById('map'), {
          center: loc1, //{lat: 30.7333, lng: 76.7794},
          zoom: 13,
          mapTypeId: 'roadmap'
        });

        var input = document.getElementById('autocomplete');

        	//alert(input);
        	var autocomplete = new google.maps.places.Autocomplete(input);

            // Bind the map's bounds (viewport) property to the autocomplete object,
            // so that the autocomplete requests use the current map bounds for the
            // bounds option in the request.
            autocomplete.bindTo('bounds', map);

            var infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');
            infowindow.setContent(infowindowContent);
            var marker = new google.maps.Marker({
              map: map,
              draggable: true,
              title:"Drag to point correct location",
              anchorPoint: new google.maps.Point(0, -29)
            });

            autocomplete.addListener('place_changed', function() {
              infowindow.close();
              marker.setVisible(false);
              var place = autocomplete.getPlace();
              document.getElementById('autocomplete').value="";
              if (!place.geometry) {
                window.alert("No details available for input: '" + place.name + "'");
                return;
              }

              // If the place has a geometry, then present it on a map.
              if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
              } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);  // Why 17? Because it looks good.              
              }
              marker.setPosition(place.geometry.location);
              marker.setVisible(true);
            	document.getElementById('stopLat').value = place.geometry.location.lat();
            	document.getElementById('stopLong').value = place.geometry.location.lng();
            	              	
              var address = '';
              if (place.address_components) {
                address = [
                  (place.address_components[0] && place.address_components[0].short_name || ''),
                  (place.address_components[1] && place.address_components[1].short_name || ''),
                  (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
              }

              infowindowContent.children['place-icon'].src = place.icon;
              infowindowContent.children['place-name'].textContent = place.name;
              infowindowContent.children['place-address'].textContent = address;
              infowindow.open(map, marker);
              
            });
				google.maps.event.addListener(marker, 'dragend', function (event) {
                  document.getElementById("stopLat").value = event.latLng.lat();
                  document.getElementById("stopLong").value = event.latLng.lng();
                  infoWindow.open(map, marker);
              });
        }
      
            
  	// Adds a marker to the map and push to the array.
  	function addMarker(location) {
  	  var marker = new google.maps.Marker({
  	    position: location,
  	    map: map
  	  });
  	  markers.push(marker);
  	}
  	
  	function showLocation() {
		//initLatLong();
	  var loc1 = {lat: lat1, lng: lng1};
		initMap();
	    addMarker(loc1);
	}
  	  	
	function showMap(lat, lng) {
		lat1=lat;
		lng1=lng;
	    //$('#map').prop('hidden', false);
        document.getElementById('stopLat').value = lat;
        document.getElementById('stopLong').value = lng;
        $(window).scrollTop(0);	    
	  	showLocation();
	  	
	}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&libraries=places&callback=initMap"
        async defer></script>

<script>
$(document).ready(function(){
	$('#table_id').DataTable({
		"scrollY":"350px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>

<script>
function hideMessage(){
	$('#message').hide();
}
</script>
<body>

 <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Metro Station</h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">
					        
<div id="message">${msg}</div>
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                       <div class="styled-input">
			                        	<input type="text" id="autocomplete" placeholder="Enter your stop name"  />
			                       </div>
			                      </div>					        
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="map">
									</div>	
								    <div id="infowindow-content">
								      <img src="" width="16" height="16" id="place-icon">
								      <span id="place-name"  class="title"></span><br>
								      <span id="place-address"></span>
								    </div>									
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
									        <hr>
									</div>
									
									
																					        
					        	<form:form method="POST" id="stopForm" name="stopForm"  modelAttribute="metroStops" action="${pageContext.request.contextPath}/AdminUI/metroController/stops">
					        	
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
									       <div class="styled-input">
									         <form:hidden path="stationId"  readonly="false"   />
									     <span></span> 
									   </div>
									</div>
															        	
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="stationName" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">* Station  Name</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
					              
					              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="state" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">* State</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="pincode" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">* Pincode</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="inGates" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">* Number of IN Gates:</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="outGates" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">Number of OUT Gates:</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDstopName" class="styled-input">
									         <form:input path="multiGate" class="selecttag" onclick="hideMessage()" onchange="selecttag('stopNameID','stopName');" 
									         onfocus="removeHasError('DivIDstopName');showlabel('stopNameID','stopNameErrorId')" size="45" readonly="false"   />
									     	<label id="stopNameID" class="valid">* Number of IN/OUT Gates:</label>
									     	<label id="stopNameErrorId" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
									
									
								
					              
							     
							      
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIdstopLat" class="styled-input">		
									         <form:input path="stationLat" onchange="selecttag('labelStopLat','stopLat');" 
									         onfocus="removeHasError('DivIdstopLat');showlabel('labelStopLat','stopLatErrorId')"    readonly="false"   />
									     	<label id="labelStopLat" class="valid">* Station Latitude</label>
									     	<label id="stopLatErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									        <div id="DivIdstopLong" class="styled-input">		
									         <form:input path="stationLong" onchange="selecttag('labelStopLong','stopLong');" 
									         onfocus="removeHasError('DivIdstopLong');showlabel('labelStopLong','stopLongErrorId')"   readonly="false"   />
									     	<label  id="labelStopLong" class="valid">* Station Longitude</label>
									     	<label id="stopLongErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>					              							      					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" onclick="return validate();" class="btn btn-warning">Submit</button>
			                      </div>
			                      
			                     
			                      		                      					              					              
					        	</form:form>
								
						   
					        </div>
				</section>
			</div>

	</div>
 </body>  
</html>