<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/transits/js/canvasjs.min.js"></script>


<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addBus.js"></script>
 
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker6').datetimepicker({  maxDate: new Date() });
        $('#datetimepicker7').datetimepicker({  maxDate: new Date() });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>

<script>
function getRouteTraffic()
{
	 $("#datas").empty();
	 var radioId = $("input[name='trafficType']:checked").val();
	var route=$("#routeId").val();
	 var dateTo=""; // $("#timeOut").val().trim();
	 var dateFrom=$("#timeIn").val().trim();	
	 var displayType=$("input[name='spanType']:checked").val();
	 var graphdata="";
	 $.ajax({
		url: "ajax/misTraffic",
		dataType:'json',
		type: "GET",
		async:false,
		dataType: 'json',
		data: "routeId="+route+"&trafficType="+radioId+"&dateFrom="+dateFrom+"&dateTo="+dateTo+"&displayType="+displayType,
		success:function(responseData){
			var response=responseData[0];
			alert(responseData[1]);
			// graphdata=responseData[1];
			graphdata =responseData[1];
			if(response!=null && response.length!=0)
			{
			var data1=response;
			$.each(data1,function(key, value)
	                {
				var data=value.split("#");
	                    $("#datas").append('<tr><td>'+ key+'</td><td>'+data[0] + '</td><td>'+data[1]+'<td></tr>'); // return empty
	                });
	}
		else
			{
			 $("#datas").empty();
			}
			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				theme: "light2", // "light1", "dark1", "dark2"
				title: {
					text: "Traffic Report"
				},
				subtitles: [{
					text: "Data Analysis",
					fontSize: 16
				}],
				axisY: {
					scaleBreaks: {
						type: "wavy",
						autoCalculate: false
					}
				},
				data: [{
					type: "column",
					indexLabel: "{y}",
					dataPoints: graphdata
				}]
			});
			chart.render();
			
		}});
	 
	 if(radioId.startsWith("r")){
			$('#heading').html("Route Name");
		}
		else {
			$('#heading').html("Stop Name");
		}
	

	if(displayType.startsWith("Y")){
		$('#header').html("Yearly(12 Months)");
	}
	else if(displayType.startsWith("M")){
		
		$('#header').html("Monthly(All Days of Month)");
	}
	else{
		$('#header').html("Daily(24 hours)");
	}


}
	
	</script>
</head>
<body>
<form:form   method="post" modelAttribute="faresmodel" action="${pageContext.request.contextPath}/AdminUI/transitMisTraffic/getTraffic"  > 
      <div class="row">
      <div class="heading-inner ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Traffic MIS</h1>
	                      <div class="clearfix"></div>
						
						
				  </div>
				  
				  <div align="center"> ${msg}
				  </div>  
  
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
   &nbsp;
   </div>
   
   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				
				<form:radiobutton id="trafficType" path="trafficType" name="trafficType" value="routeWise" checked="true" />
				By Route
				<br>
				<form:radiobutton id="trafficType" path="trafficType" name="trafficType" value="stopWise" />
				By Stop
			</div>
   
   
   

   
   	
						 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<form:radiobutton  path="spanType" name="spanType" value="Yearly" id="spanType" />
				Yearly (12 months)
				<br>
				<form:radiobutton  path="spanType" name="spanType" value="Monthly" id="spanType" />
				Monthly(30 days)
				<br>
				<form:radiobutton  path="spanType" name="spanType" value="Daily" id="spanType"/>
				Daily(24 hrs.)
				<br>
				<%-- <form:radiobutton  path="spanType" name="spanType" value="Hourly" />
				Hourly --%>
			</div>
  
   
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6">
        <div class="form-group ">
            <div class='input-group date' id='datetimepicker6' >
                <label id="busNumberId" class="valid">Start Date</label>
                <input type='text' class="form-control" name="dateFrom" id="timeIn"/>
            
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
           
        </div>
    </div>
     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6" style="display:none">
        <div class="form-group">
            <div class='input-group date' id='datetimepicker7' >
                <input type='text' class="form-control" name="timeOut"  id="timeOut" path="dateTo" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
     
    					
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="routeDiv_Id">
     	<form:select  name="countryCode" path="routeId" id="routeId">
     		<form:option  value="" label=""/>
								<form:option  value="00" label="All"/>
								 <form:options items="${routes}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Routes</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
 	
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="button" onclick="getRouteTraffic()" class="btn btn-warning" value="Get Traffic Report" />
	  				</div>
	  				
	  				
	
	<div class="col-xs-12" id="tabb">
							<div class="transaction-table">
								<div class="table-responsive">

									<table class="table table-bordered table-striped" id="table_id1">
										<thead>
											<tr>

												<th id="header"></th>
												<th>Passenger Count</th>
												<th id="heading"></th>

											</tr>
										</thead>
										<tbody id="datas">
											<%-- <c:forEach items="${allfares}" var="extract">
										   <tr>
											    <td><c:out value="${extract.txnnType}"/></td>
											    <td><c:out value="${extract.txnDate}"/></td>
											    <td><c:out value="${extract.customerCardId}"/></td>
											    <td><c:out value="${extract.routeId}"/></td>
											    <td><c:out value="${extract.tripAmount}"/></td>
											    <td><c:out value="${extract.txnAmount}"/></td>
		                                        <td><c:out value="${extract.busId}"/></td>
		                                        <td><c:out value="${extract.userId}"/></td>
											    									    
											   
											   
										   </tr> 
									  </c:forEach>		 --%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">


				<div id="chartContainer" style="height: 300px; width: 100%;"></div>
				</div>
					 <!--  <script type="text/javascript">
					 var chart = new CanvasJS.Chart("chartContainer", {
							animationEnabled: true,
							theme: "light2", // "light1", "dark1", "dark2"
							title: {
								text: "Data Report"
							},
							subtitles: [{
								text: "Data Analysis",
								fontSize: 16
							}],
							axisY: {
								scaleBreaks: {
									type: "wavy",
									autoCalculate: false
								}
							},
							data: [{
								type: "column",
								indexLabel: "{y}",
								dataPoints: [{"y":0,"label":"Day 1"},{"y":0,"label":"Day 2"},{"y":0,"label":"Day 3"},{"y":0,"label":"Day 4"},{"y":0,"label":"Day 5"},{"y":0,"label":"Day 6"},{"y":0,"label":"Day 7"},{"y":0,"label":"Day 8"},{"y":5,"label":"Day 9"},{"y":4,"label":"Day 10"},{"y":1,"label":"Day 11"},{"y":0,"label":"Day 12"},{"y":0,"label":"Day 13"},{"y":0,"label":"Day 14"},{"y":0,"label":"Day 15"},{"y":0,"label":"Day 16"},{"y":0,"label":"Day 17"},{"y":0,"label":"Day 18"},{"y":0,"label":"Day 19"},{"y":0,"label":"Day 20"},{"y":0,"label":"Day 21"},{"y":0,"label":"Day 22"},{"y":0,"label":"Day 23"},{"y":0,"label":"Day 24"},{"y":0,"label":"Day 25"},{"y":0,"label":"Day 26"},{"y":0,"label":"Day 27"},{"y":0,"label":"Day 28"},{"y":0,"label":"Day 29"},{"y":0,"label":"Day 30"}]
							}]
						});
						chart.render();
						</script>  -->
					
					 </div> 
					
					
</form:form>

		



</body>
</html>