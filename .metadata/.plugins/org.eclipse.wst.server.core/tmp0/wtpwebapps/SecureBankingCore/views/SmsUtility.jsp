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
<script type="text/javascript" src=${pageContext.request.contextPath}/js/SmsUtility.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>		
<title>Send SMS</title>
</head>
<body>
<div>
<form:form method="POST" modelAttribute="smsData" action="${pageContext.request.contextPath}/AdminUI/customerCreation/sendSMS">
	<table width='100%' border='0' cellspacing='1' cellpadding='0'>
	<tr><td colspan="2" height="25"></td></tr>
		<tr>
			<td align="center" colspan="2">
			<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
			<h3 id="ermsgId" align="center" style="color:red;">${errorMessage}</h3>
			</td>
		</tr>
		<tr><td colspan="2" height="25"></td></tr>
		<tr>
			<td colspan="2" align="center">
	  			<table width='60%' border='1'  class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0'>
	  			<tr><td align="center"><table width="100%">
	  				<tr>
	  					<td colspan="3" align="center" class="mainTableHeader"><spring:message code="lab_sms"/></td>
	  				</tr>
	  					<tr><td colspan="3" height="8"></td></tr>
	  				<tr><td align="right"><spring:message code="lab_contactNumber"/>&nbsp;:&nbsp;&nbsp;</td><td style="width:5%;"><form:input style="width:100%;" type="text" path="extnCode" readonly="true"/></td><td><form:input type="text" placeholder="Contact No" maxlength="10" path="contactNo" onkeypress="onlyNumric(event,'lab_contactNumberErrorId');" onclick="emptyerror(event,'lab_contactNumberErrorId');"/></td></tr>
	  				<tr><td></td><td></td><td><div id="lab_contactNumberErrorId"></div></td></tr>
	  				<tr><td colspan="3" height="6"></td></tr>
	  				<tr><td align="right"><spring:message code="lab_message"/>&nbsp;:&nbsp;&nbsp;</td><td colspan="2" align="left"><form:textarea placeholder="Message" path="message" onclick="emptyerror(event,'lab_messageErrorId');"/></td></tr>
	  				<tr><td></td><td></td><td><div id="lab_messageErrorId"></div></td></tr>
	  				<tr><td colspan="3" height="6"></td></tr>
	  				<tr><td colspan="3" align="center"><input type="submit" value="Submit" onclick="smsCheck(event);"/></td></tr>
	  					<tr><td colspan="3" height="8"></td></tr>
	  				</table>
	  			</td></tr>
	  			</table>
	  		</td></tr>
	</table>
	
	 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</div>
</body>
</html>