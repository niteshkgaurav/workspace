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
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css></script>
<title>Menu List</title>
<style type="text/css">

</style>

<script type="text/javascript">

$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":"400px",
			  "scrollX":"400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"  
			  
			  
			  
		  });
	  }
} );


// var tableOffset = $("#table-1").offset().top;
// var $header = $("#table-1 > thead").clone();
// var $fixedHeader = $("#header-fixed").append($header);

// $(window).bind("scroll", function() {
//     var offset = $(this).scrollTop();

//     if (offset >= tableOffset && $fixedHeader.is(":hidden")) {
//         $fixedHeader.show();
//     }
//     else if (offset < tableOffset) {
//         $fixedHeader.hide();
//     }
// });



</script>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>


<body class="PageType">
	<form:form id="menuListPage" method="post" modelAttribute="menuDetails" 
	action="${pageContext.request.contextPath}/AdminUI/roleController/saveAddMenuEdit" >
	
		<input type="hidden" id="accountadd" name="accountadd"/>
		<input type="hidden" id="accountdel" name="accountdel"/>
		
		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<h1 class="pull-left">Menu Role Mapping</h1>
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
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover" id="table_id">
	  						<thead class="default">
		  						<tr >
		  							<th></th>
	  								<c:forEach items="${AccountList}" var="account">
	  									<th align="center">${account.accountType }</th>
	  								</c:forEach>
<!-- 	  								<th align="center">Edit</th> -->
		  						
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach var="menuData" items="${menuList}"> 
	  							
	  							<tr>
	  								<td align="center">${menuData.menuName}</td>
  									<c:forEach items="${AccountList }" var="obj">
										<td>
											<c:set var="i" value="0"/>
											<c:forEach var="roleId" items="${menuData.roleIdList}">
												<c:if test="${roleId eq  obj.id && i == 0}">
													<input type="checkbox" id="${menuData.id}-${obj.id}" value="${menuData.id}-${obj.id}" checked="checked" onclick="addAccountIdForMenu(this);"/>
													<c:set var="i" value="1" />
												</c:if>
											</c:forEach>
											<c:forEach var="roleId" items="${menuData.roleIdList}">
												<c:if test="${roleId ne obj.id && i == 0}">
													<input type="checkbox" id="${menuData.id}-${obj.id}" value="${menuData.id}-${obj.id}" onclick="addAccountIdForMenu(this);"/>
													<c:set var="i" value="1" />
												</c:if>
											</c:forEach>
											
											
											<c:if test="${fn:length(menuData.roleIdList) le 0   && i==0}">
												<input type="checkbox" id="${menuData.id}-${obj.id}" value="${menuData.id}-${obj.id}"  onclick="addAccountIdForMenu(this);"/>
											</c:if>
										</td>
										
									</c:forEach>
	  							</tr>
	  						</c:forEach>
	  						</tbody>
	  					</table>
	  							
	  									
	  						
	  					
						</div>
					</div>
					</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="submit" class="btn btn-warning" value="Update" onclick="return convertArraytoString();"/>
			</div>
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		 
			
	</form:form>
</body>
</html>