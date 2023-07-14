<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<style type="text/css">
#containersimg {
	height: 80px;
	overflow: auto;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/customerCreation.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/customerCreation.js"></script>
</head>
<body>
	<div>
		<form:form method="post" modelAttribute="customerRegistrationData"
			id="customerEditForm"
			action="${pageContext.request.contextPath}/AdminUI/customerCreation/customerEditSubmit"
			enctype="multipart/form-data">

			<table width='75%' border='0' align='center' class='tableMain'
				cellspacing='1' cellpadding='0' bordercolor='#000000'>
				<tr>
					<td colspan="2"><div align="center" class="mainTableHeader">
							<spring:message code="lab_customer_reg_Title" />
						</div></td>
				</tr>
				<tr>
					<td colspan='2' align="center">
						<h3 id="msgId" align="center" style="color: green;">${successMessage}</h3>
						<h3 id="errorId" align="center" style="color: red;">${errorMessage}</h3>
					</td>
				</tr>
				<tr>
					<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font>
						<spring:message code="lab_customerFirstName" />&nbsp;:&nbsp;&nbsp;</td>
					<td colspan='' align='left'><form:input style="width: 200px"
							id="customerFirstName" path="customerFirstName" name="customerFirstName"
							type="text"
							onkeypress="onlyAlphabet(event,'customerNameErrorId');"
							onclick="emptyerror(event,'customerNameErrorId')"
							placeholder="Customer First Name" maxlength='50'
							onchange="checkDuplicateBankName()" /></td>
				</tr>
				<tr>
					<td colspan='2'><div id='customerNameErrorId' align='center'></div></td>
				</tr>
				<tr>
					<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font>
						<spring:message code="lab_customerLastName" />&nbsp;:&nbsp;&nbsp;</td>
					<td colspan='' align='left'><form:input style="width: 200px"
							id="customerLastName" path="customerLastName" name="customerLastName"
							type="text"
							onkeypress="onlyAlphabet(event,'customerLastNameErrorId');"
							placeholder="Customer Last Name" maxlength='50'
							onchange="checkDuplicateBankName()" /></td>
				</tr>
				<tr>
					<td colspan='2'><div id='customerLastNameErrorId' align='center'></div></td>
				</tr>
				<tr>
					<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font>
						<spring:message code="lab_customerMobileNumber" />&nbsp;:&nbsp;&nbsp;</td>
					<td colspan='' align='left'><form:input style="width: 200px"
							id="customerMobileNumber" path="customerMobileNumber"
							name="customerMobileNumber" type="text"
							onkeypress="onlyNumric(event,'customerMobileNumberErrorId')"
							placeholder="Mobile Number" maxlength='10'
							onchange="checkDuplicatePhoneNumbers(event,'msgId')" /></td>
				</tr>
				<tr>
					<td colspan='2'><div id='customerMobileNumberErrorId'
							align='center'></div></td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				<tr>
					<td colspan='2' align="center">
						<table id='lab_Address' align="center" width='60%' border='0'
							class='thickBorder' cellspacing='1' cellpadding='1'>
							<tr>
								<td height="5"></td>
							</tr>
							<tr align='center' style='height: 30'>
								<td align='left' colspan='4'>&nbsp;<u><spring:message
											code="lab_Address" /></u></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr style='height: 20'>
								<td>
									<table width='100%' border='0'>
										<tr>
											<td class='tableLabel' width='25%' align='right'><spring:message
													code="lab_HouseNoStreet" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:input id="houseNoId"
													path="houseNo" name="houseNo" type="text"
													onkeypress="blockSpecialChar(event,'houseNoStreetErrorId');"
													placeholder="HouseNo & Street" maxlength='30' /></td>
											<!--------------------  City Name ---------------------------------------------------------->
											<td class='tableLabel' width='25%' align='right'><spring:message
													code="lab_City" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:input id="cityId"
													path="city" name="city" type="text"
													onkeypress="blockSpecialChar(event,'cityErrorId');"
													placeholder="City" maxlength='30' /></td>
										</tr>
										<tr>
											<td colspan='2'><div id='houseNoStreetErrorId'
													align='center'></div></td>
											<td colspan='2'><div id='cityErrorId' align='center'></div></td>
										</tr>
										<!--------------------  LandMark ---------------------------------------------------------->
										<tr>
											<td class='tableLabel' align='right'><spring:message
													code="lab_LandMark" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='20%' align='left'><form:input
													id="lab_LandMark" path="landMark" name="landMark"
													type="text"
													onkeypress="blockSpecialChar(event,'landMarkErrorId');"
													placeholder="Landmark" maxlength='50' /></td>
											<td colspan='3'><div id='landMarkErrorId' align='center'></div></td>

										</tr>
										<!--------------------  Country ---------------------------------------------------------->
										<tr>
											<td width='25%' class='tableLabel' align='right'><spring:message
													code="lab_Country" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:select id="countryId"
													path="countryId"
													onchange=" getStates('countryId','stateId');emptyerror(event,'countryErrorId');"
													style="width: 150px">
													<form:option value="0" label="<-----Select----->" />
													<form:options
														items="${customerRegistrationData.countryMap}" />
												</form:select></td>
											<!--------------------   State ---------------------------------------------------------->
											<td width='25%' class='tableLabel' align='right'><spring:message
													code="lab_State" />&nbsp;:&nbsp;</td>
											<td width='25%' align='left'><form:select id="stateId"
													path="stateId" style="width: 150px"
													onchange="emptyerror(event,'stateErrorId');">
													<form:option value="0" label="<-----Select----->" />
													<form:options items="${customerRegistrationData.stateMap}" />
												</form:select></td>
										</tr>
										<tr>
											<td colspan='2'><div id='countryErrorId' align='center'></div></td>
											<td colspan='2'><div id='stateErrorId' align='center'></div></td>
										</tr>
										<tr>
											<!--------------------   Pin ---------------------------------------------------------->
											<td class='tableLabel' align='right'><spring:message
													code="lab_Pin" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='50' align='left'><form:input id="pinCodeId"
													path="pinCode" name="pinCode" type=""
													placeholder="Pin Code" maxlength="6"
													onpaste="return validateNumeric(event,'pinCodeErrorId')"
													onkeypress="onlyNumric(event,'pinCodeErrorId');" /></td>
										</tr>
										<tr>
											<td colspan="2"><div id='pinCodeErrorId' align='right'></div></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				
				
				<tr>
								<td height="5"></td>
				</tr>
				<tr>
					<td colspan='2' align="center">
						<table id='lab_Address' align="center" width='60%' border='0'
							class='thickBorder' cellspacing='1' cellpadding='1'>
							<tr>
								<td height="5"></td>
							</tr>
							<tr align='center' style='height: 30'>
								<td align='left' colspan='4'>&nbsp;<u><spring:message
											code="lab_Assign_Wallet" /></u></td>
							</tr>
							<tr>
								<td height="5"></td>
							</tr>
							<tr style='height: 20'>
								<td>
									<table width='100%' border='0' id='walletTableId'>
										<tr class="mainTableHeader">
											<th align="center"><input type="checkbox"
												id="alldenominator_0" value="0" onclick="selectAllFunc();" /></th>
											<!-- <spring:message code="lab_select"/> -->
											<th align="center"><spring:message code="lab_select" />
											</th>
										</tr>
										<c:forEach var="listVar"
											items="${customerRegistrationData.walletInfo}">
											<tr>
												<td align="center" width="10%"><form:checkbox
														id="denominator_${listVar.key}" path="walletList"
														value="${listVar.key}"
														onclick="clearfunc(alldenominator_0,walletErrorId);setDisable('denominator_${listVar.key}','${listVar.key}');" /></td>
												<td align="center">${listVar.value}</td>
												</tr></c:forEach>
												<tr>
								<td colspan="2"><div id='walletErrorId' align='center'></div></td>
							</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
								<td align="right"><spring:message code="LABEL_STATUS" /></td>
								<td><form:select id="accountStatus" path="status"
										name="accountStatus">
										<form:option value="0" label="Enabled" />
										<form:option value="1" label="Disabled" />
									</form:select></td>
							</tr>
				<tr>
					<td colspan='2' align='center'><input type="submit"
						value="Update"
						onclick="return validateCustomerRegistration('customerEditForm',event);" /></td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				<tr>
					<td colspan='2' align='center'>

						<h3 align="center" style="color: green;">${msg}</h3>
					</td>
				</tr>
			</table>
			<tr>
				<td><input type="hidden" id="contextPath" name="contextPath"
					value="${pageContext.request.contextPath}" /></td>
					<input type="hidden" id="customerId" name="customerId"
				value="${customerId}">
			</tr>
			
			
			 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>

</body>
</html>