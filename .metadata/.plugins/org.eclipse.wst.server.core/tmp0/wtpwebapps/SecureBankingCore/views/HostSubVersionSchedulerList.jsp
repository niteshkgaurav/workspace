<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.dataobject.HostSubVersionData1" %>
<%@ page import="com.ng.sb.common.dataobject.MenuDetails" %>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">

<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );
</script>	



</head>

<body class="PageType">
	<form:form id="hostSimModifiedVersiongetPage" method="post"
		modelAttribute="HostSimVersionCreationMgmntData">
		
		<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<div class="clearfix"></div>
			</div>
			<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr style=color:#e3a122>
		  						<th><spring:message	code="lab_Host_Name_for_Sim_version_Modification" /></th>
								<th align="center"><spring:message code="lab_Version_Name_for_Sim_version_Modification" /></th>
								<th align="center"><spring:message code="lab_master_version_name" /></th>
								<th align="center"><spring:message code="lab_Edit_for_Sim_version_Modification" /></th>
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach items="${hostSubVersionList}" var="hostSimVersion">
								<tr>
									<td align="left">${hostSimVersion.hostId.companyName}</td>
									<td align="left">${hostSimVersion.name}</td>
									<td align="left">${hostSimVersion.mvId.name}</td>
									
									<%
												Integer id=	((HostSubVersionData1)(pageContext.findAttribute("hostSimVersion"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "subVersionId="+id);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
									
									
									
									<td><a href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/HostSubVersionScheduler?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
											title="edit"
											src='${pageContext.request.contextPath}/images/edit.gif'
											style='cursor: hand' align="left" /></a></td>
								</tr>
							</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
			
			 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>
</html>