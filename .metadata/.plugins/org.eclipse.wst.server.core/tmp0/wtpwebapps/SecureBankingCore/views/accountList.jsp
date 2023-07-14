<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/jquery.dataTables.min.js></script>
<script type="text/javascript"
	src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<script src=https://github.com/devbridge/jQuery-Autocomplete.git></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/AccountCreations.js"></script>
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>

<script>
		$(document).ready(function()
				
				{ removeValid('hostId1','hostId');
				removeValid('vendorId1','vendorId');
			
			});  
		
		</script>	
<title>Welcome to Secure Banking</title>
<style type="text/css">
li {
	color: black;
}
</style>
</head>
<body>

	<form:form id="accountListForm" modelAttribute="accountCreationData"
		method="post"
		action="${pageContext.request.contextPath}/AdminUI/account/accountList"
		enctype="multipart/form-data">

		<div class="heading-inner">
			<!-- ****************************************** Form Heading  ******************************* -->
			<h1 class="pull-left">
				<spring:message code="LABEL_ACCOUNT_LIST" />
			</h1>
			<div class="clearfix"></div>
			<hr>
			<div id="successMessageId"
				class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p>${MessageAfterBCRegistration}</p>
			</div>
		</div>
		<div class="row">

          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " id="hostRowId" >
          			<div class="styled-input" >
							<spring:message code="lab_selectRole" var="lab_selectRole"/>
							<form:select name="Select_type" id="Select_type" path="hostvendor" class="selecttag"  
								 onclick="disappearMsg();"
								onfocus="showlabel('Select_typeId','Select_typeErrorId')"
					                onChange="TESTFUNCTION(); selectType(event);selecttag('Select_typeId','Select_type');">
								<form:option value="0" label=" "/>
								<form:option value="HOST" label="HOST"/>
								<form:option value="VENDOR" label="VENDOR"/>
							</form:select>
							<label id="Select_typeId" class="valid">${lab_selectRole}</label>
							<label id="Select_typeErrorId" class="collapse"></label>
						</div></div>
						
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="host1" style="display:none">
						<div id="div_hostId" class="styled-input" >
							
							<form:select 						
									id="hostId" path="hostId" class="selecttag"
									onclick="this.setAttribute('value', this.value);selecttag1('hostId1');emptyerror(event,'msg1');emptyerror(event,'hostErrorId');" value=""
									onfocus="removeHasError('div_hostId');showlabel('hostId1','hostErrorId')"
					                onChange="selecttag('hostId1','hostId');emptyerror(event,'hostErrorCode');hideSearchBy();">
									<form:option value="" label=" "/>
									<form:options 
										items="${accountCreationData.platformChain.hostMap}" />
								</form:select>
								<label id="hostId1" class="valid"><spring:message code="LABEL_HOST"/></label>
								<label id="hostErrorId" class="collapse"></label>
								</div>
								</div>
								
								<div class="row .hidden" id="vendor">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="vendor1" style="display:none">
							<div id="div_vendorId" class="styled-input" >
							<form:select
									id="vendorId" path="vendorId" class="selecttag"
									onchange="selecttag('vendorId1','vendorId');emptyerror(event,'vendorErrorId');hideSearchBy();"
									onclick="this.setAttribute('value', this.value);selecttag1('vendorId1');emptyHostErrorId();" value=""
									onfocus="showlabel('vendorId1','vendorErrorId');removeHasError('div_vendorId')">
									<form:option value="" label=" " />
									<form:options
										items="${accountCreationData.platformChain.vendorMap}" />
								</form:select>
								<label id="vendorId1" class="valid"><spring:message code="LABEL_VENDOR"/></label>
							<label id="vendorErrorId" class="collapse"></label>
								</div></div></div>
 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="host2" style="display:none">
                        <button type="submit" onclick="return validateHost();" class="btn btn-warning">Submit</button>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="vendor2" style="display:none">
                        <button type="submit" onclick="return validatevendor();" class="btn btn-warning">Submit</button>
                      </div>
						


			<div id="successmsg1"
				class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  in text-center">
				<p><font color="green">${sucessmsg}</font></p>
			</div>
			<div id="errormsg1"
				class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p>${errormsg}</p>
			</div>


			<!-- int rowcount = (int) request.getAttribute("message");
         String val=(String)request.getParameter("Select_type");
          -->


			<hr>
			<div class="row">${msg}</div>
			<%-- TODISCUSS 
		
		<div class="row " id="SearchByTable" style="display:none">
		
                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb"> Search By </div>
                      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 " id="emailId">
                      	<div class="radio">
							<form:radiobutton id="email" name="radio" path="resetBy" value="email" onclick="radioSelect('email');" /><label for="email">E-Mail</label>
					 	</div>
					  </div>
					 <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 " id="mobileId">
					 	<div class="radio">
							<form:radiobutton id="mobile" name="radio" path="resetBy" value="mobile number" onclick="radioSelect('mobile');" /><label for="mobile">Mobile Number</label>
						</div>
					</div>
					 <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 " id="userNameId" >
					 <div class="radio">	
					 	<form:radiobutton id="userName" path="resetBy" name="radio" value="userName" onclick="radioSelect('username');" /><label for="userName">UserName</label>
					 	</div>
					 </div>
		</div> --%>
			<!-- onclick="emptyerror(event,'onbehalfErrorId','Name (Auto Search)');" onkeypress="nameSelect();"  onchange="getInfo();"-->
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mb"
				id="SearchByAutoSearch" style="display: none">
				<!-- <div class="styled-input">
		<input type="text" id="select_onbehalf" />
				<label id="onbehalfErrorId">Name (Auto Search)</label>
										<div id="suggestion-box"></div>
		</div> -->
			</div>
			<c:choose>
				<c:when test="${accountCreationData.accountList.size()>0}">
					<%-- <tr>
							<th><font color='red'>*&nbsp;</font><b>Search By:</b>
							<spring:message code="lab_Email/Mobile/UserName" /></th>
						</tr> --%>

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="table_id">
                           <thead class="default">
                               <tr>
							<!-- id="table_account" -->
								<th><spring:message code="LABEL_COMPANY_NAME" /></th>
								<th> <spring:message code="LABEL_ACCOUNT_TYPE" /></th>
								<th><spring:message code="LABEL_ADDRESS" /></th>
								<th id="LABEL_PHONE_No_id"><spring:message code="lab_Phone_no" /></th>
								<th id="LABEL_EMAIL_id"><spring:message code="lab_Email_Id" /></th>
								<th id="LABEL_HOST_id"><spring:message code="LABEL_HOST" /></th>
								<th id="LABEL_DIST_id"><spring:message code="LABEL_DIST" /></th>
								<th id="LABEL_SUB_DIST_id"><spring:message code="LABEL_SUB_DIST" /></th>
								<th id="LABEL_RETAILER_id"><spring:message code="LABEL_RETAILER" /></th>
								<th><spring:message code="LABEL_EDIT" /></th>
							   </tr>
							</thead>
							<%-- <tfoot>
								<tr>
									<th><spring:message code="LABEL_COMPANY_NAME" /></th>
									<th> <spring:message code="LABEL_ACCOUNT_TYPE" /></th>
									<th><spring:message code="LABEL_ADDRESS" /></th>
									<th id="LABEL_PHONE_No_id"><spring:message code="lab_Phone_no" /></th>
									<th id="LABEL_EMAIL_id"><spring:message code="lab_Email_Id" /></th>
									<th id="LABEL_HOST_id"><spring:message code="LABEL_HOST" /></th>
									<th id="LABEL_DIST_id"><spring:message code="LABEL_DIST" /></th>
									<th id="LABEL_SUB_DIST_id"><spring:message code="LABEL_SUB_DIST" /></th>
									<th id="LABEL_RETAILER_id"><spring:message code="LABEL_RETAILER" /></th>
									<th><spring:message code="LABEL_EDIT" /></th>
								</tr>		            				
					        </tfoot> --%>
					<c:forEach items="${accountCreationData.accountList}" var="acList">
						<!-- -->
						<tr>
							<td>${acList.companyName}</td>
							<td>${acList.accountType}</td>
							<td id=addressId ><textarea onkeyup="textAreaAdjust(this)" style="width:auto" readonly>${acList.address}</textarea></td>
							<td id="MobileNo_id">${acList.mobileNo}</td>
							<td id="Email_id">${acList.emailId}</td>
							<td id="Hostname_id">${acList.hostName}</td>
							<td id="distributer_name_id">${acList.distributorName}</td>
							<td id="sub_distributer_name_id">${acList.subDistributorName}</td>
							<td id="retailer_name_id">${acList.retailerName}</td>
							<td align="center"><a href="${pageContext.request.contextPath}/AdminUI/account/edit?id=${acList.id}">
												<img title="edit" src='${pageContext.request.contextPath}/images/edit.gif' style='cursor: hand' 
												></a></td>
						</tr>
					</c:forEach>

								</table>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<div></div>
			<div>
				<input type="hidden" id="contextPath" name="contextPath"
					value="${pageContext.request.contextPath}" />
			</div>
			<div>
				<input type="hidden" id="contextPath" name="contextPath"
					value="${pageContext.request.contextPath}" />
			</div>
		</div>
	</form:form>

	<input type="hidden" id="hiddenAccountId" value="${acList.id}" />
	<input type="hidden" id="hiddenLoginGroupCodeId"
		value="${accountCreationData.groupCode}" />



	<c:if test="${message ==12}">
		<script>
	
 	$("#SearchByTable").show();
	$("#SearchByAutoSearch").show(); 

	
	
	</script>
	</c:if>

	<c:if test="${message ==122}">
		<script>
	
 	$("#SearchByTable").hide();
	$("#SearchByAutoSearch").hide(); 

	
	
	</script>
	</c:if>

</body>
</html>