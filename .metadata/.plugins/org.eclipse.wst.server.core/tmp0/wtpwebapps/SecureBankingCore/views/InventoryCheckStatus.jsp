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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.10.2.min.js"></script>
	

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fileinput.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/dataTable.css"/>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fileinput.css" />
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fileinput.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
	<script type="text/javascript"  src="//code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="//code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript"   src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	


<!--##################  -->
<script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
	<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<!--##################  -->
<%-- <script language='javascript'
	src="${pageContext.request.contextPath}/js/MyDate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/jquery.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script> --%>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> --%>
		<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script language='javascript'
	src="${pageContext.request.contextPath}/js/MyDate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/json/jquery.js"></script>

	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/InventoryCheckStatus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/viewOrder.js"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>

<script>
$.noConflict();
jQuery( document ).ready(function( $ ) {
  // Code that uses jQuery's $ can follow here.
});
// Code that uses other library's $ can follow here.
</script>
<script>
	
	$("#template_details").hide();
	window.onload = hideOnBehalf();
</script>
<style type="text/css">
li {
	color: black;
}
</style>
<title>Inventory check</title>
</head>
<body>
	<form:form id="InventoryCheck" method="post" modelAttribute="inventoryMgmtData" action="">

		<input type="hidden" value="${pageContext.request.contextPath}" name="linkViewOrder"/>
		       		 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_inventory_Check" /></h1>
	                      <div class="clearfix"></div>
	                     	<hr></hr>
	                     	 <div id="DataErrorId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           					<br></br>
									</div>
	                    </div>
	                
          				<div class="row">
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="divID_InventoryFor" class="styled-input">
											<form:select name="InventoryFor" class="selecttag"
												 id="InventoryFor" path="orderType" onfocus="removeHasError('divID_InventoryFor')"
												onchange="selecttag('label_InventoryFor','InventoryFor');selectInventory();"
												onclick="emptyerror(event,'OrderForErrorId');this.setAttribute('value', this.value);" value="">
												<form:option value="" label=" " />
												<form:option value="1" label="    Self" />
												<form:option value="0" label="OnBehalf" />
											</form:select>
											<label id="label_InventoryFor" class="valid"><spring:message code="label_Inventory_For" /> </label>
											<label id="OrderForErrorId" class="collapse"></label>
					    			</div>		 
                          		
                      		</div>
                      		<!-- <div id="Inventory_for_errorId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center"></div>   -->
            
	            			<div id="no_onbehalf1" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="onbehlf" class="styled-input">
								  <form:select name="onbehalf_Account"  class="selecttag"
								   onfocus="removeHasError('onbehlf')"
									id="onbehalf_Account" path="statusType" 
									onchange="onSelect();selecttag('label_onbehalf_Account','onbehalf_Account');"
									onclick="emptyerror(event,'onbehalfTypeErrorId');this.setAttribute('value', this.value);" value="">
									<form:option value="0" label=" " />
									<c:choose>
										<c:when test="${groupCode == 'PP'}">
											<form:option value="HO" label="HOST" />
											<form:option value="DI" label="DISTRIBUTER" />
											<form:option value="SD" label="SUB-DISTRIBUTER" />
											<form:option value="RE" label="AGENT" />
										</c:when>
										<c:when test="${groupCode == 'HO'}">

										<form:option value="DI" label="DISTRIBUTER" />
											<form:option value="SD" label="SUB-DISTRIBUTER" />
											<form:option value="RE" label="AGENT" />
										</c:when>
										<c:when test="${groupCode == 'DI'}">
												<form:option value="SD" label="SUB-DISTRIBUTER" />
											<form:option value="RE" label="AGENT" />
										</c:when>
										<c:when test="${groupCode == 'SD'}">
												<form:option value="RE" label="AGENT" />
										</c:when>
										<c:when test="${groupCode == 'RE'}">
											<script>
												$('#no_onbehalf').hide();

												for (i = 0; i < InventoryFor.length; i++) {
													if (InventoryFor.options[i].value == '0') {
														InventoryFor.remove(i);
													}
												}
											</script>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</form:select>
					    		<label id="label_onbehalf_Account"><spring:message	code="label_onbehalf_account"/></label>
					    		<label id="onbehalfTypeErrorId" class="collapse"></label>
                          	</div>	
                      	</div>
	                      	<div id="no_onbehalf" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="frmSearch" class="styled-input">
		                         			<form:input id="select_onbehalf" autocomplete="off"
											type="text" class="selecttag" path=""
											onkeypress="nameSelectI();emptyerror(event,'DataErrorId');"
											onclick="emptyerror(event,'onbehalfErrorId');" 
											onfocus="removeHasError('frmSearch');"
											onchange="selecttag('label_select_onbehalf','select_onbehalf');"/>
											
					    					 <label id="label_select_onbehalf" class="valid"> <spring:message code="label_account" /> </label>
					    					  <label id="onbehalfErrorId" class="collapse"></label>
                          		</div>
                      		</div>
                      	
                      		
	                     	 <div  id="showButton" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 	<input type="button" value="Show" class="btn btn-warning" onclick="getBoxDetails1()" />
	                      	</div>
	                	<div class="col-xs-12 collapse" id="info">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="template_details" class="table table-bordered table-striped">
	                               <thead>
	                              	   	<tr>
										<th><spring:message code="lable_product_name" /></th>
											<th><spring:message code="lable_master_version" /></th>
											<th><spring:message code="lab_cardType" /></th>
											<th><spring:message code="labl_avail_stock" /></th>
											
										

									
								</tr>
	                               		
	                               		
	                              </thead>
	                              <tbody id="showData">
	                              </tbody>
	                            </table>
	                            
	                          </div>
	                          <!-- ########################### -->
	                          <table id="template_details1" class="table table-bordered table-striped">
	                               <thead>
	                              	   	<tr>
											<th><spring:message code="lable_product_name" /></th>
											<th><spring:message code="lable_master_version" /></th>
											<th><spring:message code="lab_cardType" /></th>
											<th><spring:message code="labl_avail_stock" /></th>
	                               		</tr>
	                              </thead>
	                              
	                            </table>
	                            <!-- ##########################  -->
	                        </div>
                     	 </div>
                      </div>
                      
                      <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
                      
	</form:form>
</body>
</html>