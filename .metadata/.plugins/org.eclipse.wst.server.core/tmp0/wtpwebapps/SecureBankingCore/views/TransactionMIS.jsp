<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/MIS.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/css/jquery.dataTables.min.css"/>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.flash.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.print.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":        "400px",
		        "scrollX":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers",
		        dom: 'lBfrtip',
		        buttons: [
		            {
              extend: 'excelHtml5',
              text : 'Export to Excel',
              title: 'TransactionReport'
          },
          {
              extend: 'csvHtml5',
              text : 'Export to CSV',
              title: 'TransactionReport'
          }
		        ]
		  });
	  }
} );

function changeParam(obj) {
	document.getElementById("action").value = obj.value;
	
}

</script>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD',
		//	 minDate : 'now',
		
    });
});
</script>
<title>TransactionMIS</title>
</head>

<body class="PageType">
	<form:form id="formDown" method="post"
	
		modelAttribute="misReportData"  action="${pageContext.request.contextPath}/AdminUI/miscontroller/transactionDetail">
		<input type="hidden" id="action" name="action"/>
		
		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<div class="clearfix"></div>
			</div>
			
			 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" id="startDate" path="startDate" onclick="selct('startDateId');selecttag('startDateId','startDate');emptyerror(event,'startDateErrorId');" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','startDate');" />
					<label id="startDateId" class="valid">${fromDate}</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="toDate" var="toDate"/>
					<form:input type="text" id="endDate" path="endDate" onclick="selct('endDateId');selecttag('endDateId','endDate');emptyerror(event,'startDateErrorId');" 
					class="selecttag" onfocus="showlabel('endDateId','endDateErrorId');selecttag('endDateId','endDate')"/>
					<label id="endDateId" class="valid">${toDate}</label>
					<label id="endDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('endDateId');clearmsg();"></i> </i>
				</div>
				</div>
			</div> 
			
			<input id="datewise" type="submit" name="Submit" class="btn btn-warning" value="Submit" onclick="return validateMIS(event)"/>
	  			 

<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-bordered table-striped" id="table_id">
	  						<thead class="default"> 						
	  						<tr>
	  							
		  						<th align="center">TransactionId</th>
		  						<th align="center">DeviceId</th>
		  						<th align="center">Transaction Type</th>
		  						<th align="center">Transaction Status</th>
		  						<th align="center">Subscriber Name</th>
								<th align="center">Subscriber Mobile Number</th>
								<th align="center">Crad Number</th>
								<th align="center">Bank Name</th>
								<th align="center">Agent Name</th>
								<th align="center">Agent Code</th>
								<th align="center">Transaction Amount</th>
								<th align="center">Service Charges</th>
								<th align="center">Total Amount</th>
								<th align="center">Transaction Date</th>
								
								
								
								<!-- <th align="center">Pos Serial no</th>
								<th align="center">Terminal Id</th> -->
								
								<!-- <th align="center">Agent Code</th> -->
								
								<!-- <th align="center">Product</th>
								<th align="center">Distributor</th>
								<th align="center">Sub Distributor</th> -->
								
								<!-- <th align="center"> Tax</th>
								<th align="center">Discount</th>
								
								<th align="center">Status</th>
								<th align="center">Result Description</th>
								<th align="center">District</th>
								<th align="center">Region</th>
								<th align="center">Request Time</th>
								<th align="center">Response Time</th> -->
		  						</tr></thead>					
		  					<tbody>
	  						<c:forEach items="${transactionList}" var="transactionListData">
	  						
								<tr><td align="center">${transactionListData.txnId}</td>
								<td align="center">${transactionListData.deviceId}</td>
								<td align="center">${transactionListData.txnType}</td>
								<td align="center">${transactionListData.status}</td>
								 <td align="center">${transactionListData.name}</td>	
								  <td align="center">${transactionListData.custPhnNo}</td>
								  
								  <td align="center">${transactionListData.cardExternalNumber}</td>
								  <td align="center">${transactionListData.bankName}</td>
								  	
								  <td align="center">${transactionListData.agentName}</td>
								  <td align="center">${transactionListData.agentCode}</td>
								  
								<td align="center">${transactionListData.txnAmount}</td>
									<td align="center">${transactionListData.commissionAmount}</td>
									<td align="center">${transactionListData.trxAmount}</td>
									<td align="center">${transactionListData.startDate}</td>
								<!-- 	 <td align="center"></td>	<td align="left"></td>
									 <td align="center"></td>	<td align="left"></td> -->
									
									
									
									 
									<%-- <td align="center">${transactionListData.agentCode}</td>
									<td align="center">${transactionListData.agentName}</td>
									<td align="center"></td>
									
									<td align="center">${transactionListData.productName}</td>
									<td align="center">${transactionListData.distName}</td>
									<td align="center">${transactionListData.subDistName}</td>
									<td align="center"></td>	<td align="left"></td>	<td align="left"></td>
									
									<td align="center"> ${transactionListData.status} </td>
									<td align="center"></td>
									<td align="center">${transactionListData.city}</td>
									<td align="center"> ${transactionListData.region} </td>
									<td align="center"></td>
									<td align="center"></td> --%>
								</tr>
							</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
							
		
		</form:form>
</body>
</html>