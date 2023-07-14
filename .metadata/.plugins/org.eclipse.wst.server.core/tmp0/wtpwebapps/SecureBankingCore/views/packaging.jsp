<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css  rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
 <script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
 <script type="text/javascript" src=//code.jquery.com/jquery-1.12.4.js></script>
 
 
<!-- <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/packaging.js"></script>
<title>Insert title here</title>
</head>
<body>
<form:form id="packagingForm" name ="packagingForm" method="post" modelAttribute="packagingData" action="${pageContext.request.contextPath}/AdminUI/packaging/packagingsubmission">
	<div class="heading-inner  ">
	    <!-- ****************************************** Form Heading  ******************************* -->
	           
					<c:if test="${message!=''}">
					<div id="messagesIds"  class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                      <p>${message}</p> 
					</div>
					</c:if> 
	 </div>
			
		<div class="row">
	 			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center ">
          			<div class="styled-input packagingNameDivError">
          			<form:input path="packagingName" type="text" class="selecttag"
          			onchange="selecttag('packagingNameId','packagingName');"
          			onfocus="showlabel('packagingNameId','packagingNameErrorId');"/>
    				<label id="packagingNameId"class="valid"><spring:message code="lab_packagingName"/></label>
    				<label id="packagingNameErrorId" class="collapse"></label>
    				</div>
    			</div>
    			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input productTypeDivError">
          			<form:select path="productType" class="selecttag" onchange="getProductss();selecttag('productTypeId','productType');" 
          			onfocus="showlabel('productTypeId','productTypeErrorId');"
          			onclick="">
          			<form:option value="" label=""/>
          				<%-- <form:option value="READER" label="READER"/>
          				<form:option value="OVERLAY" label="OVERLAY"/>
          				<form:option value="MIFARE_CARD" label="MIFARE_CARD"/>  --%>
          					<c:forEach var="product" items="${products}">
	  							<form:option value="${product.type}" label="${product.type}"/>
	  							</c:forEach>
          			</form:select>
          			<label id="productTypeId"class="valid"><spring:message code="lab_productType"/></label>
          			<label id="productTypeErrorId" class="collapse"></label>
					</div>
				</div>
			<!-- 	<div id="overlayId" class="row collapse"> -->
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input productDivError">
          			<form:select path="product" class="selecttag" onchange="selecttag('productId','product');getGroupTypeByProductType();"
          			onfocus="showlabel('productId','productErrorId');" onclick="">
          				<form:option value="0" label=" "/>
          				<form:options value=""/>
          			</form:select>
          			<label id="productId"class="valid"><spring:message code="lab_products"/></label>
          			<label id="productErrorId" class="collapse"></label>
          			</div>
          			</div>



