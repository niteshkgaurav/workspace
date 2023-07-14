<%@page import="com.ng.sb.common.dataobject.MerchantData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.MerchantData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Merchant.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
			  
		  });
	  }
	 
} );
</script>
  <%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
  Integer menuId=(Integer)request.getAttribute("menuId");
  Integer submenuId=(Integer)request.getAttribute("submenuId");
  String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
 %>
</head>
<body class="PageType">
	<form:form  modelAttribute="merchantData" method="post" >
		<table id="mainTable" width='100%' border='0' cellspacing='1' cellpadding='0'>
		<tr><td colspan="2" height="25"></td></tr>
		<tr>
				<td colspan="2">
					<table width='100%' border='0'>
					<tr>
						<td  align="center" class="mainTableHeader" width='50%'>&nbsp;&nbsp;&nbsp;&nbsp;<font size="4px"> <a
								href="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/getMerchantRegistration?enc=<%=encryptId%>"><spring:message code="lab_merchantCreation"/>
							</a></font></td> 
						<td  align="center" class="mainTableHeader" width='50%'>&nbsp;&nbsp;&nbsp;&nbsp;<font
							size="4px" > <a href="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/merchantListing?enc=<%=encryptId%>"><spring:message code="lab_merchantCreationList" /></a></font></td>
					</tr>
               </table>
               <hr>
				</td>
				
			</tr>
			
			<tr>
				<td align="center" colspan="2">
				<h5 id="msgId" align="center" style="color:green;">${successMessage}</h5>
				<h5 id="ermsgId" align="center" style="color:red;">${errorMessage}</h5>
				</td>
			</tr>
			</table>
		
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped" >
	                            	
	                               <thead>
	                              	   	<tr>
	                              	   		<th><spring:message code="lab_merchantCompanyName" /></th>
	                              	   		<th><spring:message code="lab_contactPersonName" /></th>
											<th><spring:message code="lab_type" /></th>
											<th>No. of Tills</th>
											<th><spring:message code="lab_underType" /></th>
											<th>Added Under</th>
											<th><spring:message code="lab_action" /></th>
											
	                              	   	</tr>
	                              	</thead>
                                         <c:forEach items="${merchantData}" var="merchData">
                                            <tr id="rowId_${cardList.cardId}">
								<td>${merchData.merchantCompanyName}</td>
								<td>${merchData.contactPersonName}</td>
								<td>${merchData.type}</td>
                                    <td>${merchData.noOfTill}</td>
								<td>${merchData.underType}</td>
                                        <td>${merchData.underName}</td>
                                 
                                        <%
												Integer id=	((MerchantData)(pageContext.findAttribute("merchData"))).getId();
                                                Integer user=((MerchantData)(pageContext.findAttribute("merchData"))).getUserId();
												String encryptedData=KeyEncryptionUtils.encryptUsingKey(key, "merchantId="+id+"&userId="+user+"&menuId="+menuId+"&submenuId="+submenuId);
												%>
								<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/getMerchantRegistrationEdit?enc=<%=encryptedData %>"><img
								title="edit"
								src='${pageContext.request.contextPath}/images/edit.gif'
								style='cursor: hand' align="center" /></a></td>
	  					</tr>
	  					</c:forEach>
	  					</table>
	  					</div>
	  					</div>
	  					</div>
	  				
	  			 <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	      <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">		
	</form:form>
	
</body>
</html>