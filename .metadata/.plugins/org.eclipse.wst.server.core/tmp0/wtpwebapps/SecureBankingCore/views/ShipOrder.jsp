<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/genui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ShipOrder.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/json.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
</head>
<body>

	<form:form id="ShipOrder" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShipOrder">
		<table id="mainTable" width='100%' border='0' cellspacing='1'
			cellpadding='0'>
			<tr>
				<td colspan="2" height="25"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">

					<table width='60%' border='0' class='tableMain'
						bordercolor='#000000' cellspacing='1' cellpadding='0'>
						<tr class="mainTableHeader">
							<td colspan="2" align="center" height="18"><font size="3" color="white"><spring:message
										code="label_ship_order" /></font></td>
						</tr>
						<tr>
							<td colspan="2" height="20"></td>
						</tr>

						<tr>
							<td height="25"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">

								<table width='85%' border='1' class='tableMain'
									bordercolor='#000000' cellspacing='1' cellpadding='0'
									id='shiporder_table'>
									<tr class="mainTableHeader">
										<th align="center"><b><spring:message
													code="lab_product" /></b></th>	
										<th align="center"><b><spring:message
													code="lab_MasterVersion" /></b></th>
										<th align="center"><b><spring:message
													code="lab_UnitOrder" /></b></th>
										<th align="center"><b><spring:message
													code="lab_UnitPending" /></b></th>
										<th align="center"><b><spring:message
													code="lab_Unit_Instock" /></b></th>
										<th align="center"><b><spring:message
													code="lab_Tobe_Shipped" /></b></th>
									</tr>
									<c:forEach items="${inventoryMgmtData.shipdataList}"
										var="acList">
										<tr>
											<td>${acList.productName}</td>

											<td>${acList.mvName}</td>
											<td>${acList.productOrderQty}</td>
											<td>${acList.productunitspending}</td>
											<td>${acList.availableStock}</td>
											<td><form:input id="select_type_id" path="select_type_id" name="select_type_id" type="text" /></td>

										</tr>

									</c:forEach>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								
							</td></tr>
						<tr>
							<td colspan="2" align="center"><input id="preview_id"
								type="submit" value="Print" onclick="windows.print()" /></td><!-- return preview(); -->
						</tr>

						<tr>
							<td height="25" align="right"><input id="Submit_id"
								type="submit" value="Submit" onclick="return shippedData();"/></td>
						</tr>
					</table>
					<div id="popup" title="Table preview"></div>
				</td>
			</tr>

		</table>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
	</form:form>

</body>
</html>