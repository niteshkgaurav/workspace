<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
	<script src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script>

function validate(event)
{
	//$(this).parent().find('label').text();
	var flag=true;
	var num=1;
	$('.test').each(function() {
		    if(this.value == '' || $(this).parent().find('label').text()!='Available') {
		      flag = false;
		      $(this).val("");
		      $(this).parent().find('label').html("<font color='red'>Enter valid external Number</font>");
			  
		    }
		    num++;
		  });

	
	if( num==1)
	{	
		$("#status").text("No Tills Selected");
		flag=false;
	}
	if(flag==false )
		{
		//alert("stop")
		event.preventDefault();
		}
}
function checkExternalNo(id)
{
	$("#status").text("");
	var externalNo=$("#externalNo"+id).val();
	$.ajax({
		url:"ajax/testExternalNo",
		method:"POST",
		data: "externalNo="+externalNo,
			 success: function(response) {
				 if(response==true)
					 {
					 
					/*   $("#"+id).addClass('okk');
					  $("#"+id).removeClass('okkDefault'); */
					 $("#label"+id).html("<font color='green'>Available</font>");
					 }
				 else
					 {
					/*   $("#"+id).addClass('okkDefault');
					  $("#"+id).removeClass('okk'); */
					 $("#label"+id).html("<font color='red'>Not Available</font>");
					 }
				 
	 },
			  error: function(e) {
				
			  }
			});
		


}

function getTills()
{
	$("#status").text("");
	$("#status1").text("");
var merchantId=$("#merchantId option:selected").val();

$.ajax({
	 url: 'ajax/getOptionTills',
	  type: 'POST',
	  data: 'merchantId='+merchantId,
	  dataType: "json",
	  success: function(response) {
		  var datas=response;
		  $("#data").empty();
		  var num=1;
		  //alert(data.length);
		  $.each(datas, function(key, val) {
			  //alert(key+ " *** " + val);
			/*   $("#data").append("<tr><td><input type='hidden' name='till' value='"+key+"-"+val+"' /><label>"+key+"-"+val+"</label></td><td> <input  type='text'  id='externalNo"+num+"' name='externalNo' class='test'  onchange=checkExternalNo('"+num+"') /><label id=label"+num+" label></label></td></tr>");
			 */
		 $("#data").append("<tr><td> <input  type='text'  id='externalNo"+num+"' name='externalNo' class='test'  onchange=checkExternalNo('"+num+"') /><label id=label"+num+" label></label></td></tr>");
			num++;
		  });
		  if(num==1)
			  {
			  $("#data").append("<tr ><td colspan='2'>No Data</td></tr>");
			  }
		/*   for(var i=0;i<response.length();i++)
		  $("data").append("<tr><td><input type='text' disable='true' value="+)
		 */  
		  
	  },
	  error: function(e) {
		
	  }
});
}
</script>
<style>
/* .okk{
 background-color: #98FB98;
}
.okkDefault{
 background-color: #ffb2b2;
}
 */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issuance</title>
</head>
<body>

	<form:form  name="" method="POST" modelAttribute="merchantData" action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/getMerchantIssuance">
		
          			 <div class="heading-inner">
	         <h1>Merchnat Issuance</h1>
	         <div class="clearfix"></div>
	         <hr>
	          <div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
	          												   <p class="text-success" id='status1'>${sucessMessage}</p> 
				           			
				                                           <p class="text-danger" id='status'>${errorMessage}</p> 
									 
										</div>
	       </div>	  
	       	   
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="merchnatDiv">
     	<form:select  id="merchantId" path="merchantId"  onclick="removeHasError('merchnatDiv')" onchange="getTills();">
								<form:option  value="" label=" "/>
								 <form:options items="${merchants}" /> 
								</form:select>
								<label id="merchantLabel" class="valid">*&nbsp;Merchants</label> <label
								id=merchantErrorId class="collapse"></label>
								
    </div>
   </div>
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
   &nbsp;
   </div>
          					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<h1>No. of Tills</h1> 
				    <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table table-bordered table-striped"  >
							<thead><tr>
								<!-- <th>Name</th> -->
								<th>External Number</th>
							</tr>
							</thead>
							<tbody id="data">
							<tr ><td colspan='2'>No Data</td></tr>
							
							</tbody>
										</table>
									</div>
								</div>
</div>
   </div>
   
   	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" >
					<input type='submit'class="btn btn-warning"  value="Submit" onclick="return validate(event);">
					</div>
 
	</form:form>
</body>
</html>