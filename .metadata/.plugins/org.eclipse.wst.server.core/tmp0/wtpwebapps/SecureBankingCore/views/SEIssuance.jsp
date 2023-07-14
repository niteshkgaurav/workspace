<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/SEIssuance.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/aes.js"></script>
<!-- <script type="text/javascript" -->
<%-- 	src="${pageContext.request.contextPath}/js/CheckImage.js"></script> --%>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<title>SE Issuance</title>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD',
		    maxDate : 'now',
             useCurrent: false, 
    });
});


function removeStyleTag(id)
{
	$("#"+id).attr("style","");
}
function checkMultipleImageSizeAndExtension(fileid) {
	var obj = document.getElementById(fileid);
	var filepath = obj.value;
    var ext = filepath.substring(filepath.lastIndexOf('.')+1).toLowerCase();
    if (ext != "jpeg" && ext != "jpg" && ext != "png" ) {
        alert('Please select a valid image file');
        obj.value = '';
        return false;
    }
    var fsize = obj.files.item(0).size;
    var s = Math.round((fsize / 1024) * 1024);
    if (s > 512000) {
        alert('Max Upload size is 512 KB only');
        obj.value = '';
        return false;
    }
    
    return true;
}



$(function () {
    $('input[type="file"]').change(function () {
         if ($(this).val() != "") {
                $(this).css('color', '#333');
         }else{
                $(this).css('color', 'transparent');
         }
    });
})

/* function getMvAndSubVersionNew()
{
	var externalNo = $('#externalNo').val();
	
	var keyNum = 'gopalJee';
	
	var encrypted = CryptoJS.AES.encrypt(externalNo, keyNum).toString();
	
	getMvAndSubVersion(externalNo,encrypted);
} */

</script>




</head>

