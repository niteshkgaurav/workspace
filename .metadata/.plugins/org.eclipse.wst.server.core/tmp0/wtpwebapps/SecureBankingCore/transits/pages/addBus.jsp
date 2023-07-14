
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addBus.js"></script>
 
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	

<title>Transit System</title>
<script>
$(function () {
	
	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
            useCurrent: false,

      });
		
	});
</script>

<script type="text/javascript">
function deleteRecord(id){
    var doIt=confirm('Do you want to delete the record?');
  if(doIt){
	  $.ajax({
	        type: "GET",
	        url: "deleteBus.html",
	    	data :"busId="+id,
	        success: function (response) {
			  	//alert("submitted form");
			  	window.location.href="addBus";
	        },
	        error: function (result) {
	        	alert("Submitted form failed");
	        }
	    });  
    }
  else{

    }
}

function deleteBus(id) {
    if (confirm("Do you really want to delete selected bus?"))
        window.location.href = "deleteBus?busId="+id;
    else
        return false;
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



 </head>  
 <body>
	 <div id="mainbody" class="container-fluid" >
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<section class="white">
	       <div class="heading-inner">
	         <h1>Add Bus Data</h1>
	         <div class="clearfix"></div>
	         <hr>
	       </div>	  
       <div class="row">	
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
            <p id="statusmsgId"><font color="red">${msgSuccessFailure}</font></p>
          </div>       	
			  <form:form method="POST" action="${pageContext.request.contextPath}/AdminUI/bus/saveBus" modelAttribute="command">
		
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
						<div  class="styled-input" >
							<form:hidden path="busId"  value="${bus.busId}" readonly="false"   />
							 <span></span> 
						</div>	      	
			      </div>
		
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="busNumber" path="busNumber"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')" value="${bus.busNumber}" readonly="false"   />
						 <label id="busNumberId" class="valid">*Bus Number</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
		
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
				       	<div id="DivIdbusTypeId" class="styled-input">					                
							<form:select id="busType" path="busType" title="busType" class="selecttag" onchange="selecttag('labelbusTypeId','busType');" 
						         onfocus="removeHasError('DivIdbusTypeId');" onclick="this.setAttribute('value', this.value);" value="">
						          
								<c:if test="${!empty bus.busType}"> 
								<form:option selected="${bus.busType}"  value="${bus.busType}">${busTypeList[bus.busType]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${busTypeList}"  />
							</form:select>
						<label id="labelbusTypeId" class="valid">Select Bus Type</label>
						<label id="busTypeErrorId" class="collapse"></label>
						<span></span>
				      </div>
			      </div>
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDseatingCapacity" class="styled-input">
						<form:input id="seatingCapacity" path="seatingCapacity" maxlength="3"   class="selecttag" onchange="selecttag('seatingCapacityId','seatingCapacity');" 
						 	onfocus="removeHasError('DivIDseatingCapacity');showlabel('seatingCapacity','seatingCapacityErrorId')" onkeypress="onlyNumric(event,'qwerty')" size="3" value="${bus.seatingCapacity}" readonly="false"  />
						 <label id="seatingCapacityId" class="valid">*Seating Capacity</label>
						 <label id="seatingCapacityIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDstandingCapacity" class="styled-input">
						<form:input id="standingCapacity" path="standingCapacity" maxlength="3"  class="selecttag" onchange="selecttag('standingCapacityId','standingCapacity');" 
						 	onfocus="removeHasError('DivIDstandingCapacity');showlabel('standingCapacity','standingCapacityErrorId')" onkeypress="onlyNumric(event,'qwerty')" size="5" value="${bus.standingCapacity}" readonly="false"   />
						 <label id="standingCapacityId" class="valid">*Standing Capacity</label>
						 <label id="standingCapacityIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDloadCapacity" class="styled-input">
						<form:input id="loadCapacity" path="loadCapacity" maxlength="5" type="number"  class="selecttag"  onkeypress="onlyNumric(event,'qwerty	')" onchange="selecttag('loadCapacityId','loadCapacity');" 
						 	onfocus="removeHasError('DivIDloadCapacity');showlabel('loadCapacity','loadCapacityErrorId')"  size="5" value="${bus.loadCapacity}" readonly="false"   />
						 <label id="loadCapacityId" class="valid">*Loading Capacity</label>
						 <label id="loadCapacityErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>	      
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		                    <div id="DivManufacturedDate" class="styled-input">
		                       <div class="input-group date datetimepicker1">
		                         <form:input id="manufacturedDate" path="manufacturedDate"  
		                         type="text"  class="selecttag" value="${bus.manufacturedDate}"
		             				 onfocus="removeHasError('DivManufacturedDate');selecttag('labelManufacturedDate','manufacturedDate')"
		             				onclick="emptyerror(event,'manufacturedDateError');showlabel('labelManufacturedDate','manufacturedDateError');selecttag('labelManufacturedDate','manufacturedDate')" />
		                        	<label id="labelManufacturedDate" class="valid">Manufacturing Date:</label>
		                         	<label id="manufacturedDateError" class="collapse"></label>
		                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelManufacturedDate');"></i> </i>
		                       </div>
		                     </div> 
		                     
		           </div>
		           
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
				       	<div id="DivIdmanufacturedById" class="styled-input">					                
							<form:select id="manufacturedBy" path="manufacturedBy" title="manufacturedBy" class="selecttag" onchange="selecttag('labelmanufacturedById','manufacturedBy');" 
						         onfocus="removeHasError('DivIdmanufacturedById');" onclick="this.setAttribute('value', this.value);" value="">
						          
								<c:if test="${!empty bus.manufacturedBy}"> 
								<form:option selected="${bus.manufacturedBy}"  value="${manufacturedByList[bus.manufacturedBy]}">${manufacturedByList[bus.manufacturedBy]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${manufacturedByList}"  />
							</form:select>
						<label id="labelmanufacturedById" class="valid">Manufactured By</label>
						<label id="manufacturedByErrorId" class="collapse"></label>
						<span></span>
				      </div>
			      </div>
		 
				 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="DivIdfuelTypeId" class="styled-input">					                
							<form:select id="fuelType" path="fuelType" title="fuelType" class="selecttag" onchange="selecttag('labelfuelTypeId','fuelType');" 
							 onfocus="removeHasError('DivIdfuelTypeId');" onclick="this.setAttribute('value', this.value);" value="">
				
								<c:if test="${!empty bus.fuelType}"> 
								<form:option selected="${bus.fuelType}"  value="${bus.fuelType}">${fuelTypeList[bus.fuelType]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${fuelTypeList}"  />
				
							</form:select>
						<label id="labelfuelTypeId" class="valid">Select Fuel Type</label>
						<label id="fuelTypeErrorId" class="collapse"></label>
						<span></span>
				      </div>
				</div>
				<!-- 		
		       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">						                
				<form:select class="form-control" id="depotAssignedId" path="depotAssigned" title="Depot Name">
					<c:if test="${!empty bus.depotAssigned}"> 
					<form:option selected="${bus.depotAssigned}"  value="${bus.depotAssigned}">${depotAssignedList[bus.depotAssigned]}
					</form:option>
					</c:if>  
					<form:option value="">Depot Assigned</form:option>      		            
					<form:options items="${depotAssignedList}"  />
				</form:select>
		      </div>		
				 -->
				 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="DivIdDepotAssignedId" class="styled-input">					                
							<form:select id="depotAssigned" path="depotAssigned" title="depotAssigned" class="selecttag" onchange="selecttag('labeldepotAssigned','depotAssigned');" 
							 onfocus="removeHasError('DivIdDepotAssignedId');" onclick="this.setAttribute('value', this.value);" value="">
				
								<c:if test="${!empty bus.depotAssigned}"> 
								<form:option selected="${bus.depotAssigned}"  value="${bus.depotAssigned}">${depotAssignedList[bus.depotAssigned]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${depotAssignedList}"  />
				
							</form:select>
						<label id="labeldepotAssigned" class="valid">Depot Assigned</label>
						<label id="depotAssignedErrorId" class="collapse"></label>
						<span></span>
				      </div>
				</div>			
			
				
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="DivIdbusStatusId" class="styled-input">					                
							<form:select id="busStatus" path="busStatus" title="busStatus" class="selecttag" onchange="selecttag('labelbusStatusId','busStatus');" 
							 onfocus="removeHasError('DivIdbusStatusId');" onclick="this.setAttribute('value', this.value);" value="">
				
								<c:if test="${!empty bus.busStatus}"> 
								<form:option selected="${bus.busStatus}"  value="${bus.busStatus}">${busStatusList[bus.busStatus]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${busStatusList}"  />
							</form:select>
						<label id="labelbusStatusId" class="valid">Select Bus Status</label>
						<label id="busStatusErrorId" class="collapse"></label>
						<span></span>
				      </div>
				</div>
		    
		          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		            <button type="submit" onclick="return validate(event);" class="btn btn-warning">Submit</button>
		          </div>
		          	      	
		          	      	
		          	      	 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	         <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning">
	       </div>      	             	      	      	      	      	      
			  </form:form>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
	         <hr>
	       </div>
	       
	       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
	                    		<div class="styled-input" id="divID_uploadFilePath">
								<p class="valid" style="color:#006400">Select a file to upload buses</p>
           						<label id="xlsErrorId" class="collapse"></label>
                       			</div>
                       		</div>
	       
	       <div  class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
			                     	 <div id="divID_xls" class="styled-input">
			                      		<form method="post" name="uploadStops" action="uploadBuses" enctype="multipart/form-data">
			                              <input type="file" id="xlsFileId" name="xlsFile" onclick="showlabel('label_xls','xlsErrorId');removeHasError('divID_xls')"/>
			                              <input type="submit" onclick="return checkExtention(event);" class="btn btn-warning" style="width:65px" name="Submit" value="Submit"/>		  		  
										</form>
                       		</div>
                       	</div>
	       
	        					
	      
		   		 <c:if test="${!empty buses}">
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
					
								<table class="table table-bordered table-striped" id="table_id">
									<thead>
										<tr>
										<!-- <th>Id</th> -->
										 <th>Bus ID</th>
										 <th>Bus Number</th>
										 <th>Bus Type</th>
										 <th>Seating Capacity</th>
										 <th>Standing Capacity</th>
										 <th>Load Capacity</th>
										 <th>Manufactured Date</th>
										 <th>Manufactured By</th>
										 <th>Depot Assigned</th>
										 <th>Fuel Type</th>
										 <th>Bus Status</th>								 									 															           
										 <th>Actions</th>
										</tr>
									</thead>
									<tbody>
							 			<c:forEach items="${buses}" var="bus">
							 			 <c:if test="${bus.busStatus>0}"> 
										   <tr>
											    <td><c:out value="${bus.busId}"/></td>
											    <td><c:out value="${bus.busNumber}"/></td>
											    <td><c:out value="${bus.busType}"/></td>
											    <td><c:out value="${bus.seatingCapacity}"/></td>
											    <td><c:out value="${bus.standingCapacity}"/></td>
											    <td><c:out value="${bus.loadCapacity}"/></td>
											    <td><c:out value="${bus.manufacturedDate}"/></td>
											    <td><c:out value="${bus.manufacturedBy}"/></td>
											    <td><c:out value="${depotAssignedList[bus.depotAssigned]}"/></td>
											    <td><c:out value="${bus.fuelType}"/></td>
											    <td><c:out value="${busStatusList[bus.busStatus]}"/></td>
		
											    <!-- 									    	
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> |<td><a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>								    
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> | <a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>	
											     -->									    
											    <td align="center"><a href="editBus?busId=${bus.busId}">Edit</a> | <a href="deleteBus?busId=${bus.busId}">Delete</a></td>
											   
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