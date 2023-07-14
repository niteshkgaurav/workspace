<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.simplemodal.js"></script>
<link rel="stylesheet" href=${pageContext.request.contextPath}/css/admin_POPUP.css />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/RetailerRegistation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/HostSimVersionList.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
</head>
<body>


<form:form id="masterVersionOrderSheet" method="post" modelAttribute="MasterVersionOrderSheetData">



<table  width='100%' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>
      
      <tr>
      <td height="15">
      </td>
      </tr> 
      
		<tr><td height="15"></td></tr>
      <tr>  
         <td align="center"><table  width='60%' class='tableMain' cellspacing='1' cellpadding='0' border='0' bordercolor='#000000'>
               

                     <tr style="color: black;" bgcolor="#1682ba"> <th colspan='2'  align='center'><spring:message code="lable_ModifiedHostSimVersionlist"/></th> </tr>   
                        <tr>
			            <td class='tableLabel' align='right' width="30%"><font color=red>*&nbsp;</font><spring:message code="lable_HostName" />:&nbsp;&nbsp;</td>
			             <td align='left'><form:select class='formField' path="masterVersionId"  id="lable_HostName" onchange="emptyerror(event,'lable_HostName_ErrorId');onchangehost(event,'lable_HostName','lable_HostNameErrorId');">
					    <form:option value="" label="<-Select->"/>  
					     <form:options items="${masterVersionList}" itemLabel="name" itemValue="id" multiple="false" />
				      </form:select></td>
		           </tr>
                 <tr><td></td><td><div id="lable_HostName_ErrorId"></div></td></tr>
               
               <tr height='15'>
            	<td colspan='2' class='login button' align="right"><input type="submit" value="submit" onclick="return validateHSVListPage('lable_HostName_ErrorId');" /></td>
            </tr>

</table>
</td>
</tr>
<tr>
<td align="center">  
</td>
</tr>
<tr><td height="285" colspan="2">&nbsp;</td></tr>
</table>
</form:form>








</body>
</html>