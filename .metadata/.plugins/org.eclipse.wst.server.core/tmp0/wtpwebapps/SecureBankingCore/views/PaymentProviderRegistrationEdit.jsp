<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
<%@ page import="com.ng.sb.common.dataobject.PaymentProviderEditData" %>
<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>

<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/ServiceProviderRegistration.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>


<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
	
	
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":"400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
		  });
	  }
} );
</script>
	
<title>Service Provider List</title>
</head>

<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
	
<body class="PageType">

 <form:form id="paymentProviderform" name="paym0entProviderform" method="get" modelAttribute="sysServiceProviderListData" action="${pageContext.request.contextPath}/AdminUI/ProviderMgmt/paymentProviderRegistration" >
 
 
  <input type='submit' style="float:right;" id='btn1' value='Add Service Provider' class="btn btn-warning">
			 				<div class="row">&nbsp;</div>
			 
						 				<div class="row">&nbsp;</div>
						 				
				<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                     <%--  <h1 class="pull-left"><spring:message code="Service Provider Registration Edit" /></h1> --%>
	                      <div class="clearfix"></div>
	                      <hr> 
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
	                         
                <div id="SearchByName" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">
				                       
                      				</div>
	                		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
	                		
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr>
	                                  	<th><spring:message code="lab_provider_name"/></th>
										<th><spring:message code="lab_provider_description"/></th>
										<th><spring:message code="lab_provider_msisdn"/></th> 
										<th><spring:message code="lab_provider_categories"/></th>
																			  
										<th><spring:message code="lab_provider_action"/></th> 
	                                </tr>
	                              </thead>
	                              <tbody>
	                                <c:forEach items="${serviceProvidersEditList}" var="paymentProvider">
										<tr>
											<td>${paymentProvider.payProviderName}</td>
											<td>${paymentProvider.providerDescription}</td>
											<td>${paymentProvider.providerMsisdn}</td>
											<td valign="middle" align="center">
													
												<c:forEach var="categoryValue" items="${paymentProvider.provCategories}" varStatus="category">
													${categoryValue}<br>
								            	</c:forEach></td>
								            	<%
								            	
								            	Integer menuId=(Integer)request.getAttribute("menuId");
								            	Integer submenuId=(Integer)request.getAttribute("submenuId");
								            	
								            	
												Integer id=	((PaymentProviderEditData)(pageContext.findAttribute("paymentProvider"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "serviceId="+id +"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
								            
								            	
								            <td align="center"><a href="${pageContext.request.contextPath}/AdminUI/ProviderMgmt/updateProviderRegistration?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
								           
											<img align="middle" style="cursor: hand" src="/securebanking/images/edit.gif" title="Update"></a></td>
										</tr>
									</c:forEach>
	                                
	                              </tbody>
	                            </table>
	                          </div>
	                        </div>
                     	 </div>
                     	<input type="hidden" id="contextPath" name="contextPath"
							value="${pageContext.request.contextPath}" />
						<input type="hidden" id="contextPath" name="contextPath"
							value="${pageContext.request.contextPath}" />
					
					
						<c:set var="val"><spring:message code="user.list.table.contactPersonName"  />
						</c:set>
						<input id="paymentProviderform" type="hidden" value="${val}"/>
				</div>
				<input  type="hidden" value="${pages}" id="pages"  />
				
				
				<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	  </form:form>

</html>