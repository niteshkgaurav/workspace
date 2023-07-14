<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PinGeneration.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/blockUI.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">   	
<title>Pin Generation</title>
<script>
  $(function() {
	   var pickerOpts = {
	            showOn: "button",
	            buttonImage: "${pageContext.request.contextPath}/images/datepicker2.png",
	       
	            changeMonth: true,
	            changeYear: true,
	            yearRange: '2016:2018',
	            dateFormat: 'yy-mm-dd'
	            
	        };
    $( ".datepick" ).datepicker(pickerOpts);
  
  });
  
  $(document).ready(function() {
		$('#waitBtnId').hide();
 	 	$('#submitId').show();
	});
	
	  </script>
</head>
<body>
<div id='loadingmsg' style='display: none;'>Redirecting, please wait...</div>
<div id='loadingover' style='display: none;'></div>
<form:form id="pinGenerationForm" method="post" modelAttribute="pinGenerationData" action="${pageContext.request.contextPath}/AdminUI/pinMgmnt/pinGeneration">
<div>
	<table width='100%' border='0' cellspacing='1' cellpadding='0' >
	<tr><td height="20" colspan="2"></td></tr>
	<tr><td></td></tr>
	<tr>
				<td align="center" colspan="2">
				<h3 id="msgId" align="center" style="color:green;">${successMessage}</h3>
				<h3 id="ermsgId" align="center" style="color:red;">${errorMessage}</h3>
				</td>
		</tr>
	<tr><td  colspan="2" align="center" >
		<table width='70%' border='0' cellspacing='1' cellpadding='0' >
				<tr>
					<td align="right"><font color='red'>*&nbsp;</font><spring:message code="lab_templateName"/>&nbsp;&nbsp;:&nbsp;</td>
					<td align="left"><form:input type="text" path="templateName" placeholder="Template Name" onchange="duplicateCheck('lab_templateNameErrorId');" onclick="emptyerror(event,'lab_templateNameErrorId');emptyerror(event,'msgId');emptyerror(event,'ermsgId');"/></td>
				</tr>
				<tr><td></td><td align="left"><div id="lab_templateNameErrorId"></div></td></tr>
				<tr>
					<td align="right"><font color='red'>*&nbsp;</font><spring:message code="lab_templateDescription"/>&nbsp;&nbsp;:&nbsp;</td>
					<td align="left"><form:input type="text" path="templateDescription" placeholder="Template Description" onclick="emptyerror(event,'lab_templateDescriptionErrorId');"/></td>
				</tr>
				<tr><td></td><td align="left"><div id="lab_templateDescriptionErrorId"></div></td></tr>
				<tr><td height="20" colspan="2"></td></tr>
				<tr><td colspan="2" align="center"> 
					<table width='85%' class='tableMain' bordercolor='#000000' cellspacing='1' cellpadding='0' border="1" id="pinTableId">
					<tr class="mainTableHeader">
						<th align="center"><input type="checkbox" id="alldenominator_0" value="0" onclick="selectAllFunc();"/></th><!-- <spring:message code="lab_select"/> -->
						<th align="center"><spring:message code="lab_denominationValue"/></th>
						<th align="center"><spring:message code="lab_quantity"/></th>
						<th align="center"><spring:message code="lab_expiryDate"/></th>
					</tr>
					<c:forEach var="listVar" items="${pinGenerationData.denominatorData}">
						<tr>
							<td align="center" width="10%"><form:checkbox id="denominator_${listVar.key}" path="denominator" value="${listVar.key}" onclick="setDisable('denominator_${listVar.key}','${listVar.key}');"/></td>
							<td align="center">${listVar.value}</td>
							<td align="center"><form:input id="quantity_${listVar.key}" type="text" path="quantity" maxlength="5" placeholder="Quantity" onclick="emptyerror(event,'lab_quantityErrorId_${listVar.key}');" onkeyup="quantityCheck(event,'quantity_${listVar.key}','lab_quantityErrorId_${listVar.key}');" onkeypress="onlyNumric(event,'lab_quantityErrorId_${listVar.key}');" style="width:160px;" disabled="true" /></td>
							<td align="center"><form:input id="expiryDate_${listVar.key}" class="datepick" path="expiryDate" disabled="true" type="text" style="width:160px;height:18px;" placeholder="Choose Expiry Date" onclick="emptyerror(event,'lab_expiryErrorId_${listVar.key}');" readonly="true" onfocus="emptyerror(event,'lab_dobErrorId')"/></td>
						</tr>
						<tr><td colspan="2"></td><td align="center"><div id="lab_quantityErrorId_${listVar.key}"></div></td><td align="center"><div id="lab_expiryErrorId_${listVar.key}"></div></td></tr>
					</c:forEach>
					</table>
				</td></tr>
				<tr>
				<td align="center" colspan="2">
				<h3 id="submitId" align="right" class="login button"><input type="submit"  value="Submit" onclick="pinGenerationValidate(event);"/>&nbsp;&nbsp;&nbsp;</h3>
				<h3 id="waitBtnId" align="right"><input type="button" value="Please Wait"/>&nbsp;&nbsp;&nbsp;</h3>
				</td>
		</tr>
				<!-- <tr><td colspan="2" align="right"><input id="submitId" type="submit"  value="Submit" onclick="pinGenerationValidate(event);"/>&nbsp;&nbsp;&nbsp;</td></tr>
				<tr><td  colspan="2" ><div id='spinnerId' style='display:none'>
	  		<table border="1" cellpadding='0' rules='none' width='100%' id='spinnerTableId'>
	  	</table></div></td></tr> -->
				<!-- <tr><td colspan="2"><div id="spinnerIds"></div></td></tr> -->
		</table>
	</td></tr>
	</table>
</div>
</form:form>
</body>
</html>