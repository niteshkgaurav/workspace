<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
<script type="text/javascript"src="${pageContext.request.contextPath}/js/HostSubVersion.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function() {
var menuVersionId = $("#lable_sys_stkMenuVersion").val();
var cashInTableId = "cashInTableMenuServiceId";
var settingServiceTableId = "cashInSettingTableMenuServiceId";
var otherService = "otherService";
var settingService = "settingService";
if (menuVersionId.length > 0) {
$.ajax({
url : 'ajax/getServicesByMenuVersionId',
type : 'POST',
dataType:'json',
data : {
'menuVersionId' : menuVersionId,
'parentMenuId' : 0
},
success : function(response) {
var jsonObj = response;
var stkMenuServiceList = jsonObj.stkMenuServiceList;
var partnerWalletDatas=jsonObj.partnerDatas;
var serviceArray=jsonObj.serviceConfigIds;
var cashInSettingServiceTableId = "cashIn_setting_services";
var cashOutSettingServiceTableId = "cashOut_setting_services";
genrateCashInServiceTree("CashInTable",stkMenuServiceList,cashInTableId,otherService);
if(partnerWalletDatas.length>0){
	$("#walletMenu").show()
	}else{
		$("#walletMenu").hide();
		  $('#walletTable tbody').html('')
	}
$("#step3Tr").show();
$("#step4Tr").show();
$("#partnerCashInService").show();
$("#partnerCashInSettingService").show();
$("#partnerCashOutService").show();
$('#cashInImage').attr('src','/securebanking/images/add_image_icon.png');
$('#cashOutImage').attr('src','/securebanking/images/add_image_icon.png');
var selectedServices = $("#selectedServiceConfigIds").val();
selectedServices=selectedServices.replace(/[\[\]""]+/g,"").trim();
var res = selectedServices.split(",");
jQuery.each(res,function(index,value) {
$("#stkMenuServicecheckBoxName"+value.trim()).attr('checked',true);
});
var catArray=[];
for(var k=0;k<stkMenuServiceList.length;k++){
	for(var j=0;j<stkMenuServiceList[k].subServiceList.length;j++){
		if(stkMenuServiceList[k].subServiceList[j].categoryId!=null){
			catArray.push(stkMenuServiceList[k].subServiceList[j].categoryId);
		}	
	}
}
var rowsFsp = $('#table_id3 > tbody > tr');
var rowsDirect = $('#table_id2 > tbody > tr');
var other = $('#table_id1 > tbody > tr');
var financial = $('#table_id > tbody > tr');
for(var i=0;i<rowsFsp.length;i++){
	var fspId= rowsFsp[i].id;
	var catId=parseInt(fspId.replace( /[^\d]/g, '' ));
	if(!catArray.includes(catId)){
		$("[data-id='"+fspId+"']").hide();	
	}else{
		$("[data-id='"+fspId+"']").show();	
	}
	
}
for(var r=0;r<rowsDirect.length;r++){
	var directId= rowsDirect[r].id;
	var directCatId=parseInt(directId.replace( /[^\d]/g, '' ));
	if(!catArray.includes(directCatId)){
		$("[data-id='"+directId+"']").hide();	
		}else{
			$("[data-id='"+directId+"']").show();	
		}
}
for(var s=0;s<other.length;s++){
	var otherId= other[s].id;
	var otherServiceId=parseInt(otherId.replace( /[^\d]/g, '' ));
	if(serviceArray.includes(otherServiceId) || otherServiceId==0){
		$("[data-id='"+otherId+"']").show();	
		}else{
			$("[data-id='"+otherId+"']").hide();	
		}
}
for(var t=0;t<financial.length;t++){
	var financialId= financial[t].id;
	var financialServiceId=parseInt(financialId.replace( /[^\d]/g, '' ));
	if(serviceArray.includes(financialServiceId) || financialServiceId==0){
		$("[data-id='"+financialId+"']").show();	
		}else{
			$("[data-id='"+financialId+"']").hide();	
		}
}
 $('#table_id3').DataTable().draw();
  $("#table_id2").DataTable().draw();
  $('#table_id1').DataTable().draw();
  $("#table_id").DataTable().draw();
},
error : function(e) {
console.log(e.message);
}
});
} else {
$("#serviceMenu").toggle();
$("#serviceMenu").hide();
var table = document.getElementById(cashInTableId);
var numrows = table.rows.length;
while (numrows > 0)
table.deleteRow(--numrows);
$("#partnerCashInService").hide();
$("#partnerCashOutService").hide();
$("#step3Tr").hide();
}

})
</script>
</head>
<body>
	<form:form id="hostSimVersionCreation" method="post"
		modelAttribute="hostSubVersionEditData">
		<div class="row">
