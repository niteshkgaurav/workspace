<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.MasterVersionData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Master Version Creation</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/master-version.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<style>
.error {
	display: none;
}
.styled-input textarea{
resize: none;
padding-top: 8px !important;
}
</style>

<script type="text/javascript">



</script>




</head>
<form:form id="masterVersionForm1" method="post"
	modelAttribute="masterVersionData"
	action="${pageContext.request.contextPath}/AdminUI/MasterVersionCreation/masterVersionEditSubmit">
	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
			<div id="msgId"	class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

			</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:input path="mVersionName" class="selecttag" maxlength="20"
					id="mVersionName" name="mVersionName" type="text"
					onkeypress="emptyerror(event,'mVersionNameErrorId');"
					onfocus="emptyerror(event,'mVersionNameErrorId');showlabel('label_mVersionName','mVersionNameErrorId')"
					onchange="selecttag('label_mVersionName','mVersionName');return checkMasterVersionName(this.id);"
					onclick="removeMsg();" />
				 <label id="label_mVersionName" class="valid"><spring:message
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
				 <label id="label_mVersionDecsription" class="valid" ><spring:message
						code="masterVerDescription" /></label> <label
					id=mVersionDecsriptionErrorId class="collapse"></label>

			</div>

		</div>

		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" path="mVersionCode" id="mVersionCode" />

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:input path="smscode" id="smscode" class="selecttag"
					maxlength="20" name="smscode" type="text"
					onfocus="showlabel('label_smscode','msmsCodeErrorId')"
					onkeypress="onlyNumric(event,'msmsCodeErrorId');"
					onclick="emptyerror(event,'msmsCodeErrorId')"
					onchange="selecttag('label_smscode','smscode');return checkSmscode(this.id);" />
				<span></span> <label id="label_smscode" class="valid"><spring:message
						code="label_smscode" /></label> <label id=msmsCodeErrorId
					class="collapse"></label>

			</div>

		</div>
<div id="dialog" title="Reason For Enable/Disable" class="collapse">
<label>Comment:</label>
<div id="commError"></div>
<input id="comment" name="comment" type="text" onclick="removeCommError()"/>
<input  type="button"  onclick="enableOrDisableMasterVersion('${mversionid}')" value="Submit"/>
</div>
<script type="text/javascript">
$("#dialog").dialog({
 autoOpen: false
 });
 </script>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<c:if test="${masterVersionData.status eq 1}">
				<input type="radio" id="radio1" checked="checked" name="masterVersionStatus" value="1" style="width: 10%;" onclick="enablePopUp(this)"/><label for="radio1">Enabled</label>			
				<input type="radio" id="radio2" name="masterVersionStatus" value="0" style="width: 10%;" onclick="enablePopUp(this)"/><label for="radio2">Disabled</label>
			</c:if>
			<c:if test="${masterVersionData.status eq 0}">
				<input type="radio" id="radio1"  name="masterVersionStatus" value="1" style="width: 10%;" onclick="enablePopUp(this)"/><label for="radio1">Enabled</label>			
				<input type="radio" id="radio2" checked="checked" name="masterVersionStatus" value="0" style="width: 10%;" onclick="enablePopUp(this)"/><label for="radio2">Disabled</label>
			</c:if>
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
												<p class="text-danger">No data found .</p>
											</c:if>


											<c:forEach items="${masterVersionData.categoryProviderMap}"
													var="map" varStatus="loop">
												
													<tr>
														<td>
															<a id="${loop.index}" href="#" onclick="showProviderRow(this.id)">
																<img src='${pageContext.request.contextPath}/images/add_image_icon.png' id="imgId${loop.index}" />
															</a>
														</td>
														<c:forEach items="${map.key}" var="item">
														<input type="hidden" id="key${item.key}" value="${item.key}"/>
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
																			<c:set var="flag" value="0"></c:set>
																			<c:forEach items="${masterVersionData.allocatedServiceIds}" var="id">
																			
																				<c:if test="${p.key eq id}">
																					<c:set var="flag" value="1"></c:set>
																					<td><input type="checkbox" id="key${p.key}" value="${map.key}-${p.key}" disabled="disabled" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
																				</c:if>
																				
																				
																			</c:forEach>
																				<c:if test="${flag ne 1}">
																					<td><input type="checkbox" id="key${p.key}" value="${map.key}-${p.key}" disabled="disabled"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
																				</c:if>
																			
																				<td style="text-align: left;"><label style="font-weight: bold;">${p.value}</label></td>
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
										<table class="table table-bordered table-striped">
											<tr>
												<td colspan="3" align="center">
													<div style="height: 150px; overflow: auto">
														<table width='100%' border='0' class='tableMain'
															bordercolor='#000000' cellspacing='1' cellpadding='0'>

															<tr>
																<td align="center">
																	<!-- <div id="providersErrorId"></div> -->
																</td>
															</tr>
															<c:forEach var="catProvider"
																items="${catProviderMapList}">
																<tr>
																	<td width="30%" align="right"><u><b>${catProvider.key.name}</b></u></td>
																</tr>
																<c:forEach var="provider" items="${catProvider.value}"
																	varStatus="status">
																	<tr>
																		<td></td>
																		<td width="30%" align="left">${provider.name}</td>
																		<td width="10%" align="left"><form:checkbox
																				id="providers${status.count}${provider.id}"
																				path="providers" name="providers" disabled="true"
																				value="${provider.id}#${catProvider.key.id}"
																				onclick="ifchecked('${status.count}${provider.id}');getProviderPartners('providers${status.count}${provider.id}','${provider.id}','DIRECT','providers','${catProvider.key.id}');" /></td>
																		
																		<td width="60%"><table
																				id="DIRECTProvidersPartner_table${provider.id}"
																				style="border: thin solid;"></table></td>
																	</tr>
																</c:forEach>
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
						<c:if test="${not empty masterVersionData.walletcheckBoxName}">
					<tr>
						<td colspan="2" align="center">
							<table width="60%" cellspacing="0" cellpadding="0" border="0">
								<tr>
									<td align="center" colspan=""><b>Choose
											Wallets&nbsp;&nbsp;</b></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
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
																<td colspan="3"><div id="walletTypeErrorId"
																		align="center"></div></td>
															</tr>
															<c:forEach items="${masterVersionData.walletdata}"
																var="partnerWalletData" varStatus="status">
																<tr class="tableLabel">
																	<td align="left" width="30%"><span>${partnerWalletData.name}</span></td>

																	<td align="left" width="10%"   ><form:checkbox 
																			path="walletcheckBoxName"  disabled="true"
																			value="${partnerWalletData.id}"
																			name="walletcheckBoxName"  
																			id="w${partnerWalletData.id}"/></td>
																</tr>

															</c:forEach>

														</table>
													</div>
												</td>
											</tr>
											<c:if test="${empty masterVersionData.categoryProviderMap}">

												<script language="JavaScript" type="text/JavaScript">
										
								     $('input[type="submit"]').prop('disabled', true);
								     </script>

											</c:if>

										</table>
									</div>
								</div>
							</div>
						</td>
					</tr>
</c:if>
					<!-- ============= ends ================= -->

				</table>
			</div>
		</div>
	</div>
<!-- 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"> -->
<!-- 		<input type="submit" class="btn btn-warning" -->
<!-- 			onClick="return validateForm();" value="Update" /> -->
<!-- 	</div> -->


 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
   <input type="hidden" value="" name="check" id="check">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
<input type="hidden" id="context"
	value="${pageContext.request.contextPath}">
<script>
pushWallet();
</script>
</html>

