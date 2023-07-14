<%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<script type="text/javascript" src=${pageContext.request.contextPath}/json/json.js></script>
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
</head>
<body>

<form:form id="seEntriesUpload" method="post" modelAttribute="SEEntriesUploadData" action="${pageContext.request.contextPath}/AdminUI/inventory/uploadFileEntries" enctype="multipart/form-data">

<table width="80%" align="center">
			<tr>
				<td></td>
				<td align="center"><font size="4"><spring:message code="SE_ENTRIES_UPLOAD"/></font></td>
				<td></td>
			</tr>
</table>

<table width="80%" align="center" border="1">
			<tr>
				<td>

<table width="80%" align="center">

<tr>
	<td width="10%" height="30%">&nbsp;</td>
	<td width="40%">&nbsp;</td>
	<td width="1%">&nbsp;</td>
	<td width="39%">&nbsp;</td>
	<td width="10%">&nbsp;</td>
</tr>
<tr>
	<td width="10%" height="30%">&nbsp;</td>
	<td width="40%">&nbsp;</td>
	<td width="1%">&nbsp;</td>
	<td width="39%">&nbsp;</td>
	<td width="10%">&nbsp;</td>
</tr>
<tr>
	<td width="10%">&nbsp;</td>
	<td width="40%" align="right"><spring:message code="LAB_FILEUPLOAD"/></td>
	<td width="1%">&nbsp;</td>
	<td width="39%"><input type="file" name="uploadedSEFile" id="uploadedSEFile"/></td>
	<td width="10%">&nbsp;</td>
</tr>
<tr>
	<td width="10%">&nbsp;</td>
	<td width="40%">&nbsp;</td>
	<td width="1%">&nbsp;</td>
	<td width="39%">&nbsp;</td>
	<td width="10%">&nbsp;<input type="submit" value="UPLOAD FILE" /></td>
</tr>


<tr><td></td></tr>
<tr>
	<td width="10%">&nbsp;</td>
	<td width="40%">${statusMessage}</td>
	<td width="1%">&nbsp;</td>
	<td width="39%">&nbsp;</td>
	<td width="10%">&nbsp;</td>
</tr>

		<form:errors path="*" cssClass="errorblock" element="div" />
		<span><form:errors path="uploadedSEFile" cssClass="error" />
		</span>


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