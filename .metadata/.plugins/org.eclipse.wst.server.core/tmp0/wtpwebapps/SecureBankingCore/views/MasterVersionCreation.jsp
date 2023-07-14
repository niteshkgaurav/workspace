<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.MasterVersionData" %>
<%@ page import="com.ng.sb.common.dataobject.ServiceConfigData" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Master Version Creation</title>	

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript"src="${pageContext.request.contextPath}/js/Partner.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/master-version.js></script>
<script type="text/javascript"	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"	src=${pageContext.request.contextPath}/js/master-version-services.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript">
$(document).ready(function() {
	$('#master_id').DataTable({
        "scrollY":        "400px",
        "scrollCollapse": true,
        "paging":         true,
        "pagingType": "simple_numbers"
  }); 
		  
	  $("input[name='services_ids']").each( function () {
			addMasterServices(this,0);
	   });
	  
} );


</script>
<style type="text/css">
.styled-input textarea{
resize: none;
padding-top: 8px !important;
}
</style>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
 <body>
<form:form id="masterVersionForm" method="post"
	modelAttribute="masterVersionData"
	action="${pageContext.request.contextPath}/AdminUI/MasterVersionCreation/masterVersionSubmit">
	<input type="hidden"/>
	
	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			<spring:message code="lable.masterVersion.title.page" />
		</h1>
		<div class="clearfix"></div>
		<hr>

		<c:if test="${statusMessage!=''}">
			<div id="msgId"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p class="text-success">${statusMessage}</p>
			</div>
		</c:if>
	</div>


