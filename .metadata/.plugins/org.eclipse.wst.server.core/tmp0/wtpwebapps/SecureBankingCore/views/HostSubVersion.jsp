<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/HostSubVersion.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<title>Host Subversion</title>
 <style type="text/css">
 select option {
padding:0
  }
 </style>
</head>
<body>
	<form:form id="hostSimVersionCreation" method="post"
		modelAttribute="hostSubVersionData">
		<div class="row">
<%
LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
String key = loginData.getKey();
Integer menuId=(Integer)request.getAttribute("menuId");
Integer submenuId=(Integer)request.getAttribute("submenuId");
String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
%>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px"> <a
						href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/hostSubVersion?enc=<%=encryptId%>"><spring:message
								code="lab_Create_Sub_version" /> </a></font>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px" color="white"> <a
						href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/hostSubVersionList?enc=<%=encryptId%>"><spring:message
								code="lab_subVersionList" /></a></font>
				</div>
			</div>
		</div>

		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->

			<c:if test="${message!=''}">
				<div id="messagesIds"
					class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p>${message}</p>
				</div>
			</c:if>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_MasterVersion"
						var="lable_MasterVersion" />
					<form:select path="masterVersionId" class="selecttag"
						id="lable_sys_stkMenuVersion"
						onfocus="showlabel('lable_sys_stkMenuVersion_id','lable_sys_stkMenuVersion_ErrorId');"
						onchange="selecttag('lable_sys_stkMenuVersion_id','lable_sys_stkMenuVersion');getServicesByMenuVersion(event,'lable_sys_stkMenuVersion','lable_sys_stkMenuVersion_ErrorId');"
						onclick="emptyerror('lable_sys_stkMenuVersion_ErrorId');">
						<form:option value="" label=" " />
						<form:options items="${masterVersionDataList}" itemLabel="name"
							itemValue="id" multiple="false" />
					</form:select>
					<label id="lable_sys_stkMenuVersion_id">${lable_MasterVersion}</label>
					<label id="lable_sys_stkMenuVersion_ErrorId" class="collapse"></label>
				</div>
			</div>

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_HostSubVersionName"
						var="lable_HostSubVersionName" />
					<form:input type="text" id="lable_HostSimVersionName"
						path="hostSubVersionName" class="selecttag" placeholder="."
						onclick="emptyerror('errmsgByHostSimVersionName');"
						onfocus="showlabel('hsvNameId','errmsgByHostSimVersionName');"
						onChange="selecttag('hsvNameId','lable_HostSimVersionName');"
						onkeypress="javascript:return validateSpecialCharacter(event,'errmsgByHostSimVersionName','lable_HostSimVersionName')" />
					<label id="hsvNameId">${lable_HostSubVersionName}</label> <label
						id="errmsgByHostSimVersionName" class="collapse"></label><span></span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<spring:message code="lable_smsCode" var="lable_smsCode" />
					<form:input type="text" id="lable_smsCode" path="smsCode"
						class="selecttag" placeholder="."
						onclick="emptyerror('errmsgBysmsCode');"
						onfocus="showlabel('smsCodeId','errmsgBysmsCode');"
						onChange="selecttag('smsCodeId','lable_smsCode');"
						onkeypress="javascript:return validateSpecialCharacter(event,'errmsgBysmsCode','lable_smsCode')" />
					<label id="smsCodeId">${lable_smsCode}</label> <label
						id="errmsgBysmsCode" class="collapse"></label><span></span>
				</div>
			</div>
		</div>

		<div id ="serviceMenu" class="row collapse">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					<u><spring:message code="lab_menuServices" /></u>
				</h1>
			</div>
			<br>
			<br>
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
											<table class="table table-striped table-bordered table-hover"
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
			<br>
			<br>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="walletTypeErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="walletTable">
							<thead>
								<tr>
									<th>Wallets</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody >
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
		</div>
	
		<div class="row">
			<div class="heading-inner">
				<h1 class="pull-left">
					<u><spring:message code="lab_financialInstrument" /></u>
				</h1>
			</div>
		</div>
		<br>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="financialInstrumentErrorId" align="center"></div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover ">
							<thead>
								<tr>
									<th>Financial Instrument</th>
									<th>Action</th>
									<th>Add priority And Commission</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listVar" items="${financialInstNameList}">
										<tr>
											<td align='right' width='30%'>${listVar.name}&nbsp;&nbsp;:&nbsp;</td>
											<td align='center' width="5%"><form:checkbox id="financialInstrument${listVar.id}"
													path="financialInstrument" value="${listVar.id}"
													onclick="emptyerrormsg('financialInstrumentErrorId');getFinancialInstrumentPartner('${listVar.id}','DIRECT','financialInstrument');" /></td>
											<td width="65%"><table align="left"
													id="DIRECTPartner_table${listVar.id}"
													style="border: thin solid;"></table></td>
										</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
		<!-----------------------------------------		FSP FINANCIAL INSTRUMENT ------------------------------------------>
		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-center">
					<u><spring:message code="lab_fspFundTransferServiceHeading" /></u>
				</h1>
			</div>
			<c:set var="fspService" value="0" scope="page" />
			<c:set var="fundFsp" value="0" scope="page" />
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="fspotherServicesErrorId" align="center"></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover "
								id="table_id">
								<thead class="default">
									<tr>
										<th><spring:message
												code="lab_fspFundTransferServiceHeading" /></th>
										<th>Actions</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="fspServicelistVar" items="${fspServicesData}"
										varStatus="status">
										<c:if
											test="${fspServicelistVar.type== 'BANKING' && fspServicelistVar.instrument=='NEW' || fspServicelistVar.type== null}">
											<tr data-id="fspotherServices${fspServicelistVar.serviceId}" id="fspotherServices${fspServicelistVar.serviceId}">
												<td align='right' width='30%'>${fspServicelistVar.desc}&nbsp;&nbsp;:&nbsp;</td>
												<td align='center' width='5%'><form:checkbox
														id="fspotherServices${status.count}1"
														path="fspotherServices" value="${fspServicelistVar.id}"
														onclick="emptyerrormsg('fspotherServicesErrorId');getServicePartners('fspotherServices${status.count}1','${fspServicelistVar.id}','FSP_PROVIDER','fspotherServices');" /></td>
												<td width="65%"><table align="left"
														id="FSP_PROVIDERFSPServices_table${fspServicelistVar.id}"
														style="border: thin solid;"></table></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="fspService" value="${fspService + 1}" scope="page" />
			<input type="hidden" id="fspServiceCount" value="${fspService}" />
		</div>
	

		<div class="row">
			<c:set var="fspService" value="0" scope="page" />
			<c:set var="fundFsp" value="0" scope="page" />
			<div class="heading-inner">
				<h1 class="pull-left">
					<u><spring:message code="lab_otherServices" /></u>
				</h1>
			</div>
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="otherServicesErrorId" align="center"></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover "
								id="table_id1">
								<thead class="default">
									<tr>
										<th><spring:message code="lab_otherServices" /></th>
										<th>Actions</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="fspServicelistVar" items="${fspServicesData}"
										varStatus="status">
										
										<c:if
											test="${fspServicelistVar.type=='OTHER' && fspServicelistVar.isBankIncluded=='1'}">
											<tr  data-id="otherServices${fspServicelistVar.serviceId}" id="otherServices${fspServicelistVar.serviceId}">
												<td align='right' width='30%'>${fspServicelistVar.desc}&nbsp;&nbsp;:&nbsp;</td>
												<td align='center' width='5%'><form:checkbox
														id="otherServices${status.count}1" path="otherServices"
														value="${fspServicelistVar.id}"
														onclick="emptyerrormsg('otherServicesErrorId');getServicePartners('otherServices${status.count}1','${fspServicelistVar.id}','DIRECT','otherServices');" /></td>
												<td width="65%"><table align="left"
														id="DIRECTFSPServices_table${fspServicelistVar.id}"
														style="border: thin solid;"></table></td>
											</tr>
										</c:if>
										<c:if
											test="${fspServicelistVar.type=='OTHER' && fspServicelistVar.isBankIncluded=='0'}">
											<tr data-id="otherServices${fspServicelistVar.serviceId}" id="otherServices${fspServicelistVar.serviceId}">
												<td align='right' width='30%'>${fspServicelistVar.desc}&nbsp;&nbsp;:&nbsp;</td>
												<td align='center' width='5%'><form:checkbox
													id="otherServices${status.count}1" path="otherServices"
														value="${fspServicelistVar.id}"
														onclick="emptyerrormsg('otherServicesErrorId');getServicePartners('otherServices${status.count}1','${fspServicelistVar.id}','DIRECT','otherServices');" /></td>
												<td width="65%"><table align="left"
														id="DIRECTFSPServices_table${fspServicelistVar.id}"
														style="border: thin solid;"></table></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="fspService" value="${fspService + 1}" scope="page" />
			<input type="hidden" id="fspServiceCount" value="${fspService}" />
		</div>
	



		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-center">
					<u>Direct Provider</u>
				</h1>
			</div>
			<c:set var="fspService" value="0" scope="page" />
			<c:set var="fundFsp" value="0" scope="page" />
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="providersErrorId" align="center"></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover "
								id="table_id2">
								<thead class="default">
									<tr>
										<th>Category Name</th>
										<th>Provider Name</th>
										<th>Action</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="catProvider" items="${catProviderMapList}">
										<c:forEach var="provider" items="${catProvider.value}"
											varStatus="status">
											<tr id="directProvider${catProvider.key.id}" data-id="directProvider${catProvider.key.id}">
												<td width="20%" align="right">${catProvider.key.name}</td>
												<td align="left"width="15%">${provider.name}</td>
												<td align="center" width="5%"><form:checkbox
														id="providers${status.count}${catProvider.key.id}${provider.id}"
														path="providers"
														value="${catProvider.key.id} ${provider.id}"
														onclick="emptyerrormsg('providersErrorId');getProviderPartners('providers${status.count}${catProvider.key.id}${provider.id}','${catProvider.key.id}_${provider.id}','DIRECT','providers','${catProvider.key.id}');" /></td>
												<td width="60%"><table align="left"
														id="DIRECTProvidersPartner_table${catProvider.key.id}_${provider.id}"
														style="border: thin solid;"></table></td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="fspService" value="${fspService + 1}" scope="page" />
			<input type="hidden" id="fspServiceCount" value="${fspService}" />
		</div>
	

		<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-center">
					<u><spring:message code="lab_fspProviders" /></u>
				</h1>
			</div>
			<c:set var="fspService" value="0" scope="page" />
			<c:set var="fundFsp" value="0" scope="page" />
			<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
			id="fspprovidersErrorId" align="center"></div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover "
								id="table_id3">
								<thead class="default">
									<tr>
										<th>Category Name</th>
										<th>Provider Name</th>
										<th>Action</th>
										<th>Priority And Commission</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="fundFsp" value="0" scope="page" />
									<c:forEach var="catProvider" items="${catProviderMapList}">
										<c:forEach var="provider" items="${catProvider.value}"
											varStatus="status">
											<tr id="fspProvider${catProvider.key.id}" data-id="fspProvider${catProvider.key.id}">
												<td align="right" width="20%">${catProvider.key.name}</td>
												<td align="left" width="15%">${provider.name}</td>
												<td align="center" width="5%"><form:checkbox
														id="fspproviders${status.count}${catProvider.key.id}${provider.id}"
														path="fspproviders"
														value="${catProvider.key.id} ${provider.id}"
														onclick="emptyerrormsg('fspprovidersErrorId');getProviderPartners('fspproviders${status.count}${catProvider.key.id}${provider.id}','${catProvider.key.id}_${provider.id}','FSP_PROVIDER','fspproviders',${catProvider.key.id});" /></td>
												<td align="right" width="60%"><div>
														<table align="left"
															id="FSP_PROVIDERProvidersPartner_table${catProvider.key.id}_${provider.id}"
															style="border: thin solid;"></table>
													</div></td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="fspService" value="${fspService + 1}" scope="page" />
			<input type="hidden" id="fspServiceCount" value="${fspService}" /> <label
				id="fspregisterErrorId" class="collapse"></label>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Submit"
				onclick="return validateHostSubVersionPage();" />
		</div>
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

	</form:form>
</html>