<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/InventoryCheck.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Check</title>
</head>
<body>
<form:form id="inventoryCheckId" name="inventoryCheckForm" method="post" modelAttribute="inventoryCheckData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/setInventoryCheck">
<table width='100%' border='0' cellspacing='1' cellpadding='0' id="mainId" >
<tr><td height="40" colspan="2"></td></tr>
<tr><td colspan="2" align="center">
	<table width="65%" border='0' class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' >
		<tr><td colspan="4" align="center" class="mainTableHeader"><spring:message code="lab_inventoryCheck"/></td></tr>
		<tr><td height="20" colspan="4"></td></tr>
		<tr>
			<td align="right"><font color='red'>*&nbsp;</font><spring:message code="lab_orderNo"/>&nbsp;&nbsp;:&nbsp;</td>
			<td><form:select id="orderNo" path="orderNo">
			<form:option value="" label="<--- Select --->" />
			<form:options items="${inventoryCheckData.orderList}"/>
			</form:select>
			</td><td colspan="2"></td>
		</tr>
		<tr>
			<td align="right"><spring:message code="lab_product"/>&nbsp;&nbsp;:&nbsp;</td>
			<td><form:select id="product" path="product">
			<form:option value="" label="<--- Select --->" />
			<form:options items="${inventoryCheckData.productList}"/>
			</form:select>
			</td>
			<td align="right"><spring:message code="lab_masterVersion"/>&nbsp;&nbsp;:&nbsp;</td>
			<td>
			<form:select id="masterVersion" path="masterVersion">
			<form:option value="" label="<--- Select --->" />
			<form:options items="${inventoryCheckData.masterVersionList}"/>
			</form:select>
			</td>
		</tr>
		<tr><td></td><td><div id="lab_productErrorId"></div></td><td></td><td><div id="lab_masterVersionErrorId"></div></td></tr>
		<tr><td colspan="4" align="center"><input type="submit" value="Submit" ></td></tr>
	</table>
	<tr><td height="20" colspan="2"></td></tr>
	<tr><td colspan="2" align="center">
	<table width="84%" border='1' class='tableMain' bordercolor='#000000' cellspacing='0' cellpadding='0' >
		<tr class="mainTableHeader">
			<th align="center"><spring:message code="lab_mainSeries_From"/></th>
			<th align="center"><spring:message code="lab_mainSeries_To"/></th>
			<th align="center"><spring:message code="lab_BoxNo"/></th>
			<th align="center"><spring:message code="lab_boxFrom"/></th>
			<th align="center"><spring:message code="lab_boxTo"/></th>
			<th align="center"><spring:message code="lab_boxSize"/></th>
			<th align="center"><spring:message code="lab_availableUnits"/></th>
			<th align="center"><spring:message code="lab_product"/></th>
			<th align="center"><spring:message code="lab_masterVersion"/></th>
			<th align="center"><spring:message code="lab_po"/></th>
		</tr>
		<c:forEach items="${inventoryCheckData.data}" var="data">
				<tr>
					<td align="center">${data.mainSeriesFrom}</td>
					<td align="center">${data.mainSeriesTo}</td>
					<td align="center">${data.boxNo}</td>
					<td align="center">${data.boxFrom}</td>
					<td align="center">${data.boxTo}</td>
					<td align="center">${data.boxSize}</td>
					<td align="center">${data.availableUnits}</td>
					<td align="center">${data.productName}</td>
					<td align="center">${data.masterVersions}</td>
					<td align="center">${data.po}</td>
				</tr>
			</c:forEach>
	</table>
	</td></tr>
</table>

<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

</form:form>
</body>
</html>