<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ota.js"></script>
	
<title>Secure Banking OTA</title>
</head>
<body>
	<form:form  modelAttribute="otaMessageData" method="post" action="${pageContext.request.contextPath}/AdminUI/ota/sendOTAPageActive">
	
		<table id="mainTable" align="center" class='thickBorder' width="100%">
			<tr>
				<td align="center">
				<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
			
			<table border ='0' align="center"   cellspacing='10' cellpadding='0'>
		
				<tr>
					<td>
						<font color='red'>*&nbsp;</font><spring:message code="lab_Host_sub_version"/>&nbsp;:&nbsp;&nbsp;
					</td>
					<td>
					<input id="distributorName" type="textbox" readonly="true" value="${otaMessageData.hostSubVersionName}" style="width: 140" />
  					  <form:input id="hostId" type="hidden" path="hostSubVersion"	value="${otaMessageData.hostSubVersion}" readonly="true" />
  					
  					</td>
  					<td><div id='hsvError' align='center'></div></td>
				</tr>
				
				<table width='100%' border='1' class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' > 
			<tr style="color: white;" bgcolor="#c10000">
				<th width="20%"><spring:message code="lab_MobileNumber"/></th>
			</tr>
			<c:forEach items="${otaMessageData.subscriberDatas}" var="subscriberData">
			<tr>
			<form:input id="mobileNumber" type="hidden" path="mobileNumber"	value="${subscriberData.mobile}" readonly="true" />
				<td align="left"> ${subscriberData.mobile}</td>
			</tr>
			</c:forEach>
			</table>
				
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Submit" onclick="return validateForm();">
					</td>
				</tr>
			</table>
			
				
			
				
				</td>
			</tr>
		
		</table>
	
			
			 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
			
			
			
			
			
			
	</form:form> 
</body>
</html>