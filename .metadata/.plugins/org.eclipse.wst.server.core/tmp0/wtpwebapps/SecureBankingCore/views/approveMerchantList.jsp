<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData"%>
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

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userMerchantCreation.js"></script> 


<script type="text/javascript">
$(document).ready(function() {
	 
		  $('#table_id').DataTable({
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
	  
		  
} );

</script>

</head>
<body >
 	
		
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Approve Merchant</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-danger">${errorMessage}</p> 
									</div> 
							 						 
	                    </div>
	                      <div class="col-xs-12">
	                   
						
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                              	   	<tr>
	                              	   		<th>Company Name</th>
											<th>Contact Person Name</th>
											<th>Mobile</th>
											<th>Status</th>
											<th>Created On</th>
											<th>Approve/Reject</th>
	                              	   	</tr>
	                              	</thead>
	                             
	                              	<c:forEach items="${merchantData.outletList}" var="user">
	                              	<tr>
	                              	   		<td>${user.merchantName}</td>
											<td>${user.contactPersonName}</td>
											<td>${user.mobilenumber}</td>
											<td>${user.status}</td>
											<td>${user.addedOn}</td>
											
										<td align="center" width="10%"><a href="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/approveMerchant?id=${user.id}&menuId=${menuId}&submenuId=${submenuId}">
										<img title="view" src='${pageContext.request.contextPath}/images/edit.gif'
											style='cursor: hand'/>
										</a></td> 	
	                              	   	</tr>
	                              	</c:forEach>
	                                     
				 
	                              </table>
	                             </div>
	                            </div>
	                           </div>

</body>
</html>