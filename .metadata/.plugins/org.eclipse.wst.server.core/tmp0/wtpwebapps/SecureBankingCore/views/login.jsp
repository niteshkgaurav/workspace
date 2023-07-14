<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.loginpage.title.admin" /></title>
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link href=${pageContext.request.contextPath}/css/bootstrap.css
	rel="stylesheet">
<link href=${pageContext.request.contextPath}/css/style.css
	rel="stylesheet">
	<script src=${pageContext.request.contextPath}/js/jquery-1.11.3.min.js></script>
	<script src=${pageContext.request.contextPath}/js/bootstrap.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/json.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/login.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script src=${pageContext.request.contextPath}/js/custom.js></script>
 <script type="text/javascript">
	
	$(document).ready(function() {
	
		$('#username').val('');
		$('#password').val('');
	});
	
  </script>
  

</head>
<body>

	<form:form id="adminForm" method="post" modelAttribute="loginData"
		action="${pageContext.request.contextPath}/AdminUI/login/validateAccount">
		<div id="wrapper">
			<!-- Page Content -->
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<div class="row">

						<!--Header Start-->
						<header>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="login-details">
									<ul>
										<li>
											<!-- <img src="images/wallet.png" alt=""><span
											class="hidden-xs hidden-sm">My Wallet :</span>&#8377;2000 -->
										</li>
										<li class="hidden-xs hidden-sm">
											<!-- <img
											src="images/user.png" alt=""><a href="#">User</a> -->
										</li>
										<li class="hide">
											<!-- <a href="#">Login</a> -->
										</li>
										<li>
											<!-- <a href="#">Logout</a> -->
										</li>
									</ul>
								</div>
							</div>
							<!-- <a class="menu" id="menu-toggle" href="javascript:void(0);"
								title="Menu"><span></span></a> -->
							<nav class="navbar navbar-default">
								<div class="container-fluid">
									<!-- Brand and toggle get grouped for better mobile display -->
									<div class="navbar-header">
										
										<a class="navbar-brand" href="#"><img
											src="images/logo.gif" alt="" width="90"></a>
									</div>

									<!-- Collect the nav links, forms, and other content for toggling -->
									<div class="collapse navbar-collapse hidden-xs hidden-sm"
										id="bs-example-navbar-collapse-1">
										<ul class="nav navbar-nav navbar-right">
											
										</ul>
									</div>
									<!-- /.navbar-collapse -->
								</div>
								<!-- /.container-fluid -->
							</nav>
						</header>

						<!--Header End-->

						<!--Body Text Start-->

						<div class="container-fluid">
							<div class="row">
								<!--Breadcrumb Start-->
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="successMessageID" >
										<div   class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
	                                      <font color="red">${statusMessage}</font>        
										</div> 
										<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
	                                         <b><font color="green">${successMessage}</font></b>	
								</div>
								</div>
								<!--Breadcrumb End-->
								

								<!--Login Form Start-->
								<div
									class="col-xs-12 col-sm-12 col-md-4 col-md-offset-4 col-lg-6 col-lg-offset-3">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<h3>Welcome User</h3><br><br>
										</div>

										<!-- <div
											class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
											<h2 class="main-heading">Sign in to Continue</h2>
										</div> -->
										
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			<div id="divID_loginType" class="styled-input">
				<form:select  path="loginType" class="selecttag" onfocus="removeHasError('divID_loginType')"
					onclick="this.setAttribute('value', this.value);" value="">
					 	<form:option value="2" label="Platform" />
             			<form:option value="3" label="Merchant" />
				</form:select>
				<label id="label_loginType"class="valid">Login As</label> 
				<label id="loginTypeErrorId" class="collapse"></label>
			</div>
		</div>					
										
										
										
										
										
										
										
										
										
										
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											
								<c:if test="${userLoginStatus!='' && userLoginStatus == '0'}">
									<c:set var="username" scope="session" value=""/>
									<c:set var="password" scope="session" value=""/>
								</c:if>
											<div id="div_username" class="styled-input">
												<form:input type="text" class="selecttag" id="username" path="username"
													name="username"  onfocus="removeHasError('div_username')"
													onclick="removeMessage();usererrormessage(event);" autocomplete="off"/>
												<label id="username1" class='valid'>User Name</label>
												<label id="div_userNameErrorId" class="collapse"></label>
												<label id="userNameErrorId" ></label>
												
												 <span></span>
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div id="div_password" class="styled-input">
												<form:input type="password" id="password" class="selecttag" path="password" name="password"
													onclick="usererrormessage(event); removeMessage();" 
													autocomplete="off" onfocus="removeHasError('div_password')"/>
												<label id="password1"  class='valid'>Password</label> <span></span>
											</div>
										</div>
										<div
											class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right mt mb">
											<a href="${pageContext.request.contextPath}/AdminUI/UserMgmt/forgetPassword" onclick="return validateForgotPassword();" tabindex="1" class="forgot-url">Forgot
												Password?</a>
										</div>
										
										<div class=" col-xs-6 col-sm-6 col-md-6 col-md-offset-5 col-lg-6 mb">
											<button type="submit" class="btn btn-warning btn-block" onclick="return validateUser()">Login</button>
										</div>
										
									</div>
								</div>
								<!--Login Form End-->

						</div>

						<!--Body Text End-->

						<!--Footer Start-->
						<div class="clearfix"></div>
						<footer>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
								<form class="form-inline">
									<div class="form-group">
										<!-- <input type="text" class="form-control"
											placeholder="Subscribe for Newsletter"> -->
									</div>
									<!-- <button type="submit" class="btn btn-default">SUBMIT</button> -->
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
										<li class="social"><img src="images/instagram.png" alt=""><img
											src="images/facebook.png" alt=""><img
											src="images/twitter.png" alt=""></li>
										<li class="heading">GET THE APP</li>
										<li class="app"><img src="images/android.png" alt=""><br>
											<img src="images/apple.png" alt=""></li>
									</ul>
								</div>
							</div>
						</footer>
						<!--Footer End-->

					</div>
				</div>
			</div>
		</div>

		<!-- Menu Toggle Script -->
		<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
		$(this).toggleClass("menu-active");
    });
    </script>





	</form:form>

</body>
</html>