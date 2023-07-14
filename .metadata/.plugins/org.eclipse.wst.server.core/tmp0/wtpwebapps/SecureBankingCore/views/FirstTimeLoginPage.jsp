<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href=${pageContext.request.contextPath}/css/datepicker.min.css
	rel="stylesheet">
 <link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
	<script src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
	<script src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/FirstTimeLogin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/UserForgetPassword.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 
<title>User First Time Login</title>
<script>
debugger;
$(function () {
	var currentDate=new Date();
	$('#datetimepicker1').datetimepicker({
          format: 'YYYY-MM-DD',
          maxDate: currentDate,
    });
});

  </script>
</head>
<body>

	<form:form id="firstTimeLoginPage" method="post" modelAttribute="firstTimeLoginData" action="${pageContext.request.contextPath}/AdminUI/UserMgmt/firstTimeLogin">
	
	<div class="container-fluid">
         		<div class="row"> 			
					
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                 		
	               		 
	                    <div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lab_firstTimeLoginTitle"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                      <c:if test="${message!=''}">
									<div id=""  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><b><font color="green">${message}</font></b></p> 
									</div> 
							</c:if>	
		                      
	                    </div>
	                
	                <div class="row">
	                	
		              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                        	<div id="div_userName" class="styled-input ">
			                          <form:input type="text" class="selecttag" id="lab_userName" path="userName" readonly="true" 
			                          onchange="selecttag('label_lab_userName','lab_userName')" onfocus="removeHasError('div_userName');showlabel('label_lab_userName','lab_userNameorEmailErrorId')"/>
			                          <label id="label_lab_userName" class="valid"><spring:message code="lab_userName"/></label>
			                          <label id="lab_userNameorEmailErrorId" class="collapse"></label>
	                          <span></span> </div>
                      </div>
                   
                   
                   	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
                       <div id="div_dob" class="styled-input">
                          <div class="input-group date" id="datetimepicker1">
                            <form:input id="lab_dob" path="dob"  type="text"  class="selecttag"
                				 onfocus="removeHasError('div_dob');selecttag('label_lab_dob','lab_dob')"
                				onclick="emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')" 
                				/>
                           		 <label id="label_lab_dob" class="valid"><spring:message code="lab_dob"/></label>
		                          <label id="lab_dobErrorId" class="collapse"></label>
                           	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i></div>
                        </div> 
                     
                    </div>
                   
                   
                     <div id='validateMessageId' class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"></div>
		                      <div id='question' class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"></div>
                     
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                      	 <div class="styled-input" id="lab_securityQuestionId">
                        	<form:select id="securityQuestionId" path="securityQuestionId" class="selecttag" 
							onfocus="removeHasError('lab_securityQuestionId');emptyerror(event,'lab_securityQuestionErrorId');showlabel('label_securityQuestionId','lab_securityQuestionErrorId')" 
                        	onclick="this.setAttribute('value', this.value);" value="" onchange="selecttag('label_securityQuestionId','securityQuestionId')" >
										<form:option value="" label=" " />
										 <form:options  items="${questionMap}" />
									</form:select>
                        			<label id="label_securityQuestionId" class="valid"><spring:message code="lab_securityQuestion"/></label>
									<label id="lab_securityQuestionErrorId" class="collapse"></label>
									
							</div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="div_securityAnswerId" class="styled-input">
                          <form:input type="text" id="securityAnswerId" path="securityAnswer" class="selecttag"
                          onchange="selecttag('label_securityAnswerid','securityAnswerId');validateUser();" 
                          onfocus="removeHasError('div_securityAnswerId');showlabel('label_securityAnswerid','lab_answerErrorId');emptyerror(event,'lab_answerErrorId')"/>
                          <label id="label_securityAnswerid" class="valid"><spring:message code="lab_answer"/></label>
                          <label id="lab_answerErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="div_currentPasswordId" class="styled-input">
                          <form:input type="password" id="currentPasswordId" path="currentPassword" class="selecttag"
                          onchange="selecttag('lable_currentPassword','currentPasswordId') " 
                          onfocus="removeHasError('div_currentPasswordId');emptyerror(event,'lab_currentPasswordErrorId');showlabel('lable_currentPassword','lab_currentPasswordErrorId')"/>
                          <label id="lable_currentPassword" class="valid"><spring:message code="lab_currentpassword"/></label>
                          <label id="lab_currentPasswordErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="div_newPasswordId" class="styled-input">
                         <form:input type="password" id="newPasswordId" path="newPassword"  class="selecttag"
                         	onfocus="removeHasError('div_newPasswordId');emptyerror(event,'lab_passwordErrorId');showlabel('label_newPassword','lab_passwordErrorId')" 
                          	onchange="selecttag('label_newPassword','newPasswordId'); passwordMatch(); passwordLength('label_newPassword','lab_passwordErrorId','newPasswordId');"/>
                          <label id="label_newPassword" class="valid"><spring:message code="lab_newpassword"/></label>
                          <label id="lab_passwordErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div id="div_rePasswordId" class="styled-input">
                        	                        	<spring:message code="rPassword" var="rPassword" /> 
                        
                          <form:input class="selecttag" type="password" id="rePasswordId" path="rePassword" 
                          onfocus="removeHasError('div_rePasswordId');emptyerror(event,'lab_repasswordErrorId');showlabel('label_rePassword','lab_repasswordErrorId')" 
                          onchange="matchPassword('newPassword','rePassword');selecttag('label_rePassword','rePasswordId');"  />
                          <label id="label_rePassword" class="valid" >${rPassword}</label>
                          <label id="lab_repasswordErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <input type="submit"  value="Submit" class="btn btn-warning"  onclick="return  forgetPassOrFTLoginCheck(event,'firstTimeLoginPage')"/>
                      </div>
                      
                    </div>
                      
                   
	            
	      
	       </div> 
	      </div>
	      </div> 
	
	
	</form:form>

</body>
</html>
