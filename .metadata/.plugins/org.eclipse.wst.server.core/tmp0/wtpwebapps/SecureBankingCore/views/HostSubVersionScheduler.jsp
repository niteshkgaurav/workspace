<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hostSubVersionScheduler.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD',
		minDate : 'now',
		 useCurrent: false,
    });
});
</script>
 
 
<title>Host Sub Version Scheduler</title>
</head>
<body>
<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					Wallets
				</h1>

</div>
</div>
<div class="row">
<form:form id="hostSubVersionCreation" method="post"
		modelAttribute="hostSubVersionCreationData" action="${pageContext.request.contextPath}/AdminUI/hostMgmtController/hostSubVersionSchedulerPost">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive">
						<div id="walletsTableId">
						
								<table class="table table-striped table-bordered table-hover ">
								<thead>
									<tr style="color: #e3a122">
									<th>Action</th>
										<th>Wallets</th>
										<th>Schedule Date</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${partnerWalletDatas}"
										var="partnerWalletDatas">
								<tr class="tableLabel">
								<td><form:checkbox	path="walletcheckBox" class="walletcheckBox" name="walletcheckBox" id="walletcheckBox${partnerWalletDatas.walletId}" value="${partnerWalletDatas.walletId}" onclick="enableDateandStatus('walletcheckBox${partnerWalletDatas.walletId}','walletDate${partnerWalletDatas.walletId}','walletstatus${partnerWalletDatas.walletId}');"
																								 /></td><td>${partnerWalletDatas.name}</td>
								
								
								
								<td>	<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" path="walletDate"  id="walletDate${partnerWalletDatas.walletId}"  disabled="true" autocomplete="off" value="${partnerWalletDatas.walletDate}" onclick="selecttag('startDateId','walletDate${partnerWalletDatas.walletId}');emptyerror(event,'startDateErrorId');selct('startDateId');clearErrorMsg('walletdatetd${partnerWalletDatas.walletId}')" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','walletDate${partnerWalletDatas.walletId}');" />
					<label id="startDateId" class="valid">Date</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div></td>

								<c:choose>
												<c:when test="${partnerWalletDatas.walletstatus=='Active'}">
													<td><form:select path="walletstatus" id="walletstatus${partnerWalletDatas.walletId}"  value="${partnerWalletDatas.walletstatus}" disabled="true"><option value="Active" >Active</option><option value="DeActive">DeActive</option></form:select></td>
								
												</c:when>
												<c:when test="${partnerWalletDatas.walletstatus=='DeActive'}">
												<td><form:select path="walletstatus" id="walletstatus${partnerWalletDatas.walletId}"  value="${partnerWalletDatas.walletstatus}" disabled="true"><option value="DeActive" >DeActive</option><option value="Active">Active</option></form:select></td>	
												</c:when>
											</c:choose>
											</tr>
											<tr>
											<td></td>
											<td></td>
											<td id="walletdatetd${partnerWalletDatas.walletId}"></td>
											</tr>
											</c:forEach>
								</tbody>
								</table>
								
								
						</div></div></div></div>
						
						
						<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">
					&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="lab_provider" />
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive" style="height: 300px;overflow: auto;">
						<div >
							<table class="table table-striped table-bordered table-hover "
								id="table_id2">
								<thead>
									<tr style="color: #e3a122">
									<th>Action</th>
										<th>Category Name</th>
										<th>Provider Name</th>
										<th>Start Date</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="catProvider"
										items="${providersdata}">
										<tr>
										<td><form:checkbox	path="providercheckBox" class="providercheckBox" name="providercheckBox" id="${catProvider.categoryId}${catProvider.providerId}" value="${catProvider.categoryId}#${catProvider.providerId}" onclick="enableDateandStatus('${catProvider.categoryId}${catProvider.providerId}','providersDate${catProvider.categoryId}${catProvider.providerId}','providerStatus${catProvider.categoryId}${catProvider.providerId}');" ></form:checkbox></td>
										<td>${catProvider.categoryName}</td>
										<td>${catProvider.providerName}</td>
										
										<td>	<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" path="providersDate"  id="providersDate${catProvider.categoryId}${catProvider.providerId}" value="${catProvider.providersDate}"  disabled="true" autocomplete="off" onclick="selecttag('startDateId','providersDate${catProvider.categoryId}${catProvider.providerId}');emptyerror(event,'startDateErrorId');selct('startDateId');clearErrorMsg('datetd${catProvider.categoryId}${catProvider.providerId}')" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','providersDate${catProvider.categoryId}${catProvider.providerId}');" />
					<label id="startDateId" class="valid">Date</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div></td>

								
								<c:choose>
												<c:when test="${catProvider.providerStatus=='Active'}">
													<td><form:select path="providerStatus" class="providerStatus" id="providerStatus${catProvider.categoryId}${catProvider.providerId}"  value="${catProvider.providerStatus}" disabled="true"><option value="Active" >Active</option><option value="DeActive">DeActive</option></form:select></td>
								
												</c:when>
												<c:when test="${catProvider.providerStatus=='DeActive'}">
												<td><form:select path="providerStatus" class="providerStatus" id="providerStatus${catProvider.categoryId}${catProvider.providerId}"  value="${catProvider.providerStatus}" disabled="true"><option value="DeActive" >DeActive</option><option value="Active">Active</option></form:select></td>	
												</c:when>
											</c:choose>
									</tr>
									<tr>
									<td></td>
									<td></td>
									<td></td>
									<td id="datetd${catProvider.categoryId}${catProvider.providerId}"></td>
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
					&nbsp;&nbsp;&nbsp;Services
				</h1>

