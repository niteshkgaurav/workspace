
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Mulah</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.loginpage.title.admin" /></title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />

<!-- Bootstrap -->
<link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css rel="stylesheet">
 <script src=${pageContext.request.contextPath}/js/jquery.min.js></script>
<script src=${pageContext.request.contextPath}/js/bootstrap.min.js></script>
<script src=${pageContext.request.contextPath}/js/custom.js></script>  
<script src=${pageContext.request.contextPath}/js/sessionTimeout.js></script> 

<!--  <script src=${pageContext.request.contextPath}/js/jquery-1.12.4.js></script>  -->
 <style>
.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('${pageContext.request.contextPath}/images/loader.gif') 50% 50% no-repeat rgb(249,249,249);
    opacity: .9;
}
</style>
<script type="text/javascript">

setTimeout(function(){  $(".loader").fadeOut("slow"); }, 500);

$(window).load(function() {
    $(".loader").fadeOut("slow");
}); 
</script>

</head>
<body>

<div class="loader"></div> 
<div id="wrapper"> 
  <!--Hamburger Menu-->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li><a href="#">About Us</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Faqs</a></li>
      <li><a href="#">Contact</a></li>
      <div class="hidden-md hidden-lg">
       <ul>
        <li><a href="#">MY TRANSACTION</a></li>
        <li><a href="#">MY QUERY</a></li>
        <li><a href="#">MY OVERLAY</a></li>
        <li><a href="#">MY PROFILE</a></li>
        <li><a href="#">MY ACCESS</a></li>
	    </ul>      
      </div>
    </ul>
  </div>
  <div class="clearfix"></div>
  <!-- /#Hamburger Menu --> 
  <div class="modal fade" id="session-expired-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Session Expired</h4>
                </div>
                <div class="modal-body">
                    Your session has been expired.
                </div>
                <div class="modal-footer">
                    <button id="btnExpiredOk" onclick="sessLogOut()" type="button" class="btn btn-warning" data-dismiss="modal" style="padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: normal; border: 1px solid transparent; border-radius: 4px; background-color: #428bca; color: #FFF;">Ok</button>
                </div>
            </div>
        </div>
    </div>
  <!-- Page Content -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <div class="row"> 
        <tiles:insertAttribute name="header" />
       
       <div class="container-fluid">
     
     
           <div class="row"> 
          <!-- Breadcrumb Start -->  
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-xs hidden-sm">
              <div class="row">
                <ol class="breadcrumb">
                  <li><a href="${pageContext.request.contextPath}/AdminUI/login/layoutUser">Dashboard</a></li>
                  
                  
                  <li class="active">Welcome to Nextgen</li>
                </ol>
              </div>
            </div>
        <!--     Breadcrumb End--> 
            
            <div class="container">
              <div class="row"> 
             <!--    Left Navigation Start -->
                 <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 service-tabs">
                
                  <tiles:insertAttribute name="menu" />
                </div> 
                
            
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                 <section class="white">
                    <div class="heading-inner">
                      <div class="clearfix"></div>
                      <tiles:insertAttribute name="body" />
                      <hr>
                    </div>
                 
                  </section>
                  
                </div> 
                
              <!--   Right Container End  -->
              </div>
            </div>
          </div>
        </div>
        
        <!--Body Text End--> 
        
        <!--Footer Start-->
        <div class="clearfix"></div>
   
        <tiles:insertAttribute name="footer" />
      </div>
    </div>
  </div>
  <!-- /#page-content-wrapper --> 
  
</div>

</body>


</html>


























