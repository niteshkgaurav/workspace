<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/PinStatus.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pin Status</title>
</head>
<body>
<div>
<form:form id="pinStatusId" name="pinStatusForm" method="post" modelAttribute="pinStatusData" action="${pageContext.request.contextPath}/AdminUI/pinMgmnt/pinStatus">
<table width='100%' border='0' cellspacing='1' cellpadding='0'>
<tr><td height="25" colspan="2"></td></tr>
<tr>
				<td align="center" colspan="2">
				<h3 id="ermsgId" align="center" style="color:red;">${errorMessage}</h3>
				</td>
		</tr>
<tr><td colspan="2" align="center">
	<table width='60%' border='0' class='tableMain' cellspacing='1' cellpadding='0'>
	
	<tr><td colspan="2" align="center" class="mainTableHeader"><spring:message code="lab_pinStatus"/></td></tr>
	<tr><td height="15px"></td></tr>
	<tr><td></td><td></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_serialNo"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="serialNo" placeholder="Serial No." onclick="emptyerror(event,'ermsgId');emptyerror(event,'lab_serialNoErrorId');"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr><td></td><td align="left"><div id="lab_serialNoErrorId"></div></td></tr>
	<tr><td align="right"><input type="button" value="Clear" onclick="clearScreen();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td align="left"><input type="submit" value="Search" onclick="validateSerialNo(event);"/></td></tr>
	<tr><td height="5px"></td></tr>
	<tr>
	
	<td align='right'><spring:message code="lab_pinStatus"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="pinStatus" placeholder="Pin Status"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_denominationValue"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="denomination" placeholder="Denomination"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_portal"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="portal" placeholder="Portal"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_IP"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="ip" placeholder="IP"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_usedDate"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="usedDate" placeholder="Used Date"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_creationDate"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="creationDate" placeholder="Create Date"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_expiryDate"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="expiryDate" placeholder="Expiry Date"/></td>
	</tr>
	<tr><td height="5px"></td></tr>
	<tr>
	<td align='right'><spring:message code="lab_portalTxnStatus"/>&nbsp;&nbsp;:&nbsp;</td>
	<td align='left'><form:input type="text" path="portalTxnStatus" placeholder="Portal Txn Status"/></td>
	</tr>
	<tr><td height="25px"></td></tr>
	</table>
</td></tr>

</table>
</form:form>
</div>

</body>
</html>