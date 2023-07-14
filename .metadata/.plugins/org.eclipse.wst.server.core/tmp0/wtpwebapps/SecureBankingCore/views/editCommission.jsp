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
	<script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/commission/getEditCommissionList');
</script>
	
<title>CommissionTemplate</title>


<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>

</head>
<body >



	<form:form id="CommissionTemplateCreationForm"	name="CommissionTemplateCreationForm" method="post"
		modelAttribute="commissionData"
		action="${pageContext.request.contextPath}/AdminUI/commission/editCommissionPost">
		
		
		<div class="heading-inner ">
		                      <h1 class="pull-left">Edit Commission Template</h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                 	
		                      	<div id="errorstatusMessage" style ="margin-bottom:12px;"
							class="has-success  col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
						<p>${errorMessage}</p>
						
				</div>
	                    	</div>
	                    	<div id="rootTable" class="row">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="name">

					<form:input class="selecttag" type="text" path="name" id="tempName"
						onclick="emptyerror(event,'nameError');"
						onchange="checkName('tempName','CommissionTemplate','name','nameError','label_tempName');selecttag('label_tempName','tempName')"
						onkeypress="emptyerror(event,'nameError');"
						onfocus="removeHasError('name');showlabel('label_tempName','nameError');" />
					<label id="label_tempName" class='valid'><spring:message
							code="LABEL_TEMPNAME" /></label> <label id="nameError" class="collapse"></label>
				</div>
			</div>
		
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="commission-input">
					<form:select class="selecttag" path="senderCommDesc"
						id="customerCommission"
						onclick="emptyerror(event,'customerCommissionError');this.setAttribute('value', this.value);"
						value="" 
						onkeypress="emptyerror(event,'customerCommissionError');"
						onchange="selecttag('label_customerCommission','customerCommission');changeAmountAndPercentage();"
						onfocus="removeHasError('commission-input');showlabel('label_customerCommission','customerCommissionError');">
						<form:option value="" label=" " />
						<form:option value="AMOUNT" label="Amount" />
						<form:option value="PERCENTAGE" label="Percentage" />
					</form:select>

					<label id="label_customerCommission" class='valid'><spring:message
							code="LABEL_COMMISSION" /></label> <label id="customerCommissionError"
						class="collapse"></label>
				</div>
			</div>	
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input"  id="host-input">
					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="hostCommission" id="hostCommission"
						onclick="emptyerror(event,'hostError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_hostCommission','hostCommission')"
							 onkeyup="addCommission();"
						onfocus="removeHasError('host-input'); showlabel('label_hostCommission','hostError');emptyerror(event,'hostError')" />
					<label id="label_hostCommission" class='valid'><spring:message
							code="label_hostCommission" /></label> <label id="hostError" class="collapse"></label>
				</div>
			</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="dist-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="distCommission" id="distCommission"
						onclick="emptyerror(event,'distError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_DistCommission','distCommission')"
							 onkeyup="addCommission();"
						onfocus="removeHasError('dist-input');showlabel('label_DistCommission','distError');emptyerror(event,'distError')" />
					<label id="label_DistCommission" class='valid'><spring:message
							code="label_DistCommission" /></label> <label id="distError" class="collapse"></label>
				</div>
			</div>
		
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="subDist-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="subDistCommission" id="subDistCommission"
						onclick="emptyerror(event,'subDistError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_SubDistCommission','subDistCommission')"
							 onkeyup="addCommission();"
						onfocus="removeHasError('subDist-input');showlabel('label_SubDistCommission','subDistError');emptyerror(event,'subDistError')"/>
					<label id="label_SubDistCommission" class='valid'><spring:message
							code="label_SubDistCommission" /></label> <label id="subDistError" class="collapse"></label>
				</div>
			</div>
		
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="agent-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="agentCommission" id="agentCommission"
						onclick="emptyerror(event,'agentError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_AgentCommission','agentCommission')"
							 onkeyup="addCommission();"
						onfocus="removeHasError('agent-input');showlabel('label_AgentCommission','agentError');emptyerror(event,'agentError')" />
					<label id="label_AgentCommission" class='valid'><spring:message
							code="label_AgentCommission" /></label> <label id="agentError" class="collapse"></label>
				</div>
			</div>
				
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="bank-input">
					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="bankCommission" id="bankCommission"
						onclick="emptyerror(event,'bankError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_BankCommission','bankCommission')"
							 onkeyup="addCommission();"
						onfocus="removeHasError('bank-input');showlabel('label_BankCommission','bankError');emptyerror(event,'bankError')" />
					<label id="label_BankCommission" class='valid'><spring:message
							code="label_BankCommission" /></label> <label id="bankError" class="collapse"></label>
				</div>
			</div>
			
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input">

					<form:input class="selecttag" type="text" path="totalCommission" id="totalCommission" readonly="true"
						onclick="emptyerror(event,'totalError');"
						onchange="selecttag('label_Total','totalCommission')"
						onfocus="clearmsg(); showlabel('label_Total','totalError');" />
					<label id="label_Total" class='valid'><spring:message
							code="label_Total"/></label> <label id="totalError" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="commission-type-input">
					<form:select class="selecttag" path="commissionTypeInEx"
						id="customerTypeCommission"
						onclick="emptyerror(event,'customerCommissionError');this.setAttribute('value', this.value);"
						value="" 
						onkeypress="emptyerror(event,'customerCommissionError');"
						onchange="selecttag('label_customerCommission','customerCommission');"
						onfocus="removeHasError('commission-type-input');showlabel('label_customerCommission','customerCommissionError');">
						<form:option value="" label=" " />
						<form:option value="INCLUSIVE" label="Inclusive" />
						<form:option value="EXCLUSIVE" label="Exclusive" />
					</form:select>

					<label id="label_customerCommission"class="valid">Commission Type</label> <label id="customerCommissionError"
						class="collapse"></label>
				</div>
			</div>
	                    	
	                    <div id="submitbtn">
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" >
	                      
	                      		<input type="submit"
								value="Submit" onclick="return validateCommission(event);" class="btn btn-warning"/>
	                      </div>
	             	                      
	                    	</div>  
	                    	
	                    	</div>
	                    	
 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	                    	

	</form:form>
</body>
</html>