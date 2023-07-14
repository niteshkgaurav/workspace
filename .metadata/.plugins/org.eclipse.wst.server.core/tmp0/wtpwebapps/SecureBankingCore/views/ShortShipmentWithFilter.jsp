<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/ShortShipment.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Short Shipment</title>
</head>
<body>
<form:form id="shortShipmentWithFilterId" name="shortShipmentWithFilterId" method="post" modelAttribute="shortShipmentData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/setShortShipment">
<table width='100%' border='0' cellspacing='1' cellpadding='0' id="mainId" >
<tr><td height="40" colspan="2"></td></tr>
<tr><td colspan="2" align="center">
	<table width="75%" border='0' class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' >
		<tr><td colspan="4" align="center"><div align="center" class="mainTableHeader"><spring:message code="lab_shortShipment"/></div></td></tr>
		<tr><td height="20" colspan="4"></td></tr>
		<tr>
			<td align="right"><font color='red'>*&nbsp;</font><spring:message code="lab_orderNo"/>&nbsp;&nbsp;:&nbsp;</td>
			<td align="left"><form:select path="orderNo" onclick="emptyerror(event,'lab_orderNoErrorId');">
				<form:option value="" label="<--- Select --->" />
				<form:options items="${shortShipmentDatas.orderData}" />
				</form:select>
			</td>
			<td align="right"><spring:message code="lab_status"/>&nbsp;&nbsp;:&nbsp;</td>
			<td align="left"><form:select path="status">
				<form:option value="" label="<--- Select --->" />
				<form:option value="COMPLETE" item="COMPLETE" />
				<form:option value="INPROGRESS" item="INPROGRESS" />
				<form:option value="PENDING" item="PENDING" />
				</form:select>
			</td>
		</tr>
		<tr><td></td><td align="left"><div id="lab_orderNoErrorId"></div></td><td></td><td align="left"><div id="lab_statusErrorId"></div></td></tr>
		<tr>
			<td align="right"><spring:message code="lab_product"/>&nbsp;&nbsp;:&nbsp;</td>
			<td align="left"><form:select path="products">
				<form:option value="" label="<--- Select --->" />
				<form:options items="${shortShipmentDatas.productData}" />
				</form:select>
			</td>
			<td align="right"><spring:message code="lab_masterVersion"/>&nbsp;&nbsp;:&nbsp;</td>
			<td align="left"><form:select path="masterVersions">
				<form:option value="" label="<--- Select --->" />
				<form:options items="${shortShipmentDatas.masterVersionData}" />
				</form:select>
			</td>
		</tr>
			<tr><td></td><td align="left"><div id="lab_productErrorId"></div></td><td></td><td align="left"><div id="lab_masterVersionErrorId"></div></td></tr>
		<tr><td height="20" colspan="4"></td></tr>
		<tr><td colspan="4" align="center"><input type="submit" id="showData" value="Show" onclick="validateShortShipmentWithFilter(event);"/></td></tr>
		</table>
		<table width="75%">
		<tr><td height="15" colspan="4"></td></tr>
		<tr><td colspan="4">
		<table width="100%" align="center" border='1'  bordercolor='#000000' cellspacing='1' cellpadding='0' >
			<tr class='mainTableHeader'>
				<th><spring:message code="lab_mainSeries_From"/></th>
				<th><spring:message code="lab_mainSeries_To"/></th>
				<th><spring:message code="lab_BoxNo"/></th>
				<th><spring:message code="lab_product"/></th>
				<th><spring:message code="lab_masterVersion"/></th>
				<th><spring:message code="lab_po"/></th>
			</tr>
		 <c:forEach items="${shortShipmentDatas.data}" var="data">
				<tr>
					<td align="center">${data.mainSeriesFrom}</td>
					<td align="center">${data.mainSeriesTo}</td>
					<td align="center">${data.boxNo}</td>
					<td align="center">${data.product}</td>
					<td align="center">${data.masterVersion}</td>
					<td align="center">${data.po}</td>
				</tr>
			</c:forEach>
		</table>
		</td></tr>
	</table>
</td></tr>
</table>

<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

</form:form>

</body>
</html>