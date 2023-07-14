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

<title>Partner Creation</title>
<script>
$(function () {

	 var currentDate=new Date(); 
	 currentDate.setDate(currentDate.getDate() - 1);
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			minDate : currentDate,
            useCurrent: false,
      });
		
	});
</script>

<style type="text/css">
  li {
    color: black;
  }
</style>
</head>



<body >
	<form:form  modelAttribute="appPartner" method="post" action="${pageContext.request.contextPath}/AdminUI/partnerManagement/partnerDataSubmit" enctype="multipart/form-data">
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	            <h1 class="pull-left"><spring:message code="lab_partnerCreation"/></h1>
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
				<div class="styled-input" id="partnerNamestyled-input">
					
					<form:input type="text" minlength="5" maxlength="50" class="selecttag" path="partnerName" id="partnerName"   
						onclick="emptyerror(event,'partnerNameErrorId');refresh('successMessageId');" 
						onfocus="removeHasError('partnerNamestyled-input');showlabel('partnerNameId','partnerNameErrorId');emptyerror(event,'partnerNameErrorId')"
					  	onChange="checkField('partnerName','PayCardAppPartner','payCardPartnerName','partnerNameErrorId','partnerNameId'); removeClass('partnerNameId','partnerName');selecttag('partnerNameId','partnerName');"
					  		onkeypress="onlyAlphabetlatest(event,'partnerNameErrorId','partnerNameId');emptyerror(event,'partnerNameErrorId');"/>
					<label id="partnerNameId" ><spring:message code="lab_partnerName" /></label>  
					<label id="partnerNameErrorId" class="collapse"></label>
				</div>
			</div>
          		 
          		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="partnerDescstyled-input">
					
					<form:input type="text"  maxlength="125" class="selecttag" path="partnerDescription" id="partnerDescription"  
						onclick="emptyerror(event,'partnerDescErrorId');refresh('successMessageId');" 
						 onfocus="removeHasError('partnerDescstyled-input');showlabel('partnerDescId','partnerDescErrorId');emptyerror(event,'partnerDescErrorId')"
					  	onChange="selecttag('partnerDescId','partnerDescription');"
					  onkeypress="emptyerror(event,'partnerDescErrorId');"/>
					<label id="partnerDescId" ><spring:message code="lab_Description" /></label>  
					<label id="partnerDescErrorId" class="collapse"></label>
				</div>
			</div>
          		 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="appDiv">
			                          <form:select class="selecttag" path="appName" id="appId"
			                           onclick="emptyerror(event,'appError');refresh('successMessageId');this.setAttribute('value', this.value);" value=""  
			                          onchange="selecttag('lab_appId','appId');showHideFunction();"
			                           onfocus="removeHasError('appDiv');showlabel('appId','appError');emptyerror(event,'appError')"
			                          onkeypress="emptyerror(event,'appError');">
			                          <form:option value="" label=" " />
												<form:options items="${apps}" />
															</form:select>
			                           
			                           <label id="lab_appId" ><spring:message code="LABEL_APP_NAME"/></label>
			                          <label id="appError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="statusDiv">
			                          <form:select class="selecttag" path="status" id="status" 
			                          onclick="emptyerror(event,'statusError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="selecttag('statId','status');showHideFunction();" 
			                           onfocus="removeHasError('statusDiv');showlabel('statId','statusError');emptyerror(event,'statusError')"
			                          onkeypress="emptyerror(event,'statusError');">
			                          <form:option value="" label=" " />
													<form:option value="true" label="Active" />
													<form:option value="false" label="Inactive" />
															</form:select>
			                           
			                           <label id="statId" ><spring:message code="lab_status" /></label>
			                          <label id="statusError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                      
          		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_start_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input id="startDate" type="text"  path="startDate" class=" selecttag"
										autocomplete="off" onchange="selecttag('startDateId','startDate');" 
										onfocus="emptyerror(event,'startDateErrorId');emptyerror(event,'errorId');
												removeHasError('divID_start_date');showlabel('startDateId','startDateErrorId')"  />
										<label id="startDateId"><spring:message code="lab_start_date" /></label>
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
											<label id="endDateId"><spring:message code="lab_end_date" /></label>
											<label id="endDateErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('endDateId');showlabel('endDateId','endDateErrorId');removeHasError('toDate_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="submit">
					<input type='submit' class="btn btn-warning" value="Submit" onclick="return validateCreatePartner(event);">
					</div>
		</div>	
	</form:form> 
</body>
</html>