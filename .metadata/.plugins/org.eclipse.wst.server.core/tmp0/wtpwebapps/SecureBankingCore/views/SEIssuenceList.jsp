<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>


<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>


<script>
$(document).ready(function(){
	$('#table_id').DataTable({
		"scrollY":"450px",
		"scrollX":"250px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<title>SE Issuence List</title>
</head>
<body  class="PageType">

<form:form id="seissuancelist" method="post"
		modelAttribute="kycUpgradedata"
		action="">
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">SE IssuenceList</h1>
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
						<table class="table table-striped table-bordered table-hover" id="table_id">
                           <thead class="default">
	                                <tr>
	                                	<th><spring:message code="label_custId" /></th>
	                                  	<th><spring:message code="lab_Name" /></th>
										<th><spring:message code="lab_custMobilenumber" /></th>
										<th><spring:message code="lab_Cust_Status" /></th>
										<th><spring:message code="label_masterVersion" /></th>
										<th><spring:message code="label_hostSubVersion" /></th>
										<th><spring:message code="label_activationDate" /></th>
										<th><spring:message code="label_prodStatus" /></th>
										<th><spring:message code="label_externalNumber" /></th>
										
	                                </tr>
	                              </thead>
	                              <tbody>
	                               
	                                
	                               <c:forEach   items="${kycUpgradedata.lists}"   var="iteratelist" >                                
										<tr>
										
										 	<td>${iteratelist.custId}</td>
											<td>${iteratelist.name}</td>
											<td>${iteratelist.msisdn}</td>
											<td>${iteratelist.status}</td>
											<td>${iteratelist.masterVersion}</td>
											<td>${iteratelist.hostSubVersion}</td>
											<td>${iteratelist.editDate}</td>
											<td>${iteratelist.productStatus}</td>
											<td>${iteratelist.externalnumber}</td>
											
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
					
					
	             
	             </div> 
		 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
	


</body>
</html>