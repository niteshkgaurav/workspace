<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>

<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/css/jquery.dataTables.min.css"/>



<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/MIS.js></script>
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.flash.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.print.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Commission Detail Report</title>

<script>
/* Results in:
<div>
  {length}
  {filter}
  <div>
    {table}
  </div>
  {information}
  {pagination}
</div>
*/
$(document).ready(function() {
	  //if ($('body').is('.PageType')) {
		  $('#table_id3').DataTable({
			  
			  "scrollY":        "400px",
		        "scrollX":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers",
		        dom: 'lBfrtip',
		        //dom": '<lf<t>ip>',
		        buttons: [
		            {
                extend: 'excelHtml5',
                text : 'Export to Excel',
                title: 'CommissionReport'
            },
            {
                extend: 'csvHtml5',
                text : 'Export to CSV',
                title: 'CommissionReport'
            }
		        ]
		        
		  });
	  //}
	  	  
} );

</script>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({      
		format: 'YYYY-MM-DD',
		//	 minDate : 'now',
		
    });
});
</script>
</head>
<body class="PageType">

<form:form id="formDown" method="post"
	
		modelAttribute="misReportData"  action="${pageContext.request.contextPath}/AdminUI/miscontroller/commissionDetailReport">
		<input type="hidden" id="action" name="action"/>
		
		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<div class="clearfix"></div>
			</div>
			
			 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" name="fromDate" id="startDate" path="startDate" onclick="selct('startDateId');selecttag('startDateId','startDate');emptyerror(event,'startDateErrorId');" class="selecttag"
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
					<form:input type="text" name="toDate" id="endDate" path="endDate" onclick="selct('endDateId');selecttag('endDateId','endDate');emptyerror(event,'startDateErrorId');" 
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
                    <div class="table-responsive" >
                     <table class="table table-bordered table-striped" id="table_id3">
	  						<thead class="default">
		  						<tr >
		  						<th align="center">Date & Time</th>
								<th align="center">Transaction ID</th>
								<th align="center">Device ID</th>
								<th align="center">Transaction Type</th>
								<th align="center">Transaction Amount</th>
								<th align="center">Card Number</th>
								<th align="center">Bank Name</th>								
								<th align="center">Retailer Code</th>
								<th align="center">Retailer Commission</th>
								<th align="center">Distributor Code</th>
								<th align="center">Distributor Commission</th>
								<th align="center">Tafani Commission</th>
								<th align="center">Bank Commission</th>
								
		  						</tr></thead>
	  						<tbody>
	  						<c:forEach items="${trxnCommissionlist}" var="trxnCommissionlistData">
								<tr>
								<td align="left">${trxnCommissionlistData.clientBusinessDate}</td>
									 <td align="left">${trxnCommissionlistData.txnId}</td>
									  <td align="left">${trxnCommissionlistData.deviceId}</td>
									  <td align="left">${trxnCommissionlistData.txnType} </td>
									 <td align="left">${trxnCommissionlistData.trxAmount}</td>
									 
									 <td align="left">${trxnCommissionlistData.cardExternalNumber}</td>
									 <td align="left">${trxnCommissionlistData.bankName}</td>
									 
									<td align="left">${trxnCommissionlistData.agentCode}</td>
									<td align="left">${trxnCommissionlistData.agentCommission}</td>
									<td align="left">${trxnCommissionlistData.disttCode}</td>
									<td align="left">${trxnCommissionlistData.disttCommission}</td>
									<td align="left">${trxnCommissionlistData.hostCommission}</td>
									<td align="left">${trxnCommissionlistData.bankCommission}</td>
									
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