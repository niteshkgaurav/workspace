<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
		<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	
	<script>
	 window.history.forward();
	</script>
	
<title>Welcome to Nextgen.</title>
</head>
<body >
	<form:form  modelAttribute="accountTypeData" method="post" action="${pageContext.request.contextPath}/AdminUI/account/accountCreation" enctype="multipart/form-data">
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	            <h1 class="pull-left"><spring:message code="Host Account Creation"/></h1>
	               <div class="clearfix"></div>
					<hr>
					<c:if test="${successMessage!=''}">
					<div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                      <p><font color="green">${successMessage}</font></p> 
					</div>
					</c:if> 
				  </div>
		<div class="row" id="account">
          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center" id="hostRow">
          			<div class="styled-input">
          				<spring:message code="lab_account_type" var="lab_account_type"/>
						 <form:select name="accountTypeId" id="accountTypeId" path="accountTypeId"  class="selecttag"  onclick="removeSucessMessage('successMessageId'); emptyerror(event,'accountErrorCode');"
						 onchange="selecttag('accountTypeId1','accountTypeId');" onfocus="showlabel('accountTypeId1','accountErrorCode');"	> 
                                <form:options items="${accountTypeData.accountMap}" />                                        
	                     </form:select>
	                     <label id='accountTypeId1' class="valid">${lab_account_type}</label>
	                     <label id='accountErrorCode' class="collapse"></label><span></span>
</div>					
</div>
				
				<div class=" col-xs-6 col-sm-6 col-md-6 col-md-offset-2 col-lg-6 mb">
					<input type='submit' class="btn btn-warning" align="middle" value="Submit" onclick="return validateAccountType();">
					</div>
		</div>	
		 <input type="hidden" name="accountType" id="accountType">
 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form> 
</body>
</html>