
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script> -->
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui_1.11.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/parking/js/parking.js"></script>
 

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<title>Merchant Registration</title>
<script>
	
</script>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 300px;
	width: 600px;
	align: center;
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
	font-family: 'Roboto', 'sans-serif';
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
<
link
 
type
="text/css"
 
rel
="stylesheet"
 
href
="https
:
//fonts
.googleapis
.com
/css?family=Roboto
:
300
,
400,500">
</style>

<script type="text/javascript">
	function validate() {
		var check = true;
		var stopName = $("#stopName").val();
		var area = $("#areaId").val();
		var stopLandmark = $("#stopLandmark").val();
		var stopLat = $("#stopLat").val();
		var stopLong = $("#stopLong").val();

		if (stopName.length == 0) {

			$('#DivIDstopName').addClass('has-error');
			//$('#stopNameErrorId').append("Enter Stop Name");

			check = false;
		}

		if (stopLandmark.length == 0) {

			$('#DivIDstopLandmark').addClass('has-error');
			check = false;
		}

		if (area.length == 0) {

			$('#DivIdAreaId').addClass('has-error');
			check = false;
		}
		if (stopLat == 0.0) {

			$('#DivIdstopLat').addClass('has-error');
			check = false;
		}
		if (stopLong == 0.0) {

			$('#DivIdstopLong').addClass('has-error');
			check = false;
		}

		if (!check) {
			return false;
		}

	}
</script>

<script>
	// This example requires the Places library. Include the libraries=places
	// parameter when you first load the API. For example:
	// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
	var lat1, lng1;
	var map;

	function initMap() {

		if (!lat1)
			lat1 = 30.7333;
		if (!lng1)
			lng1 = 76.7794;
		var loc1 = {
			lat : lat1,
			lng : lng1
		};
		map = new google.maps.Map(document.getElementById('map'), {

			center : loc1, //{lat: 30.7333, lng: 76.7794},
			zoom : 13,
			mapTypeId : 'roadmap'
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
			map : map,
			draggable : true,
			title : "Drag to point correct location",
			anchorPoint : new google.maps.Point(0, -29)
		});

		autocomplete
				.addListener(
						'place_changed',
						function() {
							infowindow.close();
							marker.setVisible(false);
							var place = autocomplete.getPlace();
							document.getElementById('autocomplete').value = "";
							if (!place.geometry) {
								window
										.alert("No details available for input: '"
												+ place.name + "'");
								return;
							}

							// If the place has a geometry, then present it on a map.
							if (place.geometry.viewport) {
								map.fitBounds(place.geometry.viewport);
							} else {
								map.setCenter(place.geometry.location);
								map.setZoom(17); // Why 17? Because it looks good.              
							}
							marker.setPosition(place.geometry.location);
							marker.setVisible(true);
							document.getElementById('stopLat').value = place.geometry.location
									.lat();
							document.getElementById('stopLong').value = place.geometry.location
									.lng();

							var address = '';
							if (place.address_components) {
								address = [
										(place.address_components[0]
												&& place.address_components[0].short_name || ''),
										(place.address_components[1]
												&& place.address_components[1].short_name || ''),
										(place.address_components[2]
												&& place.address_components[2].short_name || '') ]
										.join(' ');
							}

							infowindowContent.children['place-icon'].src = place.icon;
							infowindowContent.children['place-name'].textContent = place.name;
							infowindowContent.children['place-address'].textContent = address;
							infowindow.open(map, marker);

						});
		google.maps.event.addListener(marker, 'dragend', function(event) {
			document.getElementById("stopLat").value = event.latLng.lat();
			document.getElementById("stopLong").value = event.latLng.lng();
			infoWindow.open(map, marker);
		});
	}

	// Adds a marker to the map and push to the array.
	function addMarker(location) {
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
		markers.push(marker);
	}

	function showLocation() {
		//initLatLong();
		var loc1 = {
			lat : lat1,
			lng : lng1
		};
		initMap();
		addMarker(loc1);
	}

	function showMap(lat, lng) {
		lat1 = lat;
		lng1 = lng;
		//$('#map').prop('hidden', false);
		document.getElementById('stopLat').value = lat;
		document.getElementById('stopLong').value = lng;
		$(window).scrollTop(0);
		showLocation();

	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&libraries=places&callback=initMap"
	async defer></script>

<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"scrollY" : "350px",
			"scrollCollapse" : true,
			"paging" : true,
			"pagingType" : "simple_numbers"
		});
	});
