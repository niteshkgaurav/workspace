<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.CommissionDatas" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
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
	src=${pageContext.request.contextPath}/js/portalCommission.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
     src="${pageContext.request.contextPath}/js/commission.js"></script>

<title>CommissionTemplateList</title>


<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
	<script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/commission/getEditCommissionList');
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );
</script>

</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body class="PageType">



	<form:form id="CommissionSubscriptionnForm"	name="CommissionSubscriptionnForm" method="post"
		modelAttribute="commissionData"
		action="${pageContext.request.contextPath}/AdminUI/commission/createSubscriptionTemplate">
		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">Subscription Template List</h1>
			<div class="clearfix"></div>
			<hr>

			<div id="sucessMessage"
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
				<p class="text-success">${successMessage}</p>
			</div>



			<div id="errorstatusMessage"
				class="has-success  col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

				<p>${errorMessage}</p>

			</div>

		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right ">
			<button type="button" class="btn btn-warning " onclick="toggleform('rootTable');">Create
				Subscription Template</button>
<div class="row">&nbsp;</div>
		</div>
		
		<div style="height:75px" ></div>


		<div id="rootTable" class="row collapse">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="name">

					<form:input class="selecttag" type="text" path="name" id="tempName"
						onclick="emptyerror(event,'nameError');"
						onchange="checkName('tempName','SubscriptionTemplate','name','nameError','label_tempName');selecttag('label_tempName','tempName')"
						onkeypress="emptyerror(event,'nameError');"
						onfocus="removeHasError('name');howlabel('label_tempName','nameError');" maxlength='50' />
					<label id="label_tempName" class="valid"><spring:message
							code="LABEL_TEMPNAME" /></label> <label id="nameError" class="collapse"></label>
				</div>
			</div>
		
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="subscription-input">
					<form:select class="selecttag" path="subscription"
						id="customerSubscription"
						onclick="emptyerror(event,'customerSubscriptionError');this.setAttribute('value', this.value);"
						value="" 
						onkeypress="emptyerror(event,'customerSubscriptionError');"
						onchange="selecttag('label_Subscription','customerSubscription');"
						onfocus="removeHasError('subscription-input');showlabel('label_Subscription','customerSubscriptionError');">
						<form:option value="" label=" " />
						<form:option value="AMOUNT" label="Amount" />
						<form:option value="PERCENTAGE" label="Percentage" />
					</form:select>

					<label id="label_Subscription"class="valid"><spring:message
							code="label_Subscription" /></label> <label id="customerSubscriptionError"
						class="collapse"></label>
				</div>
			</div>

	
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input"  id="host-input">
					<form:input type="number" step="0.01" min="0" max="100" class="selecttag"  path="hostSubscription" id="hostSubscription"
						onclick="emptyerror(event,'hostError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_hostSubscription','hostSubscription')"
							 onkeyup="addSubscription();"
						onfocus="removeHasError('host-input'); showlabel('label_hostSubscription','hostError');emptyerror(event,'hostError')" />
					<label id="label_hostSubscription" class='valid'><spring:message
							code="label_hostSubscription" /></label> <label id="hostError" class="collapse"></label>
				</div>
			</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="dist-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="distSubscription" id="distSubscription"
						onclick="emptyerror(event,'distError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_distSubscription','distSubscription')"
							 onkeyup="addSubscription();"
						onfocus="removeHasError('dist-input');showlabel('label_distSubscription','distError');emptyerror(event,'distError')" />
					<label id="label_distSubscription" class='valid'><spring:message
							code="label_distSubscription" /></label> <label id="distError" class="collapse"></label>
				</div>
			</div>
		
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="subDist-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="subDistSubscription" id="subDistSubscription"
						onclick="emptyerror(event,'subDistError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_subDistSubscription','subDistSubscription')"
							 onkeyup="addSubscription();"
						onfocus="removeHasError('subDist-input');showlabel('label_subDistSubscription','subDistError');emptyerror(event,'subDistError')"/>
					<label id="label_subDistSubscription" class='valid'><spring:message
							code="label_subDistSubscription" /></label> <label id="subDistError" class="collapse"></label>
				</div>
			</div>
		
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="agent-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="agentSubscription" id="agentSubscription"
						onclick="emptyerror(event,'agentError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_agentSubscription','agentSubscription')"
							 onkeyup="addSubscription();"
						onfocus="removeHasError('agent-input');showlabel('label_agentSubscription','agentError');emptyerror(event,'agentError')" />
					<label id="label_agentSubscription" class='valid'><spring:message
							code="label_agentSubscription" /></label> <label id="agentError" class="collapse"></label>
				</div>
			</div>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input" id="bank-input">

					<form:input class="selecttag" type="number" step="0.01" min="0" max="100" path="bankSubscription" id="bankSubscription"
						onclick="emptyerror(event,'bankError');refreshMessage('sucessMessage');refreshMessage('errorstatusMessage')"
						onchange="selecttag('label_bankSubscription','bankSubscription')"
							 onkeyup="addSubscription();"
						onfocus="removeHasError('bank-input');showlabel('label_bankSubscription','bankError');emptyerror(event,'bankError')" />
					<label id="label_bankSubscription" class='valid'><spring:message
							code="label_bankSubscription" /></label> <label id="bankError" class="collapse"></label>
				</div>
			</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="styled-input">

					<form:input class="selecttag" type="text" path="totalSubscription" id="totalSubscription" readonly="true"
						onclick="emptyerror(event,'totalError');"
						onchange="selecttag('label_totalSubscription','totalSubscription')"
						onfocus="clearmsg(); showlabel('label_totalSubscription','totalError');" />
					<label id="label_totalSubscription" class='valid'><spring:message
							code="label_totalSubscription"/></label> <label id="totalError" class="collapse"></label>
				</div>
			</div>
		
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"
				id="submit">

				<input type="submit" value="Submit"
					onclick="return validateSubscription(event);" class="btn btn-warning" />
			</div>
		</div>

<div class="row">&nbsp;</div>

		<div class="row">
			<div class="col-xs-12">
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="table_id">
							<thead>
								<tr>
								<th><spring:message code="LABEL_NAME" /></th>
								<th><spring:message code="lab_edit"/></th>	
								<th><spring:message code="lab_action" /></th>	

								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${subscriptionList.listcomdata}"
									var="subscription">
									<tr id="rowId_${subscription.id}">
										<td>${subscription.name}</td>
										<%
										Integer menuId=(Integer)request.getAttribute("menuId");
	  									Integer submenuId=(Integer)request.getAttribute("submenuId");
										
										
												Integer id=	((CommissionDatas)(pageContext.findAttribute("subscription"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
										
										<td align="center" width="30%"><a
											href="${pageContext.request.contextPath}/AdminUI/commission/editSubscription?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
												<img title="edit"
												src='${pageContext.request.contextPath}/images/edit.gif'
												style='cursor: hand'>
										</a></td>	
								<td align="center"><input id="delete_${subscription.id}" type="button" value="Delete" class="rwDel" onclick="deleteSubscription('rowId_${subscription.id}','${subscription.id}');"/></td> 
									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>
					<div></div>
				</div>
			</div>
		</div>

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>