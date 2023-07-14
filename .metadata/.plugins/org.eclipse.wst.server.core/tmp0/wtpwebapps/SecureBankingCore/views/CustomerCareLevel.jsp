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
<title>CustomerCarelevel</title>
  <link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
</head>
<body>

<form:form id="CClevelForm" name="CCLlevelForm" method="get"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/customercarelevel"
		enctype="multipart/form-data">



 <div class="heading-inner">
 <h1> Customer Care level </h1>
                      <div class="clearfix"></div>
                      
                      
    </div>  
    <br>
     <div class="row"> 
                      <!--Table Start-->
                      <div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                  <th>Level</th>
                                  <th>Weightage</th>
                                </tr>
                              </thead>
                              <tbody>
                               
                              <c:forEach var="data" items='${data.carelist}' > 
                                <tr>
                                  <td>${data.name}</td>
                                  <td>${data.weightage}</td>
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