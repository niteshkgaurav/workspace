<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script> 
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/changePassword.js></script>
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>

	<form:form id="changePasswordForm" name="changePasswordForm" method="post" modelAttribute="userAccountData" action="${pageContext.request.contextPath}/AdminUI/UserMgmt/chngePassword">
		
          				
          					
							
          			 
	               		 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_changePassword_title"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                      			<c:if test="${successMessage!=''}"> 
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p class="text-success" >${successMessage}</p> 
									</div> 
							
									</c:if>
									<c:if test="${errorMessage!=''}"> 
			          				 <div id="errorstatusMessage" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
			                                            <p class="text-success">${errorMessage}</p> 
								 
									</div>
									</c:if>
	                    </div>
	             
          				<div class="row">
          					
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="div_userPassword" class="styled-input">
		                          <spring:message code="lab_currentPassword" var="lab_currentPassword1" /> 

											<form:input id="userPassword" class="selecttag" type="password" path="userPassword"
											onfocus="removeHasError('div_userPassword');showlabel('label_userPassword','lab_currentPasswordErrorId');emptyerror(event,'lab_currentPasswordErrorId')"  
											onchange="selecttag('label_userPassword','userPassword');checkPassword();" onclick="emptySuccessmessage();"
											onkeypress="blockSpace(event,'lab_currentPasswordErrorId','');" />
					    					 <label id="label_userPassword"class="valid">${lab_currentPassword1}</label>
					    					 <label id="lab_currentPasswordErrorId" class="collapse"></label>
                          		 </div>
                      		</div>  
            
	            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div id="div_newPassword" class="styled-input">
	                        	<spring:message code="lab_newPassword" var="lab_newPassword1" /> 

			                          <form:input id="newPassword" class="selecttag" type="password" path="newPassword"  
			                          onfocus="removeHasError('div_newPassword');showlabel('label_newPassword','lab_newPasswordErrorId');emptyerror(event,'lab_newPasswordErrorId')"
			                          onkeypress="blockSpace(event,'lab_newPasswordErrorId','newPassword');"
			                           onclick="emptySuccessmessage();" onchange="selecttag('label_newPassword','newPassword')"/>
			                          <label id="label_newPassword"class="valid">${lab_newPassword1}</label>
			                          <label id="lab_newPasswordErrorId" class="collapse"></label>
	                          </div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div id="div_rePassword" class="styled-input">
	                        	<spring:message code="rPassword" var="rPassword" /> 

			                          <form:input id="rePassword" class="selecttag" type="password" path="rePassword"
			                          onchange="selecttag('label_rePassword','rePassword');matchPassword('newPassword','rePassword');"
			                             onkeypress="blockSpace(event,'lab_repasswordErrorId','rePassword');"
			                           onfocus="removeHasError('div_rePassword');showlabel('label_rePassword','lab_repasswordErrorId');emptyerror(event,'lab_repasswordErrorId')" onclick="emptySuccessmessage();" />
			                          <label id="label_rePassword"class="valid">${rPassword}</label>
			                          <label id="lab_repasswordErrorId" class="collapse"></label>
	                          </div>
	                     	 </div>
	                     	 
	                     	  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 mt text-center">
	                     	 <input type="submit" class="btn btn-warning" value="Submit" onclick="checkChangePass(event);"/>
	                      	</div>
						</div>
					
					<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>