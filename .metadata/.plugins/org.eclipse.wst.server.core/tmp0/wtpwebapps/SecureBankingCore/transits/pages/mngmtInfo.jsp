<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.*"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@page import="java.util.*"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${pageContext.request.contextPath}/transits/js/canvasjs.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
	


<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/UserForgetPassword.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/transits/js/transitMis.js"></script>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> 
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
		<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>	 -->
<script>
	function changeSelect() {
		//$("#selectBox").selec
		var a = $("#selectBox option:selected").val();
		if (a == 'Route') {
			$('#RouteDiv').show();
			$('#BusDiv').hide();
			$('#DepotDiv').hide();
			$('#ConductorDiv').hide();

		} else if (a == 'Bus') {
			$('#RouteDiv').hide();
			$('#BusDiv').show();
			$('#DepotDiv').hide();
			$('#ConductorDiv').hide();
		} else if (a == 'Depot') {
			$('#RouteDiv').hide();
			$('#BusDiv').hide();
			$('#DepotDiv').show();
			$('#ConductorDiv').hide();
			
			
		}else if (a == 'Conductor') {
			$('#RouteDiv').hide();
			$('#BusDiv').hide();
			$('#DepotDiv').hide();
			$('#ConductorDiv').show();
			
			
		} 
		
		else {
			$('#RouteDiv').hide();
			$('#BusDiv').hide();
			$('#DepotDiv').hide();
			$('#ConductorDiv').hide();

		}

	}
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>


