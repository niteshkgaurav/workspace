<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SEIssuance.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Merchant.js"></script>
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/fileinput.css />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
		<title>Merchant Registration</title>

</head>
<body>



  <%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
  Integer menuId=(Integer)request.getAttribute("menuId");
  Integer submenuId=(Integer)request.getAttribute("submenuId");
  String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
 %>

<script>
$(document).ready(function() {
if('${merchantData.bankName}'!=''){
	   $('#bankNameDiv').show();
	   $('#branchDiv').show();
	   $('#bankAddressDiv').show();
}	

if('${merchantData.radio}'=="yes"){
	$('#kycHeader').show();
	$('#kycTable').show();
	  $('#businessId').show();
	   $('#want').hide();
	   $('#yes').prop('checked', true);
	   $('#no').prop('checked', false);
}
} ); 
function openPopup(url) {

	window.open(url, 'Image', 'width=500px,height=500px,resizable=1');
}
</script>
	<form:form id="merchantregistration" modelAttribute="merchantData" method="post" action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/approveMerchant" enctype="multipart/form-data">

		
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Approve Merchant</h1>
	                      <div class="clearfix"></div>
	                      <hr>
			<tr>
				<td align="center" colspan="2">
				<h5 id="msgId" align="center" style="color:green;">${successMessage}</h5>
				<h5 id="ermsgId" align="center" style="color:red;">${errorMessage}</h5>
				</td>
			</tr>
						

     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    <div class="styled-input" id="type_Div">
     
     
       <label class="valid"> <font color="red">*&nbsp;</font><spring:message code="lab_type"/></label>
      
   
       
       <form:select id="merchantType" path="type" onfocus="removeHasError('type_Div');"
       onchange="showCorporateMer('merchantType','corporateMerchantId','CORPORATE_MERCHANT','tillTableId');"
        onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_typeErrorId','lab_merchantType');removeHasError('type_Div');emptyerror(event,'lab_typeErrorId');" disabled='true'>
          <form:option value="0" label="  "/>
    <form:option value="INDIVIDUAL_MERCHANT" label="INDIVIDUAL MERCHANT"/>
          <form:option value="CORPORATE_MERCHANT" label="CORPORATE MERCHANT"/>
          <form:option value="COMPANY_OWNED_STORE" label="COMPANY OWNED STORE"/>
          <form:option value="FRANCHISE_OWNED_STORE" label="FRANCHISE OWNED STORE"/>
              <form:option value="COOPERATIVE_MERCHANT" label="COOPERATIVE MERCHANT"/>
          </form:select>
        
       <label id="lab_typeErrorId"></label>
        </div> 
   </div>
    <c:if test="${merchantData.merchantType eq 'COMPANY_OWNED_STORE'}">
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center"  id="corporateMerchantId" >
    <div class="styled-input">
    <label class="valid"> <spring:message code="lab_corporateMerchant"/></label>
    <form:select class="selectbox" path="corporateMerchant" onclick="emptyerror(event,'lab_corporateMerchantErrorId');" disabled='true'>
          <form:option value="0" label="<-----Select----->"/>
          <form:options items="${merchantData.corporateMerchants}" />
          </form:select>
          <label id="lab_typeErrorId"></label>
    </div>
    </div>