<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input masterVersionDiv masterVersionDivError">
							<form:select path="masterVersion" onchange="selecttag('masterVersionId','masterVersion');"
          			onfocus="showlabel('masterVersionId','masterVersionErrorId');">
          				<form:option value="" label=" " />
          				<form:options items="${packagingData.mvData}"/>
          			</form:select>
          			<label id="masterVersionId"class="valid"><spring:message code="lab_masterVersion"/></label>
          			<label id="masterVersionErrorId" class="collapse"></label>
					</div>
				</div>
				
				
				

		<!-- 	</div> -->
			<!--added by suraj  -->
			
			<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input levelDiv">
						<form:select path="levelNumber" class="selecttag"
							onchange="selecttag('groupTypeId','groupType');fetchInventory();"
							onfocus="showlabel('groupTypeId','groupTypeErrorId');">
							<form:option value="0" label="" />
							<form:options items="${packagingData.groupData}" />
						</form:select>
						<label id="groupTypeId" class="valid"><spring:message
								code="lab_groupType" /></label> <label id="groupTypeErrorId"
							class="collapse"></label>
					</div>
				</div> --%>
				
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input groupTypeDivError">
						<form:select path="groupType" class="selecttag"
							onchange="selecttag('groupTypeId','groupType');fetchInventory();"
							onfocus="showlabel('groupTypeId','groupTypeErrorId');">
							<form:option value="0" label="" />
							<form:options items="${packagingData.groupData}" />
						</form:select>
						<label id="groupTypeId" class="valid"><spring:message
								code="lab_groupType" /></label> <label id="groupTypeErrorId"
							class="collapse"></label>
					</div>
				</div>
				<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
					<div class="styled-input masterVersionDiv masterVersionDivError">
							<form:select path="masterVersion" onchange="selecttag('masterVersionId','masterVersion');"
          			onfocus="showlabel('masterVersionId','masterVersionErrorId');">
          				<form:option value="" label=" " />
          				<form:options items="${packagingData.mvData}"/>
          			</form:select>
          			<label id="masterVersionId"class="valid"><spring:message code="lab_masterVersion"/></label>
          			<label id="masterVersionErrorId" class="collapse"></label>
					</div>
				</div> --%>
          		<div id="cardId" class="row collapse">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          			<%-- <form:select path="products" class="selecttag" onchange="getCards('cardType','products');selecttag('productsId','products');" 
          			onfocus="showlabel('productsId','productsErrorId');" onclick="">
          				<form:option value="0" label=" "/>
          				<form:options value=""/>
          			</form:select> --%>
          			<form:select path="products" class="selecttag" onchange="selecttag('productsId','products');" 
          			onfocus="showlabel('productsId','productsErrorId');" onclick="">
          				<form:option value="0" label=" "/>
          				<form:options value=""/>
          			</form:select>
          			<label id="productsId"class="valid"><spring:message code="lab_products"/></label>
          			<label id="productsErrorId" class="collapse"></label>
          			</div>
          			</div>
          			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          			<%-- <form:select path="cardType" class="selecttag" onchange="hideTable();selecttag('cardTypeId','cardType');" 
          			onfocus="showlabel('cardTypeId','cardTypeErrorId');" > --%>
          			<form:select path="cardType" class="selecttag" onchange="selecttag('cardTypeId','cardType');" 
          			onfocus="showlabel('cardTypeId','cardTypeErrorId');" >
          				<form:option value="0" label=" " />
          				<form:options items="${packagingData.cardData}"/>
          			</form:select>
<%--           			<label id="cardTypeId"><spring:message code="lab_cardType"/></label> --%>
          			<label id="cardTypeErrorId" class="collapse"></label>
          			</div>
          		</div>
				</div>
				
				<div id="ReaderId" class="row collapse">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          			<form:select path="productsreader" class="selecttag"  
          			onfocus="showlabel('productsreaderId','productstreaderErrorId');" onclick="">
          				<form:option value="0" label=" "/>
          				<form:options value=""/>
          			</form:select>
          			<label id="productsreaderId"class="valid"><spring:message code="lab_products"/></label>
          			<label id="productstreaderErrorId" class="collapse"></label>
          			</div>
          			</div>
          		
				</div>
							
			<%-- 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
          			<div class="styled-input">
          			<form:select path="masterVersion" onchange="selecttag('masterVersionId','masterVersion');"
          			onfocus="showlabel('masterVersionId','masterVersionErrorId');">
          				<form:option value="0" label=" " />
          				<form:options items="${packagingData.mvData}"/>
          			</form:select>
          			<label id="masterVersionId"class="valid"><spring:message code="lab_masterVersion"/></label>
          			<label id="masterVersionErrorId" class="collapse"></label>
          			</div>
          		</div> --%>
				
          			<div class="row collapse" id="groupTableId">
		        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
                 <div class="transaction-table" >
                     <div class="table-responsive">
                     <table class="table table-striped table-bordered table-hover ">
	 						<thead class="default">
	 						<tr style=color:#e3a122>
	 						<th>	<spring:message code="lab_products"/></th>
	 						<th>	<spring:message code="lab_masterVersion"/></th>
	 						<th>	<spring:message code="label_externalNumber"/></th>
	 						<th>	<spring:message code="lab_cardType"/></th>
	 						<th>	<spring:message code="lab_seriesFrom"/></th>
	 						<th>	<spring:message code="lab_seriesTo"/></th>
	 						</tr>
	 						</thead>
	 						<tbody id="groupTableDataId"></tbody>
	 					</table>
	 				</div>
	 			</div>
	 			</div>
	 		</div>
	 		<div id="errorMessage">
	 		
	 		
	 		</div>
	 		</div>
	 		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	 			<input type="submit" class="btn btn-warning" id="submitButtonId"  value="Submit" onclick="return validatePartner(event);"/>
	 			<input type="hidden" name="listIds" id="listIds" value=""/>
	 			<input type="hidden" name="productSeriesFrom" id="productSeriesFrom" value=""/>
	 			<input type="hidden" name="productSeriesTo" id="productSeriesTo" value=""/>
	 		</div>
          	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>
</html>