<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
<%@ page import="com.ng.sb.common.dataobject.PaymentProviderEditData" %>
<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>

<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/ServiceProviderMapping.js></script>

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />

<script type="text/javascript">
$(document).ready(function() {
	if ($('body').is('.PageType')) {
	  $('#table_id').DataTable({
		  "scrollY":"400px",
	      "scrollCollapse": true,
	      "paging":         true,
		  "pagingType": "simple_numbers"  
	  });
	}
		
   if ($('body').is('.PageType')) {
	  $("#categorySelect").val(${catid});
   }
});
</script>

<title>Service Provider Mapping</title>
</head>

<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">
	<form:form id="providerMappingForm" name="providerMappingForm" method="get" action="${pageContext.request.contextPath}/AdminUI/ProviderMgmt/providerMappingThirdParty">
		<label for="hostsubversion">HostSubversion&nbsp;</label>
		<select name="hsvid" id="hostSubversionSelect" onchange="this.form.submit()">
			<c:forEach items="${hsvList}" var="hsv">			
			  <option value="${hsv.id}">${hsv.name}</option>
			</c:forEach>
		</select> 	
<!-- 		<div class="row">&nbsp;</div> -->
	    <label for="category" style="display:none">Select Category&nbsp;</label>
		<select name="catid" id="categorySelect" onchange="this.form.submit()" style="display:none">
		    <option value="0">All</option>
			<c:forEach items="${catList}" var="category">			
			  <option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select> 	
		<input type='button' style="float:right;" id='btnUpdateProviderCode' value='Update' class="btn btn-warning" onclick="saveProviderMapping();">
	
		<div class="row">&nbsp;</div>
		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<div class="clearfix"></div>
			<hr>
			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
			<c:if test="${errorMessage!=''}">
				<div id="errorId"
					class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-danger">${errorMessage}</p>
				</div>
			</c:if>
		</div>
		<div id="msgErrorDiv"
			class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
			<p class="text-danger" id="msgErrorP"></p>
		</div>

		<div class="row">

			<div id="SearchByName"
				class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">

				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover " id="table_id">
							<thead class="default">
								<tr>
									<th><spring:message code="lab_provider_name" /></th>
									<th><spring:message code="lab_provider_description" /></th>
									<th>Overlay Code</th>
									<th><spring:message code="lab_provider_categories"/></th>
									<th>BBPS partner code</th>
<!-- 									<th>Active</th> -->
									<th style="display:none">Provider Id</th>
									<th style="display:none">Mapping Id</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${providersList}"
									var="paymentProvider">
									<tr>
										<td>${paymentProvider.providerName}</td>
										<td>${paymentProvider.providerDescription}</td>
										<td>${paymentProvider.providerCode}</td>
										<td>${paymentProvider.catName}</td>
										<td class="providerCode"><input type="text" id="thirdPartyBillerCode" value="${paymentProvider.thirdPartyBillerCode}"/>
<%-- 										<td> <input type="checkbox" id="providerStatus" name="status" value="${paymentProvider.status == "true" ? 'checked':''}"></td> --%>
										<td class="providerId" style="display:none"><input type="hidden" id="providerId" value="${paymentProvider.providerId}"/></td>
										<td class="mappingId" style="display:none"><input type="hidden" id="mappingId" value="${paymentProvider.mappingId}"/></td>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<input type="hidden" id="contextPath" name="contextPath"
				value="${pageContext.request.contextPath}" /> <input type="hidden"
				id="contextPath" name="contextPath"
				value="${pageContext.request.contextPath}" />


			<c:set var="val">
				<spring:message code="user.list.table.contactPersonName" />
			</c:set>
			<input id="paymentProviderform" type="hidden" value="${val}" />
		</div>
		<input type="hidden" value="${pages}" id="pages" />


		<input type="hidden" value="${pageContext.request.contextPath}"
			name="link">
		<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId">
	</form:form>
</html>