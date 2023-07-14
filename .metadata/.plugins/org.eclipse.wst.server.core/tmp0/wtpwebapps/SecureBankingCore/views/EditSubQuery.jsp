<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function validateForm(event)
{
	var a=$('#subquery').val().trim();
	if(a.length==0)
		{
		$('#subquery').val('');
		$('#stats').html("<font color=red>SubQuery can't be Empty</font>");
		 event.preventDefault();
		}
	$('#filePath').val('');
	$('.oldFile').each(function()
			{
				var a=$('#filePath').val();
				if(a=='')
					{
						$('#filePath').val($(this).text());	
					}
				else
					{
				$('#filePath').val(a+","+$(this).text());	
					}
					});
}
function clearStatus()
{
	$('#stats').html('');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit SubQuery</title>
</head>
<body>
<form:form id="EditSubQuery" name="EditSubQuery" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/EditSubQuery"
		enctype="multipart/form-data">



 <div class="heading-inner">
 <h1> Edit Sub Query </h1>
 <div class="clearfix"></div>
 
             
 
  </div> 
   <div class="row text-center" id="stats">
           <c:if test="${message!=''}">
                        <div id="successMessageId"
					class="has has-success   col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
					<p><font color="green">${message}</font></p>
				</div>
        
       </c:if>             
         </div><br>
    
                      
                      
         <div class="row">
         
                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                 <div class="styled-input" id="div_productId">
                        <form:select  id="productId" class="selecttag" path="productTypeId"  onfocus="removeHasError('div_productId');showlabel('product_id','product_errorid');emptyerror(event,'product_id');" onclick="this.setAttribute('value', this.value);clearStatus();" value="" onchange="selecttag('product_id','productId');">
                          <form:options items="${customercaredata.querytypemap}" />
                        </form:select>
                        <label id="product_id" class="valid">Products</label>
                        <label id="product_errorid" class="collapse"></label>
                        </div>
                      </div>
         
             <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                 <div class="styled-input" id="div_prorityId">
                        <form:select  id="prorityId" class="selecttag" path="priority"  onfocus="removeHasError('div_prorityId');showlabel('prorityId_id','prorityId_errorid');emptyerror(event,'prorityId_id');" onclick="this.setAttribute('value', this.value);clearStatus();" value="" onchange="selecttag('prorityId_id','prorityId');">
                          <form:options items="${customercaredata.querypriority}" />
                        </form:select>
                        <label id="prorityId_id" class="valid">Priority</label>
                        <label id="prorityId_errorid" class="collapse"></label>
                        </div>
                      </div>
                               
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                        
                          <form:input  type="text" path="subquery"  onclick="clearStatus();" required="true" value="${customercaredata.subquery}" />
                          <label class='valid'><spring:message code="label_Subquery"  /></label>
                          <span></span> </div>
                      </div>
                      
	                        <form:hidden path="filePath"   />
	                        
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6"> &nbsp;</div>
	  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
	   <div class="row" id="tabb">
	<tr><td align="right"> <label ><font color="#e3a122">Documents Available </font></label></td> </tr><br>
	<div id ="divId">
	<c:forEach var="data" items='${customercaredata.checkedLinks}'>
	<c:if test="${not empty data}">
	
	<c:forTokens var="arry" items="${data}" delims="/">
	<c:set var="a" value="${arry}"/>
	</c:forTokens>
	
	<table><td width="10%"><label hidden	 path="filePath" class="oldFile">${data}</label><label >${a}</label></td> <%-- <a href="downloadDoc?docName=${data}" target="_blank">${data}</a> --%>
	<td width="5%" align='left'><a href="#" class="remove_field"> &nbsp;&nbsp;Remove</a></td></table>
	</c:if>
	</c:forEach>
	
	<table><tr><td align='right' ><form:input type="file"  path="uploadFilePath"  /></td><td  ><a href="#" class="remove_field">Remove</a></div></td></tr></table>
	</div>
	
	</div>
	  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <!-- class="btn btn-warning" -->
	  <button id="addB" type="button"  onclick="addMoreRow()"  class="btn btn-warning">Add</button>
	</div>
	
	<script>
	$("#divId").on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault();
        $(this).closest('table').remove();
    });
	function addMoreRow()
			{
			$('#divId').append('<table><tr><td><form:input type="file"  path="uploadFilePath"  /></td><td><a href="#" class="remove_field">Remove</a></div></td></tr></table>');
			}
	
	</script>
				

                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mt text-right">
                        <button type="submit" onclick="validateForm(event);" class="btn btn-warning">Update</button>
                      </div>
                       
    
               </div>
               </div>
               
               
               
               <form:hidden path="subqueryid" value="${customercaredata.subqueryid}"  />
               
               
               <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
               
               
               </form:form>





</body>
</html>