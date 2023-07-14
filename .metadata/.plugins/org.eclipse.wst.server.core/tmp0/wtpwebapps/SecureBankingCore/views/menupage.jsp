 <%@page contentType="text/html;charset=UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@page import="java.util.*" %>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ page import="com.ng.sb.common.dataobject.LoginData" %>
  <%@ page import="com.ng.sb.common.dataobject.MenuDetails" %>
  <%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
    
<!DOCTYPE html>
<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
   <script src=${pageContext.request.contextPath}/js/menujs.js></script>
   <style>
		sub {
			   color: orange;
			}
   </style>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>
	<div id='cssmenu'>
	 <section class="white pad-null">
    	<ul>
    	
        	<c:forEach items="${loginData.menuDetails}" var="catLevel1">
        	
        	<%
        	

        	String menuId=	((MenuDetails)(pageContext.findAttribute("catLevel1"))).getParentId();
        	String submenuId=	((MenuDetails)(pageContext.findAttribute("catLevel1"))).getSubMenuId();
		 
			String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "menuId="+menuId+"&submenuId="+submenuId);
        	
			
			
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
        	
        	
            <c:set var="Menu" value="${menuId}"/>
            <c:if test="${catLevel1.getParentMenu()==null}">
            	<c:choose>
               		<c:when  test="${catLevel1.getId() eq Menu}" >
               		<% 
			System.out.println("Parent Id : "+menuId+" SubMenuId : "+submenuId); %>
                 		<li class="has-sub open" ><a href="#" style="background-color:#e3a122;">${catLevel1.getMenuName()}</a> 
                        <!-- second loop, extracting categories level 2  -->
					    	 <ul style="display: block;">
					         <c:forEach items="${loginData.menuDetails}" var="catLevel2">
					         
					          <%
                	String menu2Id=	((MenuDetails)(pageContext.findAttribute("catLevel2"))).getParentId();
        	String submenu2Id=	((MenuDetails)(pageContext.findAttribute("catLevel2"))).getSubMenuId();
		 
			String encrypted2Id=KeyEncryptionUtils.encryptUsingKey(key, "menuId="+menu2Id+"&submenuId="+submenu2Id);
        	
			
			
												String param2=UUID.randomUUID().toString();
												String param12=UUID.randomUUID().toString();
												%>
												
								 <c:set var="subMenu" value="${submenuId}"/>
					  	<!-- Which submenu to highlighten  -->			 
							    	 <c:choose>
										 <c:when  test="${catLevel2.getId() eq subMenu}" >
										
											  <li class="active submenu"><a href="${catLevel2.action}?enc=<%=encrypted2Id %>&param1=<%=param2 %>&param2=<%=param12 %>" >${catLevel2.getMenuName()}</a>
									     </c:when>    
								    	 <c:otherwise>
											 <c:if test="${catLevel2.getParentMenu().getId()==catLevel1.getId() }">
											 
											 
							                  <li><a href="${catLevel2.action}?enc=<%=encrypted2Id %>&param1=<%=param2 %>&param2=<%=param12 %>">${catLevel2.getMenuName()}</a> 
							                 </c:if>
										 </c:otherwise>
									</c:choose> 
							 </c:forEach>
					         </ul>
					    </li>
					</c:when>   
                  	<c:otherwise>
                  	<c:if test="${Menu==null}">
                       <%--  <li ><a  href="${catLevel1.action}?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"  >${catLevel1.getMenuName()}</a> --%>
                       <%--  <li ><a  href="${catLevel1.action}?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"  >${catLevel1.getMenuName()}</a> --%>
                      <%--  ${loginData.typeCode=='CBLMIS'}============ --%>
                       <c:choose>
                       <c:when test="${loginData.typeCode=='CBLMIS'}">
                       <li ><a  href="${catLevel1.action}?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"  >${catLevel1.description}</a>
                       </c:when>
                       <c:otherwise>
                       <li ><a  href="${catLevel1.action}?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"  >${catLevel1.getMenuName()}</a> 
                       </c:otherwise>
                       </c:choose>
                         
                        <!-- second loop, extracting categories level 2  -->
                             <ul  style="display:none">
                             <c:forEach items="${loginData.menuDetails}" var="catLevel2">
                             
                             
                             	<c:if test="${catLevel2.getParentMenu().getId()==catLevel1.getId() }">
                             	
                             	
                             <%
                	String menu2Id=	((MenuDetails)(pageContext.findAttribute("catLevel2"))).getParentId();
        	String submenu2Id=	((MenuDetails)(pageContext.findAttribute("catLevel2"))).getSubMenuId();
		 
			String encrypted2Id=KeyEncryptionUtils.encryptUsingKey(key, "menuId="+menu2Id+"&submenuId="+submenu2Id);
        	
			//if(menuId.equals("99"))
			//System.out.println("Parent Id : "+menu2Id+" SubMenuId : "+submenu2Id);
			
												String param2=UUID.randomUUID().toString();
												String param12=UUID.randomUUID().toString();
												%>
												
                                	<li ><a href="${catLevel2.action}?enc=<%=encrypted2Id %>&param1=<%=param2 %>&param2=<%=param12 %>">${catLevel2.getMenuName()}</a> 
                                </c:if>
                             </c:forEach>
                             </ul>
                        </li>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </c:if>
            </c:forEach>
        </ul>
        </section>
    </div>
</body>
</html>
