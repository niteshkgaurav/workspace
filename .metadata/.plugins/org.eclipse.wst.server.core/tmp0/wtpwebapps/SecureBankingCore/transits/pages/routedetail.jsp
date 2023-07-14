<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Route Fare Details</title>
</head>
  
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
  </style>
  <link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script> 
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 
  <script type="text/javascript">
  		function validateData(){
			var stops = document.getElementById('areaId');
  			var selectedStop = document.getElementById("areaId").value;
			//var strStop = e.options[e.selectedIndex].text;
  			<c:forEach var="routeStop" items="${routeStops}" >
  				if(selectedStop== "${routeStop.srcStop}"){
  					alert("Already selected the stop");
  					for (var i = 0; i < stops.options.length; i++) {
  					    if (stops.options[i].text === "Add a Stop to Route") {
  					    	stops.selectedIndex = i;
  					        break;
  					    }
  					}
  				}
  			</c:forEach>
  		}
  </script>
  
  <script type="text/javascript">
	$(window).load(function(){
		$(document).ready(function() {
		    
		    $("#routeDetailForm").validate({
		    	
		        rules: {
		            "distanceFromSrc": {
		                required: true,
		                number: true
		            },
		            "srcStop": {
		                required: true
		            }		            
		        },
		        messages: {
		            "distanceFromSrc": {
		                required: "Distance from source station is required",
		                number: "Enter numeric value"
		            },
		            "srcStop": {
		                required: "Select stop to add to route"
		            }		            
		        },
		        submitHandler: function (form) {
		        	form.submit(); // <-- this is default
		        }
		    });
		    
		});
	});
