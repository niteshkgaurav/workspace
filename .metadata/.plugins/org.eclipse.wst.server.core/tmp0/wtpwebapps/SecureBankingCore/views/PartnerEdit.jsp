<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.PartnerData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Partner.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>

<link rel="stylesheet" href="/resources/demos/style.css">   	
<script type="text/javascript">
$(document).ready(function() {
var other='${other}';
var fsp='${fspother}';
var fin='${fin}';  	
getFspAndOtherServices(fin,fsp,other);
} );
</script>
<style type="text/css">
.styled-input1{position: relative}
option{padding: 0}
.styled-input1 .input-group .input-group-addon{background: transparent; border-radius:0; border:none; border-bottom: 1px solid #c1c2c1; position: relative; top:-25px}
.styled-input1 .input-group .input-group-addon i{top:8px}
.styled-input1 input, .styled-input1 select, .styled-input1 .selecttag, .styled-input1 textarea {font-size:13px; padding:0; display:block; width:100%; height:35px; background-color: transparent; border:none; position:relative; margin-bottom:0px; border-bottom:1px solid #c1c2c1;}
label{font-weight: 400}
.styled-input1 input:focus, .styled-input1 select:focus, .styled-input1 textarea:focus, .styled-input1 .input-group input:focus ~ .input-group-addon, .styled-input1 .selecttag:focus {outline:none; border-bottom:1px solid #eaa722;}
.styled-input1 label {color:#999; font-size:13px; font-weight:normal; position:absolute; pointer-events:none; left:0; top:5px; transition:0.2s ease all; -moz-transition:0.2s ease all; -webkit-transition:0.2s ease all;}
.styled-input1 input:focus  label, .styled-input1 input:not(:placeholder-shown)  label{top:-10px; font-size:13px; color:#eaa722;}
.styled-input1 textarea:focus  label, .styled-input1 textarea:not(:placeholder-shown)  label{top:-15px; font-size:13px; color:#eaa722;}
.styled-input1 select:focus label, .styled-input1 .selecttag:focus ~ label, .styled-input1 select:not([value=""]):valid label {top:-10px; font-size:13px; color:#eaa722;}
.styled-input1 .selecttag ~ label.valid,  .styled-input1 label.valid{top:-10px; font-size:13px; color:#eaa722;}
/* highlighter */
.styled-input1 ~ span {position:absolute; height:50%; width:100%; top:15%; left:0; pointer-events:none; opacity:0.5;}

/* active state */
.styled-input1 input:focus ~ span, .styled-input1 select:focus ~ span, .styled-input1 textarea:focus ~ span {-webkit-animation:inputHighlighter 0.3s ease; -moz-animation:inputHighlighter 0.3s ease; animation:inputHighlighter 0.3s ease;}

</style>

<title>Partner Edit</title>
</head>

<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body onload="editLoad();">
<form:form id="partnerForm" name ="partnerForm" method="post" modelAttribute="partnerData" action="${pageContext.request.contextPath}/AdminUI/partner/partnerUpdate">
	
	<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	            <h1 class="pull-left"><spring:message code="lab_partner_edit"/></h1>
	            
	            	<%
Integer menuId=(Integer)request.getAttribute("menuId");
Integer submenuId=(Integer)request.getAttribute("submenuId");
String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
%>
	<div class="clearfix"></div>
	<hr>
		
		<div style="${typeCodeStyle}" >
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    			<div class="styled-input">
    				<font size="4px"><a href="${pageContext.request.contextPath}/AdminUI/partner/partnerRegistration?enc=<%=encryptId%>"><spring:message code="label_partner_Creation"/></a></font>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
    			<div class="styled-input">
					<font size="4px" > <a href="${pageContext.request.contextPath}/AdminUI/partner/partnerListing?enc=<%=encryptId%>"><spring:message code="label_partner_list" /></a></font>
				</div>
			</div>	
		</div>
		<br>
		<br>
	  </div> 
	
	   
	
	    <div class="row">
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          				<spring:message code="lab_partnerCompanyName" var="lab_partnerCompanyName"/>
	  					<form:input type="text" path="companyName" placeholder="."  class="selecttag"
	  					onclick="emptyerror(event,'lab_partnerCompanyNameErrorId');"
	  					onfocus="showlabel('companyNameId','lab_partnerCompanyNameErrorId');"
					    onChange="selecttag('companyNameId','companyName');"/>
	  				<label id="companyNameId" class="valid">${lab_partnerCompanyName}</label>
					<label id="lab_partnerCompanyNameErrorId" class="collapse"></label><span></span>
					</div>
				</div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          				<spring:message code="lab_type" var="lab_type"/>
	  					<form:select path="partnerType"  class="selecttag"  
	  					onfocus="showlabel('partnerTypeId','lab_typeErrorId');"
	  						 onchange="selecttag('partnerTypeId','partnerType');showWallet('partnerType');emptyerror(event,'lab_typeErrorId');"> 
                            	<form:option value="0" label=" "/>                                     
                                <form:option value="PAYMENT_BANK" label="Payment Bank" />
                                <form:option value="DIRECT_BANK_API" label="Direct Bank API" />
                                <form:option value="WALLET" label="Wallet" />
                                <form:option value="OTHER_PARTNER" label="Other Parnter" />                                        
	                     </form:select>
	                     <label id="partnerTypeId" class="valid">${lab_type}</label>
	                     <label id="lab_typeErrorId" class="collapse"></label>
	                </div>
	             </div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center" id="Div_walletTypeId" style="display:none">
          			<div class="styled-input">
          				<spring:message code="lab_walletType" var="lab_walletType"/>
	  						<form:select path="walletType"  class="selecttag" 
	  						 onchange="selecttag('walletTypeId','walletType');showAccountDetails('walletType','branchCodeId','accountNumberId');emptyerror(event,'lab_walletTypeErrorId');"
	  						 onfocus="showlabel('walletTypeId','lab_walletTypeErrorId');">
	  							<form:option value="0" label=" "/>
	  							<form:option value="BANKING" label="Banking"/>
	  							<form:option value="OTHER" label="Other"/>
	  							<form:option value="INTERNAL" label="Internal"/>
	  						</form:select>
	  					<label id="walletTypeId" class="valid">${lab_walletType}</label>	
						<label id="lab_walletTypeErrorId" class="collapse"></label>
					</div>
				</div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          			 <spring:message code="lab_partnerNickName" var="lab_partnerNickName"/>
	  					<form:input type="text" path="nickName"  class="selecttag" 
	  					onclick="emptyerror(event,'lab_partnerNickNameErrorId');"
	  					onfocus="showlabel('nickNameId','lab_partnerNickNameErrorId');"
					    onChange="selecttag('nickNameId','nickName');"/>
	  				<label id="nickNameId" class="valid">${lab_partnerNickName}</label>
	  				<label id="lab_partnerNickNameErrorId" class="collapse"></label><span></span>
	  				</div>
	  			</div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          				<spring:message code="lab_mappingName" var="lab_mappingName"/>
	  						<form:select path="mappingName"  class="selecttag"  
	  						onchange="selecttag('mappingNameId','mappingName');confirmMappingNameValidity('mappingName');" 
	  						onclick="emptyerror(event,'lab_mappingNameErrorId');"
	  						onfocus="showlabel('mappingNameId','lab_mappingNameErrorId');">
	  							<form:option value="0" label=" "/>
	  							<form:options items="${mappingDataList}"/>
	  						</form:select>
	  					<label id="mappingNameId" class="valid">${lab_mappingName}</label>
	  					<label id="lab_mappingNameErrorId" class="collapse"></label>
	  				</div>
	  			</div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center" id="branchCodeId" style="display:none">
          			<div class="styled-input">
          				<spring:message code="lab_branchCode" var="lab_branchCode"/>
	  					<form:input type="text" path="branchCode" class="selecttag"  
	  					onclick="emptyerror(event,'lab_branchCodeErrorId');"
	  					onfocus="showlabel('branchCodeId','lab_branchCodeErrorId');"
					    onChange="selecttag('branchCodeId','branchCode');"/>
	  					<label id="branchCodeId" class="valid">${lab_branchCode}</label>	
	  					<label id="lab_branchCodeErrorId" class="collapse"></label>
	  				</div>
	  			</div>
	  			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center" id="accountNumberId" style="display:none">
          			<div class="styled-input">	
          				<spring:message code="lab_accountNumber" var="lab_accountNumber"/>
	  					<form:input type="text" path="accountNumber" class="selecttag" 
	  					onclick="emptyerror(event,'lab_accountNumberErrorId');"
	  					onfocus="showlabel('accountNumberId','lab_accountNumberErrorId');"
					    onChange="selecttag('accountNumberId','accountNumber');"/>
	  				<label id="accountNumberId" class="valid">${lab_accountNumber}</label>	
	  				<label id="lab_accountNumberErrorId" class="collapse"></label>
	  				</div>
	  			</div>
	  		</div>
	  			<!------------------- Financial Instrument ---------------------->	
	  		<div class="row">
		  		<div class="heading-inner  ">
		            <h1 class="pull-left"><spring:message code="lab_financialInstrument"/></h1>
        	    </div>
	  				<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover ">
	  						<thead class="default">
	  						<tr>
	  							<th>
	  								<spring:message code="lab_financialInstrument"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  								<input type="button" disabled id="finButton" value="Financial Instrument Banks" onclick="openBank('Financial Instrument Bank List','bankDivId','lab_financialInstrumentErrorId');"/>
	  							</th>
							</tr>
							</thead>
							<tbody>
	  				<c:forEach var="listVar" items="${financialInstNameList}"> 
	  					<c:if test="${listVar.type=='NI'}">
							<tr><td>
	  									<table width='100%'>
	  										<tr>
	  											<td width='30%' align='center'>${listVar.name}</td>
          										<td width='70%' align='left'><form:checkbox path="financialInstrument" id="financialInstrument${listVar.id}" value="${listVar.id}" onclick="incInstrumentCount(id,'Financial Instrument Bank List','${listVar.name}');"/></td>
											</tr>
										</table>
          					</td></tr>
						</c:if>
					</c:forEach>
	  			</table>
	  		</div>
				</div>
				</div>
				</div>
				<label id="lab_financialInstrumentErrorId" class="collapse"></label>	
			</div>
	  		
	  		<div id='bankDivId'style='display:none'>
	  				<table border="1" cellpadding='0' rules='none' width='100%' id='bankTableId'>
	  				</table>
	  		</div>
	  		
	  		<!------------------------------------	FSP FINANCIAL INSTRUMENT --------------------------------------->	
	  		<div id="fundtransfer" class="row">
		  		<div class="heading-inner  ">
		            <h1 class="pull-center"><spring:message code="lab_fspFundTransferServiceHeading"/></h1>
        	    </div>
	  					<c:set var="fspService" value="0" scope="page" />
	  					<c:set var="fundFsp" value="0" scope="page"/>
		            		<div class="row">
		            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 			<div class="transaction-table" >
                     		<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover " id="table_id">
                           	<thead class="default">
                          		 <tr>
                          		 <th></th>
	                                  	<th><spring:message code="lab_fspFundTransferServiceHeading"/></th>
	                                  	<th><spring:message code="lab_servicetype"/></th>
	                                  	<th><input type="button" disabled id="fspButton" value="FSP Fund Transfer Service Banks" onclick="openBank('FSP Fund Transfer Services Bank List','bankDivId','fspregisterErrorId');"/></th>
	                             </tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach var="fspServicelistVar" items="${fspServicesData}" >
	  						<c:if test="${fspServicelistVar.type=='BANKING'}">
	  						<c:choose>
	  						<c:when test="${fspServicelistVar.instrument=='NEW'}">
	  						<c:set var="fundFsp" value="${fundFsp + 1}" scope="page"/>
	  						</c:when>
	  						</c:choose>
	  						<c:set var="fspService" value="${fspService + 1}" scope="page"/>
	  						</c:if> 
	  						
	  						</c:forEach>
	  						</tbody>
	  						</table>
						</div>
						</div>
						</div>
						</div>
	  						
	  				<input type="hidden" id ="fspServiceCount" value="${fspService}"/>
	  				<label id="fspregisterErrorId" class="collapse"></label>
	  				</div>
	  		
	  		
	  		
	  	<!------------------------------------------------ Other Services ----------------------------------------------->	
	  		<div id="otherServices" class="row">
		  		<div class="heading-inner  ">
		            <h1 class="pull-center"><spring:message code="lab_otherServices"/></h1>
		        </div>
	  				<c:set var="otherServ" value="0" scope="page"/>
	  				<div class="row">
		            			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover " id="table_id1">
                           <thead class="default">
                          		<tr>
                          				<th></th>
          								<th><spring:message code="lab_otherServices"/></th>
          								<th><spring:message code="lab_servicetype"/></th>
          								<th><input type="button" disabled id="otherButton" value="Other Service Banks" onclick="openBank('Other Services Bank List','bankDivId','otherServiceErrorId');"/></th>
          						</tr>
	  						</thead>
	  						<tbody>
	  							<c:forEach var="fspServicelistVar" items="${fspServicesData}">
	  							<c:if test="${fspServicelistVar.type=='OTHER'}">
	  							<c:set var="otherServ" value="${otherServ + 1}" scope="page"/>
	  							</c:if> 
	  							</c:forEach>
	  						</tbody>
	  					</table>
	  					</div>
	  					</div>
	  					</div>
	  					
	  			</div>
	  		<label  id="otherServiceErrorId" class="collapse"></label>
	  		</div>
	  		<!----------------------------------------------- Provider ---------------------------------------------------->	
	  		<div class="row">
		  		<div class="heading-inner  ">
		            <h1 class="pull-center">Direct Providers</h1>
		        </div>
	  		<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
                     	<table class="table table-striped table-bordered table-hover " id="providerCodeTableId">
                           <thead class="default">
                           		<tr>
          								<th>Category Name</th>
          								<th>Provider Name</th>
	  									<th>Action</th>
	  									<th>Provider Code</th>
	  							</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach var="catProvider" items="${catProviderMapList}">
		  					<c:forEach var="provider" items="${catProvider.value}">
	  						<tr>
	  						<td width='30%' align="center">${catProvider.key.name}</td>
	  						<td width='30%' align="center">${provider.name}</td>
	  						<td width='10%' align="center"><form:checkbox id="providers_${catProvider.key.id}__${provider.id}" path="providers" value="${provider.id}#${catProvider.key.id}" onclick="showProviderCode('providers_${catProvider.key.id}__${provider.id}','providerCode_${catProvider.key.id}_${provider.id}','providerCode${catProvider.key.id}_${provider.id}','providerCode${catProvider.key.id}_${provider.id}ErrorId');emptyerror(event,'lab_providerErrorId');"/></td>
	  						<td width='30%' id="providerCode_${catProvider.key.id}_${provider.id}" >
	  							<br>
	  							<div class="styled-input1">
	  							<form:input id="providerCode${catProvider.key.id}_${provider.id}" path="providerCode" class="selecttag"
	  								value="${provider.thirdPartyCode}" disabled="${provider.directDisableValue}" 
	  								onblur="empty('providerCode${catProvider.key.id}_${provider.id}','lab_providerErrorId');" 
	  								onclick="emptyerror(event,'providerCode${catProvider.key.id}_${provider.id}ErrorId');"
	  								onfocus="showlabel('providerCode${catProvider.key.id}_${provider.id}Id','providerCode${catProvider.key.id}_${provider.id}ErrorId');"
					    			onChange="selecttag('providerCode${catProvider.key.id}_${provider.id}Id','providerCode${catProvider.key.id}_${provider.id}');"/>
					    			<label id="providerCode${catProvider.key.id}_${provider.id}Id" class='valid'>Third Party Code</label>
	  								<label id="providerCode${catProvider.key.id}_${provider.id}ErrorId" class="collapse"></label>
	  							</div>
	  						</td>
	  						</tr><!--   -->
	  						</c:forEach>
	  						</c:forEach>
	  						</tbody>
	  					</table>
	  				</div>
	  				</div>
	  				</div>
	  			</div>
	  			<label id="lab_providerErrorId" class="collapse"></label>
	  		</div>
	  			
	  			<!-------------------  ---------------------->
	  		<div class="row">
		  		<div class="heading-inner  ">
		            <h1 class="pull-center">FSP Providers</h1>
		        </div>
	  			<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover "  id="fspprovidercodeTableId">
                           <thead class="default">
                          		<tr>
          								<th>Category Name</th>
          								<th>Provider Name</th>
	  									<th>Action</th>
	  									<th>Provider Code</th>
	  							</tr>
	  						</thead>
	  						<tbody>
	  				<c:set var="fspcatprov" value="" scope="page"/>
	  				<c:forEach var="catProvider" items="${catProviderMapList}">
	  					<c:forEach var="provider" items="${catProvider.value}">
	  						<tr>
	  							<td width='30%'>${catProvider.key.name}</td>
	  							<td width='30%' align="center">${provider.name}</td>
	  							<td width='10%' align="center"><form:checkbox  id="fspproviders_${catProvider.key.id}__${provider.id}" path="fspproviders" value="${provider.id}#${catProvider.key.id}" onclick="showProviderCode('fspproviders_${catProvider.key.id}__${provider.id}','fspProviderCodeId_${catProvider.key.id}__${provider.id}','fspProviderCode${catProvider.key.id}__${provider.id}','fspProviderCode${catProvider.key.id}__${provider.id}ErrorId');emptyerror(event,'fspCatProvErrorId');"/></td>
	  							<td width='30%' id="fspProviderCodeId_${catProvider.key.id}__${provider.id}" >
	  							<br>
	  							<div class="styled-input1">
	  							<form:input id="fspProviderCode${catProvider.key.id}__${provider.id}" path="fspProviderCode" 
	  							value="${provider.fspThirdPartyCode}" disabled="${provider.fspDisableValue}"  class="selecttag"
	  							onblur="empty('fspProviderCode${catProvider.key.id}__${provider.id}','fspCatProvErrorId');" 
	  							onclick="emptyerror(event,'fspProviderCode${catProvider.key.id}__${provider.id}ErrorId')"
	  							onfocus="showlabel('fspProviderCode${catProvider.key.id}__${provider.id}Id','fspProviderCode${catProvider.key.id}__${provider.id}ErrorId');"
					    		onChange="selecttag('fspProviderCode${catProvider.key.id}__${provider.id}Id','fspProviderCode${catProvider.key.id}__${provider.id}');"/>
					    		<label id="fspProviderCode${catProvider.key.id}__${provider.id}Id" class="valid" >Third Party Code</label>
					    		<label id="fspProviderCode${catProvider.key.id}__${provider.id}ErrorId" class="collapse"></label>
	  							</div>
	  							</td>
	  						</tr>
	  						<c:set var="fspcatprov" value="${fspcatprov},${catProvider.key.id}__${provider.id}" scope="page"/>
	  					</c:forEach>
	  				</c:forEach>
	  				</tbody>
	  			</table></div>
	  				</div>
	  				</div>
	  				</div>
	  			<input type="hidden" id="fspcatprovlist" value="${fspcatprov}"/>
	  		<label id="fspCatProvErrorId" class="collapse"></label>
	  		</div>
	  		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  		<div style="${typeCodeStyle}"><input type="submit"  value="Submit" onclick="validatePartner(event);"/></div>
	  		<input type="hidden" id="instrumentList" value="${financialInstNameList}"/>
			<input type="hidden" id="category" value="${catProviderMapList}"/>
			<input type="hidden" id="bankServiceval" name="bankServiceval" value="${partnerData.bank}"/>
			<input type="hidden" id="otherServiceval" name="otherServiceval" value="${partnerData.otherBank}"/>
			<input type="hidden" id="fspFundTransferServiceval" name="fspFundTransferServiceval" value="${partnerData.fspfundTransferBank}"/>
			<input type="hidden" id="riFspBankServiceval" name="riFspBankServiceval" value="${partnerData.rifundTransferBank}"/>
			<input type="hidden" id="fspBankServiceval" name="fspBankServiceval" value="${partnerData.fspBank}"/>
			<input type="hidden" id="partnerCode" name="partnerCode" value="${partnerData.partnerCode}"/>
			<input type="hidden" id="typeVal" name="typeVal" value="${partnerData.partnerType}"/>
			<input type="hidden" id="walletTypeVal" name="walletTypeVal" value="${partnerData.walletType}"/>
			<input type="hidden" id="directBankCountVal" name="directBankCountVal" value="${partnerData.directBankCount}"/>
			<input type="hidden" id="fspProviderBankCountVal" name="fspProviderBankCountVal" value="${partnerData.fspProviderBankCount}"/>
			<input type="hidden" id="directBankInstCountVal" name="directBankInstCountVal" value="${partnerData.directBankInstCount}"/>
			<input type="hidden" id="fspProvBankInstCountVal" name="fspProvBankInstCountVal" value="${partnerData.fspProvBankInstCount}"/>
			<input type="hidden" id="fspVal" name="fspVal" value="${partnerData.fsp}"/>
			<input type="hidden" id="riVal" name="riVal" value="${partnerData.rifspfinancialInstrument}"/>
			</div>



 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

</form:form>
</body>
</html>
