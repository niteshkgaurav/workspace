<%@page import="com.ng.sb.common.model.WalletType"%>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			 		 "scrollY":        "500px",
			        "scrollX":        "600px",
			        "scrollCollapse": true,
			        "paging":         true,
			        "pagingType": "simple_numbers"
		  });
	  }
} );
</script>	
	
</head>


<body class="PageType">
	   		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Wallet Transactions</h1>
	                      <div class="clearfix"></div>
	                      <hr>
</div>

         		
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                              	   	<tr>
	                              	   		<th>AccountType</th>
											<th>Account Number</th>
											<th>Opening Balance</th>
											<th>Amount</th>
											<th>Closing Balance</th>
											<th>Txn Nature</th>
											<th>Date</th>
											<th>Txn Id</th>
											<th>Txn Type</th>
											<th>Subscriber Name</th>
											<th>Company Name</th>
											<th>Company User Name</th>
	                              	   	</tr>
	                              	</thead>
	                              <c:forEach items="${data.walletDetails}" var="walletList">
	                              <tr>
								<%--  <tr id="rowId_${walletList.id}"> --%>
								<td>${walletList.accountType}</td>
								<td>${walletList.accountNumber}</td>
								<td>${walletList.openingBalance}</td>
								<td>${walletList.balance}</td>
								<td>${walletList.closingBalance}</td>
								<td>${walletList.txnNature}</td>
								<td>${walletList.startDate}</td>
								<td>${walletList.txnId}   </td>
								<td>${walletList.txnType}</td>
								<td>${walletList.subscriberId}</td>
								<td>${walletList.companyId}</td>
								<td>${walletList.companyUser}   </td>
							</tr>
						</c:forEach> 
          
				 
	                              </table>
	                             </div>
	                            </div>
	                           </div>
	                           
	                           <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	                           
	  
	
</body>
</html>