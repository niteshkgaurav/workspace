
<%@page import="java.util.Arrays"%>
	<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@ page import="com.ng.sb.common.dataobject.InventoryMgmtData" %>
<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
	
	<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->


<script src="${pageContext.request.contextPath}/js/jquery_ui_1_12_1.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
	
	<script type="text/javascript"
	src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/OrderRecieved.js"></script>
<title>Shipping List</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>
	<form:form id="ShippingList" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingList">
		
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_Shipping_list" /></h1>
	                      <div class="clearfix"></div>
	                      
	                      <%
							Integer menuId=(Integer)request.getAttribute("menuId");
							Integer submenuId=(Integer)request.getAttribute("submenuId");
							String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
							%>
	                      <hr>
	                     
	                     	<c:if test="${statusMessage!=''}">
									<div   class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${statusMessage}</p> 
									</div> 
							</c:if>	
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
							 <div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a
									href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/OrderRecieved?enc=<%=encryptId%>"><spring:message
											code="label_OrderRecieved" /> </a>	
							</div>
							<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingList?enc=<%=encryptId%>"><spring:message
											code="label_ToBeShipped" /></a>	
							</div>
							<div  class=" col-xs-12 col-sm-12 col-md-4 col-lg-4 " >
				           	<a
									href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingHistoryView?enc=<%=encryptId%>"><spring:message
											code="label_Shipping_View" /></a>
							</div>
							<div class="clearfix"></div>
							<hr></hr>
							<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 " >	
				           	
							</div>
							
	             </div>
	             <div class="row" id="mainTable">
	                    	<div class="col-xs-12">
	                       	 <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="shiporder_table" class="table table-bordered table-striped  text-center">
	                              <tr>
										<th align="center"><b><spring:message
													code="label_orderNo" /></b></th>
													
										<th align="center"><b><spring:message
													code="lab_InvoiceNo" /></b></th>
										<th align="center"><b><spring:message code="lab_Product"/></b></th>
		  							<th align="center"><b><spring:message code="lab_master"/></b></th>			
													
										<%--   <th align="justify"><b>
										  <spring:message
													code="lable_shipped_for" /></b></th> --%>
										
										<th align="center"><b><spring:message
													code="lable_shipped_Date" /></b></th>
													<th align="center"><b>Proceed to receive order</b></th>
										<th align="center"><b>Preview QR Code</b></th>
										<th align="center"><b>Order Detail</b></th>	
										<th align="center"><b>Packaging Detail</b></th>			
									</tr>
									<c:forEach items="${inventoryMgmtData.shippinghistorylist}"
										var="acList">
										<tr>
										<td>${acList.orderNumber}</td>
											<td>${acList.invoiceno}</td>
											<td>${acList.productName}</td>
											<td>${acList.mvName}</td>
										<td>	${acList.orderDate}</td>
											
												<%
												//InventoryMgmtData inventoryDto = InventoryMgmtData
												Integer orderFor=((InventoryMgmtData)(pageContext.findAttribute("acList"))).getOrderType();
												String date=((InventoryMgmtData)(pageContext.findAttribute("acList"))).getOrderDate();
												Integer shippingId=((InventoryMgmtData)(pageContext.findAttribute("acList"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "orderdate="+date+"&orderfor="+orderFor+"&menuId="+menuId+"&submenuId="+submenuId+"&shippingId="+shippingId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td>
											<!--${acList.orderDate}  -->
											<c:choose>
											<c:when test="${acList.shippingStatus =='RECEIVED'}">
											<button type="button" class="btn btn-warning alreadyShippedId" id="alreadyShippedId">Proceed to Receive</button>
											</c:when>
											<c:otherwise>
											<a
												  href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/tobeshippedplus?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>" >
												   <button type="button" class="btn btn-warning">Proceed to Receive</button>
												  </a>
											</c:otherwise>
											</c:choose>
											
										<td>
									<!-- 	<input type="button"  value="Generate QR Code" onclick="generateQRcode()" /> -->
									<%-- <input type="button"   value="Generate QR Code" onclick="generateQRcode('${acList.orderNumber}','${acList.invoiceno}','${acList.orderDate}','${acList.invoicedate}','${acList.mainseriesfrom}','${acList.mainseriesto}','${acList.productName}','${acList.mvName}','${acList.productCode}','${acList.mvCode}','${acList.qty}')" /> --%>
									<input type="button"  class="btn btn-warning" value="Rreview QR Code" onclick="generateQRcode('${acList.orderNumber}','${acList.invoiceno}','${acList.orderDate}','${acList.invoicedate}','${acList.mainseriesfrom}','${acList.mainseriesto}','${acList.productName}','${acList.mvName}','${acList.productCode}','${acList.mvCode}','${acList.qty}','${acList.packageids}')" />    
										</td>
										<td>
									<!-- 	<input type="button"  value="Generate QR Code" onclick="generateQRcode()" /> -->
									
									<input type="button" class="btn btn-warning"  value="Order Details" onclick="orderDetails('${acList.orderNumber}')" />    
										</td>
										<td><a href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/getPackagingDetails?shippingId=${acList.id}" >Packing Details</a></td>
										</tr>

									</c:forEach>
	                             </table>
	                          </div>
	                        </div>
	                      </div>
	                    
	            </div>
	            
	            
	            <div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 " >	
				        	
							</div>
	            <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	            
	            <!-- QR Model Started  -->


<div  id="qrgenerateid"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 collapse" >
			
			  <div  id="qrgenerateid1">    </div>
			   <div  id="qrgenerateidString">    </div>
			  <br>
			  <br>
			  
			   <div   class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover ">
	  						<thead class="default">
		  					
	  						</thead>
	  						<tbody>
	  						
										<tr>
										<td>PO#-</td><td id="ordernoId"><td><td>PO Date#-</td><td id="orderdateId"><td>
										</tr>
										<tr>
										<td>Invoice#-</td><td id="invoiceId"><td><td >Invoice Date#-</td><td id="invopicedateId"><td>
										</tr>
										<tr>
										<td>Product Code#-</td><td id="productcodeId"><td><td>Product Description#-</td><td id="productdecId"><td>
										</tr>
										<tr>
										<td>Masterversion#-</td><td id="mastervId"><td><td>Master Version Code#-</td><td id="mastercodeId"><td>
										</tr>
										<tr>
										<td>Main Series From#-</td><td id="mseriesFromId"><td><td>Main Series To#-</td><td id="mseriesToId"><td>
										</tr>
										<tr>
<!-- 										<td>Box Series From#-</td><td id="BseriesFromId">Iv123<td><td>Box Series To#-</td><td id="BseriesToId"><td>
 -->										</tr>
										<tr>
										<td>Box Number#-</td><td id="boxnumberId">Iv123<td><td>Box Quantity#-</td><td id="boxquantity"><td>
										</tr>
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			
			
			</div>
			
	
<div  id="order"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 collapse" >
			
			  <div  id="order1">    </div>
			  
			  
			   <div   class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="template_details">
	  						<thead class="default">
		  					<tr>
		  					<th>Unit Ordered</th>
		  					<th>Units Dispatched</th>
		  					<th>Order By</th>
		  					<th>Order For</th>
		  					<th>Status</th>
		  					<th>Date</th>
		  					</tr>
	  						</thead>
	  						<tbody id="tbody">
	  						
										
										
	  						</tbody>
	  					</table>
						</div>
					</div>
					</div>
			
			
			</div>
	<!-- QR Model end  -->		
	</form:form>
	<!--  Alert Modal START -->
	
 <!--  Alert Modal END -->
</body>
<div id="dialog" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 collapse" title="Order already received">
  <p>This order is already received.</p>
</div>




  
 

</html>