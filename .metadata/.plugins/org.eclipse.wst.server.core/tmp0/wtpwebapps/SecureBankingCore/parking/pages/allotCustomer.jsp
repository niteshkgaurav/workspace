
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
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>


<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	


<%-- <link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/parking/js/bootstrap-datetimepicker.min.css />	
<script type="text/javascript" src="${pageContext.request.contextPath}/parking/js/bootstrap-datetimepicker.min.js"></script>	 --%>
<script>
function restrict(event){
	check=true;
	var v1=$('#customerNameId').val().trim();
	var v2=$('#vehicleId').val().trim();
	var v3=$('#noOfTime').val().trim();
	var v4=$('#evaluateFare').val().trim();
	
	if(v1.length==0){
		$('#customerNameDiv_Id').addClass('has-error');
		check=false;
	}
	
	if(v2.length==0){
		$('#vehicleIdDiv_Id').addClass('has-error');
		check=false;
	}
	
	if(v3.length==0){
		$('#NoOfHoursDiv_Id').addClass('has-error');
		check=false;
	}
	
	if(v4.length==0){
		$('#evalutedDiv_Id').addClass('has-error');
		check=false;
	}
	
	if(!check){
		event.preventDefault();
	}
	
}

function changeVal(duration)
{
	if(duration == 'hour')
		{
		$('#timeId').html("Enter No. of  Hours");
		$("#nightDiv").show();
		$("#evaluateFare").val("");
		$('input:radio[name=nightCharge]')[1].checked = true;
		}else
		{
			$('#timeId').html("Enter No. of Months");
			$("#evaluateFare").val("");
			$("#nightDiv").hide();
			$('input:radio[name=nightCharge]')[1].checked = true;
		}
}
function calculateFareFee()
{
	var id;
	var vehicleType = $("input:radio[name=vehicleType]:checked").val();
	var passType = $("input:radio[name=passType]:checked").val();
	var nightCharge = $("input:radio[name=nightCharge]:checked").val();	
	
	if(passType=='monthly')
	id=vehicle+"M"
		else
	id=vehicle+"H"	
	
	
	
	var price=$("#"+id).text();
	var no=$("#noOfTime").val();
	
	if(nightCharge=='yes')
	{
		price=parseInt(price) + parseInt($("#"+vehicle+"N").text());
	}
	
	var amount=price*no;
	$("#evaluateFare").val(amount);
	//$("#labelFare").html(amount+" Rs.");
}

function calculateFare()
{
	var parkingId=$("#parkingId option:selected").val();
	var vehicleType = $("input:radio[name=vehicleType]:checked").val();
	var passType = $("input:radio[name=passType]:checked").val();
	var nightCharge = $("input:radio[name=nightCharge]:checked").val();	
	var inTime= $("#timeIn").val();
	var outTime=$("#timeOut").val();
	
	 $.ajax({
			url: "ajax/getEstimatedfare",
			type: "POST",
			async:false,
			dataType: "json",
			data: "parkingId="+parkingId+"&vehicleType="+vehicleType+"&passType="+passType+"&inTime="+inTime+"&outTime="+outTime,
			success:function(response){
				var data=response;
			 alert(data);	
			$("#evaluateFare").val(data[0]);
			$("#labelFare").html("<b>"+data[0]+" Rs. </b>");
			},
	  error: function(e) {
		   alert("error: "+e);
		    }
	
	 });
	
}	
</script>



<script>

