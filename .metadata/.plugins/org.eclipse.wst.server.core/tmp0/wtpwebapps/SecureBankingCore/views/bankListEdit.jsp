



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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<style type="text/css">
#containersimg {
	height: 80px;
	overflow: auto;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/BankRegistration.js"></script>
	<script>
	function toggleform(id)
	{
		$('#msgId').html('');	
	$("#"+id).toggle("slow",function(){
		
	  
	});

	}
	</script>
</head>
<body>

	<form:form method="post" modelAttribute="bankRegistrationData"
		id="portalForm"
		action="${pageContext.request.contextPath}/AdminUI/bankCreation/editBankListSubmit"
		enctype="multipart/form-data">
		<div class="heading-inner">
			<!-- ****************************************** Form Heading  ******************************* -->
			
				
			
				 <h1 class="pull-left">Bank Edit</h1>
			<div class="clearfix"></div>
			<hr />

			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
			<c:if test="${errorMessage!=''}">

				<div id="errorId"
					class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

					<p class="text-danger">${errorMessage}</p>

				</div>
			</c:if>

		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_bankNameId" class="styled-input">
					<form:input id="bankNameId" path="bankName" name="bankName"
						type="text" onfocus="removeHasError('div_bankNameId')"
						onkeypress="blockSpecialChar(event,'bankNameErrorId');"
						maxlength='50' class="selecttag"
						onchange="selecttag('label_bankNameId','bankNameId');checkDuplicateBankName()" />
					<label id="label_bankNameId" class="valid" ><font color="red">*&nbsp;</font><spring:message
							code="lab_bankName" /></label> <label id="bankNameErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_bankDescriptionId" class="styled-input">
					<form:input id="bankDescriptionId" path="bankDescription"
						name="bankDescription" type="text" class="selecttag"
						onfocus="removeHasError('div_bankDescriptionId')"
						onkeypress="blockSpecialChar(event,'bankNameErrorId');"
						maxlength='50'
						onchange="selecttag('label_bankDescriptionId','bankDescriptionId');" />
					<label id="label_bankDescriptionId" class="valid" ><font color="red">*&nbsp;</font><spring:message
							code="lab_BankDescription" /></label> <label id="bankNameErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_mobileNumber" class="styled-input">
					<form:input type="text" class="selecttag" maxlength="12"
						onfocus="removeHasError('div_mobileNumber')"
						onchange="selecttag('label_mobileNumber','mobileNumber');"
						path="mobileNumber"
						onkeypress="return isNumberKey(event);" />
					<label id="label_mobileNumber"  class="valid"><font color="red">*&nbsp;</font><spring:message
							code="mobileNumber" /></label> <label id="mobileNumberErrorId"
						class="collapse"></label>
				</div>
			</div>
		
			
		
			<div class="col-xs-12">
				<div class="transaction-table">
					<div class="table-responsive">
						<table id="lab_Address" class="table table-bordered table-striped">

						</table>
					</div>
				</div>
			</div>
			    <c:if test="${deployedFor=='DEFAULT'}">
                <div id='addressSelectDivId' >
	  									<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'>
	  									</table>
	  					</div>
               <br />
               <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							<form:input type="text" path="pinCode" class="selecttag" id="pinCode" maxlength="6"
								onchange="selecttag('label_pinCode','pinCode');" onclick="refresh('addressErrorId');refresh('lab_pinCodeErrorId');refresh('statusMessage');refresh('errorstatusMessage');"
								onfocus="removeHasError('div_pinCode')" onkeypress="changeValues()"/>
							<label id="label_pinCode" class="valid" ><font color="red">*&nbsp;</font><spring:message
									code="lab_pinCode" /></label> <label id="lab_pinCodeErrorId"
								class="collapse"></label>
						</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">

						<input type="button" id="addressFetchId" class="btn btn-warrning"
							value="Fetch Address" onclick="fetchAddress();" />

					</div>
					<div id="addressErrorId"></div>
				</div>

			</div>
               
               
               
               
                      
	  				
                    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_address" class="styled-input">
										<form:input id="addressIdDefault" type="text" path="address" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_address','address');"
												onfocus="removeHasError('div_address')"/>
											<label id="label_address" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_address" /></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_locality','locality');"
												onfocus="removeHasError('div_locality')"/>
											<label id="label_locality" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_locality" /></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_region','region');"
												onfocus="removeHasError('div_region')"/>
											<label id="label_region" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_Region" /></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_district" class="styled-input">
										<form:input type="text" id="district" path="district" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_district','district');"
												onfocus="removeHasError('div_district')"/>
											<label id="label_district" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_district" /></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_state','state');" 
												onfocus="removeHasError('div_state')"/>
											<label id="label_state" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_State" /></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_country','country');" 
												onfocus="removeHasError('div_country')"/>
											<label id="label_country" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_Country" /></label>
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
					<label id="pinCodeId" class="valid"><font color="red">*&nbsp;</font>${lab_pinCode}</label> <label
						id="lab_pinCodeErrorId" class="collapse"></label><span></span>
					
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_address" class="styled-input">

					<form:input type="text" path="address" id="address"
						class='selecttag'
						onclick="emptyerror(event,'lab_addressErrorId');"
						onchange="selecttag('address1','address');"
						onfocus="showlabel('address1','lab_addressErrorId');removeHasError('div_address')" />
					<label id="address1" class="valid"><font color="red">*&nbsp;</font><spring:message
							code="lab_address" /></label> <label id="lab_addressErrorId"
						class="collapse"></label><span></span>
				</div>
			</div>
			<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_address2" var="lab_address2" />
					<form:input type="text" path="addressTwo" id="address2"
						class='selecttag'
						onclick="emptyerror(event,'lab_addressErrorId');"
						onchange="selecttag('addressId2','address2');" />
					<label id="addressId2" class="valid">${lab_address2}</label>
				</div>
			</div> --%>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_locality">
					<spring:message code="lab_locality" var="lab_locality" />
					<spring:message code="account.readonly" var="readonlyValue" />
					<form:input type="text" path="locality" id="locality"
						class='selecttag' readonly="${readonlyValue}"
						onfocus="showlabel('locality','localityErrorId');emptyerror('localityErrorId');removeHasError('div_locality');"
						onchange="selecttag('locality1','locality');"></form:input>
					<label id="locality1" class="valid"><font color="red">*&nbsp;</font>${lab_locality}</label> <label
						id="localityErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_region">
					<spring:message code="lab_Region" var="lab_Region" />
					<form:input type="text" id="region" path="region" class='selecttag'
						readonly="${readonlyValue}"
						onchange="selecttag('regionId1','region');" onfocus="removeHasError('div_region');"></form:input>
					<label id="regionId1" class="valid"><font color="red">*&nbsp;</font>${lab_Region}</label> <label
						id="regionErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_district">
					<spring:message code="lab_district" var="lab_district" />
					<form:input type="text" id="district" path="district"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('districtId1','district');" />
					<label id="districtId1" class="valid"><font color="red">*&nbsp;</font>${lab_district}</label> <label
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
					<label id="state1" class="valid"><font color="red">*&nbsp;</font>${lab_State}</label> <label
						id="stateErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_country" class="styled-input">
					<spring:message code="lab_Country" var="lab_Country" />
					<form:input type="text" id="country" path="country"
						class='selecttag' readonly="${readonlyValue}"
						onchange="selecttag('country1','country');"
						onfocus="showlabel('country1','countryErrorId');removeHasError('div_country'); "></form:input>

					<label id="country1" class="valid"><font color="red">*&nbsp;</font><spring:message
							code="lab_Country" /></label> <label id="countryErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			
			 </c:if> <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_emailId" class="styled-input">
										<form:input id='emailId' type="text" onblur="validateEmail(this);" class="selecttag" 
													path="email" onfocus="removeHasError('div_emailId')"
													onchange="checkEmail();selecttag('label_emailId','emailId'); validateEmailOnKepress('emailId','lab_Email_IdErrorId') "
													onclick="clr();emptyerror(event,'lab_Email_IdErrorId');" />
											<label id="label_emailId"class="valid"><spring:message code="lab_Email_Id" /></label>
											<label id="lab_Email_IdErrorId" class="collapse"></label>
					    	</div>
                      </div>
			 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_bankShortNameId" class="styled-input">
					<form:input id="bankShortNameId" path="bankShortName"
						name="bankShortName" maxlength='4' type="text" class="selecttag"
						onfocus="removeHasError('div_bankShortNameId')"
						onkeypress="blockSpecialChar(event,'bankShortNameErrorId');"
						onchange="selecttag('label_bankShortNameId','bankShortNameId');checkDuplicateBankShortName()" />
					<label id="label_bankShortNameId" class="valid" ><spring:message
							code="lab_bankShortName" /></label> <label id="bankShortNameErrorId"
						class="collapse"></label>
				</div>
			</div>
				 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_alternateMobileNumber" class="styled-input">
										<form:input  id="alternateMobileNumber" type="text" class="selecttag"  maxlength="12"
													onchange="selecttag('label_alternateMobileNumber','alternateMobileNumber');"
													onkeypress="return isNumberKey(event);"
													path="alternateMobileNumber" onKeypress="onlyNumric(event,alternateMobileNumberErrorId);"/>
										<label id="label_alternateMobileNumber"class="valid"><spring:message code="alternateMobileNumber" /></label>
											<label id="alternateMobileNumberErrorId" class="collapse"></label>
					    	</div>
                      </div>
			 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_firstName" class="styled-input">
									<form:input type="text" class="selecttag"
												onfocus="removeHasError('div_firstName')"
												onkeypress="onlyAlphabet(event,'lab_customerFirstNameErrorId');"
												path="firstName" onchange="selecttag('label_firstName','firstName');" />
											<label id="label_firstName" class="valid"><spring:message code="lab_customerFirstName" /></label>
											<label id="lab_customerFirstNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_lastName" class="styled-input">
									<form:input type="text" path="lastName"
												class="selecttag" onchange="selecttag('label_lastName','lastName');"
												onfocus="removeHasError('div_lastName')" />
											<label id="label_lastName" class="valid"><spring:message code="lab_customerLastName" /></label>
											<label id="lab_customerLastNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
			</div>
			
                      	
			 <input type="hidden" id="pinCodeFlag" name="pinCodeFlag"  value="" />
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="lab_dobErrorId"></div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="submit" value="Update" class="btn btn-warning"
					onclick="return validateCreatebank(event);" />

			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<font color="green">${msg}</font>
			</div>

		</div>

		<input type="hidden" id="contextPath" name="contextPath"
			value="${pageContext.request.contextPath}" />

            <form:hidden id="hiddenId" name="hiddenId" path="hiddenId"  value="${bankId}" />
		<form:hidden  id="pinaddressId" name="pinaddressId"  path="pinaddressId"  value="${bankRegistrationData.pinaddressId}" />
		
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

	</form:form>

	<script>
		$("#showSubmit").hide();
	</script>
</body>
</html>



