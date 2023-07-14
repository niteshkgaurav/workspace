<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<title>BulkIssuence Registration</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Merchant.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/uploadExcelFile.js"></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />





 <script type="text/javascript">
	 $(window).load(function(){
	 	$(document).ready(function(){
	 		$(uploadRoute).validate({
	 			rules:{
	 				"xlsFile":{
	 					required:true
	 				}
	 				
	 			},
	 			message:{
	 				"xlsFile":{
	 				 	required:"Please select a file to proceed"
	 				}
	 			},
				submitHandler: function (form) {
		             form.submit(); 
		        } 			
	 		});
	 	});
	});	
 </script>



</head>
<body>



 <div class="heading-inner">
 <h1> Bulk Issuance Registration</h1>
 <div class="clearfix"></div>
 
 
  </div>
  <div >
    &nbsp;
&nbsp;
&nbsp;
  </div>
	<form:form action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/getBulkIssuance" modelAttribute="merchantData" 	method="post"  enctype="multipart/form-data">
	
		<script >
		function remove(){
			$("#label_uploadFilePath").show();
			$("#label_uploadFilePatherror").html('');
		}
		
		
		
		</script>
		<div>
		
		
		&nbsp;
		&nbsp;
		</div>
		
		 
	                      <div class="styled-input" align="center" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"  >&nbsp;
	                       <label id="label_uploadFilePath" class='valid' >Upload File</label>
	                      <label id="label_uploadFilePatherror" class='valid' ></label></div>	
			                     			
	                      
	   <div class="row" id="tabb"  >

	<div id ="divId">
		<form:input type="file" id="uploadFilePath"  path="uploadFilePath" onfocus="removeHasError('divID_uploadFilePath')"  onclick="remove();refresherrorid(event,'uploadErrorId');"/>
	
	</div>
	
	</div>
		
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
									<input type="submit" class="btn btn-warning" value="Submit" />
								</div>
								
								<table>
								<tr>
								<td>Valid</td>
								<td>Invalid</td>
								<td>Records</td>
								</tr>
								<tr>
								<td> ${merchantData.valid}</td>
								</tr>
								</table>
								
								
	</form:form>
	<input type="hidden" value="${menuId}" name="menuId" id="menuId">
	      <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</body>

</html>