<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>

<html>

<head>	
    <title>Route Management</title>

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
<body>
	<div id="mainbody" class="container-fluid">
	
		<!-- <div class="row"> --> 
		
                
                <!--Right Container Start-->      
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<section class="white">
						        <div class="heading-inner">
						          <h1>Add Route</h1>
						          <div class="clearfix"></div>
						          <hr>
						        </div>
						    <div class="row"> 
							<form:form  method="post" id="routeForm" name="routeForm" action="${pageContext.request.contextPath}/AdminUI/route/saveRoute"  >
							
				              		
				              		<%-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div id="DivIdDepotName" class="styled-input">
						                  <form:input path="depotName"   maxlength="45" class="selecttag valid" onchange="selecttag('lbldepotNameId','depotName');" 
										 	onfocus="removeHasError('DivIdDepotName');showlabel('depotName','depotNameErrorId');" value="${depot.depotName}" readonly="false"   />
										 <label id="lbldepotNameId" class="valid">*Deport Name</label>
										 <label id="depotNameErrorId" class="collapse"></label>
						                  <span></span> 
						                </div>
					              </div> --%>
				              						
				              <%-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_routeNumber">
				                  <form:input path="routeNumber" type="text"  maxlength="45" value="${route.routeNumber}" />
				                  <label>* Route Number</label>
				                  <span></span> 
				                </div>
				              </div> --%>
				              
				               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_routeNumber" class="styled-input">
				                  <form:input path="routeNumber"  maxlength="11" class="selecttag valid"  value="${route.routeNumber}"  onchange="selecttag('labelRNumberId','routeNumber');"
				                   onfocus="removeHasError('div_routeNumber')" readonly="false"/>
				                    <label id="labelRNumberId" class="valid">* Route Number</label>
				                    <label id="labelRNumberErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_routeDescription" class="styled-input">
				                  <form:input path="routeDescription"  maxlength="600" class="selecttag valid" value="${route.routeDescription}"  onchange="selecttag('routeDescriptionId','routeDescription');"
				                   onfocus="removeHasError('div_routeDescription')" readonly="false"/>
				                    <label id="routeDescriptionId" class="valid">* Description</label>
				                    <label id="routeDescriptionErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				             <%--  
				              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_routeDescription">
				                  <form:input path="routeDescription" type="text" maxlength="500"  value="${route.routeDescription}" />
				                  <form:label path="routeDescription">* Description </form:label>
				                  <span></span> 
				                </div>
				              </div>   --%>
				              
						       <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="div_routeType">						                
								<form:select class="form-control" id="routeType" path="routeType" title="Route Type">
									<c:if test="${!empty route.routeType}"> 
									<form:option selected="${route.routeType}"  value="${route.routeType}">${route.routeType}
									</form:option>
									</c:if>  
									<form:option value="">Route Type</form:option>      		            
									<form:options items="${routeTypeList}"  />
								</form:select>
						      </div> --%>
						      
						       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								       <div id="div_routeType" class="styled-input">					                
											<form:select  id="routeType" path="routeType" title="Route Type" class="selecttag" onchange="selecttag('labelRouteId','routeType');"
											onfocus="removeHasError('div_routeType');" onclick="this.setAttribute('value', this.value);" value="">
					         									
												<c:if test="${!empty route.routeType}"> 
												<form:option selected="${route.routeType}"  value="${route.routeType}">${route.routeType}
												</form:option>
												</c:if>  
												<form:option value=""></form:option>      		            
												<form:options items="${routeTypeList}"  />
											</form:select>
											<label id="labelRouteId" class="valid">Route Type</label>
											<label id="RouteErrorId" class="collapse"></label>
										</div>
							      </div>
						      <%-- 
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">						                
									<form:select class="form-control" id="srcStation" path="srcStation" title="Source Station" >
										<c:if test="${!empty route.srcStation}"> 
										<form:option selected="${route.srcStation}"  value="${route.srcStation}">
										</form:option>
										</c:if>  
										<form:option value="">Source Station</form:option>      		            
										<form:options items="${srcDestinationList}"  />
									</form:select>
								</div> --%>
								
								 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								       <div id="div_srcStationType" class="styled-input">					                
											<form:select  id="srcStation" path="srcStation" title="Source Station" class="selecttag" onchange="selecttag('labelSrcStationId','srcStation');"
											onfocus="removeHasError('div_srcStationType');" onclick="this.setAttribute('value', this.value);" value="">
					         									
												<c:if test="${!empty route.srcStation}"> 
												<form:option selected="${route.srcStation}"  value="${route.srcStation}">
												</form:option>
												</c:if>  
												<form:option value=""></form:option>      		            
												<form:options items="${srcDestinationList}"  />
											</form:select>
											<label id="labelSrcStationId" class="valid">Source Station</label>
											<label id="SrcStationErrorId" class="collapse"></label>
										</div>
							      </div>
							      
						       <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="div_destStation">						                
								<form:select class="form-control" id="destStation" path="destStation" title="Destination Station">
									<c:if test="${!empty route.destStation}"> 
									<form:option selected="${route.destStation}"  value="${route.destStation}">
									</form:option>
									</c:if>  
									<form:option value="">Destination Station</form:option>      		            
									<form:options items="${srcDestinationList}"  />
								</form:select>
						      </div> --%>
						      
						       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								       <div id="div_destStation" class="styled-input">					                
											<form:select  id="destStation" path="destStation" title="Destination Station" class="selecttag" onchange="selecttag('labelDestStationId','destStation');"
											onfocus="removeHasError('div_destStation');" onclick="this.setAttribute('value', this.value);" value="">
					         									
												<c:if test="${!empty route.destStation}"> 
												<form:option selected="${route.destStation}"  value="${route.destStation}">
												</form:option>
												</c:if>  
												<form:option value=""></form:option>      		            
												<form:options items="${srcDestinationList}"  />
											</form:select>
											<label id="labelDestStationId" class="valid">Destination Station</label>
											<label id="DestStationErrorId" class="collapse"></label>
										</div>
							      </div>
						      
					     <%--  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="DivIdDepotAssignedId" class="styled-input">					                
							<form:select id="depotAssigned" path="depotAssigned" title="depotAssigned" class="selecttag" onchange="selecttag('labeldepotAssigned','depotAssigned');" 
							 onfocus="removeHasError('DivIdDepotAssignedId');" onclick="this.setAttribute('value', this.value);" value="">
				              <c:if test="${!empty route.depotAssigned}"> 
								<form:option selected="${route.depotAssigned}"  value="${route.depotAssigned}">${depotAssignedList[route.depotAssigned]}
								</form:option>
								</c:if>  
							 <form:option value="" label=" " ></form:option>    	            
								<form:options items="${depotAssignedList}"  />
				 --%>
				 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								       <div id="DivIdDepotAssignedId" class="styled-input">					                
											<form:select  id="depotAssigned" path="depotAssigned" title="depotAssigned" class="selecttag" onchange="selecttag('labelDepotId','depotAssigned');"
											onfocus="removeHasError('DivIdDepotAssignedId');" onclick="this.setAttribute('value', this.value);" value="">
					         									
												<c:if test="${!empty route.depotAssigned}"> 
												<%-- <form:option selected="${route.destStation}"  value="${route.destStation}">
												</form:option>
												 --%>
												 </c:if>  
												<form:option value="" label=" "></form:option>      		            
												<form:options items="${depotAssignedList}"  />
											</form:select>
											<label id="labelDepotId" class="valid">Depot Id</label>
											<label id="DepotErrorId" class="collapse"></label>
										</div>
							      </div>
				
				
				
				
							<%-- </form:select>
						<label id="labeldepotAssigned" >Depot Id</label>
					<!--  <label id="depotAssignedErrorId" class="collapse"></label>  -->
						<span></span>
				      </div>
				</div>			 --%>
			
						     
						      
						      
						    <%--   
						      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_noOfStops">
				                  <form:input path="noOfStops" type="text" maxlength="3" value="${route.noOfStops}" />
				                  <label>* Number Of Stops </label>
				                  <span></span> 
				                </div>
				              </div>
				               --%>
				               
						      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_noOfStops" class="styled-input">
				                  <form:input path="noOfStops"  id="noOfStops" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid" value="${route.noOfStops}"  onchange="selecttag('noOfStopsId','noOfStops');"
				                   onfocus="removeHasError('div_noOfStops')" readonly="false"/>
				                    <label id="noOfStopsId" class="valid">* Number Of Stops</label>
				                    <label id="noOfStopsErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              
						      						       
				             <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_noOfBuses">
				                  <form:input path="noOfBuses" type="text" maxlength="3" value="${route.noOfBuses}" />
				                  <label>* Number Of Buses </label>
				                  <span></span> 
				                </div>
				              </div> --%>
				              
				               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_noOfBuses" class="styled-input">
				                  <form:input path="noOfBuses"  id="noOfBuses" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid" value="${route.noOfBuses}"  onchange="selecttag('noOfBusesId','noOfBuses');"
				                   onfocus="removeHasError('div_noOfBuses')" readonly="false"/>
				                    <label id="noOfBusesId" class="valid">* Number Of Buses</label>
				                    <label id="noOfBusesErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				             <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_busFrequency">
				                  <form:input path="busFrequency" type="text" maxlength="3" value="${route.busFrequency}" />
				                  <label>* Bus Frequency (in Mins)</label>
				                  <span></span> 
				                </div>
				              </div>
				               --%>
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_busFrequency" class="styled-input">
				                  <form:input path="busFrequency"  id="busFrequency" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid" value="${route.busFrequency}"  onchange="selecttag('busFreqId','busFrequency');"
				                   onfocus="removeHasError('div_busFrequency')" readonly="false"/>
				                    <label id="busFreqId" class="valid">*Bus Frequency (in Mins)</label>
				                    <label id="busFreqErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				             <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_runningTime">
				                  <form:input path="runningTime" type="text" maxlength="5" value="${route.runningTime}" />
				                  <label>* Running Time (in Mins)</label>
				                  <span></span> 
				                </div>
				              </div> --%>
				              
				              
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_runningTime" class="styled-input">
				                  <form:input path="runningTime"  id="runningTime" maxlength="3" onkeypress="onlyNumric(event,'qwerty')" class="selecttag valid" value="${route.busFrequency}"  onchange="selecttag('runningTimeId','runningTime');"
				                   onfocus="removeHasError('div_runningTime')" readonly="false"/>
				                    <label id="runningTimeId" class="valid">* Running Time (in Mins)</label>
				                    <label id="runningTimeErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_distanceCovered">
				                  <form:input path="distanceCovered" type="text" maxlength="4" value="${route.distanceCovered}" />
				                  <label>* Distance Covered (in KMs) </label>
				                  <span></span> 
				                </div>
				              </div> --%>
				              
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
				                <div id="div_distanceCovered" class="styled-input">
				                  <form:input path="distanceCovered"  id="distanceCovered" onkeypress="onlyNumric(event,'qwerty')" maxlength="4" class="selecttag valid" value="${route.distanceCovered}"  onchange="selecttag('distCoveredId','distanceCovered');"
				                   onfocus="removeHasError('div_distanceCovered')" readonly="false"/>
				                    <label id="distCoveredId" class="valid">*Distance Covered (in KMs)</label>
				                    <label id="distCoveredErrorId" class="collapse"></label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              
				              
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                        <button type="submit" class="btn btn-warning"  onclick="return validateForm(event);">Submit</button>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	       <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning">
	       </div>		          
	                      						                                                                                                            
						</form:form>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
