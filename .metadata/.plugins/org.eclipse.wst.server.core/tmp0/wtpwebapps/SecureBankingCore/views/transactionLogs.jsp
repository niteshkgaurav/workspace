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
<script type="text/javascript" src=${pageContext.request.contextPath}/js/TransactionLogs.js></script>

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/transactionLogs.css.css />

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
		  "scrollX": "400px",
	      "scrollCollapse": true,
	      "paging":         true,
		  "pagingType": "simple_numbers"  
	  });
	}
});
</script>

<script type="text/javascript">
$(function () {
	document.getElementById('txnStatusSelectOpt').value = ${txnStatus};
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

<title>Transaction Logs</title>
<style>
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 30%;
  height: 45%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

.modal-content-customer {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 30%;
  height: 80%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

.modal-content-showD {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 30%;
  height: 60%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #ecbf67;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.head-modal {
	color: black;
	font-size: 24px;
    font-weight: 500;
}

.btn-query {
	margin-top: 10px;
	float: right;
	width: 90px;
}

.tdHide {
	display: none;
}

</style>

</head>

<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">
	<form:form id="transactionLogForm" name="transactionLogForm" method="get" action="${pageContext.request.contextPath}/AdminUI/transactionService/transactionLogs">
		<div>
			<div style="float:left;">
				<p id="startDateErrorId"></p>
				<p id="endDateErrorId"></p>
				<p>From Date: <input type="text" name="fromDate" id="datepickertxnFrom" autocomplete="off" value="${fromDate}"/>&nbsp;
				To Date: <input type="text" name="toDate" id="datepickertxnTo" autocomplete="off" value="${toDate}"/></p>
				<input style="float:right;" id="submitId" type="submit" class="btn btn-warning"  value="Submit" onclick="validateTxnDate(event);"/>
			</div>
			<div style="float:right;"><p style="font-weight:bold">Total number of transactions: ${transactionInfoLst.size()}</p></div>
<!-- 			<div class="row">&nbsp;</div> -->
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
			<label for="txnStatus">Transaction Status&nbsp;</label>
			<select name="txnStatus" id="txnStatusSelectOpt" onchange="this.form.submit()">
				<option value="selectAll">All</option>
		        <option value="false">Failed</option>
		        <option value="true">Success</option>
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
									<th>Transaction Id</th>
									<th>Date Time</th>
									<th>Overlay Number</th>
									<th>CIF#</th>									
									<th>Mobile Number</th>
									<th>Service</th>
									<th>Status</th>
									<th class="tdHide">Amount</th>
									<th class="tdHide">Payee Account</th>
									<th class="tdHide">Payer Account</th>
									<th class="tdHide">Query Description</th>
									<th class="tdHide">Query Raise Date</th>
									<th class="tdHide">Query Status</th>
									<th>Details</th>
									<th>Action</th>
									<th class="tdHide">Customer Name</th>
									<th class="tdHide">External#</th>
									<th class="tdHide">Customer Added On</th>
									<th class="tdHide">Email Id</th>
									<th class="tdHide">Date of Birth</th>
									<th class="tdHide">Status</th>
									<th class="tdHide">Address</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${transactionInfoLst}"
									var="transactionInfo">
									<tr>
										<td>${transactionInfo.txnId}</td>
										<td>${transactionInfo.date}</td>
										<td>${transactionInfo.skuExternalNumber}</td>
										<td>${transactionInfo.custId}</td>
										<td style="color:blue; cursor: pointer;" onclick="custDetails($(this));">${transactionInfo.msisdn}</td>
										<td>${transactionInfo.serviceDefnition}</td>
										<td>${transactionInfo.responseStatus}</td>
										<td class="tdHide">${transactionInfo.amount}</td>
										<td class="tdHide">${transactionInfo.accountNoTo}</td>
										<td class="tdHide">${transactionInfo.accountNoFrom}</td>
										<td class="tdHide">${transactionInfo.queryDescription}</td>
										<td class="tdHide">${transactionInfo.queryRaiseDate}</td>
										<td class="tdHide">${transactionInfo.queryStatus}</td>							
										<td><p id="viewDetails" style="${transactionInfo.viewDetails eq "NA" ? 'color:grey' : 'color:blue; cursor: pointer;'}" onclick="viewDetails($(this));">${transactionInfo.viewDetails}</p></td>
										<td><p id="raiseQuery" style="${transactionInfo.queryRaised eq "Query Raised" ? 'color:green' : 'color:blue; cursor: pointer;'}" onclick="raiseQuery($(this));">${transactionInfo.queryRaised}</p></td>
										<td class="tdHide">${transactionInfo.customerName}</td>
										<td class="tdHide">${transactionInfo.externalNo}</td>
										<td class="tdHide">${transactionInfo.addedOn}</td>							
										<td class="tdHide">${transactionInfo.emailId}</td>							
										<td class="tdHide">${transactionInfo.dob}</td>								
										<td class="tdHide">${transactionInfo.status}</td>							
										<td class="tdHide">${transactionInfo.address}</td>							
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="myModal" class="modal">
			  <div class="modal-content">
			    <div class="modal-header">
			      <span class="close" onclick="closemodal();">&times;</span>
			      	<p class="head-modal">Query Description</p>
			    </div>
			    <div class="modal-body">
			      <textarea id="queryDescription" maxlength="90" cols="41" rows="5" placeholder="Enter Query Description"></textarea>			      
					<input id="submitQuery" class="btn-query btn btn-warning"  value="Submit" onclick="raiseQueryB(event);"/>			      
			    </div>
			  </div>
			</div>

			<div id="myModalDetails" class="modal">
			  <div class="modal-content">
			    <div class="modal-header">
			      <span class="close" onclick="closemodalDetails();">&times;</span>
			      	<p class="head-modal">Credit/Debit Details</p>
		    	</div>
    			<div class="modal-body">
			      	<table>
				      	<tr>
				      		<td style="font-weight: 800">Amount :</td> <td id="amount" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Payer Account# :</td> <td id="payer" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Payee Account# :</td> <td id="payee" style="padding: 15px;"></td> 
				      	</tr>
			      	</table>
		    	</div>
			    <div class="modal-body">
<!-- 					<input id="close" class="btn-query btn btn-warning"  value="Close" onclick="closemodalDetails();"/>			       -->
			    </div>
			  </div>
			</div>
			
			<div id="queryDetails" class="modal">
			  <div class="modal-content-showD">
			    <div class="modal-header">
			      <span class="close" onclick="closeQueryDetails();">&times;</span>
			      	<p class="head-modal">Query Details</p>
		    	</div>
    			<div class="modal-body">
    				<div class="row">&nbsp;</div>
			      	<table>
				      	<tr>
				      		<td style="font-weight: 800">Query Description :</td> <td id="descQ" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Raise Date :</td> <td id="dateQ" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Current Status :</td> <td id="statusQ" style="padding: 15px;"></td> 
				      	</tr>
			      	</table>
		    	</div>
			    <div class="modal-body">
<!-- 					<input id="close" class="btn-query btn btn-warning"  value="Close" onclick="closemodalDetails();"/>			       -->
			    </div>
			  </div>
			</div>
			
			<div id="custDetails" class="modal">
			  <div class="modal-content-customer">
			    <div class="modal-header">
			      <span class="close" onclick="closeCustModal();">&times;</span>
			      	<p class="head-modal">Customer Details</p>
		    	</div>
    			<div class="modal-body">
			      	<table>
				      	<tr>
				      		<td style="font-weight: 800">Customer Name :</td> <td id="custName" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Overlay# :</td> <td id="overlayN" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Email Id :</td> <td id="emailid" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Date of Birth :</td> <td id="dob" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">Status :</td> <td id="status" style="padding: 15px;"></td> 
				      	</tr>
				      	<tr>
				      		<td style="font-weight: 800">KYC :</td> <td id="kyc" style="padding: 15px;"></td> 
				      	</tr>
			      	</table>
		    	</div>
			    <div class="modal-body">
<!-- 					<input id="close" class="btn-query btn btn-warning"  value="Close" onclick="closemodalDetails();"/>			       -->
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
	</form:form>
</html>