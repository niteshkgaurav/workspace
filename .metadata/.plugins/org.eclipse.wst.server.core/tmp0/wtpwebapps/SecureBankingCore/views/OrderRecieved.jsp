<%@page import="java.util.Arrays"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fileinput.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/OrderRecieved.js"></script>
<style>
table, td, th {
  border: 1px solid #ddd;
}

table {
  width: 100%;
  border-collapse: collapse;
}
</style>

<script type="text/javascript">

	$(document).ready(
	function(){
		//alert("${requestData.entityId}");
		$(".selecttag").val("${requestData.entityId}");
		$("#statusId").val("${requestData.statusId}");
		$("#lab_start_date").val("${requestData.fromDate}");
		$("#lab_end_date").val("${requestData.toDate}");
	//	 $('#OrderRecieved_table').DataTable();
	}		
	);
</script>

<title>Order Received</title>
<script>
$(function () {

	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
            useCurrent: false,
    });
});

function setDate() {
	var toDate = new Date();
	var toMonth = toDate.getMonth()+1;
	if(toMonth < 10)
		toMonth = "0"+toMonth;
	var toDay = toDate.getDate();
	if(toDay < 10) 
		toDay = "0"+toDay;
	
	var fromDate = new Date(toDate.getTime() - 518400000);
	var fromMonth = fromDate.getMonth()+1;
	if(fromMonth < 10)
		fromMonth = "0"+fromMonth;
	
	var fromDay = fromDate.getDate();
	if(fromDay < 10)
		fromDay = "0"+fromDay;
	
	$('#Entity_Id').get(0).selectedIndex = 0;
	$('#statusId').get(0).selectedIndex = 0;
	
	$('#lab_start_date').val(fromDate.getFullYear()+'-'+fromMonth+'-'+fromDay);
	$('#lab_end_date').val(toDate.getFullYear()+'-'+toMonth+'-'+toDay);
	
	validateOrderReceived()
	
}
</script>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body onload="setDate();">
	<form:form id="ShipOrder" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/OrderRecieved">
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_OrderRecieved" /></h1>
	                      <div class="clearfix"></div>
	                      
	                      <%
							Integer menuId=(Integer)request.getAttribute("menuId");
							Integer submenuId=(Integer)request.getAttribute("submenuId");
							String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
						%>
	                      <hr>
	                     	<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a
									href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/OrderRecieved?enc=<%=encryptId %>"><spring:message
											code="label_OrderRecieved" /> </a>	
							</div>
							<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingList?enc=<%=encryptId %>"><spring:message
											code="label_ToBeShipped" /></a>	
							</div>
							<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a
									href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingHistoryView?enc=<%=encryptId %>"><spring:message
											code="label_Shipping_View" /></a>
							</div>
							<div class="clearfix"></div>
							<hr>
							<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 " >
				           	
							</div>
							
							
	          </div>
	      
	          <div class="row">
	          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="div_Entity_Id" class="styled-input">
		       
								<form:select id="Entity_Id" class="selecttag"  onfocus="removeHasError('div_Entity_Id')"
									path="entityId"  onchange="selecttag('label_Entity_Id','Entity_Id')"
									onclick="emptyerror(event,'Entity_errorId');this.setAttribute('value', this.value);" value="">
									<%-- <form:option value="0" label=" " />
									<form:options items="${inventoryMgmtData.productmap}" /> --%>
									<c:forEach var="product" items="${products}">
									
									<form:option value="${product.id}" label="${product.productName}"/>
									
									</c:forEach>
								</form:select>
											<label id="label_Entity_Id"class="valid"><spring:message code="label_Entity" /></label>
											<label id="Entity_errorId" class="collapse"></label>
					    	</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="div_fromDate" class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_start_date" path="fromDate" class=" selecttag" autocomplete="off"
										type="text" onclick="selecttag1('label_fromDate','lab_start_date')"
										onfocus="emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('div_fromDate');selecttag('label_fromDate','lab_start_date')"  />
										<label id="label_fromDate"class="valid"><spring:message code="lab_start_date" /></label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_fromDate');removeHasError('div_fromDate');showlabel('label_fromDate','lab_start_date')"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="div_toDate" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="lab_end_date"
										path="toDate" class="selecttag" type="text" autocomplete="off"
										onclick="selecttag1('label_toDate','lab_end_date')"
										onchange="selecttag('label_toDate','lab_end_date');"
										onfocus="emptyerror(event,'lab_end_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('div_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"/>
											<label id="label_toDate"class="valid"><spring:message code="lab_end_date" /></label>
											<label id="lab_end_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"><i class="glyphicon glyphicon-calendar" 
										onclick="removeHasError('div_toDate');selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"></i> </i>
					    		</div>
                      		</div>
                      	</div>
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="divID_statusId" class="styled-input" >
					    			
									<form:select id="statusId" path="statusId" class="selecttag"
										onfocus="removeHasError('divID_statusId');" 
										onchange="emptyerror(event,'chkForErrorId');emptyerror(event,'Status_errorId');selecttag('label_status','statusId');" >
										<form:option value="ALL" label="All"/>
										<form:option value="CANCELLED" label="Cancelled" />
										<form:option value="PENDING" label="Pending" />
										<form:option value="COMPLETE" label="Complete" />
										<form:option value="INPROGRESS" label="Inprogress" />
										
									</form:select>
											<label id="label_status" class="valid"><spring:message code="label_Status" /></label>
											<label id="Status_errorId" class="collapse"></label>
                      			</div>
                      		</div>
                      		
                      	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
									<input type="button" name="getdetails" class="btn btn-warning" id="submitButtonId"
								value="Get Details" onclick="validateOrderReceived();" />
                     	</div>
                     	<hr>
                     	<div id='checkboxErrorId' class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                     	</div>
                     	
                     	
                     	<div class="col-xs-12">
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive" style="height: 200px; overflow: auto;">
										<table id='OrderRecieved_table1' style="width:100%" class="display table table-bordered table-striped OrderRecieved_table1">
			                           		 	
										<thead class="default">
										<tr>
										<th align="center">Product </th>
										<th align="center">Master Version</th>
										<th align="center">Total Order</th>
										</tr>
										</thead>
										
										<tbody  id="tBodyId">
										
										
										</tbody>
										</table>
										
									</div>
		                   		</div>
			                 </div>
                     	
						
						
						
<%-- 						<c:if test="${not empty inventoryMgmtData.orderReceivedlist}"> --%>
							<div class="col-xs-12">
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive" style="height: 500px; overflow: auto;">
										<table id='OrderRecieved_table' style="width:100%" class="display table table-bordered table-striped OrderRecieved_table">
			                           		 	
		
										</table>
										
									</div>
		                   		</div>
			                 </div>
<%-- 					</c:if> --%>
					
					
					<!-- pagination -->
					<div id="div_ship" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
					<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
<input type="hidden" id="shippingdataId" name="shippingdataId" />
						<input type="submit" name="ship" class="btn btn-warning"
								value="Ship" onclick="return validateship('${checkbox}');" />
						</div>
					<div id='divId' align='center' class="collapse col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
<!-- 						<p> Do you want to cancel order ?<p> -->
					</div>
					
						
                     	
	          </div>
		

	</form:form>
	
</body>




</html>