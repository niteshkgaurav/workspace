<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<html>  
 <head>  
  <title>Fare Management</title>  
 </head> 

 <script type="text/javascript" src="//code.jquery.com/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addFare.js"></script>
  <script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
  
<!-- <script type="text/javascript">
$(window).load(function(){
	$(document).ready(function() {
	    $("#fareForm").validate({
	        rules: {		    	
	            "minDistance": {
	            	required:true,
	                number:true,
	                minlength: 1,
	                maxlength: 4
	            },
	            "maxDistance": {
	                required:true, 
	                number:true,
	                minlength: 1,
	                maxlength: 5
	            }
	        },
	        messages: {        	
	            "minDistance": {
	                required: "Minimum distance is required!",
	                minlength: "Must enter at least some value"
	            },
	            "maxDistance": {
	                required: "Maximum distance is required",
	                minlength: "Must enter at least some value "
	            }
	        },
	        submitHandler: function (form) {
	             form.submit(); // <-- this is default
	             //alert("valid form");
	        }
	    });
	    
	});
});

</script>
<script type="text/javascript">
	function ShowHideDistance()
	{
		
		var fareType=$("#fareType").val().trim();
		//alert("fareType : " + fareType);
		if(fareType=="Fixed")
			{	
				 $('#minDistance').prop('disabled', true);
				 $('#maxDistance').prop('disabled', true);
				 
			}
		else{
			 $('#minDistance').prop('disabled', false);
			 $('#maxDistance').prop('disabled', false);
		}
	}
