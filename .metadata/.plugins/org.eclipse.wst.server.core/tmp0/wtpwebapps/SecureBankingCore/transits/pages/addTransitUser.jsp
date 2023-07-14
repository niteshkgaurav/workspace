
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



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addBus.js"></script>
 
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	

<title>Transit System</title>
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

<script type="text/javascript">
function deleteRecord(id){
    var doIt=confirm('Do you want to delete the record?');
  if(doIt){
	  $.ajax({
	        type: "GET",
	        url: "deleteBus.html",
	    	data :"busId="+id,
	        success: function (response) {
			  	//alert("submitted form");
			  	window.location.href="addBus";
	        },
	        error: function (result) {
	        	alert("Submitted form failed");
	        }
	    });  
    }
  else{

    }
}

function deleteBus(id) {
    if (confirm("Do you really want to delete selected bus?"))
        window.location.href = "deleteBus?busId="+id;
    else
        return false;
}

</script>
<script>
$(document).ready(function(){
	$('#table_id').DataTable({
		"scrollY":"350px",
		"scrollX":"250px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>



 </head>  
 <body>
	 <div id="mainbody" class="container-fluid" >
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<section class="white">
	       <div class="heading-inner">
	         <h1>Add Bus Data</h1>
	         <div class="clearfix"></div>
	         <hr>
	       </div>	  
       <div class="row">	
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
            <p id="statusmsgId"><font color="">${message}</font></p>
          </div>       	
			  <form:form method="POST" action="${pageContext.request.contextPath}/AdminUI/userController/createUser" modelAttribute="userCreation">
		
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
						<div  class="styled-input" >
							 <span></span> 
						</div>	      	
			      </div>
		
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="firstName" path="firstName"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')"   />
						 <label id="busNumberId" class="valid">*First Name</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="lastName" path="lastName"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')"   />
						 <label id="busNumberId" class="valid">*Last Name</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="email" path="email"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')"   />
						 <label id="busNumberId" class="valid">*E-Mail</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="mobileNumber" path="mobileNumber"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')"   />
						 <label id="busNumberId" class="valid">*Mobile Number</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="DivIDbusNumberId" class="styled-input">
						<form:input id="password" path="password" type="password" maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('busNumberId','busNumber');" 
						 	onfocus="removeHasError('DivIDbusNumberId');showlabel('busNumber','busNumberErrorId')"   />
						 <label id="busNumberId" class="valid">*Password</label>
						 <label id="busNumberIdErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
		
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		            <button type="submit" onclick="return validate(event);" class="btn btn-warning">Submit</button>
		          </div>
		
			      </form:form>
			      
			      <a href="${pageContext.request.contextPath}/AdminUI/userController/getMyTickets?type=mytickets">Get My Ticket List!!</a>
			      
			      
			       <a href="${pageContext.request.contextPath}/AdminUI/userController/getMyTickets?type=mytrips">Get My trips List!!</a>
			      
						</div>					        		 
					</div>
				</div>
		</div>

	</div>
 </body>  
</html>