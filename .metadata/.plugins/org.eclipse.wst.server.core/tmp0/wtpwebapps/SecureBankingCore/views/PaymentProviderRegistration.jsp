<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ServiceProviderRegistration.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>



<title>Service Provider Registration</title>



</head>
<body onload="mapInitialize('mapCanvas')">
	<div>
		<form:form id="paymentProviderform" name="paymentProviderform"
			method="post" modelAttribute="sysServiceProviderListData"
			action="${pageContext.request.contextPath}/AdminUI/ProviderMgmt/providerRegistration"
			enctype="multipart/form-data">
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="Service Provider Registration"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                      <c:if test="${MessageAfterAddPartner!=''}">
									<div id="sonu"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${MessageAfterAddPartner}</p> 
									</div> 
							</c:if>	 
							<c:if test="${MessageAddPartner!=''}"> 
								
				          				 <div id="success" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-success">${MessageAddPartner}</p> 
									 
										</div>
								</c:if> 
								
								
								
								
				
	          	</div>
	              
				<div>
				
            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        	<div id="provider_name_errorId" class="styled-input">
			    					  <form:input path="providerName"  id="providerName" class="selecttag" type="text" maxlength='50' 
										onchange="checkName(event,'providerNameErrorId');selecttag('label_providerName','providerName')" onclick="removeHasError('provider_name_errorId');removemsg('success')"
										onfocus="showlabel('label_providerName','providerNameErrorId');emptyerror('providerNameErrorId'); removeHasError('provider_name_errorId');" />
		                          <label id="label_providerName"class="valid"><spring:message code="lab_provider_name" /> </label>
		                           <label id=providerNameErrorId class="collapse"></label>
		                          <span></span>
                          </div>
                      </div>
                      
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                          <div class="col-md-4 col-lg-4 pr0">
                            		<div id="country_CodeId1" class="styled-input">
											<form:select id="countryCodeId" class="selecttag" name="countryCode" path="countryCodeId" onchange="selecttag('countryCodeId1','countryCodeId');removeHasError('country_CodeId1');"
											  onclick="removemsg('success');this.setAttribute('value', this.value);" value="">
												<form:option value="" label=" " />
										 		<form:options items="${countryCodeMap}" />
												
										</form:select>
										<label id="countryCodeId1"class="valid">Country Code</label>
									</div>
                          </div>
                        <div class="col-md-8 col-lg-8 pl0">
                            <div  id="provider_PhoneNoErrorId"  class="styled-input">
									<form:input id="providerPhoneNo"
										path="phoneNumber" type="text" maxlength="10" class="selecttag" onclick="removemsg('success');showlabel('label_providerPhoneNo','providerPhoneNoErrorId');"
										onchange="selecttag('label_providerPhoneNo','providerPhoneNo');showlabel('label_providerPhoneNo','providerPhoneNoErrorId');"
										onfocus="emptyerror('providerPhoneNoErrorId');showlabel('label_providerPhoneNo','providerPhoneNoErrorId');removeHasError('provider_PhoneNoErrorId');"
										onkeypress="blockSpecialChar(event,'providerPhoneNoErrorId');" onkeyup="onlyNumeric('providerPhoneNo','providerPhoneNoErrorId','label_providerPhoneNo');" />
											 <label id="label_providerPhoneNo"class="valid" ><spring:message code="lab_provider_phone_no" /></label>
											 <label id=providerPhoneNoErrorId class="collapse"></label>
											 <span></span>
							</div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                          <div class="col-md-4 col-lg-4 pr0">
                            	<div class="styled-input">
                            		
									<form:select  id="altCountryCodeId" class="selecttag" name="altcountryCode" path="altCountryCodeId" 
									onchange="selecttag('altCountryCodeId1','altCountryCodeId');" onclick="removemsg('success');this.setAttribute('value', this.value)" value="" >
										<form:option value="" label=" " />
										 <form:options items="${countryCodeMap}" /> 
									</form:select>
											<span></span>
											<label id="altCountryCodeId1"class="valid">Country Code</label>
									</div>
                          </div>
                          <div class="col-md-8 col-lg-8 pl0">
                            <div class="styled-input">
			    					<form:input id="providerAltPhoneNo" class="selecttag"
										path="altPhoneNumber" type="text" maxlength="10" onclick="removemsg('success');showlabel('label_providerAltPhoneNo','providerAltPhoneNoErrorId');"
										onchange="selecttag('label_providerAltPhoneNo','providerAltPhoneNo');"
										onfocus="emptyerror('providerAltPhoneNoErrorId');showlabel('label_providerAltPhoneNo','providerAltPhoneNoErrorId');"
										onkeypress="blockSpecialChar(event,'providerAltPhoneNoErrorId');" onkeyup="onlyNumeric('providerAltPhoneNo','providerAltPhoneNoErrorId','label_providerAltPhoneNo');" />
									<label id="label_providerAltPhoneNo"class="valid"><spring:message code="lab_Provider_alt_phone_no" /></label>
									<label id=providerAltPhoneNoErrorId class="collapse"></label>
									<span></span> </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        	<div id="provider_EmailNoErrorId" class="styled-input">
								<form:input id="providerEmailId"  class="selecttag"
										path="emailId" type="text" maxlength="40" onclick="removemsg('success')"
										onchange="selecttag('label_providerEmailId','providerEmailId')"
										onfocus="emptyerror('providerEmailNoErrorId');showlabel('label_providerEmailId','providerEmailNoErrorId');removeHasError('provider_EmailNoErrorId');" />
		                          <label id="label_providerEmailId"class="valid"><spring:message code="lab_provider_email_id" /> </label>
		                           <label id=providerEmailNoErrorId class="collapse"></label>
		                          <span></span>
                          </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        	<div class="styled-input">
								<form:input path="providerDescription" id="providerDescriptionId" class="selecttag"
										type="text" maxlength="100" onchange="selecttag('label_providerDescription','providerDescription')" onclick="removemsg('success')"
										onfocus="emptyerror(event,'providerDescriptionErrorId');showlabel('label_providerDescription','providerDescriptionErrorId');" />
		                          <label id="label_providerDescription"class="valid"><spring:message code="lab_provider_description" /> </label>
		                           <label id=providerDescriptionErrorId class="collapse"></label>
		                          <span></span>
                          </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        	<div class="styled-input" id="serviceCategoriesDiv">
								  <form:select path="serviceCategories" id="serviceCategories" multiple="false" onclick="removeHasError('serviceCategoriesDiv');removemsg('success')" onchange="removeHasError('serviceCategoriesDiv');">
										  <form:option value="" label=" "/>
										<form:options items="${serviceCategories}" />
						</form:select>	
		                          <label id="label_serviceCategories" class="valid"><spring:message code="lab_serviceCategory" /> </label>
		                           <label id=providerCategoryErrorId class="collapse"></label>
		                          <span></span>
                          </div>
                      </div>
         
                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                     	 <div id='categoryDivId' class="collapse"></div>
                     </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                     	 <div id="divId"></div>
                     	 <div id="providerNameAndCategoryErrorId"></div>
                     	 <div id="hostErrorId"></div>
                     	
                     </div>
                     
                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
								<input type="submit" class="btn btn-warning"
									onclick=" return providerFormValid(event);"
									value="Register" />
                     </div>
                     
				</div>
			
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
			
		</form:form>
		<script>
   	 </script>
	</div>
</body>
</html>