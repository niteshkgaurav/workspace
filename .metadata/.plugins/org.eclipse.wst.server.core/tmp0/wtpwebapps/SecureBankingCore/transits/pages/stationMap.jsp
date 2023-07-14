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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<title>SE Issuance</title>

</head>

<body>
	<form:form id="commonMetroId" method="post"
		modelAttribute="commonMetroBean" onsubmit="return checkDocumentStatus(event);"
		action="${pageContext.request.contextPath}/AdminUI/kycController/issueSE"
		enctype="multipart/form-data">
		<div class="heading-inner  ">
			<h1 class="pull-left">
				<spring:message code="label_deviceMap" />
			</h1>
			<div class="clearfix"></div>
			<hr>
			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
			<c:if test="${errorMessage!=''}">
				<div id="ermsgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-danger">${errorMessage}</p>
				</div>
			</c:if> 

		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="linesDivId" class="styled-input ">
					<select id="lines">
							<option id="0"></option>
						<c:forEach items="${commonMetroBean.lines}" var="line" varStatus="status">
							<option id="${line.key}">${line.value}</option>
						</c:forEach>
					</select>
					<label id="label_lines" class="valid"><spring:message code="label_lines" />
<!-- 					<span style="color: red;"> *</label>  -->
					<label id="label_linesErrorId" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="stationsDivId" class="styled-input ">
					<select id="stations">
						<option value="0"></option>
					</select>
					<label id="label_stations" class="valid"><spring:message code="label_stations" /> 
					<label id="label_stationsErrorId" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="gateTypeDivId" class="styled-input ">
					<select id="gateType">
						<option id="0"></option>
						<option id="IN">IN</option>
						<option id="OUT">OUT</option>
						<option id="IN/OUT">IN / OUT</option>
					</select>
					<label id="label_gateType" class="valid"><spring:message code="label_gateType" /> 
					<label id="label_gateTypeErrorId" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="gatesDivId" class="styled-input ">
					<select id="gates">
						<option value="0"></option>
					</select>
					<label id="label_gates" class="valid"><spring:message code="label_gates" /> 
					<label id="label_gatesErrorId" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="devicesDivId" class="styled-input ">
					<select id="devices">
						<option value="0"></option>
					</select>
					<label id="label_devices" class="valid"><spring:message code="label_devices" /> 
					<label id="label_devicesErrorId" class="collapse"></label>
				</div>
			</div>
      	</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Map Device" />
		</div>
	</form:form>
</body>
</html>