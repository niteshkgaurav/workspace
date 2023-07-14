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
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/customerCreation.js"></script>
</head>
<body>
	<div>
		<form:form method="post" modelAttribute="customerRegistrationData"
			id="customerForm"
			action="${pageContext.request.contextPath}/AdminUI/customerCreation/customerCreationSubmit"
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
							id="customerFirstName" path="customerFirstName"
							name="customerFirstName" type="text"
							onkeypress="onlyAlphabet(event,'customerNameErrorId');"
							onclick="emptyerror(event,'customerNameErrorId');clearmsgId(msgId);"
							placeholder="Customer First Name" maxlength='50'
							/></td>
				</tr>
				<tr>
					<td colspan='2'><div id='customerNameErrorId' align='center'></div></td>
				</tr>
				<tr>
					<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font>
						<spring:message code="lab_customerLastName" />&nbsp;:&nbsp;&nbsp;</td>
					<td colspan='' align='left'><form:input style="width: 200px"
							id="customerLastName" path="customerLastName"
							name="customerLastName" type="text"
							onkeypress="onlyAlphabet(event,'customerLastNameErrorId');"
							onclick="emptyerror(event,'customerLastNameErrorId');clearmsgId(msgId);"
							placeholder="Customer Last Name" maxlength='50'
							 /></td>
				</tr>
				<tr>
					<td colspan='2'><div id='customerLastNameErrorId'
							align='center'></div></td>
				</tr>
				<tr>
					<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font>
						<spring:message code="lab_customerMobileNumber" />&nbsp;:&nbsp;&nbsp;</td>
					<td colspan='' align='left'><form:input style="width: 200px"
							id="customerMobileNumber" path="customerMobileNumber"
							name="customerMobileNumber" type="text"
							onchange="checkDuplicatePhoneNumbers(event,'msgId')"
							onkeypress="onlyNumric(event,'customerMobileNumberErrorId')"
							onclick="emptyerror(event,'customerMobileNumberErrorId');clearmsgId(msgId);"
							placeholder="Mobile Number" maxlength='10'
							 /></td>
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
							<tr>
											<td colspan="2" align="right"><spring:message
													code="lab_customerFirstName" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text"
													path="firstName" placeholder="First Name" /></td>
											<td colspan="2" align="right"><spring:message
													code="lab_customerLastName" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text" path="lastName"
													placeholder="Last Name" /></td>
										</tr>
										<tr>
										
											<td><div id="lab_customerFirstNameErrorId"></div></td>
											
											<td><div id="lab_customerLastNameErrorId"></div></td>
										</tr>
										<tr>
											<td colspan="2" align="right"><spring:message code="lab_pinCode" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left" width='18%'><form:input type="text"
													path="pinCode" placeholder="Pin Code" /></td>
											<td align="left"><input type="button"
												id="addressFetchId" value="Fetch Address"
												onclick="fetchAddress();" /></td>
										</tr>
										<tr>
											<td><div id="lab_pinCodeErrorId"></div></td>
											<td colspan="2"></td>
										</tr>


										<tr>
											<td colspan="4"><div id='addressSelectDivId'
													style='display: none'>
													<table border="1" cellpadding='0' width='100%'
														id='addressSelectTableId'>
													</table>
												</div></td>
										</tr>
										<tr>
											<td align="right"><spring:message code="lab_address" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text" path="address"
													placeholder="Address" /></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td></td>
											<td><div id="lab_addressErrorId"></div></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td align="right"><spring:message code="lab_locality" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left" width='25%'><form:input type="text"
													path="locality" placeholder="Locality" /></td>
											<td align="right"><spring:message code="lab_Region" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text" path="region"
													placeholder="Region" /></td>
										</tr>
										<tr>
											<td></td>
											<td><div id="lab_localityErrorId"></div></td>
											<td></td>
											<td><div id="lab_regionErrorId"></div></td>
										</tr>
										<tr>
											<td align="right"><spring:message code="lab_district" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left" width='25%'><form:input type="text"
													path="district" placeholder="District" /></td>
											<td align="right"><spring:message code="lab_State" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text" path="state"
													placeholder="State" /></td>
										</tr>
										<tr>
											<td></td>
											<td><div id="lab_districtErrorId"></div></td>
											<td></td>
											<td><div id="lab_StateErrorId"></div></td>
										</tr>
										<tr>
											<td align="right"><spring:message code="lab_Country" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input type="text" path="country"
													placeholder="Country" /></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td></td>
											<td><div id="lab_CountryErrorId"></div></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td align="right"><font color="red">*&nbsp;</font>
											<spring:message code="lab_dob" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input id="datepick" type="text"
													path="dob" placeholder="DOB" /></td>
											<td align="right"><spring:message code="lab_Email_Id" />&nbsp;&nbsp;:&nbsp;</td>
											<td align="left"><form:input id='emailId' type="text"
													path="email" placeholder="E-mail"
													onchange="emailValidation(event,'emailId','lab_Email_IdErrorId')"
													onclick="emptyerror(event,'lab_Email_IdErrorId');" /></td>
										</tr>
										<tr>
											<td></td>
											<td><div id="lab_dobErrorId"></div></td>
											<td></td>
											<td><div id="lab_Email_IdErrorId"></div></td>
										</tr>

									</table>
								</td>
							</tr>
						</table>
					</td>
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
										<tr class="mainTableHeader" >
											<th align="center"><input type="checkbox"
												id="alldenominator_0" value="0" onclick="selectAllFunc();" 
												
												/></th>
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
														onclick="clearfunc(alldenominator_0,walletErrorId)" /></td>
												<td align="center">${listVar.value}</td>
												</tr></c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2"><div id='walletErrorId' align='center'></div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height='0'>&nbsp;</td>
				</tr>
				<tr>
					<td colspan='2' align='center'><input type="submit"
						value="Submit"
						onclick="return validateCustomerRegistration('customerForm',event);"
						/></td>
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
			</tr>
			
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>

</body>
</html>