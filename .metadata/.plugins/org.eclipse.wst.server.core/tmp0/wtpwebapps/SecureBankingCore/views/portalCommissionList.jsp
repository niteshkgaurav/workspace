<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
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
	

	
<title>Portal Commission Mapping</title>
<script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js "></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script type="text/javascript">
	function check(a) {
		if ($('#' + a).is(":checked")) {
			$('#' + a).val("checked");
		} else {
			$('#' + a).val("");

		}

	}
	function validateform() {
		//var len=$('table1').length;
		var table = document.getElementById('table_id');
		var numrows = table.rows.length;
		var chk = 0;
		$('#errormsg').text("");

		for (var i = 1; i < numrows; i++) {
			if ($('#tab' + i).is(":checked")) {
				chk++;
			}
		}
		if (chk == 0) {
			$('#errormsg').text("select at least one check box for Portal");
			event.preventDefault();
		} else if ($('#commissionmap').val() == '') {
			$('#errormsg').text("select commission ");
			event.preventDefault();
		}

	}
</script>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":"500px",
		        
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
			  
		  });
	  }
} );
</script>	
	
</head>

<body class="PageType">

	<form:form id="AgentCommision" name="PortalCommissionProductMappingForm"
		method="post" modelAttribute="portalEditData"
		action="${pageContext.request.contextPath}/AdminUI/portalCreation/getPortalCommissionList">

		<div class="heading-inner  ">
			<h1 class="pull-left">Portal Commission Mapping</h1>
			<div class="clearfix"></div>
			<hr>
			<c:if test="${successMessage!=''}">
				<div id="sucessMessage"
					class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
					<p class="text-success">${successMessage}</p>
				</div>
			</c:if>
		</div>

		<div id="errorMessage"
			class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
			<p style="color: red;" id='errormsg'></p>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
			<div class="transaction-table">
				<div class="table-responsive" >

					<table class="table table-bordered table-striped" id="table_id">
						<thead>
							<tr>
								<th>Action</th>
															<!-- <th>Agent List</th> -->
								<th>Company</th>
								<th>Commission</th>
							</tr>

						</thead>
						<c:forEach items="${portalEditData.portallist}" var="portallist"
							varStatus="status">
							<tr>

								<td><form:checkbox id="tab${status.count}" path="portalId"
										value="${portallist.id}" /> <%-- onclick="check('tab${status.count}');" --%>

								</td>


																						<%-- <td width="30%">${accountinfo.firstName}</td> --%>
								<td width="30%">${portallist.companyName}</td>
								<td width="30%">${portallist.commissionname}</td>

							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>



		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div class="styled-input">
				<form:select class="selecttag" path="commissionId"
					id="commissionmap" name="commissionmap"
					onclick="this.setAttribute('value', this.value);" value=""
					placeholder="."
					onchange="selecttag('label_commissionId','commissionmap');"
					onfocus="clearmsgMapping();showlabel('label_commissionId','commissionIdError');">
					<form:option value="" label=" " />
					<form:options items="${comMap}" />
				</form:select>

				<label id="label_commissionId"class="valid"> Commission </label> <label
					id="commissionIdError"></label>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Submit"
				onclick="return validateform()" />
		</div>

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

	</form:form>

</body>
</html>