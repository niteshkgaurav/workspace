<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- <%@taglib prefix="spring" uri="http://www.spr ingframework.org/tags"%> --%>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
        $('#datetimepicker6').datetimepicker({minDate: new Date()});
        $('#datetimepicker7').datetimepicker({minDate: new Date()});
/*         $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        }); */
    });
</script>

<script>



function getStops()
{
	
	var route=$("#routeId").val();
	 $.ajax({
		url: "ajax/getStops",
		dataType:'json',
		type: "GET",
		async:false,
		dataType: 'json',
		data: "routeId="+route,
		success:function(response){
			
			
			 var data1=response;
			
			if(data1.length!=0)
				{
				$('#srcStop').empty().append('<option value=""></option>');
			$.each(data1,function(key, value)
	                {
				//var data=value.split("#");
	                    $("#srcStop").append('<option value=' + key + '>' + value + '</option>'); // return empty
	                });
				}
			else
				{
				$('#routeId').empty().append('<option value=""></option>');
				} 
			//====================
				
		}	
	} );
}



function getDstnstops()
{
	var id=$("#routeId").val();
	var srcStop=$("#srcStop").val();
	 $.ajax({
		url: "ajax/getDstStops",
		dataType:'json',
		type: "GET",
		async:false,
		dataType: 'json',
		data: "srcStop="+srcStop+"&routeId="+id,
		success:function(response){
			
			
			 var data1=response;
			
			if(data1.length!=0)
				{
				$('#destStop').empty().append('<option value=""></option>');
			$.each(data1,function(key, value)
	                {
				//var data=value.split("#");
	                    $("#destStop").append('<option value=' + key + '>' + value + '</option>'); // return empty
	                });
				}
			else
				{
				$('#destStop').empty().append('<option value=""></option>');
				} 
			//====================
		
		
		}	
	} );
}

function getCalculatedFare()
{
	var id=$("#routeId").val();
	var srcStop=$("#srcStop").val();
	var destStop=$("#destStop").val();
	 $.ajax({
		url: "ajax/getTicket",
		dataType:'json',
		type: "POST",
		async:false,
		dataType: 'json',
		data: "srcStop="+srcStop+"&routeId="+id+"&destStop="+destStop,
		success:function(response){
		
			var fare=response;
			
			
			var routeName = $("#routeId option:selected").text();
			var sourceName = $("#srcStop option:selected").text();
			var detination = $("#destStop option:selected").text();
	        var ticketNo=$("#ticketNo").val();
			
			$("#datas").html("Ticket Number : "+ticketNo+" ,Route Name ="+routeName+" ,Source Name= "+sourceName+" ,Destination Name"+detination+", Fare Rs -"+fare);
			
			/* if(!fare.length=0){
				 $("#calculatedFare").append(fare); 
			} */
		}	
	} );
}

function getGeneratedNumber()
{
	
	var dateTo=$("#date").val();
	 $.ajax({
			url: "ajax/ticketNo",
			dataType:'json',
			type: "POST",
			async:false,
			dataType: 'json',
			data: "dateTo="+dateTo,
			success:function(response){
				var info=response;
				$('#ticketNo').val(info);
				
		}		
	 
	} );
}

        </script>
        
        <script>
$(document).ready(function(){
	$('#ticketNo').hide();
});
</script>

</head>
<body>
<form:form id="frm1"  method="post" modelAttribute="faresmodel" action="${pageContext.request.contextPath}/AdminUI/generateTicket/getTicket"  onsubmit="greeting()"> 
      <div class="heading-inner "> 
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Ticket Generator</h1>
	                      <div class="clearfix"></div>
						
						
				  </div>
				  
				  <div align="center"> ${msg}
				  </div>  
  
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
   &nbsp;
   </div>
   
   
     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6">
        <div class="form-group ">
            <div class='input-group date' id='datetimepicker6' >
               <input type='text' class="form-control" name="dateTo" id="date" path="dateTo"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
           
        </div>
    </div>
   
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="routeDiv_Id">
      	<form:select  name="countryCode" path="routeId" id="routeId" onchange="getStops()" onclick="getGeneratedNumber()">
								<form:option  value="" label=" "/>
								 <form:options items="${routes}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Routes</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="depot_divId">
     	<form:select  name="countryCode" path="srcStop" id="srcStop"  onchange="getDstnstops()" onclick="removeHasError('depot_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${stops}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Source Stop</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   
     
 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="depot_divId">
     	<form:select  name="countryCode" path="destStop" id="destStop" onchange="getCalculatedFare()" onclick="removeHasError('depot_divId')">
								<form:option  value="" label=" "/>
								 <form:options items="${stops}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Destination Stop</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
   

		         
   
    
    <input type="text" id="ticketNo" ></input>

<!-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
			<div id="District" class="styled-input">
				<input type="text" id="calculatedFare" path="calculatedFare" readonly="true" />
				<label class="valid">Calculated Fare : </label> <label
					id="lab_districtErrorId" class="collapse"></label><span></span>

			</div>
		</div> -->
   
  <!-- 
	  	<input id="submitId" type="button" class="btn btn-warning"   value="Generate Ticket" />
	  				 -->
  

<div class="container">
  
  <!-- Trigger the modal with a button -->
   <div  class="col-xs-6 col-sm-6 col-md-6 col-lg-7 mt text-center" >
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" >Generate Ticket</button>
</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p id="datas">Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

				
</form:form>

</body>


</html>