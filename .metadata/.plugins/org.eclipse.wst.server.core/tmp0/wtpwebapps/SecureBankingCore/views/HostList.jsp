<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.AccountList" %>
<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>

<!-- <script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/css/dataTables.bootstrap.min.css"></script>
<script type="text/javascript" 
	src=${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/AccountCreation.js"></script>
	
	<script>
	$(document).ready(function(){
		$('#table_id').DataTable({
			 "scrollY":"500px",
		        "scrollX":"600px",
		        "scrollCollapse":true,
		        "paging":true,
		        "pagingType": "simple_numbers"
		}
		)
	});
	
	
	</script>
	
<title>Host List</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body class="PageType">


<form:form id="hostlist" method="get"
		modelAttribute="accountTypeData"
		action="${pageContext.request.contextPath}/AdminUI/account/createAccount">
		
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Host Account List</h1>
	                      <div class="clearfix"></div>
	                      <hr> </hr>
	                      </div>
	                      
	                      <div 
								class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
								<p><span style="color:green">${sucessmsg}</span> </p>						 
						  </div>
	                     
	                      <div  id="showButton1" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 	<p align="right">
  										<input type="submit" value="Create" class="btn btn-warning"/>
								</p>
	                      	</div>
	                      	
	                       

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>

<form:form id="hostlist" method="get"
		modelAttribute="accountCreationData"
		action="${pageContext.request.contextPath}/AdminUI/account/edithost">
  <div class="row">
  
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 collapse" id="commentDiv">
				<div id="commentdiveId" class="styled-input ">
					<form:textarea path="comment" id="comment"
						class="selecttag"
						onclick="removeHasError('commentdiveId'); "
						onchange="selecttag('lab_commentId','commentId');showlabel('lab_commentId','commentErrorId');" />
					<label id="lab_commentId" style="margin: -7px 0 0 0;" class="valid">Reason to block/unblock</label>
					 <label id="commentErrorId" class="collapse "></label> <span></span>

				</div>
				<input type='button' value='OK' id='btnYes' onclick="return blockUnblock()" />
   						 <input type='button' value='Cancel' id='btnNo' onclick="cancel();"/> 
			</div>
			
			 
	             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">&nbsp;</div>            
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id1">
	  						<thead class="default">
		  						<tr >
		  							<th align="center"><spring:message code="LABEL_COMPANY_NAME" /></th>
		  							<th align="center"><spring:message code="lab_Email_Id" /></th>
		  							<th align="center"><spring:message code="lab_sub_mobile" /></th>
		  							<th align="center"><spring:message code="LABEL_ACTIVE_DEACTIVE" /></th>
		  							<th align="center"><spring:message code="LABEL_EDIT" /></th>
		  							
		  						</tr>
	  						</thead>
	  						<tbody>
	  						<c:forEach items="${accountCreationData.hostlist}"
										var="acList">
										<tr>
											<%
												Integer menuId=  (Integer)request.getAttribute("menuId");
												Integer submenuId= (Integer)request.getAttribute("submenuId");
												
												String id=	((AccountList)(pageContext.findAttribute("acList"))).getAccountCode();
												String accountStatus=((AccountList)(pageContext.findAttribute("acList"))).getAccountStatus();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String encryptedStatus=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&accountstatus="+accountStatus+"&menuId="+menuId+"&submenuId="+submenuId);
												String encryptedAccountInfoId=KeyEncryptionUtils.encryptUsingKey(key, "accountinfoId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td> <a  href="${pageContext.request.contextPath}/AdminUI/account/accounthierarchylist?enc=<%=encryptedAccountInfoId %>&param1=<%=param %>&param2=<%=param1 %>">${acList.companyName}</a> </td>
											
											<td>${acList.emailId}</td>
											<td>${acList.mobileNo}</td>
											<td><a href="${pageContext.request.contextPath}/AdminUI/account/activatehost?enc=<%=encryptedStatus %>" onclick="return reason('${acList.accountCode}','${acList.accountStatus}')">${acList.accountStatus}</a></td>
											<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/account/edithost?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
											<img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor: hand'></a></td>
											
										</tr>
									</c:forEach>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			</div>
</form:form>

</body>
</html>