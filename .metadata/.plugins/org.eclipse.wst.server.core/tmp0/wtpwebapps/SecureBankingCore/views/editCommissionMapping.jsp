<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commission.js"></script>

<title>CommissionMappingEdit</title>


<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
	
</head>
<body>



	<form:form id="CommissionProductMappingForm"	name="CommissionTemplateCreationForm" method="post"
		modelAttribute="commissionData"
		action="${pageContext.request.contextPath}/AdminUI/commission/editCommissionMappingPost">
	                    	
		 <div class="heading-inner">
		                      <h1 class="pull-left">Commission Product Mapping Edit</h1>
		                      <div class="clearfix"></div>
		                      <hr>
									<div id="sucessMessage"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${successMessage}</p> 
									</div> 
	                    	</div>

		<div id="rootTable" class="row ">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="name">
					<form:input class="selecttag" type="text" path="name" id="tempName"
						onclick="this.setAttribute('value', this.value);"
						onchange="checkName('tempName','CommissionProduct','name','nameError','label_tempName');selecttag('label_tempName','tempName')"
						onfocus="clearmsg();showlabel('label_tempName','nameError');" />
					<label id="label_tempName" class="valid"><spring:message
							code="LABEL_TEMPNAME" /></label> <label id="nameError" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input">
					<form:select class="selecttag" path="productId" id="productId"
						name="productId" onclick="this.setAttribute('value', this.value);"
						value="${commissionData.productName }"
						onchange="selecttag('label_productId','productId');"
						onfocus="clearmsg();showlabel('label_productId','productIdError');">
						<form:option value="" label=" " />
						<form:options items="${ProductMap}" />
					</form:select>

					<label id="label_productId" class="valid"> <spring:message
							code="label_product_type" />
					</label> <label id="productIdError" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input">
					<form:select class="selecttag" id="customerCommissionType"
						name="customerCommissionType" path="customerCommissionType"
						onclick="this.setAttribute('value', this.value);"
						value="${commissionData.customerCommissionType}" placeholder="."
						onchange="getCommission();selecttag('label_customerCommissionType','customerCommissionType');"
						onfocus="clearmsg();showlabel('label_customerCommissionType','customerCommissionTypeError');">
						<form:option value="" label=" " />
						<form:option value="LOAD" label="Load" />
						<form:option value="SALE" label="Sale" />
					</form:select>
					<label id="label_customerCommissionType" class="valid"> <spring:message
							code="LABEL_TEMP_TYPE" /></label> <label
						id="customerCommissionTypeError" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input">
					<form:select class="selecttag" path="commissionId"
						id="commissionId" name="commissionId"
						onclick="this.setAttribute('value', this.value);"
						value="${commissionName}" placeholder="."
						onchange="selecttag('label_commissionId','commissionId');"
						onfocus="clearmsg();showlabel('label_commissionId','commissionIdError');">
						<form:option value="" label=" " />
						<form:options items="${commissionTemplateMap}" />
					</form:select>

					<label id="label_commissionId" class="valid"><spring:message
							code="label_Commission" /> </label> <label id="commissionIdError"
						class="collapse"></label>
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      
	                      		<input type="submit"
								value="Submit" onclick="return validateCommissionMapping(event,'edit');" class="btn btn-warning"/>
	                      </div> 	
					 <div>	</div>
		
	</form:form>
</body>
</html>