function getDetail()
{
	 var companyId=$("#companyId option:selected").val().trim();
	 $("#parkingId").empty();
	// alert(option+" "+dateTo+" "+dateFrom);
	 $.ajax({
			url: "ajax/getParkingNames",
			type: "POST",
			async:false,
			data: "companyId="+companyId,
			dataType: "json",
			success:function(response){
				if(response!=null && response.length!=0)
					{
					 $("#parkingId").append("<option value='0'></option>"); 
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

/* 
function getDetailParking()
{
	 var parkingId=$("#parkingId option:selected").val().trim();
	// $("#parkDescription_Id").empty();
	 $("#tableDiv").empty();
	// alert(option+" "+dateTo+" "+dateFrom);
	 $.ajax({
			url: "ajax/getParkingDetails",
			type: "POST",
			async:false,
			data: "parkingId="+parkingId,
			success:function(response){
				if(response!=null && response.length!=0)
					{
					$("#tableDiv").append("<tr><td><b>TwoWheelerByHour</b></td><td id='2WH'>"+response.twoWheelerByHour+"</td><td><b>FourWheelerByHour</b></td><td id='4WH'>"+response.fourWheelerByHour+"</td></tr>")
					$("#tableDiv").append("<tr><td><b>TwoWheelerByMonth</b></td><td id='2WM'>"+response.twoWheelerByMonth+"</td><td><b>FourWheelerByMonth</b></td><td id='4WM'>"+response.fourWheelerByMonth+"</td></tr>");
					$("#tableDiv").append("<tr><td><b>TwoWheelerNightCharge</b></td><td id='2WN'>"+response.twoWheelerByNight+"</td><td><b>FourWheelerNightCharge</b></td><td id='4WN'>"+response.fourWheelerByNight+"</td></tr>");
					$("#tableDiv").append("<tr><td><b>TwoWheelerAvailable</b></td><td id='2WC'>"+response.twoWheelerCapacity+"</td><td><b>FourWheelerAvailable</b></td><td id='4WC'>"+response.fourWheelerCapacity+"</td></tr>");
					}
				else
					{
					$("#tableDiv").append("<tr><td>No Data</td></tr>");
					
					}
				
			},
	  error: function(e) {
		   alert("error: "+e);
		    }
	
	 });

} */
</script>
<script>

function getParkingFeeDetails(){
	if ( $.fn.DataTable.isDataTable( '#table_id' ) ) {
        $("#table_id").dataTable().fnDestroy()
      }
	 var parkingId=$("#parkingId option:selected").val().trim();
	 $.ajax({
			url: "ajax/getParkingFeeDetails",
			type: "POST",
			async:false,
			data: "parkingId="+parkingId,
			dataType: "json",
			success:function(response){
				
				if(response!=null && response.length!=0)
				{
				$("#tbody").empty();
				var data1=response;
				$.each(data1,function(key, value)
		                {
					//var data=value.split("#");
		              //$("#parkingId").append('<option value=' + data[0] + '>' + data[1] + '</option>'); // return empty
				      
				      $("#tbody").append("<tr><td><label> "+value.vehicleType+" </label></td>"+
				    		  "<td><label>"+value.fareType+" </label></td>"+
				    		  "<td><label>"+value.day+" </label></td>"+
				    		  "<td><label>"+value.minCharge+" </label></td>"+
				    		  "<td><label>"+value.maxCharge+" </label></td>"+
				    		  "<td><label>"+value.maxHour+" </label></td>"+
				    		  "<td><label>"+value.hourlyCharge+" </label></td>"+
				    		  "<td><label>"+value.nightCharge+" </label></td>"+
				    		  "<td><label>"+value.nightFlatCharge+" </label></td>"+ 
				    		  "<td><label>"+value.charge+" </label></td>"+
				    		  " </tr>");
		                
		                });
		}
			else
				{
				$("#tbody").empty();
				$("#tbody").append("<tr><td colspan='10'>No Data Found</td></tr>");
				}
				 $('#table_id').DataTable( {
			         "scrollY":        "400px",
			         "scrollCollapse": true,
			         "paging":         true,
			         "pagingType": "simple_numbers",
			         "pageLength": 50
			     } );
				
			},
	  error: function(e) {
		   alert("error: "+e);
		    }
	
	 });
	
}
function msg(){
	$("#msgDiv_Id").html("");
}

$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );

function fareShow(val)
{
	if(val=='show')
		$("#table_div").show();
	else
		$("#table_div").hide();
		
}
</script>

<title>Transit System</title>

 </head>  
<body class="PageType" >
	<div class="heading-inner">
		<h1>Customer Allocation</h1>
		<div class="clearfix"></div>
		<hr>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<p id="statusmsgId">
				<font color="red">${msgSuccessFailure}</font>
			</p>
		</div>


		<form:form method="POST" id="fareForm" modelAttribute="customerBean"
			action="${pageContext.request.contextPath}/AdminUI/customerAllotController/getAllot">

			<div align="center" id="msgDiv_Id"><span style="color:green">${msg}</span></div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="right">
				<b>FareTable </b>
				<input type="radio" name='abb' onclick="fareShow('show');" />
				show
				<input type="radio" name='abb' onclick="fareShow('hide');" checked  />
				hide
			</div>
					
					 <div class="col-xs-12" id="table_div">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table class="table table-bordered table-striped" id="table_id">
                              <thead>
                                <tr>
                                  <th >Vehicle Type</th>
						            <th >Fare Type</th>
						            <th >Day</th>
						            <th >Min Charge</th> 
							        <th>Max Charge</th> 
							        <th>Max Hour</th> 
							        <th>Hourly Charge</th> 
							        <th>Night Charge Hourly</th> 
							         <th>Nigth Charge Flat</th> 
							        <th>Charge</th> 
                                 
                                </tr>
                              </thead>
                              <tbody id="tbody">
                              
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div> 
                      
    <script>   $("#table_div").hide();   </script>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				&nbsp;&nbsp;&nbsp;</div>
			        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div  class="styled-input">
							
					   <%--  <form:input type="text" maxlength="6"
					                path="pin" id="pin" onclick="clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');" onfocus="removeHasError('div_pinCode')"
					                onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " /> --%>
					                
					        <form:select class="selecttag"  path="companyId"  id="companyId"  onchange="getDetail();" onclick="msg();"	>
							<form:option value="" label=" " />
							<form:options items="${allCompany}" />
							
						</form:select>
						
							<label id="ddd" class="valid">Select Company</label>
							<label id="lab_pidnCodeErrorId" class="collapse"></label>
								
		 				</div>
					    </div>
					    
					    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="div_parking" class="styled-input">
							
					   <%--  <form:input type="text" maxlength="6"
					                path="pin" id="pin" onclick="clrpincode();changee('lab_pinCodeErrorId','hhg');emptyerror('pin','lab_pinCodeErrorId');" onfocus="removeHasError('div_pinCode')"
					                onkeypress="onlyNumric(event,'lab_pinCodeErrorId'); " /> --%>
					                
					        <form:select class="selecttag"  path="pId"  id="parkingId" onclick="msg()" onchange=" getParkingFeeDetails();"
							value="" placeholder="."
							onfocus="removeHasError('bankDiv');">
							
						</form:select>
						
							<label id="hhg" class="valid">Select Parking</label>
							<label id="lab_pinCodeErrorId" class="collapse"></label>
								
								
		 				</div>
					    </div>
			

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				&nbsp;&nbsp;&nbsp;</div>

			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div id="customerNameDiv_Id" class="styled-input">
					<form:input id="customerNameId" path="customerName"
						class="selecttag" onclick="removeAlertMsg();"
						ononchange="selecttag('NoOfSlotsId','customerNameId');"
						onfocus="removeHasError('customerNameDiv_Id');showlabel('customerNameId','NoOfSlotsErrorId')" />
					<label id="NoOfSlotsId" class="valid">*Customer Name</label> <label
						id="NoOfSlotsErrorId" class="collapse"></label> <span></span>
				</div>
			</div>


			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				Vehicle Type
				<form:radiobutton path="vehicleType" name="vehicleType" value="2W" checked="true" />
				2W
				<form:radiobutton path="vehicleType" name="vehicleType" value="4W" />
				4W
			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				&nbsp;&nbsp;&nbsp;</div>


			<%--  <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1">
					   <form:radiobutton path="radio" name="radio" id="radio1" value="1" onclick="refresherrorid(event,'radioValuetErrorId');checkApp('payCardApp1','radio1')"/>
					   </div> --%>


			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div id="vehicleIdDiv_Id" class="styled-input">
					<form:input id="vehicleId" path="vehicleId" class="selecttag"
						onclick="removeAlertMsg();"
						ononchange="selecttag('NoOfSlotsId','vehicleId');"
						onfocus="removeHasError('vehicleIdDiv_Id');showlabel('vehicleId','NoOfSlotsErrorId')" />
					<label id="NoOfSlotsId" class="valid">*Vehicle Id</label> <label
						id="NoOfSlotsErrorId" class="collapse"></label> <span></span>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div>
					Allot Type &nbsp;&nbsp;
					<form:radiobutton path="passType" name="passType" value="hourly" checked="true"
					 />
					Hourly
					<form:radiobutton path="passType" name="passType" value="monthly"
						 />
					Monthly
				</div>
			</div>
 <!-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					   <div  id="nightDiv">
					   Night Charge  &nbsp;&nbsp;
					   <input type="radio" name="nightCharge" value="yes" /> Yes
					   <input type="radio" name="nightCharge" value="no" checked="true"/> No
					  </div>
					   </div> -->

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				&nbsp;&nbsp;&nbsp;</div>



			
			
			<%-- <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		                    <div id="FareCreationDate" class="styled-input">
		                       <div class="input-group date datetimepicker1">
		                         <form:input id="fareCreationDate" path="fareCreateOn"  
		                         type="text"  class="selecttag" 
		             				 onfocus="removeHasError('FareCreationDate');selecttag('labelManufacturedDate','manufacturedDate')"
		             				onclick="emptyerror(event,'manufacturedDateError');showlabel('labelManufacturedDate','manufacturedDateError');selecttag('labelManufacturedDate','manufacturedDate')" />
		                        	<label id="labelManufacturedDate" class="valid">In Date</label>
		                         	<label id="manufacturedDateError" class="collapse"></label>
		                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelManufacturedDate');"></i> </i>
		                       </div>
		                     </div> 
		                     
		           </div> 

					           
			 <div class="container">
			    <div class="row">
			        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			            <div class="form-group">
			                <div class='input-group date' id='datetimepicker3'>
			                    <input type='text' class="form-control" id="timee" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-time"></span>
			                    </span>
			                </div>
			            </div>
			        </div>
			        <script type="text/javascript">
			            $(function () {
			                $('#datetimepicker3').datetimepicker({
			                    format: 'LT'
			                });
			            });
			        </script>
			    </div>
			</div>
			
	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		                    <div id="FareCreationDate" class="styled-input">
		                       <div class="input-group date datetimepicker2">
		                         <form:input id="fareCreationDate" path="fareCreateOn"  
		                         type="text"  class="selecttag" 
		             				 onfocus="removeHasError('FareCreationDate');selecttag('labelManufacturedDate','manufacturedDate')"
		             				onclick="emptyerror(event,'manufacturedDateError');showlabel('labelManufacturedDate','manufacturedDateError');selecttag('labelManufacturedDate','manufacturedDate')" />
		                        	<label id="labelManufacturedDate" class="valid">Out Date</label>
		                         	<label id="manufacturedDateError" class="collapse"></label>
		                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelManufacturedDate');"></i> </i>
		                       </div>
		                     </div> 
		                     
		           </div> 
		           

 <div class="container">
			    <div class="row">
			        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			            <div class="form-group">
			                <div class='input-group date' id='datetimepicker3'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-time"></span>
			                    </span>
			                </div>
			            </div>
			        </div>
			        <script type="text/javascript">
			            $(function () {
			                $('#datetimepicker3').datetimepicker({
			                    format: 'LT'
			                });
			            });
			        </script>
			    </div>
			</div> --%>
<!--   ========================================================= -->
<!--  
 <div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datetimepicker({
                    locale: 'ru'
                });
            });
        </script>
    </div>
</div> -->
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div  class="styled-input">
					
					<label class="valid">*Time In</label> <label
						 class="collapse"></label> <span></span>
				</div>
			</div>
 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div  class="styled-input">
					
					<label class="valid">*Time Out</label> <label
						 class="collapse"></label> <span></span>
				</div>
			</div>
 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6">
        <div class="form-group ">
            <div class='input-group date' id='datetimepicker6'>
                <input type='text' class="form-control" name="timeIn" id="timeIn"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
           
        </div>
    </div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6">
        <div class="form-group">
            <div class='input-group date' id='datetimepicker7' >
                <input type='text' class="form-control" name="timeOut"  id="timeOut" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
</script> 
<!--   ========================================================= -->


			
			

			<%-- <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

				<div id="NoOfHoursDiv_Id" class="styled-input">
					<form:input id="noOfTime" onfocus="removeHasError('NoOfHoursDiv_Id')" path="hoursOrmonths" />

					<label id="timeId" class="valid"> Enter No. of Hours</label>
				</div>
			</div> --%>
			
					  
				<!-- 	  
					  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			      &nbsp;&nbsp;&nbsp;
			      </div> -->
			      
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<input type="button" class="btn btn-warning" value="Evaluate Fare"
					onclick="calculateFare();" />  <!-- onclick="calculateFare();" /> -->
					
				&nbsp;&nbsp;&nbsp;	<label id="labelFare" class="valid"></label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" id="evalutedDiv_Id">
			
				<form:input id="evaluateFare" readonly="true" path="evaluatedFare" hidden="true" /> 

			</div>

			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"  >  
			&nbsp
			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<button type="submit" onclick="restrict(event)" class="btn btn-warning">Submit</button>
			
			</div>



			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
				<hr>
			</div>
			<c:if test="${!empty allCustomers}">
				<div class="col-xs-12">
					<div class="transaction-table">
						<div class="table-responsive">

							<table class="table table-bordered table-striped" >
						<thead>
									<tr>
                                        <th>Customer Id</th>
										<th>Parking Id</th>
										<th>Customer Name</th>
										<th>Vehicle Type</th>
										<th>Vehicle Id</th>
										<th>Pass Type</th>
										<th>TimeIn</th>
										<th>TimeOut</th>
										<th>Evaluated Fare</th>
										<!-- <th>Action</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${allCustomers}" var="customer">
								 	<c:if test="${customer.status>0}">
										<tr>
											<td><c:out value="${customer.cId}" /></td>
												<td><c:out value="${customer.pId}" /></td>
												<td><c:out value="${customer.customerName}" /></td>
												<td><c:out value="${customer.vehicleType}" /></td>
												<td><c:out value="${customer.vehicleId}" /></td>
												<td><c:out value="${customer.passType}" /></td>
												<td><c:out value="${customer.timeIn}" /></td>
												<td><c:out value="${customer.timeOut}" /></td>
												<td><c:out value="${customer.evaluatedFare}" /></td>
												<%-- <td align="center"><a href="deleteCustomer?cId=${customer.cId}">Deallocate</a></td> --%>

											</tr>
	 									</c:if>
	 							</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</c:if>

		</form:form>
		
	</div>	
</body>
</html>