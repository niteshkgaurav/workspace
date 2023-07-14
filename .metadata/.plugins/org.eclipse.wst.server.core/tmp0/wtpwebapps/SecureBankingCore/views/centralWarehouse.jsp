
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
<title>Central Warehouse</title>
</head>
<body>
	<form:form id="centralWarehouse" name="centralWarehouse">
		<div style="margin: 10px;">
			<br> <br>
			<table width='60%' border='1' class='tableMain' bordercolor='#000000'
				cellspacing='1' cellpadding='0'>
				<tr>
					<td colspan='3' align="center">
						<h3 id="msgId" align="center" style="color: green;">${successMessage}</h3>
						<h3 id="errorId" align="center" style="color: red;">${errorMessage}</h3>
					</td>
				</tr>
				<tr>
					<td colspan="8" align="center"><table width='100%' border='0'
							class='tableMain' bordercolor='#000000' cellspacing='1'
							cellpadding='0'>
							<tr>
								<td colspan="8">
							<tr style="color: black;" class="mainTableHeader">
								<th style='width: 33%'><span><spring:message
											code="lab_orderNumber" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Product" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Master_version" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Units_ordered" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Units_Dispatched" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Box_Received" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Units_Pending" /></span></th>
								<th style='width: 33%'><span><spring:message
											code="lab_Box_Pending" /></span></th>
							</tr>
							<c:forEach items="${customerEditData}" var="config">
								<tr>
									<td align="center" style='width: 33%'>${config.customerFirstName}</td>
									<td align="center" style='width: 33%'>${config.customerLastName}</td>
									<td align="center" style='width: 33%'>${config.customerFirstName}</td>
									<td align="center" style='width: 33%'>${config.customerLastName}</td>
									<td align="center" style='width: 33%'>${config.customerFirstName}</td>
									<td align="center" style='width: 33%'>${config.customerLastName}</td>
									<td align="center" style='width: 33%'><a
										href="${pageContext.request.contextPath}/AdminUI/customerCreation/updateCustomerEdit?customerId=${config.id}"><img
											title="edit" align="center" />${config.customerFirstName}</a></td>
									<td align="center" style='width: 33%'><a
										href="${pageContext.request.contextPath}/AdminUI/customerCreation/updateCustomerEdit?customerId=${config.id}"><img
											title="edit" align="center" />${config.customerFirstName}</a></td>
								</tr>
							</c:forEach>
						</table></td>
				</tr>

				<tr>
					<td colspan="8" align="center" width='25%' class='tableLabel' align='right'><spring:message
							code="lab_Scan_item" />&nbsp;:&nbsp;&nbsp;</td>
					<td width='25%' align='left'><form:select id="boxOrLooseId"
							path="boxOrLooseId"
							style="width: 150px">
							<form:option value="" label="<-----Select----->" />
							<form:options items="${customerRegistrationData.countryMap}" />
						</form:select></td>
			</table>
		</div>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>
