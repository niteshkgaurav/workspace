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

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/css/buttons.dataTables.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/css/jquery.dataTables.min.css" />



<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/MIS.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/new_datatable_js/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/new_datatable_js/Buttons-1.5.6/js/buttons.print.min.js"></script>


<title>UserMIS</title>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );

$(function () {
	 $('.datetimepicker1').datetimepicker({
	      
	  format: 'YYYY-MM-DD',
	  //  minDate : 'now',
	  
	    });
	});

function changeParam(obj) {
	var headerData=[];
	$("#table_id th").each(function(){
		headerData.push(($(this).text()));
	});
	$('#header').val(headerData);
	document.getElementById("action").value = obj.value;
	
}
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
          }
		        ]
		        
		  });
	  //}
	  	  
} );

</script>
</head>
<body class="PageType">
	<%-- <form:form 	id="mis" method="post"  
			action="${pageContext.request.contextPath}/AdminUI/miscontroller/updatewalletTransactionSummary"> --%>
	<input type="hidden" id="action" name="action" />

	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">Card Transactions Report</h1>
		<div class="clearfix"></div>
		<hr>
		<c:if test="${successMessage!=''}">
			<div id="msgId"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p class="text-success">${successMessage}</p>
			</div>
		</c:if>
		<c:if test="${errorMessage!=''}">

			<div id="ermsgId"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

				<p class="text-danger">${errorMessage}</p>

			</div>
		</c:if>
	</div>

	<div class="row">
	<form method="post" action="manage-card-transaction-report" >
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                    <div id="div_bankShortNameId" class="styled-input">
								<!-- <select name="id" > -->
								<select name="id">
								<option value="0">ALL</option>
								<c:forEach items="${subscribers}" var="subscriber">
								<option value="${subscriber.id}">${subscriber.mobile}</option>
								</c:forEach>
								</select>
											<label id="label_bankShortNameId" class="valid">Select merchant</label>
											
					    	</div>
                      	</div>
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                  		
					    	</div>
                      	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate"  />
			<!-- 		<input type="text" id="startDate" name="fromDate" -->
					<input type="text" id="startDate" name="startDate"
						onclick="selct('startDateId');selecttag('startDateId','startDate');emptyerror(event,'startDateErrorId');"
						class="selecttag"
						onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','startDate');" />
					<label id="startDateId" class="valid">${fromDate}</label> <label
						id="startDateErrorId" class="collapse"></label> <i
						class="input-group-addon"> <i
						class="glyphicon glyphicon-calendar"
						onclick="selecttag1('startDateId');clearmsg();"></i>
					</i>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="toDate"  />
					<input type="text" id="endDate" name="endDate"
						onclick="selct('endDateId');selecttag('endDateId','endDate');emptyerror(event,'startDateErrorId');"
						class="selecttag"
						onfocus="showlabel('endDateId','endDateErrorId');selecttag('endDateId','endDate')" />
					<label id="endDateId" class="valid">${toDate}</label> <label
						id="endDateErrorId" class="collapse"></label> <i
						class="input-group-addon"> <i
						class="glyphicon glyphicon-calendar"
						onclick="selecttag1('endDateId');clearmsg();"></i>
					</i>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


			<%-- 	 <c:if test="${not empty misReportData.subDistMap || not empty misReportData.hostMap ||not empty misReportData.distMap}">
		<button id="go" value="Go" type="submit"  class="btn btn-warning" onclick="changeParam(this);">Go</button>
		</c:if> --%>
			<button id="down" value="Submit" type="submit" 
				class="btn btn-warning" onclick="changeParam(this);">Submit</button>
			<%-- <form:hidden path="header" id="header" value="${misReportData.header}" /> --%>
		</div>
		</form>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
			<div class="transaction-table">
				<div class="table-responsive">
					<table class="table table-bordered table-striped" id="table_id3">
						<thead class="default">
							<tr>
								<c:forEach items="${reportHeaders}" var="reportHeader">
									<th align="center">${reportHeader}</th>
								</c:forEach>

							</tr>
						</thead>
						<tbody>
						<c:forEach items="${transactions}" var="transaction">
									<tr>
									<td align="center">${transaction.transactionId}</td>
									<td align="center">${transaction.dateTime}</td>
									<td align="center">${transaction.transactionAmount}</td>
									<td align="center">${transaction.openingBalance}</td>
									<td align="center">${transaction.closingBalance}</td>
									<td align="center">${transaction.transactionType}</td>
									<td align="center">${transaction.serviceCharge}</td>
									</tr>
								</c:forEach>
						
							
						</tbody>
					</table>



				</div>
			</div>
		</div>

	</div>

	<%-- </form:form> --%>
</body>
</html>