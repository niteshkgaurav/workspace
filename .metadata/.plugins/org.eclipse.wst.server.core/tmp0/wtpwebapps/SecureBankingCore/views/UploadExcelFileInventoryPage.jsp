<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.9.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/uploadExcelFile.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<title><spring:message code="label_uplaod_file" /></title>
</head>
<body>

		<form:form id="UploadExcelFileInventory" name="UploadExcelFileInventory" method="post" modelAttribute="inventorySEData"
			action="${pageContext.request.contextPath}/AdminUI/UploadExcelFileInventoryController/uploadExcelFileSubmit"
			enctype="multipart/form-data">

			
				
	    		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="label_uplaod_file"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                      			<c:if test="${responseMessage!=''}"> 
									<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${responseMessage}</font></p> 
									</div> 
							
									</c:if>
									<c:if test="${errorMessage!=''}"> 
			          				 <div id="errorid" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
			                                            <p><font color="red">${errorMessage}</font></p> 
			                          </div>
			                         </c:if>
			                         <c:if test="${errors!=''}"> 
									<div  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="red">${errors}</font></p> 
									</div> 
			                         </c:if>
									
	                    </div>	                    
					 <div class="row">
                     	 
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input" id="label_productss">
											<form:select id="label_productssId" path="productType" class="selecttag" 
											onfocus="removeHasError('label_productss')" onchange="getponumber();selecttag('label_productss','label_productssId');"
											onclick="this.setAttribute('value', this.value);selecttag('label_productss','label_productssId');" value="">
												<%-- <form:option value="" label=" " /> --%>
												<!--############################################  -->
												 <form:option value="0" label="" />
												<c:forEach var="products" items="${productsList}">
												<form:option value="${products.id}" label="${products.productName}" />
												
												</c:forEach>
												<%-- <form:option value="1" label="Overlay" />
												<form:option value="2" label="PayCard" />
												<form:option value="3" label="Reader" /> --%>
												</form:select>
												
												<!--############################################  -->
												<%-- <form:option value="1" label="Overlay" />
												<form:option value="2" label="PayCard" />
												<form:option value="3" label="Reader" />
												</form:select> --%>
												<label id="label_productss"class="valid"><spring:message code="Select Product" /></label>
					    			</div>		 
                      		</div>
                      		</div>
									
	                    <div class="row">
	                    	<div id="upload" class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
	                    	<div class="styled-input">
							<spring:message code="lable_selectFile" var="lable_selectFile" />
	                    		<!-- <div id="upload_ErrorId" class="collapse"></div> -->
	                    	<%-- <spring:message code="lable_selectFile" var="lable_selectFile" /> --%>
	                    	<div  id="upload" class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
			                      <div id="divID_uploadFilePath" class="styled-input">
			                              <form:input type="file" id="uploadFilePath" path="uploadFilePath" 
														 
														  onclick="emptyerror(event,'upload_ErrorId');
														  showlabel('label_uploadFilePath','upload_ErrorId');removeHasError('divID_uploadFilePath')" />
			                            		  		  
								</div>
			                       
                       		</div>
                       		<label id="label_uploadFilePath"class="valid">${lable_selectFile}</label>
                       		</div>
                       		<label id="upload_ErrorId" class="collapse"></label>
                       </div>
                       <div class="row">		
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
		                        <div id="divID_poNo" class="styled-input collapse" >
		                        <spring:message code="lable_PO_Number" var="lable_PO_Number" />
		                        <form:select path="poNo" class="selecttag"
									id="poNo" name="lab_poNo"
									onfocus="showlabel('poNo','poNoErrorId');removeHasError('divID_poNo');"
									onchange="getpath('uploadFilePath');selecttag('label_poNo','poNo');" 
									onclick="emptyerror(event,'poNoErrorId');this.setAttribute('value', this.value);">
									<form:option value="" label=" " />
         								</form:select>
								<label id="label_poNo" class="valid"><spring:message code="lab_poNo" /></label>
					    		<label id="poNoErrorId" class="collapse"></label>
		                        </div>
                      		</div>
                      		</div>
                       
                      		<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-3">
		                        <div id="divID_poNo" class="styled-input" >
		                        <spring:message code="lable_PO_Number" var="lable_PO_Number" />
									<form:select
										name="lab_poNo" id="poNo"  class="selecttag"
										path="poNo" onchange="getpath('uploadFilePath');selecttag('label_poNo','poNo');" onfocus="removeHasError('divID_poNo')"
										onclick="emptyerror(event,'poNoErrorId');this.setAttribute('value', this.value);" value=" "
										>
										<form:option value="" label=" " />
										<form:options items="${boxSize}" />
									</form:select>
					    					 <label id="label_poNo" ><spring:message code="lab_poNo" /></label>
					    					 <label id="poNoErrorId" class="collapse"></label>
                          		 </div>
                      		</div> --%>
                      		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      			<input type="submit" id="submitBtn" class="btn btn-warning" value="Submit" onclick="validateUploadExcelFilePage(event);" />
                      		</div> 
                      		<input type="hidden" id="idProofId" name="idProofId" /> 
                      		
	                  </div>
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		</form:form>


</body>
</html>
