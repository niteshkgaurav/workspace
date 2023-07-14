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
		<meta charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/InventoryRangeDetails.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
		
		<style> 
	 		.DivWithScroll {
   				height:419px;
  				overflow:scroll;
    			overflow-x:hidden;
			}
			.boxDivWithScroll {
   				height:120px;
  				overflow:scroll;
    			overflow-x:hidden; 
			}
        </style> 
        
	</head>
	<!-- *********************************** Code Of Inventory Order Page  ************************************************ -->
	<form:form id="orderShipData"  method="post"  modelAttribute="orderShipData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/inventoryShippingPreviewPage"> 
    	<div>
    		<table width='100%' border='0' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>
    			<tr><td height="80">&nbsp;</td></tr>
	    		<tr>
	    			<td colspan="2" align="center">
	    				<table width='75%' border='0' class='tableMain' cellspacing='0' cellpadding='0' border='0' bordercolor='#000000'>
	    					<tr bgcolor="#1682ba"><th><div class="mainTableHeader" align="center" style="color: black ;" ><font color='white'><spring:message code="label_inventory_avail_stock"/></font></div></th></tr>	
	    					<tr>
	    						<td>
									<table border="1" cellpadding="1" cellspacing="0" width="100%">
				    					<tr>
				    						<th><spring:message code="lable_from_range"/></th>
				    						<th><spring:message code="lable_to_range"/></th>
	    									<th><spring:message code="lable_product_name"/></th>
	    									<th><spring:message code="lable_master_version"/></th>
	    									<th><spring:message code="lable_box_qty_type"/></th>
	    									<th><spring:message code="lable_total_box"/></th>
	    									<th><spring:message code="lable_avail_box"/></th>
	    									<th><spring:message code="lab_action"/></th>
	    								</tr>
	    								<c:forEach items="${availableStockListByRange}" var="availableStockListByRange">
	    									<tr>
	    										<td align="center">${availableStockListByRange.fromRange}</td>
	    										<td align="center">${availableStockListByRange.toRange}</td>
	    										<td align="center">${availableStockListByRange.productName}</td>
	    										<td align="center">${availableStockListByRange.mvName}</td>
	    										<td align="center">${availableStockListByRange.boxQtyType}</td>
	    										<td align="center">${availableStockListByRange.totalBoxCount}</td>
	    										<td align="center">${availableStockListByRange.availableBoxCount}</td>
	    										<td align="center">
	    											<div id="btnGetBoxDetailsDiv${availableStockListByRange.id}" style="display: block;">
	    												<input type="button" id="btnGetBoxDetails${availableStockListByRange.id}"  value="Get Box Details" onclick="return getBoxDetailsByRangeId(${availableStockListByRange.id});"/>
	    											</div>
	    											<div id="btnShowHideBoxDetailsDiv${availableStockListByRange.id}" style="display: none;">
	    												<input type="button" id="btnShowHideBoxDetails${availableStockListByRange.id}" value="Hide Box Details" onclick="return showHideBoxDetails(${availableStockListByRange.id});"/>
	    											</div>
	    										</td>
       			    						</tr>
       			    						<tr>
       			    							<td colspan='8'>
       			    								<div align="center" id="boxInfoDiv${availableStockListByRange.id}" style="display: none;">
														<div width="90%" align="center" id="boxDivScroll" class="boxDivWithScroll">
															<table id='boxDetailsInfoDiv${availableStockListByRange.id}' border="1" width="100%">
																<thead>

																</thead>
																<tbody>

																</tbody>
															</table>
														</div>
													</div>
       			    							</td>
       			    						</tr>                                      
	                    				</c:forEach>
	                    				<tr>
											<td colspan='8' align="center">
												<div id="btnSubmitDiv" align="center" style="display: none;">
													<input type="submit"  value="Proceed for Shipping" onclick="return checkSelectedBoxValidation(event);"/>
												</div>
											</td>
										</tr>
									</table>			    					
	    						</td>
	    					</tr>
	    				</table>	    				
	    			</td>
	    		</tr>
	    		
	    		<tr><td height="50" colspan="3">&nbsp;</td></tr>
	    	</table> 
		</div>
		<form:input id="selectedBoxInfo" name="selectedBoxInfo" path="selectedBoxInfo" value="" type="hidden" />
		<input id="groupCode" name="groupCode" value="${groupCode}" type="hidden" />
		<form:input id="orderId" name="orderId" path="orderId" value="${orderId}" type="hidden" />
		<form:input id="orderNumber" name="orderNumber" path="orderNumber" value="${orderNumber}" type="hidden" />
		<form:input id="productId" name="productId" path="productId" value="${productId}" type="hidden" />
		<form:input id="mvId" name="mvId" path="mvId" value="${mvId}" type="hidden" />
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
		
	</form:form>
</html>