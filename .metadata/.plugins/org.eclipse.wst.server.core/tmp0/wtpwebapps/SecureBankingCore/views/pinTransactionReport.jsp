<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/pinTransactionReport.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Pin Transaction Report</title>
<script>
	$(function() {
		var pickerOpts = {
			showOn : "button",
			buttonImage : "${pageContext.request.contextPath}/images/datepicker2.png",
			changeMonth : true,
			changeYear : true,
			yearRange : '1950:2016',
			dateFormat : 'yy-mm-dd',
		};
		$(".datepic").datepicker(pickerOpts);
	});
</script>
<script type="text/javascript">
	//Plug-in to fetch page data 
	jQuery.fn.dataTableExt.oApi.fnPagingInfo = function(oSettings) {
		return {
			"iStart" : oSettings._iDisplayStart,
			"iEnd" : oSettings.fnDisplayEnd(),
			"iLength" : oSettings._iDisplayLength,
			"iTotal" : oSettings.fnRecordsTotal(),
			"iFilteredTotal" : oSettings.fnRecordsDisplay(),
			"iPage" : oSettings._iDisplayLength === -1 ? 0 : Math
					.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
			"iTotalPages" : oSettings._iDisplayLength === -1 ? 0 : Math
					.ceil(oSettings.fnRecordsDisplay()
							/ oSettings._iDisplayLength)
		};
	};

	$(document).ready(function() {
		$("#example").hide();

	});
</script>
</head>
<body>
	<div>
		<form:form id="transactionReportData" method="post"
			modelAttribute="transactionReportData"
			action="${pageContext.request.contextPath}/AdminUI/portalCreation/pinReportSubmit">
			<table width='100%' border='0' cellspacing='1' cellpadding='0'>
				<tr>
					<td height="40" colspan="4" align="center">${message}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<table width='70%' border='0' class='tableMain'
							bordercolor='#000000' cellspacing='1' cellpadding='0'>
							<tr>
								<td colspan='2'></td>
							</tr>
							<tr>
								<td colspan="2"><div align="center" class="mainTableHeader">
										<spring:message code="lab_pin_transaction_report" />
									</div></td>
							</tr>
							<tr><td height="10px"></td></tr>
							<tr>
								<td align='right'><font color='red'>*&nbsp;</font> <spring:message
										code="lab_start_date" />&nbsp;:&nbsp;&nbsp;</td>
								<td align='left'><form:input id="lab_start_date"
										path="fromDate" class="datepic" type="text"
										style="width:160px;height:20px;" placeholder="From Date"
										readonly="true"
										onfocus="emptyerror(event,'dateErrorId');emptyerror(event,'start_dateErrorId')" /></td>
							</tr>
							<tr>
								<td></td>
								<td align='left'><div id='start_dateErrorId'></div></td>
							</tr>
							<tr><td height="8px"></td></tr>
							<tr>
								<td align='right'><font color='red'>*&nbsp;</font> <spring:message
										code="lab_end_date" />&nbsp;:&nbsp;&nbsp;</td>
								<td align='left'><form:input id="lab_end_date"
										path="toDate" class="datepic" type="text"
										style="width:160px;height:20px;" placeholder="to Date"
										readonly="true" onfocus="emptyerror(event,'dateErrorId')" /></td>
							</tr>
							<tr>
								<td></td>
								<td align='left'><div id='dateErrorId'></div></td>
							</tr>
                            <tr><td height="8px"></td></tr>
							<tr>
								<td align="right"><font color=red>*&nbsp;</font> <spring:message
										code="lab_portal_name" />&nbsp;:&nbsp;&nbsp;</td>
								<td align="left"><form:select id="portalName" path="portalNameValue" style="width:150px;"
										onchange="emptyerror(event,'lab_portalName_ErrorId')">
										<form:option value="" label="<------Select-------->" />
										<form:options items="${transactionReportData.portalName}" />
									</form:select></td>
							</tr>
							<tr>
								<td></td>
								<td align='left'><div id='lab_portalName_ErrorId'></div></td>
							</tr>
                          <tr><td height="8px"></td></tr>
							<tr>
								<td colspan='2' align='center'><input type="button"
									onclick="validTransactionForm(event);" value="Get Details" /></td>
							</tr>
							<tr><td height="10px"></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table width='100%' class="tableMain"
							cellspacing='1' cellpadding='0' border='1' bordercolor='#000000'
							id="pinTransReport">
						</table>
						<table width='100%' class='tableMain cell-border' cellspacing='1'
							cellpadding='0' border='1' bordercolor='#000000'
							id="pinDetailsReport">
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>
</body>
</html>