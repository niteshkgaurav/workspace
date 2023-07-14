<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.CustomerCareData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/changePassword.js></script>
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
  <script type="text/javascript" src=${pageContext.request.contextPath}/js/queryResolutionTime.js></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Priority</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>

	<form:form id="queryPriorityId" method="get" modelAttribute="customerCaredata"
		action="${pageContext.request.contextPath}/securebanking/AdminUI/customercare/Priority" >
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<section class="white">
						
          			<div class="row" id ="heading" > 
	               		 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="Query Resolution Time"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    </div>
	                </div> 
	                <div class="row">
	                	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-md-offset-4">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="abc" class="table table-bordered table-striped">
	                              <thead>
	                                <tr>
	                                  	<th><spring:message code="Priority" /></th>
	                                  	<th>Resolution Time(Hours)</th>
										 <th>Action</th>
	                                </tr>
	                              </thead>
	                              <tbody>
										 <c:forEach items="${customercaredata.reslist}"
															var="queryPriority">
	                            
										
											<tr><td>${queryPriority.priority}</td>
											<td> <input id="editID" type="text"  value="${queryPriority.resolutionTime}" readonly="readonly"></td>
											<%
												Integer id=	((CustomerCareData)(pageContext.findAttribute("queryPriority"))).getId();
											Integer menuId=(Integer)request.getAttribute("menuId");
                               				Integer submenuId=(Integer)request.getAttribute("submenuId");
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "userTypeId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td><a
								href="${pageContext.request.contextPath}/AdminUI/customercare/editQueryResolutionTime?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
									title="edit"
									src='${pageContext.request.contextPath}/images/edit.gif'
									style='cursor: hand' onclick="editData('editID');" /> </a></td>
											 </tr>
											
										  </c:forEach>	
	                                
	                              </tbody>
	                            </table>
	                          </div>
	                        </div>
						
                     	 </div>
                      
	                </div >
	                
	                	

          			
					</section>
				</div>
			</div>
		</div>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>