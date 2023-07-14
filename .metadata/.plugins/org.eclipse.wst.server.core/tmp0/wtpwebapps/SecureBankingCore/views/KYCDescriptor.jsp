<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/KYCDescriptor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<title>KYC Descriptor</title>


<script type="text/javascript">
$(document).ready(function() {
		  $('#table_id').DataTable({
				  "scrollY":"400px",
			        "scrollCollapse": true,
			        "paging":         true,
			        "pagingType": "simple_numbers"
	  }   );
	  
} );
</script>	

</head>
<body >
	<form:form id="kycDescriptorId" name="kycDescriptorForm" method="post" modelAttribute="kycDescriptorData" 
	action="${pageContext.request.contextPath}/AdminUI/kycController/setkycDescriptor">
		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_kycDescriptor"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>
							<c:if test="${errorMessage!=''}">
									<div id="errorMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${errorMessage}</p> 
									</div> 
							</c:if>	 
	                    </div>
	                     <div class="row">
	                    	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_kycName" class="styled-input">
											<form:input path="kycName" class="selecttag" onfocus="removeHasError('div_kycName');showlabel('label_kycName','lab_NameErrorId')"
												onchange="checkUniqueKycName();selecttag('label_kycName','kycName')" 
 												
												onclick="emptyerror(event,'lab_NameErrorId');emptyerror(event,'successMessageId');emptyerror(event,'errorMessageId');"/>
											<span></span>
										<label id="label_kycName" class="valid"><spring:message code="lab_Name" /></label>
										<label id=lab_NameErrorId class="collapse"></label>
										
								</div>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_kycDescription"  class="styled-input">