</c:if>
	  		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input" id="merchantCompanyNameDiv">
					
					<form:input type="text" id="merchantCompanyName" path="merchantCompanyName" onfocus="removeHasError('merchantCompanyNameDiv');" onkeypress="disableSomeSpecialCharacter(event,'lab_merchantCompanyNameErrorId');" onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_merchantCompanyNameErrorId','ddd');"
					onchange="checkField('merchantCompanyName','MerchantInfo','companyName','lab_merchantCompanyNameErrorId','ddd');" disabled='true'/>
					<label id="ddd" class="valid"><font color="red">*&nbsp;</font>Legal Name</label> <label
						id="lab_merchantCompanyNameErrorId" class="collapse"></label><span></span>
				</div>
			</div>
	
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input" id="merchantNameDiv">
					
					<form:input type="text" id="contactPersonName" path="contactPersonName" onfocus="removeHasError('merchantNameDiv');" disabled='true' onkeypress="disableSomeSpecialCharacter(event,'lab_contactPersonErrorId');" onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_contactPersonErrorId','eee');"/>
					<label id="eee" class="valid"><font color="red">*&nbsp;</font><spring:message code="lab_contactPerson"/></label> <label
						id="lab_contactPersonErrorId" class="collapse"></label><span></span>
				</div>
			</div>
			<c:if test="${deployedFor == 'DEFAULT'}">	
			 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">		
				<div class="row">
					<div class="col-md-4 col-lg-4 pr0">
						<div id="div_pinCode" class="styled-input">
							
					  <form:input type="text" maxlength="6"
					path="pin" id="pin" onclick="refresh('msgId');refresh('ermsgId');clrpincode();showlabel('pincode','lab_pinCodeErrorId','pin')" onfocus="removeHasError('div_pinCode')"
					 onkeypress="onlyNumric(event,'lab_pinCodeErrorId','pincode'); " disabled='true'/>
							<label id="pincode" class="valid"><font color="red">*&nbsp;</font>PinCode</label>
							<label id="lab_pinCodeErrorId" class="collapse"></label>
								
		 				</div>
					</div>
					<div class="col-md-8 col-lg-8 pl0">

						<input type="button"  disabled class="btn btn-warning" id="addressFetchId" 
							value="Fetch Address" onclick="fetchAddress();" /></font>
				

					</div>
				</div>
			<div id="addressErrorId"></div>
			<div id='addressSelectDivIdPopup' style='display: none'>
			<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'></table>
			</div>
			</div>	
			</c:if>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div id="addressSelectDivId" class="styled-input">
					<form:input type="text" path="address" id="address" maxlength="20" disabled='true' onfocus="removeHasError('addressSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');emptyerror('lab_addressErrorId');" />
					<label id="lab_addr" class="valid"><font color="red">*&nbsp;</font>Address</label>
					 <label id="lab_addressErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="Region" class="styled-input">
					<form:input type="text" onclick="refresh('msgId');refresh('ermsgId');" disabled='true'
					path="region"  readonly="true"/>
					<label id="ii" class="valid">Region</label>
					 <label id="lab_regionErrorId" class="collapse"></label><span></span>	
				</div>
			</div>
						
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="Locality" class="styled-input">
					<form:input type="text" 
					path="locality"  readonly="true"/>
					<label id="imhh" class="valid">Locality</label>
					 <label id="lab_localityErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="cityDiv" class="styled-input">
					<form:input type="text" path="city"    onclick="removeHasError('cityDiv')" />
					<label id="imhh" class="valid"><font color="red">*&nbsp;</font>City</label>
					 <label id="lab_CityErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="District" class="styled-input">
					<form:input type="text" disabled='true'
					path="district" readonly="true"/>
					<label id="iilm" class="valid">District</label>
					 <label id="lab_districtErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div  class="styled-input" id="State">
				
				
					<form:input type="text" 
					path="statess" readonly="true" onfocus="clrmsg('lab_StateErrorId','iiaa')"/>
					<label id="iiaa" class="valid">State</label>
					 <label id="lab_StateErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
					
					
					
	<c:choose>	
			<c:when test="${deployedFor == 'DEFAULT'}">			
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="countrydiv" class="styled-input">
					<form:input type="text" path="countrys" id="country" onclick="removeHasError('countrydiv')"
				 readonly="true" onfocus="clrmsg('lab_CountryErrorId','ciaa')"/>
					<label id="ciaa" class="valid"><font color="red">*&nbsp;</font>Country</label>
					 <label id="lab_CountryErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			</c:when>
		<c:otherwise>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="countrydiv" class="styled-input">
					<form:input type="text" path="countrys" id="country" disabled='true' onclick="removeHasError('countrydiv')"
				 	 onfocus="clrmsg('lab_CountryErrorId','ciaa')"/>
					<label id="ciaa" class="valid"><font color="red">*&nbsp;</font>Country</label>
					 <label id="lab_CountryErrorId" class="collapse"></label><span></span>
				</div>
			</div>
		</c:otherwise>
			</c:choose>	
			
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="emailDivId" class="styled-input">
					<form:input type="text" path="email" id="email" disabled='true' value="${merchantData.email}" maxlength="50" onchange="validateEmail('email','lab_emailDivIdErrorId','hhh')"
					onfocus="removeHasError('emailDivId');" onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_emailDivIdErrorId','hhh');emptyerror('lab_emailDivIdErrorId');"/>
					<label id="hhh" class="valid"><font color="red">*&nbsp;</font>Email Id</label>
					 <label id="lab_emailDivIdErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="contactNumberDiv" class="styled-input">
					<form:input type="text" id="contactNumber"   disabled='true'
					path="contactNumber"  maxlength="${mobileLength}" 
					 onKeypress="clrmsg('mobileNumberErrorId','miaa');onlyNumric1(event,'mobileNumberErrorId','miaa');" onfocus="removeHasError('contactNumberDiv');"
					  onclick="refresh('msgId');refresh('ermsgId');clrmsg('mobileNumberErrorId','miaa');emptyerror('mobileNumberErrorId');"/>
											
					<label id="miaa" class="valid"><font color="red">*&nbsp;</font>Mobile Number</label>
					 <label id="mobileNumberErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>
			
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="statusDiv">
											<label id="username1"  class="valid"><font color="red">*&nbsp;</font>Status</label>
										<form:select path="status" disabled='true' id="status" onfocus="removeHasError('statusDiv');" onclick="refresh('msgId');refresh('ermsgId');emptyerror('lab_StatusErrorId');">
	  				<form:option value="0" label=" "/>
	  				<form:option value="ACTIVE" label="Active"/>
	  				<form:option value="INACTIVE" label="InActive"/>
	  				<form:option value="MIGRATED" label="Migrate"/>
	  				</form:select>											</div>
									</div>
									
									
									
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="merchantCategoryDiv">
											<label id="merchnt"  class="valid"><font color="red">*&nbsp;</font>Merchant Category Code</label>
										<form:select path="merchantCategory" disabled='true' id="merchantCategory" onclick="refresh('msgId');refresh('ermsgId');removeHasError('merchantCategoryDiv');emptyerror('lab_StatusErrorId');" onfocus="removeHasError('merchantCategoryDiv');">
	  				<form:option value="0" label=" "/>
					<form:options items="${merchantData.mapData}" />
	  								  			
	  				</form:select>											</div>
									</div>
									
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="styled-input">
								<label id="currencycode" class="valid">Currency Code</label>	
									 <form:select path="currencyCode" disabled='true' onclick="refresh('msgId');refresh('ermsgId');emptyerror('lab_StatusErrorId');">
	  				<form:option value="${merchantData.currencyCode}" label="${merchantData.currencyCode} "/>  								  			
	  				</form:select>											</div>
									</div>
									
									
									
	  	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="encryptDivId" class="styled-input">
					<form:input type="text" path="encryptionKey" disabled='true' maxlength="48" value="${merchantData.encryptionKey}" readOnly="true"
					 onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_encryptionKeyErrorId','hhg');emptyerror('lab_encryptionKeyErrorId');"/>
					<label id="hhg" class="valid">Encryption Key</label>
					 <label id="lab_encryptionKeyErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>							
									
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="licenseId">
											<label id="username1"  class="valid"><font color="red">*&nbsp;</font>Merchant Type</label>
										<form:select path="merchantType" disabled='true' id="license" onfocus="removeHasError('licenseId');" onclick="refresh('msgId');refresh('ermsgId');removeHasError('licenseId');">
										<form:option value="0" label=" "/>
	  				       <form:option value="Private Ltd Company" label="Private Ltd Company"/>
	  				       <form:option value="Public Ltd Company" label="Public Ltd Company" />
	  			        	<form:option value="Unlimited Company" label="Unlimited Company" />
	  			         	<form:option value="Sole proprietorship" label="Sole proprietorship"/>
	  			         		<form:option value="Joint Hindu Family business" label="Joint Hindu Family business"/>
	  			         		<form:option value="Partnership" label="Partnership"/>
	  			         		<form:option value="Cooperatives" label="Cooperatives"/>
	  			         		<form:option value="Limited Liability Partnership(LLP)" label="Limited Liability Partnership(LLP)"/>
	  			         		<form:option value="Liaison Office" label="Liaison Office"/>
	  			         		<form:option value="Branch Office" label="Branch Office"/>
	  			         		<form:option value="Project Office" label="Project Office"/>
	  			         		<form:option value="Subsidiary Company" label="Subsidiary Company"/>
	  				     </form:select>			
											</div>
									</div>
									</div>
	  									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left"> <h1><u>Account</u></h1><br></div>						
						<c:choose>
			<c:when test="${deployedFor == 'DEFAULT'}">				
			
				
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="ifscCodeSelectDivId" class="styled-input">
					<form:input type="text" path="ifscCode" disabled='true' name="ifsc"  id="ifsc" maxlength="15" onfocus="removeHasError('ifscCodeSelectDivId');"
		                 onchange="validateIfsc(event);" 
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_ifscCodeErrorId','lab_ifsc');emptyerror('lab_ifscCodeErrorId');" />
					<label id="lab_ifsc" class="valid">IFSC</label>
					 <label id="lab_ifscCodeErrorId" class="collapse"></label><span id="ifscErrorId"></span>
						
				</div>
				<%-- <c:if test="${not empty merchantData.ifscCode}">  --%>
				<div id="bankNameDiv" class="styled-input collapse" >
					<form:input id="bankName" type="text" path="bankName" readonly="true"/>
					<label class="valid">Bank Name</label>			
				</div>
				<div id="branchDiv" class="styled-input collapse">
					<form:input id="branch"  type="text" path="branch" readonly="true" />
					<label class="valid">Branch</label>						
				</div>
				<div id="bankAddressDiv" class="styled-input collapse">
					<form:input id="bankAddress"  type="text" path="bankAddress" readonly="true" />
					<label class="valid">Address</label>						
				</div>
				<%-- </c:if>  --%>
			</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="accountSelectDivId" class="styled-input">
					<form:input type="text" path="accountNumber" id="accountNumber" disabled='true' maxlength="20" onfocus="removeHasError('accountSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_accountErrorId','lab_accnt');emptyerror('lab_accountErrorId');" />
					<label id="lab_accnt" class="valid">Account Number</label>
					 <label id="lab_accountErrorId" class="collapse"></label><span></span>
						
				</div>
			</div>  
		</c:when>
		<c:otherwise>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div id="ifscCodeSelectDivId" class="styled-input">
					<form:input type="text" path="ifscCode" name="ifsc"  id="ifsc" disabled='true' maxlength="32" onfocus="removeHasError('ifscCodeSelectDivId');"
		            onclick="refresh('msgId');refresh('ermsgId');clrmsg('lab_ifscCodeErrorId','lab_ifsc');emptyerror('lab_ifscCodeErrorId');" />
					<label id="lab_ifsc" class="valid"><font color="red">*&nbsp;</font>IBAN</label>
					 <label id="lab_ifscCodeErrorId" class="collapse"></label><span id="ifscErrorId"></span>
						
				</div>
					
			</div>
		
		</c:otherwise>
			</c:choose>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left collapse" id="kycHeader"> <br><h1><u>KYC</u></h1><br></div>
		<div class="col-xs-12 collapse" id='kycTable'>
					 <div id="kycError" ></div>
					<h4><u>Personal KYC</u></h4><br>
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th style="width: 15%">Name</th>
									<th style="width: 15%">Id Number</th>
									<th style="width: 20%">Valid From</th>
									<th style="width: 20%">Valid To</th>
									<th style="width: 30%">Action</th>
								</tr>
											
								<c:forEach items="${merchantData.idproofs}" var="idProofData"
									varStatus="status">
									<c:if test="${idProofData.idType ne null}">
									<tr>
										<td align="left">
										
											<form:checkbox
												id="idProofCheck${idProofData.id}" name="idProofCheck" path="idProofCheck"
												value="${idProofData.id}" disabled='true'
												onclick="removeError('kycError');fetchKycDescData('${idProofData.id}')" checked="true" />
												&nbsp;<label for="idProofCheck${idProofData.id}">${idProofData.name}
												<c:if test="${idProofData.isMandatory!=null}">(${idProofData.isMandatory})</c:if></label></td>
										<td>
											<form:input id="idNo${idProofData.id}"
												onkeypress="blockSpecialCharIdNumber(event,'idNoErrorId${idProofData.id}')" disabled='true'
												type="text" path="idNo" placeholder="ID Number" style="width:96%" value="${idProofData.idType}"
												onclick="removeError('idNoErrorId${idProofData.id}')"
											 />
											 
										</td>
										<c:if test="${idProofData.validityRequired eq 0}">
											<td><label id="personalStartDate${idProofData.id}" />N/A
												</td>
											<td><label id="personalEndDate${idProofData.id}" />N/A
											</td>
										</c:if>
										<c:if test="${idProofData.validityRequired eq 1}">
											<td>
											 <div class="input-group date start" id="startDate"> 
												<form:input id="personalStartDate${idProofData.id}" path="personalStartDate" autocomplete="off" value="${idProofData.validFrom}"
												  onclick="removeError('fromDateErrorId${idProofData.id}');" class="form-control" type="text" disabled='true' />
						    					
						    					<div class="input-group-addon">
       										 <span class="glyphicon glyphicon-th"></span>
					    					</div></div> 
						    					<form:hidden path="personalKycIds" value="${idProofData.id}"/>
						    				</td>
											
											<td>
												<div class="input-group date end" id="endDate">
												<form:input id="personalEndDate${idProofData.id}"  autocomplete="off" path="personalEndDate" value="${idProofData.date}" disabled='true'
												onclick="removeError('toDateErrorId${idProofData.id}');" class="form-control" type="text"  />
							    				 <div class="input-group-addon" >
       										 <span class="glyphicon glyphicon-th"></span>
					    					</div></div>
							    			</td>
							    			
							    		</c:if>
										<td>
									
											<table>
									<tr>
										<td><input type="button" value="Browse..." disabled="true"
											onclick="document.getElementById('uploadButton${idProofData.id}').click()" />
										</td>
										<td><span id="photoSpan${idProofData.id}" style="margin-left: 3px"><a
													href="#"
													onclick="return openPopup('${merchantData.url}${idProofData.docName}');">ID</a></span></td>
									</tr>
								</table> 
												
														<form:input class="myfileclass"
																path ="file" type="file" style="display:none"
																name="uploadButton${idProofData.id}" disabled='true'
																id="uploadButton${idProofData.id}" value="Upload"
																onclick="removeError('uploadButtonErrorId${idProofData.id}');" 
																onchange="addSpan('photoSpan${idProofData.id}','uploadButton${idProofData.id}');checkMultipleImageSizeAndExtension('uploadButton${idProofData.id}');"
																 />
															<input id="removeButton${idProofData.id}" type="button" disabled value="Remove" style="width: 40%"
																onclick="removeFunction(${idProofData.id});"  />
																
															
															
												
										</td>
									</tr>
								
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<br>
					<div class="col-xs-12 collapse" id='businessId'>
					<h4><u>Business KYC</u></h4><br>
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th style="width: 15%">Name</th>
									<th style="width: 15%">Value</th>
									<th style="width: 20%">Valid From</th>
									<th style="width: 20%">Valid To</th>
									<th style="width: 30%">Action</th>
								</tr>
								<c:forEach items="${merchantData.businessIdProofs}" var="businessIdProofData" varStatus="status">
									<c:if test="${merchantData.kyc[status.index].docIdNumber ne null}">
									<tr>
																	<td align="left">
																	<form:checkbox
												id="businessIdProofCheck${businessIdProofData.key}" name="businessIdProofCheck" path="businessIdProofCheck"
												value="${businessIdProofData.key}" checked="true"  disabled="true"
												onclick="removeError('kycError');fetchBusinessKycData('${businessIdProofData.key}')" />
												&nbsp;${businessIdProofData.value}(Mandatory)</td>
												<td><form:input id="idName${businessIdProofData.key}"
												onkeypress="blockSpecialCharIdNumber(event,'idNameErrorId${businessIdProofData.key}')"
												type="text" path="idName" placeholder="ID Number" value="${merchantData.kyc[status.index].docIdNumber}" 
												style="width:96%"
												onclick="removeError('idNameErrorId${businessIdProofData.key}')"
												disabled="true"  /></td>
									<td><div class="input-group date start" id="startDate">
									<form:input id="startDate${businessIdProofData.key}" path="startDate" autocomplete="off"  value="${merchantData.kyc[status.index].addedOn}" 
										onclick="removeError('fromDateErrorId${businessIdProofData.key}');" disabled="true"  class="form-control" type="text"  />
									 <div class="input-group-addon">
       								 <span class="glyphicon glyphicon-th"></span>
					    			</div></div></td>
										
									<td><div class="input-group date end" id="endDate">
									<form:input id="endDate${businessIdProofData.key}" autocomplete="off" path="endDate" value="${merchantData.kyc[status.index].modifiedOn}" 
										onclick="removeError('toDateErrorId${businessIdProofData.key}');" disabled="true" class="form-control" type="text"  />
									 <div class="input-group-addon">
       								 <span class="glyphicon glyphicon-th"></span>
					    			</div></div></td>
					    			<td align="center">
											<table>
									<tr>
										<td><input type="button" value="Browse..." disabled="true"
											onclick="document.getElementById('businessUploadButton${businessIdProofData.key}').click()" />
										</td>
										<td><span id="businessSpan${businessIdProofData.key}" style="margin-left: 3px"><a
													href="#"
													onclick="return openPopup('${merchantData.url}${merchantData.kyc[status.index].docType}');">Business ID</a></span></td>
									</tr>
									</table> 
											<form:input class="myfileclass" style="display:none"
												path ="businessFile" type="file"
												name="businessUploadButton${businessIdProofData.key}"
												id="businessUploadButton${businessIdProofData.key}" value="Upload"
												onclick="removeError('businessUploadButtonErrorId${businessIdProofData.key}');" 
												onchange="addSpan('businessSpan${businessIdProofData.key}','businessUploadButton${businessIdProofData.key}');checkMultipleImageSizeAndExtension('businessUploadButton${businessIdProofData.key}');"/>
											<input align="left"
												style="width: 40%" id="businessRemoveButton${businessIdProofData.key}"
												type="button" value="Remove" disabled
												onclick="removeBusinessFunction(${businessIdProofData.key});"
												 />	
										</td>
										
										
									
									</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>








