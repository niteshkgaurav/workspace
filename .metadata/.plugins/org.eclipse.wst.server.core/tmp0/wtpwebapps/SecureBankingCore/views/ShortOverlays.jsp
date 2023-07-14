<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
 <script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/shortOverlays.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
	    $('#OrderRecieved_table').DataTable( {
	        "processing": true,
	      //  "serverSide": true,
	       // "ajax": "scripts/server_processing.php",
	      //  "deferLoading": 57
	    } );
	} );
	</script>
	
	
<title>Short Overlays</title>
</head>
<body>
	<form:form id="shortOverlays" method="post"
		modelAttribute="shortOverlaysData"
		action="">
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_ShortOverlaysTitle" /></h1>
	                      <div class="clearfix"></div>
	                     	<hr></hr>
	                     	 
	                    </div>
	             <div class="row">
          					<div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table id="OrderRecieved_table" class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                 	<th align="center"><b><spring:message code="lab_product" /></b></th>
									<th align="center"><b><spring:message code="lab_MasterVersion" /></b></th>
									<th align="center"><b><spring:message code="lab_ExternalNumber" /></b></th>
                                </tr>
                              </thead>
                              <tbody>
                                
                                  <c:forEach items="${shortOverlaysData.shortOverlaysDataList}"
										var="acList">
										<tr>
										<%-- <td id="rowId_${acList.id}"></td> --%>
										<td align="center">${acList.product}</td>
										<td align="center">${acList.masterVersion}</td>
										<td align="center">${acList.externalNumber}</td>
									</tr>
								</c:forEach>
                                
                                </tbody>
                                </table>
                                </div>
                                </div>
                                </div>
                                
                                 <div  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 	
	                     	 	<input type="button" class="btn btn-warning" value="back"
									onclick="goBack()" />
						
	                      	</div>
                  </div>
                  
                  <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
                  
		
	</form:form>