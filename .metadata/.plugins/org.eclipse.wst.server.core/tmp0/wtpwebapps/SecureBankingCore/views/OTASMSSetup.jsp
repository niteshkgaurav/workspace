<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterOtaSetup.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 
<script type="text/javascript" 	src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<script type="text/javascript" 	src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
  
<title>OTA configuration setup</title>
<script type="text/javascript">
	$(function () {
		var currentDate=new Date(); 
	 	$('.datetimepicker1').datetimepicker({
			format: 'YYYY-MM-DD HH:mm',
			minDate : 'now',
			useCurrent: true,
       });
	});
</script>

</head>
<body>
<div>
	<form:form id="otaSmsForm" name="otaSmsForm" method="post" modelAttribute="otaSmsData" 
		action="${pageContext.request.contextPath}/AdminUI/otaservice/sotasmsdata">
				
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
   	        				<div style="text-align:center;" id="statusmsg"><b><font color="red">${statusMessage}</font></b></div>
          					<div style="text-align:center;" id="statusmsg"><b><font color="green">${successMessage}</font></b></div>
   	        				<div style="text-align:center;"><b><p id="infomsg"></p></b></div>
	     
	                      <h1 class="pull-left">OTA configuration setup</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    </div>
	                    <div class="row">
          					
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	  	                        <div class="styled-input">
		                          <spring:message code="lab_svctype" var="lab_svctype" /> 
											<form:input id="svctype" class="selecttag" type="text" path="serviceType" placeholder="."/>
					    					 <label id="label_svctype"class="valid" placeholder="mm">Service Type</label>
                          		 </div>
                      		</div>
                      		
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                          <spring:message code="lab_desc" var="lab_desc" /> 
											<form:input id="desc" class="selecttag" type="text" path="desc" placeholder="."/>
					    					 <label id="label_desc"class="valid">Description</label>
                          		 </div>
                      		</div>  
            
	            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_sourceaddton" var="lab_sourceaddton" /> 
			                          <form:input id="sourceaddton" class="selecttag" type="text" path="sourceAddTon" placeholder="."/>
			                          <label id="label_sourceaddton"class="valid">Source Address Ton</label>
	                          </div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_sourceaddnpi" var="lab_sourceaddnpi" /> 
			                          <form:input id="sourceaddnpi" class="selecttag" type="text" path="sourceAddNpi" placeholder="."/>
			                          <label id="label_sourceaddnpi"class="valid">Source Address NPI</label>
	                          </div>
	                     	 </div>	 
                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_sourceAdd" var="lab_sourceAdd" /> 
			                          <form:input id="sourceAdd" class="selecttag" type="text" path="sourceAdd" placeholder="."/>
			                          <label id="label_sourceAdd"class="valid">Source Address</label>
	                          </div>
	                     	 </div>	 
                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_destinationAddTon" var="lab_destinationAddTon" /> 
			                          <form:input id="destinationAddTon" class="selecttag" type="text" path="destinationAddTon" placeholder="."/>
			                          <label id="label_destinationAddTon"class="valid">Destination Address Ton</label>
	                          </div>
	                     	 </div>	 
                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_destinationAddNpi" var="lab_destinationAddNpi" /> 
			                          <form:input id="destinationAddNpi" class="selecttag" type="text" path="destinationAddNpi" placeholder="."/>
			                          <label id="label_destinationAddNpi"class="valid">Destination Address NPI</label>
	                          </div>
	                     	 </div>	 

                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_esmClass" var="lab_esmClass" /> 
			                          <form:input id="esmClass" class="selecttag" type="text" path="esmClass" placeholder="."/>
			                          <label id="label_esmClass"class="valid">ESM Class</label>
	                          </div>
	                     	 </div>	 

                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_priorityFlag" var="lab_priorityFlag" /> 
			                          <form:input id="priorityFlag" class="selecttag" type="text" path="priorityFlag" placeholder="."/>
			                          <label id="label_priorityFlag"class="valid">Priority Flag</label>
	                          </div>
	                     	 </div>
	                     	 
                     	 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_date" path="scheduleDeliveryTime" class=" selecttag"
										autocomplete="off" />
										<label id="label_fromDate" class="valid">Schedule Delivery Time</label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_date');showlabel('label_date');"></i> </i>
					    			</div>
					    		</div>
					    	</div>	 

                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_validityPeriod" var="lab_validityPeriod" /> 
			                          <form:input id="validityPeriod" class="selecttag" type="text" path="validityPeriod" placeholder="."/>
			                          <label id="label_validityPeriod"class="valid">Validity Period</label>
	                          </div>

	                     	 </div>	 
                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_registeredDelivery" var="lab_registeredDelivery" /> 
			                          <form:input id="registeredDelivery" class="selecttag" type="text" path="registeredDelivery" placeholder="."/>
			                          <label id="label_registeredDelivery"class="valid">Registered Delivery</label>
	                          </div>
	                     	 </div>	 
                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_replaceIfPresentFlag" var="lab_replaceIfPresentFlag" /> 
			                          <form:input id="replaceIfPresentFlag" class="selecttag" type="text" path="replaceIfPresentFlag" placeholder="."/>
			                          <label id="label_replaceIfPresentFlag"class="valid">Replace If Present Flag</label>
	                          </div>
	                     	 </div>	 

                     	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_smDefaultMsgId" var="lab_smDefaultMsgId" /> 
			                          <form:input id="smDefaultMsgId" class="selecttag" type="text" path="smDefaultMsgId" placeholder="."/>
			                          <label id="label_smDefaultMsgId"class="valid">Default MsgId</label>
	                          </div>
	                     	 </div>	 
	                     	                     	 
	                     	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 <input type="submit" class="btn btn-warning" value="Submit" onclick="return checkOTAData(event);"/>
	                      	</div>
						</div>	
	  </form:form>
	  
  	  <div class="row">&nbsp;</div>
	  <div class="row">&nbsp;</div>
	  <div class="row">
			<div class="col-xs-12">
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="table_id">
							<thead>
								<tr>
								<th>Service Type</th>	
								<th>Description</th>	
								<th>Source Address Ton</th>	
								<th>Source Address NPI</th>
								<th>Source Address</th>	
								<th>Destination Address Ton</th>	
								<th>Destination Address NPI</th>
								<th>ESM Class</th>	
								<th>Priority Flag</th>	
								<th>Schedule Delivery Time</th>	
								<th>Validity Period</th>	
								<th>Registered Delivery</th>	
								<th>Replace If Present Flag</th>
								<th>Default MsgId</th>									
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${otaSmsConfig}"
									var="ot">
									<tr id="row_${ot.id}">
										<td>${ot.serviceType}</td>	
										<td>${ot.desc}</td>	
										<td>${ot.sourceAddTon}</td>	
										<td>${ot.sourceAddNpi}</td>	
										<td>${ot.sourceAdd}</td>	
										<td>${ot.destinationAddTon}</td>	
										<td>${ot.destinationAddNpi}</td>	
										<td>${ot.esmClass}</td>	
										<td>${ot.priorityFlag}</td>	
										<td>${ot.scheduleDeliveryTime}</td>	
										<td>${ot.validityPeriod}</td>	
										<td>${ot.registeredDelivery}</td>	
										<td>${ot.replaceIfPresentFlag}</td>	
										<td>${ot.smDefaultMsgId}</td>	
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>