<!-- 					              onkeypress="onlyAlphabet(event,'lab_kycDescripionErrorId')" -->
										<form:input path="kycDescription"  class="selecttag"  
											onclick="emptyerror(event,'lab_kycDescripionErrorId');" onchange="selecttag('label_kycDescription','kycDescription')"
											onfocus="removeHasError('div_kycDescription');showlabel('label_kycDescription','lab_kycDescripionErrorId')"/>
											<span></span>
										<label id="label_kycDescription" class="valid"><spring:message code="lab_kycDescripion" /></label>
										<label id=lab_kycDescripionErrorId class="collapse"></label>
										
								</div>
	                      </div>
	                   
								 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_subscriberType" class="styled-input">
												<form:select id="subscriberType" name="subscriberType"  path="subscriberType" class="selecttag" onfocus="removeHasError('div_subscriberType');showlabel('label_subscriberType','lab_subscriberTypeErrorId')"
													onclick="emptyerror(event,'lab_subscriberTypeErrorId');this.setAttribute('value', this.value)" value="" 
													onchange="validateKycLevel();selecttag('label_subscriberType','subscriberType')">
													<form:option value="0" label=" "/>                                     
									                <form:option value="Agent" label="Agent" />
									                <form:option value="Customer" label="Customer" />
									                <form:option value="Merchant" label="Merchant" />
												</form:select>
											<span></span>
										<label id="label_subscriberType" class="valid"><spring:message code="lab_subs_type" /></label>
										<label id=lab_subscriberTypeErrorId class="collapse"></label>
										
								</div> 
	                      </div>
	                     <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_kycWeight" class="styled-input">
								<form:input path="kycWeight" id="kycWeight" class="selecttag" onfocus="removeHasError('div_kycWeight');showlabel('label_kycWeight','lab_kycWeightErrorId')"
													onclick="emptyerror(event,'lab_kycWeightErrorId');"
													onchange="selecttag('label_kycWeight','kycWeight')"/>
										
											<span></span>
										<label id="label_kycWeight"><spring:message code="kyc_weightage" /></label>
										<label id=lab_kycWeightErrorId class="collapse"></label>
										
								</div> 
	                      </div>
	                       --%>
	                      
	                      
	                      
	                      
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="div_kycWeight">
											<label id="label_kycWeight" class="valid"><spring:message code="kyc_weightage" /></label>
											<label id=lab_kycWeightErrorId class="collapse"></label>
										<form:select path="kycWeight" id="kycWeight"  name="kycWeight"
										onfocus="removeHasError('div_kycWeight');" onchange="checkUniqueWeightage();"
										onclick="removeStyleTag('label_IdProofWeight');refresh('msgId');refresh('ermsgId');emptyerror(event,'lab_kycWeightErrorId');">
	  				                 	<form:option value="" label=" " />
											<form:options items="${weight}" />
													  
										
	  				     </form:select>			
											</div>
									</div>
	               
	                      
	                      
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_dailyDebitLimit" class="styled-input">
												<form:input path="dailyDebitLimit"  id="dailyDebitLimit" autocomplete="off" onchange="selecttag('label_dailyDebitLimit','dailyDebitLimit')"
													class="selecttag" onfocus="removeHasError('div_dailyDebitLimit');showlabel('label_dailyDebitLimit','lab_dailyDebitLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_dailyDebitLimitErrorId','label_dailyDebitLimit','dailyDebitLimit')" onclick="emptyerror(event,'lab_dailyDebitLimitErrorId');"/>
											<span></span>
										<label id="label_dailyDebitLimit" class="valid"><spring:message code="lab_dailyDebitLimit" /></label>
										<label id=lab_dailyDebitLimitErrorId class="collapse"></label>
								</div>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_dailyCreditLimit" class="styled-input">
												<form:input path="dailyCreditLimit"  id="dailyCreditLimit" autocomplete="off" onchange="selecttag('label_dailyCreditLimit','dailyCreditLimit')"
													class="selecttag" onfocus="removeHasError('div_dailyCreditLimit');showlabel('label_dailyCreditLimit','lab_dailyCreditLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_dailyCreditLimitErrorId','label_dailyCreditLimit','dailyCreditLimit')" onclick="emptyerror(event,'lab_dailyCreditLimitErrorId');"/>
											<span></span>
										<label id="label_dailyCreditLimit" class="valid"><spring:message code="lab_dailyCreditLimit" /></label>
										<label id=lab_dailyCreditLimitErrorId class="collapse"></label>
								</div>
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_dailyTxnCount" class="styled-input">
												<form:input path="dailyTransactionCount"  id="dailyTransactionCount" autocomplete="off" class="selecttag" 
													onkeypress="onlyNumric(event,'lab_dailyTxnCountErrorId','label_dailyTxnCount','dailyTransactionCount')"
												 	onfocus="removeHasError('div_dailyTxnCount');showlabel('label_dailyTxnCount','lab_dailyTxnCountErrorId')"
												 	onclick="emptyerror(event,'lab_dailyTxnCountErrorId');" 
												 	onchange="selecttag('label_dailyTxnCount','dailyTransactionCount')"/>
											<span></span>
										<label id="label_dailyTxnCount" class="valid"><spring:message code="lab_dailyTransactionCount" /></label>
										<label id=lab_dailyTxnCountErrorId class="collapse"></label>
								</div>
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_monthlyDebitLimit" class="styled-input">
												<form:input path="monthlyDebitLimit" id="monthlyDebitLimit" autocomplete="off" onchange="selecttag('label_monthlyDebitLimit','monthlyDebitLimit')"
													class="selecttag" onfocus="removeHasError('div_monthlyDebitLimit');showlabel('label_monthlyDebitLimit','lab_monthlyDebitLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_monthlyDebitLimitErrorId','label_monthlyDebitLimit','monthlyDebitLimit')" onclick="emptyerror(event,'lab_monthlyDebitLimitErrorId');"/>
											<span></span>
										<label id="label_monthlyDebitLimit" class="valid"><spring:message code="lab_monthlyDebitLimit" /></label>
										<label id=lab_monthlyDebitLimitErrorId class="collapse"></label>
								</div>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_monthlyCreditLimit" class="styled-input">
												<form:input path="monthlyCreditLimit" id="monthlyCreditLimit" autocomplete="off" onchange="selecttag('label_monthlyCreditLimit','monthlyCreditLimit')"
													class="selecttag" onfocus="removeHasError('div_monthlyCreditLimit');showlabel('label_monthlyCreditLimit','lab_monthlyCreditLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_monthlyCreditLimitErrorId','label_monthlyCreditLimit','monthlyCreditLimit')" onclick="emptyerror(event,'lab_monthlyCreditLimitErrorId');"/>
											<span></span>
										<label id="label_monthlyCreditLimit" class="valid"><spring:message code="lab_monthlyCreditLimit" /></label>
										<label id=lab_monthlyCreditLimitErrorId class="collapse"></label>
								</div>
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_monthlyTxnCount" class="styled-input">
												<form:input path="monthlyTransactionCount" id="monthlyTransactionCount"  autocomplete="off" class="selecttag" 
													onkeypress="onlyNumric(event,'lab_monthlyTxnCountErrorId','label_monthlyTxnCount','monthlyTransactionCount')"
												 	onfocus="removeHasError('div_monthlyTxnCount');showlabel('label_monthlyTxnCount','lab_monthlyTxnCountErrorId')"
												 	onclick="emptyerror(event,'lab_monthlyTxnCountErrorId');" 
												 	onchange="selecttag('label_monthlyTxnCount','monthlyTransactionCount')"/>
											<span></span>
										<label id="label_monthlyTxnCount" class="valid"><spring:message code="lab_monthlyTransactionCount" /></label>
										<label id=lab_monthlyTxnCountErrorId class="collapse"></label>
								</div>
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_yearlyDebitLimit" class="styled-input">
												<form:input path="yearlyDebitLimit"  id="yearlyDebitLimit"  autocomplete="off" onchange="selecttag('label_yearlyDebitLimit','yearlyDebitLimit')"
													class="selecttag" onfocus="removeHasError('div_yearlyDebitLimit');showlabel('label_yearlyDebitLimit','lab_yearlyDebitLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_yearlyDebitLimitErrorId','label_yearlyDebitLimit','yearlyDebitLimit')" onclick="emptyerror(event,'lab_yearlyDebitLimitErrorId');"/>
											<span></span>
										<label id="label_yearlyDebitLimit" class="valid"><spring:message code="lab_yearlyDebitLimit" /></label>
										<label id="lab_yearlyDebitLimitErrorId" class="collapse"></label>
								</div>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_yearlyCreditLimit" class="styled-input">
												<form:input path="yearlyCreditLimit"  id="yearlyCreditLimit"  autocomplete="off" onchange="selecttag('label_yearlyCreditLimit','yearlyCreditLimit')"
													class="selecttag" onfocus="removeHasError('div_yearlyCreditLimit');showlabel('label_yearlyCreditLimit','lab_yearlyCreditLimitErrorId')"
													onkeypress="onlyNumric(event,'lab_yearlyCreditLimitErrorId','label_yearlyCreditLimit','yearlyCreditLimit')" onclick="emptyerror(event,'lab_yearlyCreditLimitErrorId');"/>
											<span></span>
										<label id="label_yearlyCreditLimit" class="valid" ><spring:message code="lab_yearlyCreditLimit" /></label>
										<label id=lab_yearlyCreditLimitErrorId class="collapse"></label>
								</div>
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_yearlyTxnCount" class="styled-input">
												<form:input path="yearlyTransactionCount" id="yearlyTransactionCount"  autocomplete="off" class="selecttag" 
													onkeypress="onlyNumric(event,'lab_yearlyTxnCountErrorId','label_yearlyTxnCount','yearlyTransactionCount')"
												 	onfocus="removeHasError('div_yearlyTxnCount');showlabel('label_yearlyTxnCount','lab_yearlyTxnCountErrorId')"
												 	onclick="emptyerror(event,'lab_yearlyTxnCountErrorId');" 
												 	onchange="selecttag('label_yearlyTxnCount','yearlyTransactionCount')"/>
											<span></span>
										<label id="label_yearlyTxnCount" class="valid"><spring:message code="lab_yearlyTransactionCount" /></label>
										<label id=lab_yearlyTxnCountErrorId class="collapse"></label>
								</div>
	                      </div>
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div id="div_status" class="styled-input">
											<label id="status"  class="valid">Status</label>
											<form:select  path="status" class="selecttag"						
												onfocus="removeHasError('div_status');emptySuccess(event,'msgId');" onclick="this.setAttribute('value', this.value);"
												>
												
												<form:option value="Active" label="Active" />
												<form:option value="InActive" label="InActive" />
								
											</form:select>
											</div>
											</div>
	                      <%--  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_perTxnLimit" class="styled-input">
												<form:input path="perTxnLimit" autocomplete="off" onkeypress="onlyNumric(event,'lab_perTxnLimitErrorId')" 
													class="selecttag" onfocus="removeHasError('div_perTxnLimit');showlabel('label_perTxnLimit','lab_perTxnLimitErrorId')"
													onclick="emptyerror(event,'lab_perTxnLimitErrorId');" onchange="selecttag('label_perTxnLimit','perTxnLimit')"/>
											<span></span>
										<label id="label_perTxnLimit"><spring:message code="lab_perTxnLimit" /></label>
										<label id=lab_perTxnLimitErrorId class="collapse"></label>
								</div>
	                      </div> --%>
	                     
	                      <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_monthlyTxnLimit" class="styled-input">
												<form:input path="monthlyTxnLimit" autocomplete="off" class="selecttag" 
													onfocus="removeHasError('div_monthlyTxnLimit');showlabel('label_monthlyTxnLimit','lab_monthlyTxnLimitErrorId')"  
													onchange="selecttag('label_monthlyTxnLimit','monthlyTxnLimit')"
													onkeypress="onlyNumric(event,'lab_monthlyTxnLimitErrorId')" 
													onclick="emptyerror(event,'lab_monthlyTxnLimitErrorId');"/>
											<span></span>
										<label id="label_monthlyTxnLimit"><spring:message code="lab_monthlyTxnLimit" /></label>
										<label id=lab_monthlyTxnLimitErrorId class="collapse"></label>
								</div>
	                      </div> --%>
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                       		<input type="submit" id="submitBtn" value="Submit" class="btn btn-warning" onclick="validateKycDescriptor(event);"/>
	                       </div>
	                       <div class="clearfix"></div>
                      			<hr></hr>
	                      <div class="col-xs-12">
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           			 <table class="table table-bordered table-striped" id="table_id">
	                           			 <thead>
	                           			 	<tr>
	                           			 		<th align="center"><spring:message code="lab_Name"/></th>
												<th align="center"><spring:message code="lab_kycDescriptor"/></th>
												<th align="center"><spring:message code="lab_subs_type"/></th>
												<th align="center"><spring:message code="kyc_weightage"/></th>
												<th align="center">Status</th>
												<th align="center"><spring:message code="lab_action"/></th>
	                           			 	</tr>
	                           			 	</thead>
	                           			 	<c:forEach  var="listVar" items="${kycDescriptorData.kycDescriptorDataList}" varStatus="counter"> 
												<tr>
													
													<td align="center">${listVar.kycName}</td>
													<td align="center">${listVar.kycDescription}</td>
													<td align="center">${listVar.subscriberType}</td>
													<td align="center">${listVar.weightage}</td>
													<td align="center">${listVar.status}</td>
													
													<td align="center"><img align="middle" style="cursor: hand" src="/securebanking/images/edit.gif" title="edit"  onclick="populateForEdit('${listVar.id}','${listVar.kycName}','${listVar.kycDescription}','${listVar.subscriberType}','${listVar.weightage}','${listVar.dailyCreditLimit}','${listVar.dailyDebitLimit}','${listVar.dailyTransactionCount}','${listVar.monthlyCreditLimit}','${listVar.monthlyDebitLimit}','${listVar.monthlyTransactionCount}','${listVar.yearlyCreditLimit}','${listVar.yearlyDebitLimit}','${listVar.yearlyTransactionCount}'); "></td>
												</tr>
											</c:forEach>
	                           			 </table>
	                           		</div>
	                           	</div>
	                        </div>
	                   </div>
				<input type="hidden" id="kycDescId" name="kycDescId" />
				
				 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>

</body>
</html>