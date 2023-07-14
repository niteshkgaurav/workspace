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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.min.css"  />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fileinput.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/KYCUpgrade.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
<script>
$(function () {
    $('input[type="file"]').change(function () {
         if ($(this).val() != "") {
                $(this).css('color', '#333');
         }else{
                $(this).css('color', 'transparent');
         }
    });
})
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD',
		    maxDate : 'now',
             useCurrent: false, 
    });
});
$(document).ready(function() {
	$('#submittedKycTableDiv').hide();
});



</script>
<title>KYC Upgrade</title>
</head>
<body onload="clearFields();">
	
		
			<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message	code="Kyc_Upgrade" /></h1>
		                      <div class="clearfix"></div>
		                      <hr></hr>
		                      <c:if test="${successMessage!=''}">
									<div id="manadatory_message"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p><font color="green">${successMessage}</font></p> 
									</div> 
							</c:if>
	     		 </div>
	     		 
	     				<div class="row">
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_phoneNo" class="styled-input">
									
									<input type='text'  class="selecttag"  autocomplete="off" name='phoneNo' 
											id="lab_Phone_no" name="phoneNum" size='20' maxlength='12' 
											onkeypress="onlyNumricNoEnter(event,'phErrorId','lab_Phone_no', 'label_phoneNo')"
											onchange="selecttag('label_viewfor','viewfor');" 
											onfocus="removeErrorMsg();"
											onclick="emptyerror(event,'phErrorId');removeErrorMsg();">
											<label id="label_phoneNo" class="valid"><spring:message code="lab_Phone_no_Cust_Id" /></label>
											<label id="phErrorId" class="collapse"></label>
					    		</div>
					    	</div>
					    </div>
					    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			    			<input type="button" class="btn btn-warning"
									name="getdetails" value="Get Detail"
									onclick="getKycUpgrade(event,'phErrorId', 'label_phoneNo');" />
			    		</div>
					    		
			    <div class="row" id="tableDataId">
			    	
	    		<div class="heading-inner">
                     <h1 class="pull-left"><spring:message code="  User Details" /></h1>
                      <div class="clearfix"></div>
                      <hr></hr>
   		 			 </div> 
		    		<form:form id="kycUpgradeForm" name="kycUpgradeForm" method="post" onsubmit="return completeCheck();"
						modelAttribute="kycUpgradedata" action="${pageContext.request.contextPath}/AdminUI/kycController/kycUpgradeSubmit"
						enctype="multipart/form-data">
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="productNameid" class="styled-input">
									
									<form:input type='text'  class="selecttag"  autocomplete="off" name='productName' 
											id="lab_Product_Name" path="productName" size='20' maxlength='10' 
											onchange="selecttag('label_productName','lab_Product_Name');" 
											onfocus="removeHasError('productNameid')" disabled="true"
											></form:input>
												
											<label id="label_productName"  class="valid" ><spring:message code="lab_Product_Name" /></label>
											<label id="" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="masterVersionId" class="styled-input">
									
									<form:input type='text'  class="selecttag"  autocomplete="off" name='masterVersion' 
											id="lab_Master_Version" path="masterVersion" size='20' maxlength='40' 
											onchange="selecttag('label_masterVersion','lab_Master_Version');" 
											onfocus="removeHasError('masterVersionId')" disabled="true"
											></form:input>
																		
											<label id="label_masterVersion" class="valid"><spring:message code="lab_Master_Version" /></label>
											<label id="" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="hostSubVersion" class="styled-input">
									<form:input type='text' class="selecttag" onfocus="removeHasError('hostSubVersion')"
												id="lab_Host_Sub_Version" path="hostSubVersion"
												onchange="selecttag('label_hostSubVersion','lab_Host_Sub_Version');"
												name='hostSubVersion' size='20' maxlength='40'   disabled="true"
												value=""  ></form:input>
																								
											<label id="label_hostSubVersion" class="valid"><spring:message code="lab_Host_Sub_Version" /></label>
											<label id="" class="collapse"></label>
					    			</div>
					    		</div>

								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
									<div   id="custDivId"  class="styled-input">
										<form:input type='text'  path="custId" name="custId" class="selecttag" id="custId" disabled="true"/>
										<label id="label_custId" class="valid"><spring:message
												code="label_custId" /></label> <label id="label_custIdErrorId"
											class="collapse"></label>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
									<div id="divID_externalNo" class="styled-input">
										<form:input type='text'  path="externalNo" name="externalNo" id="externalNo" class="selecttag" disabled="true"/>
										<label id="label_externalNo" class="valid"><spring:message
												code="label_externalNo" /></label> <label
											id="label_externalNoErrorId" class=""></label>
									</div>
								</div>
					    	<div id="kycupgradeId">
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_KYC_Upgrade_Name" class="styled-input">
									
									<form:input type='text'  class="selecttag"  autocomplete="off" name='kycUpgradeName' 
											id="lab_KYC_Upgrade_Name" path="name" size='20' maxlength='40' 
											onkeypress="onlyAlphabets(event, 'label_KYC_ErrorId','label_KYC_Upgrade_Name', 'lab_KYC_Upgrade_Name');"
											onchange="selecttag('label_KYC_Upgrade_Name','lab_KYC_Upgrade_Name');" 
											onfocus="removeHasError('div_KYC_Upgrade_Name')"   disabled="true"></form:input>
										
																			
											<label id="label_KYC_Upgrade_Name" class="valid"><spring:message code="lab_KYC_Upgrade_Name" /></label>
											<label id="label_KYC_ErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_KYC_Upgrade_LastName" class="styled-input">
											
										<form:input type='text'  class="selecttag"  autocomplete="off" name='kycUpgradeLastName' 
											id="lab_KYC_Upgrade_LastName" path="lastName" size='20' maxlength='40' 
											onkeypress="onlyAlphabets(event, 'label_Kyc_Lastname_Error','labelKYC_Upgrade_LastName', 'lab_KYC_Upgrade_LastName');"
											onchange="selecttag('labelKYC_Upgrade_LastName','lab_KYC_Upgrade_LastName');" 
											onfocus="removeHasError('div_KYC_Upgrade_LastName')"  disabled="true"></form:input>												
											<label id="labelKYC_Upgrade_LastName" class="valid"><spring:message code="lab_KYC_Upgrade_LastName" /></label>
											<label id="label_Kyc_Lastname_Error" class="collapse"></label>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
								<div id="divID_datepicker" class="styled-input">
									<div class="input-group date datetimepicker1">
										<form:input type='text'  path="dateOfBirth" name="dateOfBirth" id="dateOfBirth" class="selecttag" disabled="true"/>
										<%-- <form:input id="dateOfBirth" type="text" class="selecttag"
											path="dateOfBirth" onfocus="removeHasError('divID_datepicker')"
											onclick="emptyerror(event,'lab_dateOfBirthErrorId');selecttag1('label_dob')" /> --%>
										<label id="label_dateOfBirth" class="valid"><spring:message code="lab_dob" /></label>
										<label id="lab_dateOfBirthErrorId" class="collapse"></label> 
										<!-- <i
											class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"
											onclick="selecttag1('label_dob')"></i>
										</i> -->
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
									<div class="row">
										<div class="col-md-4 col-lg-4 pr0">
											<div id="div_pinCode" class="styled-input">
											<form:input type='text'  path="pinCode" name="dateOfBirth" id="pinCode" class="selecttag" disabled="true"/>
												<%-- <form:input type="text" path="pinCode" class="selecttag" id="pinCode"
													onchange="selecttag('label_pinCode','pinCode'); changePincode('pinCode');"
													onfocus="removeHasError('div_pinCode')" onkeypress="changeValues()" readonly="readonly"/> --%>
												<label id="label_pinCode" class="valid" >* Pin Code</label> <label id="lab_pinCodeErrorId"
													class="collapse"></label>
											</div>
										</div>
										<!-- <div class="col-md-8 col-lg-8 pl0">
											<input type="button" id="addressFetchId" class="btn btn-warrning"
												value="Fetch Address" onclick="fetchAddress();" />
										</div> -->
									</div>
					
								</div>
					    	<div class="col-xs-12" id="addressSelectDivId">
					    		<table border="1" cellpadding='0' width='100%' id='addressSelectTableId'>
	  									</table>
					    		</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_address" class="styled-input">
									<form:input type="text" id="address" path="address"  onfocus="removeHasError('div_address')"
											class="selecttag" onchange="selecttag('label_address','address');" disabled="true" />
											
																		
											<label id="label_address" class="valid"><spring:message code="lab_address"/></label>
											<label id="lab_addressErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_locality" class="styled-input">
									<form:input type="text" path="locality"  onfocus="removeHasError('div_locality')"
											class="selecttag" onchange="selecttag('label_locality','locality');" disabled="true"/>
																		
											<label id="label_locality" class="valid"><spring:message code="lab_locality"/></label>
											<label id="lab_localityErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_region" class="styled-input">
									<form:input type="text" path="region"  onfocus="removeHasError('div_region')" 
											class="selecttag" onchange="selecttag('label_region','region');" disabled="true"/>
											<label id="label_region" class="valid"><spring:message code="lab_Region"/></label>
											<label id="lab_regionErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_district" class="styled-input">
									<form:input type="text" path="district" onfocus="removeHasError('div_district')" 
											class="selecttag" onchange="selecttag('label_district','district');" disabled="true"/>
											<label id="label_district" class="valid"><spring:message code="lab_district"/></label>
											<label id="lab_districtErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_state" class="styled-input">
									<form:input type="text" path="state"  onfocus="removeHasError('div_state')"
											class="selecttag" onchange="selecttag('label_state','state');" disabled="true"/>
											<label id="label_state" class="valid"><spring:message code="lab_State"/></label>
											<label id="lab_StateErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_country" class="styled-input">
									<form:input type="text" path="country"  onfocus="removeHasError('div_country')" 
									 		class="selecttag" onchange="selecttag('label_country','country');" disabled="true" />
											<label id="label_country" class="valid"><spring:message code="lab_Country"/></label>
											<label id="lab_CountryErrorId" class="collapse"></label>
					    			</div>
					    		</div>
					    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        	<div id="div_email" class="styled-input">
									<form:input type="text" path="email" id="email" onfocus="removeEmailError('lab_Email_IdErrorId','label_email')"
											class="selecttag" onchange="selecttag('label_email','email');"  disabled="true"/>
											<label id="label_email" class="valid"><spring:message code="lab_Email_Id"/></label>
											<label id="lab_Email_IdErrorId" class=""></label>
					    			</div>
					    		</div>
					    		<div align="center"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " id="kyctableerrorId">
					    		
					    		 
					    		
					    		</div>
					    		<div class="col-xs-12" id='kycTableId'>
	                       		 	<div class="transaction-table">
	                         			<div class="table-responsive">
			                           		 <table id="innerKycTableId" class="table table-bordered table-striped" border="2">
			                           			<tr>
			                           				<th><spring:message code="lab_DocumentKyc" /></th>
													<th width="300px;"><spring:message code="lab_idNo"/></th>
		<%-- 											<th><spring:message code="lab_Status" /></th> --%>
													<th><spring:message code="lab_uploadDocument"/></th>
			                           			</tr>
			                           			<c:forEach items="${kycUpgradedata.idproofs}" var="idProofData" varStatus="status">
			                           					<c:set var="idproofsId" value="${idProofData.key}"></c:set>
			  											<tr id="kycRow${idproofsId}">
			  											
			  												<td align="left"><form:checkbox id="valueCheck${idproofsId}" path="valueCheck" value="${idProofData.key}" onclick="fetchKycDescData('${idProofData.key}')"/>&nbsp;${idProofData.value}</td>
			  												<td align="center"><input id="idNo${idproofsId}" type="text" name="idNo"  placeholder="ID Number" style="width:96%" onchange="countId(this, 'idNoErrorId${idproofsId}');"  disabled="disabled"/></td>
		<%-- 	  												<td align="center" id="status${idproofsId}">${kycUpgradedata.kycData[status.index].status}</td> --%>
			  												<td align="center">
			  													<div align="center" style="width:'10%'" id="fileNameId${idproofsId}"></div>
			  													<form:input class="myfileclass" path="file" type="file" name="uploadButton${idproofsId}" id="uploadButton${idproofsId}" value="Upload" onchange="return checkMultipleImageSizeAndExtension(this, 'uploadButton${idproofsId}','fileNameId${idproofsId}');"  disabled="disabled"/>
		  														<input align="left" style="width:'40%'" id="removeButton${idproofsId}" type="button"  value="Remove" onclick="removeFunction(${idproofsId});" disabled="disabled"/>
			  												</td>
			  											</tr>
			  											<tr id="kycRowError${idproofsId}">
															<td><div id="idProofCheckErrorId${idproofsId}"></div></td>
															<td><div id="idNoErrorId${idproofsId}"></div></td>
															<td><div id="uploadButtonErrorId${idproofsId}"></div></td>
														</tr>
			  											
			  											<script language="JavaScript" type="text/JavaScript">
			  										     	$('input[type="file"]').prop('disabled', true);
		  										     	</script>
			  									</c:forEach>
			                            	</table>
