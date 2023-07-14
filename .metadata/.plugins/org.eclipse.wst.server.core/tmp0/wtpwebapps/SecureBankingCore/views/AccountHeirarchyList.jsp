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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<title>Account List</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>


<form:form id="hostlist" method="post"
		modelAttribute="accountTypeData"
		action="">
		
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="LABEL_ACCOUNT_LIST" /></h1>
	                      <div class="clearfix"></div>
	                      <hr> </hr>
	                      <div id="successMessage"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${successMessage}</font></p> 
									</div> 
	                      </div>
	                      
	                         <div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr >
		  							<th><spring:message code="LABEL_COMPANY_NAME" /></th>
									<th> <spring:message code="LABEL_ACCOUNT_TYPE" /></th>
									<th><spring:message code="LABEL_ADDRESS" /></th>
									<th id="LABEL_PHONE_No_id"><spring:message code="lab_Phone_no" /></th>
									<th id="LABEL_EMAIL_id"><spring:message code="lab_Email_Id" /></th>
									<th id="LABEL_HOST_id"><spring:message code="LABEL_HOST" /></th>
									<th id="LABEL_DIST_id"><spring:message code="LABEL_DIST" /></th>
									<th id="LABEL_SUB_DIST_id"><spring:message code="LABEL_SUB_DIST" /></th>
									<th id="LABEL_RETAILER_id"><spring:message code="LABEL_RETAILER" /></th>
									<th><spring:message code="LABEL_EDIT" /></th>
		  							
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach items="${accountCreationData.accountList}" 
	  									var="acList">
										<tr>
											<td>${acList.companyName}</td>
											<td>${acList.accountType}</td>
											<td id=addressId ><textarea onkeyup="textAreaAdjust(this)" style="width:auto; resize:none" readonly>${acList.address}</textarea></td>
											<td id="MobileNo_id">${acList.mobileNo}</td>
											<td id="Email_id">${acList.emailId}</td>
											<td id="Hostname_id">${acList.hostName}</td>
											<td id="distributer_name_id">${acList.distributorName}</td>
											<td id="sub_distributer_name_id">${acList.subDistributorName}</td>
											<td id="retailer_name_id">${acList.retailerName}</td>
											<%
											Integer menuId=(Integer)request.getAttribute("menuId");
											Integer submenuId=(Integer)request.getAttribute("submenuId");
												Integer id=	((AccountList)(pageContext.findAttribute("acList"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/account/edit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
											<img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor: hand'></a></td>
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