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
	
<title>Secure Banking</title>
</head>
<body>
	<form:form  modelAttribute="otaMessageData" method="post" action="">
	
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
  						<form:select id="hostSubVersionId" path="hostSubVersion" style="width:150px;"> 
	     					<form:option value="" label="Host Sub Version"/>                                      
	     					<form:options items="${otaMessageData.hostSubVersionMap}"/>                                        
	     				</form:select>
  					</td>
  					<td><div id='hsvError' align='center'></div></td>
				</tr>
				<tr>
					<td>
						<font color='red'>*&nbsp;</font><spring:message code="lab_Host_sub_version_STATUS"/>&nbsp;:&nbsp;&nbsp;
					</td>
					<td>
  						<form:select id="status" path="status" style="width:150px;"> 
	     					                                    
	     					<form:options items="${otaMessageData.userStatus}"/>                                        
	     				</form:select>
  					</td>
  					<td><div id='hsvError' align='center'></div></td>
				</tr>
				<%-- <tr>
					<td>
						<font color='red'>*&nbsp;</font><spring:message code="lab_subs_type"/>&nbsp;:&nbsp;&nbsp;
					</td>
					<td>
  						<form:select id="subscriberTypeId" path="subscriberType" style="width:150px;"> 
	     					<form:option value="" label="Subscriber Type"/>                                      
	     					<form:option value="ACTIVE" label="Active"/> 
	     					<form:option value="INACTIVE" label="Inactive"/>                                      
	     				</form:select>
  					</td>
				</tr> --%>
				
				
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