</script>

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	/*   background-color: rgb(0,0,0); Fallback color * background-color: #fff;*/
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #ffffff; /*  #fefefe;  #008000;*/
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script>
	function showMapDiv() {
		//$("#").show();
		$("#autocomplete").val($("#pin").val().trim());
		document.getElementById('autocomplete').readOnly = true;
		var modal = document.getElementById('myModal');

		modal.style.display = "block";
	}


	function show1(){
		$('#mapDiv').show();
	}
	</script>
	
	<script>
	function restrict(event){
		check=true;
		var v1=$('#parkingName').val().trim();
		var v2=$('#pin').val().trim();
		var v3=$('#address').val().trim();
		var v4=$('#twoWheelerCapacity').val().trim();
		var v5=$('#fourWheelerCapacity').val().trim(); 	
		
		if(v1.length==0){
			$('#parkingNameDiv_Id').addClass('has-error');
			check=false;
		}
		
		if(v2.length==0){
			$('#div_pinCode').addClass('has-error');
			check=false;
		}
		if(v3.length==0){
			$('#addressSelectDivId').addClass('has-error');
			check=false;
		}
		if(v4.length==0){
			$('#twoWheelerDiv_Id').addClass('has-error');
			check=false;
		}
		if(v5.length==0){
			$('#fourWheelerDiv_Id').addClass('has-error');
			check=false;
		}
		
		if(!check){
			event.preventDefault();
		}
	}
	
	
	</script>
	<script>
	function clrMsg(){
		
		$('#msgDiv_Id').hide();
		
	}
	</script>
	
</head>
<body>

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
   <span class="close" ><font color='black'> &times;</font></span>
			                      <div  style="background-color:white">
			                      
			                       <div  >.
			                        	<!-- <input type="text" id="autocomplete" placeholder="Enter here"  /> -->
			                        	  <div id="mapDiv" align="center">
			                      <div  style="background-color:white">
			                       <div class="styled-input" style="background-color:white">
			                        	<input type="text" id="autocomplete" placeholder="Enter here" />
			                        
			                       </div>
			                      </div>					        
									<div  id="map" style="background-color:white">
									</div>	
								    <div id="infowindow-content" style="background-color:white">
								      <img src="" width="16" height="16" id="place-icon">
								      <span id="place-name"  class="title"></span><br>
								      <span id="place-address"></span>
								      
								    </div>	
								    <br>								
										<input type="button" id="updatemap" class="btn btn-warning" align="right" value="Update" />	
						</div>
			                        	
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
									        
									</div>		
			</div>
  </div>
  

