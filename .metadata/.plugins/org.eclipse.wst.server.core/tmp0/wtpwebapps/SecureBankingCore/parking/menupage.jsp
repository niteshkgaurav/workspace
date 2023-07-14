 <%@page contentType="text/html;charset=UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@page import="java.util.*" %>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
   <!-- <link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/menustyles.css /> -->
   <!-- <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> -->
   <script src=${pageContext.request.contextPath}/js/jquery-1.10.2.min.js></script>
   <script src=${pageContext.request.contextPath}/js/menujs.js></script>
   <style>
		sub {
			   color: orange;
			}
   </style>
</head>
<body>
	<div id='cssmenu'>
	 <section class="white pad-null">
    	<ul>
        	<c:forEach items="${loginData.menuDetails}" var="catLevel1">
        	
        	
            <c:set var="Menu" value="${menuId}"/>
            
            
            <c:if test="${catLevel1.getParentMenu().getId()==null}">
            	<c:choose>
            	
               		<c:when  test="${catLevel1.getId() eq Menu}" >
                 		<li class="has-sub open" ><a href="#" style="background-color:#e3a122;">${catLevel1.getMenuName()}</a> 
                        <!-- second loop, extracting categories level 2  -->
					    	 <ul style="display: block;">
					         <c:forEach items="${loginData.menuDetails}" var="catLevel2">
								 <c:set var="subMenu" value="${submenuId}"/>
					  	<!-- Which submenu to highlighten  -->			 
							    	 <c:choose>
										 <c:when  test="${catLevel2.getId() eq subMenu}" >
											  <li class="active submenu"><a href=${catLevel2.action} >${catLevel2.getMenuName()}</a>
									     </c:when>    
								    	 <c:otherwise>
											 <c:if test="${catLevel2.getParentMenu().getId()==catLevel1.getId() }">
							                  <li><a href=${catLevel2.action}>${catLevel2.getMenuName()}</a> 
							                 </c:if>
										 </c:otherwise>
									</c:choose> 
							 </c:forEach>
					         </ul>
					    </li>
					</c:when>   
                  	<c:otherwise>
                  	
                  
                  	
                  	<c:if test="${Menu==null}">
                        <li  class='has-sub '><a  href="#"  >${catLevel1.getMenuName()}</a> 
                        <!-- second loop, extracting categories level 2  -->
                             <ul  style="display:none">
                             <c:forEach items="${loginData.menuDetails}" var="catLevel2">
                             	<c:if test="${catLevel2.getParentMenu().getId()==catLevel1.getId() }">
                                	<li ><a href=${catLevel2.action}>${catLevel2.getMenuName()}</a> 
                                </c:if>
                             </c:forEach>
                             </ul>
                        </li>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </c:if>
            </c:forEach>
            	<%-- <li><a href="${pageContext.request.contextPath}/AdminUI/login/logout"><span>Logout</span></a></li> --%>
        </ul>
        </section>
    </div>
</body>
</html>
