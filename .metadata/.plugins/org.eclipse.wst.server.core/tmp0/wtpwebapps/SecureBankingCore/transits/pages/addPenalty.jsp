<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %> --%>
<html>  
 <head>   
  <title>Penalty Management</title>  
  
	 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
		rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/css/style.css"
		rel="stylesheet"/>
	<link rel="stylesheet" type="text/css"
		href=${pageContext.request.contextPath}/css/datepicker.min.css />  
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>

 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addPenalty.js"></script>
 </head>
  <script>
$(function () {
	
	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 //maxDate : 'now',
            useCurrent: false,

      });
		
	});
</script>

<body>
  <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Penalty  </h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">
					        	<form:form method="POST" id="penaltyForm" name="penaltyForm" action="${pageContext.request.contextPath}/AdminUI/penalty/savePenalty" >
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
						                <div class="styled-input" id="div_penaltyCode" >
						                  <form:input path="penaltyCode"  size="15" onclick="removeHasError('div_penaltyCode');funv()"   value="${penalty.penaltyCode}"   readonly="false"   />
						                  <label id="lblpenaltyCode" class="valid">* Penalty Code</label>
						                  <form:errors path="penaltyCode" generated="true" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
						                <div class="styled-input" id="div_penaltyName">
						                  <form:input path="penaltyName"  size="100" onchange="validateAlphaNumeric(e,'penaltyNameErrorId');" value="${penalty.penaltyName}" readonly="false" multiline="true" 
						                  onclick="removeHasError('div_penaltyName')"   />
						                  <label id="lblpenaltyName" class="valid">* Penalty Name</label>
						                  <form:errors path="penaltyName" generated="true" class="collapse" cssClass="error"/>
						                  <label id="penaltyNameErrorId" class="collapse"></label>
						                  <span></span> 
						                </div>
					              </div>					              
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
										<div id="DivIdPenaltyTypeId" class="styled-input">					                
												<form:select id="penaltyType" path="penaltyType" title="Penalty Type" class="selecttag" onchange="selecttag('labelPenaltyTypeId','penaltyType');" 
												 onfocus="removeHasError('DivIdPenaltyTypeId');" onclick="this.setAttribute('value', this.value);" value="">
									
													<c:if test="${!empty penalty.penaltyType}"> 
													<form:option selected="${penalty.penaltyType}"  value="${penalty.penaltyType}">${penaltyTypeList[penalty.penaltyType]}<%-- ${penalty.penaltyTypeList[penalty.penaltyType]} --%>
													</form:option>
													</c:if>  
													<form:option value="" label=" " ></form:option>      		            
													<form:options items="${penaltyTypeList}"  />
												</form:select>
											<label id="labelPenaltyTypeId" class="valid">Penalty Type</label>
											<label id="penaltyTypeErrorId" class="collapse"></label>
											<span></span>
									      </div>
									</div>
							      							      
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
						                <div class="styled-input" id="div_penaltyAmountt">
						                  <form:input path="penaltyAmount"  maxlength="6" value="${penalty.penaltyAmount}" title="penalty Amount" onkeypress="onlyNumric(event,'qwerty')" readonly="false" onclick="removeHasError('div_penaltyAmountt')" />
						                  <label id="lblpenaltyAmount" class="valid">* Penalty Amount</label>
						                  <label id="lblpenaltyErrorId" class="collapse"></label>
						       <%--            <form:errors path="penaltyAmount" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					              </div>

						      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					                    <div id="DivStartDate" class="styled-input">
					                       <div class="input-group date datetimepicker1" >
					                         <form:input id="startDate" path="startDate"  
					                         type="text"  class="selecttag" value="${penalty.startDate}"
					             				 onfocus="removeHasError('DivStartDate');selecttag('labelStartDate','startDate')"
					             				onclick="emptyerror(event,'startDateError');showlabel('labelStartDate','startDateError');selecttag('labelStartDate','startDate')" />
					                        	<label id="labelStartDate" class="valid">Start Date:</label>
					                         	<label id="startDateError" class="collapse"></label>
					                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelStartDate');"></i> </i>
					                       </div>
					                     </div> 
					                     
					           </div>					              
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
								<div id="DivIdPenaltyStatusId" class="styled-input">					                
										<form:select id="penaltyStatus" path="penaltyStatus" title="Penalty Status" class="selecttag" onchange="selecttag('labelPenaltyStatusId','penaltyStatus');" 
										 onfocus="removeHasError('DivIdPenaltyStatusId');" onclick="this.setAttribute('value', this.value);" value="">
							
											<c:if test="${!empty penalty.penaltyStatus}"> 
											<form:option selected="${penalty.penaltyStatus}"  value="${penalty.penaltyStatus}">${penaltyStatusList[penalty.penaltyStatus]}
											</form:option>
											</c:if>  
											<form:option value="" label=" " ></form:option>      		            
											<form:options items="${penaltyStatusList}"  />
										</form:select>
									<label id="labelPenaltyStatusId" class="valid">Penalty Status</label>
									<label id="penaltyStatusErrorId" class="collapse"></label>
									<span></span>
							      </div>
							</div>					           					              								       
						          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="startDate">
						                <div class="styled-input">
						                  <form:hidden path="penaltyId"   value="${penalty.penaltyId}" readonly="false" />
						                  <span></span> 
						                </div>
					              </div>
					           
					              
					              							      					              					              							      					              
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning" onclick="validateForm(event);">Submit</button>
			                      </div>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
						        
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
<!-- 	       <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"> -->
	       </div>
						        			                      					              					              
					        	</form:form>
					        		 <c:if test="${!empty penalties}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped">
														<thead>
															<tr>
															<!-- <th>Id</th> -->
															<th>penalty Code</th>
															 <th>penalty Name</th>
															 <th>Penalty Type</th>
															 <th>Penalty Amount</th>
															  <th>Start Date</th>
															 <th>Status</th>          
															 <th>Action</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${penalties}" var="penalty">
															<c:if test="${ penalty.penaltyStatus>0}">
																 <tr>
																 <td><c:out value="${penalty.penaltyCode}"/></td>
																  <td><c:out value="${penalty.penaltyName}"/></td>

																 <%--  <td><c:out value="${penalty.penaltyType}"/></td>			 --%>													  
																   <td><c:out value="${penaltyTypeList[penalty.penaltyType]}"/></td>	


																   <td><c:out value="${penalty.penaltyAmount}"/></td>	

																<%--    <td><c:out value="${penalty.penaltyStatus}"/></td> --%>

																   <td><c:out value="${penalty.startDate}"/></td>																   															   
																   <td><c:out value="${ penaltyStatusList[penalty.penaltyStatus]}"/></td>

																  <td align="center"><a href="editPenalty?penaltyId=${penalty.penaltyId}">Edit</a> | <a href="deletePenalty?penaltyId=${penalty.penaltyId}">Delete</a></td>
																 </tr>
																 </c:if>
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