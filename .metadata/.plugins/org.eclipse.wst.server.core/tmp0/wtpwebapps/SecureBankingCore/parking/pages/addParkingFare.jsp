
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/custom.js"></script>


<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script>
$(function () {
	
	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
            useCurrent: false,

      });
		
	});
</script>

<script>

function getDetail()
{
	 var pin=$("#pin option:selected").val().trim();
	 $("#parkingId").empty();
	// alert(option+" "+dateTo+" "+dateFrom);
	 $.ajax({
			url: "ajax/getParkingNames",
			type: "POST",
			async:false,
			dataType: "json",
			data: "pin="+pin,
			success:function(response){
				if(response!=null && response.length!=0)
					{
					var data1=response;
					$.each(data1,function(key, value)
			                {
						var data=value.split("#");
			                    $("#parkingId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
			                });
			}
				else
					{
					 $("#parkingId").empty();
					}
				
			},
	  error: function(e) {
		   alert("error: "+e);
		    }
	
	 });

}



</script>

<title>Transit System</title>

</head>
<body>
	<div id="mainbody" class="container-fluid">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<section class="white">
			<div class="heading-inner">
				<h1>ADD FARE TO PARKING</h1>
				<div class="clearfix"></div>
				<hr>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
					<p id="statusmsgId">${msg}</p>
				</div>
				<%--  <div align="center"> ${msg}
				  </div>  
			   --%>
				<form:form method="post" id="fareForm" modelAttribute="parkingBean"
					action="${pageContext.request.contextPath}/AdminUI/parkingFareController/saveFare">


					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="div_pinCode" class="styled-input">

							<%--  <form:input type="text" maxlength="6"
					                path="pin" id="pin" onclick="clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');" onfocus="removeHasError('div_pinCode')"
					                onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " /> --%>

							<form:select class="selecttag" path="pin" id="pin" value=""
								placeholder="." onfocus="removeHasError('bankDiv');"
								onchange="getDetail();">
								<form:option value="" label=" " />
								<form:options items="${pinAvailable}" />

							</form:select>

							<label id="hhg" class="valid">Select PinCode</label> <label
								id="lab_pinCodeErrorId" class="collapse"></label>

						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="div_parking" class="styled-input">

							<%--  <form:input type="text" maxlength="6"
					                path="pin" id="pin" onclick="clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');" onfocus="removeHasError('div_pinCode')"
					                onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " /> --%>

							<form:select class="selecttag" path="pid" id="parkingId" value=""
								placeholder="." onfocus="removeHasError('bankDiv');">

							</form:select>

							<label id="hhg" class="valid">Select Parking</label> <label
								id="lab_pinCodeErrorId" class="collapse"></label>


						</div>
					</div>


					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="FareCreationDate" class="styled-input">
							<div class="input-group date datetimepicker1">
								<form:input id="fareCreationDate" path="fareCreateOn"
									type="text" class="selecttag"
									onfocus="removeHasError('FareCreationDate');selecttag('labelManufacturedDate','manufacturedDate')"
									onclick="emptyerror(event,'manufacturedDateError');showlabel('labelManufacturedDate','manufacturedDateError');selecttag('labelManufacturedDate','manufacturedDate')" />
								<label id="labelManufacturedDate" class="valid">*Date Of
									Fare Creation: </label> <label id="manufacturedDateError"
									class="collapse"></label> <i class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"
									onclick="selecttag1('labelManufacturedDate');"></i>
								</i>
							</div>
						</div>

					</div>

					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="NumberOfSlotsDiv_Id" class="styled-input">
							<form:input id="NumberOfSlots" path="noSlots" maxlength="6"
								class="selecttag" onclick="removeAlertMsg();"
								ononchange="selecttag('NoOfSlotsId','NumberOfSlots');"
								onfocus="removeHasError('NumberOfSlotsDiv_Id');showlabel('NumberOfSlots','NoOfSlotsErrorId')" />
							<label id="NoOfSlotsId" class="valid">*Number Of Slots</label> <label
								id="NoOfSlotsErrorId" class="collapse"></label> <span></span>
						</div>
					</div>

					<%-- 
			         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="TwoWheelerDiv_Id" class="styled-input">
						<form:input id="twoWheeler" path="twoWheelerCapacity"  maxlength="6" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('TwoWheelerId','twoWheeler');" 
						 	onfocus="removeHasError('TwoWheelerDiv_Id');showlabel('twoWheeler','TwoWheelerIdErrorId')"  />
						 <label id="TwoWheelerId" class="valid">*TwoWheelerCapacity</label>
						 <label id="TwoWheelerIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			         </div>
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="fourWheelerDivId" class="styled-input">
						<form:input id="fourWheeler" path="fourWheelerCapacity"  maxlength="6" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('FourWheelerId','fourWheeler');" 
						 	onfocus="removeHasError('fourWheelerDivId');showlabel('fourWheeler','FourWheelerIdErrorId')"    />
						 <label id="FourWheelerId" class="valid">*FourWheelerCapacity</label>
						 <label id="FourWheelerIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			       --%>





					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">

								<table class="table table-bordered table-striped" id="table_id">
									<thead>
										<tr>
											<th>Wage Type/For</th>
											<th>2-Wheeler</th>
											<th>4-Wheeler</th>
										</tr>
									</thead>
									<tbody>


										<tr>
											<td><c:out value="Hourly" /></td>
											<td><form:input type="text" path="twoWheelerByHour"
													name="" value="" /></td>
											<td><form:input type="text" path="fourWheelerByHour"
													name="" value="" /></td>
										</tr>

										<tr>
											<td><c:out value="Monthly" /></td>
											<td><form:input type="text" path="twoWheelerByMonth"
													name="" value="" /></td>
											<td><form:input type="text" path="fourWheelerByMonth"
													name="" value="" /></td>
										</tr>

										<tr>
											<td><c:out value="Night" /></td>
											<td><form:input type="text" path="twoWheelerByNight"
													name="" value="" /></td>
											<td><form:input type="text" path="fourWheelerByNight"
													name="" value="" /></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>




					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
						<button type="submit" onclick="return validate(event);"
							class="btn btn-warning">Submit</button>
					</div>

<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
						<hr>
					</div>
					<c:if test="${!empty allParkingFares}">
						<div class="col-xs-12">
							<div class="transaction-table">
								<div class="table-responsive">

									<table class="table table-bordered table-striped" id="table_id">
										<thead>
											<tr>
												<th>Parking Id</th>
												<th>Fare Created On</th>
												<th>No Of Slots</th>
												<th>Two Wheeler ByHour</th>
												<th>Two Wheeler ByMonth</th>
												<th>Two Wheeler ByNight</th>
												<th>Four Wheeler ByHour</th>
												<th>Four Wheeler ByMonth</th>
												<th>Four Wheeler ByNight</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${allParkingFares}" var="allFare">

												<tr>
													<td><c:out value="${allFare.pid}" /></td>
													<td><c:out value="${allFare.fareCreateOn}" /></td>
													<td><c:out value="${allFare.noSlots}" /></td>
													<td><c:out value="${allFare.twoWheelerByHour}" /></td>
													<td><c:out value="${allFare.twoWheelerByMonth}" /></td>
													<td><c:out value="${allFare.twoWheelerByNight}" /></td>
													<td><c:out value="${allFare.fourWheelerByHour}" /></td>
													<td><c:out value="${allFare.fourWheelerByMonth}" /></td>
													<td><c:out value="${allFare.fourWheelerByNight}" /></td>

												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:if>




				</form:form>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
					<hr>
				</div>


			</div>
		</div>
	</div>

	</div>
</body>
</html>