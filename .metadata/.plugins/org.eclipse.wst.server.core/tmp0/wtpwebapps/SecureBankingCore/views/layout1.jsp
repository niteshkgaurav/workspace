<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/json/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
 
 <script type="text/javascript">
 </script>
 
</head>
    <body>
    	        
   <div align="center"  >
   
     <table  style="height: 100%;"  width='100%' > 
	  <tr>
	    <td colspan="2" height="40" ><tiles:insertAttribute name="header" /> </td>
	  </tr>
	  <tr>
	    <%-- <td  valign="top" bgcolor="#5d6065" width='18%' height="580"><tiles:insertAttribute name="menu" /> </td> --%>
	    <td width="100%" height="560" valign="top" align="center"><tiles:insertAttribute name="body" /></td>
	  </tr>
	  <tr>
	    <td colspan="2" height="30"> <tiles:insertAttribute name="footer" /></td>
	  </tr>      
	</table> 
      </div>  
    </body>
</html>