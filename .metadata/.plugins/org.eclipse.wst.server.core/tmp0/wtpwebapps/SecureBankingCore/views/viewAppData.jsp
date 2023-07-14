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

<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<title>app data</title>
<script>
$(function () {

	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
			format: 'YYYY-MM-DD',
            useCurrent: false,
     });
		
	});
</script>

<style type="text/css">
  li {
    color: black;
  }
</style>
<script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/appManagement/getAppList');
</script>
</head>



<body >
	<form:form  modelAttribute="cardApps" method="post" action="${pageContext.request.contextPath}/AdminUI/appManagement/updateApp" enctype="multipart/form-data">
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	            <h1 class="pull-left"><spring:message code="LABEL_APP_EDIT"/></h1>
	               <div class="clearfix"></div>
					<hr>
					<c:if test="${successMessage!=''}">
					<div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                      <p><font color="green">${successMessage}</font></p> 
					</div>
					</c:if> 
				  </div>
		<div class="row" id="account">
          		
          		
          		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="appNamestyled-input">
					
					<form:input type="text" class="selecttag" path="apName" id="apName"  readonly="true"
						onclick="emptyerror(event,'appNameErrorId');" onfocus="removeHasError('appNamestyled-input');"
					  	onChange="selecttag('appNameId','appName');"/>
					<label id="appNameId" class="valid" ><spring:message code="label_payCardApp" /></label>  
					<label id="appNameErrorId" class="collapse"></label>
				</div>
			</div>
          		
          		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="appDescstyled-input">
					
					<form:input type="text"  maxlength="200" class="selecttag" path="appDesc" id="appDesc"  readonly="true"
						onclick="emptyerror(event,'appDescErrorId');" onfocus="removeHasError('appDescstyled-input');"
					  	onChange="selecttag('appNameId','appName');"/>
					<label id="appDescId" class="valid" ><spring:message code="lab_Description" /></label>  
					<label id="appDescErrorId" class="collapse"></label>
				</div>
			</div>
          		 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="productDiv">
			                          <form:input class="selecttag" path="product" id="productId" onclick="emptyerror(event,'productError');this.setAttribute('value', this.value);"  readonly="true" 
			                          onchange="selecttag('prodId','productError')" onfocus="removeHasError('productDiv');" />
			                           <label id="prodId" class="valid"><spring:message code="lab_products" /></label>
			                          <label id="productError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="statusDiv">
			                          <form:select class="selecttag" path="statusValue" id="statusId" onclick="emptyerror(event,'statusError');this.setAttribute('value', this.value);" value=""  
			                          onchange="selecttag('statId','statusError')" onfocus="removeHasError('statusDiv');">
			                          <form:option value="" label=" " />
													<form:option value="true" label="active" />
													<form:option value="false" label="Inactive" />
															</form:select>
			                           
			                           <label id="statId" class="valid"><spring:message code="lab_status" /></label>
			                          <label id="statusError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                      
          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_start_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input id="startDate" type="text"  path="startDate" class=" selecttag"
										autocomplete="off" onchange="selecttag('startDateId','startDate');" 
										onfocus="emptyerror(event,'startDateErrorId');emptyerror(event,'errorId');
										removeHasError('divID_start_date');showlabel('startDateId','startDateErrorId')" readonly="true" />
										<label id="startDateId" class="valid"><spring:message code="lab_start_date" /></label>
										<label id="startDateErrorId" class="collapse"></label>
										<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('startDateId');showlabel('startDateId','startDateErrorId');removeHasError('divID_start_date');"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="toDate_divID" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="endDate" autocomplete="off"
										path="endDate" class="selecttag" type="text" 
										onchange="selecttag('endDateId','endDate');" 
										onfocus="emptyerror(event,'endDateErrorId');emptyerror(event,'errorId');
										removeHasError('toDate_divID');showlabel('endDateId','endDateErrorId')"/>
											<label id="endDateId" class="valid"><spring:message code="lab_end_date" /></label>
											<label id="endDateErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('endDateId');showlabel('endDateId','endDateErrorId');removeHasError('toDate_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>  
                      	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="appAmountStyled-input">
					
					<form:input type="number"  min="1" max="100000" class="selecttag" path="amount" id="appAmount"
						onclick="emptyerror(event,'appAmountErrorId');refresh('successMessageId');" 
						onfocus="removeHasError('appAmountStyled-input');showlabel('appAmountId','appAmountErrorId');emptyerror(event,'appAmountErrorId')"
						onkeypress="emptyerror(event,'appAmountErrorId');"
					  	onChange="selecttag('appAmountId','appAmount');"/>
					<label id="appAmountId" class="valid"><spring:message code="lab_amount"/></label>  
					<label id="appAmountErrorId" class="collapse"></label>
				</div>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="submit">
					<input type='submit' class="btn btn-warning"  value="Update" onclick="return validateCreateApps(event);">
					</div>
		</div>	
		
		<form:hidden id="id" path="id" value="${id}"/> 
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form> 
</body>
</html>