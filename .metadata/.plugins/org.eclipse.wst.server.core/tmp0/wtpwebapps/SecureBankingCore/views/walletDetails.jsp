<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script> 
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
</head>


		<form:form 	id="appList" method="post" modelAttribute="walletDetails"
			action="${pageContext.request.contextPath}/AdminUI/appManagement/showWalletDetails"
			enctype="multipart/form-data">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Wallet Management</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    </div>
	                    
		<div class="row">
          		          		  
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive" style="height: 500px; overflow: auto;">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                              	   		<th>Account Type</th>
											<th>Current Balance</th>
											<th>Last Updated On</th>
											<th>Status</th>
	                              	</thead>
	                              <c:forEach items="${walletData.walletDetails}" var="walletData">
    							<tr>
    							 <td>${walletData.accountType}</td>
									<td>${walletData.balance}</td>
									<td>${walletData.modefiedDate}</td>
									<td>${walletData.status}</td>
									</tr>
    			  
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