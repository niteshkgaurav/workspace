<%@page import="java.util.Arrays"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


<script>
$(function () {

	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
            useCurrent: false,
    });
});
</script>
</head>
<title>Product service Mapping</title>
<body>
	<form:form id="productsevicemapping" method="post"
		modelAttribute="financialinstrumentdata"
		action="${pageContext.request.contextPath}/AdminUI/partnerManagement/getproductservicemapping"
		enctype="multipart/form-data">
		<div class="heading-inner  ">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">Product Service Mapping</h1>
			<div class="clearfix"></div>
			<hr>
		</div>

		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                    <div id="productidiv_Id" class="styled-input">
								<form:select id="productid" class="selecttag"  onfocus="removeHasError('productidiv_Id')"
									path="productId"  onchange="selecttag('lab_products','productid')"
									onclick="emptyerror(event,'lab_InstrumentId');this.setAttribute('value', this.value);" value="">
									<form:option value="0" label=" " />
									<form:options items="${productmap}" />
								</form:select>
											<label id="lab_products"><spring:message code="lab_instrumentname" /></label>
											<label id="lab_Errorproducts" class="collapse"></label>
					    	</div>
                      	</div>
		
		
		
		


<div class="col-xs-12">
			<div class="transaction-table">
				<div class="table-responsive">
					<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6  text-center"
						id="providerErrorId" align="center"></div>
					<table class="table table-bordered table-striped"
						style="height: 50px; overflow: auto">
						
						<thead>
						<tr><th>Instrument & Service Mapping</th> </tr>
						
						</thead>
						
</table>
</div>
</div>
</div>

		<div class="col-xs-12">
			<div class="transaction-table">
				<div class="table-responsive">
					<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6  text-center"
						id="providerErrorId" align="center"></div>
					<table class="table table-bordered table-striped"
						style="height: 50px; overflow: auto">



						<c:forEach var="instruments" items="${instrumentmap}">


							<tr>

								<td align="center">${instruments.value}&nbsp &nbsp&nbsp
									&nbsp <form:checkbox
										id="financialInstrumenId${instruments.key}"
										path="instrumentlist" name="financialInstrumentmap"
										value="${instruments.key}" />
								</td>

								<td><div class="col-xs-12">
										<div class="transaction-table">
											<div class="table-responsive">


												<table class="table table-bordered table-striped"
													style="height: 50px; overflow: auto">
													<c:forEach var="financialservices"
														items="${financialInstrumendata.lists}">
														<c:if
															test="${instruments.key==financialservices.instrumentId}">

															<tr>

																<td align="center">${financialservices.servicename}
																	&nbsp &nbsp&nbsp &nbsp <form:checkbox
																		id="financialInstrumenId${financialservices.id}"
																		path="financialnstrumentlist"
																		name="financialInstrumentmap"
																		value="${financialservices.id}#${financialservices.instrumentId}" />
																</td>

															</tr>
														</c:if>

													</c:forEach>
												</table>

											</div>
										</div>
									</div></td>


							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			<div id="div_fromDate" class="styled-input">
				<div class="input-group date datetimepicker1">
					<form:input id="lab_start_date" path="fromDate" class=" selecttag"
						autocomplete="off" type="text"
						onclick="selecttag1('label_fromDate','lab_start_date')"
						onfocus="emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('div_fromDate');selecttag('label_fromDate','lab_start_date')" />
					<label id="label_fromDate"><spring:message
							code="lab_start_date" /></label> <label id="lab_start_date_ErrorId"
						class="collapse"></label> <i class="input-group-addon"> <i
						class="glyphicon glyphicon-calendar"
						onclick="selecttag1('label_fromDate');removeHasError('div_fromDate');showlabel('label_fromDate','lab_start_date')"></i>
					</i>
				</div>
			</div>
			</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			<div id="div_toDate" class="styled-input">
				<div class="input-group date datetimepicker1">
					<form:input id="lab_end_date" path="toDate" class="selecttag"
						type="text" autocomplete="off"
						onclick="selecttag1('label_toDate','lab_end_date')"
						onchange="selecttag('label_toDate','lab_end_date');"
						onfocus="emptyerror(event,'lab_end_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('div_toDate');showlabel('label_toDate','lab_end_date_ErrorId')" />
					<label id="label_toDate"><spring:message
							code="lab_end_date" /></label> <label id="lab_end_date_ErrorId"
						class="collapse"></label> <i class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"
						onclick="removeHasError('div_toDate');selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"></i>
					</i>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" value="submit" class="btn btn-warning" />
		</div>
		
		
			<div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="abc" class="table table-bordered table-striped">
	                              <thead>
	                                <tr>
	                                  	
										<th><spring:message	code="lab_products" /></th>
										<th><spring:message code="lab_instrumentname" /></th>
										<th><spring:message code="lab_servicename" /></th>
										<th>Status</th>
										<th><spring:message code="lab_Action" /></th>
	                                </tr>
	                              </thead>
	                              <tbody>
	   
	                                <c:forEach items="${productservicemappinglist}" var="instrumentlist" >
										<tr>
										<td>${instrumentlist.productName}</td>
										<td>${instrumentlist.instrumentname}</td>
										<td>${instrumentlist.name}</td>
										<td>${instrumentlist.status}</td>
											
										<c:if  test="${instrumentlist.productName!=null}">
											<td  align="center"><a
											href="${pageContext.request.contextPath}/AdminUI/partnerManagement/ProductServicesMappingEdit?serviceproductId=${instrumentlist.productId}"><img
											title="edit"
											src='${pageContext.request.contextPath}/images/edit.gif'
											style='cursor: hand' align="center" /></a></td>
											
											</c:if>
										</tr>
									</c:forEach>
	                                
	                              </tbody>
	                            </table>
	                          </div>
	                        </div>
                     	 </div>

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>