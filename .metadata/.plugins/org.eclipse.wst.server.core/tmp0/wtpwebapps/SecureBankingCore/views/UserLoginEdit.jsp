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
 <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title><spring:message code="lable.useredit.title.page" /></title>
        <link href=${pageContext.request.contextPath}/css/jquery-ui.css rel="stylesheet">
		<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
		<script type="text/javascript" src=${pageContext.request.contextPath}/json/json.js></script>
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
			<script type="text/javascript" src=${pageContext.request.contextPath}/js/UserLoginCreation.js></script>
		<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
		<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script> 
		<script type="text/javascript">
		function removeStyleTag(id)
		{
			$("#"+id).attr("style","");
		}
		</script>
		
		
		<script>
$(function () {

	 $('.datetimepicker1').datetimepicker({
			format: 'YYYY-MM-DD',
            useCurrent: false,

      });
		
	});
</script>
		
		
		
</head>
    <form:form id="userLoginCreationEdit"  method="post"   modelAttribute="userAccountData"  action="${pageContext.request.contextPath}/AdminUI/UserMgmt/submitUserLoginEdit">
    	
    	<!-- ****************************************** Form Heading  ******************************* -->
	                    	<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lable.useredit.title.page"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
	<!-- ****************************************** Row for showing result message ******************************* -->
		                  
									<div id ="statusMessage"class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${statusMessage}</p> 
									</div> 
							
							
									<div id="errorstatusMessage" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-danger" >${errorstatusMessage}</p> 
									</div> 
						
		                      
	                    	</div>
	                   <div class="row">
    	<!-- ****************************************** Country name details ******************************* -->
    					 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    					
                         <div class="styled-input">
	    				  <form:input id="accountTypeId" path="accountTypeId"  type="textbox" readonly="true" value="${userAccountData.accountTypeId}" 
			 		 placeholder="${userAccountData.accountTypeId}" onclick="refresh('statusMessage');refresh('errorstatusMessage')" onchange="selecttag('label_accountTypeId','accountTypeId');" /> 
			    				<label id="label_accountTypeId" class="valid"><spring:message code="AccountType"/></label> 
			    					 <span></span>
                         </div> 
                      </div> 		
    	<!-- ****************************************** Host details ******************************* -->
    				<c:if test="${fn:length(userAccountData.hostName)>0}">
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    					
                       <div class="styled-input">
								<input id="hostName" type="textbox"	readonly="true" value="${userAccountData.hostName}"  onclick="refresh('statusMessage');refresh('errorstatusMessage')"
								onchange="selecttag('hostName1','hostName');" />
			    				<label id="hostName1" class="valid"><spring:message code="hostName"/></label>
			    					 <span></span>
                           </div>
                      </div>
                      	                </c:if>		
    	<!-- ****************************************** Distributor details ******************************* -->	
    				<c:if test="${fn:length(userAccountData.distName)>0}">
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
							<input id="distributorName" type="textbox" readonly="true" value="${userAccountData.distName}" onclick="refresh('statusMessage');refresh('errorstatusMessage')" 
							 onchange="selecttag('distributorName1','distributorName');"/>
						
			    				<label id="distributorName1" class="valid"><spring:message code="distName"/></label>
			    					 <span></span>
                           </div>
                      </div>
                      </c:if>
    	<!-- ****************************************** Sub-Distributor details ******************************* -->	
    				<c:if test="${fn:length(userAccountData.subDistName)>0}">
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
							<input id="subDistributorName" type="textbox" readonly="true" value="${userAccountData.subDistName}" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
    						  onchange="selecttag('subDistName1','subDistributorName');" />
			    				<label id="subDistName1" class="valid"><spring:message code="subDistName"/></label>
			    					 <span></span>
                           </div>
                      </div>	
                      </c:if>
    	<!-- ****************************************** Retailor details ******************************* -->
    			<c:if test="${fn:length(userAccountData.retailerName)>0}">
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          			
    									<input id="retailerName" type="text" name="retailerName"  value="${userAccountData.retailerName}" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
    									 onchange="selecttag('retailerId1','retailerId');" />
	                			
			    						 <label id="retailerId1" class="valid"><spring:message code="retName"/></label>
			    					 	
			    					 <span></span>
                           </div>
                      </div> 
                      	</c:if>		
    	<!-- ****************************************** User Login name ******************************* -->	
    	 			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          			
									 <form:input path="userLoginName" id="userLoginName" readonly="true" name="userLoginName" 
									 value="${userAccountData.userLoginName}" type="text" onclick="refresh('statusMessage');refresh('errorstatusMessage')"  onchange="selecttag('userLoginName1','userLoginName');"
									 onkeypress="emptyerror(event,'userLoginNameErrorId'),blockSpecialChar(event,'userLoginNameErrorId');" 
									 onfocus="showlabel('userLoginName1','userLoginNameErrorId');emptyerror(event,'userLoginNameErrorId')"/>
			    					 <label id="userLoginName1" class="valid"><spring:message code="userLogin"/></label>
			    					 <label id=userLoginNameErrorId class="collapse"></label>
			    					 <span></span>
                           </div>
                      </div> 	
    	<!-- ****************************************** User Name ******************************* -->
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div  id="userNamedivId"  class="styled-input">
                          			
									<form:input  path="userName" autocomplete="off" id="userName" name="userName" value="${userAccountData.userName}" class="selecttag"
									type="text" maxlength="40" onclick="refresh('statusMessage');refresh('errorstatusMessage')"  onchange="selecttag('userName1','userName');removeValid('userName1','userName')"
									onkeypress="emptyerror(event,'userNameErrorId'); blockSpecialChar(event,'userNameErrorId');" 
									onfocus="showlabel('userName1','userNameErrorId');removeHasError('userNamedivId');"/>
	    							<input id="userNameOrg" name="userNameOrg" type="hidden" value="${userAccountData.userName}"/>
			    					 <label id="userName1" class="valid">* <spring:message code="personName"/></label>
			    					 <label id=userNameErrorId class="collapse"></label>
			    					 <span></span>
                           </div>
                      </div> 
    				
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input" id="div_nickName">
                        	
		                          <form:input path="nickName" class="selecttag" id="nickName" autocomplete="off" name="nickName" value="${userAccountData.nickName}"  
		                          	type="text" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
	    					 		onkeypress="emptyerror(event,'nickNameErrorId'); blockSpecialChar(event,'nickNameErrorId');" 
	    					 		onchange="selecttag('nickName1','nickName');"
	    					 		onfocus="removeHasError('div_nickName');showlabel('nickName1','nickNameErrorId');emptyerror(event,'nickNameErrorId');"/>
		                          <label id="nickName1"  class="valid">* Nick Name</label>
		                           <label id=nickNameErrorId class="collapse"></label>
		                          <span></span>
                          </div>
                      </div>
    	<!-- ****************************************** User Email ID ******************************* -->	
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="userEmailIdivId"  class="styled-input">
                          			
									<form:input class="selecttag" path="userEmailId" autocomplete="off" id="userEmailId" name="userEmailId" value="${userAccountData.userEmailId}"
									 type="text"  onkeypress="emptyerror(event,'userEmailIdErrorId');" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
									 onfocus="selecttag('userEmailId1','userEmailId');showlabel('userEmailId1','userEmailIdErrorId');emptyerror(event,'userEmailIdErrorId');removeHasError('userEmailIdivId');" 
									 onchange="checkUniqueUserEmailId();"/>
	    							<input id="userEmailIdOrg" name="userEmailIdOrg" type="hidden" value="${userAccountData.userEmailId}"/>
									<label id="userEmailId1" class="valid">* Email ID</label>
									 <label id=userEmailIdErrorId class="collapse"></label>
									<span></span>
                          </div>
                      </div>
                      
                      
                      
                      
                      	<!-- ****************************************** User DOB ******************************* -->	
    				    
                  
                  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_dob" class="styled-input">
						<div class="input-group date datetimepicker1">
										<form:input type="text" id="dob" path="dateOfBirth" class="selecttag" 
										onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_dob')"
										onchange="selecttag('label_dob','dob');"
										onfocus="removeHasError('div_dob')"/>
									<label id="label_dob" class="valid">* Date Of Birth</label>
									<label id="lab_dobErrorId" class="collapse"></label>
									<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_dob');showlabel('label_dob','lab_dobErrorId');removeHasError('div_dob');"></i> </i>
					    	</div>
                      </div>
					     </div>
                      
                      
                      
                      
                       <!-- ****************************************** Address ******************************* -->
               <c:if test="${deployedFor=='DEFAULT'}">
                <div id='addressSelectDivId' >
	  									<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'>
	  									</table>
	  					</div>
	  					<br>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
               &nbsp;
                </div>
               <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							<form:input type="text" path="pinCode" class="selecttag" id="pinCode" maxlength="6"
								onchange="selecttag('label_pinCode','pinCode');" onclick="refresh('addressErrorId');refresh('statusMessage');refresh('errorstatusMessage');"
								onfocus="removeHasError('div_pinCode')" onkeypress="onlyNumric(event,'label_pinCode1','lab_pinCodeErrorId1','pinCode');changeValues()"/>
							<label id="label_pinCode" class="valid" >* Pin Code
									</label> <label id="lab_pinCodeErrorId"
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
               
               
               
               
                      
	  				
                    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_address" class="styled-input">
										<form:input id="addressIdDefault" type="text" path="address" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_address')"
												onchange="selecttag('label_address','address');"
												onfocus="removeHasError('div_address')"/>
											<label id="label_address" class="valid">* Address</label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_locality')"
												onchange="selecttag('label_locality','locality');"
												onfocus="removeHasError('div_locality')"/>
											<label id="label_locality"class="valid">* Locality</label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_region')"
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
											<label id="label_district" class="valid">* District</label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_state')"
												onchange="selecttag('label_state','state');" 
												onfocus="removeHasError('div_state')"/>
											<label id="label_state" class="valid">* State</label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" readonly="true" onclick="refresh('statusMessage');refresh('errorstatusMessage');removeStyleTag('label_country')"
												onchange="selecttag('label_country','country');" 
												onfocus="removeHasError('div_country')"/>
											<label id="label_country" class="valid">* Country</label>
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
						onclick="emptyerror('lab_pinCodeErrorId');refresh('statusMessage');refresh('errorstatusMessage')"
						onkeypress="onlyNumricForPin(event,'lab_pinCodeErrorId','${lab_pinCode}'); "
						onfocus="showlabel('pinCodeId','lab_pinCodeErrorId');removeHasError('div_pinCode')"
						onchange="selecttag('pinCodeId','pinCode');pinValidation(); changePinCode('${readonlyValue}');" />
					<label id="pinCodeId" class="valid">* ${lab_pinCode}</label> <label
						id="lab_pinCodeErrorId" class="collapse"></label><span></span>
					
				</div>
			</div>
                    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_address" class="styled-input">
										<form:input id="addressIdDefault" type="text" path="address" class="selecttag" 
												onchange="selecttag('label_address','address');" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onfocus="removeHasError('div_address');selecttag1('label_address')"/>
											<label id="label_address" class="valid">* <spring:message code="lab_address" /></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_locality" class="styled-input">
										<form:input type="text" id="locality" path="locality" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_locality','locality');selecttag1('label_locality')"
												onfocus="removeHasError('div_locality')"/>
											<label id="label_locality" class="valid">* <spring:message code="lab_locality" /></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_region" class="styled-input">
										<form:input type="text" id="region" path="region" class="selecttag" 
												onchange="selecttag('label_region','region');selecttag1('label_region')"
												onfocus="removeHasError('div_region')" onclick="refresh('statusMessage');refresh('errorstatusMessage')"/>
											<label id="label_region" class="valid"><spring:message code="lab_Region" /></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_district" class="styled-input">
										<form:input type="text" id="district" path="district" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_district','district');selecttag1('label_district')"
												onfocus="removeHasError('div_district')"/>
											<label id="label_district" class="valid">* <spring:message code="lab_district" /></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_state" class="styled-input">
										<form:input type="text" id="state" path="state" class="selecttag" onclick="refresh('statusMessage');refresh('errorstatusMessage')"
												onchange="selecttag('label_state','state');selecttag1('label_state')"
												onfocus="removeHasError('div_state')"/>
											<label id="label_state" class="valid">* <spring:message code="lab_State" /></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    	</div>
                      </div>
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_country" class="styled-input">
										<form:input type="text" id="country" path="country" class="selecttag" 
												onchange="selecttag('label_country','country');selecttag1('label_country')" 
												onfocus="removeHasError('div_country')" onclick="refresh('statusMessage');refresh('errorstatusMessage')"/>
											<label id="label_country" class="valid">* <spring:message code="lab_Country" /></label>
											<label id="lab_CountryErrorId" class="collapse"></label>
					    	</div>
                      </div>
                      </c:if>
    	<!-- ****************************************** User Mobile Number ******************************* -->	
    				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                          <div class="col-md-4 col-lg-4 pr0">
                            	<div    id="countryCodedivId" class="styled-input">
                            		
                            		<form:select class="selecttag " name="countryCode" id="countryCodeId" path="countryCodeId"
                            		 onfocus="selecttag('countryCodeId1','countryCodeId');showlabel('countryCodeId1','countryCodeErrorId');emptyerror(event,'countryCodeErrorId');removeHasError('countryCodedivId');"
										 onchange="selecttag('countryCodeId1','countryCodeId');removeValid('countryCodeId1','countryCodeId')"
										  onclick="this.setAttribute('value', this.value);refresh('statusMessage');refresh('errorstatusMessage')" value="" >
										<form:option value="" label=" " />
										 <form:options items="${countryCodeMap}" /> 
											</form:select>
											<span></span>
									<label id="countryCodeId1" class="valid">Country Code</label>
									<label id="countryCodeErrorId" class="collapse" ></label>
								</div>
                          </div>
                          <div class="col-md-1 col-lg-1 pl0"></div>
							<div class="col-md-7 col-lg-7 pl0">   
                           <div id="div_userMobile" class="styled-input">
							<form:input type="text" id="userMobile" path="userMobile"
								maxlength="10"  value="${userAccountData.userMobile}" class='selecttag'
								onkeypress="onlyNumric(event,'userMobileErrorId','userMobile1'); emptyerror(event,'userMobileErrorId');" 
								onchange="selecttag('userMobile1','userMobile');emptyerror(event,'userMobileErrorId'); checkUniqueUserMobileNumber(); mobLength(event,userMobile,userMobileErrorId);"
								onclick="emptyerror(event,'userMobileErrorId');refresh('statusMessage');refresh('errorstatusMessage')"
								onfocus="showlabel('userMobile1','userMobileErrorId');removeHasError('div_userMobile')" />
							<input id="userMobileOrg" name="userMobileOrg" type="hidden" value="${userAccountData.userMobile}"/>		
							<label id="userMobile1" class="valid">&nbsp;*&nbsp;Mobile Number</label> <label
								id="userMobileErrorId " class="collapse"></label>
						</div>
                          </div>
                        </div>
                      </div>
                      
    	<!-- ****************************************** Alternative Mobile Number ******************************* -->
    	 			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                          <div class="col-md-4 col-lg-4 pr0">
                            	<div id="altCountryCodeErrorId_div" class="styled-input">
                            		
                            		<form:select  id="altCountryCodeId" name="countryCode" path="altCountryCodeId" class="selecttag" 
                            		onfocus="removeHasError('altCountryCodeErrorId_div')"
                            		onchange="selecttag('altCountryCodeId1','altCountryCodeId');removeValid('altCountryCodeId1','altCountryCodeId')" 
                            		onclick="this.setAttribute('value', this.value);refresh('statusMessage');refresh('errorstatusMessage')" value="" >
										<form:option value="" label="" />
										 <form:options items="${countryCodeMap}" /> 
									</form:select>
											<span></span>
									<label id="altCountryCodeId1" class="valid">Country Code</label>
									<label id="altCountryCodeErrorId" class="valid"></label>
									</div>
                          </div>
                          <div class="col-md-1 col-lg-1 pl0"></div>
							<div class="col-md-7 col-lg-7 pl0">   
                            <div class="styled-input">
                              <form:input class="selecttag" path="altMobile" autocomplete="off" id="alternateMobileNo" name="alternateMobileNo" value="${userAccountData.altMobile}" 
								 type="text"  maxlength="10" 
								 onkeypress="emptyerror(event,'userMobileErrorId'),blockSpecialChar(event,'userMobileErrorId');onlyNumric(event,'userMobileErrorId');validatemob(event,'alternateMobileNoErrorId');"  
								 onfocus="showlabel('alternateMobileNo1','alternateMobileNoErrorId');emptyerror(event,'userMobileErrorId');removeValid('alternateMobileNo1','alternateMobileNo')"
								  onchange="selecttag('alternateMobileNo1','alternateMobileNo');checkUniqueUserMobileNumber();"
								  	 onclick="refresh('statusMessage');refresh('errorstatusMessage')"/>
		              		
									<label id="alternateMobileNo1" class="valid"><spring:message code="alternateMobileNumber"/></label>
									<label id=alternateMobileNoErrorId class="collapse text-danger"></label>
									<span></span> </div>
                          </div>
                        </div>
                      </div>
                      <c:if test="${fn:length(userAccountData.retailerName)>0}">
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id='lab_settlementTypeId'>
                        <div class="styled-input">
                        	
                        	<form:select id="settlementType" path = "settlementType" class="selecttag" 
                        	disabled="true" onclick="emptyerror(event,'settlementTypeErrorId');disableSettlement();refresh('statusMessage');refresh('errorstatusMessage')">
                        		<form:option value="2" label="2"/>
                        		<form:option value="0" label="0"/>
                        		<form:option value="1" label="1"/>
                        		<form:option value="3" label="3"/>
                        	</form:select>
                        		<label id="settlementTypeId" class="valid">Settlement Cycle</label>
                        		<label id="settlementTypeErrorId" class="collapse"></label>
                        </div>
                        </div>
                        </c:if>
                        
                  <input type="hidden" id="pinCodeFlag" name="pinCodeFlag"  value="" />    
                        
                        
    	<!-- ****************************************** Submit Button *************************** -->	
    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      		<input type="submit"  value="Update" class="btn btn-warning" onclick="return validateUserEditForm(event);refresh('statusMessage');refresh('errorstatusMessage')"/>
	                      		<input id="finalFlag" name="finalFlag" value="true" type="hidden" />
								<form:input id="emailMsg" name="emailMsg" path="" value="" type="hidden" />
								<form:input id="mobileMsg" name="mobileMsg" path="mobileMsg" value="" type="hidden" />
								<form:input path="id" id="id" value="${userAccountData.id}" type="hidden" />
	                      </div>
    	
    	</div>
    	
    	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
    	
    </form:form>
    
</html>