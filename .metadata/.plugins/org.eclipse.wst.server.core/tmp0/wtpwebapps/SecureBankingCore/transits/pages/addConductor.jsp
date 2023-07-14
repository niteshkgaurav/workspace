\<%@page contentType="text/html;charset=UTF-8"%>
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
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script>
function getRoute()
{
	
	var depot=$("#depotId option:selected"). val();
	 $.ajax({
		url: "ajax/getRoute",
		dataType:'json',
		type: "GET",
		async:false,
		dataType: 'json',
		data: "depotId="+depot,
		success:function(response){
			
			var data1=response[0];
			var data2=response[1];
			if(data1.length!=0)
				{
				$('#routeId').empty().append('<option value=""></option>');
			$.each(data1,function(key, value)
	                {
				var data=value.split("#");
	                    $("#routeId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
	                });
				}
			else
				{
				$('#routeId').empty().append('<option value=""></option>');
				}
			//====================
			if(data2.length!=0)
			{
				$('#busId').empty().append('<option value=""></option>');
		$.each(data2,function(key, value)
                {
			var data=value.split("#");
                    $("#busId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
                });
			}
		else
			{
			$('#busId').empty().append('<option value=""></option>');
			}
	
		}	
	} );
}

</script>

<script>
function validate(event){
	
	var v1=$('#conductorId').val().trim();
	var v2=$('#depotId').val().trim();
	if(v1.length==0||v2.length==0){
		$('#conductors_divId').addClass('has-error');
		$('#depot_divId').addClass('has-error');
		
		alert("Put values in above fields to Map Conductor Successfully ");
		event.preventDefault();
  		return false;
	} 	
	
}


</script>

</head>
<body>

<form:form   method="post" modelAttribute="conductorData" action="${pageContext.request.contextPath}/AdminUI/conductor/addConduct"  > 
      <div class="heading-inner ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Conductor Depot Mapping</h1>
	                      <div class="clearfix"></div>
						
						<%-- <div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${MessageAfterBCRegistration}</font></p> 
									</div>  --%>
				  </div>
				  
				  <div align="center"> ${msg}
				  </div>  
  
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
   &nbsp;
   </div>
   
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="conductors_divId">
     	<form:select  name="countryCode" path="conductorId" onclick="removeHasError('conductors_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${conductors}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Conductor</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="depot_divId">
     	<form:select  name="countryCode" path="depotId" id="depotId" onChange="getRoute();" onclick="removeHasError('depot_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${depots}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Depot</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
  <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input">
     	<form:select  name="countryCode" path="routeId" id="routeId" >
								<form:option  value="" label=" "/>
							
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Route</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input">
     	<form:select  name="countryCode" path="busId" id="busId" >
								<form:option  value="" label=" "/>
								
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Bus</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>   --%>
   
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="submit"  onclick="validate(event)" class="btn btn-warning" value="Submit" />
	  				</div>
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
	         <hr>
	       </div>
		   		 <c:if test="${!empty conductors}">
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
					
								<table class="table table-bordered table-striped" id="table_id">
									<thead>
										<tr>
										
										 <th>Conductor Id</th>
										 <th>Depot Assigned</th>
										 <!-- <th>Route Assigned</th>
										 <th>Bus Assigned</th> -->
										<!--  <th>Edit Conductor</th> -->
										</tr>
									</thead>
									<tbody>
							 			<c:forEach items="${conductorList}" var="conductor">
										   <tr>
											    <td><c:out value="${conductor.conductorId}"/></td>
											    <td><c:out value="${conductor.depotId}"/></td>
											   <%--  <td><c:out value="${conductor.routeId}"/></td>
											    <td><c:out value="${conductor.busId}"/></td> --%>
											    
											    
		
											    <!-- 									    	
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> |<td><a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>								    
											    <td align="center"><a href="editBus.html?busId=${bus.busId}">Edit</a> | <a href="deleteBus.html?busId=${bus.busId}">Delete</a></td>	
											     -->									    
											 <%--    <td align="center"><a href="editConductor.html?conductorId=${conductor.conductorId}">Edit</a></td> --%>
											   
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