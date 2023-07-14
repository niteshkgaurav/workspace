
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>


<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/ProductCategoryEdit.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script>
<title>ProductCategory_edit</title>

</head>
<body>
	<form:form id="productCategoryEdit" name="productCategoryEditForm"
		method="post" modelAttribute="productCategoryData"
		action="${pageContext.request.contextPath}/AdminUI/sysSetting/editProductCategory">
			<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lab_Product_category_edit"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                      <c:if test="${message!=''}">
									<div id="after_addProduct_mess" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-success" >${message}</p> 
									</div> 
							</c:if>	
					
							<div  id="after_edit_mess" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-danger" >${catgortExistingMessage}</p> 
									</div>
							
		                      
	     		 </div>
	     		 <div class="row">
          					
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                         <spring:message code="lable_proCatName"  var="lable_proCatName" /> 
											<form:input type='text' class="selecttag"
											id="lable_proCatName" path="newcategoryname"
											name='newcategoryname' placeholder="." value=""
											onblur="javascript:return Category_check()"
											onkeypress="onlyAlphabet(event,'errmsgProCatName');" 
						  					onchange="selecttag('lable_proCatName1','lable_proCatName')" 
											onclick="refreshSuccess();emptyerror('errmsgProCatName');showlabel('lable_proCatName1','errmsgProCatName')"/> 
											<label id="lable_proCatName1" class="valid">${lable_proCatName}</label>
					    					<label id="errmsgProCatName" class="collapse"></label>
                          		 </div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                         <spring:message code="lable_proCatFullDescription" var="lable_proCatFullDescription" /> 
											<form:input type="text" path="newfulldesc" class="selecttag"
												id="lable_proCatFullDescription" name='newfulldesc' value='' 
												onkeypress="onlyAlphabet(event,'errmsgProCatFullDesc');" 
						  						onchange="selecttag('lable_proCatFullDescription1','lable_proCatFullDescription')" 
												onclick="refreshSuccess();emptyerror('errmsgProCatFullDesc');showlabel('lable_proCatFullDescription1','errmsgProCatFullDesc')"/>
											<label id="lable_proCatFullDescription1" class="valid">${lable_proCatFullDescription}</label><span></span>
					    					<label id="errmsgProCatFullDesc" class="collapse" ></label>
                          		 </div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                        
											<form:select class='selecttag' path="newstatus" name='newstatus' id="newstatus"  
											onclick="refreshSuccess();this.setAttribute('value', this.value);" value=""
											onfocus="showlabel('lable_newstatus','errmsgProCatBriefDesc')" 
						  						onchange="selecttag('lable_newstatus','newstatus')" >
						  							<c:if test="${productCategoryData.newstatus eq false}">
														<option
															<c:if test="${productCategoryData.newstatus eq false}">selected="selected"</c:if>
															value='0'><spring:message
																code="lab_Block_status" /></option>
														<option value='1'><spring:message
																code="lab_UnBlock_status" /></option>
													</c:if>
													<c:if test="${productCategoryData.newstatus eq true}">
														<option
															<c:if test="${productCategoryData.newstatus eq true}">selected="selected"</c:if>
															value='1'><spring:message
																code="lab_UnBlock_status" /></option>
														<option value='0'><spring:message
																code="lab_Block_status" /></option>
													</c:if>
													
											</form:select>
											<label id="lable_newstatus" class="valid">Status</label><span></span>
					    					<label id="errmsgProCatBriefDesc "class="collapse" ></label>
										
                          		 </div>
                      		</div>
                      		
                      		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      		 	<input type="submit" class="btn btn-warning" onclick="return productValidation('productCategoryCreationForm',event);" value="Update" />	
                      		 </div>
                      		<div class="clearfix"></div>
		                      <hr>
	
	</div>
	
	
		
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
			<form:hidden id="id" path="id" value="${productCategoryData.id}"/> 
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>
</body>
</html>