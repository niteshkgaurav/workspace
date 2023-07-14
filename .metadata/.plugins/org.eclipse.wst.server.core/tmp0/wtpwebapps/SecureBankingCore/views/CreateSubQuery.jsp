<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.CustomerCareData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
	<script src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
<script src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/custom.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Create Sub Query</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/createSubQuery.js></script>	
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );

function validateForm1(event)
{
	var a=$('#subquerys').val().trim();
	if(a.length==0)
		{
		$('#stats').html("<font color=red>SubQuery can't be Empty</font>");
		 event.preventDefault();
		}
}
function clearStatus()
{
	$('#stats').html('');
}
</script>	

</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body class="PageType" >
<form:form id="CreateSubQuery" name="CreateSubQuery" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/CreateSubQuery"
		enctype="multipart/form-data">



 <div class="heading-inner">
 <h1> Create Sub Query </h1>
 <div class="clearfix"></div>
 
 
  </div> 
           <div class="row text-center" id="stats">
                
                  <c:if test="${message!=''}">
                        <div id="successMessageId"
					class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p><font color="green">${message}</font></p>
				</div>
        
       </c:if> 
       
         </div>            <br>
                      
         <div class="row">
         
                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                 <div class="styled-input" id="div_productId">
                        <form:select  id="productId" class="selecttag" path="productTypeId"  onfocus="removeHasError('div_productId');showlabel('product_id','product_errorid');emptyerror(event,'product_id');" onclick="this.setAttribute('value', this.value);clearStatus();" value="" onchange="selecttag('product_id','productId');">
                          <form:options items="${data.querytypemap}" />
                        </form:select>
                        <label id="product_id" class="valid">Products</label>
                        <label id="product_errorid" class="collapse"></label>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                 <div class="styled-input" id="div_prorityId">
                        <form:select  id="prorityId" class="selecttag" path="priority"  onfocus="removeHasError('div_prorityId');showlabel('prorityId_id','prorityId_errorid');emptyerror(event,'prorityId_id');" onclick="this.setAttribute('value', this.value);clearStatus();" value="" onchange="selecttag('prorityId_id','prorityId');">
                          <form:options items="${data.querypriority}" />
                        </form:select>
                        <label id="prorityId_id" class="valid">Priority</label>
                        <label id="prorityId_errorid" class="collapse"></label>
                        </div>
                      </div>
                
                      
                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="styled-input">
                         <form:input  type="text" path="subquerys" onclick="clearStatus();"  required="true" />
                          <label class='valid'><spring:message code="label_Subquery" /></label>
                          <span></span> </div>
                      </div>
                         
	                      <div  id="uploadDiv" class="col-xs-12 col-sm-12 col-md-6 col-lg-6"   >
	                      <div class="styled-input"> <label id="label_uploadFilePath" class='valid' >Upload File</label></div>	
			                     			
	                      
	                      </div>
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6"> &nbsp;</div>
	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
	   <div class="row" id="tabb">

	<div id ="divId">
		<form:input type="file" id="uploadFilePath0"  path="uploadFilePath" onfocus="removeHasError('divID_uploadFilePath')"  onclick="refresherrorid(event,'uploadErrorId');"/>
	
	</div>
	
	</div>
	  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <!-- class="btn btn-warning" -->
	  <button id="addB" type="button"  onclick="addMoreRow('doc')"  class="btn btn-warning">Add </button>
                       <button id="removeB" type="button"  onclick="deleteRow()"  class="btn btn-warning">Remove</button>
	</div>
                      
                  <!--     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
                      <button id="addB" type="button"  onclick="addMoreRow('doc')"  class="btn btn-warning">Add Files</button>
                       <button id="removeB" type="button"  onclick="deleteRow()"  class="btn btn-warning">Remove Files</button>
                    </div -->
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mt text-right">
                        <button type="submit"  onclick="validateForm1(event)"  class="btn btn-warning">Active</button>
                      </div>
                     
    
               </div>
         
          <div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table class="table table-bordered table-striped" id="table_id">
                              <thead>
                                <tr>
                                  <th ><spring:message code="label_Subquery" /></th>
                                   <th><spring:message code="label_priorty"/></th>
                                  <th>Products</th>
                                 
                                <th><spring:message code="label_Resolution_Time"/></th> 
                                  <th><spring:message code="label_action"/></th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                               <c:forEach var="data" items='${data.subquerylist}' > 
                                <tr>
                                  <td>${data.subquery}</td>
                                  <td>${data.priority}</td>
                                  <td>${data.productName}</td>
                                   <td>${data.querytime}</td>
                                   <%
												Integer id=	((CustomerCareData)(pageContext.findAttribute("data"))).getId();
                                   				Integer menuId=(Integer)request.getAttribute("menuId");
                                   				Integer submenuId=(Integer)request.getAttribute("submenuId");
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "subqueryId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
                                   <td><a
								href="${pageContext.request.contextPath}/AdminUI/customercare/editSubquery?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
									title="edit"
									src='${pageContext.request.contextPath}/images/edit.gif'
									style='cursor: hand'  /> </a></td>
                                </tr>
                             </c:forEach>
                              </tbody>
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