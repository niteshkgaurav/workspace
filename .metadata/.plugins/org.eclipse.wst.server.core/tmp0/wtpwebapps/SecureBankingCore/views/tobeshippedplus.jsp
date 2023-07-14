<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/tobeshippedplus.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>To Be Shipped Plus</title>
</head>
<body>
	<form:form id="tobeshippedplus" method="post"
		modelAttribute="inventoryMgmtData"
		action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/tobeshippedplus">
			<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_tobeshippedplus"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                      			<c:if test="${statusMessage!=''}"> 
									<div id="msgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p><font color="green">${statusMessage}</font></p> 
									</div> 
							
									</c:if>
									<c:if test="${errorMessage!=''}"> 
			          				 <div id="errorid" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
			                                            <p><font color="red">${errorMessage}</font></p> 
			                          </div>
			                         </c:if>
	                    </div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="divID_scanId" class="styled-input" >
									<form:select id="status_Id" 
									path="scanId" class="selecttag"
									onfocus="removeHasError('divID_scanId')"
									onchange="selecttag('label_scanId','status_Id');"
									onclick="this.setAttribute('value', this.value);" value=" ">
									<form:option value="0" label=" " />
									<form:option value="1" label="Box" />
									<form:option value="2" label="Loose Product" />
								</form:select>
					    					 <label id="label_scanId" ><spring:message code="lab_Scanitem" /></label>
					    					 <label id="scanIdErrorId" class="collapse"></label>
                          		 </div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="divID_entity" class="styled-input" >
									<form:select id="Entity_Id" path="entityId" class="selecttag"
										onfocus="removeHasError('divID_entity')"
										onchange="selecttag('label_Entity_Id','Entity_Id');"
										onclick="this.setAttribute('value', this.value);" value=" ">
										<form:option value="0" label=" " />
										<form:options  items="${ inventoryMgmtData.orderMap}" />
									</form:select>
					    					 <label id="label_Entity_Id" ><spring:message code="lab_orderno" /></label>
					    					 <label id="Entity_IdErrorId" class="collapse"></label>
                          		 </div>
                      		</div>
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div id="divID_qrCodeValueId" class="styled-input" >
									<form:input type="text" class="selecttag"
										id="qrValue" path="qrCodeValue" autocomplete="off"
										onchange="selecttag('label_qrValue','qrValue');"
										onclick="this.setAttribute('value', this.value);" value=" "
										onfocus="removeHasError('divID_qrCodeValueId');emptyerror(event,'lab_qrCodeValueErrorId');
										emptyerror(event,'msgId');emptyerror(event,'errorId')" />
					    					 <label id="label_qrValue" ><spring:message code="lab_qrCodeValue" /></label>
					    					 <label id="lab_qrCodeValueErrorId" class="collapse"></label>
                          		 </div>
                      		</div>
                      		 <div  id="submitId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                     		 	<input type="button" class="btn btn-warning"
									value="SCAN"   onclick="return scaningtablelist();" />
                     		 </div>
                     		 <div class="col-xs-12" id='tempDetails'>
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           		 <table id="template_details" class="table table-bordered table-striped">
	                            	</table>
	                          	 </div>
	                         </div>
	                         <form:hidden path="id" value="${inventoryMgmtData.id}"/>
	                        </div>
	                        <div  id="tempDetailsSubmit" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center collapse">
			                        <input type="submit"
								value="Submit"  class="btn btn-warning"
								onclick="return validatetobehipped();" />
							</div>
						</div>
						
						<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
						
	</form:form>

</body>
</html>