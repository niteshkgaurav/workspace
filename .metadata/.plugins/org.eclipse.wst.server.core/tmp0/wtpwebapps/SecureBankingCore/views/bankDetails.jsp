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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

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
</head>
<body>
	
		<form:form method="post" modelAttribute="bankRegistrationData"
			id="portalForm"
			action="${pageContext.request.contextPath}/AdminUI/bankCreation/bankCreationSubmit"
			enctype="multipart/form-data">
				<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_bank_reg_Title"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="errorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
							
	                   </div>
	                   <div class="row">
	          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_bankNameId" class="styled-input">
								<form:input 
									id="bankNameId" path="bankName" name="bankName" 
									type="text" onfocus="removeHasError('div_bankNameId');showlabel('label_bankNameId','bankNameErrorId');"
									onkeypress="blockSpecialChar(event,'bankNameErrorId');"
									maxlength='50' class="selecttag" onclick="emptyerror11('msgId')"
									onchange="selecttag('label_bankNameId','bankNameId');checkDuplicateBankName()" />
											<label id="label_bankNameId"><spring:message code="lab_bankName" /></label>
											<label id="bankNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_bankDescriptionId" class="styled-input">
								<form:input 
									id="bankDescriptionId" path="bankDescription" name="bankDescription"
									type="text" class="selecttag" onfocus="removeHasError('div_bankDescriptionId')"
									onkeypress="blockSpecialChar(event,'bankNameErrorId');" onclick="emptyerror11('msgId')"
									maxlength='50' onchange="selecttag('label_bankDescriptionId','bankDescriptionId');"/>
											<label id="label_bankDescriptionId"><spring:message code="lab_BankDescription" /></label>
											<label id="bankNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_bankShortNameId" class="styled-input">
								<form:input 
									id="bankShortNameId" path="bankShortName" name="bankShortName" maxlength='4'
									type="text" class="selecttag" onfocus="removeHasError('div_bankShortNameId')"
									onkeypress="blockSpecialChar(event,'bankShortNameErrorId');" onclick="emptyerror11('msgId')"
									onchange="selecttag('label_bankShortNameId','bankShortNameId');checkDuplicateBankShortName()" />
											<label id="label_bankShortNameId"><spring:message code="lab_bankShortName" /></label>
											<label id="bankShortNameErrorId" class="collapse"></label>
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
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                       			<spring:message
											code="lab_Address" />
								<hr></hr>
                        
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_firstName" class="styled-input">
									<form:input type="text" class="selecttag"
												onfocus="removeHasError('div_firstName')"
												onkeypress="onlyAlphabet(event,'lab_customerFirstNameErrorId');"
												path="firstName" onchange="selecttag('label_firstName','firstName');" />
											<label id="label_firstName"><spring:message code="lab_customerFirstName" /></label>
											<label id="lab_customerFirstNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_lastName" class="styled-input">
									<form:input type="text" path="lastName"
												class="selecttag" onchange="selecttag('label_lastName','lastName');"
												onfocus="removeHasError('div_lastName')" />
											<label id="label_lastName"><spring:message code="lab_customerLastName" /></label>
											<label id="lab_customerLastNameErrorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<c:if test="${deployedFor=='DEFAULT'}">
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div class="row">
                          		<div class="col-md-4 col-lg-4 pr0">
                            		<div id="div_pinCode" class="styled-input">
										<form:input type="text" path="pinCode" class="selecttag" 
										maxlength="6" onkeypress="onlyNumric11(event,'lab_pinCodeErrorId','label_pinCode')"
												onchange="selecttag('label_pinCode','pinCode');" 
												onfocus="removeHasError('div_pinCode');showlabel('label_pinCode','lab_pinCodeErrorId')" />
												<label id="label_pinCode"><spring:message code="lab_pinCode" /></label>
												<label id="lab_pinCodeErrorId" class="collapse"></label>
										</div>
									</div>
									<div class="col-md-8 col-lg-8 pl0">
                            			
                            				<input type="button" id="addressFetchId" class="btn btn-warrning"
                            				value="Fetch Address" onclick="fetchAddress();"/>
                            			
                            		</div>
                      	</div>
                      	
                      </div>
                      
                    </c:if>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_mobileNumber" class="styled-input">
										<form:input type="text" class="selecttag" onfocus="removeHasError('div_mobileNumber')" maxlength="12"
													onchange="selecttag('label_mobileNumber','mobileNumber');"
													onkeypress="return isNumberKey(event);"
													path="mobileNumber" onKeypress="onlyNumric(event,mobileNumberErrorId);"/>
											<label id="label_mobileNumber"><spring:message code="mobileNumber" /></label>
											<label id="mobileNumberErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_alternateMobileNumber" class="styled-input">
										
										<form:input type="text" path="alternateMobileNumber" 
										class="selecttag" onfocus="removeHasError('div_alternateMobileNumber')"
										onchange="selecttag('label_alternateMobileNumber','alternateMobileNumber');"
										onKeypress="onlyNumric(event,alternateMobileNumberErrorId);" />
											<label id="label_alternateMobileNumber"><spring:message code="alternateMobileNumber" /></label>
											<label id="alternateMobileNumberErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div id='addressSelectDivId' style='display:none'>
	  									<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'>
	  									</table>
	  					</div>
                    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_address" class="styled-input">
										<form:input type="text" path="address" class="selecttag" 
												onchange="selecttag('label_address','address');"
												onfocus="removeHasError('div_address')"/>
											<label id="label_address"><spring:message code="lab_address" /></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" 
												onchange="selecttag('label_locality','locality');" readonly="true"
												onfocus="removeHasError('div_locality')"/>
											<label id="label_locality"><spring:message code="lab_locality" /></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" 
												onchange="selecttag('label_region','region');" readonly="true"
												onfocus="removeHasError('div_region')"/>
											<label id="label_region"><spring:message code="lab_Region" /></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_district" class="styled-input">
										<form:input type="text" id="district" path="district" class="selecttag" 
												onchange="selecttag('label_district','district');" readonly="true"
												onfocus="removeHasError('div_district')"/>
											<label id="label_district"><spring:message code="lab_district" /></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" 
												onchange="selecttag('label_state','state');" readonly="true"
												onfocus="removeHasError('div_state')"/>
											<label id="label_state"><spring:message code="lab_State" /></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" 
												onchange="selecttag('label_country','country');" readonly="true"
												onfocus="removeHasError('div_country')"/>
											<label id="label_country"><spring:message code="lab_Country" /></label>
											<label id="lab_CountryErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_datepick" class="styled-input">
										<form:input id="datepick" type="text"
													onfocus="removeHasError('div_datepick')"
													onchange="selecttag('label_datepick','datepick');"
													path="dob" class="selecttag" />
											<label id="label_datepick"><spring:message code="lab_dob" /></label>
											<label id="lab_dobErrorId" class="collapse"></label>
					    	</div>
                      </div> --%>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_emailId" class="styled-input">
										<form:input id='emailId' type="text" onblur="validateEmail(this);" class="selecttag" 
													path="email" onfocus="removeHasError('div_emailId')"
													onchange="selecttag('label_emailId','emailId');"
													onclick="emptyerror(event,'lab_Email_IdErrorId');" />
											<label id="label_emailId"><spring:message code="lab_Email_Id" /></label>
											<label id="lab_Email_IdErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                       			<input type="submit" value="Submit" class="btn btn-warning"
								onclick=" return validatePortalRegistration('portalForm',event);" />
								
	                  </div>
	                   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                   			<font color="green">${msg}</font>
	                   </div>
                       
                     
                      
                  </div>
                  <form:hidden id="hiddenId" name="hiddenId" path="hiddenId"  value="" />
			
			<input type="hidden" id="contextPath" name="contextPath"
					value="${pageContext.request.contextPath}" />
			
			
			 <form:hidden id="pinaddressId"   path="pinaddressId"   name="pinaddressId" value=""/>
		
		</form:form>

	<script>
		$("#showSubmit").hide();
	</script>
</body>
</html>