<%
LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
String key = loginData.getKey();
Integer menuId=(Integer)request.getAttribute("menuId");
Integer submenuId=(Integer)request.getAttribute("submenuId");
String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
%>
			<div style="${typeCodeStyle}">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input">
						<font size="4px"><a
							href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/hostSubVersion?enc=<%=encryptId%>"><spring:message
									code="lab_Create_Sub_version" /></a></font>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input">
						<font size="4px"> <a
							href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/hostSubVersionList?enc=<%=encryptId%>"><spring:message
									code="lab_subVersionList" /></a></font>
					</div>
				</div>
			</div>
		</div>
		<hr/>
		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->

				<div id="messagesIds"
					class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p>${message}</p>
				</div>
		</div>
		<div class="row">
			<div class="heading-inner  ">
				<!-- ****************************************** Form Heading  ******************************* -->
				<h1 class="pull-left">
					<u><spring:message code="lable_HostSubEdit" /></u>
				</h1>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_MasterVersion"
						var="lable_MasterVersion" />
					<form:select path="masterVersionId" class="selecttag"
						id="lable_sys_stkMenuVersion"
						onfocus="showlabel('lable_sys_stkMenuVersion_id','lable_sys_stkMenuVersion_ErrorId');"
						onchange="selecttag('lable_sys_stkMenuVersion_id','lable_sys_stkMenuVersion');getServicesByMenuVersion(event,'lable_sys_stkMenuVersion','lable_sys_stkMenuVersion_ErrorId');emptyerror(event,'lable_sys_stkMenuVersion_ErrorId');">
						<form:option value="" label="" />
						<form:options items="${masterVersionDataList}" itemLabel="name"
							itemValue="id" multiple="false" />
					</form:select>
					<label id="lable_sys_stkMenuVersion_id" class="valid">${lable_MasterVersion}</label>
					<label id="lable_sys_stkMenuVersion_ErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_HostSubVersionName"
						var="lable_HostSubVersionName" />
					<form:input id="lable_HostSimVersionName" type="text"
						path="hostSubVersionName" placeholder="." class="selecttag"
						onclick="emptyerror(event,'errmsgByHostSimVersionName');"
						onfocus="showlabel('hsvNameId','errmsgByHostSimVersionName');"
						onChange="selecttag('hsvNameId','lable_HostSimVersionName');" />
					<label id="hsvNameId" class="valid">${lable_HostSubVersionName}</label>
					<label id="errmsgByHostSimVersionName" class="collapse"></label><span></span>
				</div>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_smsCode" var="lable_smsCode" />
					<form:input id="lable_smsCode" type="text" path="smsCode"
						placeholder="." class="selecttag"
						onclick="emptyerror(event,'errmsgBysmsCode');"
						onfocus="showlabel('smsCodeId','errmsgBysmsCode');"
						onChange="selecttag('smsCodeId','lable_smsCode');" />
					<label id="smsCodeId" class="valid">${lable_smsCode}</label> <label
						id="errmsgBysmsCode" class="collapse"></label><span></span>
				</div>
			</div>
		</div>

		<div id="serviceMenu" class="row collapse">
			<div class="heading-inner">
				<h1 class="pull-left">
					<u><spring:message code="lab_menuServices" /></u>
				</h1>
			</div>
			<br/>
			<br/>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover ">
								<tr>
									<td colspan="2"><div id="serviceErrorId" align="center"></div></td>
								</tr>
								<tr>
									<td align="center">
										<div id="CashInTable">
											<table
												class="table table-striped table-bordered table-hover "
												id="cashInTableMenuServiceId">
											</table>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="walletMenu" class="row collapse">
			<div class="heading-inner">
				<h1 class="pull-left">
					<u><spring:message code="lab_ChooseWallet" /></u>
				</h1>
			</div>
	
			<br/>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="walletTypeErrorId" align="center"></div>
			
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover" id="walletTable">
								<thead>
									<tr>
										<th>Wallets</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${partnerWalletDatas}"
										var="partnerWalletData" varStatus="status">
										<tr class="tableLabel">
											<td align="left" width=""><form:checkbox
													path="walletcheckBoxName" value="${partnerWalletData.id}"
													id="w${partnerWalletData.id}"
													onclick="showWalletType('${partnerWalletData.id}',1);" /> <b><span>${partnerWalletData.name}</span></b>
											</td>
											<c:choose>
												<c:when test="${partnerWalletData.showWallet==1}">
													<td id="DrCrWalletTdId${partnerWalletData.id}" width="60%"
														align="left"><form:select class='formField' multiple="false"
															path="walletType" 
															id="walletTypeId${partnerWalletData.id}"
															onchange="emptyerrormsg('walletTypeErrorId');"
															style="width:80px">
																<form:option value="0" label="<-Select->" />
															<form:options items="${partnerWalletData.walletTypes}"
																multiple="false" />
														</form:select></td>
												</c:when>
												<c:when test="${partnerWalletData.showWallet==0}">
													<td 
														id="DrCrWalletTdId${partnerWalletData.id}" width="60%"
														align="left"><form:select disabled="true"
															class='formField' path="walletType"
															id="walletTypeId${partnerWalletData.id}" multiple="false"
															onchange="emptyerrormsg('walletTypeErrorId');"
															style="width:80px;display: none">
															<form:option value="0" label="<-Select->" />
															<form:options items="${partnerWalletData.walletTypes}"
																multiple="false" />
														</form:select></td>
												</c:when>
											</c:choose>
										</tr>
							</c:forEach>
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>


		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u><spring:message code="lab_financialInstrument" /></u>
				</h1>
			</div>
		</div>
