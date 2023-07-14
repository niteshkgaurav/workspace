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
	<form:form id="InventoryShipping" method="post" modelAttribute="inventoryMgmtData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/InventoryRangeDetailsPage">
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
					<td colspan="2">
						<div align="center" class="tableLable">
							<b><font color="red">${successMessage}</font></b>
						</div>
						<div align="center" class="tableLable">
							<b><font color="red">${errorMessage}</font></b>
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
										<font color='white'><spring:message code="label_inventory_shipping" /></font>
									</div>
								</th>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>
									<!-- ****************************************** PP Shipping ******************************* -->
									<c:if test="${groupCode eq 'PP'}">
										<table width='100%' border='0' cellspacing='1' cellpadding='0'>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="hostName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'><form:select name="hostId" style="width:200px" id="hostId" path="hostId">
													<form:option value="" label="Select Host" />
														<c:forEach items="${inventoryMgmtData.childAccountList}" var="childAccountList">
															<form:option value="${childAccountList.id}"
																label="${childAccountList.name}" />
														</c:forEach>
													</form:select>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><div align="center" id="hostIdErrorId" ></div></td>
											</tr>
										</table>
									</c:if> 
									
									<!-- ****************************************** Host Shipping ******************************* -->
									
									<c:if test="${groupCode eq 'HO'}">
										<table width='100%' border='0' cellspacing='1' cellpadding='0'>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="hostName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="hostName" name="hostName" path="hostName" type="textbox" value="${inventoryMgmtData.hostName}" readonly="true" style="width: 200px" /> 
													<input id="hostId" name="hostId" path="hostId" value="${inventoryMgmtData.hostId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="distName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<form:select name="distId" style="width: 200px" id="distId" path="distId">
														<form:option value="" label="Select Distributor" />
														<c:forEach items="${inventoryMgmtData.childAccountList}" var="childAccountList">
															<form:option value="${childAccountList.id}" label="${childAccountList.name}" />
														</c:forEach>
													</form:select>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><div align="center" id="distIdErrorId" ></div></td>
											</tr>
										</table>
									</c:if> 
									
									<!-- ****************************************** Distributor Shipping ******************************* -->
									
									<c:if test="${groupCode eq 'DI'}">
										<table width='100%' border='0' cellspacing='1' cellpadding='0'>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="hostName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="hostName" name="hostName" path="hostName" type="textbox" readonly="true" value="${inventoryMgmtData.hostName}" style="width: 200px" /> 
													<input id="hostId" name="hostId" value="${inventoryMgmtData.hostId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="distName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="distName" name="distName" path="distName" type="textbox" readonly="true" value="${inventoryMgmtData.distName}" style="width: 200px" /> 
													<input id="distId" name="distId" value="${inventoryMgmtData.distId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="subDistName" />&nbsp;:&nbsp;&nbsp;</td>
												<td width="35%" align='left'>
													<form:select name="subDistId" style="width:180px" id="subDistId" path="subDistId">
														<form:option value="" label="Select Distributor" />
														<c:forEach items="${inventoryMgmtData.childAccountList}" var="childAccountList">
															<form:option value="${childAccountList.id}"
																label="${childAccountList.name}" />
														</c:forEach>
													</form:select>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><div id="subDistIdErrorId" align="center"></div></td>
											</tr>
										</table>
									</c:if> 
									
									<!-- ****************************************** Sub-Distributor Shipping ******************************* -->
									<c:if test="${groupCode eq 'SD'}">
										<table width='100%' border='0' cellspacing='1' cellpadding='0'>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="hostName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="hostName" name="hostName" path="hostName" type="textbox" readonly="true" value="${inventoryMgmtData.hostName}" style="width: 200px" /> 
													<input id="hostId" name="hostId" value="${inventoryMgmtData.hostId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="distName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="distName" name="distName" path="distName" type="textbox" readonly="true" value="${inventoryMgmtData.distName}" style="width: 200px" /> 
													<input id="distId" name="distId" value="${inventoryMgmtData.distId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="subDistName" />&nbsp;:&nbsp;&nbsp;
												</td>
												<td width="35%" align='left'>
													<input id="subDistName" name="subDistName" path="subDistName" type="textbox" readonly="true" value="${inventoryMgmtData.subDistName}" style="width: 200px" /> 
													<input id="subDistId" name="subDistId" value="${inventoryMgmtData.subDistId}" type="hidden" />
												</td>
											</tr>
											<tr>
												<td width="35%" align="right" class="tableLabel">
													<font color="red">*&nbsp;</font>
													<spring:message code="retName" />&nbsp;:&nbsp;&nbsp;</td>
												<td width="35%" align='left'>
													<form:select name="agentId" style="width:180px" id="agentId" path="agentId">
														<form:option value="" label="Select Distributor" />
														<c:forEach items="${inventoryMgmtData.childAccountList}" var="childAccountList">
															<form:option value="${childAccountList.id}"
																label="${childAccountList.name}" />
														</c:forEach>
													</form:select>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><div id="agentIdErrorId" align="center"></div></td>
											</tr>
										</table>
									</c:if>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td align='center' class="tableLabel">
									<input type="button"  value="Show Orders" onclick="return getInventoryOrderHistoryByAccountId(event);"/>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td height="25" colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<div id="informationDiv" title="" align="center"></div>
								</td>
							</tr>
							<tr>
								<td>
									<div align="center" id="orderInfoDiv" style="display: none;">
										<div width="90%" align="center" id="orderDivScroll" class="orderDivWithScroll">
											<table id='orderHistoryInfoDiv' border="1" width="95%">
												<thead>

												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<input id="groupCode" name="groupCode" value="${groupCode}" type="hidden" />
		<form:input id="orderId" name="orderId" path="orderId" value="" type="hidden" />
		<form:input id="orderNumber" name="orderNumber" path="orderNumber" value="" type="hidden" />
		<form:input id="productId" name="productId" path="productId" value="" type="hidden" />
		<form:input id="mvId" name="mvId" path="mvId" value="" type="hidden" />
		
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
	</form:form>
	</body>
</html>