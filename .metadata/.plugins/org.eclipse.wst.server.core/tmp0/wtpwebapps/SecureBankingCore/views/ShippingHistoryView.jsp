<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>

 <script src="${pageContext.request.contextPath}/js/jquery_ui_1_12_1.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<link href="${pageContext.request.contextPath}/css/themes/base/jquery-ui.css" rel="stylesheet"  />
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->


<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/OrderRecieved.js></script>
		
</head>


<body>
	<form:form id="ShippingHistoryView" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/ShippingHistoryView">

		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_shippingHistoryView" /></h1>
	                      <div class="clearfix"></div>
	       
	                      	<%
			                    LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
			                    String key = loginData.getKey();
								Integer menuId=(Integer)request.getAttribute("menuId");
								Integer submenuId=(Integer)request.getAttribute("submenuId");
								String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
							%>
	                      <hr> 
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
	          
	          <div class="row">
		         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover " id="table_id">
	  						<thead class="default">
		  						<tr>
		  							 <th><input type="checkbox" name="cbox" id="selectAll">  </th>
		  							<th align="center"><spring:message code="lab_orderNo"/></th>
		  							<th align="center"><spring:message code="lab_InvoiceNo"/></th>
		  							<th align="center"><spring:message code="lab_ShipTo"/></th>
		  							<th align="center"><spring:message code="lab_Product"/></th>
		  							<th align="center"><spring:message code="lab_master"/></th>
		  							<th align="center"><spring:message code="lab_card"/></th>
		  							<th align="center"><spring:message code="lab_Quantity"/></th>
		  							<th align="center"><spring:message code="lab_shipDate"/></th>
									<!-- <th align="center">Proceed to generate QR Code</th> -->
		  							<th align="center">QR Code</th>
		  						</tr>
	  						</thead>
	  						<tbody>
	  						
	  						
	  						
	  						<c:forEach  items="${inventoryMgmtData.shippinghistorylist}"
										var="acList">
										<tr>
										<td> <input type="checkbox" name="cbox" value="${acList.orderNumber}#${acList.invoiceno}#${acList.orderDate}#${acList.shippingDate}#${acList.mainseriesfrom}#${acList.mainseriesto}#${acList.productName}#${acList.mvName}#${acList.productCode}#${acList.mvCode}#${acList.qty}#${acList.packageids}" class="cbx">  </td>
											<td>${acList.orderNumber}</td>
											<td>${acList.invoiceno}</td>
											<td>${acList.shipTo}</td>
											<td>${acList.productName}</td>
											<td>${acList.mvName}</td>
											<td>${acList.cardName}</td>
											<td>${acList.shippedItemCount}</td>
											<td>${acList.orderDate}</td>
								<%-- 			<td>
								
											  	<c:set var="ids" value="${acList.id}" scope ="request">  </c:set>
											  <%
											 
											  	Integer id =(Integer)request.getAttribute("ids");//${acList.id};
												String encryptIdWithShippingId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId+"&shippingId="+id);
											  %>
											
											   <a  href="proceed-to-generate-qr-code?enc=<%=encryptIdWithShippingId%>"> 
										
											  <button type="button" class="btn btn-warning">Proceed to shipping</button>
											 </a>
											</td>
											 --%>
							
								
											<td><input type="button"  class="btn btn-warning"  value="Generate QR Code" onclick="generateQRcode('${acList.orderNumber}','${acList.invoiceno}','${acList.orderDate}','${acList.invoicedate}','${acList.mainseriesfrom}','${acList.mainseriesto}','${acList.productName}','${acList.mvName}','${acList.productCode}','${acList.mvCode}','${acList.qty}','${acList.packageids}')" /> </td>
										</tr>
									</c:forEach>
	  						</tbody>
	  					</table>
	  					<input type="button" class="btn btn-warning" id="generateQrForAll" value="Generate QR code"/>
						</div>
					</div>
					</div>
			</div>
			
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
			<!-- <div id="modal1"><iframe id="modalframe" src=""></iframe></div> -->
			
			
			</div>
	          
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">

	</form:form>

</body>
</html>