<script>
// Get the modal
var modal = document.getElementById('myModal');


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}
$("#updatemap").click(function () {
	modal.style.display = "none";
});


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<!-- ============================================ Form Start ================================================================================================== -->

	<form:form method="post" modelAttribute="parkingBean"
		action="${pageContext.request.contextPath}/AdminUI/parkingController/addParking">
		<div class="heading-inner ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">Create Parking</h1>
			<div class="clearfix"></div>


		</div>
		<hr>
		<div align="center" id="msgDiv_Id">${msg}</div>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
			&nbsp;</div>
		<%--   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="parkingIdDiv_Id" class="styled-input">
						<form:input id="pid" path="pid"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" onchange="selecttag('parkingLblName','parkingName');" 
						 	onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"  readonly="false"   />
						 <label id="parkingLblName" class="valid">*Parking Id</label>
						 <label id="parkingLblErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			       --%>

		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="parkingNameDiv_Id" class="styled-input">
				<form:input id="parkingName" path="parkingName" maxlength="20"
					class="selecttag" onclick="clrMsg();removeAlertMsg();"
					onchange="selecttag('parkingLblName','parkingName');"
					onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"
					readonly="false" />
				<label id="parkingLblName" class="valid">*Parking Name</label> <label
					id="parkingLblErrorId" class="collapse"></label> <span></span>
			</div>
		</div>

		<%--   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="parkingLocationDiv_Id" class="styled-input">
						<form:input id="parkingLocation" path="parkingLocation"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('parkingLocationId','parkingLocation');" 
						 	onfocus="removeHasError('parkingLocationDiv_Id');showlabel('parkingLocation','parkingLocationErrorId')"  readonly="false"   />
						 <label id="parkingLocationId" class="valid">*Parking Location</label>
						 <label id="parkingLocationErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>  --%>



		<%--  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
				       	<div id="parkingTypeDiv_Id" class="styled-input">					                
							<form:select id="parkingType" path="parkingType" title="parkingType" class="selecttag" onchange="selecttag('labelparkingTypeId','parkingType');" 
						         onfocus="removeHasError('parkingTypeDiv_Id');" onclick="this.setAttribute('value', this.value);" value="">
						          
								<c:if test="${!empty command.parkingType}"> 
								<form:option selected="${command.parkingType}"  value="${command.parkingType}">${parkingTypeList[command.parkingType}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${parkingTypeList}"  />
							</form:select>
						<label id="labelparkingTypeId" class="valid">Select Parking Type</label>
						<label id="parkingTypeErrorId" class="collapse"></label>
						<span></span>
				      </div>
			      </div> --%>

		<!-- //======================================== -->
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">



			<div class="row">
				<div class="col-md-4 col-lg-4 pr0">
					<div id="div_pinCode" class="styled-input">

						<form:input type="text" maxlength="6" path="pin" id="pin"
							onclick="clrMsg();clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');"
							onfocus="removeHasError('div_pinCode')"
							onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " />
						<label id="hhg" class="valid">PinCode</label> <label
							id="lab_pinCodeErrorId" class="collapse"></label>

					</div>
				</div>
				<div class="col-md-8 col-lg-8 pl0">

					<input type="button" class="btn btn-warning" id="addressFetchId"
						value="Fetch Address" onclick="fetchAddress();" />&nbsp; &nbsp;<a
						href="#" onclick="show1();showMapDiv();" />Show map</a></font>


				</div>
			</div>
			<div id="addressErrorId"></div>
			<div id='addressSelectDivIdPopup' style='display: none'>
				<table border="1" cellpadding='0' width='100%'
					id='addressSelectTableId'>
				</table>
			</div>
		</div>






		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="addressSelectDivId" class="styled-input">
				<form:input type="text" path="address" id="address" maxlength="20"
					onclick="removeHasError('addressSelectDivId');" />
				<label id="hhg" class="valid">Address</label> <label
					id="lab_addressErrorId" class="collapse"></label><span></span>

			</div>
		</div>





		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="Region" class="styled-input">
				<form:input type="text" path="region" readonly="true" />
				<label id="ii" class="valid">Region</label> <label
					id="lab_regionErrorId" class="collapse"></label><span></span>

			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="Locality" class="styled-input">
				<form:input type="text" path="locality" readonly="true" />
				<label id="imhh" class="valid">Locality</label> <label
					id="lab_localityErrorId" class="collapse"></label><span></span>

			</div>
		</div>



		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="District" class="styled-input">
				<form:input type="text" path="district" readonly="true" />
				<label id="iilm" class="valid">District</label> <label
					id="lab_districtErrorId" class="collapse"></label><span></span>

			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div class="styled-input" id="State">


				<form:input type="text" path="statess" readonly="true"
					onfocus="clrmsg('lab_StateErrorId')" />
				<label id="iiaa" class="valid">State</label> <label
					id="lab_StateErrorId" class="collapse"></label><span></span>

			</div>
		</div>



		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="State" class="styled-input">
				<form:input type="text" path="countrys" id="country" readonly="true"
					onfocus="clrmsg('lab_CountryErrorId')" />
				<label id="ciaa" class="valid">Country</label> <label
					id="lab_CountryErrorId" class="collapse"></label><span></span>

			</div>
		</div>
		<!--  //======================================== -->

		<%-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="NoOfSlotsDiv_Id" class="styled-input">
				<form:input id="fourWheelerCapacity" path="fourWheelerCapacity"
					maxlength="20" class="selecttag" onclick="removeAlertMsg();"
					ononchange="selecttag('fourWheelerLabelId','fourWheelerCapacity');"
					onfocus="removeHasError('fourWheelerDiv_Id');showlabel('fourWheelerCapacity','fourWheelerLabelErrorId')"
					readonly="false" />
				<label id="fourWheelerLabelId" class="valid">*No Of Slots</label> <label
					id="fourWheelerLabelErrorId" class="collapse"></label> <span></span>
			</div>
		</div> --%>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIdstopLat" class="styled-input">		
									         <form:input path="latitude" id="stopLat" onchange="selecttag('labelStopLat','stopLat');" 
									         onfocus="removeHasError('DivIdstopLat');showlabel('labelStopLat','stopLatErrorId')"  maxlength="10" size="15" value="${stop.stopLat}" readonly="true"   />
									     	<label id="labelStopLat" class="valid">Parking Latitude</label>
									     	<label id="stopLatErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									        <div id="DivIdstopLong" class="styled-input">		
									         <form:input path="longitude" id="stopLong" onchange="selecttag('labelStopLong','stopLong');" 
									         onfocus="removeHasError('DivIdstopLong');showlabel('labelStopLong','stopLongErrorId')"  maxlength="10" size="15" value="${stop.stopLong}" readonly="true"   />
									     	<label  id="labelStopLong" class="valid">Parking Longitude</label>
									     	<label id="stopLongErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>	
					

		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="twoWheelerDiv_Id" class="styled-input">
				<form:input id="twoWheelerCapacity" path="twoWheelerCapacity"
					maxlength="20" class="selecttag" onclick="removeAlertMsg();"
					ononchange="selecttag('twoWheelerLabelId','twoWheelerCapacity');"
					onfocus="removeHasError('twoWheelerDiv_Id');showlabel('twoWheelerCapacity','twoWheelerLabelErrorId')"
					readonly="false" />
				<label id="twoWheelerLabelId" class="valid">*Two Wheeler
					Capacity</label> <label id="twoWheelerLabelErrorId" class="collapse"></label>
				<span></span>
			</div>
		</div>


		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="fourWheelerDiv_Id" class="styled-input">
				<form:input id="fourWheelerCapacity" path="fourWheelerCapacity"
					maxlength="20" class="selecttag" onclick="removeAlertMsg();"
					ononchange="selecttag('fourWheelerLabelId','fourWheelerCapacity');"
					onfocus="removeHasError('fourWheelerDiv_Id');showlabel('fourWheelerCapacity','fourWheelerLabelErrorId')"
					readonly="false" />
				<label id="fourWheelerLabelId" class="valid">*Four Wheeler
					Capacity</label> <label id="fourWheelerLabelErrorId" class="collapse"></label>
				<span></span>
			</div>
		</div>


		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input id="submitId" type="submit" onclick="restrict(event)"
				class="btn btn-warning" value="Submit" />
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<hr>
		</div>

	<c:if test="${!empty allParkings}">
				<div class="col-xs-12">
					<div class="transaction-table">
						<div class="table-responsive">

							<table class="table table-bordered table-striped" id="table_id">
						<thead>
									<tr>
                                        <th>Parking Pincode</th>
										<th>Parking Name</th>
										<th>Parking Address</th>
										<th>Two Wheeler Capacity</th>
										<th>Four Wheeler Capacity</th>
										
										
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${allParkings}" var="parking">
								 
										<tr>
											    <td><c:out value="${parking.pin}" /></td>
												<td><c:out value="${parking.parkingName}" /></td>
												<td><c:out value="${parking.address}" /></td>
												<td><c:out value="${parking.twoWheelerCapacity}" /></td>
												<td><c:out value="${parking.fourWheelerCapacity}" /></td>
												
								
											</tr>
	 									
	 							</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</c:if>




	</form:form>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		<hr>
	</div>
	<hr>


</body>
</html>
