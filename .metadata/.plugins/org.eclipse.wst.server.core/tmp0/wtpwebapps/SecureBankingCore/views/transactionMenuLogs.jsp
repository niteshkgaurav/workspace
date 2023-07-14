<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
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

<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.0/themes/base/jquery-ui.css" />
<script>
$(function () {
	$( "#datepickertxnFrom" ).datepicker({ 
    	dateFormat: 'yy-mm-dd' 
   	});
   	$( "#datepickertxnTo" ).datepicker({ 
    	dateFormat: 'yy-mm-dd' 
	});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	if ($('body').is('.PageType')) {
	  $('#table_id').DataTable({
		  "scrollY": "400px",
	      "scrollCollapse": true,
	      "paging":         true,
		  "pagingType": "simple_numbers"  
	  });
	}
});
</script>
<script type="text/javascript">
$(function () {
	var level = document.getElementById('level').value;
	if(level == "") 
		level = "all";
 	document.getElementById('menuListSelect').value = level;
});
</script>
<script type="text/javascript">
function validateTxnDate(event) {
	var flag = true;
	$('#msgId').html('');

	var startDate =$('#datepickertxnFrom').val().trim();
	if(startDate.length == 0){
		$('#startDateErrorId').hide();
		$('#startDateErrorId').show();
		$('#startDateErrorId').html('<font color="red" size="2">From Date can not be empty</font>');
		$('#datepickertxnFrom').val('');
		flag = false;
	}

	var endDate =$('#datepickertxnTo').val().trim();
	if(endDate.length == 0){
		$('#endDateErrorId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date can not be empty</font>');
		$('#datepickertxnTo').val('');
		flag = false;
	}
	
	if(Date.parse(endDate)<=Date.parse(startDate)){
		$('#endDateErrorId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than From date</font>');
		$('#datepickertxnTo').val('');
		flag = false;
	}
	
	if(flag == false) {
		event.preventDefault();
	}
	else {
		$('#transactionLogForm').submit();
	}
}
</script>

<title>Transaction Menu Logs</title>
<style>
.tdHide {
	display: none;
}
</style>
</head>
<body class="PageType">
	<form:form id="transactionLogForm" name="transactionLogForm" method="get" action="${pageContext.request.contextPath}/AdminUI/transactionService/transactionMenuLogs">
		<div>
			<div style="float:left;">
				<p id="startDateErrorId"></p>
				<p id="endDateErrorId"></p>
				<p>From Date: <input type="text" name="fromDate" id="datepickertxnFrom" autocomplete="off" value="${fromDate}"/>&nbsp;
				To Date: <input type="text" name="toDate" id="datepickertxnTo" autocomplete="off" value="${toDate}"/></p>
				<input style="float:right;" id="submitId" type="submit" class="btn btn-warning"  value="Submit" onclick="validateTxnDate(event);"/>
			</div>
			<div style="float:right;"><p style="font-weight:bold">Total number of transactions: ${menuLogs.size()}</p></div>
		</div>
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
		<div style="float:right;">		
			<label for="menu">Menu&nbsp;</label>
			<select name="level" id="menuListSelect" onchange="this.form.submit()">
				<option value="all">All</option>
					<c:forEach items="${menuList}" var="menu">
				        <option value="${menu.stkCode}">${menu.serviceName}</option>
					</c:forEach>
			</select> 	
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
									<th>Service Description</th>
									<th>Menu Level</th>
									<th>Total Transactions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${menuLogs}"
									var="menuLog">
									<tr>
										<td>${menuLog.service}</td>
										<td>${menuLog.level}</td>
										<td>${menuLog.totalTxn}</td>
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
		</div>
		<input type="hidden" value="${pages}" id="pages" />


		<input type="hidden" value="${pageContext.request.contextPath}"
			name="link">
		<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId">
		<input type="hidden" value="${level}" id="level">
	</form:form>
</html>