	<%@page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@page import="java.util.*" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/UserLoginCreation.js></script>
		<script type="text/javascript">
		function removeStyleTag(id)
		{
			$("#"+id).attr("style","");
		}
		</script>
</head>
<body>

<form:form id="listEditForm" name="listEditForm"  method="post" modelAttribute="accountCreationData" action="${pageContext.request.contextPath}/AdminUI/account/accountEditSubmitNew"  enctype="multipart/form-data"> 
      <div class="heading-inner ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="LABEL_ACCOUNT_EDIT"/></h1>
	                      <div class="clearfix"></div>
						<hr></hr>
						<div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${MessageAfterBCRegistration}</font></p> 
									</div> 
				  </div>  
   <div class="row">      

  					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
		              <div id="div_companyNameId" class="styled-input">
  						<form:input id="companyNameId" path="companyName" name="companyName"  type="text" class='selecttag'  
  							onkeypress="blockSpecialChar(event,'companyNameErrorId','companyNameId1');" 
  							onclick="emptyerror(event,'companyNameErrorId');" onfocus="showlabel('companyNameId1','companyNameErrorId');removeHasError('div_companyNameId');" 
  			 				  onchange="return checkDuplicateAccountEdit(); checkCompName('companyNameId'); selecttag('companyNameId1','companyNameId');"
  							 placeholder="" maxlength='100'  />
  							 <label id="companyNameId1" class="valid">*&nbsp;<spring:message code="lab_companyName"/></label>
	     					<label id="companyNameErrorId" class="collapse" style="display: inline-block;"></label><span></span>
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
							<form:input type="text" path="pinCode" class="selecttag" id="pinCode" maxlength="6"
								onchange="selecttag('label_pinCode','pinCode');" onclick="clearField('label_pinCode','lab_pinCodeErrorId');refresh('statusMessage');refresh('errorstatusMessage')"
								onfocus="removeHasError('div_pinCode')" onkeypress="onlyNumric(event,'label_pinCode1','lab_pinCodeErrorId1','pinCode');changeValues()"/>
							<label id="label_pinCode" class="valid" ><spring:message
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
										<form:input id="address" type="text" path="address" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_address')"
												onchange="selecttag('label_address','address');"
												onfocus="removeHasError('div_address')"/>
											<label id="label_address" class="valid"><spring:message code="lab_address" /></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_locality')"
												onchange="selecttag('label_locality','locality');"
												onfocus="removeHasError('div_locality')"/>
											<label id="label_locality" class="valid"><spring:message code="lab_locality" /></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_region','region');"
												onfocus="removeHasError('div_region')"/>
											<label id="label_region" class="valid"><spring:message code="lab_Region" /></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_district" class="styled-input">
										<form:input type="text" id="district" path="district" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_district')"
												onchange="selecttag('label_district','district');"
												onfocus="removeHasError('div_district')"/>
											<label id="label_district" class="valid"><spring:message code="lab_district" /></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_state')"
												onchange="selecttag('label_state','state');" 
												onfocus="removeHasError('div_state')"/>
											<label id="label_state" class="valid"><spring:message code="lab_State" /></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_country')"
												onchange="selecttag('label_country','country');" 
												onfocus="removeHasError('div_country')"/>
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

					<form:input type="text" path="address" id="address"
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
					<label id="locality1" class="valid">${lab_locality}</label> <label
						id="localityErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="lab_Region" var="lab_Region" />
					<form:input type="text" id="region" path="region" class='selecttag'
						readonly="${readonlyValue}"
						onchange="selecttag('regionId1','region');"></form:input>
					<label id="regionId1" class="valid">${lab_Region}</label> <label
						id="regionErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input" id="div_district" >
					<spring:message code="lab_district" var="lab_district" />
					<form:input type="text" id="district" path="district"
						class='selecttag' readonly="${readonlyValue}" onfocus="removeHasError('div_district');"
						onchange="selecttag('districtId1','district');" />
					<label id="districtId1" class="valid">${lab_district}</label> <label
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
					<label id="state1" class="valid">*&nbsp;${lab_State}</label> <label
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

					<label id="country1" class="valid">*&nbsp;<spring:message
							code="lab_Country" /></label> <label id="countryErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			
			 </c:if>
					</div> 	
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <div class="clearfix"></div>
	      </div>
					<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input"><spring:message code="lab_pinCode" var="lab_pinCode"/>
							<form:input type="text"  maxlength="6" path="pinCode" placeholder="" id="pinCode" class='selecttag'  
							  onclick="emptyerror(event,'lab_pinCodeErrorId');" onkeypress="onlyNumric(event,'lab_pinCodeErrorId','${lab_pinCode}'); " 
							  onfocus="showlabel('pinCodeId','lab_pinCodeErrorId');" 
  			 				  onchange="selecttag('pinCodeId','pinCode'); pinValidation(); changePinCode('${readonlyValue}');"/>
							  <label id="pinCodeId" class="valid">${lab_pinCode}</label>
							  <label id="lab_pinCodeErrorId" class="collapse"></label>
							<div <spring:message code="account.pincode"/>>
		              			<input type="button" id="addressFetchId" value="Fetch Address" onclick="fetchAddress();" />
					  		 </div>
						</div>
					</div>
					
 				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div id="div_address" class="styled-input"><spring:message  code="lab_address" var="lab_address"/>
								<form:input type="text" path="address" class='selecttag'  
										onclick="emptyerror(event,'lab_addressErrorId');" 
										  onfocus="showlabel('address1','lab_addressErrorId');removeHasError('div_address');" 
  			 				  onchange="selecttag('address1','address');" />
								<label id="address1" class="valid">*&nbsp;${lab_address}</label>
								<label id="lab_addressErrorId" class="collapse"></label>
					</div>
					</div>
										
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input"><spring:message code="lab_address2" var="lab_address2"/>
								<form:input type="text" path="addressTwo" id="address2" class='selecttag'
									placeholder="" onclick="emptyerror(event,'lab_addressErrorId');" />
								<label id="addressId2" class="valid">${lab_address2}</label>
					</div></div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input"><spring:message code="account.readonly" var="readonlyValue"/>
							<form:input type="text" id="locality" readonly="${readonlyValue}"  class='selecttag' 
							onfocus="showlabel('locality1','lab_localityErrorId');" 
  			 				  onchange="selecttag('locality1','locality');" 
									path="locality"  />
									<label id="locality1" class="valid"><spring:message code="lab_locality" /></label>
									<label id="lab_localityErrorId" class="collapse"></label>
						</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input">
							<form:input type="text" path="region" readonly="${readonlyValue}" class='selecttag'
							 onfocus="showlabel('region1','lab_regionErrorId');" 
  			 				  onchange="selecttag('region1','region');"/>
							<label id="region1" class="valid"><spring:message code="lab_Region" /></label>
							<label id="lab_regionErrorId" class="collapse"></label>
						</div>
					</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div class="styled-input">
								<form:input type="text" readonly="${readonlyValue}"	path="district" class='selecttag' 
								 onfocus="showlabel('district1','lab_districtErrorId');" 
  			 				  onchange="selecttag('district1','district');"/>
								<label id="district1" class="valid"><spring:message code="lab_district" /></label>
									<label id="lab_districtErrorId" class="collapse"></label>
						</div></div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div id="statedivId" class="styled-input">
							<form:input type="text" path="state" readonly="${readonlyValue}" class='selecttag' 
							 onfocus="showlabel('state1','lab_StateErrorId');  removeHasError('statedivId');" 
  			 				  onchange="selecttag('state1','state');"/>
							<label id="state1" class="valid">*&nbsp;<spring:message code="lab_State" /></label>
							<label id="lab_StateErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div id="countrydivId" class="styled-input">
								<form:input type="text" path="country" readonly="${readonlyValue}" class='selecttag' 
								onfocus="showlabel('country1','lab_CountryErrorId'); removeHasError('countrydivId');" 
  			 				  onchange="selecttag('country1','country');"/>
								<label id="country1" class="valid">*&nbsp;<spring:message  code="lab_Country" /></label>
								<label id="lab_CountryErrorId" class="collapse"></label>		
						</div>
				</div> --%>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		              <div id="div_emailId" class="styled-input"><spring:message code="lab_Email_Id" var="lab_Email_Id"/>
						<form:input id='emailId' type="text" path="email" class='selecttag' 
						onfocus="showlabel('emailId1','lab_Email_IdErrorId');  removeHasError('div_emailId');" 
  			 				  onchange="selecttag('emailId1','emailId');checkUniqueUserEmailIdEdit();" 
							onclick="emptyerror(event,'lab_Email_IdErrorId');" />
							<label id="emailId1" class="valid">*&nbsp;${lab_Email_Id}</label>
							<label id="lab_Email_IdErrorId" class="collapse"></label>
					 </div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="div_mobileNumber"  class="row">
                          <div class="col-md-4 col-lg-4 pr0">
                          <div id="div_countryCodeId" class="styled-input"><spring:message code="mobileNumber" var="mobileNumber"/>
								<form:select  name="countryCode" path="countryCodeId" class="selecttag" value=""
								onfocus="showlabel('countryCodeId1','countryCodeerroeId1');  removeHasError('div_countryCodeId');" 
								>
								<form:option  value="" label=" "/>
								 <form:options items="${countryCodeMap}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Country Code</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
							</div></div>
									<div class="col-md-1 col-lg-1 pl0"></div>
									<div class="col-md-7 col-lg-7 pl0">    
									 <div  id="div_mobileNumberId" class="styled-input">
											<form:input type="text" id="mobileNumber" path="mobileNumber" maxlength="10" class="selecttag"
											
											onkeyup="onlyNumric(event,'mobileNumberErrorId','mobileNumber1','mobileNumber');" 
											
												onclick="emptyerror(event,'mobileNumberErrorId');"
											onfocus="showlabel('mobileNumber1','mobileNumberErrorId'); removeHasError('div_mobileNumberId')" 
  			 				  				onchange="onlyNum('mobileNumber');selecttag('mobileNumber1','mobileNumber'); checkUniqueUserMobileNumber(); mobLength(event,mobileNumberErrorId)"/>
											<label id="mobileNumber1" class="valid">*&nbsp;${mobileNumber}</label>
											<label id="mobileNumberErrorId" class="collapse"></label>
								</div>				
							</div>
							</div>
					</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                        	<div class="col-md-4 col-lg-4 pr0">
                          <div id="altCountryCodeErrorId_div" class="styled-input"><spring:message code="alternateMobileNumber" var="alternateMobileNumber"/>
										<form:select  name="altCountryCodeId" id="altCountryCodeId" path="altCountryCodeId" class="selecttag" value="">
										<form:option  value="" label=" "/>
										<form:options items="${countryCodeMap}" /> 
										</form:select>
									<label id="altCountryCodeId1" class="valid">Country Code</label> <label
								id="altCountryCodeErrorId" class="collapse"></label><span></span>
							</div></div>
							<div class="col-md-1 col-lg-1 pl0"></div>
								<div class="col-md-7 col-lg-7 pl0">
							                            	<div class="styled-input">
											<form:input type="text" id="alternateMobileNumber" path="alternateMobileNumber" maxlength="10" class="selecttag" 
											onKeypress="onlyNumricFormobile(event,'alternateMobileNumberErrorId');"
											onclick="emptyerror(event,'alternateMobileNumberErrorId');" 
												onkeyup="onlyNumric(event,'alternateMobileNumber1','alternateMobileNumberErrorId','alternateMobileNumber');" 
											onfocus="showlabel('alternateMobileNumber1','alternateMobileNumberErrorId'); removeHasError('div_mobileNumberId')" 
  			 				  				onchange="selecttag('alternateMobileNumber1','alternateMobileNumber'); mobLength(event,alternateMobileNumberErrorId)"/>
											<label id="alternateMobileNumber1" class="valid">${alternateMobileNumber}</label>
											<label id="alternateMobileNumberErrorId" class="collapse"></label> 
								</div>
							</div>
						</div>
						</div>
  			</div>
  
   

 
        <div class="container-fluid">
        <div class="row">
        	
        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		       		<div class="styled-input">	
		       			<spring:message code="LABEL_STATUS" var="LABEL_STATUS"/>
        				<form:select id="accountStatus" path="accountStatus" name="accountStatus" class="selecttag"
        				onfocus="showlabel('accountStatus1','accountStatusErrorId');" onchange="selecttag('accountStatus1','accountStatus');" >            
   								 <form:option value="0" label="Unblocked"/>
   								 <form:option value="1" label="Blocked"/>                                         
     						</form:select> 
     						<label id="accountStatus1" class="valid">${LABEL_STATUS}</label>
     						<label id="accountStatusErrorId" class="collapse"></label>
        	</div></div>
        	</div>
        </div>
        		  
        	
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
					<input type='submit' class="btn btn-warning"  value="Submit" onclick="return validateAccountEditForm(event,'edit');"/>   
       </div>

      
       <h3 align="center" style="color:green;">${msg}</h3>
</div>
<input type="hidden" id="hiddenAccountNo" value="2"/>
<input type="hidden" id="hiddenAccountGroupCode" value="${accountCreationData.groupCode}"/>
<input type="hidden" id="pinaddressId" name="pinaddressId" value="" />
<form:hidden path="companyNameEdit" id="companyNameEdit" value="${accountCreationData.companyName }"/>
<form:hidden path="emailIdEdit" id="emailIdEdit" value="${accountCreationData.email}"/>

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>


	<script>
		accountVisbility();
		//showLogo();
		makeDropDownReadOnly('hiddenAccountGroupCode');
	</script>
</body>
</html>