<br/>
<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="financialInstrumentErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover ">
								<thead>
									<tr>
										<th>Financial Instrument</th>
										<th>Action</th>
										<th>Partner Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="listVar" items="${financialInstNameList}">
										<tr>
											<td align='right' width='30%'>${listVar.key.name}&nbsp;&nbsp;:&nbsp;</td>
											<td align='center' width="5%"><form:checkbox
													id="financialInstrument${listVar.key.id}"
													path="financialInstrument" value="${listVar.key.id}"
													onclick="emptyerrormsg('financialInstrumentErrorId');getFinancialInstrumentPartner('${listVar.key.id}','DIRECT','financialInstrument');" />
											</td>
											<c:choose>
												<c:when test="${listVar.key.showPartner==1}">
													<td width="65%">
														<table id="DIRECTPartner_table${listVar.key.id}"
															style="border: thin solid;">
															<c:forEach items="${listVar.value}" var="partnerVar"
																varStatus="status">
																<c:if test="${not empty listVar.key.id}">
																	<tr>
																		<td><form:checkbox
																				id="financialInstrumentPartnerMapping${listVar.key.id}${partnerVar.id}"
																				path="financialInstrumentPartnerMapping"
																				value="${partnerVar.partnerInstrumentMappingId}"
																				onchange="emptyerrormsg('financialInstrumentErrorId');addSequence('DIRECTfinancialInstrumentSequence${listVar.key.id}${partnerVar.id}','${(listVar.value).size()}','${partnerVar.partnerInstrumentMappingId}','financialInstrumentPartnerMapping${listVar.key.id}${partnerVar.id}');" />
																		</td>
																		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;${partnerVar.name}</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				id="DIRECTfinancialInstrumentSequence${listVar.key.id}${partnerVar.id}"
																				path="financialInstrumentPartnerMappingSequence" data-name="DIRECTfinancialInstrument${listVar.key.id}Sequence" 
																				onchange="emptyerrormsg('DIRECTfinancialInstrument${listVar.key.id}SequenceErrorId');
																				managePartner('DIRECTfinancialInstrument${listVar.key.id}Sequence','DIRECTfinancialInstrumentSequence${listVar.key.id}${partnerVar.id}','DIRECTfinancialInstrument${listVar.key.id}SequenceErrorId')">
																				<form:option  value="" label="select"/>
																				<form:options
																					items="${partnerVar.partnerSequenceMappingId}" />
																			</form:select ></td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				path="financialInstrumentPartnerMappingCommission">
																				<form:options
																					items="${partnerVar.partnerCommissionMappingId}" />
																			</form:select></td>
																			<td>
																			<div class="collapse" id="DIRECTfinancialInstrument${listVar.key.id}SequenceErrorId" align="left"></div>
																			</td>
																	</tr>
																</c:if>
															</c:forEach>
														</table>
													</td>
												</c:when>
												<c:when test="${listVar.key.showPartner==0}">
													<td width="65%">
														<table id="DIRECTPartner_table${listVar.key.id}"
															style="border: thin solid;">
														</table>
													</td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u><spring:message code="lab_fspHSVFundTransferService" /></u>
				</h1>
			</div>
		</div>
		<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="fspotherServicesErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover "
								id="table_id">
								<thead>
									<tr>
										<th>FSP Fund Transfer Services</th>
										<th>Action</th>
										<th>Partner Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="fspServicelistVar" items="${fspServicesData}" varStatus="status">
										<c:if test="${fspServicelistVar.key.type== 'BANKING' && fspServicelistVar.key.instrument=='NEW'|| fspServicelistVar.key.type== null}">
											<tr data-id="fspotherServices${fspServicelistVar.key.serviceId}" id="fspotherServices${fspServicelistVar.key.serviceId}">
												<td align='right' width='30%'>${fspServicelistVar.key.desc}&nbsp;&nbsp;:&nbsp;</td>
												<td align='center' width='5%'><form:checkbox 
														id="fspotherServices${status.count}1"
														path="fspotherServices"
														value="${fspServicelistVar.key.id}"
														onclick="emptyerrormsg('fspotherServicesErrorId');getServicePartners('fspotherServices${status.count}1','${fspServicelistVar.key.id}','FSP_PROVIDER','fspotherServices');" /></td>
													
												<c:choose>
													<c:when test="${fspServicelistVar.key.showPartner==1}">
														<td width="65%"><table
																id="FSP_PROVIDERFSPServices_table${fspServicelistVar.key.id}"
																style="border: thin solid;">

																<c:forEach items="${fspServicelistVar.value}"
																	var="partnerVar" varStatus="status1">
																	<tr>
																		<td><form:checkbox
																				id="FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}${partnerVar.id}"
																				path="fspProviderfspotherServices"
																				value="${partnerVar.partnerInstrumentMappingId}"
																				onchange="emptyerrormsg('fspotherServicesErrorId');addSequence('FSP_PROVIDERfspotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}','${(fspServicelistVar.value).size()}','${partnerVar.partnerInstrumentMappingId}','FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}${partnerVar.id}');" />
																		</td>
																		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;${partnerVar.name}</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				id="FSP_PROVIDERfspotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}"
																				path="fspProviderfspotherServicesSequence" data-name="FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}Sequence"
																					onchange="emptyerrormsg('FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}SequenceErrorId');
																				managePartner('FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}Sequence','FSP_PROVIDERfspotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}','FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}SequenceErrorId')" >
																				<form:options
																					items="${partnerVar.partnerSequenceMappingId}" />
																			</form:select></td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				id="FSP_PROVIDERfspotherServicesSequence${fspServicelistVar.key.id}${fspSequencemap.id}"
																				path="financialInstrumentCommissionMappingSequence" name="DIRECTfinancialInstrumentCommission">
																				<form:options
																					items="${partnerVar.partnerCommissionMappingId}" />
																			</form:select></td>
																			<td>
																			<div class="collapse" id="FSP_PROVIDERfspotherServices${fspServicelistVar.key.id}SequenceErrorId" align="left"></div>
																			</td>
																	</tr>
																</c:forEach>
															</table></td>
													</c:when>
													<c:when test="${fspServicelistVar.key.showPartner==0}">
														<td width="65%"><table
																id="FSP_PROVIDERFSPServices_table${fspServicelistVar.key.id}"
																style="border: thin solid;">
															</table></td>
													</c:when>
												</c:choose>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%----------------------------------------------- For Other Services -----------------------------------------------------------%>

		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u><spring:message code="lab_otherServices" /></u>
				</h1>
			</div>
		</div>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="otherServicesErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover "
								id="table_id1">
								<thead>
									<tr>
										<th>Other Services</th>
										<th>Action</th>
										<th>Partner Priority and Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="fspServicelistVar" items="${fspServicesData}" varStatus="status">
										<c:if test="${fspServicelistVar.key.type=='OTHER'}">
											<tr data-id="otherServices${fspServicelistVar.key.serviceId}" id="otherServices${fspServicelistVar.key.serviceId}">
												<td align='right' width='30%'>${fspServicelistVar.key.desc}&nbsp;&nbsp;:&nbsp;</td>
												<td align='center' width='5%'><form:checkbox
														id="otherServices${status.count}1" path="otherServices"
														value="${fspServicelistVar.key.id}"
														onclick="emptyerrormsg('otherServicesErrorId');getServicePartners('otherServices${status.count}1','${fspServicelistVar.key.id}','DIRECT','otherServices');" /></td>
												<c:choose>
													<c:when test="${fspServicelistVar.key.showPartner==1}">
														<td width="65%">
															<table
																id="DIRECTFSPServices_table${fspServicelistVar.key.id}"
																style="border: thin solid;">

																<c:forEach items="${fspServicelistVar.value}"
																	var="partnerVar" varStatus="status1">
																	<tr data-id="otherServices${fspServicelistVar.key.serviceId}" id="otherServices${fspServicelistVar.key.serviceId}">
																		<td><form:checkbox
																				id="DIRECTotherServices${fspServicelistVar.key.id}${partnerVar.id}"
																				path="directOtherServices"
																				value="${partnerVar.partnerInstrumentMappingId}"
																				onchange="emptyerrormsg('otherServicesErrorId');addSequence('DIRECTotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}','${(fspServicelistVar.value).size()}','${partnerVar.partnerInstrumentMappingId}','DIRECTotherServices${fspServicelistVar.key.id}${partnerVar.id}');" />
																		</td>
																		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;${partnerVar.name}</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				id="DIRECTotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}"
																				path="directOtherServicesSequence" data-name="DIRECTotherServices${fspServicelistVar.key.id}Sequence"
																					onchange="emptyerrormsg('DIRECTotherServices${fspServicelistVar.key.id}SequenceErrorId');
																				managePartner('DIRECTotherServices${fspServicelistVar.key.id}Sequence','DIRECTotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}','DIRECTotherServices${fspServicelistVar.key.id}SequenceErrorId')" >
																				<form:options
																					items="${partnerVar.partnerSequenceMappingId}" />
																			</form:select></td>

																		<td>&nbsp;&nbsp;&nbsp;&nbsp;<form:select multiple="false"
																				id="DIRECTotherServicesSequence${fspServicelistVar.key.id}${partnerVar.id}"
																				path="otherServicesCommissionMapping" name="DIRECTotherServicesCommission">
																				<form:options
																					items="${partnerVar.partnerCommissionMappingId}" />
																			</form:select></td>
																			<td>
																			<div class="collapse" id="DIRECTotherServices${fspServicelistVar.key.id}SequenceErrorId" align="left"></div>
																			</td>
																	</tr>
																</c:forEach>
															</table>
														</td>
													</c:when>
													<c:when test="${fspServicelistVar.key.showPartner==0}">
														<td width="65%"><table
																id="DIRECTFSPServices_table${fspServicelistVar.key.id}"
																style="border: thin solid;">
															</table></td>
													</c:when>
												</c:choose>
												
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%------------------------------------------------- Provider Services ---------------------------------------------------%>
		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u>Direct Provider</u>
				</h1>
			</div>
		</div>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="providersErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover "
								id="table_id2">
								<thead>
									<tr>
										<th>Category Name</th>
										<th>Provider Name</th>
										<th>Action</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="catProvider"
										items="${catProviderPartnerSequenceMap}">
										<c:forEach var="providerData"
											items="${catProvider.value.providersMap}" varStatus="status">
											<tr id="directProvider${catProvider.key.id}" data-id="directProvider${catProvider.key.id}">
												<td width="20%" align="right">${catProvider.key.name}</td>
												<td width="10%" align="left">${providerData.key.name}</td>
												<td width="5%" align="center"><form:checkbox
														id="providers${status.count}${providerData.key.id}${catProvider.key.id}"
														path="providersPath" value="${providerData.key.mappingId}"
														onclick="emptyerrormsg('providersErrorId');getProviderPartners('providers${status.count}${providerData.key.id}${catProvider.key.id}','${catProvider.key.id}_${providerData.key.id}','DIRECT','providers','${catProvider.key.id}');" />
												</td>
												<td width="65%">
													<table
														id="DIRECTProvidersPartner_table${catProvider.key.id}_${providerData.key.id}"
														style="border: thin solid;">
								
														<c:forEach items="${providerData.value.partnerMap}"
															var="partnerVar" varStatus="status1">
															<c:if test="${providerData.value.showData==1}">
															<tr>
																<td><form:checkbox
																		id="DIRECTproviders${providerData.key.id}${partnerVar.key.id}"
																		path="directProviders"
																		value="${partnerVar.key.mappingId}"
																		onchange="emptyerrormsg('providersErrorId');addSequence('DIRECTprovidersSequence${providerData.key.id}${status1.count}','${(providerData.value.partnerMap).size()}','${partnerVar.key.mappingId}','DIRECTproviders${providerData.key.id}${partnerVar.key.id}');" />
																</td>
																<td align="left">&nbsp;&nbsp;${partnerVar.key.name}</td>
																<td>&nbsp;&nbsp;<form:select multiple="false"
																		id="DIRECTprovidersSequence${providerData.key.id}${status1.count}"
																		path="directProvidersSequence" data-name="DIRECTproviders${catProvider.key.id}_${providerData.key.id}Sequence"
																					onchange="emptyerrormsg('DIRECTproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId');
																				managePartner('DIRECTproviders${catProvider.key.id}_${providerData.key.id}Sequence','DIRECTprovidersSequence${providerData.key.id}${status1.count}','DIRECTproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId')" >
																		<form:options
																			items="${partnerVar.value.partnerSequenceMappingId}" />
																	</form:select></td>
																<td>&nbsp;&nbsp;<form:select multiple="false"
																		id="DIRECTprovidersSequenceCommission${providerData.key.id}${status1.count}"
																		path="directProvidersSequenceCommission" name="DIRECTprovidersCommission">
																		<form:options
																			items="${partnerVar.value.partnerCommissionMappingId}" />
																	</form:select></td>
																		<td>
																			<div class="collapse" id="DIRECTproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId" align="left"></div>
																	</td>
															</tr>
															</c:if>
														</c:forEach>
													</table>
												</td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%------------------------------------------------- Last Provider Services ---------------------------------------------------%>
		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u>FSP Provider</u>
				</h1>
			</div>
		</div>
		<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="fspprovidersErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
							<table class="table table-striped table-bordered table-hover "
								id="table_id3">
								<thead>
									<tr>
										<th>Category Name</th>
										<th>Provider Name</th>
										<th>Action</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="catProvider"
										items="${catProviderPartnerfspSequenceMap}">
										<c:forEach var="providerData"
											items="${catProvider.value.providersMap}" varStatus="status">
											<tr  id="fspProvider${catProvider.key.id}" data-id="fspProvider${catProvider.key.id}">
												<td width="20%" align="right">${catProvider.key.name}</td>
												<td width="10%" align="left">${providerData.key.name}</td>
												<td width="5%" align="center">
													<form:checkbox
														id="fspproviders${status.count}${providerData.key.id}${catProvider.key.id}"
														path="fspprovidersPath"
														value="${providerData.key.mappingId}"
														onclick="emptyerrormsg('fspprovidersErrorId');getProviderPartners('fspproviders${status.count}${providerData.key.id}${catProvider.key.id}','${catProvider.key.id}_${providerData.key.id}','FSP_PROVIDER','fspproviders','${catProvider.key.id}');" />
												</td>
												<td width="65%">
													<table
														id="FSP_PROVIDERProvidersPartner_table${catProvider.key.id}_${providerData.key.id}"
														style="border: thin solid;">

														<c:forEach items="${providerData.value.partnerMap}"
															var="partnerVar" varStatus="status1">
															<c:if test="${providerData.value.showData==1}">
															<tr>
																<td><form:checkbox 
																		id="FSP_PROVIDERfspproviders${providerData.key.id}${partnerVar.key.id}"
																		path="fspProviderfspproviders"
																		value="${partnerVar.key.mappingId}"
																		onchange="emptyerrormsg('fspprovidersErrorId');addSequence('FSP_PROVIDERfspprovidersSequence${providerData.key.id}${status1.count}','${(providerData.value.partnerMap).size()}','${partnerVar.key.mappingId}','FSP_PROVIDERfspproviders${providerData.key.id}${partnerVar.key.id}');" />
																</td>
																<td align="left">&nbsp;&nbsp;${partnerVar.key.name}</td>
																<td>&nbsp;&nbsp;<form:select multiple="false"
																		id="FSP_PROVIDERfspprovidersSequence${providerData.key.id}${status1.count}"
																		path="fspProviderfspprovidersSequence"  data-name="FSP_PROVIDERfspproviders${catProvider.key.id}_${providerData.key.id}Sequence"
																					onchange="emptyerrormsg('FSP_PROVIDERfspproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId');
																				managePartner('FSP_PROVIDERfspproviders${catProvider.key.id}_${providerData.key.id}Sequence','FSP_PROVIDERfspprovidersSequence${providerData.key.id}${status1.count}','FSP_PROVIDERfspproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId')">
																		<form:options
																			items="${partnerVar.value.partnerSequenceMappingId}" />
																	</form:select></td>
																<td>&nbsp;&nbsp;<form:select multiple="false"
																		id="FSP_PROVIDERfspprovidersSequenceCommission${providerData.key.id}${status1.count}"
																		path="fspProvidersSequenceCommission" name="FSP_PROVIDERfspprovidersCommission">
																		<form:options
																			items="${partnerVar.value.partnerCommissionMappingId}" />
																	</form:select></td>
																		<td>
																			<div class="collapse" id="FSP_PROVIDERfspproviders${catProvider.key.id}_${providerData.key.id}SequenceErrorId" align="left"></div>
																	</td>
															</tr>
															</c:if>
														</c:forEach>
													</table>
												</td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Submit"
				onclick="return validateHostSubVersionPage();" />
		</div>

		

		<tr>
			<td height='10' colspan="3" align="center">&nbsp;<b><font
					color="red">${simversionCreationMess}</font></b></td>
		</tr>
		<tr>
			<td height="3" colspan="3" align="center"><font><span
					id="validationMess"></span></font></td>
		</tr>

		<tr>
			<td></td>
			<td><input id="selectedServiceConfigIds" type="hidden"
				value="${serviceConfigsIds}"></input></td>
		</tr>
		<tr>
			<td><input type="hidden" value="${hostSubVersionId}"
				id="hostSubVersionId" name="hostSubVersionId" /></td>
		</tr>
	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	
	
	</form:form>



</body>
</html>