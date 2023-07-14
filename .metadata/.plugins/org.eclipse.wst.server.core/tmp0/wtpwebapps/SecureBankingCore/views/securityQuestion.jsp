<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"></link>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/custom.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id1').DataTable();
	  }
} );
</script>
<script>
function checkSpace(event){
	var v1=$('#securityQuestion').val().trim();
	check=true;
	if(v1.length==0){
		event.preventDefault();
		$('#securityQuestionDiv').addClass('has-error');
		$('#descErrorId').html("Write a question");
		$('#descErrorId').show();
		check=false;
		
	}
}
</script>

<script>
function changeState(id,action,btn)
{
	/* alert("id="+id+"  action="+action+" btn="+btn); */
	 $.ajax({
			url: "ajax/changeSecurityQuestioStatus",
			type: "post",
			async:false,
			data: "id="+id+"&action="+action,
			success:function(response){
				
				/* alert(response); */
				var aa=response;
				 if(aa==true)
					{
					/*  alert("action==true"); */
				if(action==0)
		
					 {
					$("#button"+btn).text("Activate");
					$("#button"+btn).attr("onclick","changeState("+id+",1,"+btn+")");
					}else
					{
						$("#button"+btn).text("Deactivate");
						$("#button"+btn).attr("onclick","changeState("+id+",0,"+btn+")");
							
					} 
				/* $("#tdd"+btn).html(" <button type='button'   class='btn btn-warning' onclick='changeState("+id+",1"+","+btn")'>Activate </button> ")	;
					else
				$("#tdd"+btn).html(" <button   type='button'   class='btn btn-warning' onclick='changeState("+id+",0"+","+btn")'>Deactivate </button> ")	;
								 */
					} 
			}
	 });
}

</script>
</head>
<body class="PageType">

	<form:form method="post" modelAttribute="securityQuestionData"
		action="${pageContext.request.contextPath}/AdminUI/sysSetting/SecurityQuestionPost"
		enctype="multipart/form-data">

		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">
				<spring:message code="Security Question" />
			</h1>
			<div class="clearfix"></div>
			<hr>

				<c:if test="${successMessage!=''}">
					<div id="msgId"
						class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
						<p class="text-success">${successMessage}</p>
					</div>
				</c:if>
				<c:if test="${errorMessage!=''}">

					<div id="errorId"
						class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">

						<p class="text-danger">${errorMessage}</p>

					</div>
				</c:if>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-2">
				<div id='pinErrorId' align='center'></div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-2">
				<div class="styled-input" id="securityQuestionDiv">

					<form:textarea id="securityQuestion" path="securityQuestion"
						name="securityQuestion" class="selecttag"
						onchange="selecttag('label_securityQuestion','securityQuestion');"
						onclick="emptyerror(event,'msgId','')" maxlength='100'
						onfocus="showlabel('label_securityQuestion','descErrorId');removeHasError('securityQuestionDiv');" />

					<label id="label_securityQuestion" class="valid">Security
						Question</label> <label id="descErrorId"></label>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="col-xs-3 col-sm-3 col-md-2 col-lg-2 text-right">
				<div class="styled-input" id="div_securityId">
					<form:select name="securityQuestion" path="status"
						onChange="changeSelect();"
						onfocus="removeHasError('div_id_depot')" id="selectBox">
						<form:option value="1" label="Activate" />
						<form:option value="0" label="Deactivate" />

					</form:select>
					<label id="securityQuestionId" class="valid">*&nbsp;Select
						Status</label> <label id="securityQuestionErrorId" class="collapse"></label>

				</div>
			</div>


			<div
				class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 mt text-center">
				<input type="submit" id="submitId" value="Submit"
					onclick="checkSpace(event); emptyCheck('securityQuestion','securityQuestionDiv');"
					class="btn btn-warning" />
			</div>
		</div>
		<div class="col-xs-12">&nbsp;</div>
		<div class="col-xs-12">
			<!--   <h4 style="color:#b97e0a" align="left">*All Security Questions</h4> -->
			<div class="transaction-table">
				<div class="table-responsive">
					<table id="table_id1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<!-- 	<th align="center">SerialNumber</th> -->
								<th align="center">Question</th>
								<th align="center">Status</th>
								<th align="center">Action</th>
								<th align="center">Add on</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listVar" items="${data}" varStatus="loop">
								<tr>
									<td align="center">${listVar.securityQuestion}</td>
									<td><c:if test="${listVar.status==1}">
													Activate
													</c:if> <c:if test="${listVar.status!=1}">
													DeActivate
													</c:if> <%-- ${listVar.status} --%></td>
									<td id="tdd${loop.index}"><c:choose>
											<c:when test="${listVar.status==1}">
												<button type="button" id="button${loop.index}"
													class="btn btn-warning"
													onclick="changeState(${listVar.id},0,'${loop.index}');">Deactivate
												</button>

											</c:when>

											<c:when test="${listVar.status!=1}">
												<button id="button${loop.index}" type="button"
													class="btn btn-warning"
													onclick="changeState(${listVar.id},1,'${loop.index}');">Activate
												</button>
											</c:when>
										</c:choose></td>
									<td align="center">${listVar.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<input type="hidden" value="${pageContext.request.contextPath}"
			name="link" />
		<input type="hidden" value="${menuId}" name="menuId" id="menuId" />
		<input type="hidden" value="${submenuId}" name="submenuId"
			id="submenuId" />

	</form:form>
</body>
</html>