<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right ">
			<button type="button" class="btn btn-warning " onclick="toggleform('masterversionRowId');">Create
				Master Version</button>

		</div>
	
	
	<div style="height:75px" ></div>
	<div class="row collapse"  id="masterversionRowId"  >

		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:input path="mVersionName" class="selecttag" maxlength="20"
					id="mVersionName" name="mVersionName" type="text"
					onkeypress="emptyerror(event,'mVersionNameErrorId');"
					onfocus="emptyerror(event,'mVersionNameErrorId');showlabel('label_mVersionName','mVersionNameErrorId')"
					onchange="selecttag('label_mVersionName','mVersionName');return checkMasterVersionName(this.id);"
					onclick="removeMsg();" />
				<span></span> <label id="label_mVersionName" class="valid"><spring:message
						code="masterVerName" /></label> <label id=mVersionNameErrorId
					class="collapse"></label>

			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:textarea path="mVersionDecsription" class="selecttag"
					maxlength="100" id="mVersionDecsription" name="mVersionDecsription"
					type="text"
					onchange="selecttag('label_mVersionDecsription','mVersionDecsription')"
					onkeypress="emptyerror(event,'mVersionDecsriptionErrorId'),blockSpecialChar(event,'mVersionDecsriptionErrorId');"
					onfocus="emptyerror(event,'mVersionDecsriptionErrorId');showlabel('label_mVersionDecsription','mVersionDecsriptionErrorId')" />
				<span></span> <label id="label_mVersionDecsription" class="valid"><spring:message
						code="masterVerDescription" /></label> <label
					id=mVersionDecsriptionErrorId class="collapse"></label>

			</div>

		</div>

		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" path="mVersionCode" id="mVersionCode" />
		<form:hidden path="serviceArray" id="services"/>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:input path="smscode" id="smscode" class="selecttag"
					maxlength="20" name="smscode" type="text"
					onfocus="showlabel('label_smscode','msmsCodeErrorId')"
					onkeypress="onlyNumric1(event,'msmsCodeErrorId','label_smscode');"
					onclick="showlabel('label_smscode','msmsCodeErrorId');"
					onchange="selecttag('label_smscode','smscode');return checkSmscode(this.id);" />
				<span></span> <label id="label_smscode"class="valid"><spring:message
						code="label_smscode" /></label> <label id=msmsCodeErrorId class="collapse"></label>
					

			</div>

		</div>

		<div class="col-xs-12">
			<div class="transaction-table">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<!-- ****************************************** Row for showing result message ******************************* -->



						<tr>
							<td colspan="2" align="center">


								<table width='90%' border='0' class='tableMain' cellspacing='1'
									cellpadding='0' border='0' bordercolor='#000000'>
									<tr>
										<td colspan="2"></td>
									</tr>
									<!-- ****************************************** Form Heading  ******************************* -->
									<tr>
										<td colspan="2"><div align="center"
												class="mainTableHeader">
												<b><spring:message code="lab_menuServices" /></b>
											
											</div></td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<table border="1" width='60%'>
												<c:if test="${empty masterVersionData.categoryProviderMap}">
													<script language="JavaScript" type="text/JavaScript">
										
												     	$('input[type="submit"]').attr('disabled', true);
												     </script>
													<p>
														<font color="red">No data found .</font>
													</p>
												</c:if>

												<c:forEach items="${masterVersionData.categoryProviderMap}"
													var="map" varStatus="loop">
													<tr>
														<td><a id="${loop.index}" href="#"
															onclick="showProviderRow(this.id)"><img
																src='${pageContext.request.contextPath}/images/add_image_icon.png'
																id="imgId${loop.index}" /></a></td>
														<c:forEach items="${map.key}" var="item">
															<c:set var="cat" value="${item.key}" />
															<td><b> ${item.value}</b></td>
														</c:forEach>
													</tr>
													<tr id="providerRowId${loop.index}" style="display: none;">
														<td></td>
														<td>
															<table>
																<c:forEach items="${map.value}" var="p">
																	<c:if test="${p.value!='1'}">
																		<tr>
																			<td><input type="checkbox" name="services_ids" id="${map.key}-${p.key}" value="${map.key}-${p.key}" onclick="addMasterServices(this,1)" checked="checked" />&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="text-align: left;"><label style="font-weight: bold;" for="${map.key}-${p.key}">${p.value}</label></td>
																		</tr>
																	</c:if>
																</c:forEach>
															</table>
														</td>
													</tr>
												</c:forEach>
											</table>
										</td>
									</tr>
								</table>
						<tr>
							<td colspan="2" align="center">
								<table width="60%" cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td></td>
										<td align="center" class="mainTableHeader"><div
												style="color: white">
												<spring:message code="lab_provider" />
											</div></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<div class="col-xs-12">
									<div class="transaction-table">
										<div class="table-responsive">
											<div
												class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
												id="providerErrorId" align="center"></div>
											<table class="table table-bordered table-striped" id="categoriesId">
												<tr>
													<td colspan="3" align="center" >
														<div style="height: 150px; overflow: auto">
															<c:forEach var="catProvider" items="${catProviderMapList}">
															<div id="cat${catProvider.key.id}">
															<table id="${catProvider.key.name}" width='100%' border='0' class='tableMain'
																bordercolor='#000000' cellspacing='1' cellpadding='0'>
																
																	<tr>
																		<td width="30%" align="Center"><u><b>${catProvider.key.name}</b></u></td>
																	</tr>
																	<c:forEach var="provider" items="${catProvider.value}"
																		varStatus="status">
																		<tr>
																			<td></td>
																			<td width="30%" align="left">${provider.name}</td>
																			<td width="10%" align="left"><form:checkbox
																					id="providers${status.count}${provider.id}"
																					path="providers" name="providers"
																					value="${provider.id}#${catProvider.key.id}"
																					onclick="enableprority();ifchecked('${status.count}${provider.id}');getProviderPartners('providers${status.count}${provider.id}','${provider.id}','DIRECT','providers','${catProvider.key.id}');" /></td>
																			<td width="60%"><table
																					id="DIRECTProvidersPartner_table${provider.id}"
																					style="border: thin solid;"></table></td>
																		</tr>
																	</c:forEach>
																
																	</table>
																	</div>
																</c:forEach>
															
														</div>

													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr id="walletTable">
							<td colspan="2" align="center">
								<table width="60%" cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td align="center" colspan=""><b>Choose
												Wallets&nbsp;&nbsp;</b></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="walletRows">
							<td align="center" colspan="2">
								<div class="col-xs-12">
									<div class="transaction-table">
										<div class="table-responsive">
											<table id='OrderRecieved_table'
												class="table table-bordered table-striped">
												<tr>
													<td align="center">
														<div id="walletsTableId">
															<table width="50%" border="0">
																<tr>
																	<td colspan="3">

																		<div
																			class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center"
																			id="walletTypeErrorId" align="center"></div>
																	</td>
																</tr>
																<c:forEach items="${masterVersionData.walletdata}"
																	var="partnerWalletData" varStatus="status">
																	<tr class="tableLabel">
																		<td align="left" width="30%"><span>${partnerWalletData.name}</span></td>

																		<td align="left" width="10%"><form:checkbox
																				path="walletcheckBoxName"
																				value="${partnerWalletData.id}"
																				id="w${partnerWalletData.id}" name="walletname" /></td>
																	</tr>

																</c:forEach>

															</table>
														</div>
													</td>
												</tr>


											</table>
										</div>
									</div>
								</div>
							</td>
						</tr>

						<!-- ============= ends ================= -->

					</table>
				</div>
			</div>
		</div>

	

	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		<input type="submit" class="btn btn-warning"
			onClick="return validateForm();checkSmscode(document.getElementById('smscode').value);"
			value="submit" />
	</div>
	
	<c:if test="${empty masterVersionData.categoryProviderMap}">

		<script language="JavaScript" type="text/JavaScript">
										
								     $('input[type="submit"]').prop('disabled', true);
								     </script>

	</c:if>


</div>
<br>
	<div class="col-xs-12 ">
		<div class="transaction-table">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="master_id">
    <thead>
					<tr>
						<th><spring:message code="masterVerName" /></th>
						<th><spring:message code="masterVerCode" /></th>
						<th><spring:message code="masterVerDescription" /></th>
						<th><spring:message code="lab_action" /></th>
					</tr>
</thead>
					<tbody>
						<c:forEach items="${masterVersionList}" var="masterVersionList"
							varStatus="loop">
							<tr>
								<td>${masterVersionList.mVersionName}</td>
								<td>${masterVersionList.mVersionCode}</td>
								<td>${masterVersionList.mVersionDecsription}</td>
								<%
								Integer menuId=(Integer)request.getAttribute("menuId");
				            	Integer submenuId=(Integer)request.getAttribute("submenuId");
				            	
												Integer id=	((MasterVersionData)(pageContext.findAttribute("masterVersionList"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "masterid="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
								<td><a
									href="${pageContext.request.contextPath}/AdminUI/MasterVersionCreation/mvEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
										title="edit"
										src='${pageContext.request.contextPath}/images/edit.gif'
										style='cursor: hand' /></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	

</form:form>
</body>
<input type="hidden" id="context"
	value="${pageContext.request.contextPath}">

<!-- <script>
	getMasterVersionDetails();
</script> -->
</html>
