<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.PackingGroupData" %>
<%@ page import="java.util.UUID" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Partner.js"></script>



<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<title>Partners List</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body>
	<form:form id="partnerListPage" method="post" modelAttribute="partnerDataList">
	<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<h1 class="pull-left"><spring:message code="label_group_list" /></h1>
	       		<div class="clearfix"></div>
	       		<hr>
			</div>
			<%
Integer menuId=(Integer)request.getAttribute("menuId");
Integer submenuId=(Integer)request.getAttribute("submenuId");
String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
%>
	             <div class="row">

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px"> <a
						href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupCreation?enc=<%=encryptId%>"><spring:message
								code="lab_Group_version" /> </a></font>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px" color="white"> <a
						href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupCreationList?enc=<%=encryptId%>"><spring:message
								code="label_group_list" /></a></font>
				</div>
			</div>
		</div>
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="errorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
							
	                    </div>
			
		<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr style=color:#e3a122>
		  							<th align="center"><spring:message code="lab_GroupName"/></th>
		  							<th align="center"><spring:message code="lab_parentgroupname"/></th>
		  							<th align="center"><spring:message code="lab_count"/></th>
		  							<th align="center"><spring:message code="lab_totalCount"/></th>
		  							<th align="center"><spring:message code="lab_status"/></th>
		  							<th align="center"><spring:message code="lab_edit"/></th>
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach var="partnerlistVar" items="${groupDataList}"> 
	  							<tr>
	  								<td align="center">${partnerlistVar.groupName}</td>
	  								<td align="center">${partnerlistVar.parentName}</td>
	  								<td align="center">${partnerlistVar.quantity}</td>
	  								<td align="center">${partnerlistVar.totalquantity}</td>
	  								<td align="center">${partnerlistVar.status}</td>
	  								<%
												Integer id=	((PackingGroupData)(pageContext.findAttribute("partnerlistVar"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "groupId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
	  								
	  								<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor:hand' /></a></td>
	  							</tr>
	  						</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
			
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
			
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
			
	</form:form>
</body>
</html>