<script type="text/javascript">
$(document).ready(function() {
		  $('#table_id').DataTable({
		        "scrollY":        "350px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
	  	  
} );
</script>


<script>
function validate(event){
	var v1=$('#option').val().trim();
	var v2=$('#dateFrom').val();
	var v3=$('#dateTo').val();
	
	if(v1.length==0){
		$('#div_id_depot').addClass('has-error');
		alert("Select either route or bus to proceed");
	}
	
	if(v2.length>v1.length){
alert("from date should be less than to date");
		
	}
	event.preventDefault();
}


</script>


<script>
	$(function() {

		var currentDate = new Date();
		$('#datetimepicker1').datetimepicker({

			format : 'YYYY-MM-DD',
			maxDate : 'now',
			useCurrent : false,

		});
		$('#datetimepicker2').datetimepicker({

			format : 'YYYY-MM-DD',
			maxDate : 'now',
			useCurrent : false,

		});

	});
</script>




<title>Insert title here</title>
</head>
<body>


	<div class="bootstrap-iso">
		<div class="container-fluid">
			<div class="row">
		
				<form:form method="post" modelAttribute="faresmodel"
					action="${pageContext.request.contextPath}/AdminUI/misTransit/mngmtInfo">
					<div class="heading-inner ">
						<!-- ****************************************** Form Heading  ******************************* -->
						<h1 class="pull-left">Fare Summary</h1>
						<div class="clearfix"></div>

						<%-- <div id="successMessageId"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${MessageAfterBCRegistration}</font></p> 
									</div>  --%>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
							&nbsp;</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
							<div class="styled-input" id="div_id_depot">
								<form:select name="countryCode" path="option"
									onChange="changeSelect();"
									onfocus="removeHasError('div_id_depot')" id="selectBox">
									<form:option value="" label=" " />
									<form:option value="Route" label="Route" />
									<form:option value="Bus" label="Bus" />
									<form:option value="Depot" label="Depot" />
									<form:option  value="Conductor" label="Conductor"/> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Select </label>
								<label id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>

						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center"
							id="RouteDiv">
							<div class="styled-input" id="div_id_depot">
								<form:select name="countryCode" path="routeId" id="routeId"
									onChange="getRoute();" onfocus="removeHasError('div_id_depot')">
									<form:option value="00" label="All" />
									<form:options items="${routes}" />
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Routes</label> <label
									id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>

						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center"
							id="BusDiv">
							<div class="styled-input" id="div_id_depot">
								<form:select name="countryCode" path="busId" id="busId"
									onChange="getRoute();" onfocus="removeHasError('div_id_depot')">
									<form:option value="00" label="All" />
									<form:options items="${buses}" />
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Buses</label> <label
									id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center"
							id="DepotDiv">
							<div class="styled-input" id="div_id_depot">
								<form:select name="countryCode" path="depotId" id="depotId"
									onChange="getRoute();" onfocus="removeHasError('div_id_depot')">
									<form:option value="00" label="All" />
									<form:options items="${depots}" />
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Depots</label> <label
									id=countryCodeerroeId1 class="collapse"></label>

							</div>
						</div>
						

						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center" id="ConductorDiv">
    <div class="styled-input" id="div_id_depot">
     	<form:select  name="countryCode" path="userId" id="userId" onChange="getRoute();"  onfocus="removeHasError('div_id_depot')">
								<form:option  value="0" label="All"/>
								 <form:options items="${conductors}" /> 
								</form:select>
								<label id="countryCodeId1" class="valid">*&nbsp;Conductors</label> <label
								id=countryCodeerroeId1 class="collapse"></label>
								
    </div>
   </div>
						<script type="text/javascript">
							$('#RouteDiv').hide();
							$('#BusDiv').hide();
							$('#DepotDiv').hide();
							$('#ConductorDiv').hide();
						</script>  
						<br>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
							<div class="styled-input">
								<div class="input-group date" id="datetimepicker1">
									<form:input path="dateFrom" class="selecttag" type="text"
										placeholder="." value="${faresmodel.dateFrom}"
										onclick=" removeErrorMessage(); emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')"
										onfocus="selecttag('label_lab_dob','lab_dob')" />
									<label id="label_lab_dob" class="valid">From Date</label> <label
										id="lab_dobErrorId" class="collapse"></label> <i
										class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</i>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
							<div class="styled-input">
								<div class="input-group date" id="datetimepicker2">
									<form:input path="dateTo" class="selecttag" type="text"
										placeholder="." value="${faresmodel.dateTo}"
										onclick=" removeErrorMessage(); emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')"
										onfocus="selecttag('label_lab_dob','lab_dob')" />
									<label id="label_lab_dob" class="valid">To Date</label> <label
										id="lab_dobErrorId" class="collapse"></label> <i
										class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</i>
								</div>
							</div>
						</div>

						<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input">
		                         	 <div class="input-group date" id="datetimepicker1">
		                            	<form:input id="lab_dob" path="dateTo" class="selecttag" type="text"  placeholder="."
					                         onclick=" removeErrorMessage(); emptyerror(event,'lab_dobErrorId');showlabel('label_lab_dob','lab_dobErrorId');selecttag('label_lab_dob','lab_dob')"
					                         onfocus="selecttag('label_lab_dob','lab_dob')"    />
		                           		 	 <label id="label_lab_dob" class="valid"><spring:message code="lab_dob"/></label>
					                         <label id="lab_dobErrorId" class="collapse"></label>
					                         <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i> </i>
		                           </div>
		                        </div>
		                      </div> --%>

						<div
							class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
							<input id="submitId" type="submit" onclick="validate(event)"
								class="btn btn-warning" value="Get Report" />
						</div>
						
						

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 "></div>
						<%-- 	 <c:if test="${!empty allfares}"> --%>
						<div class="col-xs-12" id="tabb">
							<div class="transaction-table">
								<div class="table-responsive">

									<table class="table table-bordered table-striped" id="table_id1">
										<thead>
											<tr>

												<th>Txn Id</th>
												<th>Txn Date</th>
												<th>CustomerCard Id</th>
												<th>Route No</th>
												<th>Trip Amount</th>
												<th>Txn Amount</th>
												<th>Bus Id</th>
												<th>User Id</th>

											</tr>
										</thead>
										<tbody id="datas">
											<%-- <c:forEach items="${allfares}" var="extract">
										   <tr>
											    <td><c:out value="${extract.txnnType}"/></td>
											    <td><c:out value="${extract.txnDate}"/></td>
											    <td><c:out value="${extract.customerCardId}"/></td>
											    <td><c:out value="${extract.routeId}"/></td>
											    <td><c:out value="${extract.tripAmount}"/></td>
											    <td><c:out value="${extract.txnAmount}"/></td>
		                                        <td><c:out value="${extract.busId}"/></td>
		                                        <td><c:out value="${extract.userId}"/></td>
											    									    
											   
											   
										   </tr> 
									  </c:forEach>		--%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
							<input id="downloadId"  type="submit" name="download" class="btn btn-warning" value="Download Report" onclick="return validateMIS(event)"/>
						<!-- 	<input id="downloadId"  type="submit" name="download" class="btn btn-warning" value="Download"/> -->
						</div>
						<%-- </c:if>   --%>

	<%
							Gson gsonObj = new Gson();
							
							List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
							
		%>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 "></div>
						<c:if test="${!empty allfares}">
							<div class="col-xs-12">
								<div class="transaction-table">
									<div class="table-responsive">

										<table class="table table-bordered table-striped"
											id="table_id">
											<thead>
												<tr>

													<th>${option}</th>
													<th>Transaction Amount</th>
													<!--  <th>Tickets</th> -->

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${allfares}" var="extract">
												<%-- size 	${fn:length(extract.value) }  --%>
												 <c:if test="${extract.value[1]>0.0 }"> 
													<tr>
													
											<c:set var="heading" value="${extract.value[0]}" scope="request"/>
											<c:set var="values" value="${extract.value[1]}" scope="request"/>
														<td><c:out value="${extract.value[0]}" /></td>
														<td>
														<c:if test="${fn:length(extract.value) == 3 }"> 
														<a href="#"
															onclick="getDetail('${extract.key}');"><c:out
																	value="${extract.value[1]} ${extract.value[2]}" /></a>
														</c:if>
														<c:if test="${fn:length(extract.value) != 3 }"> 
														<a href="#"
															onclick="getDetail('${extract.key}');"><c:out
																	value="${extract.value[1]}"  /></a>
														</c:if>
														</td>
														 
								<%
								try{
									Map<Object,Object> map = null;
									//Map datas=(Map)request.getAttribute("extract");
									//out.println("<h1>"+request.getAttribute("extract")+"</h1>");
									//String data[]=(String[])request.getAttribute("data");
									String heading=(String)request.getAttribute("heading");
									Double val=Double.parseDouble((String)request.getAttribute("values"));
									
									map = new HashMap<Object,Object>(); 
									map.put("label", heading); 
									map.put("y", val);
									list.add(map);

								}catch(Exception e)
								{
									e.printStackTrace();
								}
							
%>


													</tr>
													 </c:if>   
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:if>

<%
	String dataPoints = gsonObj.toJson(list);
%>

					</div>
					
					<div id="chartContainer" style="height: 300px; width: 100%;"></div>
					
					
					 <script type="text/javascript">
					 var chart = new CanvasJS.Chart("chartContainer", {
							animationEnabled: true,
							theme: "light2", // "light1", "dark1", "dark2"
							title: {
								text: "Mis Report"
							},
							subtitles: [{
								text: "Data Analysis",
								fontSize: 16
							}],
							axisY: {
								scaleBreaks: {
									type: "wavy",
									autoCalculate: true
								}
							},
							data: [{
								type: "column",
								indexLabel: "{y}",
								dataPoints: <%out.print(dataPoints);%>
							}]
						});
						chart.render();
						
						</script> 
					
										<script>
											changeSelect();
											$('#tabb').hide();	$("#downloadId").hide();
										</script>



<input type="hidden" name="idd" id="idd" value="">

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
