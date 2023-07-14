<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
</head>
<body>
<form:form id="CreateUser" name="CreateUser" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/createuser"
		enctype="multipart/form-data">



 <div class="heading-inner">
 <h1> Create User </h1>
 </div>
                      <div class="clearfix"></div>
                      
         <div class="row">
         
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required  />
                          <label>* Name</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Email</label>
                          <span></span> </div>
                      </div>   
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Phone</label>
                          <span></span> </div>
                      </div>      
                              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <form:select class="form-control" path="usertype">
                        <c:forEach items="${data.usertypemap}" var="usertype" >
                        
                          <option ${usertype.key}> ${usertype.value}</option>
                          
                          
                          </c:forEach>
                        </form:select>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <select class="form-control">
                          <option>Select</option>
                        </select>
                      </div>
         
         
         </div>             
                      
                      
                 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">     
    
    </form:form>




</body>
</html>