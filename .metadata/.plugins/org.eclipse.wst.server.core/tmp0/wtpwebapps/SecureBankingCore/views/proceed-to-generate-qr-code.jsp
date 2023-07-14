<%@page import="com.ng.sb.common.model.PayCardApps"%>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@page import="com.ng.sb.common.dataobject.SubscriberData"%>
	<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
		<%@ page import="com.ng.sb.common.dataobject.CardData" %>
		<%@ page import="java.util.UUID" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/themes/base/jquery-ui.css" rel="stylesheet"  />
<!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<%-- 
 <script src="${pageContext.request.contextPath}/js/jquery_ui_1_12_1.js"></script> --%>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/kycApprove.js"></script> 
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script --%>	
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/OrderRecieved.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/proceed_to_generate_qr_code.js></script>

<!--    $('#selectAll').change(function() {
       alert( $(this).is(':checked'));
    }); -->
<script type="text/javascript">
/* $(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers",
		        "aaSorting": false
		  });
	  }
	  	  
} ); */
</script>
<style type="text/css">
  li { 	 	
    color: black;
  }
</style>

</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
  String groupCode=loginData.getGroupCode();
 %>
<body class="PageType">

<!-- <script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/kycController/approveKYC');
</script> -->


		<form:form  method="post"
			action=""		enctype="multipart/form-data">
			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Generate QR code</h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
						 
	                    </div>
							  
		              <br>   
		              
		              <!-- ############################################# start ###########################  -->
		                 <div   class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                 <div class="transaction-table" >
                    <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover ">
	  						<thead class="default">
		  					
	  						</thead>
	  						<tbody>
	  						
	  						<c:forEach items="${inventoryMgmtData.dataObjList}" var="package">
	  						
	  						
	  						</c:forEach>
										<tr>
											<td>PO#-</td><td id="ordernoId">${inventoryMgmtData.orderNumber}<td><td>PO Date#-</td><td id="orderdateId">${inventoryMgmtData.orderDate}<td>
											</tr>
											<tr>
										<td>Invoice#-</td><td id="invoiceId">${inventoryMgmtData.invoiceno}<td><td >Invoice Date#-</td><td id="invopicedateId">${inventoryMgmtData.shippingDate}<td>
										</tr>
										<tr>
										<td>Product Code#-</td><td id="productcodeId">${inventoryMgmtData.productCode} <td><td>Product Description#-</td><td id="productdecId">${inventoryMgmtData.productDescription}<td>
										</tr>
										<tr>
										<td>Masterversion#-</td><td id="mastervId"> ${inventoryMgmtData.mvName}<td><td>Master Version Code#-</td><td id="mastercodeId">${inventoryMgmtData.mvCode}<td>
										</tr>
									<%-- 	<tr>
										<td>Main Series From#-</td><td id="mseriesFromId"><td><td>Main Series To#-</td><td id="mseriesToId"><td>
										</tr> --%>
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
					
		              <!-- ############################################# end ###########################  -->
	                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                               <tr>
	                               
	                                 <th><input type="checkbox" name="cbox" id="selectAll">  </th>
	                                <th>Product Name</th>
	                                <th>Quantity</th>
	                                 <th>Series From</th>
	                               <th>Series To</th>
	                                <th>Generate Qr code</th>
	          
	  </tr>                             
	                             
	                              	</thead>
	                              <c:forEach items="${inventoryMgmtData.dataObjList}" var="packageObj">
	                              
								 <tr >
								  <td> <input type="checkbox" name="cbox" value="${inventoryMgmtData.orderNumber}#${inventoryMgmtData.invoiceno}#${inventoryMgmtData.orderDate}#${inventoryMgmtData.shippingDate}#${packageObj.productFrom}#${packageObj.productTo}#${packageObj.productName}#${inventoryMgmtData.mvName}#${inventoryMgmtData.productCode}#${inventoryMgmtData.mvCode}#${packageObj.quantity}" class="cbx">  </td>
								  <td>${packageObj.productName}</td>
								 <td>${packageObj.quantity}</td>
								 <td>${packageObj.productFrom}</td>
								 <td>${packageObj.productTo}</td>
								<%-- <td><input type="button"   value="Generate QR Code" onclick="generateQRcode('${acList.orderNumber}','${acList.invoiceno}','${acList.orderDate}','${acList.invoicedate}','${acList.mainseriesfrom}','${acList.mainseriesto}','${acList.productName}','${acList.mvName}','${acList.productCode}','${acList.mvCode}','${acList.qty}')" /> </td> --%>
								<td><img height="100" width="100" src="${pageContext.request.contextPath}/images/qr_default_image.png"></td>
								
						
					</c:forEach> 
          
				 
	                              </table>
	                             </div>
	                            </div>
	                           </div>
	                           <!--  ##################### Generate QR Code START-->
	                           <div>
	                           <input type="button"   value="Generate QR Code" onclick="generateQrCodeForAll()" />
	                           </div>
	                            <!--  ##################### Generate QR Code END-->
	                           
	                          <div  id="qrgenerateid"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 collapse" >
			
			  <div  id="qrgenerateid1">    </div>
			  
			  
			<!--    <div   class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
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
										<td>Box Series From#-</td><td id="BseriesFromId">Iv123<td><td>Box Series To#-</td><td id="BseriesToId"><td>
										</tr>
										<tr>
										<td>Box Number#-</td><td id="boxnumberId">Iv123<td><td>Box Quantity#-</td><td id="boxquantity"><td>
										</tr>
	  						</tbody>
	  					</table>
						</div>
					</div>
 -->					</div>
			
			
			</div>  	  
	                           <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	           
	                           </form:form>
</body>
</html>