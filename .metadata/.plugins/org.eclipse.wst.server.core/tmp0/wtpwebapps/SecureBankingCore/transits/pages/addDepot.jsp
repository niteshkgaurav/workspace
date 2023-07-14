<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<html>  
 <head>   
  <title>Depot Management</title>  
 </head> 

 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
 <script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addDepot.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		  $('#table_id').DataTable({
		        "scrollY":        "350px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
	  	  
} );
</script>
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
<!-- <script type="text/javascript">
$(window).load(function(){
	$(document).ready(function() {
	    
	    $("#depotForm").validate({
	    	
	        rules: {
	            "depotName": {
	                required: true,
	                minlength: 5,
	                maxlength: 45
	            },
	            "depotAddress": {
	                required: true,
	                minlength: 5,
	                maxlength: 250
	            }	            
	        },
	        messages: {
	            "depotName": {
	                required: "Depot name is required!",
	                minlength: "Depot name must be at least 5 characters long"
	            },
	            "depotAddress": {
	                required: "Depot address is required!",
	                minlength: "Depot address must be at least 5 characters long"
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
</script>
 -->
 <body>
  <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Bus Depot</h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">
					        	<form:form method="POST" id="depotForm" name="depotForm" action="${pageContext.request.contextPath}/AdminUI/depot/saveDepot">
					        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div id="DivIdDepotName" class="styled-input">
						                  <form:input path="depotName"   maxlength="45" class="selecttag valid" onchange="selecttag('lbldepotNameId','depotName');" 
										 	onfocus="removeHasError('DivIdDepotName');showlabel('depotName','depotNameErrorId');" value="${depot.depotName}" readonly="false"   />
										 <label id="lbldepotNameId" class="valid">*Deport Name</label>
										 <label id="depotNameErrorId" class="collapse"></label>
						                  <span></span> 
						                </div>
					              </div>
					              
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="DivIdDepotAddress">
						                  <form:input path="depotAddress"  maxlength="50" class="selecttag" onchange="selecttag('lbldeporAddressId','depotAddress');"
						                  onfocus="removeHasError('DivIdDepotAddress');showlabel('depotAddress','depotAddressErrorId');" value="${depot.depotAddress}" readonly="false"   />
										 <label id="lbldepotAddressId" class="valid">*Depot Address</label>
										 <label id="depotAddressErrorId" class="collapse"></label>
						                  <span></span> 
						                </div>
					              </div>
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								       <div id="DivIdAreaId" class="styled-input">					                
											<form:select  id="areaId" path="depotCity" title="Area" class="selecttag" onchange="selecttag('labelDepotAreaId','areaId');"
											onfocus="removeHasError('DivIdAreaId');" onclick="this.setAttribute('value', this.value);" value="">
					         									
												<c:if test="${!empty depot.depotCity}"> 
												<form:option selected="${cityList[depot.depotCity]}"  value="${depot.depotCity}">${cityList[depot.depotCity]}
												</form:option>
												</c:if>  
												<form:option value=""></form:option>      		            
												<form:options items="${cityList}"  />
											</form:select>
											<label id="labelDepotAreaId" class="valid">Select City</label>
											<label id="DepotAreaErrorId" class="collapse"></label>
										</div>
							      </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="DivIdDepotPinCode">
						                  <form:input path="depotPincode"  maxlength="6" class="selecttag valid" onkeypress="onlyNumric(event,'qwerty')" onchange="selecttag('lbldepotPinCodeId','depotPincode');" 
						                  onfocus="removeHasError('DivIdDepotPinCode');showLabel('depotPincode','depotPinCodeErrorId');" value="${depot.depotPincode}" readonly="false"   />
										 <label id="lbldepotPinCodeId" class="valid">Pin Code</label>
										 <label id="depotPinCodeErrorId" class="collapse"></label>
						                  <span></span> 
						                  
						                </div>
					              </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="DivIdDepotBusCapacity">
						                  <form:input path="depotBusCapacity"  maxlength="3" class="selecttag"  onkeypress="onlyNumric(event,'qwerty')" onchange="selecttag('lblDepotBusCapacityId','depotBusCapacity');"
						                   onfocus="removeHasError('DivIdDepotBusCapacity');showlabel('depotBusCapacity','depotBusCapacityErrorId');" value="${depot.depotBusCapacity}" readonly="false"   />
						                 <label id="lbldepotBusCapacityId" class="valid">Depot Bus Capacity</label>
										 <label id="depotBusCapacityErrorId" class="collapse"></label>
						                  <span></span> 
						                </div>
					              </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <form:hidden path="depotId" value="${depot.depotId}" readonly="false"   />
						                  <span></span> 
						                </div>
					              </div>					              					              							      					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning" onclick="return validateForm(event);">Submit</button>
			                      </div>
			                      
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	
	       </div>		                      					              					              
					        	</form:form>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
						          <hr>
						        </div>
								
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="map" hidden="true">

								</div> 
								
						        <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>	 -->				        	
					        		 <c:if test="${!empty depots}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped" id="table_id">
														<thead>
															<tr>
															<!-- <th>Id</th> -->
															 <th>Depot Name</th>
															 <th>Address</th>
															 <th>Depot Area</th>														           
															 <th>Actions</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${depots}" var="depot">
																 <tr>
																  <td><c:out value="${depot.depotName}"/></td>
																  <td><c:out value="${depot.depotAddress}"/></td>
																   <td><c:out value="${depot.depotCity}"/></td>															   
																  <td align="center"><a href="editDepot?depotId=${depot.depotId}">Edit</a> <%-- <a href="deleteDepot.html?depotId=${depot.depotId}">Delete</a> --%></td>
																 </tr>
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