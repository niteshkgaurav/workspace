<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>

<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/packingGroup.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<title>Denomination Creation</title>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>
<div>
<form:form id="packagingGroupCreation" method="post"  modelAttribute="packingGroupData" action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupEditSubmit">
	          <div class="row">
	          
	                    <%
Integer menuId=(Integer)request.getAttribute("menuId");
Integer submenuId=(Integer)request.getAttribute("submenuId");
String encryptId=KeyEncryptionUtils.encryptUsingKey(key,"menuId="+menuId+"&submenuId="+submenuId);
%>

			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px"> <a
						href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupCreation?enc=<%=encryptId%>"><spring:message
								code="lab_Group_version" /> </a></font>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
				<div class="styled-input">
					<font size="4px" color="white"> <a
						href="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/groupCreationList?enc=<%=encryptId%>"><spring:message
								code="label_group_list" /></a></font>
				</div>
			</div>
		</div>
	          
	          
	           <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_packingGroup"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     
	                     	<c:if test="${statusMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${statusMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				                                           <p class="text-danger">${errorMessage}</p> 
										</div>
								</c:if> 
                </div>
                <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          				<spring:message code="lab_productGroup" var="lab_productGroup"/>
	  					<form:select path="productType" class="selecttag" id="productType" 
	  					onclick="emptyerror(event,'lab_productErrorId');"
	  					onfocus="showlabel('productTypeId','lab_productErrorId');"
					    onChange="selecttag('productTypeId','productType');"> 
                            	<form:option value="0" label=" "/>
	  							<form:option value="overlay" label="OVERLAY"/>
	  							<form:option value="card" label="CARD"/>
	  					</form:select>
	                     <label id="productTypeId">${lab_productGroup}</label>
	                     <label id="lab_productErrorId" class="collapse"></label>
	                </div>
	             </div>
			        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="styled-input">
							<spring:message code="lab_GroupName"  var="lab_GroupName"/>
							<form:input id ="groupName" type="text" class="selecttag" path="groupName"  placeholder="." 
								onclick="emptyerror(event,'groupNameErrorId');" onfocus="showlabel('groupNameId','groupNameErrorId')"
							  	onChange="selecttag('groupNameId','groupName');checkName();"/>
							<label id="groupNameId" >${lab_GroupName}</label>  
							<label id="groupNameErrorId" class="collapse"></label>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          				<spring:message code="lab_parentGroup" var="lab_parentGroup"/>
	  					<form:select id ="parentId" path="parentType"  class="selecttag"  
	  					onclick="emptyerror(event,'lab_parentErrorId');"
	  					onfocus="showlabel('parentTypeId','lab_parentErrorId');"
					    onChange="selecttag('parentTypeId','parentId');removequantity();"> 
                            	<form:option value="0" label=" "/>
	  							<form:options items="${parentDataList}"/>
	  					</form:select>
	                     <label id="parentTypeId">${lab_parentGroup}</label>
	                     <label id="lab_parentErrorId" class="collapse"></label>
	                </div>
	             </div>
	             <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="styled-input">
							<spring:message code="lab_quantity"  var="lab_quantity"/>
							<form:input id="quantity" type="text" class="selecttag" path="quantity"  placeholder="." 
								onclick="emptyerror(event,'quantityErrorId');" onfocus="showlabel('quantityId','quantityErrorId')"
							  	onkeyup="makeBoxFromQuantity();" onChange="selecttag('quantityId','quantity');"/>
							  	
							<label id="quantityId" >${lab_quantity}</label>  
							<label id="quantityErrorId" class="collapse"></label>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="styled-input">
							<spring:message code="lab_noOfBoxes"  var="lab_noOfBoxes"/>
							<form:input id="noOfBox" type="text" class="selecttag" path="noOfBox" readonly="true" />
							<label id="quantityId" >${lab_noOfBoxes}</label>  
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input type="submit" class="btn btn-warning" value="Update" onclick="return validatePackingGroup();"/>
					</div>
				</div>
				<tr>
				<td><input type="hidden" id="contextPath" name="contextPath"
					value="${pageContext.request.contextPath}" /></td>
			</tr>
			<td>
				 <input type="hidden" id="groupId" name="groupId"
				value="${packingGroupData.id}" /></td>
				
				<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
                </form:form>