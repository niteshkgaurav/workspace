<%@page import="java.io.PrintWriter"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 
<div> <h1>${statusMessage}<h1> </div>
<c:if test="${passwordexpire>0}">
<script type="text/javascript">

   $(document).ready(function()  {
	   $('#divId').dialog({
			width: 350,
			height: 200,
		
			title: '\ Confirmation',
			
			buttons : {
				"OK" : function ()
				{	
					var id=1;
					
					/* window.location="http://172.16.16.64:8080/securebanking/AdminUI/UserMgmt/changePassword1"; */
					/*  window.location.href = "AdminUI/UserMgmt/changePassword1"; */
				  $.ajax({
					        type: "POST",
					        url: "validatepasswordexpire",
					    	data :"id="+id,
					        success: function (response) {
					        	window.location.href = "/securebanking/AdminUI/UserMgmt/changePassword1";
					        },
					        error: function (result) {
					        	
					        }
					    });
					 
					 
				
				$(this).dialog("close");
					
				},
	   "CANCEL" : function(){
		   $(this).dialog("close");
	   }
			}
	   });
	   
        

       });
</script>
</c:if>
</head>

<body>
<div id='divId' align='center' style="display:none">
<p> Your Password Is Going To Expire In Next ${passwordexpire} Days </p>
<p>        Please Consider To Change Password      </p>
</div>
	</body>
	
	</html>
 


