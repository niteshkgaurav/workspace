
<!DOCTYPE html>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>

<%@page import="java.math.BigInteger"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.awt.image.BufferedImage"%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
    <head>
      <link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
	<meta name="author" content="Codrops" />
  
    </head>
   
       <body>
       	     
       	     <%
       	  Enumeration<String> sessionKeys = session.getAttributeNames();
       	     
       	     while(sessionKeys.hasMoreElements())
       	     {
       	    	 String keyName = sessionKeys.nextElement();
       	    	 System.out.println(keyName + " == " +session.getAttribute(keyName));
       	     }
       	     
       	     %>                   
              
        <header>
     <div style="height:5px" ></div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div   class="login-details">
           
              <ul>
                <li class="hidden-xs hidden-sm"> <a href="${pageContext.request.contextPath}/AdminUI/UserMgmt/userLoginEdit"> <img id="imageId" src="/securebanking/images/user.png" alt=""> ${loginData.username}</a></li>
                <li class="hidden-xs hidden-sm" id="div_login-details_id"><a  href="${pageContext.request.contextPath}/AdminUI/UserMgmt/chngePassword">Change Password</a></li>
                <li><a id="login_detail_div" href="${pageContext.request.contextPath}/AdminUI/login/logout">Logout</a></li>
              </ul>
              
              
              
<%-- 				<img src="data:<%=imagePath%>; base64, <%=b64%>" height="200;" width="200;">               	 --%>
              
              
            </div>
           
          </div>
          <a class="menu" id="menu-toggle" href="javascript:void(0);" title="Menu"><span></span></a>
          <nav class="navbar navbar-default">
            <div class="container-fluid"> 
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed hidden-xs hidden-sm" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/AdminUI/login/layoutUser"><img src="/securebanking/images/logo.gif" alt="" width="90"></a> 
                 <%
			  	LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
            	String imagePath = loginData.getProfileImageName();
            	int loc=-1;
            	System.out.println("Image path = "+imagePath);
            	if(imagePath != null && !"".equalsIgnoreCase(imagePath))
            	 loc = imagePath.indexOf(".");
            	
            	if(loc > 0) {
	            	try{
	    	      	  	StringTokenizer token = new StringTokenizer(imagePath, ".");
	    	      	  	token.nextToken();
	    	      	  	String ext = token.nextToken().trim();
	    	           	BufferedImage bImage = ImageIO.read(new File(imagePath));//give the path of an image
	    	       		ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    	            ImageIO.write( bImage, ext, baos );
	    	            baos.flush();
	    	            byte[] imageInByteArray = baos.toByteArray();
	    	            baos.close();                                   
	    	            String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
    	            
	         %>
                
	                <img class="img-responsive" src="data:image/jpg;base64, <%=b64%>" height="100;" width="100;"/>
                <% 
    	      	  	
		          }catch(IOException e){
		            System.out.println("Error: "+e);
		          }
	          }
				%>
                
              </div>
              
              
              
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse hidden-xs hidden-sm" id="bs-example-navbar-collapse-1">
               
              </div>
              <!-- /.navbar-collapse --> 
            </div>
            <!-- /.container-fluid --> 
          </nav>
        </header>
        </body>
       
 </html>

 
 
 
 
 
 
 
 
 
 