<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/UserForgetPassword.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>


<title>User Forget Password</title>
 <script>
 $(function () {

	 var currentDate=new Date(); 
	 $('#datetimepicker1').datetimepicker({
          
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
             useCurrent: false,

       });
		
	});
  </script>
   
</head>
<body>

	<form:form id="forgetPasswordForm" name="forgetPasswordForm" method="post" modelAttribute="userAccountData" action="${pageContext.request.contextPath}/AdminUI/UserMgmt/forgetPassword">
		<div class="container-fluid">
         		<div class="row"> 			
					
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lab_forgetPassword_title"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                      <c:if test="${message!=''}">
									<div id=""  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p class="text-success">${message}</p> 
									</div> 
							</c:if>	
		                      
	                    </div>
	                     <div class="row">
	                	
				              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			                        	<div id="div_userNameorEmail" class="styled-input ">
					                        <form:input type="text" autocomplete="off" id="userNameorEmail" path="userNameorEmail" placeholder="." class="selecttag"
					                        onfocus="emptyerror(event,'lab_userNameorEmailErrorId');showlabel('lab_userNameorEmailId','lab_userNameorEmailErrorId')"
					                         onchange="selecttag('lab_userNameorEmailId','userNameorEmail')"
					                         onclick="showlabel('lab_userNameorEmailId','lab_userNameorEmailErrorId');removeErrorMessage();"/>
					                         <label id="lab_userNameorEmailId" ><spring:message code="lab_userNameorEmail"/></label>
					                         <label id="lab_userNameorEmailErrorId" class="collapse"></label>
			                          			<span></span> 
					                         
					                         
			                      		</div>
		                      </div>
		                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input">
		                         	 <div class="input-group date" id="datetimepicker1">
		                            	<form:input id="lab_dob" path="dob" class="selecttag" type="text"  placeholder="."
					                         onclick=" removeErrorMessage(); emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')"
					                         onfocus="selecttag('label_lab_dob','lab_dob')"    />
		                           		 	 <label id="label_lab_dob" class="valid"><spring:message code="lab_dob"/></label>
					                         <label id="lab_dobErrorId" class="collapse"></label>
					                         <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
		                           </div>
		                        </div>
		                      </div>
		                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                         <div id="radioValuetErrorId" class="styled-input collapse"></div></div>
		                      
		                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		                      		<input type="button" class="btn btn-warning" value="Validate" onclick="validateEmailDob();"/>
		                      </div>
		                      <div id="validateMessageId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"></div>
		                      <div id="question" class="collapse col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"></div>
		                     
                     
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                      	 <div class="styled-input collapse " id="lab_securityQuestionId">
                        	<form:textarea type="text" id="securityQuestionId" path="securityQuestion" class="selecttag" placeholder="." 
                        	readonly="true" onfocus="emptyerror(event,'lab_securityQuestionErrorId');"	/>
                        	
									<label id="label_securityQuestionId" ><spring:message code="lab_securityQuestion"/></label>
									<label id="lab_securityQuestionErrorId" class="collapse"></label>
									
							</div>
                      </div>
                      <div  id="div_securityQuestion" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input collapse" id="answerId">
                         <form:input type="text" path="answer" id="answer" placeholder="." onchange="selecttag('label_securityAnswerid','answer');validateUser();" class="selecttag"
                          onfocus="emptyerror(event,'lab_answerErrorId');showlabel('label_securityAnswerid','lab_answerErrorId')" />
                         
                          <label id="label_securityAnswerid"><spring:message code="lab_answer"/></label>
                          <label id="lab_answerErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                      <div id="div_password" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class=" styled-input collapse" id="userPasswordId">
                         <form:input type="password" class="selecttag" id="userPassword" path="userPassword" placeholder="." 
                         onfocus="emptyerror(event,'lab_passwordErrorId');showlabel('label_userPassword','lab_passwordErrorId')" 
                         onchange="selecttag('label_userPassword','userPassword'); passwordLength('label_userPassword','lab_passwordErrorId','userPassword');" readonly="true"/>
                          <label id="label_userPassword"><spring:message code="lab_password"/></label>
                          <label id="lab_passwordErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                     
                      <div id="div_repassword" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class=" styled-input collapse" id="rePasswordId">
                          <form:input type="password" id="rePassword" path="rePassword" placeholder="." class="selecttag"
                          onchange="selecttag('label_rePassword','rePassword');matchPassword('userPassword','rePassword');" 
                          onfocus="emptyerror(event,'lab_repasswordErrorId');showlabel('label_rePassword','lab_repasswordErrorId')" readonly="true"/>
                          
                          <label id="label_rePassword"><spring:message code="lab_repassword"/></label>
                          <label id="lab_repasswordErrorId" class="collapse"></label>
                          <span></span> </div>
                      </div>
                     <div id="div_submit" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <input type="submit" id="forgetId" class="btn btn-warning collapse" value="Submit" onclick="forgetPassOrFTLoginCheck(event,'forgetPasswordForm');"/>
                        
                      </div>
                      	<input type="hidden" id="accountId" name="accountId" />
	    		</div>
	    	</div>
		</div>
</div>

	</form:form>
	
	

</body>
</html>
