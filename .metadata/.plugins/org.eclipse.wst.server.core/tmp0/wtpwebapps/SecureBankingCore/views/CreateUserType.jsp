<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.CustomerCareData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>   
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );

function validateForm1(event)
{
	var a=$('#names').val().trim();
	var b=$('#descriptions').val().trim();
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
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body class="PageType">
<form:form id="CCUsertypeForm" name="CCUsertypeForm" method="post"
		modelAttribute="customercaredata"
		action="${pageContext.request.contextPath}/AdminUI/customercare/CustomercareUsertype"
		enctype="multipart/form-data">
           


 <div class="heading-inner">
 <h1> Create User Type </h1>
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
                          <form:input type="text"  path="names"  onclick="clearStatus()"  />
                          <label class='valid'>* Name</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <form:input type="text"   onclick="clearStatus()"  path="descriptions"/>
                          <label class='valid'>* Description</label>
                          <span></span> </div>
                      </div>
                      
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <button type="submit" class="btn btn-warning" onclick="validateForm1(event);" >Submit</button>
                      </div>
    
    
    </div>
    <div class="col-xs-12">
                        <div class="transaction-table">
                          <div class="table-responsive">
                            <table id="table_id" class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Description</th>
                                  <th>Action</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                               <c:forEach var="data" items='${data.carelist}' > 
                                <tr>
                                  <td>${data.name}</td>
                                  <td>${data.description}</td>
                                  <%
				                                  Integer menuId=(Integer)request.getAttribute("menuId");
				                     				Integer submenuId=(Integer)request.getAttribute("submenuId");
												Integer id=	((CustomerCareData)(pageContext.findAttribute("data"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "userTypeId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
                                   <td><a
								href="${pageContext.request.contextPath}/AdminUI/customercare/editCustomercareUsertype?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
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
    
    <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
    
    
    </form:form>
</body>
</html>