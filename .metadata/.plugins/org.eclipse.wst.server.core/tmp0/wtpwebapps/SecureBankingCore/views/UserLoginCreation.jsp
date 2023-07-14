
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Creation</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />

<!-- <script type="text/javascript" src=${pageContext.request.contextPath}/json/jquery.js></script> -->


<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
	<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/UserLoginCreation.js></script>

<script>
	$(document).ready(function() {
		function disableBack() {
			window.history.forward()
		}

		window.onload = disableBack();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBack()
		}
	});
	
function removeStyleTag(id)
{
	$("#"+id).attr("style","");
}
</script>

</head>

<form:form id="userLoginCreationPage" method="post"
	modelAttribute="userAccountData"
	action="${pageContext.request.contextPath}/AdminUI/account/submitLoginCreationPage">

	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			<spring:message code="lable.usercreation.title.page" />
		</h1>
		<div class="clearfix"></div>
		<hr>

		<c:if test="${statusMessage!=''}">
			<div id="statusMessage"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p class="text-success">${statusMessage}</p>
			</div>
		</c:if>
		<c:if test="${errorstatusMessage!=''}">

			<div id="errorstatusMessage"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

				<p class="text-danger">${errorstatusMessage}</p>

			</div>
		</c:if>

	</div>


	<div class="row">
		<!-- ****************************************** Platform Provider User Creation ******************************* -->
		<c:if test="${groupCode == 'PP'}">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div id="div_hostId" class="styled-input">
					<spring:message code="hostName" var="hostName1" />


					<form:select id="hostId" path="hostId" class="selecttag"
						onclick="removeStyleTag('hostId1');this.setAttribute('value', this.value);emptyerror(event,'distributorId1');"
						value="" onfocus="removeHasError('div_hostId');"
						onChange="selecttag('hostId1','hostId');getAccountListByParentId('hostId', 'distributorId','subDistributorId','retailerId');">
						<form:option value=" " label=" " />
						<form:options items="${userAccountData.hostMap}" />
					</form:select>
					<span></span> <label id="hostId1" class="valid">* HostName</label>
					<label id=hostIdErrorId class="collapse"></label>

				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="distributorId2" class="styled-input collapse">
					<spring:message code="distName" var="distName1" />

					<form:select id="distributorId" path="distributorId"
						class="selecttag"
						onChange="selecttag('distributorId1','distributorId');getAccountListByParentId('distributorId', 'subDistributorId','retailerId');"
						onfocus="showlabel('distributorId1','distributorIdErrorId');removeHasError('distributorId2');emptyerror(event,'distributorId1');removeStyleTag('distributorId1');"
						onclick="this.setAttribute('value', this.value);" value="">
						<form:option value="" label=" " />
					</form:select>
					<span></span> <label id="distributorId1" class="valid">${distName1}</label>
					<label id=distributorIdErrorId class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='subDistributorId2' class="styled-input collapse">
					<spring:message code="subDistName" var="subDistName1" />

					<form:select id="subDistributorId" path="subDistributorId"
						class="selecttag"
						onChange="selecttag('subDistributorId1','subDistributorId');getAccountListByParentId('subDistributorId','retailerId');"
						onfocus="showlabel('subDistributorId1','subDistributorIdErrorId')"
						onclick="this.setAttribute('value', this.value);emptyerror(event,'subDistributorIdErrorId');"
						value="">
						<form:option value="" label=" " />
					</form:select>
					<span></span> <label id="subDistributorId1" class="valid">${subDistName1}</label>
					<label id=subDistributorIdErrorId class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='retailerId2' class="styled-input collapse">
					<spring:message code="retName" var="retName1" />

					<form:select id="retailerId" class="selecttag" path="retailerId"
						onchange="showSettlementType('lab_settlementTypeId');selecttag('retailerId1','retailerId')"
						onfocus="showlabel('retailerId1','retailerIdErrorId')"
						onclick="this.setAttribute('value', this.value);emptyerror(event,'retailerIdErrorId');"
						val="">
						<form:option value="" label="<-----Select----->" />
					</form:select>
					<span></span> <label id="retailerId1" class="valid">${retName1}</label>
					<label id=retailerIdErrorId class="collapse"></label>
				</div>
			</div>
		</c:if>

		<!-- ****************************************** Host User Creation ******************************* -->

		<c:if test="${groupCode == 'HO'}">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="hostName" var="hostName1" />
					<form:input id="hostName" class="selecttag" type="text"
						path="hostName" name="hostName"
						value="${userAccountData.hostName}"
						onchange="selecttag('hostName1','hostName')" readonly="true" />
					<label id="hostName1" class="valid">${hostName1} </label><span></span>
					<form:input id="hostId" type="hidden" path="hostId" name="hostId"
						value="${userAccountData.hostId}" readonly="true" />
				</div>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='distributorId2' class="styled-input collapse">
					<spring:message code="distName" var="distName1" />
					<form:select id="distributorId" class="selecttag"
						path="distributorId"
						onclick="this.setAttribute('value', this.value);" value=""
						onChange="selecttag('distributorId1','distributorId');getAccountListByParentId('distributorId', 'subDistributorId','retailerId');"
						onfocus="showlabel('distributorId1','distributorIdErrorId');emptyerror(event,'distributorIdErrorId');">
						<form:option value="" label=" " />
						<form:options items="${userAccountData.distributorMap}" />
					</form:select>
					<span></span> <label id="distributorId1" class="valid">${distName1}</label>
					<label id=distributorIdErrorId class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='subDistributorId2' class="styled-input collapse">
					<spring:message code="subDistName" var="subDistName1" />
					<form:select id="subDistributorId" class="selecttag"
						path="subDistributorId"
						onclick="this.setAttribute('value', this.value);" value=""
						onfocus="showlabel('subDistributorId1','subDistributorIdErrorId')"
						onChange="selecttag('subDistributorId1','subDistributorId');getAccountListByParentId('subDistributorId','retailerId');">
						<form:option value="" label=" " />
					</form:select>
					<span></span> <label id="subDistributorId1" class="valid">${subDistName1}</label>
					<label id=subDistributorIdErrorId class="collapse"></label>


				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='retailerId2' class="styled-input collapse">
					<spring:message code="retName" var="retName1" />
					<form:select id="retailerId" class="selecttag" path="retailerId"
						onchange="showSettlementType('lab_settlementTypeId');selecttag('retailerId1','retailerId')"
						onfocus="showlabel('retailerId1','retailerIdErrorId')"
						onclick="this.setAttribute('value', this.value);" value="">
						<form:option value="" label=" " />
					</form:select>
					<span></span> <label id="retailerId1" class="valid">${retName1}</label>
					<label id=retailerIdErrorId class="collapse"></label>
				</div>

			</div>

		</c:if>
		<!-- ****************************************** Distributor User Creation ******************************* -->
		<c:if test="${groupCode == 'DI'}">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="hostName" var="hostName1" />
					<form:input id="hostName" class="selecttag" type="text"
						path="hostName" name="hostName"
						value="${userAccountData.hostName}"
						onchange="selecttag('hostName1','hostName')" readonly="true"
						onkeypress="onlyNumric(event,'productOrderErrorId');" />
					<label id="hostName1" class="valid">${hostName1}</label>

					<form:input id="hostId" type="hidden" path="hostId" name="hostId"
						value="${userAccountData.hostId}" readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="distName" var="distName1" />
					<form:input id="distName" class="selecttag" type="text"
						path="distName" name="distName"
						value="${userAccountData.distName}"
						onchange="selecttag('distName1','distName')" readonly="true" />
					<label id="distName1" class="valid">${distName1}</label><span></span>
					<form:input id="distributorId" type="hidden" path="distributorId"
						name="distributorId" value="${userAccountData.distributorId}"
						readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='subDistributorId2' class="styled-input collapse">
					<spring:message code="subDistName" var="subDistName1" />
					<form:select id="subDistributorId" class="selecttag"
						path="subDistributorId"
						onclick="this.setAttribute('value', this.value);" value=""
						onfocus="showlabel('subDistributorId1','subDistributorIdErrorId')"
						onChange="selecttag('subDistributorId1','subDistributorId');getAccountListByParentId('subDistributorId','retailerId');">
						<form:option value="" label=" " />
						<form:options items="${userAccountData.subDistributorMap}" />
					</form:select>
					<span></span> <label id="subDistributorId1" class="valid">${subDistName1}</label>
					<label id=subDistributorIdErrorId class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='retailerId2' class="styled-input collapse">
					<spring:message code="retName" var="retName1" />
					<form:select id="retailerId" path="retailerId" class="selecttag"
						onchange="showSettlementType('lab_settlementTypeId');selecttag('retailerId1','retailerId')"
						onfocus="showlabel('retailerId1','retailerIdErrorId')"
						onclick="this.setAttribute('value', this.value);" value="">
						<form:option value="" label=" " />
					</form:select>
					<span></span> <label id="retailerId1" class="valid">${retName1}</label>
					<label id=retailerIdErrorId class="collapse"></label>
				</div>
			</div>

		</c:if>
		<!-- ****************************************** Sub-Distributor User Creation ******************************* -->
		<c:if test="${groupCode == 'SD'}">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="hostName" var="hostName1" />
					<form:input id="hostName" class="selecttag" type="text"
						path="hostName" name="hostName"
						value="${userAccountData.hostName}"
						onchange="selecttag('hostName1','hostName')"
						onfocus="showlabel('hostName1','productOrderErrorId')"
						readonly="true"
						onkeypress="onlyNumric(event,'productOrderErrorId');" />
					<label id="hostName1" class="valid">${hostName1}</label> <label
						id=productOrderErrorId class="collapse"></label> <span></span>
					<form:input id="hostId" type="hidden" path="hostId" name="hostId"
						value="${userAccountData.hostId}" readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="distName" var="distName1" />
					<form:input id="distName" class="selecttag" type="text"
						path="distName" name="distName"
						value="${userAccountData.distName}"
						onchange="selecttag('distName1','distName')" readonly="true" />
					<label id="distName1" class="valid">${distName1}</label> <span></span>
					<form:input id="distributorId" type="hidden" path="distributorId"
						name="distributorId" value="${userAccountData.distributorId}"
						readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="subDistName" var="subDistName1" />
					<form:input id="subDistName" class="selecttag" type="text"
						path="subDistName" name="subDistName"
						value="${userAccountData.subDistName}"
						onchange="selecttag('subDistName1','subDistName')" readonly="true" />
					<label id="subDistName1" class="valid">${subDistName1}</label> <span></span>
					<form:input id="subDistributorId" type="hidden"
						path="subDistributorId" name="subDistributorId"
						value="${userAccountData.subDistributorId}" readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id='retailerId2' class="styled-input collapse">
					<spring:message code="retName" var="retName1" />
					<form:select id="retailerId" class="selecttag" path="retailerId"
						onchange="showSettlementType('lab_settlementTypeId');selecttag('retailerId1','retailerId')"
						onclick="this.setAttribute('value', this.value);" value=""
						onfocus="showlabel('retailerId1','retailerIdErrorId')">
						<form:option value="" label=" " />
						<form:options items="${userAccountData.retailorMap}" />
					</form:select>
					<span></span> <label id="retailerId1" class="valid">${retName1}</label>
					<label id=retailerIdErrorId class="collapse"></label>
				</div>
			</div>
		</c:if>
		<!-- ****************************************** Retailer User Creation ******************************* -->
		<c:if test="${groupCode == 'RE'}">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="hostName" var="hostName1" />
					<form:input id="hostName" class="selecttag" type="text"
						path="hostName" name="hostName"
						value="${userAccountData.hostName}"
						onchange="selecttag('hostName1','hostName')" readonly="true"
						onfocus="showlabel('hostName1','productOrderErrorId')"
						onkeypress="onlyNumric(event,'productOrderErrorId');" />
					<label id="hostName1" class="valid">${hostName1}</label> <label
						id=productOrderErrorId class="collapse"></label> <span></span>
					<form:input id="hostId" type="hidden" path="hostId" name="hostId"
						value="${userAccountData.hostId}" readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="distName" var="distName1" />
					<form:input id="distName" class="selecttag" type="text"
						path="distName" name="distName"
						value="${userAccountData.distName}"
						onchange="selecttag('distName1','distName')" readonly="true" />
					<label id="distName1" class="valid">${distName1}</label> <span></span>
					<form:input id="distributorId" type="hidden" path="distributorId"
						name="distributorId" value="${userAccountData.distributorId}"
						readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="subDistName" var="subDistName1" />
					<form:input id="subDistName" class="selecttag" type="text"
						path="subDistName" name="subDistName"
						value="${userAccountData.subDistName}"
						onchange="selecttag('subDistName1','subDistName')" readonly="true" />
					<label id="subDistName1" class="valid">${subDistName1}</label> <span></span>
					<form:input id="subDistributorId" type="hidden"
						path="subDistributorId" name="subDistributorId"
						value="${userAccountData.subDistributorId}" readonly="true" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="styled-input">
					<spring:message code="retName" var="retName1" />
					<form:input id="retailerName" class="selecttag" type="text"
						path="retailerName" name="retailerName"
						value="${userAccountData.retailerName}"
						onchange="selecttag('retailerName1','retailerName');"
						readonly="true" />
					<label id="retailerName1" class="valid">${retName1}</label> <span></span>
					<form:input id="retailerId" type="hidden" path="retailerId"
						name="retailerId" value="${userAccountData.retailerId}"
						readonly="true" />
				</div>
			</div>
		</c:if>
		<!-- ****************************************** Country name details ******************************* -->
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div id="div_accountTypeId" class="styled-input">
				<spring:message code="AccountType" var="AccountType1" />
				<form:select id="accountTypeId" path="accountTypeId"
					class="selecttag"
					onChange="selecttag('accountTypeId1','accountTypeId');showHideFunction();"
					onfocus="removeHasError('div_accountTypeId');showlabel('accountTypeId1','accountTypeErrorId');removeStyleTag('accountTypeId1');"
					onclick="emptyerror(event,'accountTypeErrorId');this.setAttribute('value', this.value);removeStyleTag('accountTypeId1');"
					value="">
					<form:option value="" label="" />
					<c:forEach items="${userAccountData.accountTypeList}"
						var="accountTypeObj">
						<form:option value="${accountTypeObj.accountTypeId}"
							label="${accountTypeObj.name}" />
					</c:forEach>
				</form:select>
				<span></span> <label id="accountTypeId1" class="valid">*
					AccountType</label> <label id=accountTypeErrorId class="collapse"></label>
			</div>
		</div>
		<!-- ****************************************** User Name ******************************* -->
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div id="div_userName" class="styled-input">
				<spring:message code="personName" var="personName1" />
				<form:input path="userName" class="selecttag" autocomplete="off" maxlength="40"
					id="userName" name="userName" type="text"
					onchange="selecttag('userName1','userName')"
					onkeypress="emptyerror(event,'userNameErrorId'); blockSpecialChar(event,'userNameErrorId');"
					onfocus="removeHasError('div_userName');showlabel('userName1','userNameErrorId');emptyerror(event,'userNameErrorId')" />
				<label id="userName1" class="valid">* Name</label> <label
					id=userNameErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<!-- ****************************************** Nick Name ******************************* -->
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input" id=div_nickName>
				<spring:message code="personNickName" var="personNickName1" />
				<form:input path="nickName" class="selecttag" id="nickName"
					autocomplete="off" name="nickName" type="text"
					onchange="selecttag('nickName1','nickName')"
					onkeypress="emptyerror(event,'nickNameErrorId'); blockSpecialChar(event,'nickNameErrorId');"
					onfocus="removeHasError('div_nickName');showlabel('nickName1','nickNameErrorId');emptyerror(event,'nickNameErrorId')" />
				<label id="nickName1" class="valid">* NickName</label> <label
					id=nickNameErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<!-- ****************************************** Address ******************************* -->
		<c:if test="${deployedFor=='DEFAULT'}">
			<div id='addressSelectDivId'>
				<table border="1" cellpadding='0' width='100%'
					id='addressSelectTableId'>
				</table>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">&nbsp;</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							<form:input type="text" maxlength="6" path="pinCode"
								class="selecttag" id="pinCode"
								onchange="selecttag('label_pinCode','pinCode');"
								onclick="refresh('addressErrorId');emptyerror('addressErrorId');"
								onfocus="removeHasError('div_pinCode')"
								onkeypress="onlyNumric(event,'label_pinCode1','lab_pinCodeErrorId1','pinCode');changeValues()" />
							<label id="label_pinCode" class="valid">* Pin Code</label> <label
								id="lab_pinCodeErrorId" class="collapse"></label>
						</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">

						<input type="button" id="addressFetchId" class="btn btn-warrning"
							value="Fetch Address" onclick="fetchAddress();" />

					</div>
				</div>
