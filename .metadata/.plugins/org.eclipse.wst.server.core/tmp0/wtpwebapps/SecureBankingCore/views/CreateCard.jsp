<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/createCard.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<title>Denomination Creation</title>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD',
			 minDate : 'now',
		
    });
});
</script>

<style type="text/css">
  li {
    color: black;
  }
</style>
<script>
$(document).ready(function(){
	
	 $('#cardName').val('');

	 $('#startDate').val('');
	 $('#endDate').val('');
	
	
	}); 
</script>
</head>
<body onload="myfunction()">
<div>
<form:form id="createCard" method="post"  modelAttribute="cardData" action="${pageContext.request.contextPath}/AdminUI/cardManagement/saveCreateCard" enctype="multipart/form-data">
	           <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_createCard"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
                </div>
	       <div class="row">
	      
	        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="cardNamestyled-input">
					
					<form:input type="text" class="selecttag" path="cardName" id="cardName"  placeholder="." autocomplete="off"
						onclick="selct('cardNameId');emptyerror(event,'cardNameErrorId');" onfocus="removeHasError('cardNamestyled-input');showlabel('cardNameId','cardNameErrorId');"
					  	onChange="selecttag('cardNameId','cardName');"/>
					<label id="cardNameId" ><spring:message code="lab_cardName" /></label>  
					<label id="cardNameErrorId" class="collapse"></label>
				</div>
			</div>
			 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="bankDiv">
			                          <form:select class="selecttag" path="bankId" 	id="bankId" onclick="selct('label_bankName');emptyerror(event,'bankNameError');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="selecttag('label_bankName','bankNameError')" onfocus="removeHasError('bankDiv');">
			                          <form:option value="" label=" " />
												<form:options items="${bankMap}" />
															</form:select>
			                           
			                           <label id="label_bankName"><spring:message code="label_bankName" /></label>
			                          <label id="bankNameError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                       
	                      <div  id="uploadDiv" class="col-xs-12 col-sm-12 col-md-6 col-lg-6"   >
	                      <div> <label id="label_uploadFilePath">Upload File</label></div>	
			                      <div id="divID_uploadFilePath" class="styled-input">
			                     
			                         <form:input type="file" id="uploadFilePath" path="uploadFilePath" onfocus="removeHasError('divID_uploadFilePath')"  onclick="refresherrorid(event,'uploadErrorId');"/>
									</div> 			
											 
			                         <!--  <label id="uploadFilePathError" class="collapse"></label>	 --> 
	                      
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                        
	                       <div> <label ></label></div> <div id="uploadErrorId" class="styled-input collapse"></div>
	                        </div>
	                    
	                      </div>
	                        
	                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                        <div id="radioValuetErrorId" class="styled-input collapse"></div></div>
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
	                        <div id="PartnerErrorId1" class="styled-input collapse"></div></div>
	                      <div id=div_1>
	                     <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1"><form:radiobutton path="radio" name="radio" id="radio1" value="1" onclick="refresherrorid(event,'radioValuetErrorId');checkApp('payCardApp1','radio1')"/></div>
	                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	                        <div class="styled-input" id="partner1">
			                     <form:select class="selecttag" path="payCardApp" 	id="payCardApp1" onclick="selct('label_payCardApp1');emptyerror(event,'payCardAppError1');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="getListOfPartners('payCardApp1','payCardPartner1');selectPartner('partnerlist1');selecttag('label_payCardApp1','payCardAppError1');selct('label_payCardPartner1');checkApp2('payCardApp1','radio1');" onfocus="removeHasError('partner1');">
			                          <form:option value="" label=" " />
												<form:options items="${appNameMap}" />
															</form:select>
			                           <label id="label_payCardApp1"><spring:message code="label_payCardApp" /></label>
			                          <label id="payCardAppError1" class="collapse"></label>
	                          </div>
	                      </div>   
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="partnerlist1">
			                          <form:select class="selecttag" path="payCardPartner1" id="payCardPartner1" multiple="true"	 onclick="emptyerror(event,'payCardPartnerError1');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="partnerSelection('payCardPartner1','PartnerErrorId1');selecttag('label_payCardPartner1','payCardPartnerError1');" onfocus="removeHasError('partnerlist1')">
			                          <form:option value="" label=" " />
												<form:options items="${payCardPartnerNameMap}" />
															</form:select>
			                           <label id="label_payCardPartner1"><spring:message code="label_payCardPartner" /></label>
			                          <label id="payCardPartnerError1" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
	                        <div id="PartnerErrorId2" class="styled-input collapse"></div></div>
	                        <div id=div_2>
	                     <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1"><form:radiobutton path="radio" name="radio" id="radio2" value="2" onclick="refresherrorid(event,'radioValuetErrorId');checkApp('payCardApp2','radio2')"/></div>
	                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	                  
	                        <div class="styled-input" id="partner2">
			                     <form:select class="selecttag" path="payCardApp"	id="payCardApp2" onclick="selct('label_payCardApp2');emptyerror(event,'payCardAppError2');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="selectPartner('partnerlist2');selecttag('label_payCardApp2','payCardAppError2');getListOfPartners('payCardApp2','payCardPartner2');selct('label_payCardPartner2');checkApp2('payCardApp2','radio2')" onfocus="removeHasError('partner2');">
			                          <form:option value="" label=" " />
												<form:options items="${appNameMap}" />
															</form:select>
			                           <label id="label_payCardApp2"><spring:message code="label_payCardApp" /></label>
			                          <label id="payCardAppError2" class="collapse"></label>
	                          </div>
	                      </div>   
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="partnerlist2">
			                          <form:select class="selecttag" path="payCardPartner2" id="payCardPartner2"  multiple="true" onclick="emptyerror(event,'payCardPartnerError2');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="partnerSelection('payCardPartner2','PartnerErrorId2');selecttag('label_payCardPartner2','payCardPartnerError2')" onfocus="removeHasError('partnerlist2');">
			                          <form:option value="" label=" " />
												<form:options items="${payCardPartnerNameMap}" />
															</form:select>
			                           <label id="label_payCardPartner2"><spring:message code="label_payCardPartner" /></label>
			                          <label id="payCardPartnerError2" class="collapse"></label>
	                          </div>
	                      </div>
	                        </div>
	                        
	                          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
	                        <div id="PartnerErrorId3" class="styled-input collapse"></div></div>
	                        <div id=div_3>
	                     <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1"><form:radiobutton path="radio" name="radio" id="radio3" value="3" onclick="refresherrorid(event,'radioValuetErrorId');checkApp('payCardApp3','radio3')"/></div>
	                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	                  
	                        <div class="styled-input" id="partner3">
			                     <form:select class="selecttag" path="payCardApp" 	id="payCardApp3" onclick="selct('label_payCardApp3');emptyerror(event,'payCardAppError3');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="selectPartner('partnerlist3');selecttag('label_payCardApp3','payCardAppError3');getListOfPartners('payCardApp3','payCardPartner3');selct('label_payCardPartner3');checkApp2('payCardApp3','radio3')" onfocus="removeHasError('partner3');">
			                          <form:option value="" label=" " />
												<form:options items="${appNameMap}" />
															</form:select>
			                           
			                           <label id="label_payCardApp3"><spring:message code="label_payCardApp" /></label>
			                          <label id="payCardAppError3" class="collapse"></label>
	                          </div>
	                      </div>   
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="partnerlist3">
			                          <form:select class="selecttag" path="payCardPartner3" id="payCardPartner3" multiple="true"	 onclick="emptyerror(event,'payCardPartnerError3');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="partnerSelection('payCardPartner3','PartnerErrorId3');selecttag('label_payCardPartner3','payCardPartnerError3')" onfocus="removeHasError('partnerlist3');">
			                          <form:option value="" label=" " />
												<form:options items="${payCardPartnerNameMap}" />
															</form:select>
			                           
			                           <label id="label_payCardPartner3"><spring:message code="label_payCardPartner" /></label>
			                          <label id="payCardPartnerError3" class="collapse"></label>
	                          </div>
	                      </div>
	                        </div>
	                        
	                        
	                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
	                        <div id="PartnerErrorId4" class="styled-input collapse"></div></div>
	                        <div id=div_4>
	                     <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1"><form:radiobutton path="radio" name="radio" id="radio4" value="4" onclick="refresherrorid(event,'radioValuetErrorId');checkApp('payCardApp4','radio4')"/></div>
	                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	                  
	                        <div class="styled-input" id="partner4">
			                     <form:select class="selecttag" path="payCardApp" 	id="payCardApp4" onclick="selct('label_payCardApp4');emptyerror(event,'payCardAppError4');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="selectPartner('partnerlist4');selecttag('label_payCardApp4','payCardAppError4');getListOfPartners('payCardApp4','payCardPartner4');selct('label_payCardPartner4');checkApp2('payCardApp4','radio4')" onfocus="removeHasError('partner4');">
			                          <form:option value="" label=" " />
												<form:options items="${appNameMap}" />
															</form:select>
			                           
			                           <label id="label_payCardApp4"><spring:message code="label_payCardApp" /></label>
			                          <label id="payCardAppError4" class="collapse"></label>
	                          </div>
	                      </div>   
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="partnerlist4">
			                          <form:select class="selecttag" path="payCardPartner4" id="payCardPartner4" multiple="true"	 onclick="selct('label_payCardPartner4');emptyerror(event,'payCardPartnerError4');this.setAttribute('value', this.value);" value="" placeholder="." 
			                          onchange="partnerSelection('payCardPartner4','PartnerErrorId4');selecttag('label_payCardPartner4','payCardPartnerError4')" onfocus="removeHasError('partnerlist4');">
			                          <form:option value="" label=" " />
												<form:options items="${payCardPartnerNameMap}" />
															</form:select>
			                           
			                           <label id="label_payCardPartner4"><spring:message code="label_payCardPartner" /></label>
			                          <label id="payCardPartnerError4" class="collapse"></label>
	                          </div>
	                      </div>
	                       
	                        </div>
	                         
	                        
	                        
	                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" id="startDate" path="startDate" onclick="selct('startDateId');selecttag('startDateId','startDate');emptyerror(event,'startDateErrorId');" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','startDate');" />
					<label id="startDateId" >${fromDate}</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="toDate" var="toDate"/>
					<form:input type="text" id="endDate" path="endDate" onclick="selct('endDateId');selecttag('endDateId','endDate');emptyerror(event,'startDateErrorId');" 
					class="selecttag" onfocus="showlabel('endDateId','endDateErrorId');selecttag('endDateId','endDate')"/>
					<label id="endDateId" >${toDate}</label>
					<label id="endDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('endDateId');clearmsg();"></i> </i>
				</div>
				</div>
			</div>  
	                        
	                      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 " >
	                        <div class="styled-input" id="walletDiv" >
			                          <form:select class="selecttag" path="walletType" 	id="walletType" onclick="selct('label_walletType');emptyerror(event,'walletTypeError');this.setAttribute('value', this.value);"  multiple="true" value="" placeholder="." 
			                          onchange="selecttag('label_walletType','walletTypeError')" onfocus="removeHasError('walletDiv');">
			                          <%-- <form:option value="" label=" " /> --%>
												<form:options items="${walletTypeMap}" />
															</form:select>
			                           
			                           <label id="label_walletType" class="valid"><spring:message code="lab_walletName" /></label>
			                          <label id="walletTypeError" class="collapse"></label>
	                          </div>
	                      </div> 
	                      
	                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 " >
	                        <div class="styled-input" id="cardTypeDiv" >
			                          <form:select class="selecttag" path="cardType" id="cardType" onclick="selct('label_cardType');emptyerror(event,'cardTypeError');this.setAttribute('value', this.value);"  value="" placeholder="." 
			                          onchange="selecttag('label_cardType','cardTypeError')" onfocus="removeHasError('cardTypeDiv');">
			                          <form:option value="" label=" " />
												<form:option value="01" label="Regular" />
												<form:option value="02" label="Student" />
												<form:option value="03" label="Senior Citizen" />
												<form:option value="04" label="Minor" />
															</form:select>
			                           
			                           <label id="label_cardType"><spring:message code="label_cardType" /></label>
			                          <label id="cardTypeError" class="collapse"></label>
	                          </div>
	                      </div> 
	                     
		
	  				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="submit"  value="Submit" onclick="return validateCreateCard(event);"/>
	  				</div>
	  	</div> 
	  	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</div>
</body>
</html>		
														 
	                      
	                      