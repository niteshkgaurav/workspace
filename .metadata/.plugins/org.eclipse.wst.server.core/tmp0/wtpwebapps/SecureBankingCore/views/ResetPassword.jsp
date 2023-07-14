
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">


<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script> 
<script type="text/javascript" src=${pageContext.request.contextPath}/js/ResetPassword.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/resetPasswordNew.js></script>

</head>
<body>

	<form:form id="resetPassword" method="post"
		modelAttribute="resetPasswordData">
		
	                    	<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lab_resetPasswordTitle"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                      <c:if test="${message!=''}">
									<div id="notMatchMessage"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${message}</p> 
									</div> 
							</c:if>	
		                      
	                    	</div>
	                	
	                	<div id="rootTable" class="row ">
	                		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb"> 
	                		    Reset Password By
	                		</div>
	                	
	                		<div  id="email_th" class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
	                		<div class="radio">
	                			<form:radiobutton id="email" name="radio" class="email"
									path="resetBy" value="email"
									onclick="return getRaioTextValue('email_th','emailMobileUserDivId');" />
									<label for="email">E-Mail</label></div>
	                		</div>
	                		<div id="mobile_th" class="col-xs-12 col-sm-4 col-md-4 col-lg-4">	
	                			<div class="radio">
	                			<form:radiobutton id="mobile" name="radio" class="mobile-number"
									path="resetBy" value="mobile number"
									onclick="return getRaioTextValue('mobile_th','emailMobileUserDivId');" />
									<label for="mobile">Mobile Number</label></div>
	                		</div>
	                		<div id="userName_th" class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
	                			<div class="radio">
	                			<form:radiobutton id="userName" name="radio" class="username"
									path="resetBy" value="userName"
									onclick="return getRaioTextValue('userName_th','emailMobileUserDivId');" />
									<label for="userName">UserName</label></div>
	                		</div>
	                		<div >
	                			<p id="resetByErrorId"  class="text-danger"></p>
	                		</div>
	                	
	                		<div  class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb collapse" 
									id="emailMobileUserDivId"></div>
							
									
	                	
	                		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                			<input id="buttonId" class="btn btn-warning" type="button" value="Get Details" onclick="getInfo();"></input>
	                		</div>
	                	
	                		<div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 mt mb">
                       		 <div class="transaction-table">
                          		<div class="table-responsive">
                           		 <table id="template_details" class="table table-bordered table-striped mb0">
                              
                             		 <tbody id="tbodyid">
                               
                              		</tbody>
                            	</table>
                         	 </div>
                       	 </div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
                        	<hr>
                     	 </div>
            <div class="styled-input">
                   	<label
						id=resetPasswordErrorIdDiv class="collapse"></label><span></span>
                   	</div>          
                      
                      	<div id="divID_newPassword" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 collapse">
	                        <div id="div_newPassword" class="styled-input">
	                        		<spring:message code="lab_NewPassword" var="lab_NewPassword1"/> 
			                          <form:input type="password" class="selecttag" path="newPassword"
									id="newPassword" onChange="selecttag('lab_NewPassword2','newPassword');"
									onclick="emptyerror(event,'lable_newPasswordErrorId');"
									onfocus="removeHasError('div_newPassword');showlabel('lab_NewPassword2','lable_newPasswordErrorId')"  value="" />
			                          <label id="lab_NewPassword2">${lab_NewPassword1}</label>
			                          <label id="lable_newPasswordErrorId" class="collapse"></label>
			                          <span></span>
	                          </div>
	                      </div>
	                      <div id="divID_cnfPassword" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 collapse">
	                        <div id="div_cnfPassword" class="styled-input">
	                        		<spring:message code="lab_ConfirmPassword" var="lab_ConfirmPassword1"/>
			                          <form:input class="selecttag" type="password" path="cnfPassword"
									id="cnfPassword" onChange="selecttag('lab_ConfirmPassword2','cnfPassword');" 
									onfocus="removeHasError('div_cnfPassword');showlabel('lab_ConfirmPassword2','lable_cnfPasswordErrorId')" 
									onclick="emptyerror(event,'lable_cnfPasswordErrorId');" placeholder="."/>
			                          <label id="lab_ConfirmPassword2">${lab_ConfirmPassword1}</label>
			                          <label id="lable_cnfPasswordErrorId" class="collapse"></label>
	                          </div>
	                      </div>
	                      <div id="div_submit"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
	                      
	                      		<input type="submit"
								value="Submit" onclick="return validateResetPasswordPage();" class="btn btn-warning"/>
	                      </div>
	                     
                      </div>
                      
                      <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
			
	</form:form>
</body>
</html>