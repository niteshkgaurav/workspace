<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.9.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/json.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/OrderRecieved.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toBeShipped.js"></script>
<title>To be Shipped</title>

</head>
<body>

	<form:form id="ShipOrder" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/toBeShipped">
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_tobeshipped"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
			          				 <div id="shiptextboxErrorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			                          </div>
			                       
	                    </div>
						<div class="row">
							<div class="col-xs-12" id='printdiv'>
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           		 <table id="shiporder_table" class="table table-bordered table-striped">
	                           		 	<tr class="mainTableHeader">
											<th align="center"><b><spring:message
														code="lab_Order_Number" /></b></th>
											<th align="center"><b><spring:message
														code="lab_product" /></b></th>
											<th align="center"><b><spring:message
														code="lab_MasterVersion" /></b></th>
											<th align="center"><b><spring:message
														code="lab_UnitOrder" /></b></th>
											<th align="center"><b><spring:message
														code="lab_UnitPending" /></b></th>
											<th align="center"><b><spring:message
														code="lab_Unit_Instock" /></b></th>
											<th align="center"><b><spring:message
														code="lab_Tobe_Shipped" /></b></th>
										</tr>
										<c:forEach items="${inventoryMgmtData.tobeshipped}"
											var="acList">
											<tr>
											
												<td>${acList.orderNumber}</td>
												<form:hidden path="hidorderno" value="${acList.orderNumber}" />
												<td>${acList.productName}</td>
												<form:hidden path="products" value='${acList.productId}' />
												<td>${acList.mvName}</td>
												<form:hidden path="mversion" value='${acList.mvId}' />
												<form:hidden path="orderId" name="orderFor" value='${acList.orderId}' />
												<td>${acList.unitsOrdered}</td>
												<td>${acList.unitsPending}</td>
												<td>${acList.availableStock}</td>
												<c:set var="availableunits"  value="${acList.availableStock}"></c:set>
												<c:set var="id" value="${acList.id}"></c:set>
												<form:hidden path="orderforlist"
													value='${acList.orderDoneFor}' />
												<td ><form:input id='orderforlist_${acList.id}' 
														name="shippedunit" path="shippedunit" type="text" 
														onkeypress="onlyNumric(event,'shiptextboxErrorId');blockSpace(event,'shiptextboxErrorId');"
														onchange="return validateUnitInstock('${acList.availableStock}','${acList.id}');" /></td>

											</tr>
											<div>
											<input type="hidden" name="listIds" id="mv" value="${acList.mvId}"/>
	 										<input type="hidden" name="productSeriesFrom" id="product" value="${acList.productId}"/>
											<input type="hidden" name="listIdss" id="acId" value="${acList.id}"/>
											</div>
											 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
												<input type="button" name="ship" class="btn btn-warning"
													value="Get Packages" onclick="return getPackage('${acList.id}','${acList.mvId}','${acList.productType}');" />
											</div>
										</c:forEach>
	                            	</table>
	                            	
	                <!-- <div class="row">	 -->			
					<div id="overlayId" class="row collapse">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
	          			<div class="styled-input">
	          			<form:select path="group" class="selecttag" onchange="selecttag('groupId','group');getpackages();"
	          					onfocus="showlabel('groupId','groupErrorId');" onclick="">
	          					<form:option value="0" label=" "/>
	          					<form:options value=""/>
	          			</form:select>
	          			<label id="groupId"><spring:message code="lab_groupType"/></label>
	          			<label id="groupErrorId" class="collapse"></label>
	          			</div>
	          			</div>
	          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="w3-input">
							<spring:message code="lab_packed_quantity"  var="lab_packed_quantity"/>
							<form:input id="noOfBox" type="text" class="selecttag" path="noOfProducts" readonly="true" onfocus="showlabel('quantityId','quantityErrorId');" />
							<label id="quantityId" >${lab_packed_quantity}</label>  
							<label id="quantityErrorId" class="collapse"></label>
						</div>
					</div>
          		</div>
          <!-- 	</div> -->
	                          	 </div>
	                          	  <!-- <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
			                       <input type="button" value="Get packages" onclick="printdiv('printdiv')" class="btn btn-warning"/>
							</div> -->
	                         </div>
	                         <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
							<input type="button" name="ship" class="btn btn-warning"
								value="Get Packages" onclick="return getPackage('orderforlist_${acList.id}');" />
						</div>
 --%>	                        </div>
	                        <!-- <div  id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
			                        <input
								type="button" value="Print" onclick="printdiv('printdiv')"  class="btn btn-warning"/>
							</div> -->
	                        <%--  <div  id="tempDetailsSubmit" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
			                        <input
								type="button" value="Print" onclick="printdiv('printdiv')"  class="btn btn-warning"/>
							</div>
							 <div  id="tempDetailsSubmit" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
			                        <input  class="btn btn-warning" type="submit" value="save"
									 onclick=" return validateUnitInstock('${availableunits}','${id}');" />
							</div> --%>
							
					</div>
					<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover "
								id="table_id">
								<thead class="default">
									<tr >
										<th>Actions</th>
										<th>Package name</th>
										<th>Product Series From</th>
										<th>Product Series From</th>
									</tr>
								</thead>
								<tbody id="ckBoxIds">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<form:hidden path="packageids" id="packageids" />
			
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		  <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	  			<input type="submit" id="shipPackageId" class="btn btn-warning"  value="Submit" onclick="return validateHostSubVersionPage();"/>
</div>


	</form:form>
</body>
</html>