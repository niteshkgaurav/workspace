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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script>
function validateForm(event)
{
	var a=$('#resolutionTime').val().trim();
	if(a==0)
		{
		$('#resolutionTime').val('');
		$('#stats').html("<font color=red>ResolutionTime can't be Zero or Empty</font>");
		 event.preventDefault();
		}
}
function clearStatus()
{
	$('#stats').html('');
}
</script>
<title>Insert title here</title>
</head>
<body>
<form:form id="CCUsertypeForm" name="CCUsertypeForm" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/editQueryResolutionTime"
		enctype="multipart/form-data">
      

 <div class="heading-inner">
 <h1> Edit Query Resolution Time </h1>
                      <div class="clearfix"></div>
                      
                      
    </div>  
    
     <br> <div class="row text-center" id="stats">
           <c:if test="${message!=''}">
                   <strong >${message}</strong> 
       </c:if>             
         </div>
    
    
    <div class="row" style="margin-top: 4%;">
     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <form:input type="text"  path="customerpriority"  value="${data.customerpriority}" onclick="clearStatus();" readonly="true" />
                          <label class='valid'>* Priority</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <form:input type="text" id="resolutionTime" path="resolutionTime" maxlength='3'   value="${data.resolutionTime}" onkeypress="onlyNumric(event,'errorid','label_resolution');" onclick="clearStatus();" />
                          <label id="label_resolution" class='valid'>* Query Resolution Time(in hours)</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <button type="submit" class="btn btn-warning" onclick="validateForm(event);">Submit</button>
                      </div>
                      
                      <form:hidden path="id" value="${data.id}"/>
    
    
    </div>
   <%--  <div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Description</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                               
                                <tr>
                                  <td>${data.name}</td>
                                  <td>${data.description}</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
     --%>
    
    <form:hidden path="customerpriorityId" value='data.customerpriorityId'  />
    
    
    
    <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
    
    </form:form>
</body>
</html>