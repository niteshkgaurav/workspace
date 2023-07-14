<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
<%@ page import="com.ng.sb.common.dataobject.MenuDetails" %>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>


<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<title>Menu List</title>
<script type="text/javascript">

$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );

</script>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>


<body class="PageType">
	<form:form id="menuListPage" method="post" modelAttribute="menuDetails">
	<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<h1 class="pull-left">MenuList</h1>
	       		<div class="clearfix"></div>
	       		<hr>
			</div>
			 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                     
	                      <c:if test="${successMessage!=''}">
									<div id="msgId"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
                                            <p class="text-success">${successMessage}</p> 
									</div> 
								</c:if>
								<c:if test="${errorMessage!=''}">
			          				 <div id="errorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
			                                            <p class="text-danger" >${errorMessage}</p> 
									</div>
									</c:if>
	                    </div>
			
		<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive" style="height: 500px; overflow: auto; width: auto;">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr >
		  							<th align="center">Menu Name</th>
		  							<th align="center">Role</th>
		  							<th align="center"><spring:message code="lab_edit"/></th>
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<tr>
	  							<td></td>
	  							<c:forEach items="${AccountList}" var="account">
	  									<td>${account.accountType }
	  								</c:forEach>
	  								<td>Edit</td>
	  						</tr>
	  						<c:forEach var="menuData" items="${menuList}"> 
	  							<tr>
	  								<td align="center">${menuData.menuName}</td>
  									<c:forEach items="${AccountList }" var="obj">
										<td>
											<c:set var="i" value="0"/>
											<c:forEach var="roleId" items="${menuData.roleIdList}">
												
												<c:if test="${roleId eq  obj.id  && i == 0}">
													<input type="checkbox" value="${roleId}" checked="checked"/>
													<c:set var="i" value="1" />
												</c:if>
												<c:if test="${roleId ne obj.id  && i == 0}">
													<input type="checkbox" value="${roleId}"/>
													<c:set var="i" value="1" />
												</c:if>
											</c:forEach>
											<c:if test="${fn:length(menuData.roleIdList) le 0}">
												<input type="checkbox" value="${roleId}"/>
											</c:if>
										</td>
										
									</c:forEach>
<!-- 	  							</tr> -->
	  								
	  									<%
												Integer id=	((MenuDetails)(pageContext.findAttribute("menuData"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
										%>
				               	
	  								
	  								<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/roleController/getMenuPageForEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor:hand' /></a></td>
	  							</tr>
	  						</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
	</form:form>
</body>
</html>