</script> -->
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
 <body>
	  <div id="mainbody" class="container-fluid" >
	  <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	  <div class="heading-inner">
					          <h1>Add Fare Data  </h1>
					          <div class="clearfix"></div>
					          	<hr>
					          	<div align="center" id="msgDiv_Id">
					          	<span id="mssg" > ${status }</span>
					          	</div>
					          	
					        </div></div>
	  <form:form method="post" id="fareForm" name="fareForm"  modelattribute="fareForm" action="${pageContext.request.contextPath}/AdminUI/fare/saveFare" >
	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
	       
	  	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	  	 <div id="div_busServiceType" class="styled-input">
		  	<form:hidden path="fdId" value="${fare.fdId}" readonly="true" />
			  		<form:label class="valid" path="busServiceType" >Service Type:</form:label>
					<form:select path="busServiceType"  class="selecttag" onclick="hideMsg();removeHasError('div_busServiceType');hideMessage()">
					<form:option value="" label="" />
						<form:options items="${busServiceTypeList}"  />
					</form:select>
				<form:errors path="busServiceType" generated="true" cssClass="error"/>
				</div>
				 </div>	
				   
		
	      	   
		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				   <div id="div_fareType" class="styled-input">
				   
				<form:label   class="valid" path="fareType"  >Fare Type: </form:label>
				<form:select  id="fareType" path="fareType" class="selecttag" onchange="conditions()"  onclick="this.setAttribute('value', this.value);removeHasError('div_fareType');hideMsg()" value="" >
						<form:option value="" label="" />
						<form:options items="${fareTypeList}"  />
					</form:select>
				<form:errors path="fareType" generated="true" cssClass="error"/>		
		   </div>           
					           
	      </div>
	<!-- 	minimum distance -->
		 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div id="minDistance_DivId" class="styled-input">
						<form:input id="minDistance" path="minDistance" maxlength="6"   class="selecttag" onchange="selecttag('minDistance_lblId','minDistance');" 
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
			      
		
		 
      
		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				   <div id="div_passengerType" class="styled-input">
					<form:label class="valid" path="passengerType">Passenger Type:</form:label>
				<form:select  id="passengerType" path="passengerType"  class="selecttag" 
				onclick="removeHasError('div_passengerType');this.setAttribute('value', this.value)" value="">
				<form:option value="" label="" />
					<form:options items="${passengerTypeList}"  />
				</form:select>
		   <form:errors path="passengerType" generated="true" cssClass="error"/>
		   </div>           
					           
	      </div>
		  
		  	
		    
		  
				<div class="col-xs-12 col-sm-12 col-sm-6 col-md-6 col-lg-6">
				 <div id="div_fareStatus" class="styled-input">
				 <form:label class="valid" path="fareStatus">Fare Status</form:label>
				 <form:select id="fareStatus"
				         class="valid" path="fareStatus" onclick="removeHasError('div_fareStatus')">
				       <form:option value="" label=" " />
				       	<form:option value="1" label="Active" />
				        <form:option value="0" label="Expired" />
				        <form:option value="2" label="Not Active" />
				      </form:select>
				     <form:errors path="fareStatus" generated="true" cssClass="error"/>
				 </div>	 
				  </div>	 
				  
				  
		   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id='fareAmountId'>
		     <div id="div_fareAmount" class="styled-input">
		    <form:label  class="valid" path="fareAmount" >Fare Amount:</form:label>
		    <form:input path="fareAmount" class="selecttag" type="text" id="fareAmount" placeholder="Fare Amount" size="15" maxlength="5"  onkeypress="onlyNumric(event,'qwerty')" onclick="removeHasError('div_fareAmount')" />
		<form:errors path="fareAmount" generated="true" cssClass="error"/>
		 </div>
		  </div>
		  
		   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					                    <div id="DivStartDate" class="styled-input">
					                       <div class="input-group date datetimepicker1" >
					                         <form:input id="startDate" path="startDate"  
					                         type="text"  class="selecttag" 
					             				 onfocus="removeHasError('DivStartDate');selecttag('labelStartDate','startDate')"
					             				onclick="emptyerror(event,'startDateError');showlabel('labelStartDate','startDateError');selecttag('labelStartDate','startDate')" />
					                        	<label id="labelStartDate" class="valid">Start Date:</label>
					                         	<label id="startDateError" class="collapse"></label>
					                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelStartDate');"></i> </i>
					                       </div>
					                     </div> 
					                     
					           </div>	
				  
				 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mt ">
			 	<input type="submit" value="Submit" class="btn btn-primary" id="submit" onclick="myValidations(event)"/>
			 	
		  </div>	  	  	 		  	  
  		  	   
  		  	  	
  		  	  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning"/>
	      <!--  <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"/> -->
	       </div>		   
	                        
	  </form:form>
	    </div>
		 <c:if test="${!empty fares}">
		  <div class="heading-inner">
					          <h2>Fare Listing</h2>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
		 	
			<div class="table-responsive">
			<div class="transaction-table">
				<table  class="table table-bordered table-striped" id="table_id" >
				<thead>
					<tr>
					 <th class="th">Service Type</th>
					 <th class="th">Fare Type</th>
					 <th class="th">Min Distance</th>  
					 <th class="th">Max Distance</th> 
	  				 <th class="th">Passenger Type</th>
	  				 <th class="th">Fare Amount</th> 
	  				 <th class="th">Fare Status</th>  
				     <th class="th">Actions</th>
					</tr>
				</thead>
					<c:forEach items="${fares}" var="fare">
						 <tr>
						  <td><c:out value="${busServiceTypeList[fare.busServiceType]}"/></td> 
						  <td><c:out value="${fareTypeList[fare.fareType]}"/></td>  
						  <td><c:out value="${fare.minDistance}"/></td>
						  <td><c:out value="${fare.maxDistance}"/></td>	
						  <td><c:out value="${fare.passengerType}"/></td>
						  <td><c:out value="${fare.fareAmount}"/></td>			
						  <td><c:out value="${fare.fareStatus}"/></td>
						  
						  	
						  <c:if test="${fare.fareStatus==1}"> 
						  <td align="center"><a href="editFare?fdId=${fare.fdId}&action=Deactivate">Deactivate</a> </td>
						  </c:if>
						  <c:if test="${fare.fareStatus==2}">
						  <td align="center"><a href="editFare?fdId=${fare.fdId}&action=Activate">Activate</a></td>
						  </c:if>
						 </tr>
					</c:forEach>
				   	
				  </table>
			</div>
		</div>
		</c:if>
	</div>	 
	
	
 </body>  
 <script>
function hideMsg(){
	$('#msgDiv_Id').hide();
}
 </script>
 
<!--  <script>
  </script> -->
 
 <script>
 $(document).ready(function(){
	$('#minDistance_DivId').hide(); 
	$('#maxDistance_DivId').hide();
	$('#div_fareAmount').hide();
	 
 });
 
 </script>
 
 
</html>