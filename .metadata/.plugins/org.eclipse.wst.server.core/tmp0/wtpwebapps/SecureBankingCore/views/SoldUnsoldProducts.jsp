<%@page import="java.util.Arrays"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ShipOrder.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<title>Sold Unsold Products</title>
</head>
<body>
	<form:form id="SoldUnsoldProducts" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/SoldUnsoldProducts">

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
							<td colspan="2" align="center" height="18"><font size="3"
								color="white"><spring:message
										code="label_soldunsoldproducts" /></font></td>
						</tr>
						<tr>
							<td colspan="2" height="20"></td>
						</tr>


						<tr>
							<td align="right"></td>
							<td><spring:message code="label_Status1" /> <form:select
									id="SoldstatusId" path="status_Id" style="width: 150px"
									onchange="statuserror(event);">
									<form:option value="0" label="<-----Select----->" />
									<form:option value="SOLD" label="SOLD" />
									<form:option value="UNSOLD" label="UNSOLD" />
									<form:option value="ALL" label="ALL" />
								</form:select></td>


						</tr>
						<tr>
							<td></td>
							<td id="Status_errorId"></td>
						</tr>


						<tr>
							<td height="25"></td>
						</tr>
						<tr>
							<td colspan="4"><input type="submit" value="Show"
								onclick="validatestatus(event)" /></td>
						</tr>
						<tr>
							<td height="25"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">

								<table width='100%' border='1' class='tableMain'
									bordercolor='#000000' cellspacing='1' cellpadding='0'
									id='shiporder_table'>
									<tr class="mainTableHeader">
										<th style="width: 20px" align="center"><b><spring:message
													code="lab_SNO" /></b></th>
										<th style="width: 80px" align="center"><b><spring:message
													code="lab_ExternalNO" /></b></th>
										<th style="width: 20px" align="center"><b><spring:message
													code="lab_Status" /></b></th>
										<th style="width: 50px" align="center"><b><spring:message
													code="lab_CustomerPhoneNo" /></b></th>
										<th style="width: 50px" align="center"><b><spring:message
													code="lab_dateofissuence" /></b></th>
										<th style="width: 50px" align="center"><b><spring:message
													code="lab_products" /></b></th>
									</tr>
								</table>

								<table width='100%' border='1' class='tableMain'
									bordercolor='#000000' cellspacing='1' cellpadding='0'
									id='shiporder_table'>
									<tr>
										<td>
											<div style="height: 200px; overflow: auto">
												<table width='100%' border='1' class='tableMain'
													bordercolor='#000000' cellspacing='1' cellpadding='0'
													id='shiporder_table'>
													<tr class="mainTableHeader">
														<c:forEach items="${inventoryMgmtData.soldunsoldlist}"
															var="acList">

															<tr>
																<td style="width: 25px">${acList.sno}</td>
																<td style="width: 40px">${acList.externalno}</td>
																<td style="width: 30px">${acList.statusType}</td>
																<td style="width: 50px">${acList.customerphone}</td>
																<td style="width: 50px">${acList.dateofIssuence}</td>
																<td style="width: 50px">${acList.productName}</td>


															</tr>
														</c:forEach>
													</tr>
												</table>
											</div>
										</td>
									</tr>

								</table>
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