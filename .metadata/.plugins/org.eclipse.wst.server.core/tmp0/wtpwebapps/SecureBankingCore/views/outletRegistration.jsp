<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.MerchantData" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.min.js"></script>	
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>  
     <script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Merchant.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/iban.js"></script>
<script src=${pageContext.request.contextPath}/js/aes.js></script>
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
          <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">     
    </style> 
   <%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
  Integer menuId=(Integer)request.getAttribute("menuId");
  Integer submenuId=(Integer)request.getAttribute("submenuId");
 %>
    
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPnZDk0DSoaXqGkG_1R6Ilr8OxiKjXzI8&libraries=places&callback=initMap"  async defer></script>


 <style>
body {font-family: Arial, Helvetica, sans-serif;}

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
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color:#ffffff; /*  #fefefe;  #008000;*/
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

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script>

function showMapDiv()
{
	$("#autocomplete").val($("#pin").val().trim());
	document.getElementById('autocomplete').readOnly = true;
	var modal = document.getElementById('myModal');

	    modal.style.display = "block";
}

$(document).ready(function() {
		  $('#table_id').DataTable({
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
		  	  
} );

function showOutlets(){
	var merchantName=$('#merchantName').val();
		 $.ajax({
			   async: false,
			   url: 'getOutlets',
			   type: 'POST',
			   dataType: 'json',
			   data: 'merchantName='+merchantName,
			   success: function(data) {
				   debugger;
				   if(data!=null){
					   var key = $('#userKey').val();
					   var menu=$('#menuId').val();
					   var subMenu=$('#submenuId').val();
					var content = '';
					   for (var i = 0; i < data.length; i++) {
						   var encrypted = CryptoJS.AES.encrypt("outletId="+data[i].id+"&menuId="+menu+"&submenuId="+subMenu, key).toString();
							content+='<tr><td>'+data[i].name+'</td><td>'+data[i].address+'</td><td>'+data[i].city+'</td><td>'+data[i].merchantName+'</td><td>'+data[i].status+'</td>'
							+'<td><a href=${pageContext.request.contextPath}/AdminUI/merchantMgmnt/outletRegistrationEdit?j=1&enc='+encrypted+'><img title="edit" src="${pageContext.request.contextPath}/images/edit.gif" style="cursor: hand" align="center" /></a></td></tr>';
					  } 
					  if ( $.fn.DataTable.isDataTable( '#table_id' ) ) {
						   $("#table_id").dataTable().fnDestroy()
					  }
					  $('#table_id tbody').html(content); 
						 $('#table_id').DataTable( {
						        "scrollY":        "400px",
						        "scrollCollapse": true,
						        "paging":         true,
						        "pagingType": "simple_numbers",
						    } );
				   }else{
					   $('#table_id tbody').html("No Outlet Available"); 
				   }
			   },
			   error: function(e) {
				 }
			  });
	}

</script> 
</head>
<body>
<div>
<div id="myModal" class="modal">

  Modal content
  <div class="modal-content">
   <span class="close" ><font color='black'> &times;</font></span>
			                      <div  style="background-color:white">
			                      
			                       <div>
			                        &nbsp;
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

           
<div id="myModal" class="modal">

  Modal content
  <div class="modal-content">
   <span class="close" >X</span>
			                      <div  style="background-color:white">
			                      
			                       <div class="styled-input" >
			                        <div id="mapDiv" >
			                      <div  style="background-color:white">
			                       <div class="styled-input" style="background-color:white">
			                        	<input type="text" id="autocomplete"  placeholder="Enter here"  readonly="false" />
			                       </div>
			                      </div>					        
									<div  id="map" style="background-color:white">
									</div>	
								    <div id="infowindow-content" style="background-color:white">
								      <img src="" width="16" height="16" id="place-icon">
								      <span id="place-name"  class="title"></span><br>
								      <span id="place-address"></span>
								    </div>									
										
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
	
		<form:form 	id="appList" method="post" modelAttribute="merchantData"
			action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/outletRegistration"
			enctype="multipart/form-data">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Outlet Management</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
						 
	                    </div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="merchantNameDiv">
					<label id="merchntName" class="valid"><font color="red">*&nbsp;</font>Merchant Name</label>
					<form:select path="merchantName" id="merchantName"
						onclick="refresh('msgId');refresh('ermsgId');removeHasError('merchantNameDiv');" onchange="showOutlets()"
						onfocus="removeHasError('merchantNameDiv');">
						<form:option value="0" label=" " />
						<form:options items="${merchantData.merchants}" />
					</form:select>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
			<button type="button" class="btn btn-warning " onclick="refresh('successMessageId');toggleform('outlet');">Add Outlet</button>
		</div>
		</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="row collapse" id="outlet">
          		          		
          		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="dbaNameDiv">
					
					<form:input type="text" id="dbaName" path="name" onfocus="removeHasError('dbaNameDiv');" onkeypress="disableSomeSpecialCharacter(event,'lab_dbaErrorId');" onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_dbaErrorId','ddd');"/>
					<label id="ddd" class="valid"><font color="red">*&nbsp;</font>DBA Name</label> <label
						id="lab_dbaErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			
			<c:if test="${deployedFor == 'DEFAULT'}">	
		 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">		
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							
					  <form:input type="text" maxlength="6"
					path="pin" id="pin" onclick="refresh('msgId');refresh('ermsgId');clrpincode();showlabel('pincode','lab_pinCodeErrorId','pin')" onfocus="removeHasError('div_pinCode')"
					 onkeypress="onlyNumric(event,'lab_pinCodeErrorId','pincode'); " />
							<label id="pincode" class="valid"><font color="red">*&nbsp;</font>PinCode</label>
							<label id="lab_pinCodeErrorId" class="collapse"></label>
								
		 				</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">

						<input type="button"  class="btn btn-warning" id="addressFetchId" 
							value="Fetch Address" onclick="fetchAddress();" />&nbsp; &nbsp;<a href="#" onclick="show1();showMapDiv();"/>Show map</a></font>
				

					</div>
				</div>
			<div id="addressErrorId"></div>
			<div id='addressSelectDivIdPopup' style='display: none'>
			<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'></table>
			</div>
			</div>
			</c:if>		
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="addressSelectDivId" class="styled-input">
					<form:input type="text" path="address" id="address" maxlength="20" onfocus="removeHasError('addressSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');emptyerror('lab_addressErrorId');" />
					<label id="lab_addr" class="valid"><font color="red">*&nbsp;</font>Address</label>
					 <label id="lab_addressErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="Region" class="styled-input">
					<form:input type="text" onclick="refresh('msgId');refresh('ermsgId');"
					path="region"  readonly="true"/>
					<label id="ii" class="valid">Region</label>
					 <label id="lab_regionErrorId" class="collapse"></label><span></span>	
				</div>
			</div>
						
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="Locality" class="styled-input">
					<form:input type="text"
					path="locality"  readonly="true"/>
					<label id="imhh" class="valid">Locality</label>
					 <label id="lab_localityErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="cityDiv" class="styled-input">
					<form:input type="text" 
					path="city"   onclick="removeHasError('cityDiv')" />
					<label id="imhh" class="valid"><font color="red">*&nbsp;</font>City</label>
					 <label id="lab_CityErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="District" class="styled-input">
					<form:input type="text"
					path="district" readonly="true"/>
					<label id="iilm" class="valid">District</label>
					 <label id="lab_districtErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div  class="styled-input" id="State">
					<form:input type="text" 
					path="statess" readonly="true" onfocus="clrmsg('lab_StateErrorId','iiaa')"/>
					<label id="iiaa" class="valid">State</label>
					 <label id="lab_StateErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
					
			<c:choose>	
			<c:when test="${deployedFor == 'DEFAULT'}">			
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="countrydiv" class="styled-input">
					<form:input type="text" path="countrys" id="country" onclick="removeHasError('countrydiv')"
				 readonly="true" onfocus="clrmsg('lab_CountryErrorId','ciaa')"/>
					<label id="ciaa" class="valid"><font color="red">*&nbsp;</font>Country</label>
					 <label id="lab_CountryErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			</c:when>
		<c:otherwise>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="countrydiv" class="styled-input">
					<form:input type="text" path="countrys" id="country" onclick="removeHasError('countrydiv')"
				 	 onfocus="clrmsg('lab_CountryErrorId','ciaa')"/>
					<label id="ciaa" class="valid"><font color="red">*&nbsp;</font>Country</label>
					 <label id="lab_CountryErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
		</c:otherwise>
			</c:choose>	
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="emailDivId" class="styled-input">
					<form:input type="text" path="email" id="email" maxlength="50" onchange="validateEmail('email','lab_emailDivIdErrorId','hhh')"
					onfocus="removeHasError('emailDivId');" onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_emailDivIdErrorId','hhh');emptyerror('lab_emailDivIdErrorId');"/>
					<label id="hhh" class="valid"><font color="red">*&nbsp;</font>Email Id</label>
					 <label id="lab_emailDivIdErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="contactNumberDiv" class="styled-input">
					<form:input type="text" id="contactNumber"   
					path="contactNumber"  maxlength="${mobileLength}" 
					 onKeypress="clrmsg('mobileNumberErrorId','miaa');onlyNumric1(event,'mobileNumberErrorId','miaa');" onfocus="removeHasError('contactNumberDiv');" 
					  onclick="refresh('msgId');refresh('ermsgId');clrmsg('mobileNumberErrorId','miaa');emptyerror('mobileNumberErrorId');"/>
											
					<label id="miaa" class="valid"><font color="red">*&nbsp;</font>Mobile Number</label>
					 <label id="mobileNumberErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="statusDiv">
											<label id="username1"  class="valid"><font color="red">*&nbsp;</font>Status</label>
										<form:select path="status" id="status" onfocus="removeHasError('statusDiv');" onclick="refresh('msgId');refresh('ermsgId');emptyerror('lab_StatusErrorId');">
	  				<form:option value="0" label=" "/>
	  				<form:option value="ACTIVE" label="Active"/>
	  				<form:option value="INACTIVE" label="InActive"/>
	  				</form:select></div>
									</div>
									
					
 								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIdstopLat" class="styled-input">		
									         <form:input path="latitude" id="stopLat" onchange="selecttag('labelStopLat','stopLat');" 
									         onfocus="removeHasError('DivIdstopLat');showlabel('labelStopLat','stopLatErrorId')"  maxlength="10" size="15" value="${stop.stopLat}" readonly="true"   />
									     	<label id="labelStopLat" class="valid"><font color="red"><c:if test="${deployedFor == 'DEFAULT'}">	*&nbsp;</c:if></font>Merchant Latitude</label>
									     	<label id="stopLatErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									        <div id="DivIdstopLong" class="styled-input">		
									         <form:input path="longitude" id="stopLong" onchange="selecttag('labelStopLong','stopLong');" 
									         onfocus="removeHasError('DivIdstopLong');showlabel('labelStopLong','stopLongErrorId')"  maxlength="10" size="15" value="${stop.stopLong}" readonly="true"   />
									     	<label  id="labelStopLong" class="valid"><font color="red"><c:if test="${deployedFor == 'DEFAULT'}">	*&nbsp;</c:if></font>Merchant Longitude</label>
									     	<label id="stopLongErrorId" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>
																	
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left"> <h1><u>Account</u></h1><br></div>
			<c:choose>
			<c:when test="${deployedFor == 'DEFAULT'}">				
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="ifscCodeSelectDivId" class="styled-input">
					<form:input type="text" path="ifscCode" name="ifsc"  id="ifsc" maxlength="15" onfocus="removeHasError('ifscCodeSelectDivId');"
		                 onchange="validateIfsc(event);" 
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_ifscCodeErrorId','lab_ifsc');emptyerror('lab_ifscCodeErrorId');" />
					<label id="lab_ifsc" class="valid">IFSC</label>
					 <label id="lab_ifscCodeErrorId" class="collapse"></label><span id="ifscErrorId"></span>
						
				</div>
				<div id="bankNameDiv" class="styled-input collapse">
					<form:input id="bankName" type="text" path="bankName" readonly="true" />
					<label  class="valid">Bank Name</label>			
				</div>
				<div id="branchDiv" class="styled-input collapse">
					<form:input id="branch"  type="text" path="branch" readonly="true" />
					<label  class="valid">Branch</label>						
				</div>
				<div id="bankAddressDiv" class="styled-input collapse">
					<form:input id="bankAddress"  type="text" path="bankAddress" readonly="true" />
					<label  class="valid">Address</label>						
				</div>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="accountSelectDivId" class="styled-input">
					<form:input type="text" path="accountNumber" id="accountNumber" maxlength="20" onfocus="removeHasError('accountSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_accountErrorId','lab_accnt');emptyerror('lab_accountErrorId');" />
					<label id="lab_accnt" class="valid">Account Number</label>
					 <label id="lab_accountErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>  
		</c:when>
		<c:otherwise>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="ifscCodeSelectDivId" class="styled-input">
					<form:input data-rule-iban="true" type="text" path="ifscCode" name="ifsc"  id="ifsc" maxlength="32" onfocus="removeHasError('ifscCodeSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_ifscCodeErrorId','lab_ifsc');emptyerror('lab_ifscCodeErrorId');" />
					<label id="lab_ifsc" class="valid"><font color="red">*&nbsp;</font>IBAN</label>
					 <label id="lab_ifscCodeErrorId" class="collapse"></label><span id="ifscErrorId"></span>
						
				</div>
					
			</div>
		
		</c:otherwise>
			</c:choose>
			
			
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="submit">
					<input type='submit'class="btn btn-warning"  value="Submit" onclick="return validateOutlet(event,'${deployedFor}',null);">
					</div>
							<div class="clearfix"></div>     
		              </div>
		              </div>   
		              <br>
		             
		              			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left"> <h1><u>Outlet List</u></h1><br></div>     
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                              	   	<tr>
	                              	   		<th>Outlet Name</th>
											<th>Address</th>
											<th>City</th>
											<th>Merchant Name</th>
											<th><spring:message code="lab_status" /></th>
											<th><spring:message code="lab_edit" /></th>
	                              	   	</tr>
	                              	</thead>
	                            <c:forEach items="${merchantData.outletList}" var="merchData">
	                            <tr id="outlet${merchData.merchantId}">
								<td>${merchData.name}</td>
								<td>${merchData.address}</td>
								<td>${merchData.city}</td>
                                <td>${merchData.merchantName}</td>
								<td>${merchData.status}</td>                                      
                                        <%
												Integer id=	((MerchantData)(pageContext.findAttribute("merchData"))).getId();
												String encryptedData=KeyEncryptionUtils.encryptUsingKey(key, "outletId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
										%>
								<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/outletRegistrationEdit?enc=<%=encryptedData %>"><img
								title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor: hand' align="center" /></a></td>
	  						</tr>
	                            </c:forEach>
	                              </table>
	                             </div>
	                            </div>
	                           </div>
	           <input  type="hidden"    id="userKey" value="<%=key%>"  />                 	  
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	           <input type="hidden" id="pinaddressId" name="pinaddressId" value="" /> 
	                           </form:form>
</body>

</html>