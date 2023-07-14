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
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Token.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/moment.min.js></script>

<title>Token</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// Check or Uncheck All checkboxes
						$("#checkall").change(function() {
							var checked = $(this).is(':checked');
							if (checked) {
								$(".sysAccountGroupArray").each(function() {
									$(this).prop("checked", true);
								});
							} else {
								$(".sysAccountGroupArray").each(function() {
									$(this).prop("checked", false);
								});
							}
						});

						// Changing state of CheckAll checkbox 
						$(".sysAccountGroupArray")
								.click(
										function() {

											if ($(".sysAccountGroupArray").length == $(".sysAccountGroupArray:checked").length) {
												$("#checkall").prop("checked",
														true);
											} else {
												$("#checkall").removeAttr(
														"checked");
											}

										});
					});
</script>
</head>
<body>
	<div class="row">
		<div class="heading-inner  ">
			<h1 class="pull-left"></h1>
			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
					<p class="text-success" id='success'>${successMessage}</p>
				</div>
			</c:if>
		</div>
	</div>
	<div class="row">
		<form:form id="" method="post" modelAttribute="tokenData"
			action="${pageContext.request.contextPath}/AdminUI/sysSetting/saveToken">
		Enter number <form:input path="count" id="count" type="text" onclick="clearMssg();" 
				style="width:50px" />




			<div id="mssg"
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">

			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div id="errorid">&nbsp;</div>
				<div class="table-responsive  transaction-table">
					<div id="menuTableId" style="height: 300px; overflow: auto;">
						<table class="table table-striped table-bordered table-hover " id="tabb">
							<thead>
								<tr>
									<th><!-- <input type="checkbox" id="checkall" class="checkbox"  onclick="clearMssg()" /> -->Select checkBox
										</th>
									<th>Token List</th>
									<th>Priority</th>
								</tr>
							</thead>
							<tbody class="tbody">

								<c:forEach items="${tokenData.data}" var="datalist">

									<tr class="tableLabel">
										<td><form:checkbox  path="sysAccountGroupArray"
												class="sysAccountGroupArray" name="sysAccountGroupArray[]"
												id="sysAccountGroupArray${datalist.id}"
												value="${datalist.name}#${datalist.id}"
												onclick="clearMssg();chkBoxClick('${datalist.id}');getSelectOption('${datalist.id}');checkEnable('${datalist.id}');" disabled="disabled"></form:checkbox></td>
										<td id="name${datalist.id}">${datalist.name}</td>
										<td><form:select path="priority"
												id="priority${datalist.id}" class="priority"
												name="priorityName" value="${datalist.name}"
												disabled="disabled" onclick=" clearMssg()">

											</form:select></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<form:button onclick="return getpreview(event)" type="button">preview</form:button>
						<form:input id="string" type="text" path="tokenString"
							style="width:600px" readonly="true" />
					</div>
				</div>

			</div>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input type="submit" class="btn btn-warning" value="Submit"
					onclick="return validation(event)" />
			</div>
			<!-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mt text-center">
									<input type="submit" class="btn btn-warning" value="Edit" onclick="return validateGetToken(event)" />
								</div>
								 -->

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>
	</div>


</body>
</html>















