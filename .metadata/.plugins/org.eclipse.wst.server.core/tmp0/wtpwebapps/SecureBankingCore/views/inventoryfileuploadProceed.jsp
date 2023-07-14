<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
  <%@ page import="com.ng.sb.common.dataobject.LoginData" %>
  <%@ page import="com.ng.sb.common.dataobject.MenuDetails" %>
  <%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script src=${pageContext.request.contextPath}/js/jquery-1.10.2.min.js></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/jquery.js></script>
	
	<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/InventoryPoRaise.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/viewOrder.js></script>
	<script type="text/javascript">
	
	
	</script>
<title>Proceed 
</title>

<style type="text/css">
li {
	color: black;
}
</style>
</head>
<%-- <form:form id="proceed-file" method="post" modelAttribute="proceedFile"
	action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/proceed-file"> --%>
	<form:form id="proceed-file" method="post" 
	action="${pageContext.request.contextPath}/AdminUI/UploadExcelFileInventoryController/proceed-file">
	<input type="hidden" name="id" value="${historyData.id}">
	<input type="hidden" name="poNo" value="${poNo}">	
	<input type="hidden" name="productType" value="${productType}">
	<input type="hidden" name="menuId" value="${menuId}">
	<input type="hidden" name="submenuId" value="${submenuId}">
	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			<spring:message code="Proceed" />
		</h1>
		<div class="clearfix"></div>
		<hr>
<div id="msgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
			
				
				<p>
				<c:forEach var="errorMsg" items="${errorMessageList}">
					<font color="red">${errorMsg}</font>
				</c:forEach>
				</p>
		</div>
	</div>





	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		</div>
		<div id="productTypeDiv">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			</div>
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="no_onbehalf1">
			<div class="styled-input" id="onBehlf">
				
				<label id="label_onbehalf_Account"><spring:message
						code="label_onbehalf_account" /></label> <label id="onbehalfTypeErrorId"
					class="collapse"></label>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="no_onbehalf">
			<div class="styled-input" id="search">
				<div id="suggestion-box"></div>
				<label id="label_no_onbehalf"><spring:message
						code="label_Contact_Name" /></label> <label id="onbehalfErrorId"
					class="collapse"></label>
			</div>
		</div>
	</div>
		<div id="readerDiv" class="row collapse">
		
	</div>
	<%
	 LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
	  String key = loginData.getKey();

	  Integer menuId=	(Integer)pageContext.findAttribute("menuId");
	  Integer submenuId=(Integer)	pageContext.findAttribute("submenuId");
		 
			String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "menuId="+menuId+"&submenuId="+submenuId);
        	
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>




	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 mt text-center">
	
<!--	<a href="cancel-uploaded-file?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><input type="button" value="Cancel  " id="cancelButton" onclick="cancel()" class="btn btn-warning cancelButton" /></a>  -->
		<a href="cancel-uploaded-file?enc=<%=encryptedId %>"><input type="button" value="Cancel  " id="cancelButton"  class="btn btn-warning cancelButton" /></a>
		<!-- <input type="submit" id="submitPoDetails" onclick="return validatePoRaise();" value="Submit" class="btn btn-warning"	/> -->
	</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 mt text-center">
		<input type="submit" value="Proceed" class="btn btn-warning" />
		<!-- <input type="submit" id="submitPoDetails" onclick="return validatePoRaise();" value="Submit" class="btn btn-warning"	/> -->
	</div>


</form:form>
</body>


</html>