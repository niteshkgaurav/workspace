<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.PhysicalRecieptData" %>
<%@ page import="java.util.UUID" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<!-- <script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script> -->
<!--##################  -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script> -->
	<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<!--##################  -->
<!-- <script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script> -->

<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/jquery.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/physicalReciept.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<title>Physical Receipt</title>
<style>
a:link {
    color: blue;
}

/* visited link */
/* a:visited {
    color: purple;
} */

/* selected link */
a:active {
    color: blue;
}
</style>
<script>
$(function () {
	$('#datetimepicker1').datetimepicker({
          format: 'YYYY-MM-DD'
    });
});
</script>
</head>

<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>
	<form:form id="physicalReceipt" method="post"
		modelAttribute="physicalRecieptData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/physicalRecieptSubmit">
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_PhysicalReceiptTitle"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${msgId!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${msgId}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
				          				 <div id="errorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				                                           <p class="text-danger">${errorMessage}</p> 
										</div>
								</c:if> 
	                    </div>
	                   
	                        <div class="transaction-table">
	                            <table id="OrderRecieved_table" class="table  table-bordered table-striped " style="table-layout:fixed">
	                            	
	                               <thead>
	                              	   	<tr>
											<th style="width:100px" align="center"><b><spring:message code="label_orderNo" /></b></th>
											<th align="center"><b><spring:message code="lab_product" /></b></th>
											<th align="center"><b><spring:message code="lab_product_code" /></b></th>
											<th align="center"><b><spring:message code="lab_MasterVersion" /></b></th>
											<th align="center"><b><spring:message code="lab_MasterVersion_code" /></b></th>
											<th align="center"><b><spring:message code="lab_cardType" /></b></th>
											<th align="center"><b><spring:message code="lab_UnitOrder" /></b></th>
											<th align="center"><b>Units Received</b></th>
											<th align="center"><b><spring:message code="lab_UnitPending" /></b></th>
											<th style="width:50px" align="center"><b><spring:message code="lab_ShortBoxes" /></b></th>
											<th align="center"><b><spring:message code="lab_Short_Overlays" /></b></th>
											<th align="center"><b><spring:message code="label_boxReceived" /></b></th>
	                               		</tr></thead></table></div>
	                               		
				 <div class="transaction-table">
	                          <div class="table-responsive" style="height: 400px; overflow: auto;">
					
    				<table id="tableData" class="table table-bordered table-striped table-condensed" style="table-layout:fixed">
							<tbody>
							<c:forEach items="${physicalRecieptData.physicalRecieptDataList}" var="acList">
							<c:set  var="valueHyperlink" value="${acList.shortBoxes}"></c:set>
							<c:set  var="valueHyperlink2" value="${acList.shortOverlays}"></c:set>
							<tr id="rowId_${acList.id}">
								<td style="width:100px" align="center">${acList.ordernumber}</td>
								<td align="center">${acList.product}</td>
								<td align="center">${acList.productCode}</td>
								<td align="center">${acList.masterVersion}</td>
								<td align="center">${acList.masterVersionCode}</td>
								<td align="center">${acList.cardType}</td>
								<td align="center">${acList.unitQuantity}</td>
								<td align="center">${acList.unitReceived}</td>
								<td align="center">${acList.pendingQuantity}</td>
									<%
												String id=	((PhysicalRecieptData)(pageContext.findAttribute("acList"))).getProduct();
									            String mv=	((PhysicalRecieptData)(pageContext.findAttribute("acList"))).getMasterVersion();
											    String order=	((PhysicalRecieptData)(pageContext.findAttribute("acList"))).getOrdernumber();
											 
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "product="+id+"&mv="+mv+"&order="+order);
												String shortOverlays=KeyEncryptionUtils.encryptUsingKey(key, "product="+id+"&mv="+mv+"&order="+order);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
								<c:choose>
								<c:when test="${acList.shortBoxes==0}">
								
								<td align="center"> <a  style="pointer-events: none" href="shortBoxesView?enc=<%=shortOverlays %>&param1=<%=param %>&param2=<%=param1 %>"  >${acList.shortBoxes}</a></td>
								</c:when>
								<c:otherwise>
								
							
								<td align="center"> <a  href="shortBoxesView?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"  >${acList.shortBoxes}</a></td>
								</c:otherwise>
								</c:choose>
								<c:choose>
								<c:when test="${acList.shortOverlays==0}">
								<td style="width:50px" align="center"><a  style="pointer-events: none" href="shortOverlaysView?enc=<%=shortOverlays %>&param1=<%=param %>&param2=<%=param1 %>" >${acList.shortOverlays}</a></td>
								</c:when>
								<c:otherwise>
								<td style="width:50px" align="center"><a   href="shortOverlaysView?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>" >${acList.shortOverlays}</a></td>
								</c:otherwise>
								</c:choose>
								<td style="width:50px" align="center">${acList.boxReceived}</td>
							</tr>
						</c:forEach>
                    </tbody>
                   
                  </table>
                  </div>
                </div>
                <hr>
	                     
                     
                     	 <div class="row">
                     	 
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input select_Product" id="Select Product">
											<form:select id="productss" path="productss" name ="overlayOrCard" class="selecttag" onfocus="removeHasError('Select Product')"
												onchange="productTypeCheck()" onclick="this.setAttribute('value', this.value);selecttag('Select Product','label_productssId');" value="">
												<%-- <form:option value="1" label="Overlay" />
												<form:option value="2" label="PayCard" />
												<form:option   value="3"   label="Reader"  /> --%>
												<form:option value="" label="" />
												 <c:forEach var="product" items="${products}">
												 	<form:option value="${product.id}" label="${product.productName}" />
												 </c:forEach> 
												</form:select>
												<label id="Select Product"class="valid"><spring:message code="Select Product" /></label>
					    			</div>		 
                      		</div>
                      		</div>
                     	 <div class="row">
                     	 
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="label_vendor">
											<form:select id="label_vendorId" path="vendorId" class="selecttag" onfocus="removeHasError('label_vendor')"
												 onclick="this.setAttribute('value', this.value);" value="" onchange="selecttag('label_vendorId','vendorId');">
												<%-- <form:options items="${vMap}" /> --%>
												</form:select>
												<label id="lab_vendorId" class="valid"><spring:message code="label_vendor" /></label>
					    			</div>		 
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="divID_scanId">
												<form:select id="status_Id" path="scanId" class="selecttag" onfocus="removeHasError('divID_scanId')"
												onchange="getProductDetail();"  onclick="this.setAttribute('value', this.value);selecttag('lab_status_Id','status_Id');" value="">
													<form:option value="" label=" " />
													<form:option value="1" label="Box" />
													<form:option value="2" label="Loose Product" />
												</form:select>
												<label id="lab_status_Id"class="valid"><spring:message code="label_scan" /></label>
					    			</div>		 
                      		</div>
                      	</div>
                      	<div class="row" id="openProduct">
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="div_invoiceNumber" >
												<form:input type="text" id="invoiceNumber" path="invoiceNumber" 
												onchange="selecttag('label_invoiceNumber','invoiceNumber')" autocomplete="off"
												class="selecttag" onfocus="removeHasError('div_invoiceNumber');emptyerror(event,'lab_qrCodeValueErrorId')"/>
												<label id="label_invoiceNumber"class="valid"><spring:message code="lab_invoiceNumber"/></label>
												
					    			</div>		 
                          		
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" >
		                        	<%-- <div class="input-group date" id="datetimepicker1">
										<form:input id="lab_invoiceDate" path="invoiceDate" class="selecttag" readonly="true"
												type="text" onfocus="removeHasError('datetimepicker1');emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');" />
										<label id="label_invoiceDate" class="valid"><spring:message code="lab_invoice_date" /></label>
										 <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
									</div>	 --%>
									<div class="input-group date" id="datetimepicker1">
										<form:input id="lab_invoiceDate" path="invoiceDate" class="selecttag" 
												type="text" onfocus="removeHasError('datetimepicker1');emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');" />
										<label id="label_invoiceDate" class="valid"><spring:message code="lab_invoice_date" /></label>
										 <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
									</div>			
					    		</div>		 
                          		
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="div_orderId" >
												<form:select id="orderId" class="selecttag"	path="orderId" onfocus="removeHasError('div_orderId');"
													onchange="emptyerror(event,'stateErrorId');selecttag('lab_orderId','orderId')"	>
													<form:option value="" label=" " />
													<form:options items="${physicalRecieptData.orderDetails}" />
												</form:select>
												<label id="lab_orderId"class="valid"><spring:message code="lab_Order_Number" /></label>
												
					    			</div>		 
                          		
                      		</div>
                      	</div>
                      	<div class="row">
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="lab_qrCodeValueId">
												<form:input type="text" id="qrValue" path="qrCodeValue" class="selecttag"
													 onchange="selecttag('label_qrValue','qrValue')" autocomplete="off"
													onfocus="emptyerror(event,'lab_qrCodeValueErrorId');emptyerror(event,'msgId');
													emptyerror(event,'errorId');removeHasError('lab_qrCodeValueId')"/>
												<label id="label_qrValue"class="valid"><spring:message code="lab_qrCodeValue"/></label>
												
					    			</div>		 
                          		
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id='lab_qrCodeValueErrorId'></div>
                      		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                       			 <input type="button" id="submitId" value="Get Details" class="btn btn-warning" onclick="return vaidatePhysicalReceipt();" />
                        
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      </div>
	                      <div class="col-xs-12" id="tempDetails">
		                        <div class="transaction-table">
		                          <div class="table-responsive">
		                            <table id="template_details" class="table table-bordered table-striped">
		                            	
		                             
		                            </table>
		                          </div>
		                        </div>
	                     </div>
	                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                       			 <input type="submit" value="Submit" onclick="" class="btn btn-warning" id="tempDetailsSubmit"/>
                        
	                      </div>
	                 </div>
                      	
	 <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		<input type="hidden" id="valueOfHyperlink" value='${valueHyperlink}'/>
		<input type="hidden" id="valueOfHyperlink2" value='${valueHyperlink2}'/>
	</form:form>