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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css"/> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/genui.css"/>
      	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/InventoryOrderHistory.js"></script>
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
   	    
   	    <script>
   			$(function() {
 				var pickerOpts = {
 					showOn: "button",
	        		buttonImage: "${pageContext.request.contextPath}/images/datepicker2.png",
 	        		minDate: "-12M",
 	        		maxDate: "+0D",
 	        		numberOfMonths: 1,
         		};
 	    		$("#fromDate" ).datepicker(pickerOpts);
 	    		$("#toDate" ).datepicker(pickerOpts); 
   			}); 
  		</script>
  
	</head>
	<body >
	<!-- *********************************** Code Of Inventory Order Page  ************************************************ -->
	<form:form id="InventoryOrderHistory"  method="post"  modelAttribute="inventoryMgmtData" action="" > 
    	<div>
    		<table width='100%' border='0' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>
    		
				<!--  Below table for Available stock summary   --> 		
    			<%-- <tr><td height="80">&nbsp;</td></tr>
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
	    									<th><spring:message code="lable_host_sub_version"/></th>
	    									<th><spring:message code="lable_avail_stock"/></th>
	    								</tr>
	    								<c:forEach items="${availableStockList}" var="availableStockList">
	    									<tr>
	    										<td align="left">${availableStockList.productName}</td>
	    										<td align="center">${availableStockList.mvName}</td>
	    										<td align="center">${availableStockList.hsvName}</td>
	    										<td align="center">${availableStockList.availableStock}</td>
       			    						</tr>                                      
	                    				</c:forEach>
									</table>			    					
	    						</td>
	    					</tr>
	    				</table>	    				
	    			</td>
	    		</tr> --%>
	    		<tr><td colspan="2" height="30">&nbsp;</td></tr>
	    		<!-- ****************************************** Row for showing result message ******************************* -->
	    		<tr><td colspan="2"><div align="center" class="tableLable"><b><font color="red">${statusMessage}</font></b></div></td></tr>
	    		<tr><td colspan="2">&nbsp;</td></tr>
	    		<tr><td colspan="2" align="center" valign="center">
	    		<table width='75%' border='0' class='tableMain' cellspacing='1' cellpadding='0' bordercolor='#000000'>	
	    			<tr><td colspan="3"></td></tr>
	    			<!-- ****************************************** Form Heading  ******************************* -->
	    			<tr bgcolor="#1682ba"><th colspan="3"><div class="mainTableHeader" align="center" style="color: black ;" ><font color='white'><spring:message code="label_inventory_order_historyr"/></font></div></th></tr>
	    			<tr><td colspan="3">&nbsp;</td></tr>
					<tr><td colspan="3">&nbsp;</td></tr>
					<!-- ****************************************** Inventory Product Type ******************************* -->
	    			<tr>
	    				<td width="35%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_order_type"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="35%" align='left'>
	    					<form:select   name="orderType" style="width:180px" id="orderType" path="orderType">
	    						<form:option value="" label="Select Order Type"/>
	                        	<form:option value="0" label="Orders Placed"/>
	                        	<form:option value="1" label="Orders Recieved"/>
                            </form:select>
		               </td>
		               <td></td>
	           		</tr>
	           		<tr><td width="35%"></td><td colspan="2"><div id="orderTypeErrorId" align="left"></div></td></tr>
	           		<tr>
	    				<td width="35%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_status_type"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="35%" align='left'>
	    					<form:select   name="statusType" style="width:180px" id="statusType" path="statusType"> 
	    						<form:option value="" label="Select Status Type"/>
	    						<form:option value="ALL" label="ALL"/>
	                        	<form:option value="PENDING" label="PENDING"/>
	                        	<form:option value="PARTIAL CANCELLED" label="PARTIAL CANCELLED"/>
	                        	<form:option value="CANCELLED" label="CANCELLED"/>
	                        	<form:option value="PARTIAL SHIPPED" label="PARTIAL SHIPPED"/>
	                        	<form:option value="SHIPPED" label="SHIPPED"/>
	                        	<form:option value="PARTIAL REJECTED" label="PARTIAL REJECTED"/>
	                        	<form:option value="REJECTED" label="REJECTED"/>
                            </form:select>
		               </td>
		               <td></td>
	           		</tr>
	           		<tr><td width="35%"></td><td colspan="2"><div id="statusTypeErrorId" align="left"></div></td></tr>
	           		<tr>
	    				<td width="35%" align="center" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="fromDate"/></td>
	    				<td width="35%" align="center" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="toDate"/></td>
						<td></td>
	           		</tr>
	           		<tr>
	    				<td width="35%" align='center'>
		   					<form:input id="fromDate" path="fromDate"  type="text" style="width:160px;height:20px;" placeholder="Choose From Date" readonly="true" />
						</td>
						<td width="35%" align='center'>
		   					<form:input id="toDate" path="toDate"  type="text" style="width:160px;height:20px;" placeholder="Choose To Date" readonly="true" />
						</td>
						<td align='center'>
							<input type="button"  value="submit" onclick="return getInventoryOrderHistoryByDate(event);"/>
						</td>
	           		</tr>
	           		<tr><td colspan="2" style="font-size:12pt;color:red;" align="center"><div id="dateErrorID"></div></td></tr>
	           		
	    			<tr><td height="25" colspan="3">&nbsp;</td></tr>
	    		</table></td></tr>	
	    		<tr><td height="25" colspan="2">&nbsp;</td></tr>
	    		<tr>
					<td colspan="2">
						<div align="center" id="orderInfoDiv" style="display: none;">
							<div width="80%" align="center" id="orderDivScroll" class="orderDivWithScroll">
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
	    	<input id="fromDateHidden" name="fromDateHidden" value="" type="hidden" />
	    	<input id="toDateHidden" name="toDateHidden" value="" type="hidden" />
	    	<input id="orderTypeHidden" name="orderTypeHidden" value="" type="hidden" />
	    	<input id="statusTypeHidden" name="statusTypeHidden" value="" type="hidden" />
    	</div>
	</form:form>
	</body>
</html>