<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script src=${pageContext.request.contextPath}/js/QueryLog.js></script>
<title>Query Log</title>
</head>
<body>

<form:form id="QueryLog1" name="QueryLog1" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/QueryLogpost"
		enctype="multipart/form-data">
 <div class="heading-inner">
 <h1>Query Log </h1>
 
  </div> 
                      <div class="clearfix"></div>


<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-md-offset-3">
                        <div class="styled-input">
                        
                          <form:input  type="text" path="mobilenumber" id="mobilenumber" onkeypress="onlyNumric(event,'errorId');  required="true" />
                          <label id="errorId"><spring:message code="lab_custMobilenumber" /></label>
                          <span></span> </div>
                      </div>
                      
                      
                      
                      
                       <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 mt ">
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mt  col-md-offset-6">
                        <button type="submit" class="btn btn-warning"  >Get Details</button>
                      </div>
                      </div>
                      
                      
                      <c:if test="${message!=null}">
                       <div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                  <th>Customer Name</th>
                                  <th>CustomerID</th>
                                  <th>EmailId</th>
                                  <th>Status</th>
                                  <th>DOB</th>
                                  <th> Product Type</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                               <c:forEach var="data" items='${customercaredata.subscriberlist}' > 
                                <tr>
                                  <td>${data.name}</td>
                                  <td>${data.customerid}</td>
                                   <td>${data.email} </td>
                                   <td>${data.status} </td>
                                   <td>${data.productName} </td>
                                </tr>
                             </c:forEach>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                      
                       
                       <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 mt ">
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mt  col-md-offset-6 ">
                        <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#queryId" >Query Log</button>
                      </div>
                      </div>
                      </c:if>
    
                        <div id="queryId" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-md-offset-4 collapse" >
                        <form:select class="form-control" path="querytypeId">
                            <form:option value="0" label="Select" />
                          <form:options items="${customercaredata.querytypemap}" />
                        </form:select>
                      </div>

</div>

 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>

</body>
</html>