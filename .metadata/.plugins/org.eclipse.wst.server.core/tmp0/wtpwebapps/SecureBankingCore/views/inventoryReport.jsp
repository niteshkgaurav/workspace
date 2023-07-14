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


<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/fileinput.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />

<script type="text/javascript"			src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<%-- <script type="text/javascript"			src="${pageContext.request.contextPath}/js/viewOrder.js"></script> --%>
<%-- <script type="text/javascript" 			src="${pageContext.request.contextPath}/js/commonfunction.js"></script> --%>

<script type="text/javascript" 			src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" 			src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>



<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/InventoryCheck.js"></script>	

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/viewOrder.js"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>
	
<script>

 $(document).ready(function(){
	 
	
	 $('#InventoryFor').val('');
	
	});  
	
   // window.onload = showVendor();
  //  window.location.reload();
</script>

<script type="text/javascript">
	$(function () {
		var currentDate=new Date(); 
	 	$('.datetimepicker1').datetimepicker({
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
             useCurrent: false,
       });
	});

	function setDate(event) {
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
		
		$('#lab_start_date').val(fromDate.getFullYear()+'-'+fromMonth+'-'+fromDay);
		$('#lab_end_date').val(toDate.getFullYear()+'-'+toMonth+'-'+toDay);
		
		var b = validateViewOrder('viewOrderData',event);
		
	}

	
	
