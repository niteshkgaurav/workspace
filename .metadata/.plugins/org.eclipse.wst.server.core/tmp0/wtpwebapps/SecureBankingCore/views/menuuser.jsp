<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script src=${pageContext.request.contextPath}/js/custom.js></script>
<!-- Bootstrap -->
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
<script src=${pageContext.request.contextPath}/js/menujs.js></script>
</head>
<body>

	<section class="white pad-null">

		<c:if test="${menuname!=null}">
			<ul>
				<li class="active"><a href="#">${menuname} </a></li>
				<c:forEach items="${loginData.menuDetails}" var="catLevel1">

					<li><a
						href="/securebanking/AdminUI/UserMgmt/userLoginCreationPage">${catLevel1.getMenuName()}</a></li>

				</c:forEach>

			</ul>
		</c:if>

		<c:if test="${menuname==null}">

			<ul>
				<c:forEach items="${loginData.menuDetails}" var="catLevel1">
					<c:set var="menu" value="${menuId}" />

					<c:set var="subMenu" value="${submenuId}" />
					<c:choose>
						<c:when test="${catLevel1.getId() eq menu}">
							<li  class="active" ><a href="#">${catLevel1.getMenuName()}</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:forEach items="${loginData.menuDetails}" var="catLevel2">
				
				<c:if test="${catLevel2.getParent_menu().getId() eq menu}">
				<li><a href=${catLevel2.action}>${catLevel2.getMenuName()}</a></li>
				
				</c:if>
				
				</c:forEach>
				

				<%--  		 <c:forEach items="${loginData.menuDetails}" var="catLevel2">
					<c:set var="subMenu" value="${submenuId}"/>
					<c:when  test="${catLevel2.getParent_menu().getId() eq subMenu}" >
	                       <li><a href="#">${catLevel2.getMenuName()}</a></li>
									     </c:when>
									     <c:otherwise>
									     
									     <c:if test="${catLevel2.getParent_menu().getId()==catLevel1.getId() }">
							                  <li><a href="#">${catLevel2.getMenuName()}</a> </li>
							                 </c:if>
									     </c:otherwise> 
									     
									       
					
					</c:forEach> --%>



				<%-- <c:forEach items="${loginData.menuDetails}" var="catLevel2">
                        <c:set var="subMenu" value="${submenuId}"/>
                        <c:when  test="${catLevel2.getParent_menu().getId() eq subMenu}" >
                         <li><a href="#">${catLevel2.getMenuName()}</a></li>
                        </c:when>
                        
                        
                        </c:forEach> --%>



			</ul>


			<%--    	<ul>
        	<c:forEach items="${loginData.menuDetails}" var="catLevel1">
            <c:set var="Menu" value="${menuId}"/>
            <c:if test="${catLevel1.getParent_menu()==null}">
            	<c:choose>
               		<c:when  test="${catLevel1.getId() eq Menu}" >
                 		<li ><a href="#">${catLevel1.getMenuName()}</a> 
                        <!-- second loop, extracting categories level 2  -->
					    	 
					         <c:forEach items="${loginData.menuDetails}" var="catLevel2">
								 <c:set var="subMenu" value="${submenuId}"/>
					  	<!-- Which submenu to highlighten  -->			 
							    	 <c:choose>
										 <c:when  test="${catLevel2.getId() eq subMenu}" >
											  <li><a href=${catLevel2.action}><b>${catLevel2.getMenuName()}</b></a>
									     </c:when>    
								    	 <c:otherwise>
											 <c:if test="${catLevel2.getParent_menu().getId()==catLevel1.getId() }">
							                  <li><a href=${catLevel2.action}>${catLevel2.getMenuName()}</a> 
							                 </c:if>
										 </c:otherwise>
									</c:choose> 
							 </c:forEach>
					        
					    </li>
					</c:when>   
                  	<c:otherwise>
                        <li><a href="#">${catLevel1.getMenuName()}</a> 
                        <!-- second loop, extracting categories level 2  -->
                             <ul>
                             <c:forEach items="${loginData.menuDetails}" var="catLevel2">
                             	<c:if test="${catLevel2.getParent_menu().getId()==catLevel1.getId() }">
                                	<li><a href=${catLevel2.action}>${catLevel2.getMenuName()}</a> 
                                </c:if>
                             </c:forEach>
                             </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:if>
            </c:forEach>
            	
        </ul> --%>

		</c:if>

	</section>



</body>

</html>

