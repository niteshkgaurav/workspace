
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
<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script> -->
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui_1.11.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/parking/js/parking.js"></script>
 

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<title>Merchant Registration</title>
<script type="text/javascript">
function removeAlertMsg(){
	$("#msgDiv_Id").html("");
}
</script>
</head>
<body>

<!-- ============================================ Form Start ================================================================================================== -->

	<form:form method="post" modelAttribute="parkingBean"
		action="${pageContext.request.contextPath}/AdminUI/parkingController/addCompany">
		<div class="heading-inner ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">Parking Company</h1>
			<div class="clearfix"></div>


		</div>
		<hr>
		<div align="center" id="msgDiv_Id"><span style="color:green">${msg} </span></div>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
			&nbsp;</div>
		

		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="parkingNameDiv_Id" class="styled-input">
				<form:input id="parkingName" path="name" maxlength="20" 
					class="selecttag" onclick="removeAlertMsg();"
					onchange="selecttag('parkingLblName','parkingName');"
					onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"
					readonly="false" />
				<label id="parkingLblName" class="valid">*Company Name</label> <label
					id="parkingLblErrorId" class="collapse"></label> <span></span>
			</div>
		</div>

	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="emailDiv" class="styled-input">
				<form:input id="email" path="email" maxlength="20"
					class="selecttag" onclick="removeAlertMsg();"
					onchange="selecttag('parkingLblName','parkingName');"
					onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"
					readonly="false" />
				<label id="emaiLabel" class="valid">*Email</label> 
				<label	id="emaiError" class="collapse"></label> <span></span>
			</div>
		</div>
		
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="mobileDiv" class="styled-input">
				<form:input id="mobile" path="mobile" maxlength="20"
					class="selecttag" onclick="removeAlertMsg();"
					onchange="selecttag('parkingLblName','parkingName');"
					onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"
					readonly="false" />
				<label id="mobileLabel" class="valid">*Mobile No</label> 
				<label	id="mobileError" class="collapse"></label> <span></span>
			</div>
		</div>

		<!-- //======================================== -->
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">



				<div class="row">
				<div class="col-md-4 col-lg-4 pr0">
					<div id="div_pinCode" class="styled-input">

						<form:input type="text" maxlength="6" path="pin" id="pin"
							onclick="clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');"
							onfocus="removeHasError('div_pinCode')"
							onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " />
						<label id="hhg" class="valid">PinCode</label> <label
							id="lab_pinCodeErrorId" class="collapse"></label>

					</div>
				</div>
				<div class="col-md-8 col-lg-8 pl0">

					<input type="button" class="btn btn-warning" id="addressFetchId"
						value="Fetch Address" onclick="fetchAddress();" />&nbsp; &nbsp;


				</div>
			</div>
			<div id="addressErrorId"></div>
			<div id='addressSelectDivIdPopup' style='display: none'>
				<table border="1" cellpadding='0' width='100%'
					id='addressSelectTableId'>
				</table>
			</div>
		</div>






		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="addressSelectDivId" class="styled-input">
				<form:input type="text" path="address" id="address" maxlength="20"
					onclick="emptyerror(event,'lab_addressErrorId');" />
				<label id="hhg" class="valid">Address</label> <label
					id="lab_addressErrorId" class="collapse"></label><span></span>

			</div>
		</div>





		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="Region" class="styled-input">
				<form:input type="text" path="region" readonly="true" />
				<label id="ii" class="valid">Region</label> <label
					id="lab_regionErrorId" class="collapse"></label><span></span>

			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="Locality" class="styled-input">
				<form:input type="text" path="locality" readonly="true" />
				<label id="imhh" class="valid">Locality</label> <label
					id="lab_localityErrorId" class="collapse"></label><span></span>

			</div>
		</div>



		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="District" class="styled-input">
				<form:input type="text" path="district" readonly="true" />
				<label id="iilm" class="valid">District</label> <label
					id="lab_districtErrorId" class="collapse"></label><span></span>

			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div class="styled-input" id="State">


				<form:input type="text" path="statess" readonly="true"
					onfocus="clrmsg('lab_StateErrorId')" />
				<label id="iiaa" class="valid">State</label> <label
					id="lab_StateErrorId" class="collapse"></label><span></span>

			</div>
		</div>



		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="State" class="styled-input">
				<form:input type="text" path="countrys" id="country" readonly="true"
					onfocus="clrmsg('lab_CountryErrorId')" />
				<label id="ciaa" class="valid">Country</label> <label
					id="lab_CountryErrorId" class="collapse"></label><span></span>

			</div>
		</div>
		<!--  //======================================== -->

		<%-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div id="NoOfSlotsDiv_Id" class="styled-input">
				<form:input id="fourWheelerCapacity" path="fourWheelerCapacity"
					maxlength="20" class="selecttag" onclick="removeAlertMsg();"
					ononchange="selecttag('fourWheelerLabelId','fourWheelerCapacity');"
					onfocus="removeHasError('fourWheelerDiv_Id');showlabel('fourWheelerCapacity','fourWheelerLabelErrorId')"
					readonly="false" />
				<label id="fourWheelerLabelId" class="valid">*No Of Slots</label> <label
					id="fourWheelerLabelErrorId" class="collapse"></label> <span></span>
			</div>
		</div> --%>
		
	

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input id="submitId" type="submit" 
				class="btn btn-warning" value="Submit" />
		</div>






	</form:form>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		<hr>
	</div>
	<hr>


</body>
</html>
