
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<title>Customer List</title>

</head>
<body >
	<form:form id="customerListForm" name="customerListForm">
		<div style="margin: 10px;">
			
			<br>
			<br>
			<table width='60%' border='1'  class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0'>
				<tr>
				<td colspan='3' align="center">
				<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
				<h3 id="errorId" align="center" style="color:red;">${errorMessage}</h3>
			</td></tr>
				<tr style="color: black;" class="mainTableHeader">
					<th style='width:33%'><span><spring:message code="lab_customerFirstName" /></span></th>
					<th style='width:33%'><span><spring:message code="lab_customerLastName" /></span></th>
					<th style='width:33%'><span><spring:message code="lab_action_on_host" /></span></th>
				</tr>
				<tr><td colspan="3" align="center"><table width='100%'  border='0'  class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' >
	  			<tr><td colspan="3">
	  			<div style="height:150px; overflow:auto">
	  			<table width='100%'  border='1'   bordercolor='#909085' cellspacing='0' cellpadding='0' >
				<c:forEach items="${customerEditData}" var="config">
					<tr>
						<td align="center" style='width:33%'>${config.customerFirstName}</td>
						<td align="center" style='width:33%'>${config.customerLastName}</td>
						<td align="center" style='width:33%'><a
							href="${pageContext.request.contextPath}/AdminUI/customerCreation/updateCustomerEdit?customerId=${config.id}"><img
								title="edit"
								src='${pageContext.request.contextPath}/images/edit.gif'
								style='cursor: hand' align="center" /></a></td>
					</tr>
				</c:forEach>
				</table></div></td></tr></table></td></tr>
			</table>
		</div>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>