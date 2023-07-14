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

<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />

<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" 	src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userMerchantCreation.js"></script> 

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
	  var modelAttributeValue = '${showCompany}';
		 if(modelAttributeValue==1)
		{
			 $('#compDiv').show();
		}	  	  
} );

</script>


</head>
<body class="PageType">
 	<script>
$(function () {

	 var currentDate=new Date(); 
	 currentDate.setDate(currentDate.getDate() - 1);
	 $('.datetimepicker1').datetimepicker({   
			format: 'YYYY-MM-DD',
            useCurrent: false,
      });
		
	});
</script>  

		<form:form  method="post" modelAttribute="merchantData"
			action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/updateMerchantSubmit"
			enctype="multipart/form-data">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">User Management</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 						 
	                    </div>
	                    
		
		<div class="row">
		
			 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 collapse" id="compDiv">
	                        <div class="styled-input" id="companyDiv">
			                          <form:select class="selecttag" path="companyId" id="companyId" onclick="removeStyleTag('compId');emptyerror(event,'companyError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="selecttag('compId','companyId');" 
			                           onfocus="removeHasError('companyDiv');showlabel('compId','companyError');emptyerror(event,'companyError')"
			                          	onkeypress="emptyerror(event,'productError');">
			                          <form:option value="" label=" " />
												<form:options items="${companyAndFranchise}" />
															</form:select>
			                           
			                           <label id="compId" class="valid">Company/Franchise</label>
			                          <label id="companyError" class="collapse"></label>
	                          </div>
	                      </div>
		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="name-input">
					 <form:input type="text" class="selecttag" path="merchantName" id="name"  
						onclick="emptyerror(event,'nameErrorId');refresh('successMessageId');" 
						onfocus="removeHasError('name-input');showlabel('nameId','nameErrorId');emptyerror(event,'nameErrorId')"
					  	onkeypress="onlyAlphabetlatest(event,'nameErrorId','nameId');emptyerror(event,'nameErrorId');"/>	
					<label id="nameId" class="valid"><spring:message code="Name" /></label>  
					<label id="nameErrorId" class="collapse"></label> 
					
				</div>
			</div>
			
		          		   
          		     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="mobile-input">
					 <form:input type="text" class="selecttag" path="mobileNumber" id="mobile-number" 
						onclick="emptyerror(event,'mobileErrorId');refresh('successMessageId');" 
						onfocus="removeHasError('mobile-input');showlabel('mobileId','mobileErrorId');emptyerror(event,'mobileErrorId')"
					  	onkeypress="onlyAlphabetlatest(event,'mobileErrorId','mobileId');emptyerror(event,'mobileErrorId');"/>	
					<label id="mobileId" class="valid"><spring:message code="Mobile Number" /></label>  
					<label id="mobileErrorId" class="collapse"></label> 
					
				</div>
			</div>
			
			
			    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="dob_divID" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="dateOfBirth" autocomplete="off"
										path="dob" class="selecttag" type="text" onkeyup="onlyNumeric('dateOfBirth','dobErrorId','dob_lab');"
										onchange="selecttag('dob_lab','dateOfBirth');selct('dob_lab')"  maxlength="12"
										onclick="removeHasError('dob_divID')"
										onfocus="emptyerror(event,'dobErrorId');emptyerror(event,'dobErrorId');
										removeHasError('dob_divID');showlabel('dob_lab','dobErrorId')"/>
											<label id="dob_lab" class="valid"><spring:message code="Date of Birth" /></label>
											<label id="dobErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('dob_lab');showlabel('dob_lab','dobErrorId');removeHasError('dob_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>
					  
         
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="submit">
					<input type="submit" class="btn btn-warning"  value="Submit" onclick="return validateUser(event);">
				</div>
				</div>	 
					<form:hidden id="id" path="id" value="${id}"/>                                       	  
	            <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	                           </form:form>
</body>
</html>