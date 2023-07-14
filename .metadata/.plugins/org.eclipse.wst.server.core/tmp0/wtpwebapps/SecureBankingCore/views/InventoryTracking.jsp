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
		<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/inventory.js"></script>
   	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
		<script type="text/javascript">

    //Plug-in to fetch page data 
	jQuery.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
		return {
			"iStart":         oSettings._iDisplayStart,
			"iEnd":           oSettings.fnDisplayEnd(),
			"iLength":        oSettings._iDisplayLength,
			"iTotal":         oSettings.fnRecordsTotal(),
			"iFilteredTotal": oSettings.fnRecordsDisplay(),
			"iPage":          oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
			"iTotalPages":    oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
		};
	};

	$(document).ready(function() {
		$("#example").hide();
	

	} );

</script>
		
		
 	</head>
 	
 	
<body onload="inventoryTrackOnLoad();">
<form:form id="inventoryTracking"  method="post"  modelAttribute="inventoryTrackingDataAttr"  action="${pageContext.request.contextPath}/AdminUI/inventory/onInventoryTrackingSubmit"> 
<div>
    		<table width='100%' border='0' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>
	    		<!-- ****************************************** Row for showing result message ******************************* -->
	    		<tr><td height="50" colspan="2">&nbsp;</td></tr>
	    		<tr><td colspan="2"><div align="center" class="tableLable"><b><font color="red">${resultMessage}</font></b></div></td></tr>
	    		<tr><td colspan="2">&nbsp;</td></tr>
	    		<tr><td width="50%" align="center" valign="middle">
	    		<table width='75%' border='0' class='tableMain' cellspacing='1' cellpadding='0' bordercolor='#000000'>
	    			
	    			<tr><td colspan="2"></td></tr>
	    			
	    			<!-- ****************************************** Form Heading  ******************************* -->
	    			<tr><td colspan="2"><div align="center" class="mainTableHeader"><spring:message code="label_inventory_tracking"/></div></td></tr>
	    			<tr><td width="50%" align="center">
	    			<table border='0'  cellspacing='1' cellpadding='0' bordercolor='#000000'>
	    			<tr>
	    				<td align="right" width="50%" class="tableLabel">&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="label_login_as"/>&nbsp;:&nbsp;&nbsp;</td> 
	    				<td align="left" width="50%" class="tableLabel"><form:input type="text"  style="width:140px" id="label_login_as" path="labelLoginAs" placeholder="Login As" value="${logername}" readOnly="true"/></td>
	    				
	    			</tr>
	    			<!-- *******************  for Host  ******************* -->
	    			<tr id="hostId">
	    				<td align="right" width="50%" class="tableLabel">&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="label_host"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel">
	    					<form:select path="labelHost" style="width:100%" onchange="emptyerror(event,'label_host_ErrorId');getDistributor('label_host');">
	    						<form:option value="" label="<----Select---->"/>
	    						<form:options items="${acountuserinfovalues}"/>
	    					</form:select>
	    				</td>
	    				<%-- <td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_sim_type"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="25%" align="left">
	    					<form:select path="label_sim_type" onchange="emptyerror(event,'label_sim_type_ErrorId');fetchVersion('label_sim_type');">
	    						<form:option value="" label="<----Select>"/>
	    						<form:option value="1">SIM</form:option>
	    						<form:option value="2">RFID Tag</form:option>
	    						<form:option value="3">SIM with RFID Tag</form:option>
	    						<form:option value="4">Big Reader</form:option>
	    						<form:option value="5">Small Reader</form:option>
	    						<form:option value="6">SIM with Big Reader</form:option>
	    						<form:option value="7">SIM with Small Reader</form:option>
	    					</form:select>
	    				</td> --%>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_host_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Distributor  ******************* -->
	    			<tr id="distributorId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_Distributor"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel"> 
	    					<form:select path="labelDistributor" style="width:100%" onchange="emptyerror(event,'label_Distributor_ErrorId');getSubDistributor('label_Distributor');">
	    						<form:option value="" label="<----Select---->"/>
	    						<form:options items="${acountuserdistributor}"/>
	    					</form:select>
	    				</td>
	    				<%-- <td width="25%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_version_num"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="25%" align='left'>
	    					<form:select path="label_version_num" onchange="emptyerror(event,'label_version_num_ErrorId');getVersionDescription('label_version_num','label_Description');"> 	                        
		                	 	<form:option value="" label="<----Select---->"/> 
	    					</form:select>
	    				</td> --%>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_Distributor_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Sub-Distributor  ******************* -->
	    			<tr id="subdistributorId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_Sub_Distributor"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel">
	    					<form:select path="labelSubDistributor" style="width:100%" onchange="emptyerror(event,'label_Sub_Distributorr_ErrorId');getRetailer('label_Sub_Distributor');">
	    						<form:option value="" label="<----Select---->"/>
	    						<form:options items="${acountdistSubDist}"/>
	    					</form:select>
	    				</td>
	    				<%-- <td width="25%" align="right" class="tableLabel"><spring:message code="label_Description"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="25%" align='left'><form:textarea id="label_Description" value="${details}" path="label_Description" placeholder="description" readOnly="true"/></td> --%>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_Sub_Distributorr_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Retailer  ******************* -->
	    			<tr id="retailerId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_Retailer"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel">
	    					<form:select path="labelRetailer" style="width:100%" onchange="emptyerror(event,'label_Retailer_ErrorId');getBC('label_Retailer');">
	    						<form:option value="" label="<----Select---->"/>
	    					</form:select>
	    				</td>
	    				<!-- <td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_Retailer_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Business Corespondance (BC)  ******************* -->
	    			<%-- <tr id="bcId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_BC"/>&nbsp;:&nbsp;&nbsp;</td>
	    			    <td align="left" width="50%" class="tableLabel"> 
	    					<form:select path="label_BC"  style="width:100%" onchange="emptyerror(event,'label_BC_ErrorId');">
	    						<form:option value="" label="<----Select---->"/>
	    					</form:select>
	    				</td>
	    			<!-- 	<td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_BC_ErrorId" align="left"></div></td></tr> --%>
	    			
	    			
	    		<%-- 	<tr id="pageNumber">
	    				<td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_pageNumber"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align="left">
	    					<form:select path="label_sim_type" id="productId" style="width:140px" >
	    						<form:option value="" label="<----Select--->"/>
	    						<form:option value="5">5</form:option>
	    						<form:option value="10">10</form:option>
	    						
	    					</form:select>
	    				</td>
	    				
	    				<!-- <td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_sim_type_ErrorId" align="left"></div></td></tr> --%>
	    			
	    			
	    			</table></td>
	    			<td width="50%" align="center" valign="middle">
	    		<table  border='0' cellspacing='1' cellpadding='0' bordercolor='#000000'>
	    		<tr><td colspan="2">&nbsp;</td></tr> 	
	    			<!-- *******************   for sim type       ******************* -->
	    			 <tr id="simType">
	    				<td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_sim_type"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align="left">
	    					<form:select path="labelSimType" id="productId" style="width:140px" onchange="emptyerror(event,'label_sim_type_ErrorId');fetchVersion('productId');">
	    						<form:option value="" label="<----Select--->"/>
	    						<form:option value="1">SE</form:option>
	    						<form:option value="2">RFID Tag</form:option>
	    						<form:option value="3">SE with RFID Tag</form:option>
	    						<form:option value="4">Big Reader</form:option>
	    						<form:option value="5">Small Reader</form:option>
	    						<form:option value="6">SE with Big Reader</form:option>
	    						<form:option value="7">SE with Small Reader</form:option>
	    					</form:select>
	    				</td>
	    				<!-- <td id="sim_image" width="33%" align="left"><div><img id="img123" src="" width="42" height="42"></img></div></td> -->
	    				<!-- <td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_sim_type_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Version Number  ******************* -->
	    			<tr id="versionID">
	    				<td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_version_num"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align='left'>
	    					<form:select path="labelVersionNum"  style="width:140px" onchange="emptyerror(event,'label_version_num_ErrorId');getVersionDescription('label_version_num','label_Description');"> 	                        
		                	 	<form:option value="" label="<----Select--->"/> 
	    					</form:select>
	    				</td>
	    				<!-- <td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_version_num_ErrorId" align="left"></div></td></tr>
	    			<!-- ******************   for Version Description **************** -->
	    			<tr id="versnDescrptn">
	    				<td width="50%" align="right" class="tableLabel"><spring:message code="label_Description"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align='left'><form:textarea id="label_Description" value="${details}" path="labelDescription" placeholder="description" readOnly="true"/></td>
	           		</tr>
	           		<tr><td width="50%"></td><td width="50%"><div id="descriptionErrorId" align="left"></div></td></tr>
	    			
	    			
	    			<!-- *******************  for status type  *******************
	    			<tr id="versionID">
	    				<td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_status_type"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align='left'>
	    					<form:select path="label_status_type" onchange="emptyerror(event,'label_status_type_ErrorId');"> 	                        
		                	 <form:option value="" label="<Select>"/> 
	    					</form:select>
	    				</td>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_status_type_ErrorId" align="left"></div></td></tr> -->
	    			<!-- ******************* submit button ******************* -->
	    			<tr><td colspan="2"></td></tr>        
					<tr id="inventoryStatusType">
	    				<td width="50%" align="right" class="tableLabel"><font color="red">*&nbsp;</font><spring:message code="label_pageNumber"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td width="50%" align="left">
	    					<form:select path="inventoryStatus" id="inventoryStatusTypes" style="width:140px" >
	    						<form:option value="" label="<----Select--->"/>
	    						<form:option value="1">Stock In Inventory</form:option>
	    						<form:option value="2">Sold Out Units</form:option>
	    						
	    					</form:select>
	    				</td>
	    				
	    				<!-- <td width="25%"></td><td width="25%"></td> -->
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="inventoryStatusTypes_ErrorId" align="left"></div></td></tr>
	    			
					
					</table>
	    		    </td></tr>
	    		    <tr><td colspan="2" align='right' class="tableLabel"><input type="submit" onclick="inventoryValidate('inventoryTracking',event);inventoryRetrieve();" value="submit"/>&nbsp;&nbsp;&nbsp;</td></tr>
	    		    </table></td></tr>
	    		    <tr><td colspan="2"></td></tr>
	    		    
	    		    <tr id="erorid" style="display:none"><td colspan="2" height="50"><div align="center" id="errorid"></div></td></tr>
	    		    <tr id="resultid" style="display: none"><td colspan="2" align="center" valign="middle">
	    		<table width='75%' border='0' class='tableMain' cellspacing='1' cellpadding='0' bordercolor='#000000'>	
	    		    <tr><td colspan="2"><div align="center" class="mainTableHeader"><spring:message code="label_inventory_status"/></div></td></tr>
	    			<!-- *********************************************************** -->
	    			<!-- *******************  for Total Units  ******************* -->
	    			<tr id="totalunitId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_total_units"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel"><form:input path="labelTotalUnits" onchange="emptyerror(event,'tracking_under_logger_ErrorId');" readOnly="true"/></td>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_total_units_ErrorId" align="left"></div></td></tr>
	    			<!-- *******************  for Sold Units  ******************* -->
	    			<tr id="soldunitId">
	    				<td align="right" width="50%" class="tableLabel"><spring:message code="label_sold_units"/>&nbsp;:&nbsp;&nbsp;</td>
	    				<td align="left" width="50%" class="tableLabel"><form:input path="labelSoldUnits" onchange="emptyerror(event,'label_sold_units_ErrorId');" readOnly="true"/></td>
	    			</tr>
	    			<tr><td width="50%"></td><td width="50%"><div id="label_sold_units_ErrorId" align="left"></div></td></tr>
	    			<!-- ******************  tabs to show the inventory*********** -->
	    			<!-- <tr><td colspan="2" align="right"  class="tableLabel"><input type="button" onclick="excelGenerate();" value="Inventory Excel Download"/></td></tr> -->
	    			<tr><td colspan="2">
	    			<div class="tabs">
   	 				<ul class="tab-links">
        				<%-- <li class="active"><a href="#tab1"><spring:message code="label_inStockInventoryHeader"/></a></li>
        				<li><a href="#tab2"><spring:message code="label_soldOutUnits"/></a></li> --%>
        				<%-- <li><a href="#tab3"><spring:message code="label_damagedUnits"/></a></li>
        				<li><a href="#tab4"><spring:message code="label_returnedUnits"/></a></li> --%>
    				</ul>
 
  					  <div class="tab-content">
       					 <div id="tab1" class="tab active" style="">
            				<table width='100%'  class='tableMain cell-border'  cellspacing='1' cellpadding='0' border='1' bordercolor='#000000'id="stock_in_inventory_table">
            					<thead>
            					<tr><th><spring:message code="label_serialNo"/></th><th><spring:message code="label_externalNo"/></th><th><spring:message code="label_versionNo"/></th><th><spring:message code="label_accountType"/></th><th><spring:message code="label_host"/></th><th><spring:message code="label_sellerName"/></th><th><spring:message code="label_currentStatus"/></th><th><spring:message code="label_sellingDate"/></th></tr>
            					</thead>
            				</table>
        				 </div>
 
        				<div id="tab2" class="tab">
            				<table width='100%' class='tableMain cell-border' cellspacing='1' cellpadding='0' border='1' bordercolor='#000000' id="sold_out_units_table">
 								<thead>
            					<tr><th><spring:message code="label_serialNo"/></th><th><spring:message code="label_externalNo"/></th><th><spring:message code="label_versionNo"/></th><th><spring:message code="label_accountType"/></th><th><spring:message code="label_host"/></th><th><spring:message code="label_sellerName"/></th><th><spring:message code="label_currentStatus"/></th><th><spring:message code="label_sellingDate"/></th></tr>
            					</thead>
            				</table>
        				</div>
 
        				<div id="tab3" class="tab">
            				<table width='100%' class='tableMain cell-border' cellspacing='1' cellpadding='0' border='1' bordercolor='#000000' id="damaged_units_table">
            					<thead>
            					<tr><th><spring:message code="label_serialNo"/></th><th><spring:message code="label_externalNo"/></th><th><spring:message code="label_versionNo"/></th><th><spring:message code="label_accountType"/></th><th><spring:message code="label_host"/></th><th><spring:message code="label_sellerName"/></th><th><spring:message code="label_currentStatus"/></th><th><spring:message code="label_sellingDate"/></th></tr>
            					</thead>
            				</table>
        				</div>
        				<div id="tab4" class="tab">
            				<table width='100%' class='tableMain cell-border' cellspacing='1' cellpadding='0' border='1' bordercolor='#000000' id="returned_units_table">
            					<thead>
            					<tr><th><spring:message code="label_serialNo"/></th><th><spring:message code="label_externalNo"/></th><th><spring:message code="label_versionNo"/></th><th><spring:message code="label_accountType"/></th><th><spring:message code="label_host"/></th><th><spring:message code="label_sellerName"/></th><th><spring:message code="label_currentStatus"/></th><th><spring:message code="label_sellingDate"/></th></tr>
            					</thead>
            				</table>
        				</div>
   					</div>
					</div>
					</td></tr>
	    			
	    		</table>
	    		
	    		
	    		
	    		
	    		</td></tr>
    		</table>
    		<input type="hidden" id="acountTypeId" value="${acountTypeId}"></input>
    		<input type="hidden" id="hiddenContext" value="${pageContext.request.contextPath}"/>
</div>


<table width="75%" style="border: 3px;background: rgba(193, 27, 27, 0.59);"><tr><td>
	<table id="example" class="display" style="border: 3px;background: #c10000;" cellspacing="0" width="90%">
        <thead>
            <tr>
                <th align="left" style="color:white;">External Serial Number</th>
     			<th  align="left" style="color:white;">Version Number</th>
     			<th  align="left" style="color:white;">Selling date</th>
     			<th  align="left" style="color:white;">Possession Status</th>
     			<th  align="left" style="color:white;">Host Name</th>
            </tr>
        </thead>       
    </table>
    </td></tr></table>
    
    <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
    
</form:form>
</body>
</html>