<!--  Approve reject pop up END  -->
				
			
	  			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="submit"class="btn btn-warning approveRejectClass" onclick="approveRejectComment('1',event)" value="Approve" />
				<input type="submit" class="btn btn-warning approveRejectClass" onclick="approveRejectComment('0',event)" value="Reject" />
				</div>
				
		 <input type="hidden" value="${menuId}" name="menuId" id="menuId">
		 		 <input type="hidden" value="${merchantData.contactNumber}" id="mobileNo">
	      <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	        <input type="hidden"  name="approve" id="approve">
		 <form:hidden id="userId" path="userId" value="${merchantData.userId}" /> 
		 <form:hidden id="pinaddressId" path="pinaddressId" value="${merchantData.pinaddressId}" /> 
		  <form:input type="hidden" path="id" value="${merchantData.id}"/>
		  
		  <div class="modal fade" data-keyboard="false" data-backdrop="static" id="myModal1" role="dialog">
			<div class="modal-dialog">
			
			  <!-- Modal content-->
			  <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <h4 class="modal-title">Comment</h4>
				</div>
				<div class="modal-body " >
					<span id="commentErrorId"></span>
					<form:textarea rows="20" id="commentId" path="comment" cols="20" style="margin: 0px; width: 572px; height: 133px;" onclick="removeCommentError()"/>
				</div>
				<div class="modal-footer" style="color:red;">
				
				 <button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
				 <button type="button" onclick="validateComment();" class="btn btn-default" >OK</button>
				</div>
			  </div>
			  
			</div>
		  </div>

	</form:form>

</body>
<!-- Approve reject pop up STARTED -->

 
</html>