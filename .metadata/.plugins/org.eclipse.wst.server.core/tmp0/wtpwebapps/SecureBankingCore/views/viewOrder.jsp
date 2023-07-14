<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/fileinput.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />

<script type="text/javascript"			src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"			src="${pageContext.request.contextPath}/js/viewOrder.js"></script>
<script type="text/javascript" 			src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script type="text/javascript" 			src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" 			src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<title>Transaction Service</title>
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

<style type="text/css">
  li {
    color: black;
  }
</style>
</head>
<body onload="setDate(event);">

		<form:form id="viewOrderData" method="post" modelAttribute="viewOrderData"
			action="${pageContext.request.contextPath}/AdminUI/portalCreation/">
			
			 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_view_order_report" /></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p><font color="green">${successMessage}</font></p> 
									</div> 
							</c:if>	 
							<c:if test="${message!=''}">
									<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p ><font color="green">${message}</font></p> 
									</div> 
							</c:if>	
							<c:if test="${errorMessage!=''}"> 
								
				          			<div id="errorId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                           <p ><font color="red">${errorMessage}</font></p> 
									 
										</div>
								</c:if> 
							
	                    </div>
	                    <div class="row">
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_viewfor" class="styled-input">
									<form:select id="viewfor" path="viewfor" class="selecttag"  onfocus="removeHasError('divID_viewfor')"
												onclick="emptyerror(event,'OrderForErrorId');this.setAttribute('value', this.value);" value=""
												onchange="removeHasError('divID_onbehalf_Account');showForOnbehalf('${groupCode}');emptyerror(event,'viewForErrorId');emptyerror(event,'errorId');selecttag('label_viewfor','viewfor');">
										<%-- <form:option value="0" label=" " /> --%>
										<c:choose>
										
										<c:when test="${groupCode == 'RE'}">
											<form:option value="1" label="Self" />
										</c:when>
										<c:otherwise>
											<form:option value="1" label="Self" />
											<form:option value="2" label="Onbehalf" />
										</c:otherwise>
										
										</c:choose>
									</form:select>
											<label id="label_viewfor" class="valid"><spring:message code="label_Chk_for" /></label>
											<label id="viewForErrorId" class="collapse"></label>
					    		</div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="no_onbehalf1">
		                        <div id="divID_onbehalf_Account" class="styled-input" >
									<form:select name="onbehalf_Account" class="selecttag" id="onbehalf_Account" path="statusType"
										onclick="this.setAttribute('value', this.value);" value="" onfocus="removeHasError('divID_onbehalf_Account')"
										 onchange="emptyerror(event,'onbehalfTypeErrorId');validateOnbehalf();selecttag('label_onbehalf_Account','onbehalf_Account');">
									<%-- 	<form:option value="0" label=" " /> --%>
										<c:choose>
											<c:when test="${groupCode == 'PP'}">
												<form:option value="HO" label="Host" />
												<form:option value="DI" label="Distributer" />
												<form:option value="SD" label="Sub-Distributer" />
												<form:option value="RE" label="Agent" />
											</c:when>
											<c:when test="${groupCode == 'HO'}">
												<form:option value="DI" label="Distributer" />
												<form:option value="SD" label="Sub-Distributer" />
												<form:option value="RE" label="Agent" />
											</c:when>
											<c:when test="${groupCode == 'DI'}">
													<form:option value="SD" label="Sub-Distributer" />
												<form:option value="RE" label="Agent" />
											</c:when>
											<c:when test="${groupCode == 'SD'}">
												<form:option value="RE" label="Agent" />
											</c:when>
											<c:when test="${groupCode == 'RE'}">
											<!-- 	<script>
												$('#viewforName')
												.hide();												
												$('#viewfor')
												.hide();
												$('#viewForErrorId')
												.hide();
												</script> -->
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</form:select>
											<label id="label_onbehalf_Account" class="valid"><spring:message code="label_onbehalf_account" /></label>
											<label id="onbehalfTypeErrorId" class="collapse"></label>
					    			</div>		 
                          		
                      		</div>
                    
                      	
                      		<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " id="no_onbehalf">
		                        <div id="divID_select_onbehalf" class="styled-input" >
									<input id="select_onbehalf" autocomplete="off" class="selecttag" type="text" 
											onfocus="removeHasError('divID_select_onbehalf')"
											onkeypress="nameSelectt();emptyerror(event,'onbehalfErrorId');" 
											onchange="selecttag('label_no_onbehalf','onbehalf_Account');"/>
											<div id="suggestion-box"></div>
											<label id="label_no_onbehalf" class="valid"><spring:message code="label_Contact_Name" /></label>
											<label id="onbehalfErrorId" class="collapse"></label>
					    		</div>
                      		</div> --%>
                      		<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_orderBy"  class="styled-input" >
									<form:select id="orderBy" path="orderBy" class="selecttag" autocomplete="off"
										onclick="this.setAttribute('value', this.value);" value="" 
										onfocus="removeHasError('divID_orderBy')"
										onchange="emptyerror(event,'orderbyErrorId');emptyerror(event,'errorId');selecttag('label_orderBy','orderBy');">
										<form:option value="0" label=" " />
										<form:option value="1" label="Self" />
										<form:option value="2" label="Onbehalf" />
										<form:option value="3" label="All" />

									</form:select>
											<label id="label_orderBy" class="valid"><spring:message code="label_Order_by" /></label>
											<label id="orderbyErrorId" class="collapse"></label>
					    		</div>
                      		</div> --%>
                     
                      	
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
										<form:option value="ALL" label="All" />
										<form:option value="CANCELLED" label="Cancelled" />
										<form:option value="PENDING" label="Pending" />
										<form:option value="COMPLETE" label="Completed" />
										
									</form:select>
											<label id="label_status" class="valid"><spring:message code="label_OrderStatus" /></label>
											<label id="statusErrorId" class="collapse"></label>
									
					    		
                      			</div>
                      		</div>
                      		<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="divId_Order_Number" class="styled-input" >
										<form:input type='text'  class="selecttag"  autocomplete="off"
											id="label_Order_Number" path="orderNumber" size='29' maxlength='40' onkeyup="OrderAutoSearch();"
											onchange="selecttag('lab_orderNumber','label_Order_Number');" 
											onfocus="removeHasError('divId_Order_Number'),showlabel('lab_orderNumber','orderAutoSearchErrorId')"
											onclick="emptyErrorMessage(event,'orderAutoSearchErrorId');"></form:input>
											<form:input type='text'  class="selecttag" id="label_Order_Number" path="orderNumber" size='29' maxlength='40' onkeypress="emptyerror(event,'orderAutoSearchErrorId');
														  showlabel('lab_orderNumber','orderAutoSearchErrorId'); removeHasError('orderAutoSearchErrorId');"  onpaste="blockPaste(event,'orderAutoSearchErrorId')" onfocus="removeHasError('divId_Order_Number'),showlabel('lab_orderNumber','orderAutoSearchErrorId')"></form:input>
										    
											<label id="lab_orderNumber" class="valid"><spring:message code="label_Order_Number" /></label>
											<label id="orderAutoSearchErrorId" class="collapse"></label>
									
					    		</div>
                      		</div> --%>
                      		
                      		
                      		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                       			 <input type="button" class="btn btn-warning" id="submitButtonId"
									onclick="return validateViewOrder('viewOrderData',event);"
									value="Get Details" />
									<br><br>
                     		 </div>
                     		 
                     		 <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
                     		 	<label>Total units available : </label><label id="units"></label>
                     		 </div> -->
                     	 
                     		<div class="col-xs-12 collapse" id='reasonId'>
                     		 	<div class="transaction-table">
                     		 		<div class="table-responsive">
	                     		 		<table rules='none' id='reasonTableId'>
		  						
		  									<tr><center> Are you sure? </center></tr>
		  								</table>
		  							</div>
	  							</div>
                     		 </div>
                     	<div class="row">
                     		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb" id='tempDetails'>
	                       		 <div class="transaction-table">
		                         		<div class="table-responsive" style="height: 800px; overflow: auto;">
		                           		 	<table id="template_details" class="table table-striped table-bordered table-hover">
		                            		</table>
		                          	 	</div>
	                         	</div>
	                        </div>
                       </div>
	                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                         	<input type="hidden" id="contextPath" name="contextPath"
								value="${pageContext.request.contextPath}" />
							</div>
                      	 </div>
                      	 
                      	 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
                      	 
		</form:form>
	
</body>
</html>