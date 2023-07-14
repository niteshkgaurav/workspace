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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fileExport.js"></script>
</head>
<body>
	<div>
		<form:form method="post" modelAttribute="fileExportData"
			id="fileExportForm"
			 action="${pageContext.request.contextPath}/AdminUI/fileExport/fileExportSubmit" 
			
			enctype="multipart/form-data">

			<table width='75%' border='0' align='center'
				class='thickBorder' cellspacing='1' cellpadding='0'
				>
				
				<tr>
					<td colspan="2"><div align="center" class="mainTableHeader">
							<spring:message code="lab_File_export_Title" />
						</div></td>
				</tr>
				<tr>
					<td colspan='2' align="center">
						<h3 id="msgId" align="center" style="color: green;">${successMessage}</h3>
						<h3 id="errorId" align="center" style="color: red;">${errorMessage}</h3>
					</td>
				</tr>
<tr><td height="25px"></td></tr>
				<tr>
					<td width='25%' class='tableLabel' align='right'><spring:message
							code="lab_Pin_Template" />&nbsp;:&nbsp;&nbsp;</td>
					<td width='25%' align='left'><form:select id="pinId" name="templateId"
							path="pinId" style="width: 150px" onchange="getDescription('pinId','descriptionId'),hideDetails('tempDetails')" onclick="emptyerror(event,'pinErrorId');">
							<form:option value="0" label="<-----Select----->" />
							<form:options items="${fileExportData.pinTemplate}" />
						</form:select></td>
				</tr>
				<tr>
					<td colspan='2'><div id='pinErrorId' align='center'></div></td>
				</tr>
				<tr><td height="10px"></td></tr>
				<tr>
					<td width='25%' class='tableLabel' align='right'><spring:message
							code="lab_Pin_Desc" />&nbsp;:&nbsp;&nbsp;</td>
					<td width='25%' align='left'><form:textarea id="descriptionId"
							path="description" name="description" 
							onkeypress="blockSpecialChar(event,'descErrorId');"
							placeholder="description" maxlength='100' /></td>
				</tr>
				<tr>
					<td colspan='2'><div id='descErrorId' align='center'></div></td>
				</tr>
				<tr>
					<td height='10px'>&nbsp;</td>
				</tr>
				<tr id="submitId"><td></td>
					<td colspan='2' align='left'><input type="button"
						value="Get Details"
						onclick="return validateFileExport('fileExportForm',event);" /></td>
				</tr>
				
				<tr id="waitId">
					<td colspan='2' align='center'><input type="button"
						value="Please wait..." /></td>
				</tr>
				
				<tr>
					<td height='10'>&nbsp;</td>
				</tr>
				<tr id='tempDetails'>
					<td colspan="2"  align="center">
						<table width='50%'  class='tableMain cell-border' cellspacing='1' cellpadding='0' border='1' id="template_details">
				 		</table>
						<table>
				 			<tr>
								<td height='5'>&nbsp;</td>
							</tr>
							<tr id="showSubmit" ><td colspan="3" >
						 		<a id="showLink" style="color: #00f;" >Download Denomination Details</a> 
								</td>
							</tr>
						</table>
		 			</td>
				</tr>		
		</table>
			<tr>
			<td>
			<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}"/>
			</td>	
			</tr>
			
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>
</body>
</html>