<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PortalRegistration.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/additional-methods.min.js"></script>
</head>
<body>
		<form:form method="post" modelAttribute="portalRegistrationData"
			id="portalForm" action="${pageContext.request.contextPath}/AdminUI/portalCreation/portalCreationSubmit"
			enctype="multipart/form-data">

			  <div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_Portal_reg_Title"/></h1>
	                      <div class="clearfix"></div>
						<hr></hr>
						<c:if test="${successMessage!=''}">
					 	<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                       <p class="text-success">${successMessage}</p> 
						</div> 
						</c:if>
						<c:if test="${errorMessage!=''}">
					 	<div id="errorId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                       <p class="text-danger">${errorMessage}</p> 
						</div> 
						</c:if>
				</div>
					<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					    <div id="div_companyNameId" class="styled-input">
						
							<form:input id="companyNameId" path="companyName" name="companyName" type="text" class="selecttag"
							onkeypress="blockSpecialChar(event,'companyNameErrorId');"
							 maxlength='100' onfocus="removeHasError('div_companyNameId');showlabel('companyNameId1','companyNameErrorId')"
					          onChange="selecttag('companyNameId1','companyNameId');checkDuplicateAccount()" />
							<label id="companyNameId1"><spring:message code="lab_companyName"/></label>
							<label id="companyNameErrorId" class="collapse"></label><span></span>
						</div>
					</div>
						<div id='lab_details' class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="containersimg">
					     <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table"  id="portalUrlTable"  >
								<tr>
									<td colspan="2" align="center"><input type="button" value="Add more Url" onclick="addRows('portalUrlTable')" />
										<input type="button" value="Delete Url" onclick="deleteRow('portalUrlTable')" /><span
														id="errmsgportalUrlTableValue" style="color: red"></span></td>
											</tr>
										</table>
									</div>
								</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="containersimg">
					     
				</div>
				
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_companyUrlId" class="styled-input">
						
					<form:input id="companyUrlId" path="portalurls" name="portalurl" type="text" 
							 maxlength='100' class="selecttag" onfocus="showlabel('companyUrlId1','companyUrlErrorId')"
					        onChange="selecttag('companyUrlId1','companyUrlId');checkDuplicateUrl(event);" />
						<label id="companyUrlId1"><spring:message code="lab_companyURL"/></label>
						<label id="companyUrlErrorId" class="collapse"></label><span></span>							
						</div>
						</div>
				
									<!-- <div style="height:100px; overflow:auto"> -->
					
			</div>
			
			
				  <div class="heading-inner">
					 <h1><spring:message code="lab_Personal_details" /></h1>
				  </div>
				  <hr></hr>
									<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
					     					<div  class="styled-input"id="div_personNameId" >
											<spring:message code="lab_PersonName" var="lab_PersonName" />
											<form:input id="houseNoId" path="personName" name="personName" type="text"  placeholder=""
													onkeypress="blockSpecialChar(event,'hostIdErrorId');" class="selecttag"
													onfocus="showlabel('houseNoId1','hostIdErrorId');removeHasError('div_personNameId')"
					                     	onChange="selecttag('houseNoId1','houseNoId');" maxlength='30' />
													 <label id="houseNoId1">${lab_PersonName}</label>
													 <label id="hostIdErrorId" class="collapse"></label><span></span>
											</div>
									</div>
									<!--------------------  E-Mail ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" >
					     						
					     						<form:input id="emailIds" path="email" name="email" type="text" 
													onchange="selecttag('emailId1','emailIds');emailValidation(event,'emailIds','emailErrorId');"
													onclick="emptyerror(event,'emailErrorId');" class="selecttag"
													onfocus="showlabel('emailId1','emailErrorId')"
					                     			maxlength='30' />
													<label id="emailId1"><spring:message code="lab_Email" /></label>
													 <label id="emailErrorId" class="collapse"></label><span></span>
										</div>
									</div>
									<!--------------------  Contact number 1 ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" >
					     					<spring:message code="lab_ContactPersonNumber" var="lab_ContactPersonNumber"/>
											<form:input id="lab_contactOne" path="phoneNumberOne" name="Contact Number" type="text"
												onkeypress="onlyNumric(event,'phoneNumberOneErrorId');" class="selecttag"
												onfocus="showlabel('lab_contactOneId','phoneNumberOneErrorId')"
					                     	onChange="selecttag('lab_contactOneId','lab_contactOne');" placeholder="" maxlength='12' />
											<label id='lab_contactOneId'>${lab_ContactPersonNumber}</label>
											<label id='phoneNumberOneErrorId' class='collapse'></label><span></span>
											</div>
										</div>

										<!--------------------  Contact number 2 ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" >
					     					<spring:message code="lab_ContactPersonNumberTwo" var="lab_ContactPersonNumberTwo" />
											<form:input id="lab_contactTwo" path="phoneNumberTwo" name="contactNumber"
													type="text" onkeypress="onlyNumric(event,'phoneNumberTwoErrorId');" class="selecttag"
													onfocus="showlabel('lab_contactTwoId','phoneNumberTwoErrorId')"
					                     	onChange="selecttag('lab_contactTwoId','lab_contactTwo');" placeholder="" maxlength='12' />
											<label id="lab_contactTwoId">${lab_ContactPersonNumberTwo}</label>
											<label id="phoneNumberTwoErrorId" class='collapse'></label>
										</div>
										</div>
											<!--------------------   Contact number 3 ---------------------------------------------------------->
											<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     						<div class="styled-input" >
					     							<spring:message code="lab_ContactPersonNumberThree" var="lab_ContactPersonNumberThree"/>
													<form:input id="lab_contactThree" path="phoneNumberThree" name="contactNumber"
													type="text" onkeypress="onlyNumric(event,'phoneNumberThreeErrorId');"
													onfocus="showlabel('lab_contactThreeId','phoneNumberThreeErrorId')"
					                     	onChange="selecttag('lab_contactThreeId','lab_contactThree');" placeholder="" maxlength='12' class="selecttag" />
													<label id="lab_contactThreeId">${lab_ContactPersonNumberThree}</label>
													<label id="phoneNumberThreeErrorId" class="collapse"></label><span></span>
												</div>
										   </div>

									</div>
						</div>
				<div class="row" id='lab_Address'>
						<div class="heading-inner">
				 <h1><spring:message code="lab_Address" /></h1>
				 </div>
				 <hr></hr>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     			<div class="styled-input" >
					     					<spring:message code="lab_HouseNoStreet" var="lab_HouseNoStreet"/>
												<form:input id="houseNoId" path="houseNo" name="houseNo" type="text"
													onkeypress="blockSpecialChar(event,'houseNoStreetErrorId');" class="selecttag"
													onfocus="showlabel('houseNoId1','houseNoStreetErrorId');"
					                     	onChange="selecttag('houseNoId1','houseNoId');" placeholder="" maxlength='30' />
													<label id="houseNoId1">${lab_HouseNoStreet}</label>
													<label id="houseNoStreetErrorId" class="collapse"></label><span></span>
										</div>
								</div>
											<!--------------------  City Name ---------------------------------------------------------->
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     			<div class="styled-input" >
					     				<spring:message code="lab_City" var="lab_City"/>
											<form:input id="cityId" path="city" name="city" type="text"  maxlength='30'  class="selecttag"
													onfocus="showlabel('cityId1','cityErrorId')"
					                     	onChange="selecttag('cityId1','cityId');" onkeypress="blockSpecialChar(event,'cityErrorId');" placeholder=""/>
											<label id="cityId1">${lab_City}</label>
											<label id="cityErrorId" class="collapse"></label><span></span>
										</div>
									</div>
										<!--------------------  LandMark ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
					     						<spring:message code="lab_LandMark" var="lab_LandMark" />
													<form:input id="lab_LandMark" path="landMark" name="landMark" type="text"
													onkeypress="blockSpecialChar(event,'landMarkErrorId');" class="selecttag"
													 onfocus="showlabel('lab_LandMarkId','landMarkErrorId')"
					                     	onChange="selecttag('lab_LandMarkId','lab_LandMark');" placeholder="" maxlength='50' />
												<label id="lab_LandMarkId">${lab_LandMark}</label>
											<label id='landMarkErrorId' class="collapse"></label><span></span>
											</div>
										</div>
										<!--------------------  Country ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
					     						<spring:message code="lab_Country" var="lab_Country"/>
													<form:input id="countryId" path="countryId" class="selecttag" onfocus="showlabel('countryId1','countryErrorId')"
					                     	onChange="selecttag('countryId1','countryId'); emptyerror(event,'countryErrorId');" />
												<label id="countryId1">${lab_Country}</label>
												<label id="countryErrorId" class="collapse"></label><span></span>
											</div>
										</div>
											<!--------------------   State ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
					     						<spring:message code="lab_State" var="lab_State" />
													<form:input id="stateId" path="stateId" class="selecttag" onfocus="showlabel('stateId1','stateErrorId')"
					                     	onChange="selecttag('stateId1','stateId');emptyerror(event,'stateErrorId');" />
												<label id="stateId1">${lab_State}</label>
												<label id="stateErrorId" class="collapse"></label><span></span>
											</div>
										</div>
										<!--------------------   Pin ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
												<spring:message code="lab_Pin" var="lab_Pin" />
													<form:input id="pinCodeId" path="pinCode" name="pinCode" class="selecttag" type="text" placeholder="" maxlength="6"
													onpaste="return validateNumeric(event,'pinCodeErrorId')" onkeypress="onlyNumric(event,'pinCodeErrorId');" 
												onfocus="showlabel('pinCodeId1','pinCodeErrorId')" onChange="selecttag('pinCodeId1','pinCodeId');" 	/>
												<label id="pinCodeId1">${lab_Pin}</label>
												<label id="pinCodeErrorId" class="collapse"></label>
											</div>
										</div>
										
									</div>
					</div>
				<!------------------------ Account Type------------------ -->

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="encryptionRowId">
					 <div id="div_encryptionKeyId" class="styled-input" >
						 <spring:message code="LABEL_ENCRYPTION_KEY" var="LABEL_ENCRYPTION_KEY"/>
							  <form:input id="encryptionKeyId" path="encryptionKey" maxlength="48" type="text"
									onpaste="return validateAlphaNumericOnPaste(event,'encryptionKeyErrorId')" class="selecttag"
									onfocus="showlabel('encryptionKeyId1','encryptionKeyErrorId')" onChange="selecttag('encryptionKeyId1','encryptionKeyId');" 
					                onkeypress="disableSpecialCharacterWithSpace(event,'encryptionKeyErrorId');" />
								<label id='encryptionKeyId1'>${LABEL_ENCRYPTION_KEY}</label>
								<label id="encryptionKeyErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
					 <div id="div_callBackUrl" class="styled-input" >
					 <spring:message code="lab_callBackUrl" var="lab_callBackUrl"/>
					 <form:input id="callBackUrl" path="callBackUrl" class="selecttag" type="text" 
					 	onclick="emptyerror(event,'callBackUrlErrorId');" onchange="selecttag('callBackUrlId','callBackUrl');"
					 	onfocus="showlabel('callBackUrlId','callBackUrlErrorId');"/>
					 	<label id="callBackUrlId">${lab_callBackUrl}</label>
					 	<label id="callBackUrlErrorId" class="collapse"></label>
					 </div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 mt text-center">
				<input type="submit" value="Submit" class="btn btn-warning" onclick=" return validatePortalRegistration('portalForm',event);" />
				<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}" />
				</div>
				<c:if test="${msg!=''}">
					 	<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
						<h3  style="color: green;">${msg}</h3>
				</div>
				</c:if>
		</form:form>

	<script>
		$("#showSubmit").hide();
	</script>
</body>
</html>