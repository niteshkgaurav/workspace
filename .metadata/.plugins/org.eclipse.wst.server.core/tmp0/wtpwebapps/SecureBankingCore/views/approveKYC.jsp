<%@page import="com.ng.sb.common.model.PayCardApps"%>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@page import="com.ng.sb.common.dataobject.SubscriberData"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.CardData" %>
<%-- <%@ page import="com.ng.sb.common.dataobject.BaseObjectData" %> --%>
<%@ page import="java.util.UUID" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/kycApprove.js"></script> 
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script> 
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
	  }
	  	  
} );
</script>
<style type="text/css">
  li { 	 	
    color: black;
  }
</style>

</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
  String groupCode=loginData.getGroupCode();
 %>
<body class="PageType">
	<script>
$(function () {

	 var currentDate=new Date(); 
	 currentDate.setDate(currentDate.getDate() - 1);
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			minDate : currentDate,
            useCurrent: false,

      });
		
	});
</script>
<script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/kycController/approveKYC');
</script>


		<form:form 	id="approveKYC" modelAttribute="subscriberData"	action="${pageContext.request.contextPath}/AdminUI/kycController/approveKYCData"
			enctype="multipart/form-data">
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">KYC Approval</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
						 
	                    </div>
							  
		              <br>     
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                               		<tr>
<!-- 	                               			<th>Subscriber Id</th> -->
	                               			<th>Subscriber Name</th>
	                               			<th>Email Id</th>
					     					<th>Mobile No.</th>
											<th>Added On</th>
											<th>Total Pending Docs</th>
											<th>Action</th>
	                               		</tr>
	                               	</thead>
									<tbody>
										<c:forEach items="${subscriberData}" var="subData">
											<%-- <c:forEach items="${list1.accountTypeList}" var="userlist">
												<c:forEach items="${userlist.subscriberList}" var="subList">
													<c:if test="${not empty subList}"> --%>
											<tr>
<%-- 												<td>${subData.id}</td> --%>
												<td>${subData.name}</td>
												<td>${subData.email}</td>
												<td>${subData.mobilenumber}</td>
												<td>${subData.addDate}</td>
												<td>${subData.pendingDocs}</td>
												<%
													Integer menuId=(Integer)request.getAttribute("menuId");
													Integer submenuId=(Integer)request.getAttribute("submenuId");
													Integer subsId=	((SubscriberData)(pageContext.findAttribute("subData"))).getId();
													String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "subsId="+subsId+"&menuId="+menuId+"&submenuId="+submenuId);
													String param=UUID.randomUUID().toString();
													String param1=UUID.randomUUID().toString();
												%>
<%-- 											<td><input type="submit" name="approveRejectSubmit" value="${subList.mobilenumber}" />dfdf</td> --%>
						                		<td align="center" width="10%"><a href="${pageContext.request.contextPath}/AdminUI/kycController/approveKYCData?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>&subsId=<%=subsId %>">
													Approve/Reject</a></td> 	
<%-- 															<td><input type="button" onclick="subscriberDetail(${subscriberList.id})" value="Approve/Reject" id="${subscriberList.id}" /></td></tr> --%>
														 
														</tr>
													<%-- </c:if>
												</c:forEach>
										</c:forEach> --%>
									</c:forEach>
								</tbody>
							</table>
                           </div>
                          </div>
                         </div>
	                            	  
                   	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
		           	<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		           	<input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	           
				</form:form>
	</body>
</html>