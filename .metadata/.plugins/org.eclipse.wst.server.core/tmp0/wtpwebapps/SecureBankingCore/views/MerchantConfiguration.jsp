 <%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src=${pageContext.request.contextPath}/json/json.js></script>
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
	<script type="text/javascript"	src=${pageContext.request.contextPath}/js/MerchantConfiguration.js></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#mmidDIV').hide();
		$('#bankDIV').hide();
		$('#ccDIV').hide();
		$('#walletDIV').hide();
		
		
	});
	
  </script>
</head>
<body>

<form:form id="merchentConfig"  method="post"  modelAttribute="merchentData" >
 

 
 <table width='100%' border='0' align='center' cellspacing='0' 	cellpadding='0' bordercolor='#eee' >
 <tr><th><font color='green'>${statusMessage}</th></tr>
		<tr><td align="center" id="notMatchMessage"> </td></tr>
		<tr>
			<td height="20"></td>
		</tr>
		<tr><td align="center">
  <table id="rootTable" width="60%"  align="center" style="border-style:ridge;" class="tableMain">
 <tr>
  <td>
  <table>
  <tr>
  
      <td align="right"><spring:message code="lab_MerchantMobile"/></td>
     <%--  <td><form:select path="mobile" items="${merchentData.merchantMobile}"/></td> --%>
     <td> <form:select id="lab_account_type" path="mobile">
                                             <form:options items="${merchentData.merchantMobile}"/>
                                        </form:select></td>
   </tr>
   
   <tr>
   <td align="right"><spring:message code="lab_MerchantCode"/></td><td><form:input type="" path="merchantCode" id="merchantCode" onkeypress="emptyerror(event,'lab_MerchantCodeErrorId');"/></td>
   </tr>
    <tr><td></td><td align='left'><div id='lab_MerchantCodeErrorId' align='left'></div></td></tr>
   
   <tr><th><font color='red'>*&nbsp;</font><spring:message code="lab_MapWith"/></th></tr>
   
  <%--  <tr>
  <th><td><div id="instrument"><form:radiobuttons path="instrument" items="${merchentData.financialInstrument}"  value="${merchentData.financialInstrument}" onclick="return getRaioTextValue();"/></div></td></th>
  </tr> --%>
  
  
  <tr><td id="instrumentID">
  <c:forEach items="${merchentData.financialInstrument}" var="contactMap" varStatus="status">
        <tr>
          <td></td>   <td align="left"><form:radiobutton  id="${contactMap.value}"  path="" name="instrument"  value="${contactMap.key}"   onclick="return getRaioTextValue('${contactMap.value}');"/>${contactMap.value} </td>
           
        </tr>
    </c:forEach>
    </td>
    <td></td> <td id="instrumentErrorId"></td>
  </tr>
 
   <!-- <tr>
   <td colspan="4" align="right"><input type="submit" value="submit" onclick="return validateMerchantPage();"/></td>
   </tr> -->
   </table>
   
   
   <table>
<tr>
   <td align="left" id="mmidDIV" ><spring:message code="lab_mmid"/><form:input type="" path="mmid" id="mmid" onkeypress="emptyerror(event,'lab_MerchantCodeErrorId');"/>
   </td>
    <td></td> <td id="mmidErrorId"></td>
   </tr>
   
   
   <tr><td id="bankDIV">
   <spring:message code="lab_bankACC"/><form:input path="bankAcc" id="bankAcc"/>
   <spring:message code="lab_ifsc"/><form:input type="" path="ifsc" id="ifsc" onkeypress="emptyerror(event,'lab_MerchantCodeErrorId');"/>
   </td></tr>
   <tr>
   <tr><td></td><td align='left'><div id='bankAccErrorId'></div></td></tr>
    <td id="walletDIV">
  
      <spring:message code="lab_wallet"/>
     <form:select id="lab_wallet" path="walletId">
                                             <form:options items="${merchentData.merchantWallet}" />
                                        </form:select>
   </td>
   </tr>
   
   <tr id="ccDIV"><td  align="left">
  <spring:message code="lab_cardNo"/><form:input type="" path="cardNo" id="cardNo"/>
   <spring:message code="lab_cardHolderName"/><form:input type="" path="cardHolderName" id="cardHolderName" />
   <spring:message code="lab_exDate"/>  <form:select id="dates" path="dates"> <form:options items="${merchentData.date}" /> </form:select>
                 
                  <form:select id="yyyy" path="yyyy" >
                 <form:options items="${merchentData.yy}"  />
                  </form:select>
                
  
	  			
   </td></tr><br></br>
   <tr><td align='left'><div id='ccErrorId'></div></td></tr>
   
</table>
   
    <tr>
   <td colspan="4" align="right"><input type="submit" value="submit" onclick="return validateMerchantPage();"/></td>
   </tr>
   </td>
   </tr>
</table>
</td></tr>


</table>


</form:form>
</body>
</html>