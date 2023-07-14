<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/OrderRecieved.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
	
	
	<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":        "400px",
			  "scrollX":        "200px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
			  
			  
		  });
	  }
} );
</script>
		
</head>


<body class="PageType">
	<form:form id="ShippingHistoryView" method="post"
		modelAttribute="packagingData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingHistoryView">

		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_PackagingList"/></h1>
	                     
							
	                   </div>
	     <!-- ****************************************** Form Heading  ******************************* -->
	          </div>
	          <div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr style=color:#e3a122>
		  							<th align="center"><spring:message code="lab_packagingNamePackage"/></th>
		  							<th align="center"><spring:message code="lab_parentPackagePackage"/></th>
		  							<th align="center"><spring:message code="lab_productPackage"/></th>
		  							<th align="center"><spring:message code="lab_overPackage"/></th>
		  							<th align="center"><spring:message code="lab_MasterversionPackage"/></th>
		  							<th align="center"><spring:message code="lab_CardNamePackage"/></th>
		  							<th align="center"><spring:message code="lab_productfromPackage"/></th>
		  							<th align="center"><spring:message code="lab_productToPackage"/></th>
		  							<th align="center"><spring:message code="lab_totalQuantityPackage"/></th>
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach items="${packagingList}"
										var="acList">
										<tr>
											<td>${acList.packagingName}</td>
											<td>${acList.packagingParentName}</td>
											<td>${acList.product}</td>
											<td>${acList.overLay}</td>
											<td>${acList.masterVersion}</td>
											<td>${acList.cardType}</td>
											<td>${acList.productFrom}</td>
											<td>${acList.productTo}</td>
											<td>${acList.quantity}</td>
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