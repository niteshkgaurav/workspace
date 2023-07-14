<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>

<html>

<head>	
    <title>Line Management</title>

</head>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.12.3.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery.validate.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery.validate.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/additional-methods.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/route.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script> 

 <script type="text/javascript">
	 $(window).load(function(){
	 	$(document).ready(function(){
	 		$(uploadRoute).validate({
	 			rules:{
	 				"xlsFile":{
	 					required:true
	 				}
	 				
	 			},
	 			message:{
	 				"xlsFile":{
	 				 	required:"Please select a file to proceed"
	 				}
	 			},
				submitHandler: function (form) {
		             form.submit(); 
		        } 			
	 		});
	 	});
	});	
 </script>
 <script type="text/javascript">
	 function showMap(){ 
		 window.open("routemap","Route Map","height=400,width=400");
		 }
	 function routeDetails(){ 
		 window.open("routedetail","Route details");
		 } 	 
 </script> 
 
<script>
$(document).ready(function(){
	$('#table_id').DataTable({
		"scrollY":"400px",
		"scrollX":"250px",
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
	<div id="mainbody" class="container-fluid">
	
		<!-- <div class="row"> --> 
		
                
                <!--Right Container Start-->      
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<section class="white">
						        <div class="heading-inner">
						          <h1>Add Line</h1>
						          <div class="clearfix"></div>
						          <hr>
						        </div>
						    <div class="row"> 
						    <div id="message">${msg}
						    </div>
						    
							<form:form  method="post" id="lineForm" name="lineForm" modelAttribute="lines" action="${pageContext.request.contextPath}/AdminUI/metroController/createLine"  >
							
				              		
				              		
				              
				               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_routeNumber" class="styled-input">
				                  <form:input path="lineName"  class="selecttag valid"  onclick="hideMessage()" onchange="selecttag('labelRNumberId','routeNumber');"
				                   onfocus="removeHasError('div_routeNumber')" readonly="false"/>
				                    <label id="labelRNumberId" class="valid">* Line Name</label>
				                    <label id="labelRNumberErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_routeDescription" class="styled-input">
				                  <form:input path="lineDescription"  maxlength="600" class="selecttag valid" onclick="hideMessage()" onchange="selecttag('routeDescriptionId','routeDescription');"
				                   onfocus="removeHasError('div_routeDescription')" readonly="false"/>
				                    <label id="routeDescriptionId" class="valid">*Line Description</label>
				                    <label id="routeDescriptionErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				           
						      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
							<div class="styled-input" id="div_id_depot">
								<form:select  path="srcStation" id="lineId">
									<form:option value="00" label="All" />
									<form:options items="${allStops}" />
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp; Source Station</label> <label
									id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
							<div class="styled-input" id="div_id_depot">
								<form:select  path="destStation" id="lineId">
									<form:option value="00" label="All" />
									<form:options items="${allStops}" />
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Destination Station</label> <label
									id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>
						     
						      
								
								
					
				
				
				
				
				
						      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_noOfStops" class="styled-input">
				                  <form:input path="noOfStation"  id="noOfStops" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid"  onchange="selecttag('noOfStopsId','noOfStops');"
				                   onfocus="removeHasError('div_noOfStops')" readonly="false"/>
				                    <label id="noOfStopsId" class="valid">* Number Of Station</label>
				                    <label id="noOfStopsErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              
						      						       
				      
				          
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_busFrequency" class="styled-input">
				                  <form:input path="trainFrequency"  id="trainFrequency" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid"   onchange="selecttag('busFreqId','busFrequency');"
				                   onfocus="removeHasError('div_busFrequency')" readonly="false"/>
				                    <label id="busFreqId" class="valid">*Train Frequency (in Mins)</label>
				                    <label id="busFreqErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				           
				              
				              
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_runningTime" class="styled-input">
				                  <form:input path="runningTime"  id="runningTime" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid"   onchange="selecttag('runningTimeId','runningTime');"
				                   onfocus="removeHasError('div_runningTime')" readonly="false"/>
				                    <label id="runningTimeId" class="valid">* Running Time (in Mins)</label>
				                    <label id="runningTimeErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				            
				              
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_distanceCovered" class="styled-input">
				                  <form:input path="distanceCovered"  id="distanceCovered" onkeypress="onlyNumric(event,'qwerty')" maxlength="4" class="selecttag valid"  onchange="selecttag('distCoveredId','distanceCovered');"
				                   onfocus="removeHasError('div_distanceCovered')" readonly="false"/>
				                    <label id="distCoveredId" class="valid">*Distance Covered (in KMs)</label>
				                    <label id="distCoveredErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              
				              
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                        <button type="submit" class="btn btn-warning"  onclick="return validateForm(event);">Submit</button>
	                      </div>
	                     
	                      						                                                                                                            
						</form:form>
						       
           		
						
						<c:if test="${!empty allLines}">

							<div class="col-xs-12">
								<div class="transaction-table">
									<div class="table-responsive">
										<table class="table table-bordered table-striped" id="table_id">
										<thead>
											<tr>
											
											 <th>Line Name</th>
											 <th>Line Description</th> 
										     <th>No Of Stops</th>									  
											 <th>Train Frequency</th>				 
											 <th>Running Time</th>
											 <th>Distance Covered</th>
											 <th>Add Station</th>
										
											</tr>
		                                </thead>
		                              <tbody>										
										<c:forEach items="${allLines}" var="line">
											 <tr>
										
											  <td><c:out value="${line.lineName}"/></td>
											  <td><c:out value="${line.lineDescription}"/></td>
											  <td><c:out value="${line.noOfStation}"/></td>
											 
											  <td><c:out value="${line.trainFrequency}"/></td>
											  <td><c:out value="${line.runningTime}"/></td>
											  <td><c:out value="${line.distanceCovered}"/></td>
											  <td align="center"><button onclick="location.href='../metroController/lineStation?lineId=${line.lineId}'" value="Line Detail">Line Detail</button> </td> 				   				   
											<%--   <td align="center"><a href="editRoute?routeId=${route.routeId}">Edit</a> </td> --%>
											<!--   <td align="center"><button onclick="showMap();">Show Map</button> </td> -->
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
		<!-- </div>  -->
	</div>

</body>
</html>