<!-- 	                            		<input type="hidden" value=""/> -->
	                          	 	</div>
	                         	</div>
	                         	<div id="submitButton" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		                        	<input id="submitButtonId" type="submit" value="Submit" class="btn btn-warning" 
		                        	onclick="return validateForm(event);" disabled="disabled"/>
	                        	</div>
	                        </div>
		                        
	                       	<br></br>
	                        <div class="col-xs-12"  id='submittedKycTableDiv'>
	                        	<h4 style="color:#ecbf67" align="center">   Submitted Document List</h4>
                       		 	<div class="transaction-table">
                         			<div class="table-responsive">
		                           		 <table  id='submittedKycTable' class="table table-bordered table-striped" border="2">
		                           		 	<thead>
		                           		 		<tr>
		                           		 			<th align="center">Document Type</th>
													<th align="center">Id Number</th>
													<th align="center">Status</th>
													<th align="center">Added On</th>
													<th align="center">Added By</th>
													<th align="center">Verified On</th>
													<th align="center">Verified By</th>
													<th align="center">Comment</th>
		                           		 			<%-- <th><spring:message code="lab_DocumentKycType" /></th>
			                           				<th><spring:message code="lab_DocumentKyc" /></th>
													<th width="300px;"><spring:message code="lab_idNo"/></th>
													<th><spring:message code="lab_Status" /></th>
													<th><spring:message code="lab_uploadDocument"/></th> --%>
		                           				</tr>
		                           		 	</thead>
		                            	</table>
	                          	 	</div>
	                         	</div>
	                        </div>
                        
                    	<form:hidden path="phoneNo" id="phoneNo" />
                      	 <input type="hidden" id="pinaddressId" name="pinaddressId" value=""/>
	 					 <input type="hidden" id="mgmtId" name="mgmtId" value=""/> 
                     
	  
	  			<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	  
			</form:form>
	 </div>
</body>
</html>