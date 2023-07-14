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

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<title>UserMIS</title>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":        "400px",
		        "scrollX":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
			  
		  });
	  }
} );

</script>
</head>

<body class="PageType">
	<form:form  method="post"
		modelAttribute="userAccountData">
		
		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<div class="clearfix"></div>
			</div>

<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-bordered table-striped" id="table_id">
	  						<thead class="default">
		  						<tr >
		  						<th align="center">Agent Code</th>
								<th align="center">Agent Name</th>
								<!-- <th align="center">Agent Type</th> -->
								<th align="center">Agent Status</th>
								<th align="center">Parent Code</th>
								<th align="center">Parent Name</th>
								<th align="center">Registration Date</th>
								<th align="center">Agent City</th>
								<th align="center">POS Terminal Id</th>
								<th align="center">POS Terminal Status</th>
								<th align="center">Commission Template</th>
								<%-- <th align="center"><spring:message code="lab_Edit_for_Sim_version_Modification" /></th> --%>
		  						</tr></thead>
	  						<tbody>
	  						<c:forEach items="${agentList}" var="agentListData">
								<tr>
								<td align="left">${agentListData.accountCode}</td>
									 <td align="left">${agentListData.contactPersonName}</td>
									<!-- <td align="left"></td> -->
									 <td align="left">${agentListData.agentstatus}</td>
									<td align="left">${agentListData.parentId}</td>
									<td align="left">${agentListData.parentName}</td>
									<td align="left">${agentListData.createDate}</td>
									<td align="left">${agentListData.city}</td>
									<td align="left"></td>
									
									<td align="left"></td>
									<td align="center"><input type="button" value="view" onclick="getCommissionDetails('${agentListData.companyId}','${agentListData.accountCode}');"></td>
										
									<%-- <td align="center" width="10%"><a
											href="${pageContext.request.contextPath}/AdminUI/commission/getCommissionDetails?id=${agentListData.accountCode}">
												CommissionDetails</a>
										
										
										
										</td> --%>
									
									
									
								</tr>
							</c:forEach>
	  						</tbody>
	  					</table>
	  					
	  					
	  					
						</div>
					</div>
					</div>
					<div id="DataErrorId"></div>
					<div >&nbsp;</div>
					
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="collapse table table-striped table-bordered table-hover " id="template_details">
	  						<thead class="default">
		  						<tr style=color:#e3a122>
		  						<th align="center">Product Name</th>
								<th align="center">Transaction Type</th>
								<th align="center">Host Percentage</th>
								<th align="center">Distributer Percentage</th>
								<th align="center">Sub Distributer Percentage</th>
								
								<%-- <th align="center"><spring:message code="lab_Edit_for_Sim_version_Modification" /></th> --%>
		  						</tr></thead>
	  						<tbody>
	  						
	  					</table>
	  					
	  					
	  					
						</div>
					</div>
					</div>
					
					
					
					
					
			</div>
</form:form>
</body>
</html>