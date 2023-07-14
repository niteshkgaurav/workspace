
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addParking.js"></script>
</head>
<body>


<form:form   method="post" modelattribute="command"  action="${pageContext.request.contextPath}/AdminUI/parking/createParking"  > 
     <div class="heading-inner ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Create Parking</h1>
	                      <div class="clearfix"></div>
						
						
				  </div>
				<hr>  
				  <div align="center"> ${msg}
				  </div>  
  
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
   &nbsp;
   </div>

   
     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="parkingNameDiv_Id" class="styled-input">
						<form:input id="parkingName" path="parkingName"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" onchange="selecttag('parkingLblName','parkingName');" 
						 	onfocus="removeHasError('parkingNameDiv_Id');showlabel('parkingName','parkingLblErrorId')"  readonly="false"   />
						 <label id="parkingLblName" class="valid">*Parking Name</label>
						 <label id="parkingLblErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="parkingLocationDiv_Id" class="styled-input">
						<form:input id="parkingLocation" path="parkingLocation"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('parkingLocationId','parkingLocation');" 
						 	onfocus="removeHasError('parkingLocationDiv_Id');showlabel('parkingLocation','parkingLocationErrorId')"  readonly="false"   />
						 <label id="parkingLocationId" class="valid">*Parking Location</label>
						 <label id="parkingLocationErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			      
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
				       	<div id="parkingTypeDiv_Id" class="styled-input">					                
							<form:select id="parkingType" path="parkingType" title="parkingType" class="selecttag" onchange="selecttag('labelparkingTypeId','parkingType');" 
						         onfocus="removeHasError('parkingTypeDiv_Id');" onclick="this.setAttribute('value', this.value);" value="">
						          
								<c:if test="${!empty command.parkingType}"> 
								<form:option selected="${command.parkingType}"  value="${command.parkingType}">${parkingTypeList[command.parkingType}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${parkingTypeList}"  />
							</form:select>
						<label id="labelparkingTypeId" class="valid">Select Parking Type</label>
						<label id="parkingTypeErrorId" class="collapse"></label>
						<span></span>
				      </div>
			      </div>
			      
			     
			      
			      
			        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="twoWheelerDiv_Id" class="styled-input">
						<form:input id="twoWheelerCapacity" path="twoWheelerCapacity"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('twoWheelerLabelId','twoWheelerCapacity');" 
						 	onfocus="removeHasError('twoWheelerDiv_Id');showlabel('twoWheelerCapacity','twoWheelerLabelErrorId')"  readonly="false"   />
						 <label id="twoWheelerLabelId" class="valid">*Two Wheeler Capacity</label>
						 <label id="twoWheelerLabelErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			      
			        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="fourWheelerDiv_Id" class="styled-input">
						<form:input id="fourWheelerCapacity" path="fourWheelerCapacity"  maxlength="20" class="selecttag" onclick="removeAlertMsg();" ononchange="selecttag('fourWheelerLabelId','fourWheelerCapacity');" 
						 	onfocus="removeHasError('fourWheelerDiv_Id');showlabel('fourWheelerCapacity','fourWheelerLabelErrorId')" readonly="false"   />
						 <label id="fourWheelerLabelId" class="valid">*Four Wheeler Capacity</label>
						 <label id="fourWheelerLabelErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div> 
			      
			      
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="submit"  onclick="validate(event)" class="btn btn-warning" value="Submit" />
	  				</div>
   					
								        		 
			
      
   
							
</form:form> 
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  				<hr>	
	  				</div>
  <hr>
  
   <c:if test="${!empty parkings}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped" id="table_id">
														<thead>
															<tr>
															
															 <th>Parking Name</th>
															 <th>Parking Location</th>
															 <th>Parking Type</th>														           
															 <th>Two Wheeler Capacity</th>
															 <th>Four Wheeler Capacity</th>
															</tr>
															
														</thead>
														<tbody>
															<c:forEach items="${parkings}" var="park">
																 <tr>
																  <td><c:out value="${park.parkingName}"/></td>
																  <td><c:out value="${park.parkingLocation}"/></td>
																   <td><c:out value="${park.parkingType}"/></td>
																   <td><c:out value="${park.twoWheelerCapacity}"/></td>
																   <td><c:out value="${park.fourWheelerCapacity}"/></td>
																   															   
																
																 </tr>
															</c:forEach>												
														</tbody>
													</table>												

												</div>
											</div>					        		 
										</div>
									
									</c:if>

</body>
</html>