<%@page import="java.util.Arrays"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/Partner.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Financial Instrument</title>

<script>
$(function () {

	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			//minDate : currentDate,
           // useCurrent: false,
    });
});
</script>
</head>
<body>
<form:form id="financialInstrumentsedit" method="post"
	modelAttribute="financialinstrumentdata"
	action="${pageContext.request.contextPath}/AdminUI/partnerManagement/financialInsrumentsEdit">

<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			Financial Instruments
		</h1>
		<div class="clearfix"></div>	
		<hr>
  	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
		
	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="instrumentDivId" class="styled-input" >
									<form:input
										id="instrumentId" path="instrumentname" class=" selecttag" type="text" 
										onclick="refresh('successMessageId');emptyerror('lab_instrumentname_ErrorId');" 
										onfocus="removeHasError('instrumentDivId');showlabel('lab_instrumentname','lab_instrumentname_ErrorId');emptyerror('lab_instrumentname_ErrorId')"
										onchange="checkDuplicate();"
										onkeypress="onlyAlphabetlatest(event,'lab_instrumentname_ErrorId','lab_instrumentname');emptyerror('lab_instrumentname_ErrorId');"/>
										<label id=lab_instrumentname class="valid" ><spring:message code="lab_instrumentname" /></label>
										<label id="lab_instrumentname_ErrorId" class="collapse"></label>
										
					    		</div>
					    	</div>
	
	
		                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="div_fromDate" class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_start_date" path="fromDate" class=" selecttag" autocomplete="off"
										type="text" onclick="refresh('successMessageId');selecttag1('label_fromDate','lab_start_date');"
										onfocus="emptyerror('lab_start_date_ErrorId');
										removeHasError('div_fromDate');showlabel('label_fromDate','lab_start_date_ErrorId')"  />
										<label id="label_fromDate"  class="valid" ><spring:message code="lab_start_date" /></label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_fromDate');removeHasError('div_fromDate');showlabel('label_fromDate','lab_start_date')"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="div_toDate" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="lab_end_date"
										path="toDate" class="selecttag" type="text" autocomplete="off"
										onclick="selecttag1('label_toDate','lab_end_date');refresh('successMessageId');"
										onchange="selecttag('label_toDate','lab_end_date');"
										onfocus="emptyerror('lab_end_date_ErrorId');
										removeHasError('div_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"/>
											<label id="label_toDate"  class="valid" ><spring:message code="lab_end_date" /></label>
											<label id="lab_end_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"><i class="glyphicon glyphicon-calendar" 
										onclick="removeHasError('div_toDate');selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"></i> </i>
					    		</div>
                      		</div>
                      	</div>
                      				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					<div class="styled-input" id="status-input">
					<form:select class="selecttag" path="status"
						id="status"
						onclick="emptyerror('statusError');this.setAttribute('value', this.value);"
						value="" 
						onkeypress="emptyerror('statusError');"
						onchange="selecttag('label_status','status');"
						onfocus="removeHasError('status-input');showlabel('label_status','statusError');">
						<form:option value="" label=" " />
						<form:option value="true" label="Active" />
						<form:option value="false" label="Inactive" />
					</form:select>

					<label id="label_status"class="valid">Status</label> <label id="statusError"
						class="collapse"></label>
				</div>
			</div>
	                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
							<input type="submit"  value="Update" class="btn btn-warning" onclick="validateFinancialInstrument(event)"/>
                     	</div>
          
                     	  <form:hidden id="finId" path="financialinstrumentId" value="${id}"/>      
                     	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	          	 	<input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           		<input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
                     	</form:form>

</body>
</html>