<!-- //==================== -->

<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
	                    		<div class="styled-input" id="divID_uploadFilePath">
								<p class="valid" style="color:#006400">Select a file to upload routes</p>
           						<label id="xlsErrorId" class="collapse"></label>
                       			</div>
                       		</div>		
           						
	                    			<div  class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
			                     	 <div id="divID_xls" class="styled-input">
			                      		<form method="post" name="uploadRoutes" action="uploadRoutes" enctype="multipart/form-data">
			                      	
			                              <input type="file" id="xlsFileId" name="xlsFile" onclick="showlabel('label_xls','xlsErrorId');removeHasError('divID_xls')"/>
			                	  		  
			<input type="submit"  onclick="return checkExtention(event);" class="btn btn-warning" style="width: 65px" name="Submit" value="Submit"/>
							
										</form>
                       		</div>
                       	</div>

<!-- //============================== -->
							<%-- 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb"> Upload Route Data to Server </div>
								
								<form method="post" name="uploadRoute" action="upload.html" enctype="multipart/form-data">
								           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<div class="styled-input">								
													<label>Select a file to upload routes</label>
													<input type="file" name="xlsFile"/>
													<form:errors path="xlsFile" generated="true" cssClass="error"/>
												</div>
								          </div>
								                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">						            
								           <input type="submit" class="btn btn-warning" name="Submit" value="Submit"/>
								     </div>      
								</form> --%>
								 
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
						
						<c:if test="${!empty routes}">

							<div class="col-xs-12">
								<div class="transaction-table">
									<div class="table-responsive">
										<table class="table table-bordered table-striped" id="table_id">
										<thead>
											<tr>
											<!-- <th>Id</th> -->
											 <th>Route Number</th>
											 <th>Route Description</th> 
										      <th>DepotId</th> 
											  <th>No Of Stops</th>									   
											 <th>No Of Buses</th>
											 <th>Frequency</th>				 
											 <th>Running Time</th>
											 <th>Distance Covered</th>
											 <th></th>
											 <th></th>
											 <th></th>
											</tr>
		                                </thead>
		                              <tbody>										
										<c:forEach items="${routes}" var="route">
											 <tr>
											 <!-- <td><c:out value="${station.stationId}"/></td> -->
											  <td><c:out value="${route.routeNumber}"/></td>
											  <td><c:out value="${route.routeDescription}"/></td>
											  <td><c:out value="${route.depotAssigned}"/></td>
											  <td><c:out value="${route.noOfStops}"/></td>
											  <td><c:out value="${route.noOfBuses}"/></td>
											  <td><c:out value="${route.busFrequency}"/></td>
											  <td><c:out value="${route.runningTime}"/></td>
											  <td><c:out value="${route.distanceCovered}"/></td>
											  <td align="center"><button onclick="location.href='../routeStop/routedetail.html?routeId=${route.routeId}'" value="Route Detail">Route Detail</button> </td> 				   				   
											  <td align="center"><a href="editRoute?routeId=${route.routeId}">Edit</a> </td>
											  <td align="center"><button onclick="showMap();">Show Map</button> </td>
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