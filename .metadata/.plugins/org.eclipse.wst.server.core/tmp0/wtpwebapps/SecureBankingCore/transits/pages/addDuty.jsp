<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 

<!-- Include Date Range Picker -->
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/UserForgetPassword.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
 <script>
 function getRoute()
 {
	 var flag=false;
 	var msg=" <font color='red'>";
 	$("#msg").empty();
 	var depot=$("#depotId option:selected"). val();
 	 $.ajax({
 		url: "ajax/getRoute",
 		dataType:'json',
 		type: "POST",
 		async:false,
 		dataType: 'json',
 		data: "depotId="+depot,
 		success:function(response){
 			var routeInfo=response[0];  //data1
 			var busInfo=response[1];  //data2
 			var conductorInfo=response[2];  //data3
 			var machineInfo=response[3]; //data4
 			//==================  append Route Data
 				$('#routeId').empty().append('<option value=""></option>');
 			if(routeInfo.length!=0)
 				{
 			$.each(routeInfo,function(key, value)
 	                {
 				var data=value.split("#");
 	                    $("#routeId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
 	                });
 				}
 			else
 				{
 				msg=msg+"Route";flag=true;
 				}
 			
 			//==================== append Bus Data
 					$('#busId').empty().append('<option value=""></option>');
 			if(busInfo.length!=0)
 			{
 			$.each(busInfo,function(key, value)
                 {
 			var data=value.split("#");
                     $("#busId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
                 });
 			}
 			else
 				{
 				msg=msg+", Bus";flag=true;
 				}
 		
 			
 			
 		//	=================  append Conductor Data
 			$('#conductorId').empty().append('<option value=""></option>');
 			if(conductorInfo.length!=0)
 			{
 				
 		$.each(conductorInfo,function(key, value)
                 {
 			var data=value.split("#");
                     $("#conductorId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
                 });
 			}
 			else
 				{
 				msg=msg+", Conductor ";flag=true;
 				}
 		
 			
 			
 	 		//	=================  append Machine Data
 	 			$('#machineId').empty().append('<option value=""></option>');
 	 			if(machineInfo.length!=0)
 	 			{
 	 				
 	 		$.each(machineInfo,function(key, value)
 	                 {
 	 			var data=value.split("#");
 	                     $("#machineId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
 	                 });
 	 			}
 	 			else
 	 				{
 	 				msg=msg+", Machine ";flag=true;
 	 				}
 	
 	 			
 	 			if(flag==true)
 	 				{
 	 		msg=msg+"Not Available for this Depot </font>"	;
 	 				}
 	 			else
 	 				{
 	 			msg="";	
 	 				}
 	 			$("#msg").html(msg);
 	 		
 		}	
 	} );
 }
 
 $(function () {

	 var currentDate=new Date(); 
	 $('#datetimepicker1').datetimepicker({
          
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
             useCurrent: false,

       });
		
	});
</script>
 
<script>

function validate(event){
	var v1=$('#depotId').val().trim();
	var v2=$('#routeId').val().trim();
	var v3=$('#conductorId').val().trim();
	var v4=$('#busId').val().trim();
	var v5=$('#machineId').val().trim();
	var v6=$('#date').val().trim();
	
	if(v1.length==0){
		$('#depot_divId').addClass('has-error');
	}
	if(v2.length==0){
		$('#route_divId').addClass('has-error');
	}
	if(v3.length==0){
		$('#conductor_divId').addClass('has-error');
	}
	if(v4.length==0){
		$('#bus_divId').addClass('has-error');
	}
	if(v5.length==0){
		$('#machine_divId').addClass('has-error');
	}
	if(v6.length==0){
		$('#datetimepicker1').addClass('has-error');
	}
	
	
	event.preventDefault();
}

</script>


</head>
<body>
<form:form   method="post" modelAttribute="roasterData" action="${pageContext.request.contextPath}/AdminUI/roasterControl/addDuty"  > 
      <div class="heading-inner ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Duty Roaster</h1>
	                      <div class="clearfix"></div>
						
						<div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green"></font></p> 
									</div> 
				  </div>  
				  
				 <div id="msg" align="center">
				  </div>
  
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
   &nbsp;
   </div>
   
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="depot_divId">
     	<form:select  name="countryCode" path="depotId" id="depotId" onchange="getRoute();" onclick="removeHasError('depot_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${depots}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Depot</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="route_divId">
     	<form:select  name="countryCode" path="routeId" id="routeId" onclick="removeHasError('route_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${routes}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Route</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="conductor_divId">
     	<form:select  name="countryCode" path="conductorId" id="conductorId" onclick="removeHasError('conductor_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${conductor}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;conductor</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="bus_divId">
     	<form:select  name="countryCode" path="busId" id="busId" onclick="removeHasError('bus_divId')">
								<form:option  value="" label=" "/>
							<form:options items="${buses}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Bus</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input">
     	<form:select  name="countryCode" path="busType" id="busType" >
								<form:option  value="" label=" "/>
							<form:option  value="Up" label="Up"/>
							<form:option  value="Down" label="Down"/>
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Bus Type</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="machine_divId">
     	<form:select  name="countryCode" path="inventryId" id="machineId" onclick="removeHasError('machine_divId')">
								<form:option  value="" label=" "/>
							
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Machine </label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_routeNumber">
				                  <form:input path="trips" type="text"  maxlength="2" onkeypress="onlyNumric(event,'numbertripserror','numbertrips');" />
				                  <label id="numbertrips"class="valid">Number Of Trips</label>
				                  <label id="numbertripserror" class="collapse"></label> 
				                  <span></span> 
				                </div>
				              </div>
				              
				              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				                <div class="styled-input" id="div_routeNumber">
				                  <form:input path="time" type="text"  maxlength="2" />
				                  <label class="valid">Time (in Hrs.)</label>
				                  <span></span> 
				                </div>
				              </div>
				              
				              				  <br>
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input">
		                         	 <div class="input-group date" id="datetimepicker1">
		                            	<form:input  path="date" class="selecttag" type="text"  placeholder="."
					                         onclick=" removeHasError('datetimepicker1'); emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')"
					                         onfocus="selecttag('label_lab_dob','lab_dob')"    />
		                           		 	 <label id="label_lab_dob" class="valid">Date</label>
					                         <label id="lab_dobErrorId" class="collapse"></label>
					                         <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
		                           </div>
		                        </div>
		                      </div>
		                      
				              
     
   
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="submit"  onclick="validate(event)" class="btn btn-warning" value="Submit" />
	  				</div>
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
	         <hr>
	       </div>
	       
	       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	
	       </div>		          
		   		 <c:if test="${!empty activeRoasterData}">
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
					
								<table class="table table-bordered table-striped" id="table_id">
									<thead>
										<tr>
										
										 <th>Conductor Id</th>
										 <th>Depot Assigned</th>
										 <th>Route Assigned</th>
										 <th>Bus Assigned</th>
										 <th>Machine Assigned</th>
										 <th>Bus Type</th>
										  <th>Trips</th>
										 <th>Time</th>
										 <th>Date</th>
										 <th>Return Machine</th>
										</tr>
									</thead>
									<tbody>
							 			<c:forEach items="${activeRoasterData}" var="data">
										   <tr>
											    <td><c:out value="${data.data[0]}"/></td>
											    <td><c:out value="${data.data[2]}"/></td>
											    <td><c:out value="${data.data[1]}"/></td>
											    <td><c:out value="${data.data[3]}"/></td>
											    <td><c:out value="${data.machineAssigned}"/></td>
											    <td><c:out value="${data.busType}"/></td>
											    <td><c:out value="${data.trips}"/></td>
											    <td><c:out value="${data.time}"/></td>
											    <td><c:out value="${data.date}"/></td>
		
											    <!-- 									    	
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> |<td><a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>								    
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> | <a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>	
											     -->									    
											    <td align="center"><a href="returnMachine?conductorId=${data.conductorId}">Return Machine</a></td>
											   
										   </tr>
									  </c:forEach>												
									</tbody>
								  </table>												
							</div>
						</div>					        		 
					</div>
				</c:if>
      
   
							
</form:form> 
</body>
</html>