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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/InventoryPoRaise.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	</head>
	<!-- *********************************** Code Of Inventory Order Page  ************************************************ -->
	<form:form id="InventoryPoRaise"  method="post"  modelAttribute="inventoryMgmtData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/inventoryPoRaiseSubmit" ><!-- ${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/inventoryPoRaiseSubmit --> 
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
	    									<th><spring:message code="lable_product_name"/></th>
	    									<th><spring:message code="lable_master_version"/></th>
	    									<%-- <th><spring:message code="lable_host_sub_version"/></th> --%>
	    									<th><spring:message code="lable_avail_stock"/></th>
	    								</tr>
	    								<c:forEach items="${availableStockList}" var="availableStockList">
	    									<tr>
	    										<td align="left">${availableStockList.productName}</td>
	    										<td align="center">${availableStockList.mvName}</td>
	    										<%-- <td align="center">${availableStockList.hsvName}</td> --%>
	    										<td align="center">${availableStockList.availableStock}</td>
       			    						</tr>                                      
	                    				</c:forEach>
									</table>			    					
	    						</td>
	    					</tr>
	    				</table>	    				
	    			</td>
	    		</tr>
	    		<tr><td colspan="2" height="80">&nbsp;</td></tr>
	    		<!-- ****************************************** Row for showing result message ******************************* -->
	    		<tr><td colspan="2"><div id="statusMessage" align="center" class="tableLable"><b><font color="green">${statusMessage}</font></b></div></td></tr>
	    		<tr><td colspan="2"><div id="errorstatusMessage" align="center" class="tableLable"><b><font color="red">${errorstatusMessage}</font></b></div></td></tr>
	    		<tr><td colspan="2">&nbsp;</td></tr>
	    		<tr><td colspan="2" align="center" valign="center">
	    		<table width='75%' border='0' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>	
	    			<tr><td colspan="2"></td></tr>
	    			<!-- ****************************************** Form Heading  ******************************* -->
	    			<tr bgcolor="#1682ba"><th colspan="3"><div class="mainTableHeader" align="center" style="color: black ;" ><font color='white'><spring:message code="label_inventory_purchasing_Order"/></font></div></th></tr>
	    			<tr><td colspan="3">&nbsp;</td></tr>
					<tr><td colspan="3">&nbsp;</td></tr>
					
					<!-- ****************************************** Order Type ******************************* -->
	    			<tr>
	    				<td width="33%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_order_type"/></td>
	    				<td width="5%" align="center">:</td>
	    				<td width="33%" align='left'>
	   						<form:select  id="orderTypeVal" path="orderTypeVal" style="width:180px" onchange="showOrderTypeDivPanel();"><!-- showOrderTypeDivPanel()  -->	                        
	    	            		
	    	            		<c:choose>
	    							<c:when test="${groupCode == 'PP'}">
										<form:option value="" label="Select Order Type" />
	                        		</c:when>
	                        		<c:when test="${groupCode == 'RE'}">
	                        			<form:option value="" label="Select Order Type" />
	                        			<form:option value="SELF" label="SELF" />
	                        		</c:when>
	                        		<c:otherwise>
	                        			<form:option value="" label="Select Order Type" />
	                        			<form:option value="SELF" label="SELF" />
	        	        		<form:option value="ONBEHALF" label="ONBEHALF" />
	                        		</c:otherwise>
	                        	</c:choose>
	                		</form:select>
	                	</td>
	           		</tr>
	           		<tr><td colspan="3" align="center"><div id="orderTypeErrorId" align="center"></div></td></tr>
	           		<tr>
	           			<td colspan="3">
	           				<div id="onBehalfInfoDiv" title="" align="center" style="display:none" width="100%">
	           					<table id='orderOnbehalgInfoTable' border="0" cellpadding='0' cellspacing='0' width="100%">
									<tbody>

									</tbody>
								</table>
	           				</div>
	           			</td>
	           		</tr>
	           		<tr>
	           			<td colspan="3"><div id="orderInfoDiv" style="display:none">
	           				<table width="100%" cellpadding="0" cellspacing="0"	border="0">
									<!-- ****************************************** Inventory Product Type ******************************* -->
									<tr>
										<td width="33%" align="right" class="tableLabel">
											<font color="red">*&nbsp;</font><spring:message code="label_product_type" />
										</td>
										<td width="5%" align="center">:</td>
										<td width="33%" align='left'>
											<form:select name="productId" style="width:180px" id="productId" path="productId" onChange="emptyerror(event,'productIdErrorId');">
												<form:option value="" label="Select Product" />
												<form:options items="${productTypeMap}" />
											</form:select>
										</td>
									</tr>
									<tr>
										<td colspan="3" align="center"><div id="productIdErrorId" align="center"></div></td>
									</tr>

									<!------------------Host SKU version List---------------------------- -->
									<%-- <tr>
	    				<c:if test="${groupCode ne 'HO'}">
	    					<td align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_hsku_version"/></td>
	    					<td width="5%" align="center">:</td>
		    				<td align='left'>
		    					<form:select id="hsvId" style="width:180px" path="hsvId" onchange="getMasterVersionByHostSubVersionId();">	                        
			                		<form:option value="" label="Select Host Sub Version" />
		        	        		<c:forEach items="${hostSubVersionList}" var="hostSubVersionList">
       			    					<form:option value="${hostSubVersionList.id}" label="${hostSubVersionList.name}"/>                                      
	                    	  		</c:forEach>
		                		</form:select>
		                	</td>
		                	<td ></td>
		            	</c:if>
	           		</tr>
	           		<tr><td width="33%"></td><td width="33%"><div id="hsvIdErrorId" align="left"></div></td><td width="33%"></td></tr> --%>

									<!-- ****************************************** Master version Number ******************************* -->
									<tr>
										<td align="right" class="tableLabel"><font color="red">*&nbsp;</font>
										<spring:message code="label_master_version" /></td>
										<td width="5%" align="center">:</td>
										<td align='left'>
											<form:select id="mvId" path="mvId" style="width:180px" onChange="emptyerror(event,'mvIdErrorId');">
												<form:option value="" label="Select Master Version" />
												<c:forEach items="${masterVersionList}" var="masterVersionList">
													<form:option value="${masterVersionList.id}" label="${masterVersionList.name}" />
												</c:forEach>
											</form:select>
										</td>
									</tr>
									<tr>
										<td colspan="3" align="center"><div id="mvIdErrorId" align="center"></div></td>
									</tr>

									<!-- ****************************************** inventory_purchaseOrder ******************************* -->
									<tr>
										<td align="right" class="tableLabel">
											<font color="red">*&nbsp;</font><spring:message code="label_inventory_purchaseOrder" />
										</td>
										<td width="5%" align="center">:</td>
										<td align='left'>
											<form:input id="productOrderQty" style="width:175px" type="text" path="productOrderQty" size='16' placeholder="purchasing Order" maxlength="12"
												onkeypress="onlyNumric(event,'productOrderErrorId'),emptyerror(event,'productOrderQtyErrorId');" onfocus="emptyerror(event,'productOrderQtyErrorId')" /><span
											id="label_inventory_purchaseOrder_unitName"></span>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="3"><div id="productOrderQtyErrorId" align="center"></div></td>
									</tr>
								</table>
							</div></td>
	           		</tr>
					
	           		<tr><td colspan="3"></td></tr>        
					<tr><td colspan='3' align='right' class="tableLabel"><input type="submit"  value="Submit" onclick="inventoryPoRaiseValidate(event);"/>&nbsp;&nbsp;&nbsp;</td></tr>
					<tr><td colspan="3">&nbsp;</td></tr> 
	    		</table>
	    		<input id="groupCode" path="groupCode" name="groupCode" value="" type="hidden" />
	    		</td></tr>
	    		<tr><td height="285" colspan="3">&nbsp;</td></tr>
	    	</table> 
 
   
   
    	</div>
    	
	</form:form>
</html>