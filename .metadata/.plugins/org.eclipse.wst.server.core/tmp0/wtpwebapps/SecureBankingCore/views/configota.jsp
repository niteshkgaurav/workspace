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
<title>Create Master</title>
</head>
<body onload="setupconf();">
<div>
	<form:form id="otaForm" name="otaForm">	
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
    	      <div style="text-align:center;" id="statusmsg"><b><font color="red">${statusMessage}</font></b></div>
          	  <div style="text-align:center;" id="statusmsg"><b><font color="green">${successMessage}</font></b></div>
			  <div style="text-align:center;"><b><font color="red"><p id="infomsg"></p></font></b></div>
               <h1 class="pull-left">Create Master</h1>
               <div class="clearfix"></div>
                <hr>
           </div>
  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<input id="desc" class="selecttag" type="text" placeholder="."/>
					<label id="label_desc" class="valid">Master Description</label>
				</div>
			</div>
           
           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div class="styled-input">
				<label id="label_master"class="valid">Header Setup&nbsp;</label>
				<select name="masterid" id="masterSelect" onchange="fillMaster(this)">
					<option value="0">Select Master</option>
					<c:forEach items="${masterOtaConfig}" var="mota">			
					  <option value="${mota.id}">${mota.desc}</option>
					</c:forEach>
				</select> 	
				</div>
			</div>
			
           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div class="styled-input">
				<label id="label_otasms"class="valid">OTA configuration setup&nbsp;</label>
				<select name="smsid" id="OTASmsSelect" onchange="fillSMS(this)">
					<option value="0">Select SMS Config</option>
					<c:forEach items="${otaSmsConfig}" var="osms">			
					  <option value="${osms.id}">${osms.desc}</option>
					</c:forEach>
				</select> 	
				</div>
			</div>

		  <div class="row">&nbsp;</div>
		  <div class="row">&nbsp;</div>

			<div id="masterConfFormId">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="protocolr" class="selecttag" type="text"
							placeholder="." readonly/>
						<label id="label_Protocol" class="valid">Protocol</label>
					</div>
				</div>
	
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="dcsr" class="selecttag" type="text"
							placeholder="." readonly/>
						<label id="label_dcs" class="valid">DCS</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="udhr" class="selecttag" type="text"
							placeholder="." readonly/>
						<label id="label_udh" class="valid">UDH</label>
					</div>
				</div>
			</div>

			<div id="smsOtaConfFormId">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="svctyper" class="selecttag" type="text" placeholder="." readonly/>
						<label id="label_svctype" class="valid">Service Type</label>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="sourceaddtonr" class="selecttag" type="text"
							placeholder="." readonly/> 
						<label id="label_sourceaddton" class="valid">Source	Address Ton</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="sourceaddnpir" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_sourceaddnpi" class="valid">Source	Address NPI</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="sourceAddr" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_sourceAdd" class="valid">Source Address</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="destinationAddTonr" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_destinationAddTon" class="valid">Destination Address Ton</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="destinationAddNpir" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_destinationAddNpi"	class="valid">Destination Address NPI</label>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="esmClassr" class="selecttag" type="text" placeholder="." readonly/>
						<label id="label_esmClass" class="valid">ESM Class</label>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="priorityFlagr" class="selecttag" type="text"
							placeholder="." readonly/> 
						<label id="label_priorityFlag" class="valid">Priority Flag</label>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="scheduleDeliveryTimer" class="selecttag" type="text"
							placeholder="." readonly/> 
						<label id="label_scheduleDeliveryTime" class="valid">Schedule Delivery Time</label>
					</div>

				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="validityPeriodr" class="selecttag" type="text"
							placeholder="." readonly/> 
						<label id="label_validityPeriod" class="valid">Validity	Period</label>
					</div>

				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="registeredDeliveryr" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_registeredDelivery" class="valid">Registered Delivery</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="replaceIfPresentFlagr" class="selecttag" type="text"
							placeholder="." readonly/> 
							<label id="label_replaceIfPresentFlag" class="valid">Replace If Present Flag</label>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="styled-input">
						<input id="smDefaultMsgIdr" class="selecttag" type="text"
							placeholder="." readonly/>
						<label id="label_smDefaultMsgId" class="valid">Default MsgId</label>
					</div>
				</div>
			</div>
			
		  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
               	 <input type="button" class="btn btn-warning" value="Create Master"
               	 onclick="return checkOTASetup(event);"/>
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
								<th>Master Description</th>	
								<th>Protocol</th>	
								<th>DCS</th>	
								<th>UDH</th>	
								<th>Service Type</th>	
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
								 <c:forEach items="${otaConfig}"
									var="ot">
									<tr id="row_${ot.id}">
										<td>${ot.masterDesc}</td>	
										<td>${ot.protocol}</td>	
										<td>${ot.dcs}</td>	
										<td>${ot.udh}</td>	
										<td>${ot.serviceType}</td>	
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