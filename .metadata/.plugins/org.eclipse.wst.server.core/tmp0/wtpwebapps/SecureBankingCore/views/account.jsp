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
	src="${pageContext.request.contextPath}/js/CheckImage.js"></script>
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/UserLoginCreation.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>	
	
<script type="text/javascript">

//ranjeet test
// function checkImageSizeAndExtension() {
// 	var file = document.getElementById("image");
// 	var filepath = file.value;
//     var ext = filepath.substring(filepath.lastIndexOf('.')+1).toLowerCase();
//     if (ext != "jpeg" && ext != "jpg" && ext != "png" ) {
//         alert('Please select a valid image file');
//         document.getElementById("image").value = '';
//         return false;
//     }
//     var fsize = file.files.item(0).size;
//     var s = Math.round((fsize / 1024) * 1024);
//     if (s > 512000) {
//         alert('Max Upload size is 512 KB only');
//         document.getElementById("image").value = '';
//         return false;
//     }
    
//     return true;
// }


function removeStyleTag(id)
{
	$("#"+id).attr("style","");
}
</script>
	
	
</head>
<body>
	<form:form id="accountCreationForm1" name="accountCreationForm1"
		method="post" modelAttribute="accountCreationData" onsubmit="return checkImageSizeAndExtension();"
		action="${pageContext.request.contextPath}/AdminUI/account/accountCreationSubmit" enctype="multipart/form-data">

		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
					<h1 class="pull-left">${accountType}
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
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 .hidden"
				id="hostRow">
				<div class="styled-input" id="div_hostId">
					<spring:message code="LABEL_HOST" var="LABEL_HOST" />
					<form:select id="hostId" path="hostId" class="selecttag"
						onchange="selecttag('hostId1','hostId');getAccount('hostId','HO','distributorId','subDistributorId');"
						onfocus="removeHasError('div_hostId');showlabel('hostId1','hostIdErrorId');emptyerror(event,'hostId1');"
						onclick="this.setAttribute('value', this.value);removeStyleTag('hostId1')" value="">
						<form:option value="" label=" " />
						<form:options items="${accountCreationData.platformChain.hostMap}" />
					</form:select>
					<label id="hostId1" class="valid">${LABEL_HOST}</label> <label id=hostIdErrorId
						class="collapse"></label><span></span>
				</div>
			</div>
			<!--  committing due to applying bootstrap on 23-06-2017
				<tr>
					<td></td>
					<td colspan='2'><div id='hostErrorId' align='left'></div></td>
				</tr> -->

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 .hidden"
				id="distributorRow">
				<div class="styled-input" id="div_distributorId">
					<spring:message code="LABEL_DIST" var="LABEL_DIST" />
					<form:select id="distributorId" path="distributorId"
						class="selecttag"
						onchange="selecttag('distributorId1','distributorId');getAccount('distributorId','DI','subDistributorId');"
						onfocus="removeHasError('div_distributorId');showlabel('distributorId1','distributorIdErrorId');emptyerror(event,'distributorId1');"
						onclick="this.setAttribute('value', this.value);removeStyleTag('distributorId1')" value="">
						<form:option value="" label=" " />
						<form:options
							items="${accountCreationData.platformChain.distributorMap}" />
					</form:select>
					<span></span> <label id="distributorId1" class="valid">${LABEL_DIST}</label> <label
						id=distributorIdErrorId class="collapse"></label><span></span>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 .hidden"
				id="subDistributorRow">
				<div class="styled-input">
					<spring:message code="LABEL_SUB_DIST" var="LABEL_SUB_DIST" />
					<form:select id="subDistributorId" path="subDistributorId"
						class="selecttag"
						onchange="selecttag('subDistributorId1','subDistributorId');getAccount('subDistributorId','SD','retailerId');"
						onfocus="showlabel('subDistributorId1','subDistributorIdErrorId');emptyerror(event,'subDistributorId1');"
						onclick="this.setAttribute('value', this.value);" value="">>
							<form:option value="" label=" " />
						<form:options
							items="${accountCreationData.platformChain.subDistributorMap}" />
					</form:select>
					<span></span> <label id="subDistributorId1" class="valid">${LABEL_SUB_DIST}</label>
					<label id=subDistributorIdErrorId class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 .hidden"
				id="retailerRow">
				<div class="styled-input">
					<spring:message code="LABEL_RETAILER" var="lab_RETAILER" />
					<form:select id="retailerId" path="retailerId" class="selecttag"
						onfocus="showlabel('retailerId1','retailerIdErrorId');emptyerror(event,'retailerId1');"
						onclick="this.setAttribute('value', this.value);" value="">>>
							<form:option value="" label=" " />
						<form:options
							items="${accountCreationData.platformChain.retailerMap}" />
					</form:select>
					<span></span> <label id="retailerId1" class="valid">${lab_RETAILER}</label> <label
						id=retailerIdErrorId class="collapse"></label>
				</div>
			</div>
			

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_companyNameId" class="styled-input">
					<form:input id="companyNameId" path="companyName"
						name="companyName" class='selecttag' type="text"
						onkeypress="blockSpecialChar(event,'companyNameErrorId','companyNameId1'); "
						maxlength='100' onclick="emptyerror(event,'companyNameErrorId');"
						onchange="return checkDuplicateAccount();selecttag('companyNameId1','companyNameId');"
						onfocus="showlabel('companyNameId1','companyNameErrorId');removeHasError('div_companyNameId')" />

					<label id="companyNameId1" class="valid">*&nbsp;Company Name</label> <label
						id="companyNameErrorId" class="collapse"
						style="display: inline-block;"></label><span></span>
				</div>
			</div>





 <c:if test="${deployedFor=='DEFAULT'}">
                <div id='addressSelectDivId' >
	  									<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'>
	  									</table>
	  					</div>
                  
	  				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                    &nbsp;
                      </div>
               <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							<form:input type="text" maxlength="6" path="pinCode" class="selecttag" id="pinCode"
								onchange="selecttag('label_pinCode','pinCode');" onclick="clearField('label_pinCode','lab_pinCodeErrorId');refresh('statusMessage');refresh('errorstatusMessage')"
								onfocus="removeHasError('div_pinCode')" onkeypress="onlyNumric(event,'label_pinCode1','lab_pinCodeErrorId1','pinCode');changeValues()"/>
							<label id="label_pinCode" class="valid" >*&nbsp;<spring:message
									code="lab_pinCode" /></label> <label id="lab_pinCodeErrorId"
								class="collapse"></label>
						</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">

						<input type="button" id="addressFetchId" class="btn btn-warrning"
							value="Fetch Address" onclick="fetchAddress();" />

					</div>
				</div>
