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
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/MIS.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>


<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
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

</script>
</head>
<body class="PageType">
		<form:form 	id="mis" method="post"  modelAttribute="misReportData"
			action="${pageContext.request.contextPath}/AdminUI/miscontroller/updatewalletTransactionSummary">
			<input type="hidden" id="action" name="action"/>
			
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Wallet Transactions</h1>
	                      <div class="clearfix"></div>
	                       <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
	                    </div>
	                    
	                    <div class="row">
	                    
	                    
	                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
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
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
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
	                    
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		 <c:if test="${not empty misReportData.hostMap}">
				 <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
	                        <div class="styled-input" id="hostDiv">
	                        
			                          <form:select class="selecttag" path="host" id="host" onclick="emptyerror(event,'productError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getDistributor(this,'distributor','subDistributor');selecttag('hostId','host');" 
			                           onfocus="removeHasError('hostDiv');showlabel('hostId','hostError');emptyerror(event,'hostError')"
			                          	onkeypress="emptyerror(event,'hostError');">
			                          <form:option value="" label=" " />
												<form:options items="${misReportData.hostMap}" />
															</form:select>
			                           
			                           <label id="hostId" class="valid">Select PayTm</label>
			                          <label id="hostError" class="collapse"></label>
	                          </div>
	                      </div>
	                      </c:if>
	                       <c:if test="${not empty misReportData.distMap || not empty misReportData.hostMap}">
	                      	 <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
	                        <div class="styled-input" id="distDiv">
			                          <form:select class="selecttag" path="distributor" id="distributor" onclick="emptyerror(event,'productError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getSubdistributor(this,'host','subDistributor');selecttag('distId','distributor');" 
			                           onfocus="removeHasError('distDiv');showlabel('distId','distError');emptyerror(event,'distError')"
			                          	onkeypress="emptyerror(event,'distError');">
			                          <form:option value="" label=" " />
												 <form:options items="${misReportData.distMap}" /> 
															</form:select>
			                           
			                           <label id="distId" class="valid">Select Partner</label>
			                          <label id="distError" class="collapse"></label>
	                          </div>
	                      </div>
	                      </c:if>
	                        <c:if test="${not empty misReportData.subDistMap || not empty misReportData.hostMap ||not empty misReportData.distMap}">
	                      	 <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
	                        <div class="styled-input" id="subDistDiv">
			                          <form:select class="selecttag" path="subDistributor" id="subDistributor" onclick="emptyerror(event,'subDistError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="selecttag('subDistId','subDistributor');" 
			                           onfocus="removeHasError('subDistDiv');showlabel('subDistId','subDistError');emptyerror(event,'subDistError')"
			                          	onkeypress="emptyerror(event,'subDistError');">
			                          <form:option value="" label=" " />
												 <form:options items="${misReportData.subDistMap}" /> 
															</form:select>
			                           
			                           <label id="subDistId" class="valid">Select Mall</label>
			                          <label id="subDistError" class="collapse"></label>
	                          </div>
	                      </div>
	                      </c:if>
	                      
		 <c:if test="${not empty misReportData.subDistMap || not empty misReportData.hostMap ||not empty misReportData.distMap}">
		<button id="go" value="Go" type="submit"  class="btn btn-warning" onclick="changeParam(this);">Go</button>
		</c:if>
		<button id="down" value="Download" type="submit" name="download" class="btn btn-warning" onclick="changeParam(this);">Download</button>
		<form:hidden path="header" id="header" value="${misReportData.header}" />
		</div>

		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive" >
                     <table class="table table-bordered table-striped" id="table_id">
	  						<thead class="default">
		  						<tr >
		  						<th align="center">Account No. </th>
								<th align="center">Account Type</th>
								<th align="center">Transaction Date</th>
								<th align="center">Opening Balance</th>
								<th align="center">Amount</th>
								<th align="center">Closing Balance</th>
								<th align="center">Transaction Nature</th>
								<th align="center">Particulars</th>
		  						</tr></thead>
	  						<tbody>
	  						<c:forEach items="${misReportData.transactionsList}" var="data">
								<tr>
								 <td align="left">${data.accountNo}</td>
									 <td align="left">${data.accntType}</td>
									 <td align="left">${data.txnDate}</td>
									<td align="left">${data.openingBalance}</td>
									<td align="left">${data.amount}</td>
									<td align="left">${data.closingBalance}</td>
									<td align="left">${data.txnNature}</td>
									<td align="left">${data.particulars}</td>
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