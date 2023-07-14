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
	src=${pageContext.request.contextPath}/js/TransactionService.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Transaction Service</title>
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
</head>
<body>
	<div>
		<form:form id="transactionServiceData" method="post"
			modelAttribute="transactionServiceData"
			action="${pageContext.request.contextPath}/AdminUI/portalCreation/transactionServiceSubmit">
			<table width='100%' border='0' cellspacing='1' cellpadding='0'>
				<tr>
					<td height="40" align="center">${message}</td>
				</tr>
				<tr>
					<td align="center">
						<table width='70%' border='0' class='tableMain'
							bordercolor='#000000' cellspacing='1' cellpadding='0'>
							<tr>
								<td colspan='4'></td>
							</tr>
							<tr>
								<td colspan="4"><div align="center" class="mainTableHeader">
										<spring:message code="lab_transaction_service_report" />
									</div></td>
							</tr>
							<tr>
								<td align="right"><font color=red>*&nbsp;</font> <spring:message
										code="label_Chk_for" />&nbsp;:&nbsp;&nbsp;</td>
								<td width="30%"><form:select id="chkFor" path="chkFor" style="width:200px;"
										onchange="getTelcoAndPartner('chkFor','providers');emptyerror(event,'chkForErrorId');">
										<form:option value="0" label="------Select-----" />
	                        			<form:option value="1" label="Telco" />
	        	        				<form:option value="2" label="Partner" />
									</form:select></td>
								<td align="right"><font color=red>*&nbsp;</font> <spring:message
										code="label_Chk_for" />&nbsp;:&nbsp;&nbsp;</td>
								<td width="30%"><form:select id="providers" path="providers" name="providerId" style="width:200px;"
										onchange="emptyerror(event,'providersErrorId');">
										<form:option value="" label="----Select Name----" />
									</form:select></td>
							</tr>
							<tr>
								<td colspan='2'><div id='chkForErrorId' align='center'></div></td>
								<td colspan='2'><div id='providersErrorId' align='center'></div></td>
							</tr>
							<tr>
								<td align='right'><font color='red'>*&nbsp;</font> <spring:message
										code="lab_start_date" />&nbsp;:&nbsp;&nbsp;</td>
								<td width="30%" align='left'><form:input id="lab_start_date"
										path="fromDate" class="datepic" type="text"
										style="width:160px;height:20px;" placeholder="From Date"
										readonly="true"
										onfocus="emptyerror(event,'lab_start_date_ErrorId');" /></td>
								<td align='right'><font color='red'>*&nbsp;</font> <spring:message
										code="lab_end_date" />&nbsp;:&nbsp;&nbsp;</td>
								<td width="30%" align='left'><form:input id="lab_end_date"
										path="toDate" class="datepic" type="text"
										style="width:160px;height:20px;" placeholder="To Date"
										readonly="true" onfocus="emptyerror(event,'lab_end_date_ErrorId')" /></td>
							</tr>
							<tr>
								<td colspan='2'><div id='lab_start_date_ErrorId' align='center'></div></td>
								<td colspan='2'><div id='lab_end_date_ErrorId' align='center'></div></td>
							</tr>
							<tr>
							<td  align="right"><font color=red>*&nbsp;</font> <spring:message
										code="label_transaction_type" />&nbsp;:&nbsp;&nbsp;</td>
								<td width="30%"><form:select id="transactionType" path="transactionType" style="width:200px;"
										onchange="emptyerror(event,'transactionType_ErrorId');">
										<form:option value="" label="----Select transaction type----" />
	                        			<form:option value="1" label="Telco" />
	        	        				<form:option value="2" label="Bill Pay" />
	        	        				<form:option value="3" label="Top Up" />
									</form:select></td>
								<td></td>
							</tr>
							<tr>
								<td colspan='2'><div id='transactionType_ErrorId' align='center'></div></td>
								<td></td>
							</tr>
							<tr>
								<td align="right"><font color='red'>*&nbsp;</font>
								<spring:message code="lab_debit_amount" />&nbsp;&nbsp;:&nbsp;</td>
								<td width="30%" align="left"><form:input id="debitAmount" type="text"
										path="debitAmount" placeholder="debit amount"
										/></td>
							<td align="right"><font color='red'>*&nbsp;</font>
								<spring:message code="lab_credit_amount" />&nbsp;&nbsp;:&nbsp;</td>
								<td width="30%" align="left"><form:input id="creditAmount" type="text"
										path="creditAmount" placeholder="credit amount"
										/></td>
							</tr>
							<tr>
							<td align="right"><font color='red'>*&nbsp;</font>
								<spring:message code="lab_Net_amount" />&nbsp;&nbsp;:&nbsp;</td>
								<td width="30%" align="left"><form:input id="netAmount" type="text"
										path="netAmount" placeholder="net amount"
										/></td>
							<td></td>
							</tr>
							<tr>
								<td colspan='4' align='center'><input type="button"
									onclick="validateTransactionService('transactionServiceData',event);" value="Get Details" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				<tr id='tempDetails'>
					<td colspan="2"  align="center">
						<table width='50%'  class='tableMain cell-border' cellspacing='1' cellpadding='0' border='1' id="template_details">
				 		</table>
						<table>
				 			<tr>
								<td height='5'>&nbsp;</td>
							</tr>
							<tr id="showSubmit" ><td colspan="3" >
						 		<a id="showLink" style="color: #00f;" >Download transaction details</a> 
								</td>
							</tr>
						</table>
		 			</td>
				</tr>
			</table>
			<tr>
			<td>
			<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}"/>
			</td>	
			</tr>
			
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>
</body>
</html>