<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/transactionMISReport.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>	

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" >
jQuery.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
	return {
		"iStart":         oSettings._iDisplayStart,
		"iEnd":           oSettings.fnDisplayEnd(),
		"iLength":        oSettings._iDisplayLength,
		"iTotal":         oSettings.fnRecordsTotal(),
		"iFilteredTotal": oSettings.fnRecordsDisplay(),
		"iPage":          oSettings._iDisplayLength === -1 ?
			0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
		"iTotalPages":    oSettings._iDisplayLength === -1 ?
			0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	};
};

	/* $(document).ready(function() {
		$("#txnDataId").hide();
	
		
	} ); */
	</script>
<title>Transaction MIS Report</title>
</head>
<body onload="getMisData();">
<form:form  modelAttribute="misReportData" method="post" action="${pageContext.request.contextPath}/AdminUI/customerCreation/misReport">
	<div>	
	<table id="mainTable" width='100%' border='0' cellspacing='1' cellpadding='0'>
		<tr>
			<td align="center" colspan="2">
			<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
			<h3 id="ermsgId" align="center" style="color:red;">${errorMessage}</h3>
			</td>
		</tr>
		<tr><td colspan="2" height="25"></td></tr>
		<tr>
			<td colspan="2" align="center">
	  			<table width='60%' border='0'  class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0'>
	  			<tr><td align="center"><table width="100%">
	  				<tr>
	  					<td colspan="2" align="center" class="mainTableHeader"><spring:message code="lab_misReport"/></td>
	  				</tr>
	  				<%--<tr>
	  				 <td align="center">
	  					<table width="90%">
	  					<tr>
	  						<td colspan="2" align="center" class="mainTableHeader"><spring:message code="lab_filter"/></td>
	  					</tr>	
	  					</table>
	  				</td> 
	  				</tr>--%>
	  			<tr><td colspan="2" align="center">
	 			<table width='85%'  style="border: 3px;background: rgba(193, 27, 27, 0.59);" id="txnDataId">
	 			<%-- <tr>
	 				<td colspan="2" align="center" class="mainTableHeader"><spring:message code="lab_txnData"/></td>
	 			</tr> --%>
	 			<tr><td colspan="2" align="center"><div style="height:250px; overflow:auto">
	 			<table width='85%' class="display" style="border: 3px;background: #c10000;" cellspacing="0"  >
	 			<thead>
	 			<tr>
	 				<th align="left"><spring:message code="lab_srno"/></th>
	 				<th align="left"><spring:message code="lab_txnType"/></th>
	 				<th align="left"><spring:message code="lab_status"/></th>
	 				<th align="left"><spring:message code="lab_txnIp"/></th>
	 				<th align="left"><spring:message code="lab_clientStoreId"/></th>
	 				<th align="left"><spring:message code="lab_clientBusinessDate"/></th>
	 				<th align="left"><spring:message code="lab_clientCounterNo"/></th>
	 				<th align="left"><spring:message code="lab_clientOpId"/></th>
	 				<th align="left"><spring:message code="lab_clientTxnId"/></th>
	 				<th align="left"><spring:message code="lab_txnId"/></th>
	 				<th align="left"><spring:message code="lab_txnAmount"/></th>
	 				<th align="left"><spring:message code="lab_custPhnNo"/></th>
	 				<th align="left"><spring:message code="lab_custName"/></th>
	 				<th align="left"><spring:message code="lab_walletName"/></th>
	 				<th align="left"><spring:message code="lab_initiator"/></th>
	 				<th align="left"><spring:message code="lab_userType"/></th>
	 				<th align="left"><spring:message code="lab_parentName"/></th>
	 				<th align="left"><spring:message code="lab_storeName"/></th>
	 			</tr>
	 			</thead>
	 			</table></div>
	 			</td></tr>
	 			</table>
	 			</td></tr>
	 			</table>
	  		</td>
	  	</tr>
	  </table>
	 </td>
	 </tr>
	 </table>
	 </div>
	 
	 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	 
	 </form:form>
</body>
</html>