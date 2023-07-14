<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/SystemSettingCommon.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Product_Management.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/IDCreation.js"></script>

<title>KYC Level</title>
<script>
	
</script>
</head>
<body>

	<form:form id="kyclevelForm" name="kyclevelForm" method="get"
		modelAttribute="kycLevelData"
		action="${pageContext.request.contextPath}/AdminUI/kycController/KYCLevel"
		enctype="multipart/form-data">
			 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
		                      <h1 class="pull-left"><spring:message code="Kyc_level"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
	                    </div>
	                    <div class="row">
	                    	<div class="col-xs-12">
			                   <div class="transaction-table">
			                      <div class="table-responsive">
			                          <table id='OrderRecieved_table' class="table table-bordered table-striped">	
				                          	<tr>
				                          		<th align="center"><b><spring:message
														code="kyc_name" /></b></th>
												<th align="center"><b><spring:message
														code="kyc_weightage" /></b></th>
				                          	</tr>
			                          		<tr >
														<c:forEach items="${kycLevelData.idlevellist}"
															var="kyclevels">

															<tr>
																<td align="center">${kyclevels.name}</td>

																<td align="center">${kyclevels.weight}</td>

															</tr>
														</c:forEach>
														
											</tr>
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