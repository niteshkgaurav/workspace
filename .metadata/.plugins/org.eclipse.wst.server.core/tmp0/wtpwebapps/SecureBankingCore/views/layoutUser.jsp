<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=${pageContext.request.contextPath}/json/json.js></script>
<script src=${pageContext.request.contextPath}/js/custom.js></script>  


<!-- Bootstrap -->
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">



<title>Insert title here</title>
</head>
<body>
<div id="wrapper"> 
  <!--Hamburger Menu-->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li><a href="#">About Us</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Faqs</a></li>
      <li><a href="#">Contact</a></li>
      <div class="hidden-md hidden-lg">
        <li><a href="#">MY TRANSACTION</a></li>
        <li><a href="#">MY QUERY</a></li>
        <li><a href="#">MY OVERLAY</a></li>
        <li><a href="#">MY PROFILE</a></li>
        <li><a href="#">MY ACCESS</a></li>
      </div>
    </ul>
  </div>
  <div class="clearfix"></div>
  <!-- /#Hamburger Menu --> 
  
  <!-- Page Content -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <div class="row"> 
          <tiles:insertAttribute name="header1" />
        <!--Header Start-->
       <!--  <header>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="login-details">
              <ul>
                <li><img src="images/wallet.png" alt=""><span class="hidden-xs hidden-sm">My Wallet :</span>&#8377;2000</li>
                <li class="hidden-xs hidden-sm"><img src="images/user.png" alt=""><a href="#">Himanshu</a></li>
                <li class="hide"><a href="#">Login</a></li>
                <li><a href="#">Logout</a></li>
              </ul>
            </div>
          </div>
          <a class="menu" id="menu-toggle" href="javascript:void(0);" title="Menu"><span></span></a>
          <nav class="navbar navbar-default">
            <div class="container-fluid"> 
              Brand and toggle get grouped for better mobile display
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed hidden-xs hidden-sm" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <a class="navbar-brand" href="#"><img src="images/logo.gif" alt="" width="90"></a> </div>
              
              Collect the nav links, forms, and other content for toggling
              <div class="collapse navbar-collapse hidden-xs hidden-sm" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="#">MY TRANSACTION</a></li>
                  <li><a href="#">MY QUERY</a></li>
                  <li><a href="#">MY OVERLAY</a></li>
                  <li><a href="#">MY PROFILE</a></li>
                  <li><a href="#">MY ACCESS</a></li>
                </ul>
              </div>
              /.navbar-collapse 
            </div>
            /.container-fluid 
          </nav>
        </header>
         -->
        <!--Header End--> 
        
        <!--Body Text Start-->
        
        <div class="container-fluid">
          <div class="row"> 
            <!--Breadcrumb Start-->
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-xs hidden-sm">
              <div class="row">
                <ol class="breadcrumb">
                  <li><a href="index.html">HOME</a></li>
                  <li><a href="login-from-host.html">Dashboard</a></li>
                  <li><a href="login-from-platform.html">User Management</a></li>
                  <li class="active">User Account</li>
                </ol>
              </div>
            </div>
            <!--Breadcrumb End-->
            
            <div class="container">
              <div class="row"> 
                <!--Left Navigation Start-->
                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 service-tabs">
                 <%--  <section class="white pad-null">
                    <ul>
                      <li class="active"><a href="#">${menuname} </a></li>
                       <c:forEach items="${loginData.menuDetails}" var="catLevel1">
                      <li ><a href="user-login-creation.html">${catLevel1.menuName}</a></li>

                                  </c:forEach>
                    </ul>
                  </section> --%>
                  <tiles:insertAttribute name="menu1" />
                  
                </div>
                <!--Left Navigation End--> 
                
                <!--Right Container Start-->
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <!--   <section class="white">
                    <div class="heading-inner">
                      <h1>User Login Creation</h1>
                      <div class="clearfix"></div>
                      <hr>
                    </div>
                    <div class="row">
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <select class="form-control">
                          <option>* Host Name</option>
                        </select>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <select class="form-control">
                          <option>* Role Type</option>
                        </select>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Name</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Nick Name</label>
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
                          <label>* Mobile Number</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Alternate Mobile Number</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* User Login</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Create Password</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="styled-input">
                          <input type="text" required />
                          <label>* Confirm Password</label>
                          <span></span> </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                        <button type="submit" class="btn btn-warning">Submit</button>
                      </div>
                    </div>
                  </section> -->
                  <tiles:insertAttribute name="body1" />
                </div>
                <!--Right Container End--> 
              </div>
            </div>
          </div>
        </div>
        
        <!--Body Text End--> 
        
        <!--Footer Start-->
        <div class="clearfix"></div>
      <%--   <footer>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
            <form class="form-inline">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subscribe for Newsletter">
              </div>
              <button type="submit" class="btn btn-default">SUBMIT</button>
            </form>
          </div>
          <div class="clearfix"></div>
          <hr>
          <div class="clearfix"></div>
          <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
              <ul>
                <li class="heading">MULAH</li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Services Provided</a></li>
                <li><a href="#">Career</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
              <ul>
                <li class="heading">HELP &amp; SUPPORT</li>
                <li><a href="#">Faq</a></li>
                <li><a href="#">Support</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
              <ul>
                <li class="heading">POLICIES</li>
                <li><a href="#">Terms &amp; Conditions</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Legalities</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
              <ul>
                <li class="heading">Contact</li>
                <li class="social"><img src="images/instagram.png" alt=""><img src="images/facebook.png" alt=""><img src="images/twitter.png" alt=""></li>
                <li class="heading">GET THE APP</li>
                <li class="app"><img src="images/android.png" alt=""><br>
                  <img src="images/apple.png" alt=""></li>
              </ul>
            </div>
          </div>
        </footer> --%>
        <!--Footer End--> 
        <tiles:insertAttribute name="footer1" />
        
      </div>
    </div>
  </div>
  <!-- /#page-content-wrapper --> 
  
</div>



<%-- </form:form> --%>

</body>
</html>