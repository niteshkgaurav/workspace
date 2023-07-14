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
<title>Update Gateway</title>
</head>
<body>
<div>
	<form id="updateGatewayForm" name="updateGatewayForm" method="post" 
	action="${pageContext.request.contextPath}/AdminUI/otaservice/updategateway">	
		
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
    	      <div style="text-align:center;" id="statusmsg"><b><font color="red">${statusMessage}</font></b></div>
          	  <div style="text-align:center;" id="statusmsg"><b><font color="green">${successMessage}</font></b></div>
			  <div style="text-align:center;"><b><p id="infomsg"></p></b></div>
	     
               <h1 class="pull-left">Update Gateway</h1>
               <div class="clearfix"></div>
                <hr>
           </div>	                    	
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
         	  <div class="styled-input">
					<form:input id="gatewayNumber" class="selecttag" type="text" path="gatewayNumber" placeholder="."/>
					<label id="label_Gateway"class="valid">Gateway Number</label>
           	  </div>
       		</div>  
       	    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
       	 		<input type="submit" class="btn btn-warning" value="Submit"/>
            </div>
		</form>
	</div>
</body>
</html>