</script>
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&callback=initMap">
</script>
<script>
		function initMap() {
		  var directionsDisplay = new google.maps.DirectionsRenderer;
		  var directionsService = new google.maps.DirectionsService;
		  var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 14,
			center: {lat: 30.7333, lng: 76.7794}
		  });
		  directionsDisplay.setMap(map);
		
		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		}
		
		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		  //var selectedMode = document.getElementById('mode').value;
		  	var orgLat = '${srcStation.stnLat}';
			var orgLong = '${srcStation.stnLong}';
			var destLat = '${destStation.stnLat}';
			var destLong = '${destStation.stnLong}';		  	
			var loc1 = new google.maps.LatLng(orgLat, orgLong);
			var loc2 = new google.maps.LatLng(destLat, destLong);
			var noOfStops = '${routeStops.size()}'
			
				  var waypts = []; //new Array();
				  if(noOfStops>0){
		                 //pusing waypoint array 
		                 var i;
		               <c:forEach items="${routeStops}" var="routeStop">
		               		//waypts.push(['${routeStop.stopLat}', ${routeStop.stopLong}']);
		               		var stopLat = '${routeStop.stopLat}';
		               		var stopLong =  '${routeStop.stopLong}';
		               		 waypts.push({
									  location: new google.maps.LatLng(stopLat, stopLong),
								      stopover: true
								  });
		               </c:forEach> 
				  } 			
			
		  directionsService.route({
			origin: loc1, 
			destination:loc2, 
			//waypoints: waypts, //an array of waypoints
			travelMode: google.maps.TravelMode.TRANSIT
		  }, function(response, status) {
			if (status == 'OK') {
			  directionsDisplay.setDirections(response);
			} else {
			  window.alert('Directions request failed due to ' + status);
			}
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
</script>

<script>
$(document).ready(function(){
	$('#table_id').DataTable({
		"scrollY":"350px",
		"scrollX":"250px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>

<body>
  <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Stops for Route</h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">				        
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
					        	<form:form method="POST" id="routeDetailForm" name="routeDetailForm" action="${pageContext.request.contextPath}/AdminUI/routeStop/saveRouteDetail" >
					        	
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
									       <div class="styled-input">
									         <form:hidden path="rtdId"  value="${RouteStop.rtdId}"  readonly="false" />
									     <span></span> 
									   </div>
									</div>						        	
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
									       <div class="styled-input">
									         <form:hidden path="routeId"  size="45" value="${RouteStop.routeId}" readonly="false"   />
									     <label id="lblRouteId" class="valid">*Route  Number</label>
									     <form:errors path="routeId" generated="true" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
									       <div class="styled-input">
									         <form:input path="routeNumber"  size="45" value="${route.routeNumber}" readonly="true"   />
									     <label id="lblRouteNumber" class="valid">*Route  Number</label>
									     <form:errors path="routeNumber" generated="true" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
									   <div class="styled-input">
									     <form:input path=""  size="500" value="" readonly="true"   />
			     						 <label id="lblRoute" class="valid">* ${route.srcStation} To ${route.destStation}</label>									     
									     <form:errors path="" generated="true" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>														              
							      <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							       	<div class="styled-input">					                
									<form:select class="form-control" id="areaId" path="srcStop" title="Stop Name" onchange= "validateData()">
										<c:if test="${!empty RouteStop.srcStop}"> 
										<form:option selected="${RouteStop.srcStop}"  value="${RouteStop.srcStop}">${stopList[stop.srcStop]}
										</form:option>
										</c:if>  
										<form:option value="">Add a Stop to Route</form:option>      		            
										<form:options items="${stopList}"  />
									</form:select>
							      </div>
							      </div> --%>
							      
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="stopRouteDiv_Id" class="styled-input">					                
							<form:select id="areaId" path="srcStop" title="Stop Name" class="selecttag" onchange="validateData()" >
				
								<c:if test="${!empty RouteStop.srcStop}"> 
								<form:option selected="${RouteStop.srcStop}"  value="${RouteStop.srcStop}">${stopList[stop.srcStop]}
								</form:option>
								</c:if>  
								<form:option value="" ></form:option>      		            
								<form:options items="${stopList}"  />
							</form:select>
						<label id="labelstopRouteId" class="valid">Add a Stop to Route</label>
						<label id="stopRouteErrorId" class="collapse"></label>
						<span></span>
				      </div>
				</div>
							      
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div class="styled-input" id="distanceFromSrcDiv_Id">
									         <form:input  id="distanceFromSrc" path="distanceFromSrc"  maxlength="6" size="15" onclick="removeHasError('distanceFromSrcDiv_Id')" value="${RouteStop.distanceFromSrc}" readonly="false" />
									     <label id="lblDistanceFromSrc" class="valid">*Distance from Source Station(KM)</label>
									     <form:errors path="distanceFromSrc" generated="true" class="collapse" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div class="styled-input" id="travelTimeDiv_Id">
									         <form:input id="travelTime" path="travelTime" maxlength="4" size="15" onclick="removeHasError('travelTimeDiv_Id')" value="${RouteStop.travelTime}" readonly="false" />
									     <label id="lblTravelTime" class="valid">Travel Time(Min)</label>
									     <form:errors path="travelTime" generated="true" class="collapse" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>					              							      					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning" onclick="validateRouteStop(event)">Submit</button>
			                      </div>		                      					              					              
					        	</form:form>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>

								
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>	
						        				        	
					        		 <c:if test="${!empty routeStops}">				        		 
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped" id="table_id">
														<thead>
															<tr>
															<!-- <th>Id</th	> -->
															 <th>Route Number</th>
															  <th>Source Station</th>
															 <th>Stop Name</th>
															 <th>Distance(Km)</th>
															 <th>Fare Amount(Non A/C)</th>
															 <th>Fare Amount(A/C)</th>
															 <th>Latitude</th>
															 <th>Longitude</th>															           
															 <th>Actions</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${routeStops}" var="routeStop">
															 <c:if test="${routeStop.status>0}"> 
																 <tr>
																  <td><c:out  value="${route.routeNumber}"/></td>
																  <td><c:out  value="${route.srcStation}"/></td>
																  <td><c:out  value="${stopList[routeStop.srcStop]}"/></td>
																   <td><c:out value="${routeStop.distanceFromSrc}"/></td>
																   <td><c:out value="${routeStop.fareAmount}"/></td>
																   <td><c:out value="${routeStop.fareAmountAC}"/></td>
																   <td><c:out value="${routeStop.stopLat}"/></td>
																   <td><c:out value="${routeStop.stopLong}"/></td>																   
																  <td align="center"><a href="deleteStop?stopId=${routeStop.rtdId}&routeId=${routeId}">Delete</a></td>
																 </tr>
														    </c:if> 
															</c:forEach>	
										
														</tbody>
													  </table>												

												</div>
											</div>					        		 
										</div>
									
									</c:if>
					        </div>
				</section>
			</div>

	</div>
</body>
<script>
function validateRouteStop(event){
	check=true;
	var v1=$('#distanceFromSrc').val();
	var v1=$('#travelTime').val();
	
	if(v1.length==0){
		$('#distanceFromSrcDiv_Id').addClass('has-error');
		check=false;
	}
	
	if(v1.length==0){
		$('#travelTimeDiv_Id').addClass('has-error');
		check=false;
	}
	if(check==false){
		event.preventDefault();
		return false;
	}
}

</script>
</html>