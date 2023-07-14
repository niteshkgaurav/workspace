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
	src=${pageContext.request.contextPath}/js/portalCommission.js></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commission.js"></script>


<title>Commission Product Mapping</title>

<!-- <script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>




<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
<script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/commission/getMappingList');
</script>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			   "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
		  });
	  }
} );
</script>	
	
</head>
<body class="PageType">
	<form:form id="CommissionProductMappingForm"	name="CommissionProductMappingForm" method="post"
		modelAttribute="commissionData"
		action="${pageContext.request.contextPath}/AdminUI/commission/commissionProductMappingPost">
			 
	                    <div class="heading-inner">
		                      <h1 class="pull-left">Commission Product Mapping</h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                  
									<div id="sucessMessage"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${successMessage}</p> 
									</div> 
						
	                    	</div>
	                    	
	                    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right ">
			<button type="button" class="btn btn-warning " onclick="toggleform('rootTable');">
				Create Commission Product Mapping</button>
				<div class="row">&nbsp;</div>
		</div>
	
	
	<div style="height:75px" ></div>
	                    	
	                    	<div id="rootTable" class="row collapse ">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="name">
					<form:input class="selecttag" type="text" path="name" id="tempName"
						onclick="this.setAttribute('value', this.value);"
						onchange="checkName('tempName','CommissionProduct','mappingName','nameError','label_tempName');selecttag('label_tempName','tempName')"
						onfocus="clearmsg();showlabel('label_tempName','nameError');" />
					<label id="label_tempName"class="valid"><spring:message
							code="LABEL_TEMPNAME" /></label> <label id="nameError" class="collapse"></label>
				</div>
			</div>


		<div class="col-xs-12">
					 <div class="transaction-table" >
                     <div class="table-responsive">
					
					<table class="table table-bordered table-striped" id="table_id" >
					<thead>
					<th>Type</th>
					<th>Commission</th>
					<th>Subscription</th>
					<th>Deducted From</th>
					</thead>
					<c:forEach var="type" items="${productTypeMap}">
					<tr>
						<td colspan="4">
					<font color="blue">${type.key}</font>
					<c:forEach var="productVal" items="${ProductMap}">
					<c:if test="${productVal.value==type.key}">
					<form:hidden path="productsId" value="${productVal.key}"/>
					</c:if>
					</c:forEach>
					</td>
					</tr>
					<c:forEach var="value" items="${type.value}">
					<tr>
					<td align="left"><form:hidden  path="customerCommissionType" value="${value}"/>${value}</td>
					<td><form:select class="selecttag" name="commissionId" path="commissionId" id="commissionId"  onclick="this.setAttribute('value', this.value);" value="">
								<form:options items="${commissionTemplateMap}"/>
									</form:select></td>
			        <td><form:select class="selecttag" name="subscriptionIds" path="subscriptionId" id="subscriptionId"  onclick="this.setAttribute('value', this.value);" value="">
													 <form:option value="" label=" " />
													<form:options items="${subscriptionTemplateMap}" />
															</form:select></td>
			        <td><form:select name="deduction" path="deduction">
			            <form:option value="Customer">Customer</form:option>
			            <form:option value="Agent">Agent</form:option>
			            <form:option value="Host">Host</form:option>
			            <form:option value="Portal">Portal</form:option>
			            </form:select>
			        </td>
					</tr>
					</c:forEach>
					</c:forEach>
					</table>
					</div>
					</div>
					</div>
	                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      		<input type="button"
								value="Submit" onclick="return validateCommissionMapping(event,'new');" class="btn btn-warning"/>
	                      														 				<div class="row">&nbsp;</div></div>   
	                         
	                    

												 <div>	</div>
				
	                       </div> 
	                          	                            
	                       
	                   
				
					
					<div class="col-xs-12">
					 <div class="transaction-table" >
                     <div class="table-responsive">
					
					<table class="table table-bordered table-striped" id="table_id" >
					 <thead>
					<tr>
					<th><spring:message code="lab_Name" /></th>
					<th><spring:message code="lab_Description"/></th>
					<th><spring:message code="lab_action" /></th>	
					</tr>
					
					 </thead>
					<c:forEach items="${commissionData.listcomdata}" var="editCommisionList" varStatus="loopN">
										<tr id="rowId_${editCommisionList.id}">
											<td>${editCommisionList.name}</td>
											<td>
											<textarea rows="10" cols="50" style="LINE-HEIGHT:10px;">
											<c:forEach items="${editCommisionList.commissionTypeList[loopN.index]}" var="commissionType" varStatus="loop">
												Commission Type: ${commissionType}
												<c:if test="${not empty editCommisionList.subscriptionTemplateList[loopN.index][loop.index]}">Subscription Template: ${editCommisionList.subscriptionTemplateList[loopN.index][loop.index]}</c:if>
												Commission Template: ${editCommisionList.commissionTemplateList[loopN.index][loop.index]}
												<c:if test="${not empty editCommisionList.deductionList[loopN.index][loop.index]}">Deducted From: ${editCommisionList.deductionList[loopN.index][loop.index]}</c:if>
											</c:forEach>
											</textarea>
											</td> 
										<td><input id="delete_${editCommisionList.id}" type="button" value="Delete" class="btn btn-warning" onclick="deleteCommissionMapping('rowId_${editCommisionList.id}','${editCommisionList.id}');"/></td> 
											
										</tr>
									</c:forEach> 
					
					</table>
												 </div>	
												 <div>	</div></div></div>
						
	                        
	                        
	              
		 
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>