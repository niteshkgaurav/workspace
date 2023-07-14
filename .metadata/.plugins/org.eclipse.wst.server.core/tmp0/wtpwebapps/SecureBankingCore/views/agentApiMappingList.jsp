<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />

	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/agentApiMapping.js"></script>
	

<title>Agent Commission Mapping</title>


<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript">

	function clr()
	{
		$('#errormsg').text(" ");
	}
	/* function validateApiform()
	{

	 var mappedby=$("input[name='mappedBy']:checked").val();
	 if(mappedby=='agent'){
var inputs = document.getElementsByClassName("agentCheck");
	 var pickedOne = false;
	 for(var i = 0, l = inputs.length; i < l; ++i) {
		    if(inputs[i].checked) {
		      pickedOne = true;
		      break;
		    }
		  }
	 if(pickedOne==false){
		 $('#errormsg').text("Select Agent ");
		 $('#errormsg').show();
		 return false;
	 }
	 }
	 if(mappedby=='company'){
		 var inputs = document.getElementsByClassName("companyCheck");
		 	 var pickedOne = false;
		 	 for(var i = 0, l = inputs.length; i < l; ++i) {
		 		    if(inputs[i].checked) {
		 		      pickedOne = true;
		 		      break;
		 		    }
		 		  }
		 	 if(pickedOne==false){
		 		 $('#errormsg').text("Select Company ");
		 		 $('#errormsg').show();
		 		 return false;
		 	 }
		 	 }
	
	
	}  */
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('.ServiceCheck').each(function () {
	     $(this).prop('checked',false);
	  });
	$('.companyCheck').each(function () {
	     $(this).prop('checked',false);
	  });
	$('.agentCheck').each(function () {
	     $(this).prop('checked',false);
	  });
	
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			   "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
		  $('#table_id_companyTable').DataTable({
			   "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
		  });
		  $('#table_id_companyTable1').DataTable({
			   "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
		  });
		  
		  
	  }

	$('#company').hide();
}
);

function changeTable(a,b)
{
	$('#'+a).show();
	$('#'+b).hide();
}
</script>	


</head>
<body class="PageType">
	
<form:form method="post"	modelAttribute="data"
		action="${pageContext.request.contextPath}/AdminUI/commission/getAgentApiMappingList">
			 
	                    <div class="heading-inner  ">
		                      <h1 class="pull-left">Agent API Mapping </h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                     <%--  <c:if test="${successMessage!=''}"> --%>
									<div id="sucessMessage"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${successMessage}</p> 
									</div> 
							<%-- </c:if>	 --%>
	                    	</div>
	                    	
	                    	<div id="errorMessage"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p style="color:red;" id='errormsg'> </p> 
             </div>
             <div  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-left">
			
			<label ><b>Mapped By</b></label>
				 <label  class="collapse"></label> <span></span>
					<input type="radio" name="mappedBy" value="agent" onclick="changeTable('agent','company')" checked> Agent	 
					<input type="radio" name="mappedBy" value="company" onclick="changeTable('company','agent')" >Company<br>
			</div>
				
					
              <br>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb" id="agent">
					 <div class="transaction-table" >
                     <div class="table-responsive">
					
					<table class="table table-bordered table-striped" id="table_id"  class="agentTable">
					 <thead>
					<tr>
					<th>Action</th>
					<th>Agent Name</th>
					<th>Agent Company</th>
									
					</tr>
					
					 </thead>
					 <c:forEach items="${data.dataAll}" var="accountinfo" varStatus="status" >
										<tr>
																			
											<td width="10%"> <form:radiobutton class="agentCheck"
														id="agent${status.count}" name="chk"
														path="chk" value="${accountinfo.agentId}"     onclick="getCheckedServicesForAgent(${accountinfo.agentId});"		 /> <%-- onclick="check('tab${status.count}');" --%>
												
											 </td>
											 
													
											<td width="30%">${accountinfo.firstName}</td> 
											<td width="30%">${accountinfo.companyName}</td>
											
										
										</tr>
									</c:forEach> 
					
					</table>
								 </div>	
								</div>
					</div>
		
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb" id="company">
					 <div class="transaction-table" >
                     <div class="table-responsive">
					
					<table class="table table-bordered table-striped" id="table_id_companyTable" class="companyTable">
					 <thead>
					<tr>
					<th>Action</th>
					<th>Agent Company</th>
					<th>Host=>Distributor=>Sub-Distributor Hierarchy</th>
									
					</tr>
					
					 </thead>
					 <c:forEach items="${data.companyList}" var="accountinfo" varStatus="status">
										<tr>
																			
											<td width="10%"> <form:radiobutton class="companyCheck"
														id="company${status.count}"
														path="companyName" value="${accountinfo.companyId}" onclick="getCheckedServicesForAgentCompany(${accountinfo.companyId});" />
														
											 </td>
											 
											<td width="20%">${accountinfo.companyName}</td>
											<td width="30%">${accountinfo.hierarchy}</td>
											
										
										</tr>
									</c:forEach> 
					
					</table>
								 </div>	
								</div>
					</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb " id="apiSerevices" > 
					 <div class="transaction-table" >
                     <div class="table-responsive">
					
					<table class="table table-bordered table-striped" id="table_id_companyTable1" class="companyTable">
					 <thead>
					<tr>
					<th><input type="checkbox" id="checkall" class="checkbox" onclick="checkAll()"/>Action</th>
					<th>Service Name</th>
					<th>Service Category</th>
									
					</tr>
					
					 </thead>
					 <tbody>
				
					 <c:forEach items="${listOfServices}" var="listServices">
										<tr>
																			
											<td width="10%"> <form:checkbox class="ServiceCheck" 
														id="serviceCheck${listServices.id}" name="serviceCheck" onclick="getsubServices('${listServices.subcategories}')"
														path="serviceCheck" value="${listServices.id}"/>
														
											 </td>
											 
											<td width="30%">${listServices.name}</td>
											<td width="30%">${listServices.serviceCategory}</td>
											
										
										</tr>
									</c:forEach> 
					</tbody>
					</table>
								 </div>	
								</div>
					</div>
	                           	
	                  
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Update" onclick="return validateEditApiform()" />
		
		</div>    
	 <input type="hidden" value="" name="serviceArray" id="serviceArray"> 
	 <input type="hidden" value="" name="agentArray" id="agentArray"> 
	  <input type="hidden" value="" name="agentCompanyArray" id="agentCompanyArray">              
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">		 

	</form:form>
	
	</body>
</html>