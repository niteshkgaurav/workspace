<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<html>  
 <head>   
  <title>Station Management</title>
  
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
        
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
<script>
$(document).ready(function(){
	$('#table_id').Datatable({
		"scrollY":"300px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>	  
    


 <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addStation.js"></script>
	<!-- <script type="text/javascript">
	$(window).load(function(){
		$(document).ready(function() {
		    
		    $("#stationForm").validate({
		    	
		        rules: {
		            "stationName": {
		                required: true,
		                minlength: 3,
		                maxlength: 45
		            },
		            "stnShortName": {
		                required: true,
		                minlength: 3,
		                maxlength: 45
		            },
		            "depotId": {
		            	required: true,
		            	digits: true
		            }
		        },
		        messages: {
		            "stationName": {
		                required: "Station name is required!",
		                minlength: "Station name must be at least 3 characters long"
		            },
		            "stnShortName": {
		                required: "Station short name is required",
		                minlength: "Station short name be at least 3 characters long"
		            },
		            "depotId": {
		                required: "Depot required to add station",
		                digits: "Select a depot to proceed"
		            }	            
		        },
		        submitHandler: function (form) {
		        	//alert("submitting form");
		        	form.submit(); // <-- this is default
		            // alert('valid form');
		        }
		    });
		    
		});
	});
	</script> -->



  <script>
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
            	document.getElementById('stnLat').value = place.geometry.location.lat();
            	document.getElementById('stnLong').value = place.geometry.location.lng();
            	              	
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
                  document.getElementById("stnLat").value = event.latLng.lat();
                  document.getElementById("stnLong").value = event.latLng.lng();
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
	        document.getElementById('stnLat').value = lat;
	        document.getElementById('stnLong').value = lng;
	        $(window).scrollTop(0);	    
		  	showLocation();
		  	
		}
    </script>
<script>
function dialogPop(event){
	$('#deleteId').dialog({
	width:250,
	height:150,
	title:"Confirm To Delete",
	buttons:{"OK":function(){
		CallBack(true);
	},
		"Cancel":function(){
			CallBack(true);
		}
		
		
	}
	});
	
	function CallBack(result){
		$('#deleteId').dialog("close");
		if(result==true){
			
			$('#stationForm').submit();
		}
	}
}
</script>





    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&libraries=places&callback=initMap"
        async defer></script>



 <body>
  <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Station Point</h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                       <div class="styled-input">
			                        	<input type="text" id="autocomplete" placeholder="Enter your station name" maxlength="50" />
			                       </div>
			                      </div>					        
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="map">
									</div>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>														        
					        	<form:form method="POST" id="stationForm" name="stationForm" action="${pageContext.request.contextPath}/AdminUI/station/saveStation" >
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
						                <div class="styled-input">
						                  <form:hidden path="stationId"  value="${station.stationId}" readonly="false"   />
						                  <span></span> 
						                </div>
					              </div>					        	
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="div_stationName">
						                  <form:input path="stationName" maxlength="50" size="45" value="${station.stationName}" readonly="false" onclick="removeHasError('div_stationName')"  />
						                  <label class="valid">* Station Point Name</label>
						                  <form:errors path="stationName" generated="true" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="div_stnShortName">
						                  <form:input path="stnShortName" maxlength="50" size="15" value="${station.stnShortName}" readonly="false" onclick="removeHasError('div_stnShortName') " />
						                  <label class="valid">* Station Nick Name</label>
						                  <form:errors path="stnShortName" generated="true" class="collapse" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div class="styled-input" id="div_stnLat">
									         <form:input path="stnLat"  maxlength="10" size="15" value="${station.stnLat}" readonly="false" onclick="removeHasError('div_stnLat') " />
									     <label class="valid">* Station Latitude</label>
									     <form:errors path="stnLat" generated="true" class="collapse" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div class="styled-input" id="div_stnLong">
									         <form:input path="stnLong" maxlength="10" size="15" value="${station.stnLong}" readonly="false"  onclick="removeHasError('div_stnLong')" />
									     <label class="valid">* Station Longitude</label>
									     <form:errors path="stnLong" generated="true" class="collapse" cssClass="error"/>
									     <span></span> 
									   </div>
									</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">						              
							       <div class="styled-input" id="div_depotId">
							       <form:label   class="valid" path="depotId">Select Depot: </form:label>						                
									<form:select  id="depotId" path="depotId" title="Depot Name" onfocus="removeHasError('div_depotId')">
										<c:if test="${!empty station.depotId}"> 
										<form:option selected="${station.depotId}"  value="${station.depotId}">${depotList[station.depotId]}
										</form:option>
										</c:if>  
										<form:option value=""></form:option>      		            
										<form:options items="${depotList}"  />
									</form:select>
							      </div>
							      </div>					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning" onclick="return formValidate(event);">Submit</button>
			                      </div>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
						        
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	   <!--      <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"> -->
	       </div>		          
						        			                      					              					              
					        	</form:form>

					        	
					        		 <c:if test="${!empty stations}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped" id="table_id">
														<thead>
															<tr>
															<!-- <th>Id</th> -->
															 <th>Station Point Name</th>
															 <th>Station Nick Name</th>
															 <th>Depot Name</th>
															 <th>Latitude</th>  
															 <th>Longitude</th>            
															 <th>Actions</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${stations}" var="station">
															<c:if test="${station.stnStatus!=2}">
																 <tr>
																  <td><c:out value="${station.stationName}"/></td>
																  <td><c:out value="${station.stnShortName}"/></td>
																   <td><c:out value="${depotList[station.depotId]}"/></td>
																   <td><c:out value="${station.stnLat}"/></td>
																   <td><c:out value="${station.stnLong}"/></td>
																  <td align="center"><a href="editStation?stationId=${station.stationId}">Edit</a> | <a href="deleteStation?stationId=${station.stationId}" id="deleteId" onclick="dialogPop(event);">Delete</a></td>
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
</html>