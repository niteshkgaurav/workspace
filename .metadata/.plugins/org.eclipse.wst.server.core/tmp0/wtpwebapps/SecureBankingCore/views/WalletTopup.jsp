<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/walletTopup.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>		
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wallet Topup</title>
</head>
<body>
<form:form  modelAttribute="walletTopupData" method="post" action="${pageContext.request.contextPath}/AdminUI/customerCreation/walletTopup">
	<div>	
	<table id="mainTable" width='100%' border='0' cellspacing='1' cellpadding='0'>
		<tr><td colspan="2" height="25"></td></tr>
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
	  					<td colspan="2" align="center" class="mainTableHeader"><spring:message code="lab_walletTopup"/></td>
	  				</tr>
	  				<tr>
	  					<td align="right"><spring:message code="lab_contactNumber"/>&nbsp;&nbsp;:&nbsp;</td>
	  					<td align="left"><form:input type="text" path="contactNumber" placeholder="Contact Number"  maxlength='10' onclick="emptyerror(event,'lab_contactNumberErrorId');emptyerror(event,'msgId');emptyerror(event,'ermsgId');emptyerror(event,'walletTopupTotalErrorId');" onkeypress="onlyNumric(event,'lab_contactNumberErrorId');" onchange="checkDuplicatePhoneNumber(event,'msgId');"/></td>
	  				</tr>
	  				<tr><td></td><td><div id="lab_contactNumberErrorId"></div></td></tr>
	  				<tr><td align="right"><input type="button" value="Clear" onclick="clearAllData('detailsId','contactNumber');">&nbsp;&nbsp;&nbsp;</td><td align="left"><input type="button" value="Fetch" onclick="fetchWalletTopupData('contactNumber');"></td></tr>
	  				</table></td></tr>
	  				<tr id="detailsId" style="display:none"><td><table width="100%" border="0">
	  				<tr>
	  					<td align="right"><spring:message code="lab_type"/>&nbsp;&nbsp;:&nbsp;</td>
	  					<td align="left">
	  						<form:input id="typeId" path="type" onclick="emptyerror(event,'lab_typeErrorId');" style="width: 150px" readonly="true"/>
						</td>
	  				</tr>
	  				<tr><td></td><td><div id="lab_typeErrorId"></div></td></tr> 
	  				<tr>
								<td align="right"><spring:message code="lab_customerName"/>&nbsp;&nbsp;:&nbsp;</td>
								<td align="left"><form:input type="text" path="customerName" placeHolder="Customer Name" readonly="true" onclick="emptyerror(event,'lab_customerNameErrorId');"/></td>
					</tr>
					<tr><td></td><td><div id="lab_customerNameErrorId"></div></td></tr>
	  				<tr>
	  					<td colspan="2" align="center">
	  						<table id='lab_Address' width='90%' border='0' class='thickBorder' cellspacing='1' cellpadding='1'>
							<tr>
								<td height="5" colspan="2"></td>
							</tr>
							<tr align='center' style='height: 30'>
								<td align='left' colspan="2">&nbsp;<u><spring:message
											code="lab_Address" /></u></td>
							</tr>
							<tr>
								<td height="5" colspan="2"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<table width='100%' border='0'>
										<tr>
											<td class='tableLabel' width='25%' align='right'><spring:message code="lab_HouseNoStreet" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:input id="houseNoId" path="houseNo" type="text" readonly="true"
													onkeypress="blockSpecialChar(event,'houseNoStreetErrorId');"
													placeholder="HouseNo & Street" maxlength='30' /></td>
											<!--------------------  City Name ---------------------------------------------------------->
											<td class='tableLabel' width='25%' align='right'><spring:message code="lab_City" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:input id="cityId" path="city" type="text" readonly="true"
													onkeypress="blockSpecialChar(event,'cityErrorId');"
													placeholder="City" maxlength='30' /></td>
										</tr>
										<tr>
											<td colspan='2'><div id='houseNoStreetErrorId' align='center'></div></td>
											<td colspan='2'><div id='cityErrorId' align='center'></div></td>
										</tr>
										<!--------------------  LandMark ---------------------------------------------------------->
										<tr>
											<td class='tableLabel' align='right'><spring:message code="lab_LandMark" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='20%' align='left'><form:input id="lab_LandMark" path="landMark" type="text" readonly="true"
													onkeypress="blockSpecialChar(event,'landMarkErrorId');"
													placeholder="Landmark" maxlength='50' /></td>
											<td colspan='3'><div id='landMarkErrorId' align='center'></div></td>

										</tr>
										<!--------------------  Country ---------------------------------------------------------->
										<tr>
											<td width='25%' class='tableLabel' align='right'><spring:message
													code="lab_Country" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='25%' align='left'><form:input type="text" id="countryId" path="countryId" readonly="true"
													onchange="emptyerror(event,'countryErrorId');"
													style="width: 150px"/>
											</td>
											<!--------------------   State ---------------------------------------------------------->
											<td width='25%' class='tableLabel' align='right'><spring:message
													code="lab_State" />&nbsp;:&nbsp;</td>
											<td width='25%' align='left'><form:input id="stateId" type="text" path="stateId" style="width: 150px" readonly="true"
													onchange="emptyerror(event,'stateErrorId');"/>
											</td>
										</tr>
										<tr>
											<td colspan='2'><div id='countryErrorId' align='center'></div></td>
											<td colspan='2'><div id='stateErrorId' align='center'></div></td>
										</tr>
										<tr>
											<!--------------------   Pin ---------------------------------------------------------->
											<td class='tableLabel' align='right'><spring:message
													code="lab_Pin" />&nbsp;:&nbsp;&nbsp;</td>
											<td width='50' align='left'><form:input id="pinCodeId" path="pinCode" name="pinCode" type="text" readonly="true"
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
	  				<tr><td height="20"></td></tr>
					<tr>
						<td colspan="2" align="center">
							<table width='85%' class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' border="1" id="walletTopupTableId">
								
							</table>
						</td>
					</tr>
					<tr><td colspan="2"><div id="walletTopupTableIdErrorId"></div></td></tr>
					<tr><td height="20"></td></tr>
	  				<tr><td colspan="2" align="right" class="login button"><input type="submit"  value="Submit"  onclick="walletTopupValidate(event);"/>&nbsp;&nbsp;&nbsp;</td></tr>
	  			</table>
	  		</td>
	  	</tr>
	</table></td></tr>
		<tr><td colspan="2" align="center"><div id="walletTopupTotalErrorId"></div></td></tr>
		</table>
	</div>
	
	 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>
</html>