// 	$(document).ready(function() {
// 		  $('#template_details').DataTable({
// 			  "scrollY":        "400px",
// 			  "scrollX":        "200px",
// 		        "scrollCollapse": true,
// 		        "paging":         true,
// 		        "pagingType": "simple_numbers"
// 		  });
// 	} );
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
	                      <h1 class="pull-left">Inventory Report</h1>
	                      <div class="clearfix"></div>
	                     	<hr></hr>
	                     	 <div id="DataErrorId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           					<br></br>
									</div>
									
									
									
									
									
									<div class="collapse navbar-collapse hidden-xs hidden-sm" id="bs-example-navbar-collapse-1">
                 <div class="nav navbar-nav navbar-right" >
               <table class="table table-bordered table-striped" >
                                 
                                 
                                 <c:choose>
										<c:when test="${groupCode == 'PP'}">

								<tr>
									<c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
										<td><font color='black'><b>Total: ${datakyc.unitAllStock}</b></font></td>
									</c:forEach>

									

									<td><font color='FF9966'><b>In-Transit: 0</b> </font></td>

								</tr>

							</c:when>
										<c:when test="${groupCode == 'HO'}">

								<tr>
									<c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
										<td><font color='black'><b>Total: ${datakyc.unitAllStock}</b></font></td>
									</c:forEach>
									<td><font color='FF9966'><b>In-Transit: 0</b> </font></td>

								</tr>
							</c:when>
							<c:when test="${groupCode == 'DI'}">

								<tr>
									<c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
										<td><font color='black'><b>Total: ${datakyc.unitAllStock}</b></font></td>
									</c:forEach>
									<td><font color='FF9966'><b>In-Transit: 0</b> </font></td>

								</tr>
							</c:when>
							<c:when test="${groupCode == 'SD'}">
								<tr>
									<c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
										<td><font color='black'><b>Total: ${datakyc.unitAllStock}</b></font></td>
									</c:forEach>
									<td><font color='FF9966'><b>In-Transit: 0</b> </font></td>

								</tr>
							</c:when>
							<c:when test="${groupCode == 'RE'}">
										  	<tr>
								<c:forEach var="datakyc" items='${inventoryMgmtDatas}'>			
								<td>
								
                               <font color='black'><b>Total: ${datakyc.unitAllStock}</b></font>
                                
                               </td>
                               </c:forEach>
                               
                               <c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
                                <td>
                                
                                <font color='FF0000'><b>Issued: ${datakyc.unitIssuedStock}</b> </font>
                               
                                </td>
                                </c:forEach>
                                
                                <c:forEach var="datakyc" items='${inventoryMgmtDatas}'>
                                <td>
                                 <font color='#FF5733'><b>Damaged: ${datakyc.damagdStock}</b> </font>
                                 </td>
                                 </c:forEach>
                               
                                <td>
                                 <font color='FF9966'><b>Blocked: 0</b> </font>
                                 </td>
                                 
                                 <td>
                                 <font color='FFCC00'><b>Unblocked: 0</b> </font>
                                 </td>
                                 
                                 <td>
                                 <font color='FF9966'><b>Remapped: 0</b> </font>
                                 </td>
                                 
                                 <td>
                                 <font color='00CC00'><b>Re-Issued: 0</b> </font>
                                 </td>
                                 
                                 <td>
                                 <font color='FF9966'><b>In-Transit: 0</b> </font>
                                 </td>
                                
                </tr>
											
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
												
				
							</table></div>
               </div>
	                    </div>
	                
          				<div class="row">
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="divID_InventoryFor" class="styled-input">
											<form:select name="InventoryFor" class="selecttag"
												 id="InventoryFor" path="orderType" onfocus="removeHasError('divID_InventoryFor')"
												onchange="checkvalue('${groupCode}');selecttag('label_InventoryFor','InventoryFor');selectInventory();"
												onclick="emptyerror(event,'OrderForErrorId');this.setAttribute('value', this.value);" value="">
												<form:option value="" label=" " />
								      <c:choose>
										
											<c:when test="${groupCode == 'RE'}">
												<form:option value="1" label="Self" />
											</c:when>
											
											<c:otherwise>
												    <form:option value="1" label="Self" />
													<form:option value="0" label="OnBehalf" />
											</c:otherwise>
										
										</c:choose>
												
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
									onchange="onSelect();selecttag('label_onbehalf_Account','onbehalf_Account');productTypeCheck();"
									         
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
                      		
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_start_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_start_date" path="fromDate" class=" selecttag"
										autocomplete="off" onchange="selecttag('label_fromDate','lab_start_date');" 
										onfocus="emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('divID_start_date');showlabel('label_fromDate','lab_start_date_ErrorId')"  />
										<label id="label_fromDate" class="valid"><spring:message code="lab_start_date" /></label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_fromDate');showlabel('label_fromDate','lab_start_date_ErrorId');removeHasError('divID_start_date');"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="toDate_divID" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="lab_end_date" autocomplete="off"
										path="toDate" class="selecttag" type="text" 
										onchange="selecttag('label_toDate','lab_end_date');" 
										onfocus="emptyerror(event,'lab_end_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('toDate_divID');showlabel('label_toDate','lab_end_date_ErrorId')"/>
											<label id="label_toDate" class="valid"><spring:message code="lab_end_date" /></label>
											<label id="lab_end_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId');removeHasError('toDate_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>
                      		
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="status_divID" class="styled-input" >
					    			
									<form:select id="status" path="status" class="selecttag" 
										onclick="this.setAttribute('value', this.value);" value="" 
										onfocus="removeHasError('status_divID')"
										onchange="emptyerror(event,'chkForErrorId');emptyerror(event,'statusErrorId');selecttag('label_status','status');" >
										<%-- <form:option value="0" label=" " /> --%>
										
										<c:choose>
										<c:when test="${groupCode == 'PP'}">
										
											<form:option value="ALL" label="All" />
											
											<form:option value="IN TRANSIT" label="In Transit" />
								
							           </c:when>
										<c:when test="${groupCode == 'HO'}">
											<form:option value="ALL" label="All" />
											
											 <form:option value="IN TRANSIT" label="In Transit" />
                                            
										    
										</c:when>
										<c:when test="${groupCode == 'DI'}">
										
											<form:option value="ALL" label="All" />
											
											<form:option value="IN TRANSIT" label="In Transit" />
												
										</c:when>
										<c:when test="${groupCode == 'SD'}">
										<form:option value="ALL" label="All" />
										
										<form:option value="IN TRANSIT" label="In Transit" />
												
										</c:when>
										<c:when test="${groupCode == 'RE'}">
										 <form:option value="ALL" label="All" />
										<form:option value="ISSUED" label="Issued" />
										<form:option value="BLOCKED" label="Blocked" />
										
										<form:option value="UNBLOCKED" label="Unblocked" />	
										<form:option value="DAMAGED" label="Damaged" />			
										
										<form:option value="REMAPPED" label="Re-mapped" />
										<form:option value="REISSUED" label="Re-Issued" />
										<form:option value="IN TRANSIT" label="In Transit" />
											
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
							
									</form:select>
											<label id="label_status" class="valid">Status</label>
											<label id="statusErrorId" class="collapse"></label>
									
					    		
                      			</div>
                      		</div>
                      		
                      	<!-- ################################## -->
                      	
                 <%--      	
                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="status_divID2" class="styled-input" >
					    			
									<form:select id="status" path="status" class="selecttag" 
										onclick="this.setAttribute('value', this.value);" value="" 
										onfocus="removeHasError('status_divID2')"
										onchange="emptyerror(event,'chkForErrorId');emptyerror(event,'statusErrorId');selecttag('label_status','status');" >
										<form:option value="0" label=" " />
										 <form:option value="ALL" label="All" />
										<form:option value="ISSUED" label="Issued" />
										<form:option value="BLOCKED" label="Blocked" />
										<form:option value="UNBLOCKED" label="Unblocked" />				
										
										
										<form:option value="REMAPPED" label="Re-mapped" />
										<form:option value="REISSUED" label="Re-Issued" />
										<form:option value="IN TRANSIT" label="In Transit" />
										
									</form:select>
											<label id="label_status" class="valid"></label>
											<label id="statusErrorId" class="collapse"></label>
									
					    		
                      			</div>
                      		</div> --%>
              
                      	
                      	
                      	<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
                      		
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
	                          <!-- <table style="width:100%" id="template_details2" class="table table-bordered table-striped">
								  <tr>
								    <th>TOTAL</th>
								    <th colspan="1">Issued</th>
								    <th colspan="1">In Transit</th>
								  </tr>
								  
							</table> -->
	                          <table id="template_details1" class="table table-bordered table-striped">
	                               <thead>
	                               
	                              
	                              	   	<tr>
	                              	   	    <th>Date</th>
											<th>Account Type</th>
											<th>Company Name</th>
											<th>Status</th>
											<th>Units</th>
											
											
											
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