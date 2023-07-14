<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bulkIssuance.js"></script>
</head>
<body>
	<form:form id="bulkIssuance" method="post" modelAttribute="bulkIssuanceData" action="${pageContext.request.contextPath}/AdminUI/bulkIssuance/issuanceDetailsSubmit ">
		<table id="mainTable" align="center" class='thickBorder' width="75%"
			height="100%">
			<tr>
				<td align="center">
				<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
				<h3 id="errorId" align="center" style="color:red;">${errorMessage}</h3>
				<table width="100%">
	  			<tr><td colspan="2"><div align="center" class="mainTableHeader"><spring:message code="lab_Bulk_IssuanceTitle"/></div></td></tr>
			<tr>
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="label_master_version" />&nbsp;:&nbsp;&nbsp;</td>
				<td><form:select id="mvId" path="mvId" style="width:200px;" onchange= "emptyerror(event,'label_Master_version_ErrorId');hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="" label="Master Version" />
						<form:options items="${bulkIssuanceData.mvMap}" />
					</form:select></td>
			</tr>
			<tr><td width="50%"></td><td width="50%"><div id="label_Master_version_ErrorId" align="left"></div></td></tr>
			<tr>
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="lable_host_sub_version" />&nbsp;:&nbsp;&nbsp;
				</td>
				<td><form:select id="hsvId" path="hsvId" style="width:200px;" onchange= "emptyerror(event,'label_host_version_ErrorId');hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="" label="Host Sub Version" />
					</form:select></td>
			</tr>
			<tr><td width="50%"></td><td width="50%"><div id="label_host_version_ErrorId" align="left"></div></td></tr>
			<tr>
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="lab_Product_Type" />&nbsp;:&nbsp;&nbsp;</td>
				<td><form:select id="productId" path="productId" 
						style="width:200px;"  onchange= "emptyerror(event,'label_product_ErrorId');hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="" label="Product" />
						<form:options items="${bulkIssuanceData.productMap}" />
					</form:select></td>
			</tr>
			<tr><td width="50%"></td><td width="50%"><div id="label_product_ErrorId" align="left"></div></td></tr>
			<tr id ="distributer_Id" style="${bulkIssuanceData.distributershow}">
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="lab_Distributer_Type" />&nbsp;:&nbsp;&nbsp;</td>
				<td><form:select id="distributerId" path="distributerId"
						style="width:200px;"  onchange="emptyerror(event,'label_Distributer_ErrorId');getSubDistributer();hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="0" label="All" />
						<form:options items="${bulkIssuanceData.distributerMap}" />
					</form:select></td>
			</tr>
			<tr><td width="50%"></td><td width="50%"><div id="label_Distributer_ErrorId" align="left"></div></td></tr>
			<tr id ="subdistributerId" style="${bulkIssuanceData.subDistributershow}">
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="lab_SubDistributer_Type" />&nbsp;:&nbsp;&nbsp;</td>
				<td><form:select id="subDistributerId" path="subDistributerId"
						style="width:200px;" onchange="getAgent();hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="0" label="All" />
						<form:options items="${bulkIssuanceData.subDistributerMap}" />
					</form:select></td>
			</tr>
			<tr id ="agentIdForShow" style="${bulkIssuanceData.agentshow}">
				<td align="right"><font color=red>*&nbsp;</font>
				<spring:message code="lab_Agent_Type" />&nbsp;:&nbsp;&nbsp;</td>
				<td><form:select id="agentId" path="agentId"
						style="width:200px;" onchange="hideAgentDetails('bulk_issuance_details','showSubmit');">
						<form:option value="0" label="All" />
						<form:options items="${bulkIssuanceData.subAgentMap}" />
					</form:select></td>
			</tr>
			<tr>
				<td height='0'>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' align='center'><input type="button"	 onclick="agentsRetrieve();showAgents();" value="Get users" /></td>
			</tr>
			<tr><td colspan="2" align="center"><div id="duplicate_SE_ErrorId"></div></td></tr>
		</table>
		<table width='100%'  class='tableMain cell-border'  cellspacing='1' cellpadding='0' border='1' bordercolor='#000000' id="bulk_issuance_details">
		
		 </table>
		 <table>
		<tr id="showSubmit" ><td colspan="2" align="center"><input type="submit" onclick="agentValidates('bulkIssuance',event);" value="submit" /></td></tr>
		 </table>
		 </td>
			</tr>
		
		</table>
	</form:form>
</body>
</html>