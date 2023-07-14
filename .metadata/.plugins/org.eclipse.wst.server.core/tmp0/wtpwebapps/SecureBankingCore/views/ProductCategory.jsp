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
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/ProductCategory.js></script>
<title>ProductCategory</title>

</head>
<body onload="refresh();">

	<form:form id="productCategoryCreationForm"
		name="productCategoryCreationForm" method="post"
		modelAttribute="productCategoryData"
		action="${pageContext.request.contextPath}/AdminUI/sysSetting/createProductCategory">
		
				<div class="heading-inner  ">
		                      <h1 class="pull-left"><spring:message code="lab_Product_category"/></h1>
		                      <div class="clearfix"></div>
		                      <hr>
		                      <c:if test="${message!=''}">
									<div id="after_addProduct_mess"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center text-success" >
                                            <p class="text-success">${message}</p> 
									</div> 
							</c:if>	
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
								<p id="statusmess" class="text-danger"></p>
							</div>
							<div id="after_edit_mess"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                                            <p class="text-danger" >${editProductCatMessage}</p> 
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
											<label id="lable_proCatName1" class="vallid">${lable_proCatName}</label>
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
											<label id="lable_proCatFullDescription1">${lable_proCatFullDescription}</label><span></span>
					    					<label id="errmsgProCatFullDesc" class="collapse" ></label>
                          		 </div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input" id="divID_InventoryFor">
		                        
											<form:select class='selecttag' path="newstatus" name='newstatus' id="newstatus"  
											onclick="refreshSuccess();this.setAttribute('value', this.value);" value=""
											onfocus="showlabel('lable_newstatus','errmsgProCatBriefDesc')" 
						  						onchange="selecttag('lable_newstatus','newstatus')" >
													<form:option value="" label=" " />
													<form:option value='0' ><spring:message code="lab_Block_status" /></form:option>
													<form:option value='1'><spring:message code="lab_UnBlock_status" /></form:option>
											</form:select>
											<label id="lable_newstatus">Status</label><span></span>
					    					<label id="errmsgProCatBriefDesc "class="collapse" ></label>
										
                          		 </div>
                      		</div>
                      		
                      		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      		 	<input type="submit" class="btn btn-warning" onclick="return productValidation('productCategoryCreationForm',event);" value="submit" />	
                      		 </div>
                      		<div class="clearfix"></div>
		                      <hr>
                      		 
                      		 <div class="col-xs-12">
		                        <div class="transaction-table">
		                          <div class="table-responsive">
		                            <table id="abc" class="table table-bordered table-striped">
		                              <c:if test="${not empty productCatList}">
										<tr >
											<th><span><spring:message code="lab_Category_Name" /></span></th>
											<th><span><spring:message code="lab_Category_Status" /></span></th>
											<th><span><spring:message code="lab_Action" /></span></th>
										</tr>
										<c:forEach items="${productCatList}" var="productCategory" varStatus="status">
											<tr>
												<td id="${status.index}a">${productCategory.newcategoryname} </td>
												<c:if test="${productCategory.newstatus eq false}">
													<td width='25%' class='tableText' align='center'><a><input
												title="lock" type="image" id="${status.index}"
												src='${pageContext.request.contextPath}/images/lock.gif'
												border='0' alt='Blocked' value='${productCategory.newstatus}' /></a>
												</td>
											</c:if>
											<c:if test="${productCategory.newstatus eq true}">
												<td width='25%' class='tableText' align='center'><a><input
														title="unlok" type="image" id="${status.index}"
														src='${pageContext.request.contextPath}/images/unlock.gif'
														alt='Unblock' border='0' value='${productCategory.newstatus}' /></a>
												</td>
											</c:if>
											<td><a
												href="${pageContext.request.contextPath}/AdminUI/sysSetting/editProductCategory?catId=${productCategory.id}&menuId=${menuId}&submenuId=${submenuId}"><img
													title="edit"
													src='${pageContext.request.contextPath}/images/edit.gif'
													style='cursor: hand' align="left" /></a></td>
											</tr>
										</c:forEach>
									</c:if>
	                            </table>
	                          </div>
	                        </div>
                     	 </div>
                      
	     		 </div>
	     		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId"> 
	
	</form:form>
</body>
</html>