<body>
	<form:form id="seIssuanceFormId" method="post"
		modelAttribute="seIssuanceData" onsubmit="return checkDocumentStatus(event);"
		action="${pageContext.request.contextPath}/AdminUI/kycController/issueSE"
		enctype="multipart/form-data">
		<div class="heading-inner  ">
			<h1 class="pull-left">
				<spring:message code="lab_overlayIssuance" />
			</h1>
			<div class="clearfix"></div>
			<hr>
			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
			<c:if test="${errorMessage!=''}">
				<div id="ermsgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-danger">${errorMessage}</p>
				</div>
			</c:if> 

		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div    id="usertypeDivId" class="styled-input ">
					<form:select path="userType" class="selecttag"
						onfocus="showlabel('label_userType','lab_userTypeErrorId')"
						onchange="selecttag('label_userType','userType');switchFunction();"
						onclick="this.setAttribute('value', this.value);"
						value="">
						<form:option value="AGENT" label="AGENT" />
						<form:option value="CUSTOMER" label="CUSTOMER" selected="true" />
					</form:select>
					<label id="label_userType" class="valid"><spring:message
							code="lab_userType" /><span style="color: red;"> *</label> <label id="lab_userTypeErrorId"
						class="collapse"></label>
				</div>
			</div>
			
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div  id="productTypedivId"  class="styled-input">
					<form:select path="productType" class="selecttag"
						
						onfocus="showlabel('label_productType','lab_productErrorId');removeHasError('productTypedivId')"
						onclick="this.setAttribute('value', this.value);"
						value=""
						onchange="getMasterVersionByProductId();checkProduct();selecttag('label_productType','productType')">
						<form:option value="0" label=" " />
											<form:options items="${seIssuanceData.products}" />
					</form:select>
					<label id="label_productType" class='valid'><spring:message
							code="lab_product" /><span style="color: red;"> *</label> <label id="lab_productErrorId"
						class="collapse"></label>
				</div>
			</div>
			
			
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 "
				id="customerId">
				<div  id ="custMobileNoDivId" 
				  class="styled-input">
					<form:input path="custMobileNo" maxlength="12"  
						onfocus="showlabel('lab_custMobileNo','lab_custMobilenumberErrorId')"
						class="selecttag"
						onchange="selecttag('lab_custMobileNo','custMobileNo');getSubscriberDetailsByMobileNumber();"
						onkeypress="onlyNumric(event,'lab_custMobilenumberErrorId','lab_custMobileNo');"
						onkeyup="validateCus(event);ZeroCheck();"
						/>
						<%-- onclick="emptyerror(event,'lab_custMobilenumberErrorId');" /> --%>
					<label id="lab_custMobileNo" class="valid"><spring:message
							code="lab_custMobilenumber" /><span style="color: red;"> *</label> <label
						id="lab_custMobilenumberErrorId" class="collapse"></label>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div   id="custDivId"  class="styled-input">
						<form:input path="custId" class="selecttag" id="custId"
							onfocus="showlabel('label_custId','label_custIdErrorId');removeHasError('custDivId')"
							onchange="selecttag('label_custId','custId')" />
						<label id="label_custId" class="valid"><spring:message
								code="label_custId" /></label> <label id="label_custIdErrorId"
							class="collapse"></label>
					</div>
				</div>
				<!-- onchange="getMvAndSubVersion();selecttag('label_externalNo','externalNo');" -->
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="divID_externalNo" class="styled-input">
						<form:input path="externalNo" class="selecttag" maxlength="15"
							onchange="getMvAndSubVersion();selecttag('label_externalNo','externalNo');"
							onfocus="showlabel('label_externalNo','label_externalNoErrorId');
												removeHasError('divID_externalNo');"
							
							onkeydown="clearMasterVersion();"
							onkeypress="onlyNumric(event,'label_externalNoErrorId','label_externalNo');"
							onpaste="getMvAndSubVersion();validateNumeric(event,'label_externalNoErrorId');"
							/>
							<%-- onclick="emptyerror(event,'label_externalNoErrorId');" /> --%>
						<label id="label_externalNo" class="valid"><spring:message
								code="label_externalNumber" /><span style="color: red;"> *</label> <label
							id="label_externalNoErrorId" class=""></label>
					</div>
				</div>
		
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 agentDiv"  id="agentId">
					<div class="styled-input" id="agentval">
						<form:select path="agentName" class="selecttag" id="agentName"
							onfocus="showlabel('label_agentName','agentNameErrorId')"
							onclick="removeStyleTag('label_agentName');removeHasError('agentval');this.setAttribute('value', this.value);"
							value=""  
							onchange="getAgentData();selecttag('label_agentName','agentName')">
							<!-- onclick="removeStyleTag('label_agentName');removeHasError('agentval');emptyerror(event,'agentNameErrorId');this.setAttribute('value', this.value);" -->
							<form:option value="0" label=" " />
							<form:options items="${seIssuanceData.agents}" />
						</form:select>
						<label id="label_agentName" class="valid"><spring:message
								code="Agent Name"  /></label> <label id="agentNameErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 agentDiv" id="agentId">
					<div class="styled-input" >
						<form:input type="text" class="selecttag" readonly="true"
							onfocus="showlabel('label_agentMobileNo','agentMobileNoErrorId')"
							path="agentMobileNo"
							onchange="selecttag('label_agentMobileNo','agentMobileNo')" />
						<label id="label_agentMobileNo" class="valid"><spring:message
								code="Agent Mobile No" /></label> <label id="agentMobileNoErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 agentDiv" id="agentId">
					<div class="styled-input"  style="width: 390px;">
						<form:input type="text" class="selecttag"  readonly="true"
							onfocus="showlabel('label_agentUserType','agentUserTypeErrorId')"
							onchange="selecttag('label_agentUserType','agentUserType')"
							path="agentUserType" />
						<label id="label_agentUserType" class="valid"><spring:message code="Agent User Type" /></label> 
						<label id="agentUserTypeErrorId" class="collapse"></label>
					</div>
				</div>
		
		
			
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 masterVersionDiv">
					<div class="styled-input mvErrorDiv">
						<form:select id="masterVersion" path="masterVersion" class="selecttag"
							onfocus="showlabel('label_masterVersion','label_masterVersionErrorId')"
							onchange="getHostSubVersionByMasterVersionId();selecttag('label_masterVersion','masterVersion')" />
						<label id="lab_masterVersion"  class="valid"><spring:message
								code="label_masterVersion" /></label> <label
							id="label_masterVersionErrorId" class="collapse"></label>
					</div>
				</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 subVersionDiv">
					<div class="styled-input svErrorDiv">
						<form:select path="subVersion" class="selecttag" id="hostSubVersionId"
							onfocus="showlabel('label_subVersion','lab_Create_Sub_versionErrorId')"
							onchange="selecttag('label_subVersion','subVersion')"
							onclick="this.setAttribute('value', this.value);" value="">
						</form:select>
						<label id="label_subVersion"  class="valid"><spring:message
								code="lab_Create_Sub_version" /></label> <label
							id="lab_Create_Sub_versionErrorId" class="collapse"></label>
					</div>
				</div>
			
				
			
				
			
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div id="divID_datepicker" class="styled-input">
						<div class="input-group date datetimepicker1">
							<form:input id="datepick" type="text" class="selecttag"
								path="dob" onfocus="removeHasError('divID_datepicker')"
								onclick="selecttag1('label_dob')" />
							<label id="label_dob" class="valid"><spring:message code="lab_dob" /><span style="color: red;"> *</label>
							<label id="lab_dobErrorId" class="collapse"></label> <i
								class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"
								onclick="selecttag1('label_dob')"></i>
							</i>
						</div>
					</div>
				</div>
				
				
				<div class="collapse" id="adrssTable">
				<div class="col-xs-12 collapse" id='walletTableId'>
					<spring:message code="lab_cashIn_wallet" />
					<div class="transaction-table">
						<div class="table-responsive">
							<table id='walletTable'
								class="table table-bordered table-striped ">
								<tr>
									<th align="center"><spring:message code="lab_walletType" /></th>
									<th align="center"><spring:message code="lab_walletName" /></th>
								</tr>
								<c:forEach items="${seIssuanceData.idproofs}" var="idProofData"
									varStatus="status">
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="firstName" class="selecttag"
							onfocus="showlabel('lab_firstName','lab_customerFirstNameErrorId')"
							onchange="selecttag('lab_firstName','firstName')" 
							onkeypress="onlyAlphabetlatest(event,'lab_customerFirstNameErrorId', 'lab_firstName')" />
							
						<label id="lab_firstName"  class="valid" ><spring:message code="lab_customerFirstName" /></label>
						<label id="lab_customerFirstNameErrorId" class="collapse"></label>
					</div>
				</div>
				
				
				

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="lastName" class="selecttag"
							onfocus="showlabel('lab_lastName','lab_customerLastNameErrorId')"
							onchange="selecttag('lab_lastName','firstName')"
							onkeypress="onlyAlphabetlatest(event,'lab_customerLastNameErrorId','lab_lastName')" />
						<label id="lab_lastName" class="valid"><spring:message
								code="lab_customerLastName" /></label> <label
							id="lab_customerLastNameErrorId" class="collapse"></label>
					</div>
				</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="row">
						<div class="col-md-4 col-lg-4 pr0">
							<div id="div_pinCode" class="styled-input">
								<form:input type="text" path="pinCode" class="selecttag" id="pinCode"
									onchange="selecttag('label_pinCode','pinCode');"
									onfocus="removeHasError('div_pinCode')" />
									<!--onkeypress="changeValues()"  -->
								<label id="label_pinCode" class="valid" > Pin Code<span style="color: red;"> *</label> <label id="lab_pinCodeErrorId"
									class="collapse"></label>
							</div>
						</div>
						<div class="col-md-8 col-lg-8 pl0">
	
							<input type="button" id="addressFetchId" class="btn btn-warrning"
								value="Fetch Address" onclick="fetchAddress();" />
	
						</div>
					</div>
	
				</div>

				<div class="col-xs-12" id="addressSelectDivId">
	    			<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'></table>
	    		</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="address" class="selecttag"
							onfocus="showlabel('lab_address','lab_addressErrorId')"
							onchange="selecttag('lab_address','address')" />
						<label id="lab_address"  class="valid" ><spring:message code="lab_address" /></label>
						<label id="lab_addressErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" class="selecttag"
							onfocus="showlabel('lab_locality','lab_localityErrorId')"
							onchange="selecttag('lab_locality','locality')" path="locality" />
						<label id="lab_locality" class="valid"><spring:message
								code="lab_locality" /></label> <label id="lab_localityErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="region" class="selecttag"
							onfocus="showlabel('lab_region','lab_regionErrorId')"
							onchange="selecttag('lab_region','region')" />
						<label id="lab_region" class="valid"><spring:message code="lab_Region" /></label>
						<label id="lab_regionErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" class="selecttag"
							onfocus="showlabel('lab_district','lab_districtErrorId')"
							onchange="selecttag('lab_district','district')" path="district" />
						<label id="lab_district" class="valid"><spring:message
								code="lab_district" /></label> <label id="lab_districtErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="state" class="selecttag"
							onfocus="showlabel('lab_state','lab_StateErrorId')"
							onchange="selecttag('lab_state','state')" />
						<label id="lab_state" class="valid"><spring:message code="lab_State" /></label>
						<label id="lab_StateErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="country" class="selecttag"
							onfocus="showlabel('lab_Country','lab_CountryErrorId')"
							onchange="selecttag('lab_Country','country')" />
						<label id="lab_Country" class="valid"><spring:message code="lab_Country" /></label>
						<label id="lab_CountryErrorId" class="collapse"></label>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input id='emailId' type="text" class="selecttag"
							path="email"
							onfocus="showlabel('lab_email','lab_Email_IdErrorId')"
							onchange="selecttag('lab_email','emailId');validateEmail('emailId');"
							/>
							<%-- onclick="emptyerror(event,'lab_Email_IdErrorId');" /> --%>
						<label id="lab_email" class="valid"><spring:message code="lab_Email_Id" /></label>
						<label id="lab_Email_IdErrorId" class="collapse"></label>
					</div>
				</div>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="button" class="btn btn-warning" value="Add More Information"  
					onclick="showAddressTable();" />
			</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<label style="color:#999;"><spring:message code="lab_toSubmitIdProof" /></label>
					<div class="clearfix"></div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div   class="col-xs-12 col-sm-12 col-md-3 col-lg-3"  class="row" id="lab_toSubmitIdProofId">
						<input type="radio" id="yes"   name="radio"
									onclick="showKycTable(event);" value="YES" />
									<label style="color:#999;">YES</label></div>
						<div    class="col-xs-12 col-sm-12 col-md-3 col-lg-3"      >
	                			<input  type="radio" id="no"  name="radio" 
									onclick="hideKycTable();" value="NO" checked/>
									<label style="color:#999;" >NO</label></div>
					</div>
					</div>
					<br>
				</div>
				<div class="col-xs-12 collapse " id='kycTableId'>
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th><spring:message code="lab_idName" /></th>
									<%-- <th style="width: 12%"><spring:message	code="lab_maxBalance" /></th>
									<th style="width: 12%"><spring:message	code="lab_perTxnLimit" /></th>
									<th style="width: 12%"><spring:message	code="lab_dailyTxnLimit" /></th>
									<th style="width: 12%"><spring:message	code="lab_monthlyTxnLimit" /></th> --%>
									<%-- <th style="width: 15%"><spring:message code="lab_idNo" /></th>
									<th style="width: 25%"><spring:message code="lab_action" /></th> --%>
									<th><spring:message code="lab_idNo" /></th>
									<th><spring:message code="lab_action" /></th>
								</tr>
								</thead>
								<tbody id="idproofsIdsList">
								<c:forEach items="${seIssuanceData.idproofs}" var="idProofData"
									varStatus="status">
									<tr>
										<td align="left"><form:checkbox
												id="idProofCheck${idProofData.key}" path="idProofCheck"
												value="${idProofData.key}"
												onclick="addKeys('${idProofData.key}');fetchKycDescData('${idProofData.key}')" />&nbsp;${idProofData.value}</td>
											<%-- <td>${seIssuanceData.kycData[status.index].maxBalance}</td>
											<td>${seIssuanceData.kycData[status.index].perTxnLimit}</td>
											<td>${seIssuanceData.kycData[status.index].dailyTxnLimit}</td>
											<td>${seIssuanceData.kycData[status.index].monthlyTxnLimit}</td> --%>
										<td><form:input id="idNo${idProofData.key}"
												onkeypress="blockSpecialCharIdNumber(event,'idNoErrorId${idProofData.key}')"
												onchange="countId(this, 'idNoErrorId${idProofData.key}');"
												type="text" path="idNo" placeholder="ID Number"
												style="width:96%"
												
												disabled="true"  /></td>
										<td align="center">
											<form:input class="myfileclass"
												path="file" type="file"
												name="uploadButton${idProofData.key}"
												id="uploadButton${idProofData.key}" value="Upload"
												onchange="checkMultipleImageSizeAndExtension('uploadButton${idProofData.key}');"
												disabled="true" />
											<input align="left"
												style="width: 40%" id="removeButton${idProofData.key}"
												type="button" value="Remove"
												onclick="removeFunction(${idProofData.key});"
												disabled="disabled" />	
										</td>
									</tr>
							 	<tr>
									
										<td><div id="idProofCheckErrorId${idProofData.key}"></div></td>
										<td><div id="idNoErrorId${idProofData.key}"></div></td>
										<td><div id="uploadButtonErrorId${idProofData.key}"></div></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<!-- div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="button" class="btn btn-warning" value="Add More Information"  
					onclick="showAddressTable();" />
			</div> -->
			<div class="col-xs-12">
				<div class="transaction-table">
					<div class="table-responsive">
						<table id="seTableId"
							class="table table-bordered table-striped collapse">
							<thead>
								<tr>
								<th align="center"><spring:message code="LAB_ISSUED_BY" /></th>
								<th align="center"><spring:message code="LAB_PRODUCT_TYPE" /></th>
								<th align="center"><spring:message code="label_externalNo" /></th>
								<th align="center"><spring:message code="LAB_ISSUED_ON" /></th>
								<th align="center"><spring:message code="lab_action" /></th>
								
							<%-- 	<th align="center"><spring:message code="lab_hostName" /></th>
								<th align="center"><spring:message code="lab_product" /></th>
								<th align="center"><spring:message code="label_externalNo" /></th>
								<th align="center"><spring:message code="lab_status" /></th>
								<th align="center"><spring:message code="lab_action" /></th> --%>
							</tr>
							</thead>
							<tbody  id="seTablebodyId">
						
							<%-- <c:forEach items="${seIssuanceData.products}" var="seData"> --%>
							     
								<!-- <tr>
									<td align="center" id="lab_hostNameId"></td>
									<td align="center" id="lab_productId"></td>
									<td align="center" id="label_externalNoId"></td>
									<td align="center" id="lab_statusId"></td>
									<td align="center"><input type="button" value="Deactivate" id="deactivButtonId"
										onclick="deactivateSE(event);" /></td> -->
								</tr>
						<%-- 	</c:forEach> --%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xs-12 collapse" id='reasonId'>
				<table id='reasonTableId'>
				</table>
			</div>
			<div class="col-xs-12 collapse" id='otpdivId'>
				<table id='otpTableId'>
				</table>

			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<div id="emptyId"></div>
				<br>
			</div>
			<%-- <div class="collapse" id="adrssTable">
				<div class="col-xs-12 collapse" id='walletTableId'>
					<spring:message code="lab_cashIn_wallet" />
					<div class="transaction-table">
						<div class="table-responsive">
							<table id='walletTable'
								class="table table-bordered table-striped ">
								<tr>
									<th align="center"><spring:message code="lab_walletType" /></th>
									<th align="center"><spring:message code="lab_walletName" /></th>
								</tr>
								<c:forEach items="${seIssuanceData.idproofs}" var="idProofData"
									varStatus="status">
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="firstName" class="selecttag"
							onfocus="showlabel('lab_firstName','lab_customerFirstNameErrorId')"
							onchange="selecttag('lab_firstName','firstName')" 
							onkeypress="onlyAlphabetlatest(event,'lab_customerFirstNameErrorId', 'lab_firstName')" />
							
						<label id="lab_firstName"  class="valid" ><spring:message code="lab_customerFirstName" /></label>
						<label id="lab_customerFirstNameErrorId" class="collapse"></label>
					</div>
				</div>
				
				
				

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="lastName" class="selecttag"
							onfocus="showlabel('lab_lastName','lab_customerLastNameErrorId')"
							onchange="selecttag('lab_lastName','firstName')"
							onkeypress="onlyAlphabetlatest(event,'lab_customerLastNameErrorId','lab_lastName')" />
						<label id="lab_lastName" class="valid"><spring:message
								code="lab_customerLastName" /></label> <label
							id="lab_customerLastNameErrorId" class="collapse"></label>
					</div>
				</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="row">
						<div class="col-md-4 col-lg-4 pr0">
							<div id="div_pinCode" class="styled-input">
								<form:input type="text" path="pinCode" class="selecttag" id="pinCode"
									onchange="selecttag('label_pinCode','pinCode');"
									onfocus="removeHasError('div_pinCode')" onkeypress="changeValues()"/>
								<label id="label_pinCode" class="valid" >* Pin Code</label> <label id="lab_pinCodeErrorId"
									class="collapse"></label>
							</div>
						</div>
						<div class="col-md-8 col-lg-8 pl0">
	
							<input type="button" id="addressFetchId" class="btn btn-warrning"
								value="Fetch Address" onclick="fetchAddress();" />
	
						</div>
					</div>
	
				</div>

				<div class="col-xs-12" id="addressSelectDivId">
	    			<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'></table>
	    		</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="address" class="selecttag"
							onfocus="showlabel('lab_address','lab_addressErrorId')"
							onchange="selecttag('lab_address','address')" />
						<label id="lab_address"  class="valid" ><spring:message code="lab_address" /></label>
						<label id="lab_addressErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" class="selecttag"
							onfocus="showlabel('lab_locality','lab_localityErrorId')"
							onchange="selecttag('lab_locality','locality')" path="locality" />
						<label id="lab_locality" class="valid"><spring:message
								code="lab_locality" /></label> <label id="lab_localityErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="region" class="selecttag"
							onfocus="showlabel('lab_region','lab_regionErrorId')"
							onchange="selecttag('lab_region','region')" />
						<label id="lab_region" class="valid"><spring:message code="lab_Region" /></label>
						<label id="lab_regionErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" class="selecttag"
							onfocus="showlabel('lab_district','lab_districtErrorId')"
							onchange="selecttag('lab_district','district')" path="district" />
						<label id="lab_district" class="valid"><spring:message
								code="lab_district" /></label> <label id="lab_districtErrorId"
							class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="state" class="selecttag"
							onfocus="showlabel('lab_state','lab_StateErrorId')"
							onchange="selecttag('lab_state','state')" />
						<label id="lab_state" class="valid"><spring:message code="lab_State" /></label>
						<label id="lab_StateErrorId" class="collapse"></label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input type="text" path="country" class="selecttag"
							onfocus="showlabel('lab_Country','lab_CountryErrorId')"
							onchange="selecttag('lab_Country','country')" />
						<label id="lab_Country" class="valid"><spring:message code="lab_Country" /></label>
						<label id="lab_CountryErrorId" class="collapse"></label>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
					<div class="styled-input">
						<form:input id='emailId' type="text" class="selecttag"
							path="email"
							onfocus="showlabel('lab_email','lab_Email_IdErrorId')"
							onchange="selecttag('lab_email','emailId');validateEmail('emailId');"
							onclick="emptyerror(event,'lab_Email_IdErrorId');" />
						<label id="lab_email" class="valid"><spring:message code="lab_Email_Id" /></label>
						<label id="lab_Email_IdErrorId" class="collapse"></label>
					</div>
				</div>
				
			

			</div> --%>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="submit" class="btn btn-warning" value="Submit"
					onclick="return validateCustomer();" />
			</div>
		

	<!--  -->
