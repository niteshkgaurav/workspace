<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/portalCommission.js></script>  
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/CommissionTemplate.js></script>
<title>PortalCommissionTemplate</title>
</head>
<body>
	<form:form id="CommissionTemplateCreationForm"
		name="CommissionTemplateCreationForm" method="post"
		modelAttribute="sysCommissionConfigurationData"
		action="${pageContext.request.contextPath}/AdminUI/portalCreation/createPortalCommissionTemplate">
		<table width='70%' border='0' align='center' class='tableMain'
			cellpadding='0' bordercolor='#000000'>
			<tr>
				<td colspan="4"><div align="center" class="mainTableHeader">
						<spring:message code="lab_Portal_Commission_category" />
					</div></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="after_commTempSaved_mess">
						<b><font color="green">${sucessMessage}</font></b>
					</div>
					<div style="margin: 5px;">
						<b><font color="red"><span id="statusmess"></span></font></b>
					</div>
					<div>
						<div valign="120px" id="after_edit_product_mess">
							<b><font color="red">${failureMessage}</font></b>
						</div>

						<table>

							<tr>
								<td height='20'>&nbsp;</td>
							</tr>
							<tr>
								<td align='right'><font color="red">*&nbsp;</font> <spring:message
										code="LABEL_TEMPNAME" />&nbsp;:&nbsp;</td>
								<td><form:input id="tempName" path="name" name="tempName"
										style="width:180px;" type="text" placeholder="Template Name" onclick="emptyerror(event,'errmsgTempName'); emptyerror(event,'after_commTempSaved_mess');"
										maxlength='50' onchange="checkDuplicate();emptyerror(event,'errmsgTempName')"/>
							</tr>
							<tr>
								<td width="25%"></td>
								<td width="25%"><div id="errmsgTempName" align="left"></div></td>
							</tr>
							<tr>
								<td align='right'><spring:message code="LABEL_DESC" />&nbsp;:&nbsp;</td>
								<td><form:textarea id="desc" value="${description}"
										style="width:180px;" path="description"
										placeholder="Template Description" /></td>
							</tr>
							<tr>
								<td align='right'><font color="red">*&nbsp;</font> <spring:message
										code="LABEL_TEMP_TYPE" />&nbsp;:&nbsp;</td>
								<td><form:select style="width:180px;" id="templateCommType"
										name="templateCommType" path="templateCommType" onclick="emptyerror(event,'errmsgTemplateCommType');">
										<form:option value="-1" label="<--Select Type-->" />
										<form:option value="NO" label="No" />
										<form:option value="PORTAL" label="Portal" />
									</form:select> </br> <span id="errmsgTemplateCommType" style="color: red"></span></td>
							</tr>
							<tr>
								<td width="25%"></td>
								<td width="25%"><div id="errmsgTemplateCommType"
										align="left"></div></td>
							</tr>
							<tr>
								<td align='right'><spring:message code="LABEL_TAX" />&nbsp;:&nbsp;</td>
								<td><form:input id="inputTax" path="tax" name="inputTax"
										style="width:80px;" type="text" placeholder="Tax"
										maxlength='6' /></td>
							</tr>
							<tr>
								<td align='right'><spring:message code="LABEL_SURCHARGE" />&nbsp;:&nbsp;</td>
								<td><form:input id="inputSurcharge" path="surcharge"
										name="inputSurcharge" style="width:80px;" type="text"
										placeholder="Surcharge" maxlength='6' /></td>
							</tr>
						</table>

						<table id="lowerMainTable" align='center' width='80%' >
							<tr>
								<td colspan="2" align="center">
									<table id="customerTable" width='80%' border='0' align='center'
										class='tableMain' cellspacing='1' cellpadding='0'
										bordercolor='#000000'>
										<tr>
											<td align="Center"><b><spring:message
														code="LABEL_PORTAl" /></b></td>
										</tr>
										<tr>
											<td align="center">
												<table width='85%' border='0' align='center' valign='center'
													class='tableMain' cellspacing='1' cellpadding='0'
													bordercolor='#000000'>
													<tr>
														<td><font color="red">*&nbsp;</font> <spring:message
																code="LABEL_COMMISSION" />&nbsp;:&nbsp;</td>
														<td><form:select style="width:180px;"
																id="customerCommission" path="senderCommDesc">
																<form:option value="-1" label="<--Select Commission-->" />
																<form:option value="AMT" label="Amount" />
																<form:option value="PERC" label="Percentage" />
															</form:select> </br> <span id="errmsgCustomerCommission" style="color: red"></span>
														</td>
													</tr>
													<tr>
														<td><font color="red">*&nbsp;</font> <spring:message
																code="LABEL_TEMP_TYPE" />&nbsp;:&nbsp;</td>
														<td><form:select id="customerCommissionType"
																name="customerCommissionType" style="width:180px;"
																path="senderCommType">
																<form:option value="-1" label="<--Select Type-->" />
																<form:option value="FIXED" label="Fixed" />
																<form:option value="RANGE" label="Range" />
															</form:select> <span id="errmsgCustomerCommissionType"
															style="color: red"></span></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td align='center'>
												<table width='85%' align='center' class='tableMain'
													cellspacing='1' cellpadding='0' border='0'
													bordercolor='#000000' id="customerFixedTable"
													name="customerFixedTable">
													<tr>
										<td><font color="red">*&nbsp;</font> <spring:message
												code="LABEL_VALUE" />&nbsp;:&nbsp;
										<form:input id="custCommFixedValue"
												path="senderCommFixedValue" name="custCommFixedValue"
												style="width:98px;" type="text" placeholder="Value"
												maxlength='7' /> </br> <span
											id="errmsgCustomerCommissionFixedValue" style="color: red"></span></td>
									</tr>
									<%-- <tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="LABEL_MIN" /> : <form:input
												id="custCommFixedMin" path="senderCommMin"
												name="custCommFixedMin" style="width:100px;" type="text"
												placeholder="Min Value" maxlength='7' /> </br> <span
											id="errmsgCustomerCommissionMinValue" style="color: red"></span></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="LABEL_MAX" /> : <form:input
												id="custCommFixedMax" path="senderCommMax"
												name="custCommFixedMax" style="width:98px;" type="text"
												placeholder="Max Value" maxlength='7' /> </br> <span
											id="errmsgCustomerCommissionMaxValue" style="color: red"></span></td>
									</tr> --%>
												</table>
											</td>
										</tr>
										<tr>
											<td align="center">
												<table width='80%' id="customerRangeMainTable"
													name="customerRangeMainTable">
													<tr id="customerRangeTableId">
														<td align="center">
															<table id="customerRangeTable" name="customerRangeTable"
																width='85%' border='0' align='left' valign='center'
																class='tableMain' cellspacing='1' cellpadding='0'
																bordercolor='#000000'>
																<tr>
																	<td><spring:message code="LABEL_FROM" /></td>
																	<td><spring:message code="LABEL_TO" /></td>
																	<td><spring:message code="LABEL_VALUE" /></td>
																</tr>
															</table>
															
														</td>
													</tr>
													<tr id="custCommFixedMinId">
														<td><spring:message code="LABEL_MIN" /> : 
														<form:input id="custCommFixedMin"
																path="senderCommMin" name="custCommFixedMin"
																style="width:100px;" type="text" placeholder="Min Value"
																maxlength='7' /> </br> <span
															id="errmsgCustomerCommissionMinValue" style="color: red"></span></td>
													</tr>
													<tr id="custCommFixedMaxId">
														<td><spring:message code="LABEL_MAX" /> :
														<form:input id="custCommFixedMax"
																path="senderCommMax" name="custCommFixedMax"
																style="width:98px;" type="text" placeholder="Max Value"
																maxlength='7' /> </br> <span
															id="errmsgCustomerCommissionMaxValue" style="color: red"></span></td>
													</tr>
													<tr>
														<td colspan="2"><div id='errmsgCustomerRangeValue' align='center'></div></td>
													</tr>
													<tr id="addButtonId">
														<td><INPUT type="button" value="Add Row"
															onclick="addRow('customerRangeTable','PORTAL')" /> 
															<INPUT type="button" value="Delete Row"
															onclick="deleteRow('customerRangeTable')" /> </br> <!-- <span
															id="errmsgCustomerRangeValue" style="color: red"></span> --></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr height='15'>
				<td colspan='2' align='center'><input type='submit'
					value="submit"
					onClick="submitForm('CommissionTemplateCreationForm',event);"></td>
			</tr>
		</table>
		
			 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>