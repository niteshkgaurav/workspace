<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />

<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>



<title>product vendor</title>
<script>


   // window.onload = showVendor();
  //  window.location.reload();
</script>
<style type="text/css">
li {
	color: black;
}
</style>


<script>
function validate()
{
	var a=$('productId0').val();
	var b=$('#vendorId').val();
	if($('#productId0').val()==''){

		$('#divID_productType').addClass('has-error');
		event.preventDefault();
		return false;
	}
	if($('#vendorId').val()==''){

		$('#divID_vendorId').addClass('has-error');
		event.preventDefault();
		return false;
	}

}
</script>

</head>
<form:form id="product_vendor" method="post" modelAttribute="inventoryMgmtData" 
	action="${pageContext.request.contextPath}/AdminUI/sysSetting/updateproductvendormap">
	<input type="hidden" value="${pageContext.request.contextPath}"
		name="linkViewOrder">
	<%-- <form:hidden path="groupCode" value="${groupCode}" id="groupCode" />
 --%>
	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			Product Mapping
		</h1>
		<div class="clearfix"></div>
		<hr>

		<c:if test="${message!=''}">
			<div id="msgId"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p>
					<font color="green">${message}</font>
				</p>


			</div>
		</c:if>

	</div>



<form:hidden path="id"/>

		<div id="productTypeDiv">

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="divID_productType" class="styled-input">
			
					<form:select 
					path="productId" id="productId0" name="productId" class="selecttag" onfocus="removeHasError('divID_productType')"
					onChange="selecttag('label_productType','productId0');"
					onclick="clearmsg('ProductErrorIdD');this.setAttribute('value', this.value);;">
					<form:option value="" label=" " />
					<form:options items="${ProductMap}" />
				</form:select>
					<label id="label_productType" class="valid">Product</label> 
					<label id="productTypeErrorId" class="collapse"></label>
				</div>
			</div>

		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="vendor">
			<div id="divID_vendorId" class="styled-input">
				 <form:select name="vendorId" path="vendorId" class="selecttag"
					onfocus="removeHasError('divID_vendorId')"
					onclick="clearSmsg(msgId);this.setAttribute('value', this.value);"
					value="" onchange="selecttag('label_vendorId','vendorId');">
					<form:option value="" label=" " />
					<form:options items="${vMap}" />
				</form:select> 
				<label id="label_vendorId" class="valid"><spring:message
						code="LABEL_VENDOR" /></label> <label id="VendorErrorId" class="collapse"></label>
			</div>
		</div>

	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		<!-- <input type="button" value="Submit" class="btn btn-warning" 
			 onclick="return validatePoRaise();" /> -->
			 	 <input type="submit" value="Submit" class="btn btn-warning"  onclick="validate();"
			 /> 
	</div>


 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>


</html>