</div>
</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div class="transaction-table">
					<div class="table-responsive" style="height: 300px;overflow: auto;">
						<div>
						
								<table class="table table-striped table-bordered table-hover ">
								<thead>
									<tr style="color: #e3a122">
									<th>Action</th>
										<th>Services</th>
										<th>Schedule Date</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
								
								
								<c:forEach items="${servicesdata}"
										var="partnerServicesDatas">
								<tr class="tableLabel">
					
								<td><form:checkbox	path="servicescheckBox" class="servicescheckBox" name="servicescheckBox" id="servicescheckBox${partnerServicesDatas.serviceConfigId}" value="${partnerServicesDatas.serviceConfigId}" onclick="enableDateandStatus('servicescheckBox${partnerServicesDatas.serviceConfigId}','serviceDate${partnerServicesDatas.serviceConfigId}','servicestatus${partnerServicesDatas.serviceConfigId}');"
																								 /></td><td>${partnerServicesDatas.serviceConfigName}</td>
							
								 
								 			<td>	<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" path="serviceDate"  id="serviceDate${partnerServicesDatas.serviceConfigId}" value="${partnerServicesDatas.serviceDate}"  disabled="true" autocomplete="off" onclick="selecttag('startDateId','serviceDate${partnerServicesDatas.serviceConfigId}');emptyerror(event,'startDateErrorId');selct('startDateId');clearErrorMsg('serviceDatetd${partnerServicesDatas.serviceConfigId}')" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','serviceDate${partnerServicesDatas.serviceConfigId}');" />
					<label id="startDateId" class="valid">Date</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div></td>
								
								
								<c:choose>
												<c:when test="${partnerServicesDatas.servicestatus=='Active'}">
													<td><form:select path="servicestatus" id="servicestatus${partnerServicesDatas.serviceConfigId}"  value="${partnerServicesDatas.servicestatus}" disabled="true" ><option value="Active" >Active</option><option value="DeActive">DeActive</option></form:select></td>
								
												</c:when>
												<c:when test="${partnerServicesDatas.servicestatus=='DeActive'}">
												<td><form:select path="servicestatus" id="servicestatus${partnerServicesDatas.serviceConfigId}"  value="${partnerServicesDatas.servicestatus}" disabled="true"><option value="DeActive" >DeActive</option><option value="Active">Active</option></form:select></td>	
												</c:when>
											</c:choose>
											</tr>
											<tr>
									<td></td>
									<td></td>
									
									<td id="serviceDatetd${partnerServicesDatas.serviceConfigId}"></td>
											
											</c:forEach>
								
								
								
								</tbody>
								</table>
								
								
						</div></div></div></div>
						
						
						
						
						
						
						
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Submit" onclick="return validateform(event)"
				 />
		</div>
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
						</form:form></div>

</body>

</html>























