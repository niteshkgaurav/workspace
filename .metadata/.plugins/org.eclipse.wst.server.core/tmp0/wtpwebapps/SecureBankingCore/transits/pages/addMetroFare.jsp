<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<html>  
 <head>  
  <title>Metro Fare Management</title>  
 </head> 

 <script type="text/javascript" src="//code.jquery.com/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addFare.js"></script>
  <script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
  
 <script>
$(function () {
	
	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 //maxDate : 'now',
            useCurrent: false,

      });
		
	});
</script>



<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script>
$(document).ready(function() {
	  $('#table_id').DataTable({
	        "scrollY":        "400px",
	        "scrollCollapse": true,
	        "paging":         true,
	        "pagingType": "simple_numbers"
	  });
	  
} );

</script>
<script>
function hideMsg(){
	$('#mssg').hide();
}
</script>
 <body>
	  <div id="mainbody" class="container-fluid" >
	  <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	  <div class="heading-inner">
					          <h1>Add Metro Fare Data  </h1>
					          <div class="clearfix"></div>
					          	<hr>
					          	<div align="center" id="msgDiv_Id">
					          	<span id="mssg" > ${msg}</span>
					          	</div>
					          	
					        </div></div>
					        
					        
	  <form:form method="post" id="fareForm" name="fareForm"  modelAttribute="fares" action="${pageContext.request.contextPath}/AdminUI/metroController/fare" >
   
	      
	<!-- 	minimum distance -->
		 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="minDistance_DivId" class="styled-input">
						<form:input id="minDistance" path="minDistance" maxlength="6"  onclick="hideMsg()" class="selecttag" onchange="selecttag('minDistance_lblId','minDistance');" 
						 	onfocus="removeHasError('minDistance_DivId');showlabel('minDistance','minDistance_lblErrorId')" onkeypress="onlyNumric(event,'qwerty')" size="3" value="" readonly="false"  />
						 <label id="minDistance_lblId" class="valid">*Minimum Distance(kms)</label>
						 <label id="minDistance_lblErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			      
			      
			       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="maxDistance_DivId" class="styled-input">
						<form:input id="maxDistance" path="maxDistance" maxlength="6"   class="selecttag" onchange="selecttag('maxDistance_lblId','maxDistance');" 
						 	onfocus="removeHasError('maxDistance_DivId');showlabel('maxDistance','maxDistance_lblErrorId')" onkeypress="onlyNumric(event,'qwerty')" size="3" value="" readonly="false"  />
						 <label id="maxDistance_lblId" class="valid">*Maximum Distance(kms)</label>
						 <label id="maxDistance_lblErrorId" class="collapse"></label>
						 <span></span> 
						</div>	      	
			      </div>
			
				  
		   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id='fareAmountId'>
		     <div id="div_fareAmount" class="styled-input">
		    <form:label  class="valid" path="fareAmount" >Fare Amount:</form:label>
		    <form:input path="fareAmount" class="selecttag" type="text" id="fareAmount" placeholder="Fare Amount" size="15" maxlength="5"  onkeypress="onlyNumric(event,'qwerty')" onclick="removeHasError('div_fareAmount')" />
		<form:errors path="fareAmount" generated="true" cssClass="error"/>
		 </div>
		  </div>
		  
		 <%--   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					                    <div id="DivStartDate" class="styled-input">
					                       <div class="input-group date datetimepicker1" >
					                         <form:input id="startDate" path="fareCreatedDate"  
					                         type="text"  class="selecttag" 
					             				 onfocus="removeHasError('DivStartDate');selecttag('labelStartDate','startDate')"
					             				onclick="emptyerror(event,'startDateError');showlabel('labelStartDate','startDateError');selecttag('labelStartDate','startDate')" />
					                        	<label id="labelStartDate" class="valid">Created Date:</label>
					                         	<label id="startDateError" class="collapse"></label>
					                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelStartDate');"></i> </i>
					                       </div>
					                     </div> 
					                     
					           </div> --%>	
				  
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		            <button type="submit" onclick="return validate(event);" class="btn btn-warning">Submit</button>
		          </div>	  	  	 		  	  
  		  	                 
	  </form:form>
	    </div>

	</div>	 
	
	
 </body>  
 <script>
function hideMsg(){
	$('#msgDiv_Id').hide();
}
 </script>
 
<!--  <script>
  </script> -->
 
 
 
 
</html>