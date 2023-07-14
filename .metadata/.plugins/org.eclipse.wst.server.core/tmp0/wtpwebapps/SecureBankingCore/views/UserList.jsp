<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData"%>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@ page import="com.ng.sb.common.util.SystemConstant"%>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData"%>
<%@ page import="java.util.UUID"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/changePassword.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/UserLoginCreation.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/custom.js></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css></script>


<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquerylib/jquery-2.2.4.min.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquerylib/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/cardPersonalization.js"></script>



<title><spring:message code="lable.userlist.title.page" /></title>
</head>


<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">



	<form:form id="userlist" method="post" modelAttribute="userAccountData"
		action="${pageContext.request.contextPath}/AdminUI/UserMgmt/userLoginCreationPage">
		<input type='submit' style="float: right;" id='btn1' value='Create'
			class="btn btn-warning">
		<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId">
		<div class="row">&nbsp;</div>

		<!-- <div class="row">&nbsp;</div>
			
  			  <input type='submit' style="float:right;" id='btn2' value='Reset Password' class="btn btn-warning" form="resetPasswordForm" >
  			 -->

		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">Users List</h1>
			<div class="clearfix"></div>
			<hr>
			<c:if test="${successMessage!=''}">
				<div id="msgId"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
			<c:if test="${errorMessage!=''}">
				<div id="errorId"
					class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-danger">${errorMessage}</p>
				</div>
			</c:if>
		</div>



		<div class="row">

			<div id="SearchByName"
				class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb"></div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
				<div id="resetPasswordMsg" class="text-center
	               "></div>
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover "
							id="table_id">
							<thead class="default">
								<tr>
									<th align="center"><spring:message code="LABEL_USER_NAME" /></th>
									<th align="center"><spring:message code="LABEL_ROLE_TYPE" /></th>
									<th align="center"><spring:message code="LABEL_USER_LOGIN" /></th>
									<th align="center"><spring:message code="lab_Email_Id" /></th>
									<th align="center"><spring:message code="lab_Phone_no" /></th>
									<th align="center"><spring:message code="LABEL_HOST_NAME" /></th>
									<th align="center"><spring:message
											code="LABEL_DISTRIBUTOR" /></th>
									<th align="center"><spring:message
											code="LABEL_SUBDISTRIBUTOR" /></th>
									<th align="center"><spring:message code="LABEL_AGENT" /></th>
									<th align="center"><spring:message code="lab_edit" /></th>
									<th align="center"><spring:message
											code="LABEL_ResetPassword" /></th>
									<th align="center"><spring:message code="LABEL_EDIT" /></th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userLoginDetails}" var="userLoginList">
									<tr>
										<td>${userLoginList.userName}</td>
										<td>${userLoginList.accountTypeId}</td>
										<td>${userLoginList.userLoginName}</td>
										<td>${userLoginList.userEmailId}</td>
										<td>${userLoginList.userMobile}</td>
										<td>${userLoginList.hostName}</td>
										<td>${userLoginList.distName}</td>
										<td>${userLoginList.subDistName}</td>
										<td>${userLoginList.retailerName}</td>
										<%
												Integer menuId=(Integer)request.getAttribute("menuId");
												Integer submenuId=(Integer)request.getAttribute("submenuId");
													
												Integer id=	((UserAccountData)(pageContext.findAttribute("userLoginList"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
										<td align="center"><a
											href="${pageContext.request.contextPath}/AdminUI/account/userLoginEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
												<img title="edit"
												src='${pageContext.request.contextPath}/images/edit.gif'
												style='cursor: hand' align="middle">
										</a></td>
										<td align="center"><input type="button"
											onclick="return getResetPassword('${userLoginList.userMobile}','${userLoginList.id}')"
											value="click here"></td>




										<td><c:choose>

												<c:when test="${userLoginList.validUserStatus=='true'}">
													<button type="button" id="deactiveUser"
														class="btn btn-warning"
														onclick="activateDe(this,event,'${userLoginList.id}', 'accountStatus');"
														value="Deactivate">
														<label id="accountStatus">Deactivate</label>
													</button>

												</c:when>

												<c:when test="${userLoginList.validUserStatus=='false'}">
													<div>
														<button type="button" id='activeUser'
															class="btn btn-warning"
															onclick="activateDe(this,event,'${userLoginList.id}');"
															value="Activate">Activate</button>
													</div>
												</c:when>

											</c:choose></td>




									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div id="dialog2" title="Reason" class="collapse">
				<form name="myForm">
					<label>Comment:</label> <input id="Activatecomment" name="name"
						type="text" onclick="removeMsg()"> <input type="button"
						id="btnCheck" onclick="userInfo(event);" value="Submit"> <label
						id="commentErrorId" class="collapse"></label>
				</form>
			</div>


			<script type="text/javascript">
$("#dialog2").dialog({
	autoOpen: false
	});
	</script>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center"
				style="height: 300%;">
				&nbsp; &nbsp; <br> &nbsp; <br>
			</div>









			<input type="hidden" id="contextPath" name="contextPath"
				value="${pageContext.request.contextPath}" />
			<c:set var="val">
				<spring:message code="user.list.table.contactPersonName" />
			</c:set>
			<input id="userList" type="hidden" value="${val}" />


		</div>

		<input type="hidden" value="${pages}" id="pages" />

		<input type="hidden" value="${pageContext.request.contextPath}"
			name="link">
		<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		<br>
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId">
	</form:form>

	<form id="resetPasswordForm"
		action="${pageContext.request.contextPath}/AdminUI/UserMgmt/resetPassword"
		method="post">
		<input type="hidden" value="${menuId}" name="menuId" id="menuId">
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId">
	</form>

	<input type="hidden" id="hiddenLoginGroupCodeId"
		value="${userAccountData.groupCode}" />



	<div class="modal fade" id="declarationModel" data-backdrop="static"
		data-keyboard="false" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header" align="center">
					<h5>Reset Password.</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
				</div>
				<!-- Modal Body -->
				<!-- <div class="modal-body "> -->
				<div>
<div>
					<div class="styled-input">
						<div class="col-sm-10">
							<span style="color: red;" id="span_errorId"></span>
						</div>
					</div>
					
					<div class="styled-input">
						<div class="col-sm-10">
							<input type="hidden" id="usrId">
						</div>
					</div>
					
					<div class="styled-input">
						<div class="col-sm-10">
							<input id="password" placeholder="Enter new password"
								type="password" class="selecttag">
						</div>
					</div>
					
					<div class="styled-input">
						<div class="col-sm-10">
							<input id="confirmPassword" placeholder="Enter confirm password"
						type="password" class="selecttag">
						</div>
					</div>


					
</div>


					<!-- Modal Footer -->
					
				</div>
				<div class="modal-footer">
				<div>
				<div class="col-md-6 col-lg-6">

					<button type="button" class="btn btn-pink btn-default"
							data-dismiss="modal">CANCEL</button>

					</div>
					<div class="col-md-6 col-lg-6">

						<button type="button" id="proceedBtn"
							class="btn btn-pink btn-default" >PROCEED</button>

					</div>
	</div>					
						
						
						
					
						
					
						
						
						
					</div>
			</div>
		</div>
	</div>


</body>
</html>