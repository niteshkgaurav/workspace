<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
			<%@ page import="com.ng.sb.common.dataobject.AccountList" %>
				<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>

 <script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
 
 
<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" 
	src=https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
	
<script>
	$(document).ready(function() {
    $('#table_id2').DataTable({
    	"scrollY":"500px",
        
        "scrollCollapse": true,
        "paging":         true,
        "pagingType": "simple_numbers"
    	
    	
    }	
    );
} ); 
	</script>
	
<title>Vendors List</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">


<form:form id="vendorlist" method="post"
		modelAttribute="accountTypeData"
		action="${pageContext.request.contextPath}/AdminUI/account/vendorlistCreate">
		
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Vendors List</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
						</hr>
	                      </div>
	                      
	                       <div id="successMessageId"
								class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
								<p><span style="color:green">${sucessmsg}</span> </p>
						  </div>
	                      
	                      <div  id="showButton1" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 	<p align="right">
  										<input type="submit" value="Create" class="btn btn-warning"/>
								</p>
	                      	</div>
	                     
	                      	
	                         <div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id2">
	  						<thead class="default">
		  						<tr >
		  							<th align="center"><spring:message code="LABEL_COMPANY_NAME" /></th>
		  							<th align="center"><spring:message code="lab_Email_Id" /></th>
		  							<th align="center"><spring:message code="lab_Phone_no" /></th>
		  							<th align="center"><spring:message code="LABEL_ACTIVE_DEACTIVE" /></th>
		  							<th align="center"><spring:message code="LABEL_EDIT" /></th>
		  							
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach items="${accountCreationData.vendorlist}"
										var="acList">
										<tr>
											<td>${acList.companyName}</td>
											
											<td>${acList.emailId}</td>
											<td>${acList.mobileNo}</td>
											<%
												Integer menuId=(Integer)request.getAttribute("menuId");
												Integer submenuId=(Integer)request.getAttribute("submenuId");
												String id=	((AccountList)(pageContext.findAttribute("acList"))).getAccountCode();
												String accountStatus=((AccountList)(pageContext.findAttribute("acList"))).getAccountStatus();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "accountId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String encryptedParams=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&accountstatus="+accountStatus+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td><a href="${pageContext.request.contextPath}/AdminUI/account/activate?enc=<%=encryptedParams %>">${acList.accountStatus}</a></td>
											<td align="center">
											<a href="${pageContext.request.contextPath}/AdminUI/account/editnew?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
											<img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor: hand'></a></td>
											
										</tr>
									</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
	
 <input type="hidden" value="${pageContext.request.contextPath}" name="link"/>
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId"/>
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId"/>	

</form:form>


</body>
</html>