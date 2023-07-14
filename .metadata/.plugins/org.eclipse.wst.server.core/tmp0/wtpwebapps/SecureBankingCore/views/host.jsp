<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/custom.js></script>
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
</head>
<body>
	<form:form id="accountCreationForm1" name="accountCreationForm1"
		method="post" modelAttribute="accountCreationData"
		action="${pageContext.request.contextPath}/AdminUI/account/accountCreationSubmit">

		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">
				<spring:message code="LABEL_ACCOUNT_CREATION" />
			</h1>
			<div class="clearfix"></div>
			<hr>
			<c:if test="${MessageAfterBCRegistration!=''}">
				<div id="successMessageId"
					class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p><font color="green">${MessageAfterBCRegistration}</font></p>
				</div>
			</c:if>
		</div>
		
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_companyNameId" class="styled-input">
					<form:input id="companyNameId" path="companyName"
						name="companyName" class='selecttag' type="text"
						onkeypress="blockSpecialChar(event,'companyNameErrorId','companyNameId1'); "
						maxlength='100' onclick="emptyerror(event,'companyNameErrorId');"
						onchange="return checkDuplicateAccount();selecttag('companyNameId1','companyNameId');"
						onfocus="showlabel('companyNameId1','companyNameErrorId');removeHasError('div_companyNameId')" />

					<label id="companyNameId1">*&nbsp;Company Name</label> <label
						id="companyNameErrorId" class="collapse"
						style="display: inline-block;"></label><span></span>
				</div>
			</div>


			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div  class="styled-input">
					<spring:message code="lab_pinCode" var="lab_pinCode" />
					<form:input type="text" maxlength="6" path="pinCode"
						class='selecttag' id="pinCode"
						onclick="emptyerror(event,'lab_pinCodeErrorId');"
						onkeypress="onlyNumricForPin(event,'lab_pinCodeErrorId','${lab_pinCode}'); "
						onfocus="showlabel('pinCodeId','lab_pinCodeErrorId');"
						onchange="selecttag('pinCodeId','pinCode');pinValidation(); changePinCode('${readonlyValue}');" />
					<label id="pinCodeId">${lab_pinCode}</label> <label
						id="lab_pinCodeErrorId" class="collapse"></label><span></span>
					<!-- <div <spring:message code="account.pincode"/>><input type="button"
									id="addressFetchId" value="Fetch Address" onclick="fetchAddress();"/></div> -->
				</div>
			</div>
			<!-- committing due to applying bootstrap on 23-06-2017 		
								
								<tr><td></td>
											<td><div id="lab_pinCodeErrorId"></div></td>
											<td colspan="2"><div id="buttonClickErrorId"></div></td>
										</tr>-->
			<!-- TODO committing due to applying bootstrap on 23-06-2017
										<tr> 
											<td colspan="4"><div id='addressSelectDivId'
													style='display: none'>
													<table border="1" cellpadding='0' width='100%'
														id='addressSelectTableId'>
													</table>
												</div></td>
										</tr> -->
			<%-- <c:set var="country" value="<spring:message code="india.country"/>" scope="page" /> --%>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_address" class="styled-input">

					<form:input type="text" path="address" id="address"
						class='selecttag'
						onclick="emptyerror(event,'lab_addressErrorId');"
						onchange="selecttag('address1','address');"
						onfocus="showlabel('address1','lab_addressErrorId');removeHasError('div_address')" />
					<label id="address1">*&nbsp;<spring:message
							code="lab_address" /></label> <label id="lab_addressErrorId"
						class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_address2" var="lab_address2" />
					<form:input type="text" path="addressTwo" id="address2"
						class='selecttag'
						onclick="emptyerror(event,'lab_addressErrorId');"
						onchange="selecttag('addressId2','address2');" />
					<label id="addressId2">${lab_address2}</label>
				</div>
			</div>
			<!-- <tr>
											<td></td>
											<td><div id="lab_addressErrorId"></div></td>
											<td colspan="2"></td>
										</tr> -->
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_locality" var="lab_locality" />
					<spring:message code="account.readonly" var="readonlyValue" />
					<form:input type="text" path="locality" id="locality"
						class='selecttag' readonly="${readonlyValue}"
						onfocus="showlabel('locality','localityErrorId');emptyerror(event,'localityErrorId')"
						onchange="selecttag('locality1','locality');"></form:input>
					<label id="locality1">${lab_locality}</label> <label
						id="localityErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_Region" var="lab_Region" />
					<form:input type="text" id="region" path="region" class='selecttag'
						readonly="${readonlyValue}"
						onchange="selecttag('regionId1','region');"></form:input>
					<label id="regionId1">${lab_Region}</label> <label
						id="regionErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_district" var="lab_district" />
					<form:input type="text" id="district" path="district"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('districtId1','district');" />
					<label id="districtId1">${lab_district}</label> <label
						id="districtErrorId" class="collapse"></label><span></span>
				</div>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="statedivId" class="styled-input">
					<spring:message code="lab_State" var="lab_State" />
					<form:input type="text" id="state" path="state" class='selecttag'
						readonly="${readonlyValue}"
						onchange="selecttag('state1','state');"
						onfocus="showlabel('state1','stateErrorId');removeHasError('statedivId')"></form:input>
					<label id="state1">*&nbsp;${lab_State}</label> <label
						id="stateErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="countrydivId" class="styled-input">
					<spring:message code="lab_Country" var="lab_Country" />
					<form:input type="text" id="country" path="country"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('country1','country');"
						onfocus="showlabel('country1','countryErrorId');removeHasError('countrydivId'); "></form:input>

					<label id="country1">*&nbsp;<spring:message
							code="lab_Country" /></label> <label id="countryErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_emailId" class="styled-input">
					<form:input id='emailId' type="text" path="email" class='selecttag'
						onchange="selecttag('emailId1','emailId');checkUniqueUserEmailId(); "
						onclick="emptyerror(event,'emailIdErrorId');"
						onfocus="showlabel('emailId1','emailIdErrorId');removeHasError('div_emailId')" />
					<label id="emailId1">*&nbsp;E-mail</label> 
					<label id=emailIdErrorId class="collapse"></label> <span></span>
				</div>
			</div>
			<!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
			<div id="div_emailerrId" style='display: none'>
					
				</div>
				</div> -->
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_countryCodeId" class="styled-input">

							<form:select id="countryCodeId" name="countryCode"
								path="countryCodeId" class="selecttag"
								onchange="selecttag('countryCodeId1','countryCodeId');"
								onfocus="removeHasError('div_countryCodeId')"
								onclick="this.setAttribute('value', this.value);" value="">
								<form:option value="" label=" " />
								<form:options items="${countryCodeMap}" />
							</form:select>
							<label id="countryCodeId1">*&nbsp;Country Code</label> <label
								id=countryCodeerroeId1 class="collapse"></label>

						</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">
						<div id="div_mobileNumber" class="styled-input">
							<form:input type="text" id="mobileNumber" path="mobileNumber"
								maxlength="10" class='selecttag'
								
								onkeypress="onlyNumric(event,'userMobileErrorId','userMobile1'); emptyerror(event,'userMobileErrorId');" 
								onchange="selecttag('mobileNumberId','mobileNumber');emptyerror(event,'mobileNumberErrorId'); checkUniqueUserMobileNumber(); mobLength(event,mobileNumberErrorId);"
								onclick="emptyerror(event,'mobileNumberErrorId');"
								onfocus="showlabel('mobileNumberId','mobileNumberErrorId');removeHasError('div_mobileNumber')" />
							<label id="mobileNumberId">&nbsp;*&nbsp;Mobile Number</label> <label
								id="mobileNumberErrorId" class="collapse"></label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="altCountryCodeErrorId_div" class="styled-input">
							<form:select id="altCountryCodeId" name="altCountryCodes"
								path="altCountryCodeId" class="selecttag"
								onchange="selecttag('altCountryCodeId1','altCountryCodeId');"
								onclick="this.setAttribute('value', this.value);" value="">
								<form:option value="" label=" " />
								<form:options items="${countryCodeMap}" />
							</form:select>
							<label id="altCountryCodeId1">Country Code</label> <label
								id="altCountryCodeErrorId" class="collapse"></label><span></span>
						</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">
						<div id="alternateMobileNumber_div_id" class="styled-input">
							<form:input type="text" id="alternateMobileNumber"
								path="alternateMobileNumber"
								onchange="selecttag('alternateMobileNumberId','alternateMobileNumber');mobLength(event,'alternateMobileNumberErrorId');"
								maxlength="10" class='selecttag'
								onkeypress="onlyNumric(event,'userMobileErrorId','userMobile1'); emptyerror(event,'userMobileErrorId');" 
								onclick="emptyerror(event,'alternateMobileNumberErrorId');"
								onfocus="showlabel('alternateMobileNumberId','alternateMobileNumberErrorId');removeHasError('alternateMobileNumber_div_id')" />
							<label id="alternateMobileNumberId"><spring:message
									code="alternateMobileNumber" /></label> <label
								id='alternateMobileNumberErrorId' class="collapse"></label><span></span>
							<div></div>
						</div>


					</div>
				</div>
			</div>

			<!------------------------ Account Typ------------------ -->
			<div class="container-fluid" id="tableForHost">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 "
					id="tableForHost">
					<div class="styled-input">
						<spring:message code="LABEL_DEPLOYMENT_TYPE"
							var="LABEL_DEPLOYMENT_TYPE" />
						<form:select id="deploymentTypeId" path="deploymentType"
							class="selecttag"
							onfocus="showlabel('deploymentTypeId1','deploymentTypeErrorId');"
							onchange="selecttag('deploymentTypeId1','deploymentTypeId');">
							<form:option value="ISOLATED" label="ISOLATED" />
							<form:option value="SAAS" label="SAAS" />
						</form:select>
						<label id="deploymentTypeId1" class="valid">${LABEL_DEPLOYMENT_TYPE}</label> <label
							id="deploymentTypeErrorId" class="collapse"></label><span></span>

					</div>
				</div>
				<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input">
								<spring:message code="LABEL_SMS_GATEWAY_SHORT_CODE" var="LABEL_SMS_GATEWAY_SHORT_CODE"/>
								<form:input id="smsShortCodeId"  path="smsShortCode"  type="text" class='selecttag'
								onchange="selecttag('smsShortCodeId1','smsShortCodeId');"
								onkeypress="emptyerror(event,'smsShortCodeErrorId');onlyNumric(event,'smsShortCodeErrorId');" maxlength="12" 
								onfocus="showlabel('smsShortCodeId1','smsShortCodeErrorId');"/>
								<label id="smsShortCodeId1">${LABEL_SMS_GATEWAY_SHORT_CODE}</label>
								<label id="smsShortCodeErrorId" class="collapse"></label><span></span>
						</div></div> --%>
				<div id="divID_gatewayIp"
					class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="div_gatewayIp" class="styled-input">
						<form:input id="gatewayIpId" path="gatewayIp" type="text"
							maxlength="15" class='selecttag'
							onchange="selecttag('gatewayIpId1','gatewayIpId');validateIp();"
							onclick="emptyerror(event,'urlErrorId');emptyerror(event,'gatewayIpErrorId');"
							onfocus="removeHasError('div_gatewayIp');showlabel('gatewayIpId1','gatewayIpErrorId');"
							onkeypress="showIP()" />
						<label id="gatewayIpId1"><spring:message
								code="LABEL_GATEWAY_IP" /></label> <label id="gatewayIpErrorId"
							class="collapse"></label><span></span>
					</div>
				</div>
				<!-- <tr>
								<td colspan='2'><div id='smsShortCodeErrorId' align='center'></div></td>
								<td></td>
								<td colspan='3'><div id='gatewayIpErrorId' align="left"></div></td>
							</tr> -->
				<div id="div_portId"
					class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="div_port" class="styled-input">
						<form:input id="portId" path="port" type="text" maxlength="4" onblur="validatePort(this);"
							class='selecttag'
							onpaste="return validateNumeric(event,'portErrorId','${LABEL_PORT}')"
							onkeypress="onlyNumric(event,'portErrorId','${LABEL_PORT}');"
							onfocus="showlabel('portId1','portErrorId');removeHasError('div_port')"
							onclick="emptyerror(event,'portErrorId');"
							onchange="selecttag('portId1','portId');" />
						<label id="portId1" class="valid"><spring:message code="LABEL_PORT" /></label> <label
							id="portErrorId" class="collapse"></label>
					</div>
				</div>
				<div id="div_url" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="div_urlId" class="styled-input">
						<spring:message code="LABEL_URL" var="LABEL_URL" />
						<form:input id="urlId" path="url" type="text" onblur="validateURL(this);" class='selecttag'
							onfocus="showlabel('urlId1','urlErrorId');removeHasError('div_urlId')"
							onclick="emptyerror(event,'urlErrorId');" onkeypress="hideURL()"
							onchange="selecttag('urlId1','urlId');" />
						<label id="urlId1" class="valid">${LABEL_URL}</label> <label id="urlErrorId"
							class="collapse"></label>
					</div>
				</div>

			</div>
			<div class="container-fluid">

				<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 "  id="encryptionRowId">
							<div class="styled-input">
								<form:input id="encryptionKeyId" path="encryptionKey"
										maxlength="48" type="text" class='selecttag'
										onpaste="return validateAlphaNumericOnPaste(event,'encryptionKeyErrorId','Encryption Key')" onfocus="showlabel('encryptionKeyId1','encryptionKeyErrorId');"
										onkeypress="disableSpecialCharacterWithSpace(event,'encryptionKeyErrorId','Encryption Key');" onchange="selecttag('encryptionKeyId1','encryptionKeyId');"
										onclick="emptyerror(event,'encryptionKeyErrorId');" />
										<label id="encryptionKeyId1"><spring:message code="LABEL_ENCRYPTION_KEY"/></label>
										<label id="encryptionKeyErrorId" class="collapse"></label>
								</div></div>	 --%>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<spring:message code="LABEL_STATUS" var="LABEL_STATUS" />
						<form:select id="accountStatus" path="accountStatus"
							class="selecttag" name="accountStatus">
							<form:option value="0" label="Unblocked" />
							<form:option value="1" label="Blocked" />
						</form:select>
					</div>
				</div>
				<%--  functionality is not decided on 26-06-2017 
        				
        				<td class='tableLabel' align='right'><font color='red'>*&nbsp;</font><spring:message code="lab_CompanylogoImage"/>&nbsp;:&nbsp;&nbsp;</td>
       					 <td class='tableLabel' align='left'>
       						 <form:input type="file" id="lab_CompanylogoImage" path="uploadCompanyLogoImage"  name="uploadCompanyLogoImage"  onclick="emptyerror(event,'companyLogoErrorId');" onchange="checkExtSize('lab_CompanylogoImage','companyLogoErrorId');"/>
      					  </td> --%>

				<!--  <tr>
   					 <td colspan="2" align="center"><div id='companyLogoErrorId' align='center'></div></td>
   					 </tr> -->
			</div>





			<!-- onClick="return validateAccountCreationForm(event,'new');" -->
			<div class=" col-xs-6 col-sm-6 col-md-6 col-md-offset-2 col-lg-6 mb">
				<input type="submit" class="btn btn-warning btn-block" name="submit"
					id="submit" value="Submit"
					onClick="return validateAccountCreationForm(event,'new');" />
			</div>
			<!-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " id="submitWaitDIV">
							<div class="styled-input">
							<input type="button" value="Please wait" />
						</div></div> -->




			<input type="hidden" id="hiddenAccountNo" value="2" /> <input
				type="hidden" id="hiddenAccountGroupCode"
				value="${accountCreationData.groupCode}" /> <input type="hidden"
				id="pinaddressId" name="pinaddressId" value="" />



			<!-- <input type="hidden" id="hiddenAddressId" name="hiddenAddressId" value=""/> -->
			<%-- <form:hidden path="hiddenAddressId" value="" /> --%>
		</div>
		<script>
		accountVisbility();
	             </script>
	
 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>

</body>
</html>