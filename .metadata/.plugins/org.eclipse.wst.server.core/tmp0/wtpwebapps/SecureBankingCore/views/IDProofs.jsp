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

<script type="text/javascript" src=${pageContext.request.contextPath}/js/IdProof.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<title>ID-Proofs</title>


</head>
<body class="PageType">

<form:form id="idProofsForm" name="idProofsForm" method="post" modelAttribute="idProofsFormData" action="${pageContext.request.contextPath}/AdminUI/hostMgmtController/idProofs" enctype="multipart/form-data">
	
          		
	               		 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_IdProof_title"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                      
	                      <c:if test="${message!=''}">
									<div id="successMessageId"  class="text-success  col-xs-4 col-sm-4 col-md-4 col-lg-4  col-md-offset-4" >
                                            <strong >${message}</strong> 
									</div> 
							</c:if>	
							<c:if test="${errorMessage!=''}"> 
							
			          				 <div id="errorstatusMessage" class="text-danger col-xs-4 col-sm-4 col-md-4 col-lg-4  col-md-offset-4" >
			           			
			                                            <strong >${errorMessage}</strong> 
								 
									</div>
							</c:if>
	                    </div>
	          
          			<div class="row">
          					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                        
										<form:input type="text" path="idProofName" class="selecttag" onchange="selecttag('label_IdProofName','idProofName')"
										onkeypress="disableSpecialCharacterWithSpace(event,'lab_IdProofNameErrorid');" 
										onfocus="emptyerror(event,'lab_IdProofNameErrorid');showlabel('label_IdProofName','lab_IdProofNameErrorid'); "/>
					    					 <label id="label_IdProofName" >  <spring:message code="lab_IdProofName"/> </label>
					    					  <label id="lab_IdProofNameErrorid" class="collapse" ></label>
                          		 </div>
                      		</div>  
            
	            			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	             
			                          <form:input type="text" path="idProofDescription"  class="selecttag"  
			                          onkeypress="disableSpecialCharacterWithSpace(event,'lab_IdProofDescriptionErrorId');" onchange="selecttag('label_idProofDescription','idProofDescription')"
			                          onfocus="emptyerror(event,'lab_IdProofDescriptionErrorId');showlabel('label_idProofDescription','lab_IdProofDescriptionErrorId');"/>
			                           <label id="label_idProofDescription" ><spring:message code="lab_IdProofDescription"/>  </label>
					    					  <label id="lab_IdProofDescriptionErrorId" class="collapse" ></label>
	                          </div>
	                      	</div>
	                      	
	                     	 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 <input type="submit" id="submitBtn" class="btn btn-warning" value="Submit" onclick="checkIdProof(event);"/>
	                      	</div>
					
						 
	               
	                	<div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table  class="table table-bordered table-striped" id="table_id">
	                              <thead>
	                                <tr>
	                                  	<th align="center"><spring:message code="lab_IdProofId"/></th>
					  					<th align="center"><spring:message code="lab_IdProofName"/></th>
					  					<th align="center"><spring:message code="lab_IdProofDescription"/></th>
					  					<th align="center"><spring:message code="lab_action"/></th>
	                                </tr>
	                              </thead>
	                              <tbody>
	                                <c:forEach items="${idProofList}" var="idProofs">
										<tr>
											<td align="center">${idProofs.id}</td>
											<td align="center">${idProofs.idProofName}</td>
											<td align="center">${idProofs.idProofDescription}</td>
											<td align="center"><img align="middle" style="cursor: hand" src="/securebanking/images/edit.gif" title="edit" onclick="populateForEdit('${idProofs.id}','${idProofs.idProofName}','${idProofs.idProofDescription}');"></td>
										</tr>
									</c:forEach>
	                                
	                              </tbody>
	                            </table>
	                            	<input type="hidden" id="idProofId" name="idProofId" />
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
