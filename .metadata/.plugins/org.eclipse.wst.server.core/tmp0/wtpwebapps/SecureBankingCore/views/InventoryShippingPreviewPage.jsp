<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" type="text/css"/>
      	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/InventoryShipping.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
   	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
   	    
   	    <style> 
	 		.DivWithScroll {
   				height:419px;
  				overflow:scroll;
    			overflow-x:hidden;
			}
			.orderDivWithScroll {
   				height:340px;
  				overflow:scroll;
    			overflow-x:hidden; 
			}
        </style> 
   	</head>
	<body >
	<!-- *********************************** Code Of Inventory Order Page  ************************************************ -->
	<form:form id="InventoryShippingPreview" method="post" modelAttribute="orderShipData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/inventoryShippingSubmit">
		<div>
			<table width='100%' border='0' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>

				<!--  Below table for Available stock summary   -->
				<tr>
					<td height="30">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" height="30">&nbsp;</td>
				</tr>
				<!-- ****************************************** Row for showing result message ******************************* -->
				<tr>
					<td colspan="2"><div align="center" class="tableLable">
							<b><font color="red">${statusMessage}</font></b>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center" valign="center">
						<table width='90%' border='0' class='tableMain' cellspacing='1' cellpadding='0' bordercolor='#000000'>
							<tr>
								<td></td>
							</tr>
							<!-- ****************************************** Form Heading  ******************************* -->
							<tr bgcolor="#1682ba">
								<th><div class="mainTableHeader" align="center" style="color: black;">
										<font color='white'><spring:message code="inventory_shipping_preview" /></font>
									</div>
								</th>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td align="center" valign="top">
									<table width="95%" celpadding="0" border="1" cellspacing="0">
										<tr>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="orderNo" />
											</td>

											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="orderDate" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="challanNo" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="shippingDate" />
											</td>
										</tr>
										<tr>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderNumber}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderDate}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.challanNumber}	
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.shippingDate}
											</td>
										</tr>
										
										<tr>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="orderQty" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="pendingQty" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="shippedQty" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="afterShipPendingQty" />
											</td>
										</tr>
										<tr>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderQty}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderPendingQty}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderShippedQty}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.orderPendingQty}
											</td>
										</tr>
										
										<tr>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="orderedBy" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="shippedBy" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="pName" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="mvName" />
											</td>
										</tr>
										<tr>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.fromAccountName}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.toAccountName}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.productName}
											</td>
											<td style="left-margin:5pt;font-size:10pt;">
												${orderShipData.mvName}
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center" valign="top">
									<table width="75%" cellpadding="0" border="1" cellspacing="0">
										<tr bgcolor="#1682ba">
											<th colspan="2">
												<div class="mainTableHeader" align="center" style="color: black;">
													<font color='white'><spring:message code="shippingDetails" /></font>
												</div>
											</th>
										</tr>
										<tr>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="boxNumber" />
											</td>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="boxQty" />
											</td>
										</tr>
										<c:forEach items="${orderShipData.selectedBoxList}" var="selectedBoxList">
											<tr>
												<td>${selectedBoxList.boxNumber}</td>
												<td>${selectedBoxList.boxQtyType}</td>
											</tr>
										</c:forEach>
										<tr>
											<td align="center" valign="top" style="left-margin:5pt;font-size:10pt;font-weight:bold;">
												<spring:message code="totalQty" />
											</td>
											<td align="center">${selectedBoxList.totalSeCount}</td>
										</tr>
									</table>
									
								</td>
							</tr>
							<tr>
								<td align='center' class="tableLabel">
									<input type="submit"  value="Shipped"/>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
	</form:form>
	</body>
</html>