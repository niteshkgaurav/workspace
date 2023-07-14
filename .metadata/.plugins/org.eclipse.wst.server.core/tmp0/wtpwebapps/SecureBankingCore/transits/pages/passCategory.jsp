<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/passCategory.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 		
<title>Bus Pass Management</title>

<script>
function removeMsg(){
	$('#msgId').hide();
	
}
</script>

</head>

<body>

 <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Bus Pass Category</h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">				        
					          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="msgId">
					            <p id="statusmsgId"><font color="green">${msgSuccessFailure}</font></p>
					          </div>								
											        
					        	<form:form method="POST" id="busPassForm" name="passCategoryForm" action="${pageContext.request.contextPath}/AdminUI/busPass/savePassCategory" >
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" hidden="true">
									       <div class="styled-input">
									         <form:hidden path="id"  value="${busPassCategory.id}" readonly="true"   />
									     <span></span> 
									   </div>
									</div>						        	
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDbusPassCode" class="styled-input">
									         <form:input id="passCode" path="passCode" minlength="4" maxlength="10" class="selecttag" onchange="selecttag('labelBusPassCode','passCode');" 
									         onfocus="showlabel('labelBusPassCode','labelBusPassCodeError')" size="10" value="${busPassCategory.passCode}" readonly="false" onclick="removeHasError('DivIDbusPassCode');removeMsg()" />
									     <label id="labelBusPassCode" class="valid">* Bus Pass Code</label>
									     <label id="labelBusPassCodeError" class="collapse"></label>
									     
									     <span></span> 
									   </div>
									</div>
					              
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDbusPassCategory" class="styled-input">
									         <form:input id="passCategory" path="passCategory"  maxlength="45" class="selecttag" onchange="selecttag('labelBusPassCategory','passCategory');" 
									         onfocus="showlabel('labelBusPassCategory','labelBusPassCategoryError')"  size="45" value="${busPassCategory.passCategory}" readonly="false"  onclick="removeHasError('DivIDbusPassCategory');removeMsg()" />
									     <label id="labelBusPassCategory" class="valid">* Pass Category Name</label>
									    <label id="labelBusPassCategoryError" class="collapse"></label>
									     <span></span> 
									   </div>
									</div>

									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									       <div id="DivIDbusPassDescription" class="styled-input">
									         <form:input id="passDescription" path="passDescription" maxlength="150" class="selecttag" onchange="selecttag('labelBusPassDescription','passDescription');" 
									         onfocus="removeHasError('DivIDbusPassDescription');showlabel('labelBusPassDescription','labelBusPassDescriptionError')"  size="255" value="${busPassCategory.passDescription}" readonly="false"   />
									     	<label id="labelBusPassDescription" class="valid">* Pass Description</label>
									    	<label id="labelBusPassDescriptionError" class="collapse"></label>
									     	<span></span> 
									   </div>
									</div>
														              
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
							       	<div id="DivIdBusPassPeriod" class="styled-input">					                
										<form:select id="passPeriod" path="passPeriod" title="Bus Pass Period" class="selecttag" onchange="selecttag('labelBusPassPeriod','passPeriod');" 
									         onfocus="removeHasError('DivIdBusPassPeriod');" onclick="this.setAttribute('value', this.value);" value="">
									          
											<c:if test="${!empty busPassCategory.passPeriod}"> 
											<form:option selected="${busPassCategoryList[busPassCategory.passPeriod]}"  value="${busPassCategory.passPeriod}">${busPassCategoryList[busPassCategory.passPeriod]}
											</form:option>
											</c:if>  
											<form:option value="" label=" " ></form:option>      		            
											<form:options items="${busPassPeriodList}"  />
										</form:select>
										<label id="labelBusPassPeriod" class="valid">Select Period</label>
										<label id="busPassPeriodError" class="collapse"></label>
										<span></span>
							      </div>
							     </div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
								    <div id="DivIdBusPassCost" class="styled-input">		
								         <form:input id="passCost" path="passCost" onkeypress="onlyNumric(event,'qwerty')" onchange="selecttag('labelBusPassCost','passCost');" 
								         onclick="removeHasError('DivIdBusPassCost');showlabel('labelBusPassCost','labelBusPassCostError')"  maxlength="10" size="15" value="${busPassCategory.passCost}" readonly="false"   />
								     	<label id="labelBusPassCost" class="valid">* Cost of Bus Pass </label>
								     	<label id="labelBusPassCostError" class="collapse"></label>
								     	<span></span> 
								   </div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
								    <div id="DivIdBusPassCardCost" class="styled-input">		
								         <form:input path="passCardCost" onkeypress="onlyNumric(event,'qwerty')"  onchange="selecttag('labelBusPassCardCost','passCardCost');" 
								         onfocus="removeHasError('DivIdBusPassCardCost');showlabel('labelBusPassCardCost','labelBusPassCardCostError')"  maxlength="10" size="15" value="${busPassCategory.passCardCost}" readonly="false"   />
								     	<label id="labelBusPassCardCost" class="valid">* Bus Pass Card Cost</label>
								     	<label id="labelBusPassCardCostError" class="collapse"></label>
								     	<span></span> 
								   </div>
								</div>	

								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
								    <div id="DivIdBusPassFormCost" class="styled-input">		
								         <form:input path="passFormCost" onkeypress="onlyNumric(event,'qwerty')"  onchange="selecttag('labelBusPassFormCost','passFormCost');" 
								         onfocus="removeHasError('DivIdBusPassFormCost');showlabel('labelBusPassFormCost','labelBusPassFormCostError')"  maxlength="10" size="15" value="${busPassCategory.passFormCost}" readonly="false"   />
								     	<label id="labelBusPassFormCost" class="valid">* Bus Pass Form Cost</label>
								     	<label id="labelBusPassFormCostError" class="collapse"></label>
								     	<span></span> 
								   </div>
								</div>
								
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
							       	<div id="DivIdBusPassRouteType" class="styled-input">					                
										<form:select id="routeType" path="routeType" title="Route Type" class="selecttag" onchange="selecttag('labelBusPassRouteType','routeType');" 
									         onfocus="removeHasError('DivIdBusPassRouteType');" onclick="this.setAttribute('value', this.value);" value="">
									          
											<c:if test="${!empty busPassCategory.routeType}"> 
											<form:option selected="${busPassRouteTypeList[busPassCategory.routeType]}"  value="${busPassCategory.routeType}">${busPassRouteTypeList[busPassCategory.routeType]}
											</form:option>
											</c:if>  
											<form:option value="" label=" " ></form:option>      		            
											<form:options items="${busPassRouteTypeList}"  />
										</form:select>
										<label id="labelBusPassRouteType" class="valid">Select Route Type</label>
										<label id="busPassRouteTypeError" class="collapse"></label>
										<span></span>
							      </div>
							     </div>
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
							       	<div id="DivIdBusRoutesAllowed" class="styled-input">					                
										<form:select id="routesAllowed" path="routesAllowed" title="Routes Allowed" class="selecttag" onchange="selecttag('labelBusRoutesAllowed','routesAllowed');" 
									         onfocus="removeHasError('DivIdBusRoutesAllowed');" onclick="this.setAttribute('value', this.value);" value="">
									          
											<c:if test="${!empty busPassCategory.routesAllowed}"> 
											<form:option selected="${busPassRouteTypeList[busPassCategory.routesAllowed]}"  value="${busPassCategory.routesAllowed}">${busPassRouteTypeList[busPassCategory.routesAllowed]}
											</form:option>
											</c:if>  
											<form:option value="" label=" " ></form:option>      		            
											<form:options items="${busRouteAllowedList}"  />
										</form:select>
										<label id="labelBusRouteAllowed" class="valid">Select Routes Allowed</label>
										<label id="labelBusRouteAllowedError" class="collapse"></label>
										<span></span>
							      </div>
							     </div>
 
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
							       	<div id="DivIdBusTypesAllowed" class="styled-input">					                
										<form:select id="busTypesAllowed" path="busTypesAllowed" title="Bus Types Allowed"  class="selecttag" onchange="selecttag('labelBusTypesAllowed','busTypesAllowed');" 
									         onfocus="removeHasError('DivIdBusTypesAllowed');" onclick="this.setAttribute('value', this.value);" multiple="multiple">
									          
											<c:if test="${!empty busPassCategory.busTypesAllowed}"> 
											<form:option selected="${busServiceTypeList[busPassCategory.busTypesAllowed]}"  value="${busPassCategory.busTypesAllowed}">${busServiceTypeList[busPassCategory.busTypesAllowed]}
											</form:option>
											</c:if>  
											<form:option value="" label=" " ></form:option>      		            
											<form:options items="${busServiceTypeList}"  />
										</form:select>
										<label id="labelBusTypesAllowed" class="valid">Select Bus Service Types</label>
										<label id="labelBusTypesAllowedError" class="collapse"></label>
										<span></span>
							      </div>
							     </div>	


								
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt mb">
									
									<div  class="styled-input">
									<form:checkbox  style="height:20px; " path="status"  name="status" id="status"/>
								 	 <label for="status">Active</label>
									<label class="valid">Pass Status</label>
									
								 	
									</div>
									
								</div>
							     							     						     																				              							      					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" onclick="return validateform(event);" class="btn btn-warning">Submit</button>
			                      </div>
			                      
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	       <!-- <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"> -->
	       </div>
	       
			                      		                      					              					              
					        	</form:form>
					        	
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
  
								
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>					        	
					        		 <c:if test="${!empty passCategories}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped">
														<thead>
															<tr>
															<!-- <th>Id</th> -->
															 <th>Pass Code</th>
															 <th>Pass Category</th>
															 <th>Pass Period</th>
															 <th>Pass Cost</th>
															 <th>Bus Route Type</th>
															 <th>Routes Allowed</th>
															 <th>Bus Service Type</th>	
															 <th>Status</th>															           
															 <th>Actions</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${passCategories}" var="busPassCategory">
																 <tr>
																  <td><c:out value="${busPassCategory.passCode}"/></td>
																  <td><c:out value="${busPassCategory.passCategory}"/></td>
																  <td><c:out value="${busPassCategory.passPeriod}"/></td>	
																  <td><c:out value="${busPassCategory.passCost}"/></td>
																  <td><c:out value="${busPassCategory.routeType}"/></td>
																  <td><c:out value="${busPassCategory.routesAllowed}"/></td>
																   <td><c:out value="${busPassCategory.busTypesAllowed}"/></td>
																   
																   
																   <c:if test="${busPassCategory.status==true}">
																   	<td><c:out value="Active"/></td>
																   	<td align="center"><a href="editBusPass?Id=${busPassCategory.id}">Deactivate</a> </td>	
																   </c:if>
																   <c:if test="${busPassCategory.status==false}">
																   	<td><c:out value="Deactive"/></td>	
																   	<td align="center"><a href="editBusPass?Id=${busPassCategory.id}">Activate</a> </td>	
																   </c:if>																    														   
																  
																 </tr>
															</c:forEach>												
														</tbody>
													  </table>												

												</div>
											</div>					        		 
										</div>
									
									</c:if>
					        </div>
				</section>
			</div>

	</div>

</body>
</html>