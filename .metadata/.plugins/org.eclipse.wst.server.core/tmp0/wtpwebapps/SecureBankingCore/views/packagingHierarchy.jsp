<%@page import="com.ng.sb.common.model.PayCardApps"%>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@page import="com.ng.sb.common.dataobject.SubscriberData"%>
	<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
		<%@ page import="com.ng.sb.common.dataobject.CardData" %>
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

<!-- <script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/kycController/approveKYC');
</script> -->


		<form:form 	id="approveKYC" method="post" modelAttribute="userAccountData"
			action=""		enctype="multipart/form-data">
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Packaging Hierarchy</h1>
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
	                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                               <tr>
	                                <th>Small Pack Size</th>
	                                <th>Small</th>
	                                 <th>Medium Pack Size</th>
	                               <th>Medium</th>
	                                <th>Large Pack Size</th>
     								<th>Large</th>
     								 <th>Extra Large Pack Size</th>
									<th>Extra Large</th>
									<th>XXL Pack Size</th>
									<th>XXL</th>
						<!-- <th>XXXL Pack Size</th>
									<th>XXSXL</th> -->
					
						
	          
	  </tr>                             
	                             
	                              	</thead>
	                              <c:forEach items="${list}" var="list1">
	                              <c:if test="${not empty list1}">
								 <tr >
								 
								 
								  <td>${list1.smallPackSize}</td>
								 <td>${list1.small}</td>
								 <td>${list1.mediumPackSize}</td>
								 <td>${list1.medium}</td>
								 <td>${list1.largePackSize}</td>
								<td>${list1.large}</td>
								<td>${list1.extraLargePackSize}</td>
								<td>${list1.extraLarge}</td>
								<td>${list1.xxlPackSize}</td>
								<td>${list1.xxl}</td>
								<%-- <td>${list1.xxxl}</td>
								<td>${list1.xxxl}</td> --%>
								 
								
								</c:if >
									
									
						
					</c:forEach> 
          
				 
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