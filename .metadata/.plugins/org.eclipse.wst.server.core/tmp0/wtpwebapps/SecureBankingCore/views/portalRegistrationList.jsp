<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.PortalEditData" %>
		<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
			<%@ page import="com.ng.sb.common.util.SystemConstant" %>
			<%@ page import="java.util.UUID" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/PortalRegistration.js"></script>


<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>

<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
<title>commission Template Details Form</title>

<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
	
	
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":"500px",
		         
			  
		        "scrollCollapse": true,	
		        "paging":         true,
		        "pagingType": "simple_numbers"
			  
			  
		  });
	  }
} );

function clr(divId)
{
	$("#"+divId).html("");	
}
</script>

</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">
	<form:form method="post" modelAttribute="portalEditData"
			id="portalForm" action="${pageContext.request.contextPath}/AdminUI/portalCreation/portalCreationSubmit"
			enctype="multipart/form-data">
		 <div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_Portal_List_Title"/></h1>
	                      <div class="clearfix"></div>
						<hr>
						<c:if test="${successMessage!=''}">
					 	<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                             <p class="text-success">${successMessage}</p> 
						</div> 
						</c:if>
						<c:if test="${errorMessage!=''}">
					 	<div id="errorId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                             <p class="text-danger">${errorMessage}</p> 
						</div> 
						</c:if>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right" >
			<button type="button" class="btn btn-warning " onclick="toggleform('portalRegistrationFormId');">Portal Registration</button>

		</div>
			
				<div class="row collapse"  id="portalRegistrationFormId">
				
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					    <div class="styled-input" id="div_companyNameId">
						<spring:message code="lab_companyName" var="lab_companyName"/>
							<form:input id="companyNameId" path="companyName" name="companyName" type="text" class="selecttag"
							onkeypress="blockSpecialChar(event,'companyNameErrorId');"
							placeholder="" maxlength='100' onfocus="showlabel('companyNameId1','companyNameErrorId')"
					          onChange="selecttag('companyNameId1','companyNameId');checkDuplicateAccount(event)"
					          onclick="removeHasError('div_companyNameId');" />
							<label id="companyNameId1"class="valid">${lab_companyName}</label>
							<label id="companyNameErrorId" class="collapse"></label><span></span>
						</div>
					</div>
					
					<!--  new-->
					
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" id="div_personNameId" >
											<spring:message code="lab_PersonName" var="lab_PersonName" />
											<form:input id="houseNoId" path="personName" name="personName" type="text" placeholder=""
													onkeypress="blockSpecialChar(event,'hostIdErrorId');" class="selecttag"
													onfocus="showlabel('houseNoId1','hostIdErrorId') removeHasError('div_personNameId')"
					                     	onChange="selecttag('houseNoId1','houseNoId');" maxlength='30' 
					                     	onclick="removeHasError('div_personNameId');"/>
													 <label id="houseNoId1"class="valid">${lab_PersonName}</label>
													 <label id="hostIdErrorId" class="collapse"></label><span></span>
											</div>
									</div>
									
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="encryptionRowId">
					 <div class="styled-input" id="div_encryptionKeyId">
						 <spring:message code="LABEL_ENCRYPTION_KEY" var="LABEL_ENCRYPTION_KEY"/>
							  <form:input id="encryptionKeyId" path="encryptionKey" maxlength="48" type="text" 
									 class="selecttag"  readonly="true"/>
								<label id='encryptionKeyId1'class="valid">${LABEL_ENCRYPTION_KEY}</label>
								<label id="encryptionKeyErrorId" class="collapse"></label>								
					</div>
				</div>
				<!--------------------  Contact number 1 ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" id="phone1">
					     					<spring:message code="lab_ContactPersonNumber" var="lab_ContactPersonNumber"/>
											<form:input id="lab_contactOne" path="phoneNumberOne" name="Contact Number" type="text"
												onkeypress="onlyNumric(event,'phoneNumberOneErrorId1');" class="selecttag"
												onfocus="removeHasError('phone1');showlabel('lab_contactOneId','phoneNumberOneErrorId');"
					                     	onChange="selecttag('lab_contactOneId','lab_contactOne');" placeholder="" maxlength='12' 
					                     	onclick="removeHasError('phone1');"  	/>
											<label id='lab_contactOneId'class="valid">${lab_ContactPersonNumber}</label>
											<label id='phoneNumberOneErrorId' class='collapse'></label><span></span>
											</div>
										</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
					 <div class="styled-input" id="div_callBackUrl" >
					 <spring:message code="lab_callBackUrl" var="lab_callBackUrl"/>
					 <form:input id="callBackUrl" path="callBackUrl" placeholder=" " class="selecttag" type="text" 
					 	onclick="removeHasError('div_callBackUrl')emptyerror(event,'callBackUrlErrorId');" onchange="selecttag('callBackUrlId','callBackUrl');"
					 	onfocus="showlabel('callBackUrlId','callBackUrlErrorId');removeHasError('div_callBackUrl')"/>
					 	<label id="callBackUrlId"class="valid">${lab_callBackUrl}</label>
					 	<label id="callBackUrlErrorId" class="collapse"></label>
					 </div>
				</div>
					<div  id="uploadDiv" class="col-xs-12 col-sm-12 col-md-6 col-lg-6"   >
					
	                      <div class="styled-input"> 
			                      <label id="label_uploadFilePath" class="valid" style="margin: -9px 0px 0px;">Upload File</label>	
	                    
			            <form:input type="file" id="uploadFilePath" path="uploadFilePath" onfocus="removeHasError('divID_uploadFilePath')"  onclick="clr('uploadErrorId');"/>
	                     </div> 
	                      <label id="uploadErrorId" class="styled-input valid" ></label>
	                      </div>	
	                  	
									<!--------------------  E-Mail ---------------------------------------------------------->
									
									<div class="collapse" id="addMoreTableId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" >
					     						<spring:message	code="lab_Email" var="lab_Email" />
					     						<form:input id="emailIds" path="email" name="email" type="text" 
													onchange="selecttag('emailId1','emailIds');emailValidation(event,'emailIds','emailErrorId');"
													onclick="emptyerror(event,'emailErrorId');" class="selecttag"
													onfocus="showlabel('emailId1','emailErrorId')"
					                     			placeholder="" maxlength='30' />
													<label id="emailId1"class="valid">${lab_Email}</label>
													 <label id="emailErrorId" class="collapse"></label><span></span>
										</div>
									</div>
									

										<!--------------------  Contact number 2 ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     				<div class="styled-input" >
					     					<spring:message code="lab_ContactPersonNumberTwo" var="lab_ContactPersonNumberTwo" />
											<form:input id="lab_contactTwo" path="phoneNumberTwo" name="contactNumber"
													type="text" onkeypress="onlyNumric(event,'phoneNumberTwoErrorId1');" class="selecttag"
													onfocus="showlabel('lab_contactTwoId','phoneNumberTwoErrorId')"
					                     	onChange="selecttag('lab_contactTwoId','lab_contactTwo');" placeholder="" maxlength='12' />
											<label id="lab_contactTwoId"class="valid">${lab_ContactPersonNumberTwo}</label>
											<label id="phoneNumberTwoErrorId" class='collapse'></label>
										</div>
										</div>
											<!--------------------   Contact number 3 ---------------------------------------------------------->
											<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     						<div class="styled-input" >
					     							<spring:message code="lab_ContactPersonNumberThree" var="lab_ContactPersonNumberThree"/>
													<form:input id="lab_contactThree" path="phoneNumberThree" name="contactNumber"
													type="text" onkeypress="onlyNumric(event,'phoneNumberThreeErrorId1');"
													onfocus="showlabel('lab_contactThreeId','phoneNumberThreeErrorId')"
					                     	onChange="selecttag('lab_contactThreeId','lab_contactThree');" placeholder="" maxlength='12' class="selecttag" />
													<label id="lab_contactThreeId"class="valid">${lab_ContactPersonNumberThree}</label>
													<label id="phoneNumberThreeErrorId" class="collapse"></label><span></span>
												</div>
										   </div>

								
					
							<div  id='lab_Address'  >
							
							<div   class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				 <h1>&nbsp;&nbsp;<spring:message code="lab_Address" /></h1>

				 </div>
				 
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     			<div class="styled-input" >
					     					<spring:message code="lab_HouseNoStreet" var="lab_HouseNoStreet"/>
												<form:input id="houseNoId" path="houseNo" name="houseNo" type="text"
													onkeypress="blockSpecialChar(event,'houseNoStreetErrorId');" class="selecttag"
													onfocus="showlabel('houseNoId1','houseNoStreetErrorId');"
					                     	onChange="selecttag('houseNoId1','houseNoId');" placeholder="" maxlength='30' />
													<label id="houseNoId1"class="valid">${lab_HouseNoStreet}</label>
													<label id="houseNoStreetErrorId" class="collapse"></label><span></span>
										</div>
								</div>
											<!--------------------  City Name ---------------------------------------------------------->
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     			<div class="styled-input" >
					     				<spring:message code="lab_City" var="lab_City"/>
											<form:input id="cityId" path="city" name="city" type="text"  maxlength='30'  class="selecttag"
													onfocus="showlabel('cityId1','cityErrorId')"
					                     	onChange="selecttag('cityId1','cityId');" onkeypress="blockSpecialChar(event,'cityErrorId');" placeholder=""/>
											<label id="cityId1"class="valid">${lab_City}</label>
											<label id="cityErrorId" class="collapse"></label><span></span>
										</div>
									</div>
										<!--------------------  LandMark ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
					     						<spring:message code="lab_LandMark" var="lab_LandMark" />
													<form:input id="lab_LandMark" path="landMark" name="landMark" type="text"
													onkeypress="blockSpecialChar(event,'landMarkErrorId');" class="selecttag"
													 onfocus="showlabel('lab_LandMarkId','landMarkErrorId')"
					                     	onChange="selecttag('lab_LandMarkId','lab_LandMark');" placeholder="" maxlength='50' />
												<label id="lab_LandMarkId"class="valid">${lab_LandMark}</label>
											<label id='landMarkErrorId' class="collapse"></label><span></span>
											</div>
										</div>
										<!--------------------  Country ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
					     						<spring:message code="lab_Country" var="lab_Country"/>
													<form:input id="countryId" path="countryId" class="selecttag" onfocus="showlabel('countryId1','countryErrorId')"
					                     	onChange="selecttag('countryId1','countryId'); emptyerror(event,'countryErrorId');" />
												<label id="countryId1"class="valid">${lab_Country}</label>
												<label id="countryErrorId" class="collapse"></label><span></span>
											</div>
										</div>
											<!--------------------   State ---------------------------------------------------------->
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
										            
					     					<div class="styled-input" >
					     						<spring:message code="lab_State" var="lab_State" />
													<form:input id="stateId" path="stateId" class="selecttag" onfocus="showlabel('stateId1','stateErrorId')"
					                     	onChange="selecttag('stateId1','stateId');emptyerror(event,'stateErrorId');" />
												<label id="stateId1"class="valid">${lab_State}</label>
												<label id="stateErrorId" class="collapse"></label><span></span>
											</div>
										</div>
										<!--------------------   Pin ---------------------------------------------------------->
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					     					<div class="styled-input" >
												<spring:message code="lab_Pin" var="lab_Pin" />
													<form:input id="pinCodeId" path="pinCode" name="pinCode" class="selecttag" type="text" placeholder="" maxlength="6"
													onpaste="return validateNumeric(event,'pinCodeErrorId')" onkeypress="onlyNumric(event,'pinCodeErrorId1');" 
												onfocus="showlabel('pinCodeId1','pinCodeErrorId')" onChange="selecttag('pinCodeId1','pinCodeId');" 	/>
												<label id="pinCodeId1"class="valid">${lab_Pin}</label>
												<label id="pinCodeErrorId" class="collapse"></label>
											</div>
										</div>
										
									</div>
									</div>
										
					<!-- newww  -->
					
					
					
					
					
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div class="styled-input" id="div_companyNameId">
						<spring:message code="lab_companyURL" var="lab_companyURL"/>
					<form:input id="companyUrlId" path="portalurls" name="portalurl" type="text"
							placeholder="" maxlength='100' class="selecttag" onfocus="showlabel('companyUrlId1','companyUrlErrorId')"
					        onChange="selecttag('companyUrlId1','companyUrlId');checkDuplicateUrl(event);" />
						<label id="companyUrlId1"class="valid">${lab_companyURL}</label>
						<label id="companyUrlErrorId" class="collapse"></label><span></span>							
						</div>
						</div>
				
								
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="containersimg">
					     <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table"  id="portalUrlTable"  >
								<tr>
									<td colspan="2" align="center"><input type="button" value="Add more Url" onclick="addRows('portalUrlTable')" />
										<input type="button" value="Delete Url" onclick="deleteRow('portalUrlTable')" /><span
														id="errmsgportalUrlTableValue" style="color: red"></span></td>
											</tr>
										</table>
									</div>
								</div>
				</div>
			
				 
				 
				  
									
										
										
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
				<input  type="button" class="btn btn-warning" value="Add More Information"  
					onclick="showAddressTable(this);" />
			</div>
				<!------------------------ Account Type------------------ -->

				
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 mt text-center">
				<input type="submit" value="Submit" class="btn btn-warning" onclick=" return validatePortalRegistration('portalForm',event);" />
				<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}" />
				</div>
				<c:if test="${msg!=''}">
					 	<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
						<h3  style="color: green;">${msg}</h3>
				</div>
				</c:if>
				</div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="table_id">
                           <thead class="default">
	                                <tr class="mainTableHeader">
	                                	<th><spring:message code="lab_portalId"/></th>
										<th><spring:message code="lab_company_name" /></th>
										<th><spring:message code="lab_action_on_host" /></th>
									</tr>
									</thead>
				<c:forEach items="${portalEditData.portallist}" var="config">
					<tr>
						<td align="center">${config.id}</td>
						<td align="center">${config.companyName}</td>
						<%
												Integer id=	((PortalEditData)(pageContext.findAttribute("config"))).getId();
												String menuId=(String)request.getParameter("menuId");
												String submenuId=(String)request.getParameter("submenuId");
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "portalId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
						<td align="center"><a
							href="${pageContext.request.contextPath}/AdminUI/portalCreation/updatePortalEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
								title="edit"
								src='${pageContext.request.contextPath}/images/edit.gif'
								style='cursor: hand'/></a></td>
					</tr>
				</c:forEach>
			</table>
		</div></div>
		</div>
		
		 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>