<div class="col-xs-12"  id='submittedKycTableDiv'>
	                        	<h4 style="color:#ecbf67" align="center">   Submitted Document List</h4>
                       		 	<div class="transaction-table">
                         			<div class="table-responsive">
		                           		 <table  id='submittedKycTable' class="table table-bordered table-striped">
		                           		 	<thead>
		                           		 		<tr>
		                           		 			<th align="center">Document Type</th>
													<th align="center">Id Number</th>
													<th align="center">Status</th>
													<th align="center">Added On</th>
													<th align="center">Added By</th>
													<th align="center">Verified On</th>
													<th align="center">Verified By</th>
													<th align="center">Comment</th>
		                           		 			<%-- <th><spring:message code="lab_DocumentKycType" /></th>
			                           				<th><spring:message code="lab_DocumentKyc" /></th>
													<th width="300px;"><spring:message code="lab_idNo"/></th>
													<th><spring:message code="lab_Status" /></th>
													<th><spring:message code="lab_uploadDocument"/></th> --%>
		                           				</tr>
		                           		 	</thead>
		                           		 	<tbody id="kycWithStatus">
		                           		 	</tbody>
		                            	</table>
	                          	 	</div>
	                         	</div>
	                        </div>
	<!--  -->


		<input type="hidden" id="walletIds" name="walletIds" value="" />
		<input type="hidden" id="pinaddressId" name="pinaddressId" value="" />
		<input type="hidden" id="mgmtId" name="mgmtId" value="" />
		
		<input  type="hidden" id="messageId"   value=""  >
		
		<input  type="hidden"  id="mobilelengthId" value='${maxlength}' /> 
			
				<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	           
	           
	</form:form>
</body>
</html>