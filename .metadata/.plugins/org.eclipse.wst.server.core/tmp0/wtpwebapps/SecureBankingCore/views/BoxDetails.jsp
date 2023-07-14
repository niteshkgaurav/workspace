<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.InventoryMgmtData" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>

<script language='javascript'
	src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script language='javascript'
	src="${pageContext.request.contextPath}/js/MyDate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/InventoryPoRaise.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/viewOrder.js"></script>
<title>Box Details</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>

					<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="box_details"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	
							
	                </div>
		
		<form:form id="PoRaise" method="POST"
			modelAttribute="inventoryMgmtData">	
			
			<div class="col-xs-12">
	                       	 <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="template_details" class="table table-bordered table-striped  text-center">
	                            	<tr>
												<th bgcolor="#C10000"> <font color='white'><spring:message code="lable_product_name" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="lab_Product_Code" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="lable_master_version" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="masterVerCode" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="boxNumber" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="lab_boxFrom" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="lab_boxTo" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="lab_boxSize" /></font></th>
												<th bgcolor="#C10000"><font color='white'><spring:message code="labl_avail_stock" /></font></th>
											</tr>
							
											<c:forEach items="${inventoryMgmtData.inventoryMgmtDataList}" var="list">
											<tr >
												<td align="center">${list.productName}</td>
												<td align="center">${list.productCode}</td>
												<td align="center">${list.mvName}</td>
												<td align="center">${list.mvCode}</td>
												<td align="center">${list.boxNumber}</td>
												<td align="center">${list.boxSeriesFrom}</td>
												<td align="center">${list.boxSeriesTo}</td> 
												<td align="center">${list.boxSize}
												<td align="center">${list.availableUnits}
												
												<%
												Integer id=	((InventoryMgmtData)(pageContext.findAttribute("list"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "product="+id+"mv="+id+"order="+id);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
												<td align="center"><a
												href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/shortBoxesView?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
											
											</tr>
										</c:forEach>
	                            </table>
	                           </div>
	                          </div>
	                          </div>
	                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                          		<input type="button"
										value="back" class="btn btn-warning"
										onclick="goBack()" />
	                           </div>
	                           
	                            <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
								
										</form:form>
</body>

</html>