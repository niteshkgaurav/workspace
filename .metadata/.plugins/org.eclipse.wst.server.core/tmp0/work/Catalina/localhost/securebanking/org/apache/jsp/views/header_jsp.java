/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.53
 * Generated at: 2023-07-06 09:01:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Enumeration;
import java.util.StringTokenizer;
import com.ng.sb.common.dataobject.LoginData;
import com.ng.sb.common.util.SystemConstant;
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;
import java.math.BigInteger;
import javax.xml.bind.DatatypeConverter;
import java.awt.image.BufferedImage;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/Users/satyendra.CORP/Desktop/sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SecureBankingCore/WEB-INF/lib/spring-webmvc-4.3.0.RELEASE.jar!/META-INF/spring.tld", Long.valueOf(1465528008000L));
    _jspx_dependants.put("/WEB-INF/lib/spring-webmvc-4.3.0.RELEASE.jar", Long.valueOf(1502866017735L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.ByteArrayOutputStream");
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("java.awt.image.BufferedImage");
    _jspx_imports_classes.add("java.util.StringTokenizer");
    _jspx_imports_classes.add("com.ng.sb.common.dataobject.LoginData");
    _jspx_imports_classes.add("javax.imageio.ImageIO");
    _jspx_imports_classes.add("com.ng.sb.common.util.SystemConstant");
    _jspx_imports_classes.add("java.io.IOException");
    _jspx_imports_classes.add("java.math.BigInteger");
    _jspx_imports_classes.add("javax.xml.bind.DatatypeConverter");
    _jspx_imports_classes.add("java.io.File");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("      <link href=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/bootstrap.css rel=\"stylesheet\"/>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("    <meta name=\"keywords\"\r\n");
      out.write("\tcontent=\"html5, css3, form, switch, animation, :target, pseudo-class\" />\r\n");
      out.write("\t<meta name=\"author\" content=\"Codrops\" />\r\n");
      out.write("  \r\n");
      out.write("    </head>\r\n");
      out.write("   \r\n");
      out.write("       <body>\r\n");
      out.write("       \t     \r\n");
      out.write("       \t     ");

       	  Enumeration<String> sessionKeys = session.getAttributeNames();
       	     
       	     while(sessionKeys.hasMoreElements())
       	     {
       	    	 String keyName = sessionKeys.nextElement();
       	    	 System.out.println(keyName + " == " +session.getAttribute(keyName));
       	     }
       	     
       	     
      out.write("                   \r\n");
      out.write("              \r\n");
      out.write("        <header>\r\n");
      out.write("     <div style=\"height:5px\" ></div>\r\n");
      out.write("          <div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-12\">\r\n");
      out.write("            <div   class=\"login-details\">\r\n");
      out.write("           \r\n");
      out.write("              <ul>\r\n");
      out.write("                <li class=\"hidden-xs hidden-sm\"> <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/AdminUI/UserMgmt/userLoginEdit\"> <img id=\"imageId\" src=\"/securebanking/images/user.png\" alt=\"\"> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginData.username}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</a></li>\r\n");
      out.write("                <li class=\"hidden-xs hidden-sm\" id=\"div_login-details_id\"><a  href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/AdminUI/UserMgmt/chngePassword\">Change Password</a></li>\r\n");
      out.write("                <li><a id=\"login_detail_div\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/AdminUI/login/logout\">Logout</a></li>\r\n");
      out.write("              </ul>\r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("\r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("            </div>\r\n");
      out.write("           \r\n");
      out.write("          </div>\r\n");
      out.write("          <a class=\"menu\" id=\"menu-toggle\" href=\"javascript:void(0);\" title=\"Menu\"><span></span></a>\r\n");
      out.write("          <nav class=\"navbar navbar-default\">\r\n");
      out.write("            <div class=\"container-fluid\"> \r\n");
      out.write("              <!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("              <div class=\"navbar-header\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle collapsed hidden-xs hidden-sm\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\"> <span class=\"sr-only\">Toggle navigation</span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> </button>\r\n");
      out.write("                <a class=\"navbar-brand\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/AdminUI/login/layoutUser\"><img src=\"/securebanking/images/logo.gif\" alt=\"\" width=\"90\"></a> \r\n");
      out.write("                 ");

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
    	            
	         
      out.write("\r\n");
      out.write("                \r\n");
      out.write("\t                <img class=\"img-responsive\" src=\"data:image/jpg;base64, ");
      out.print(b64);
      out.write("\" height=\"100;\" width=\"100;\"/>\r\n");
      out.write("                ");
 
    	      	  	
		          }catch(IOException e){
		            System.out.println("Error: "+e);
		          }
	          }
				
      out.write("\r\n");
      out.write("                \r\n");
      out.write("              </div>\r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("              <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("              <div class=\"collapse navbar-collapse hidden-xs hidden-sm\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("               \r\n");
      out.write("              </div>\r\n");
      out.write("              <!-- /.navbar-collapse --> \r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.container-fluid --> \r\n");
      out.write("          </nav>\r\n");
      out.write("        </header>\r\n");
      out.write("        </body>\r\n");
      out.write("       \r\n");
      out.write(" </html>\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" ");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
