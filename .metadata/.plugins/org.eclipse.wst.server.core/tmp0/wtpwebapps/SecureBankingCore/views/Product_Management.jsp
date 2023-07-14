<%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ page import="java.util.*" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script> 
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/Product_Management.js></script>
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Product_Management</title>

</head>
<body>
<form:form id="productCreationForm1" name="productCreationForm1" method="post"  modelAttribute="productManagementData" action="${pageContext.request.contextPath}/AdminUI/sysSetting/createProduct" enctype="multipart/form-data">
<%-- <div id="after_addProduct_mess"><b><font color="red">${message}</font></b></div>--%>
<div id="manadatory_message"><b><font color="green">${message}</font></b></div> 
<div id="after_edit_product_mess"><b><font color="red">${editProductMessage}</font></b></div>
<div style="margin: 5px;"><b><font color="red"><span id="statusmess"></span></font></b></div>
<div scrollable="true">
<div style="margin: 20px;">
<table height="50%" width="60%" align="center" style="border-style:ridge;">
<!-- <tr height='15'><td colspan='2' valign='middle'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:defaultsubmit('ssmgmt')">System Settings</a>&nbsp;&nbsp;>&nbsp;&nbsp;Product Category Management&nbsp;&nbsp;	<td height='20' rowspan='2' align='right'><img border='0'  src="image/cardowner/"   width='100' height='60' /></td></tr> -->

<tr style="color: white;" bgcolor="#c10000"><th colspan='2'  align='center'><spring:message code="PRODUCT_MGMT"/></th></tr>
				<tr><td height='20'>&nbsp;</td></tr> 
				
				<tr>
					
					<td class='tableLabel' align="left"><font color="red">*&nbsp;</font><spring:message code="lable_productName"/>&nbsp;:&nbsp;</td>
					<td align="left"><form:input type='text' id="lable_productName" path="name" name='newsubcategoryname' size='40' maxlength='40'  class='formField' onblur = "javascript:return Category_check()" value=''  onkeypress="javascript:return validateSpecialCharacter(event,'errmsgProductName','lable_productName')" ></form:input></br><span id="errmsgProductName" style="color: red"></span></td>
					<td></td>
				</tr>
				<tr><td align="left"><div id="productNameErrorId"></div></td></tr>
				<tr>
					
					<td  class='tableLabel' align='left'><font color="red">*&nbsp;</font><spring:message code="lab_Product_Type"/>&nbsp;:&nbsp;</td>
					<td align='left' ><form:input type='text' id="lable_productType" path="productType" name='productType' size='40' maxlength='8' class='formField' value=''  onkeypress="javascript:return validateSpecialCharacter(event,'errmsgByBriefDesc','lable_productBriefDesc')"></form:input></br><span id="errmsgByBriefDesc" style="color: red"></span></td>
					
				</tr>
				<tr><td></td><td align="left"><div id="productTypeErrorId"></div></td></tr>
				<tr>
					<td class='tableLabel' align='left'><font color="red">*&nbsp;</font><spring:message code="lab_Product_subType"/>&nbsp;:&nbsp;</td>
					<td  align='left' ><form:input type='text'  id="lable_productSubType"  name='productSubType' path="productSubType" value='' size='40' maxlength='3'  class='formField' style='width:50' onkeypress="javascript:return validateSpecialCharacter(event,'errmsgByFullDesc','lable_productFullDesc')"></form:input><span id="errmsgByFullDesc" style="color: red"></span></td>
					
				</tr>
				<tr><td></td><td align="left"><div id="productSubTypeErrorId"></div></td></tr>
				 
				<tr height='15'>
					<td colspan='2' align='right' ><input type='submit' value="Submit"  src='${pageContext.request.contextPath}/images/Submit.gif' id='addBtn' onClick="validateProductfrom();" onMouseOver = "submitBtn.src = 'image/ui/Add_Rollover.gif'" onMouseOut = "submitBtn.src = 'image/ui/Submit.gif'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				
				</table>
				

</div>	
<div style="margin: 20px;">

<table border="1" cellpadding="0" cellspacing="0" height="50%" width="60%" align="center" id="abc" >
<c:if test="${not empty productList}">
<tr style="color: white;" bgcolor="#c10000">
<th><span><spring:message code="lab_Product_Name"/></span></th>
<th><span><spring:message code="lab_Product_Type"/></span></th>
<th><span><spring:message code="lab_Product_subType"/></span></th>
 <th><span><spring:message code="lab_Product_Code"/></span></th>
<th><span><spring:message code="lab_Action"/></span></th>
</tr>

<c:forEach items="${productList}" var="product" varStatus="status">
      <tr>
      		<td>${product.name}</td>
          	<td>${product.productType}</td>
          	<td>${product.productSubType}</td>
          	<td>${product.productCode}</td>
          
          <td align="center">
             
             <a href="${pageContext.request.contextPath}/AdminUI/sysSetting/editProduct?productId=${product.id}"><img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor:hand' align="center"/></a>
         
          </td>
      </tr>

</c:forEach>
 
</c:if>
</table>

</div>			
</form:form>


</body>
</html>