<%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ page import="java.util.*" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.HostPartnerPreferenceDatas" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script> 
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/Product_Management.js></script>
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
        

<title>Partner Preference Management</title>
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
<form:form id="PartnerPreferenceManagementForm" name="PartnerPreferenceManagementForm" method="post"  modelAttribute="productManagementData" action="${pageContext.request.contextPath}/AdminUI/sysSetting/createProduct" enctype="multipart/form-data">

			<div class="heading-inner  ">
	    	 <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="Partner Preference List" /></h1>
	                      <div class="clearfix"></div>
	                      <hr> </hr>
	                      
	                      <c:if test="${successmessage!=''}">
									<div id="after_edit_product_mess"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successmessage}</p> 
									</div> 
							</c:if>
	                      
	                     <div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a
								href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/partnerPreference"><spring:message code="lab_partnerPreference"/>
							</a>
							</div>
						<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 col-md-offset-4" >
				           	<a href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/partnerPreferenceList"><spring:message code="lab_partnerPreferenceList" /></a>
						</div>
						<div class="clearfix"></div>
							<hr></hr>
						<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 " >	
				           	
						</div>
							
	          </div>
	          <div class="row">
	          	<div class="col-xs-12">
		                        <div class="transaction-table">
		                          <div class="table-responsive">
		                            <table id="table_id" class="table table-bordered table-striped">
		                            
		                            	<c:if test="${not empty partnerPreferenceDatas}">
		                            		<th><span><spring:message code="lab_hsvName"/></span></th>
		                            		<th><span><spring:message code="lab_Action"></spring:message></span></th>
		                            		<c:forEach items="${partnerPreferenceDatas}" var="partnerPreferenceDatas" varStatus="status">
											      <tr>
											      		<td>${partnerPreferenceDatas.hsvName}</td>
											          <%
												Integer id=((HostPartnerPreferenceDatas)(pageContext.findAttribute("partnerPreferenceDatas"))).getHsvId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "hsvId="+id);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											          <td align="center">
											             
											             <a href="${pageContext.request.contextPath}/AdminUI/hostMgmtController/editpartnerPreferenceList?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor:hand' align="center"/></a>
											         
											          </td>
											      </tr>
											</c:forEach>
		                            	</c:if>
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