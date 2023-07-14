<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.util.Arrays"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function validateForm1(event)
{
	var a=$('#name').val().trim();
	var b=$('#description').val().trim();
	if(a.length==0)
		{
		$('#stats').html("<font color=red>Name can't be Empty</font>");
		 event.preventDefault();
		}
	else if(b.length==0)
	{
	$('#stats').html("<font color=red>Description can't be Empty</font>");
	 event.preventDefault();
	}
}
function clearStatus()
{
	$('#stats').html('');
}
</script>
</head>
<body>
<form:form id="CCUsertypeForm" name="CCUsertypeForm" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/editCustomercareUsertype"
		enctype="multipart/form-data">



 <div class="heading-inner">
 <h1> Edit User Type </h1>
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
                        <div class="styled-input">
                          <form:input type="text"  onclick="clearStatus();" path="name"  value="${data.name}" />
                          <label class='valid'>* Name</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <form:input type="text"   value="${data.description}"  onclick="clearStatus();" path="description"/>
                          <label  class='valid' >* Description</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <button type="submit" onclick="validateForm1(event);" class="btn btn-warning">Submit</button>
                      </div>
                      
                      <form:hidden path="id" value="${data.id}"/>
    
    
    </div>
 
    <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
    </form:form>
</body>
</html>