<div id="addressErrorId"></div>
			</div>


 <input type="hidden" id="pinCodeFlag" name="pinCodeFlag"  value="" />


			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_address" class="styled-input">
					<form:input id="addressIdDefault" type="text" path="address"
						class="selecttag" onchange="selecttag('label_address','address');"
						onfocus="removeHasError('div_address')" />
					<label id="label_address" class="valid">* Address</label> <label
						id="lab_addressErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_locality" class="styled-input">
					<form:input type="text" id="locality" path="locality" onclick="removeHasError('div_locality')"
						class="selecttag" readonly="true"
						onchange="selecttag('label_locality','locality');"
						onfocus="removeHasError('div_locality');removeStyleTag('label_locality');" />
					<label id="label_locality" class="valid">* Locality</label> <label
						id="lab_localityErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_region" class="styled-input">
					<form:input type="text" id="region" path="region" class="selecttag"
						readonly="true" onchange="selecttag('label_region','region');"
						onfocus="removeHasError('div_region')" />
					<label id="label_region" class="valid">Region</label> <label
						id="lab_regionErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_district" class="styled-input">
					<form:input type="text" id="district" path="district"
						class="selecttag" readonly="true"
						onchange="selecttag('label_district','district');"
						onfocus="removeHasError('div_district');removeStyleTag('label_district');" />
					<label id="label_district" class="valid">* District</label> <label
						id="lab_districtErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_state" class="styled-input">
					<form:input type="text" id="state" path="state" class="selecttag" onclick="removeHasError('div_state')"
						readonly="true" onchange="selecttag('label_state','state');"
						onfocus="removeHasError('div_state');removeStyleTag('label_state');" />
					<label id="label_state" class="valid">* State</label> <label
						id="lab_StateErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_country" class="styled-input">
					<form:input type="text" id="country" path="country"
						class="selecttag" readonly="true"
						onchange="selecttag('label_country','country');"
						onfocus="removeHasError('div_country');removeStyleTag('label_country');" />
					<label id="label_country" class="valid">* Country</label> <label
						id="lab_CountryErrorId" class="collapse"></label>
				</div>
			</div>
		</c:if>

		<c:if test="${deployedFor=='TAFANI'}">

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_pinCode" class="styled-input">
					<spring:message code="lab_pinCode" var="lab_pinCode" />
					<form:input type="text" maxlength="6" path="pinCode"
						class='selecttag' id="pinCode"
						onclick="emptyerror(event,'lab_pinCodeErrorId');"
						onkeypress="onlyNumricForPin(event,'lab_pinCodeErrorId','${lab_pinCode}'); "
						onfocus="showlabel('pinCodeId','lab_pinCodeErrorId');removeHasError('div_pinCode')"
						onchange="selecttag('pinCodeId','pinCode');pinValidation(); changePinCode('${readonlyValue}');" />
					<label id="pinCodeId" class="valid">${lab_pinCode}</label> <label
						id="lab_pinCodeErrorId" class="collapse"></label><span></span>

				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_address" class="styled-input">
					<form:input id="addressIdDefault" type="text" path="address"
						class="selecttag" onchange="selecttag('label_address','address');"
						onfocus="removeHasError('div_address');selecttag1('label_address')" />
					<label id="label_address" class="valid"><spring:message
							code="lab_address" /></label> <label id="lab_addressErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_locality" class="styled-input">
					<form:input type="text" id="locality" path="locality"
						class="selecttag" onclick="removeHasError('div_locality')"
						onchange="selecttag('label_locality','locality');selecttag1('label_locality')"
						onfocus="removeHasError('div_locality')" />
					<label id="label_locality" class="valid"><spring:message
							code="lab_locality" /></label> <label id="lab_localityErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_region" class="styled-input">
					<form:input type="text" id="region" path="region" class="selecttag"
						onchange="selecttag('label_region','region');selecttag1('label_region')"
						onfocus="removeHasError('div_region')" />
					<label id="label_region" class="valid"><spring:message
							code="lab_Region" /></label> <label id="lab_regionErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_district" class="styled-input">
					<form:input type="text" id="district" path="district"
						class="selecttag"
						onchange="selecttag('label_district','district');selecttag1('label_district')"
						onfocus="removeHasError('div_district')" />
					<label id="label_district" class="valid"><spring:message
							code="lab_district" /></label> <label id="lab_districtErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_state" class="styled-input">
					<form:input type="text" id="state" path="state" class="selecttag" onclick="removeHasError('div_state')"
						onchange="selecttag('label_state','state');selecttag1('label_state')"
						onfocus="removeHasError('div_state')" />
					<label id="label_state" class="valid"><spring:message
							code="lab_State" /></label> <label id="lab_StateErrorId"
						class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="div_country" class="styled-input">
					<form:input type="text" id="country" path="country"
						class="selecttag"
						onchange="selecttag('label_country','country');selecttag1('label_country')"
						onfocus="removeHasError('div_country')" />
					<label id="label_country" class="valid"><spring:message
							code="lab_Country" /></label> <label id="lab_CountryErrorId"
						class="collapse"></label>
				</div>
			</div>
		</c:if>
		<!-- ******************************************  User Email ID  ******************************* -->

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div id="div_userEmailId" class="styled-input">
				<spring:message code="emailId" var="emailId1" />
				<form:input path="userEmailId" class="selecttag" autocomplete="off"
					id="userEmailId" name="userEmailId" type="text"
					onkeypress="blockSpace(event,'userEmailIdErrorId');"
					onchange="selecttag('userEmailId1','userEmailId');checkUniqueUserEmailId();"
					onfocus="removeHasError('div_userEmailId');showlabel('userEmailId1','userEmailIdErrorId');emptyerror(event,'userEmailIdErrorId');" />
				<label id="userEmailId1" class="valid">* Email ID</label> <label
					id=userEmailIdErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="row">
				<div class="col-md-4 col-lg-4 pr0">
					<div id="contrycodedivId" class="styled-input">

						<form:select id="countryCodeId" class="selecttag"
							name="countryCode" path="countryCodeId"
							onchange="selecttag('countryCodeId1','countryCodeId');"
							onclick="this.setAttribute('value', this.value);"
							onfocus="removeHasError('contrycodedivId');showlabel('countryCodeId1','countrycodeErrorId');"
							value="">
							<form:option value="" label=" " />
							<form:options items="${countryCodeMap}" />

						</form:select>
						<label id="countryCodeId1" class="valid">* Country Code</label> <label
							id=countrycodeErrorId class="collapse"></label>
					</div>
				</div>
				<div class="col-md-1 col-lg-1 pl0"></div>
				<div class="col-md-7 col-lg-7 pl0">
					<div id="div_userMobile" class="styled-input">
						<form:input path="userMobile" autocomplete="off" id="userMobile"
							name="userMobile" class="selecttag" type="text" maxlength="10"
							onkeypress="onlyNumric(event,'userMobileErrorId','userMobile1'); emptyerror(event,'userMobileErrorId');"
							onfocus="removeHasError('div_userMobile');showlabel('userMobile1','userMobileErrorId');"
							onchange="selecttag('userMobile1','userMobile');checkUniqueUserMobileNumber();mobLength(event,'userMobile','userMobileErrorId');" />
						<label id="userMobile1" class="valid">* Phone Number</label> <label
							id=userMobileErrorId class="collapse"></label> <span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="row">
				<div class="col-md-4 col-lg-4 pr0">
					<div id="altcountrydivId" class="styled-input">

						<form:select id="altCountryCodeId" class="selecttag"
							name="countryCode" path="altCountryCodeId"
							onchange="selecttag('altCountryCodeId1','altCountryCodeId');"
							onclick="this.setAttribute('value', this.value)"
							onfocus="showlabel('altCountryCodeId1','altcountrycodeErrorId');removeHasError('altcountrydivId');"
							value="">
							<form:option value="" label=" " />
							<form:options items="${countryCodeMap}" />

						</form:select>
						<span></span> <label id="altCountryCodeId1" class="valid">Country
							Code</label> <label id=altcountrycodeErrorId class="collapse"></label>
					</div>
				</div>
				<div class="col-md-1 col-lg-1 pl0"></div>
				<div class="col-md-7 col-lg-7 pl0">
					<div class="styled-input">

						<form:input path="altMobile" autocomplete="off"
							id="alternateMobileNo" name="alternateMobileNo" type="text"
							class="selecttag" maxlength="10"
							onkeypress="emptyerror(event,'alternateMobileNoErrorId'),blockSpecialChar(event,'alternateMobileNoErrorId');onlyNumric(event,'alternateMobileNoErrorId');"
							onfocus="showlabel('alternateMobileNo1','alternateMobileNoErrorId');emptyerror(event,'userMobileErrorId')"
							onchange="selecttag('alternateMobileNo1','alternateMobileNo');checkUniqueUserMobileNumber();mobLength(event,'alternateMobileNo','alternateMobileNoErrorId');" />
						<label id="alternateMobileNo1" class="valid">Alternate Phone Number</label>
						<label id=alternateMobileNoErrorId class="collapse"></label> <span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div id="div_userLoginName" class="styled-input">
				<spring:message code="userLogin" var="userLogin1" />
				<form:input path="userLoginName" class="selecttag"
					autocomplete="off" id="userLoginName" name="userLoginName"
					type="text"
					onkeypress="blockSpace(event,'userLoginNameErrorId'),blockSpecialChar(event,'userLoginNameErrorId');"
					onfocus="removeHasError('div_userLoginName');showlabel('userLoginName1','userLoginNameErrorId');emptyerror(event,'userLoginNameErrorId')"
					onchange="selecttag('userLoginName1','userLoginName');checkUniqueUserLoginName();" />
				<label id="userLoginName1" class="valid">* UserLogin </label> <label
					id=userLoginNameErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  pull-left">
			<div id="div_userPassword" class="styled-input">
				<spring:message code="userPassword" var="userPassword1" />
				<form:input path="userPassword" class="selecttag" autocomplete="off"
					id="userPassword" name="userPassword" type="password"
					onkeypress="blockSpace(event,'userPasswordErrorId'),emptyerror(event,'userPasswordErrorId');"
					onfocus="removeHasError('div_userPassword');showlabel('userPassword1','userPasswordErrorId');emptyerror(event,'userPasswordErrorId');"
					onchange="selecttag('userPassword1','userPassword');validEmail();" />
				<label id="userPassword1" class="valid">* Create Password </label> <label
					id=userPasswordErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div id="div_rPassword" class="styled-input">
				<spring:message code="rPassword" var="rPassword1" />
				<form:input path="" type="password" id="rPassword" class="selecttag"
					autocomplete="off" name="rPassword"
					onchange="selecttag('rPassword1','rPassword')"
					onkeypress="blockSpace(event,'rPasswordErrorId'),emptyerror(event,'rPasswordErrorId');"
					onfocus="removeHasError('div_rPassword');showlabel('rPassword1','rPasswordErrorId');emptyerror(event,'rPasswordErrorId')" />
				<label id="rPassword1" class="valid">* Confirm Password </label> <label
					id=rPasswordErrorId class="collapse"></label> <span></span>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
			style="display: none" id='lab_settlementTypeId'>
			<div class="styled-input">
				<spring:message code="lab_settlementType" var="lab_settlementType" />
				<form:select id="settlementType" path="settlementType"
					class="selecttag"
					onclick="emptyerror(event,'settlementTypeErrorId');"
					disabled="true">
					<form:option value="2" label="2" />
					<form:option value="1" label="1" />
					<form:option value="0" label="0" />
					<form:option value="3" label="3" />
				</form:select>
				<label id="settlementTypeId" class="valid">${lab_settlementType}</label>
				<label id="settlementTypeErrorId" class="collapse"></label>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">

			<input id="userCreateSubmit" type="submit" class="btn btn-warning"
				value="Submit"
				onclick="return validateUserCreationForm(event,'${deployedFor}');" />
			<input id="groupCode" name="groupCode" value="${groupCode}"
				type="hidden" /> <input id="finalFlag" name="finalFlag" value=""
				type="hidden" />
			<form:input path="userGroupCode" id="userGroupCode"
				name="userGroupCode" value="" type="hidden" />
		</div>

	</div>
	<input type="hidden" value="${pageContext.request.contextPath}"
		name="link">
	<input type="hidden" value="${menuId}" name="menuId" id="menuId">
	<input type="hidden" value="${submenuId}" name="submenuId"
		id="submenuId">

</form:form>

</html>

