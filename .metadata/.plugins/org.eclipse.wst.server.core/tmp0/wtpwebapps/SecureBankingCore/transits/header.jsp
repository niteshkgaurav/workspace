
        <!--Header Start-->
        <!DOCTYPE html>
<html>
    <head>
      <link href=${pageContext.request.contextPath}/css/bootstrap.css rel="stylesheet"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
	<meta name="author" content="Codrops" />
  
    </head>
       <body>
        <header>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="login-details">
              <ul>
                <li class="hidden-xs hidden-sm"><img src="/Transits/images/user.png" alt=""><a href="#"> ${loginData.username} </a></li>
                <li class="hide"><a href="#">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminUI/login/logout">Logout</a></li>
              </ul>
            </div>
          </div>
          <a class="menu" id="menu-toggle" href="javascript:void(0);" title="Menu"><span></span></a>
          <nav class="navbar navbar-default">
            <div class="container-fluid"> 
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed hidden-xs hidden-sm" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <a class="navbar-brand" href="#"><img src="/Transits/images/logo.gif" alt="" width="90"></a> </div>
              
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
 
 
 
 
 
 
 
 
 