<div id="addressErrorId"></div>
			</div>
               
               
               <input type="hidden" id="pinCodeFlag" name="pinCodeFlag"  value="" /> 
               
                      
	  				
                    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_address" class="styled-input">
										<form:input id="addressIdDefault" type="text" path="address" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_address','address');"
												onfocus="removeHasError('div_address');removeStyleTag('label_address')"/>
											<label id="label_address" class="valid"><spring:message code="lab_address" /></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_locality','locality');"
												onfocus="removeHasError('div_locality');removeStyleTag('label_locality')"/>
											<label id="label_locality" class="valid"><spring:message code="lab_locality" /></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_region','region');"
												onfocus="removeHasError('div_region');removeStyleTag('label_region')"/>
											<label id="label_region" class="valid"><spring:message code="lab_Region" /></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_district" class="styled-input">
										<form:input type="text" id="district" path="district" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_district','district');"
												onfocus="removeHasError('div_district');removeStyleTag('label_district')"/>
											<label id="label_district" class="valid"><spring:message code="lab_district" /></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_state','state');" 
												onfocus="removeHasError('div_state');removeStyleTag('label_state')"/>
											<label id="label_state" class="valid"><spring:message code="lab_State" /></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_country','country');" 
												onfocus="removeHasError('div_country');removeStyleTag('label_country')"/>
											<label id="label_country" class="valid"><spring:message code="lab_Country" /></label>
											<label id="lab_CountryErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      </c:if>
                      
                      <c:if test="${deployedFor=='TAFANI'}">
                      
                      
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div  id="div_pinCode" class="styled-input">
					<spring:message code="lab_pinCode" var="lab_pinCode" />
					<form:input type="text" maxlength="6" path="pinCode"
						class='selecttag' id="pinCode"
						onclick="emptyerror(event,'lab_pinCodeErrorId');"
						onkeypress="onlyNumricForPin(event,'lab_pinCodeErrorId','${lab_pinCode}'); "
						onfocus="showlabel('pinCodeId','lab_pinCodeErrorId');removeHasError('div_pinCode')"
						onchange="selecttag('pinCodeId','pinCode');pinValidation(); changePinCode('${readonlyValue}');" />
					<label id="pinCodeId" class="valid">${lab_pinCode}</label> <label
						id="lab_pinCodeErrorId" class="collapse"></label><span></span>
					
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_address" class="styled-input">

					<form:input type="text" path="address" id="addressIdDefault"
						class='selecttag'
						onclick="emptyerror(event,'lab_addressErrorId');"
						onchange="selecttag('address1','address');"
						onfocus="showlabel('address1','lab_addressErrorId');removeHasError('div_address')" />
					<label id="address1" class="valid">*&nbsp;<spring:message
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
					<label id="addressId2" class="valid">${lab_address2}</label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_locality">
					<spring:message code="lab_locality" var="lab_locality" />
					<spring:message code="account.readonly" var="readonlyValue" />
					<form:input type="text" path="locality" id="locality"
						class='selecttag' readonly="${readonlyValue}"
						onfocus="removeHasError('div_locality');showlabel('locality','localityErrorId');emptyerror(event,'localityErrorId')"
						onchange="selecttag('locality1','locality');"></form:input>
					<label id="label_locality" class="valid">${lab_locality}</label> <label
						id="localityErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_region">
					<spring:message code="lab_Region" var="lab_Region" />
					<form:input type="text" id="region" path="region" class='selecttag' onfocus="removeHasError('div_region');"
						readonly="${readonlyValue}"
						onchange="selecttag('regionId1','region');"></form:input>
					<label id="regionId1" class="valid">${lab_Region}</label> <label
						id="regionErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_district">
					<spring:message code="lab_district" var="lab_district" />
					<form:input type="text" id="district" path="district" onfocus="removeHasError('div_district');"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('districtId1','district');" />
					<label id="label_district" class="valid">${lab_district}</label> <label
						id="districtErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_state" class="styled-input">
					<spring:message code="lab_State" var="lab_State" />
					<form:input type="text" id="state" path="state" class='selecttag'
						readonly="${readonlyValue}"
						onchange="selecttag('state1','state');"
						onfocus="showlabel('state1','stateErrorId');removeHasError('div_state')"></form:input>
					<label id="label_state" class="valid">*&nbsp;${lab_State}</label> <label
						id="stateErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_country" class="styled-input">
					<spring:message code="lab_Country" var="lab_Country" />
					<form:input type="text" id="country" path="country"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('country1','country');"
						onfocus="removeHasError('div_country');showlabel('country1','countryErrorId');removeHasError('countrydivId'); "></form:input>

					<label id="label_country" class="valid">*&nbsp;<spring:message
							code="lab_Country" /></label> <label id="countryErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			
			 </c:if>
			
			
			
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_emailId" class="styled-input">
					<form:input id='emailId' type="text" path="email" class='selecttag'
						onchange="checkUniqueUserEmail();selecttag('emailId1','emailId');"
						onclick="emptyerror('emailIdErrorId');"
						onfocus="showlabel('emailId1','emailIdErrorId');removeHasError('div_emailId')" />
					<label id="emailId1" class="valid">*&nbsp;Email ID</label> 
					<label id=emailIdErrorId class="collapse"></label> <span></span>
				</div>
			</div>
			
			
			
			
			
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
							<label id="countryCodeId1" class="valid">*&nbsp;Country Code</label> <label
								id=countryCodeerroeId1 class="collapse"></label>

						</div>
					</div>
                     
	  					
					<div class="col-md-1 col-lg-1 pl0"></div>
					<div class="col-md-7 col-lg-7 pl0">
						<div id="div_mobileNumber" class="styled-input">
							<form:input type="text" id="mobileNumber" path="mobileNumber" 
								maxlength="10" onblur="validateMob(this,'mobileNumberId','mobileNumberErrorId','mobileNumber')" class='selecttag'
								
								onkeypress="onlyNumric(event,'mobileNumberErrorId','mobileNumberId','mobileNumber'); emptyerror(event,'mobileNumberErrorId');" 
								onchange="checkUniqueUserMobileNumber();emptyerror(event,'mobileNumberErrorId');  mobLength(event,mobileNumber,mobileNumberErrorId);"
								onclick="emptyerror(event,'mobileNumberErrorId');"
								onfocus="showlabel('mobileNumberId','mobileNumberErrorId');removeHasError('div_mobileNumber')" />
							<label id="mobileNumberId" class="valid"> &nbsp;* &nbsp;Phone Number</label> <label
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
								onfocus="removeHasError('altCountryCodeErrorId_div')"
								onchange="selecttag('altCountryCodeId1','altCountryCodeId');"
								onclick="this.setAttribute('value', this.value);" value="">
								<form:option value="" label=" " />
								<form:options items="${countryCodeMap}" />
							</form:select>
							<label id="altCountryCodeId1" class="valid">Country Code</label> <label
								id="altCountryCodeErrorId" class="collapse"></label><span></span>
						</div>
					</div>
							<div class="col-md-1 col-lg-1 pl0"></div>
							<div class="col-md-7 col-lg-7 pl0">
							<div id="altCountryCodeErrorId_div" class="styled-input">
							<form:input type="text" id="alternateMobileNumber"
								path="alternateMobileNumber"
								onchange="selecttag('alternateMobileNumberId','alternateMobileNumber');mobLength(event,alternateMobileNumber,'alternateMobileNumberErrorId');"
								maxlength="10" class='selecttag'
								onkeypress="onlyNumric(event,'alternateMobileNoErrorId','alternateMobileNumberId','alternateMobileNumber'); emptyerror(event,'alternateMobileNumberId');" 
								onclick="emptyerror(event,'alternateMobileNoErrorId');"
								onfocus="showlabel('alternateMobileNumberId','alternateMobileNoErrorId');removeHasError('alternateMobileNumber_div_id')" />
							<label id="alternateMobileNumberId" class="valid"> &nbsp; &nbsp;Alternate Phone Number
									</label> <label
								id='alternateMobileNoErrorId' class="collapse"></label><span></span>
							<div></div>
						</div>


					</div>
				</div>
			</div>

			<!------------------------ Account Typ------------------ -->
			<div id="tableForHost">
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
				
				<div id="divID_gatewayIp"
					class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="div_gatewayIp" class="styled-input">
						<form:input id="gatewayIpId" path="gatewayIp" type="text"
							maxlength="15" class='selecttag'
							onchange="selecttag('gatewayIpId1','gatewayIpId');validateIp();"
							onclick="emptyerror(event,'urlErrorId');emptyerror(event,'gatewayIpErrorId');"
							onfocus="removeHasError('div_gatewayIp');showlabel('gatewayIpId1','gatewayIpErrorId');"
							onkeypress="showIP()" />
						<label id="gatewayIpId1" class="valid"><spring:message
								code="LABEL_GATEWAY_IP" /></label> <label id="gatewayIpErrorId"
							class="collapse"></label><span></span>
					</div>
				</div>
				
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
						<form:input id="urlId" path="url" type="text" class='selecttag'
							onfocus="showlabel('urlId1','urlErrorId');removeHasError('div_urlId')"
							onclick="emptyerror(event,'urlErrorId');" onkeypress="hideURL()"
							onchange="selecttag('urlId1','urlId');validateURL(this);" />
						<label id="urlId1" class="valid">${LABEL_URL}</label> <label id="urlErrorId"
							class="collapse"></label>
					</div>
				</div>

			</div>

			
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<spring:message code="LABEL_STATUS" var="LABEL_STATUS" />
						<form:select id="accountStatus" path="accountStatus"
							class="selecttag" name="accountStatus">
							<form:option value="1" label="Unblocked" />
							<form:option value="0" label="Blocked" />
						</form:select>
							<label id="statusId" class="valid">${LABEL_STATUS}</label> <label id="statusErrorId"
							class="collapse"></label>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div id="div_txnNature" class="styled-input">
											<label id="username1"  class="valid">Transaction Nature</label>
											<form:select  path="txnNature" class="selecttag"						
												onfocus="removeHasError('div_txnNature');emptySuccess(event,'msgId');" onclick="this.setAttribute('value', this.value);"
												>
												
												<form:option value="CR" label="CR" />
												<form:option value="DR" label="DR" />
												<form:option value="CR/DR" label="CR/DR" />
								
											</form:select>
											</div>
											</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div id="image_div" >
						<label id="imagelabel"><font color="#eaa722">Profile Image</font></label>
						<input type="file" name="image" id="image" />
					</div>
				
				</div>


		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<input type="submit" class="btn btn-warning" style="margin:auto;display:block" name="submit"
					id="submit" value="Submit"
					onClick="return validateAccountCreationForm(event,'new');" />
			</div>
			
			<input type="hidden" id="hiddenAccountNo" value="2" /> 
			<input	type="hidden" id="hiddenAccountGroupCode" value="${accountCreationData.groupCode}" /> 
			<input type="hidden" id="pinaddressId" name="pinaddressId" value="" />


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