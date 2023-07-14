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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<title>Denomination Creation</title>
<script>
$(function () {
	$('.datetimepicker1').datetimepicker({
      
		format: 'YYYY-MM-DD'
    });
});
</script>

<style type="text/css">
input[type=file] {
  color: transparent;
}
  li {
    color: black;
  }
</style>
</head>
<body>
<div>
<form:form id="createCard" method="post"  modelAttribute="cardData" action="" enctype="multipart/form-data">
	          <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_viewCard"/></h1>
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
              
 
	       <div class="row">
	      
	        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="cardNamestyled-input">
					
					<form:input type="text" class="selecttag" path="cardName"  readonly="true"/>
					<label id="cardNameId" class="valid"><spring:message code="lab_cardName" /></label>  
					<label id="cardNameErrorId" class="collapse"></label>
				</div>
			</div>
			 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="bankDiv">
			                          <form:input type="text" class="selecttag" path="bankName"  readonly="true"/>
			                           <label id="label_bankName" class="valid"><spring:message code="label_bankName" /></label>
			                          <label id="bankNameError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                      
	                      <div  id="uploadDiv" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"   >
	                      <div> <label id="label_uploadFilePath">Upload File</label></div>	
			                      <div id="divID_uploadFilePath" class="styled-input">
			  <table>
			  <tr>
			  <td width="12%">
			                    <form:input type="file" id="uploadFilePath" path="fileName" title="${cardData.fileName}"  disabled="true"/>
			                    </td>
			                    <td style="padding-bottom:35px;">
			                    ${cardData.fileName}
			                    </td>
			                    </tr>
			                    </table>
									</div>				                      
	                      </div></div>
	                        
	                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                        <div id="radioValuetErrorId" class="styled-input collapse"></div></div>
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
	                        <div id="PartnerErrorId1" class="styled-input collapse"></div></div>
	                      <div id=div_1>
	                      	<c:forEach items="${cardData.appName}"	var="rangelist" varStatus="status">
	                     <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1"><form:radiobutton path="radio" id="radio" value="${cardData.radio}" /></div>
	                  <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	                        <div class="styled-input" id="partner1">
			                     <form:input type="text" class="selecttag" path="appName" id="appName"  value="${rangelist}" readonly="true"/>
			                           <label id="label_payCardApp1" class="valid"><spring:message code="label_payCardApp" /></label>
			                          <label id="payCardAppError1" class="collapse"></label>
	                          </div>
	                      </div> 
	                      
	                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="partnerlist1">
			                          <form:input type="text" class="selecttag" path="empty" id="payCardPartner1"  value="${cardData.partnerList[status.index ]}" readonly="true"/>
			                           <label id="label_payCardPartner1" class="valid"><spring:message code="label_payCardPartner" /></label>
			                          <label id="payCardPartnerError1" class="collapse"></label>
	                          </div>
	                      </div>
	                          </c:forEach>  
	                        
	                          
	                         
	                        
	                        
	             <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="fromDate" var="fromDate"/>
					<form:input type="text" id="startDate" path="startDate" onclick="selecttag('startDateId','startDate');emptyerror(event,'startDateErrorId');" class="selecttag"
					onfocus="showlabel('startDateId','startDateErrorId');selecttag('startDateId','startDate');" readonly="true" />
					<label id="startDateId"class="valid" >${fromDate}</label>
					<label id="startDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" onclick="selecttag1('startDateId');clearmsg();"></i> </i>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
				<div class="input-group date datetimepicker1">
					<spring:message code="toDate" var="toDate"/>
					<form:input type="text" id="endDate" path="endDate" onclick="selecttag('endDateId','endDate');emptyerror(event,'startDateErrorId');" 
					class="selecttag" onfocus="showlabel('endDateId','endDateErrorId');selecttag('endDateId','endDate')" readonly="true"/>
					<label id="endDateId"class="valid" >${toDate}</label>
					<label id="endDateErrorId" class="collapse"></label>
					<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('endDateId');clearmsg();"></i> </i>
				</div>
				</div>
			</div>	</div>
				</div>
		
	                        
	                      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 " >
	                        <div class="styled-input" id="walletDiv" >
			                          <form:input type="text" class="selecttag" path="walletName" 	id="walletType" readonly="true"/>			                           
			                           <label id="label_walletType" class="valid"><spring:message code="label_walletType" /></label>
			                          <label id="payCardPartnerError" class="collapse"></label>
	                          </div>
	                      </div> 
	                      </form:form>

		</div>
	
</body>
</html>		
														 
	                      
	                      