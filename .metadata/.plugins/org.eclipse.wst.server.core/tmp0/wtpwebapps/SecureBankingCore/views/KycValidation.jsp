<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src=${pageContext.request.contextPath}/js/KycValidation.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<title>KYC Validation</title>
<style>
	select { width: 13.5em }


     tr:hover{
      cursor: pointer;
    }
</style>
<script>
$(function () {
	var today = new Date();
	var prev = new Date();
	prev.setDate(today.getDate()-1);
	$('.datetimepicker1').datetimepicker({
      	maxDate: prev,
		format: 'YYYY-MM-DD',
				
    });
	$("#lab_end_date").val('');
	$("#lab_start_date").val('');
	
});

  </script>
  
</head>
<body onload="onLoad();">
	<form:form id="kycValidationFormId" method="post"  modelAttribute="kycValidationData" action="${pageContext.request.contextPath}/AdminUI/kycController/kycValidation" enctype="multipart/form-data">
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="KYC Validations"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
							
	                    </div>
	                    <div class="row">
	                    	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div class="styled-input" id="div_DistName">
	    										 <form:select path="distributorName" class="selecttag"  onfocus="removeHasError('div_DistName'); showlabel('label_distributorName','lable_DistributorNameErrorId')" value=""
		    										 onchange="fetchAgentDistributor('distributorName','subDistributorName','DI');selecttag('label_distributorName','distributorName')" 
		    										 onclick="emptyerror(event,'agentNameErrorId');this.setAttribute('value', this.value);removeSuccessMessage('msgId'); removeErrorMessage('ZeroLengthErrorId');" >
						  							<form:option value="0" label=" "/>
						  							<form:options items="${kycValidationData.distributor}"/>
						  						</form:select>
											<span></span>
										<label id="label_distributorName"><spring:message code="lable_DistributorName" /></label>
										<label id=lable_DistributorNameErrorId class="collapse"></label>
										
								</div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div class="styled-input" id="div_SubDistName">
												<form:select path="subDistributorName" class="selecttag" 
													onfocus="removeHasError('div_SubDistName'); showlabel('label_subDistributorName','agentNameErrorId')" value=""
												 	onchange="fetchAgentDistributor('subDistributorName','agentName','SD');selecttag('label_subDistributorName','subDistributorName')" 
												 	onclick="emptyerror(event,'agentNameErrorId');this.setAttribute('value', this.value);" >
						  							<form:option value="0" label=" "/>
						  						</form:select>
											<span></span>
										<label id="label_subDistributorName"><spring:message code="lable_SubDistributorName" /></label>
										<label id=agentNameErrorId class="collapse"></label>
								</div>
	                      	</div>
	                      	
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div class="styled-input" id="div_AgentName">
						  						<form:select path="agentName" onclick="emptyerror(event,'agentNameErrorId');"  
						  						class="selecttag" onchange="selecttag('label_agentName','agentName')"
						  						onfocus="removeHasError('div_AgentName'); showlabel('label_agentName','agentNameErrorId')" value="">
						  							<form:option value="0" label=" "/>
						  							
						  						</form:select>
											<span></span>
										<label id="label_agentName"><spring:message code="label_Retailer" /></label>
										<label id=agentNameErrorId class="collapse"></label>
								</div>
	                      	</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="styled-input"  id="div_Status">
									<form:select path="status" class="selecttag" onclick="this.setAttribute('value', this.value); removeError('div_Status');"
										 onfocus="removeHasError('div_Status'); showlabel('label_status','lab_statusErrorId')" value=""
										 onchange="emptyErrorMessage();selecttag('label_status','status')">
									<form:option value="" label=" "/>
									<form:option value="0" label="APPROVED"/>
									<form:option value="1" label="REJECTED"/>
									<form:option value="2" label="PENDING"/>
									<form:option value="-1" label="ALL"/>
									</form:select>
										<span></span>
									<label id="label_status"><spring:message code="lab_status" /></label>
											<label id=lab_statusErrorId class="collapse"></label>
								</div>
							</div>
	                      	
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
								<div id="div_fromDate" class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
										<form:input class=" selecttag" path="fromDate" maxlength="10" size="21" id="lab_start_date" onchange="changeClass('label_fromDate','fromDateErrorId');"
											 onfocus="removeHasError('div_fromDate');showlabel('label_fromDate','fromDateErrorId');selecttag('label_fromDate','lab_start_date')"
											 onclick="emptyerror(event,'fromDateErrorId');selecttag('label_fromDate','lab_start_date')"/>
										<label id="label_fromDate" class="valid"><spring:message code="fromDate" /></label>
										<label id="fromDateErrorId"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
					    			</div>
					    		</div>
							</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="div_toDate" class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
										 <form:input class=" selecttag"  maxlength="10" size="21" id="lab_end_date" onchange="changeClass('label_toDate','toDateErrorId');"
											 onfocus="removeHasError('div_toDate');showlabel('label_toDate','toDateErrorId');selecttag('label_toDate','lab_end_date')"
											 path="toDate" onclick="emptyerror(event,'toDateErrorId');selecttag('label_toDate','lab_end_date')"/>
										<label id="label_toDate"  class="valid"><spring:message code="toDate" /></label>
										<label id="toDateErrorId"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
					    			</div>
					    		</div>
					    	</div>
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      	<input type="button" value="Fetch" id="fetchButton" class="btn btn-warning" onclick="fetchData();"/>
	                      	<br><br>
	                      </div>
	                    <div class="col-xs-12" id='customerDetailsDiv'>
				   		 	<div class="transaction-table">
				     			<div class="table-responsive">
				       			 <table id="customerDetailsTable" class="table table-bordered table-striped">
				       				<tr>
				           				<th>No.</th>
				           				<th><spring:message code="lab_CustId" /></th>
				           				<th><spring:message code="lab_CustName" /></th>
				           				<th><spring:message code="lab_CustMsisdn" /></th>
				           				<th><spring:message code="lab_ActDate" /></th>
				           				<th><spring:message code="lab_CustStatus" /></th>
				           			</tr>
				           			
				             	</table>
				             	<input type="hidden" value=""/>
				           	 </div>
				          </div>
			         	</div>
	                     
						<div class="col-xs-12" id="internalKycTableDiv">
       						<div class="transaction-table" id="internalKycTableDiv2">
								<div class="table-responsive">
									<table id="internalKycTable" class="table table-bordered table-striped" border="2">
										<thead>
											<tr>
												<th>No.</th>
												<th><spring:message code="lab_DocName" /></th>
												<th><spring:message code="lab_IdName" /></th>
												<th><spring:message code="lab_IdNum" /></th>
												<th><spring:message code="lab_IdStatus" /></th>
												<th><spring:message code="lab_AddedOn" /></th>
												<th><spring:message code="lab_UpdatedOn" /></th>
												<th><spring:message code="lab_IdComment" /></th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div> 
	                     
						<div id="ZeroLengthErrorId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"></div>
	                    
            	</div>
				<input type="hidden" value="${pageContext.request.contextPath}" id="link" name="link">
				<input type="hidden" value="${menuId}" name="menuId" id="menuId">
				<input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
				<input type="hidden" value="${kyc_path}" id="kycPath" />
	           
	
	</form:form>
	
	
	
	
</body>
</html>