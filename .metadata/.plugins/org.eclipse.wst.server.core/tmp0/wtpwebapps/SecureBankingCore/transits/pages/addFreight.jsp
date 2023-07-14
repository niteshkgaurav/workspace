<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pg" uri="http://pagination/pagination-spring3.tld" %>
<html>  
 <head>   
  <title>Freight Management</title>  
  
	 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
		rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/css/style.css"
		rel="stylesheet"/>
	<link rel="stylesheet" type="text/css"
		href=${pageContext.request.contextPath}/css/datepicker.min.css />  
		
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js"></script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>



 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addFreight.js"></script>
 		
 <script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script> 		
 		
 </head> 


 
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
<script type="text/javascript">
$(window).load(function(){
	$(document).ready(function() {
	    
	    $("#freightForm").validate({
	    	
	        rules: {
	            "freightCode": {
	                required: true,
	                minlength: 2,
	                maxlength: 15
	            },
	            "freightDesc": {
	                required: true,
	                minlength: 5,
	                maxlength: 250
	            }
	        },
	        messages: {
	            "freightCode": {
	                required: "Freight Code is required!",
	                minlength: "Freight code must be at least 2 characters long"
	            },
	            "freightDesc": {
	                required: "Freight description is required",
	                minlength: "Freight description must be at least 5 characters long"
	            }
	        },
	        submitHandler: function (form) {
	        	//alert("submitting form");
	        	form.submit(); // <-- this is default
	            // alert('valid form');
	        }
	    });
	    
	});
});
</script>

<script type="text/javascript">
	function ShowHideFCB()
	{
		//alert("Called js");
		var freightChargeBy=$("#freightChargeBy").val().trim();
		var freightChargeType = $("#freightChargeType").val().trim();
		
		alert("freightChargeBy : " + freightChargeBy);
		alert("freightChargeType : " + freightChargeType);

		if(freightChargeBy=="By Weight"  && freightChargeType==""){
			alert("freightChargeBy : " + freightChargeBy);
			//alert("freightChargeType : " + freightChargeType);
			$('#freightWeightMin').prop("hidden", false);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", true);
			$('#freightDistanceMin').prop("hidden", true);
			$('#freightDistanceMax').prop("hidden", true);
			$('#freightChargeType').prop("disabled", false);
			document.getElementById('lblFreightChargeFix').innerHTML = 'Freight Charge';			
		}
		else if(freightChargeBy=="By Distance" && freightChargeType==""){
			alert("freightChargeBy : " + freightChargeBy);
			//alert("freightChargeType : " + freightChargeType);
			$('#freightWeightMin').prop("hidden", true);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", true);
			$('#freightDistanceMin').prop("hidden", false);
			$('#freightDistanceMax').prop("hidden", true);
			$('#freightChargeType').prop("disabled", false);			
			document.getElementById('lblFreightChargeFix').innerHTML = 'Freight Charge';			
		}
		else if(freightChargeBy=="By Space" ){
			alert("freightChargeBy : " + freightChargeBy);
			//alert("freightChargeType : " + freightChargeType);
			$('#freightWeightMin').prop("hidden", true);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", true);
			$('#freightDistanceMin').prop("hidden", true);
			$('#freightDistanceMax').prop("hidden", true);			
			var freightChargeType = document.getElementById("freightChargeType");
			
			for (var i = 0; i < freightChargeType.options.length; i++) {
				if(freightChargeType.options[i].value=="Fixed")
				//freightChargeType.options[i].defaultSelected = i == country.selectedIndex;
					freightChargeType.options[i].defaultSelected=i;
			}		
			// $("#countrfreightChargeTypey").val("Fixed");
			$('#freightChargeType').prop("disabled", true);
			document.getElementById('lblFreightChargeFix').innerHTML = 'Freight Charge';			
		}		
		else if(freightChargeBy=="By Weight" && freightChargeType=="Fixed With Recurring" )
			{	
				alert("freightChargeBy : " + freightChargeBy);
				alert("freightChargeType : " + freightChargeType);
					$('#freightWeightMin').prop("hidden", false);
					$('#freightWeightMax').prop("hidden", false); 
					$('#freightChargeFix').prop("hidden", false);
					$('#freightChargeRepeat').prop("hidden", false);
					$('#freightDistanceMin').prop("hidden", true);
					$('#freightDistanceMax').prop("hidden", true);		
					$('#freightChargeType').prop("disabled", false);					
					document.getElementById('lblFreightChargeFix').innerHTML = 'Fixed Charge';
					document.getElementById('lblFreightChargeMax').innerHTML = 'Recurring Charge';
					document.getElementById("lblFreightWeightMin").innerHTML = 'Fixed Weight';
					document.getElementById("lblFreightWeightMax").innerHTML = 'Recurring Weight';				 
				 
			}
			else if(freightChargeBy=="By Weight" && freightChargeType=="Range")
			{
				alert("freightChargeBy : " + freightChargeBy);
				alert("freightChargeType 2 : " + freightChargeType);
				$('#freightWeightMin').prop("hidden", false);
				$('#freightWeightMax').prop("hidden", false); 
				$('#freightChargeFix').prop("hidden", false);
				$('#freightChargeRepeat').prop("hidden", true);
				$('#freightDistanceMin').prop("hidden", true);
				$('#freightDistanceMax').prop("hidden", true);
				$('#freightChargeType').prop("disabled", false);
				document.getElementById('lblFreightChargeFix').innerHTML = 'Charge';
				document.getElementById("lblFreightWeightMin").innerHTML = 'Min Weight';
				document.getElementById("lblFreightWeightMax").innerHTML = 'Max Weight';	
			}
			else if(freightChargeBy=="By Weight" && freightChargeType=="Recurring")
			{
				alert("freightChargeBy : " + freightChargeBy);
				alert("freightChargeType 1: " + freightChargeType);	
				$('#freightWeightMin').prop("hidden", false);
				$('#freightWeightMax').prop("hidden", true); 
				$('#freightChargeFix').prop("hidden", false);
				$('#freightChargeRepeat').prop("hidden", true);
				$('#freightDistanceMin').prop("hidden", true);
				$('#freightDistanceMax').prop("hidden", true);	
				$('#freightChargeType').prop("disabled", false);				
				document.getElementById('lblFreightChargeFix').innerHTML = 'Recurring Charge';
				document.getElementById("lblFreightWeightMin").innerHTML = 'Recurring Weight';			
			}		
		else if((freightChargeBy=="By Distance" || freightChargeBy=="By Weight") && freightChargeType=="Fixed")  
			{	
				alert("freightChargeBy : " + freightChargeBy);
				alert("freightChargeType : " + freightChargeType);
				$('#freightWeightMin').prop("hidden", true);
				$('#freightWeightMax').prop("hidden", true); 
				$('#freightChargeFix').prop("hidden", false);
				$('#freightChargeRepeat').prop("hidden", true);
				$('#freightDistanceMin').prop("hidden", true);
				$('#freightDistanceMax').prop("hidden", true);
				$('#freightChargeType').prop("disabled", false);
				document.getElementById('lblFreightChargeFix').innerHTML = 'Freight Charge';
			}
		else if(freightChargeBy=="By Distance" && freightChargeType=="Fixed With Recurring" )
		{
			alert("freightChargeBy : " + freightChargeBy);
			alert("freightChargeType : " + freightChargeType);
			
			$('#freightWeightMin').prop("hidden", true);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", false);
			$('#freightDistanceMin').prop("hidden", false);
			$('#freightDistanceMax').prop("hidden", false);
			$('#freightChargeType').prop("disabled", false);			
			document.getElementById('lblFreightChargeFix').innerHTML = 'Fixed Charge';
			document.getElementById("lblFreightDistanceMin").innerHTML = 'Fixed Distance';
			document.getElementById('lblFreightChargeMax').innerHTML = 'Recurring Charge';
			document.getElementById("lblFreightDistanceMax").innerHTML = 'Recurring Distance';				
		}
		else if(freightChargeBy=="By Distance" && freightChargeType=="Range")
		{
			alert("freightChargeBy : " + freightChargeBy);
			alert("freightChargeType : " + freightChargeType);
			
			$('#freightWeightMin').prop("hidden", true);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", true);
			$('#freightDistanceMin').prop("hidden", false);
			$('#freightDistanceMax').prop("hidden", false);	
			$('#freightChargeType').prop("disabled", false);			
			document.getElementById('lblFreightChargeFix').innerHTML = 'Charge';
			document.getElementById("lblFreightDistanceMin").innerHTML = 'Min Distance';
			document.getElementById("lblFreightDistanceMax").innerHTML = 'Max Distance';
		}
		else if(freightChargeBy=="By Distance" && freightChargeType=="Recurring")
		{
			alert("freightChargeBy : " + freightChargeBy);
			alert("freightChargeType : " + freightChargeType);
			
			$('#freightWeightMin').prop("hidden", true);
			$('#freightWeightMax').prop("hidden", true); 
			$('#freightChargeFix').prop("hidden", false);
			$('#freightChargeRepeat').prop("hidden", true);
			$('#freightDistanceMin').prop("hidden", false);
			$('#freightDistanceMax').prop("hidden", true);	
			$('#freightChargeType').prop("disabled", false);			
			document.getElementById('lblFreightChargeFix').innerHTML = 'Recurring Charge';
			document.getElementById("lblFreightDistanceMin").innerHTML = 'Recurring Distance';			
		}

	}
		
</script>

<script>
$(document).ready(function(){
	$('#table_id').Datatable({
		"scrollY":"200px",
		"scrollCollapse":true,
		"paging":true,
		"pagingType":"simple_numbers"
	});
});
</script>	  

 <body>
  <div id="mainbody" class="container-fluid" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<section class="white">
							<div class="heading-inner">
					          <h1>Add Freight Type </h1>
					          <div class="clearfix"></div>
					          	<hr>
					        </div>
					        <div class="row">
					        	<form:form method="POST" id="freightForm" name="freightForm" action="${pageContext.request.contextPath}/AdminUI/fright/saveFreight" >
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="div_freightCode">
						                  <form:input path="freightCode"  size="15" value="${freight.freightCode}" readonly="false"  onclick="removeHasError('div_freightCode')" />
						                  <label id="lblFreightCode" class="valid">* Freight Code</label>
						                  <form:errors path="freightCode" generated="true" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input" id="div_freightDesc">
						                  <form:input path="freightDesc"  size="250" value="${freight.freightDesc}" readonly="false" multiline="true"  onclick="removeHasError('div_freightDesc')" />
						                  <label id="lblFreightDesc" class="valid">* Freight Description</label>
						                  <form:errors path="freightDesc" generated="true" class="collapse" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
					              
					              
					              
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
							       <div id="div_freightChargeBy" class="styled-input">				                
									<form:select id="freightChargeBy" path="freightChargeBy" title="Freight Charge By"  onclick="removeHasError('div_freightChargeBy')" onChange="ShowHideFCB();">
										<form:option selected="${freight.freightChargeBy}"  value="${freight.freightChargeBy}">
										</form:option>
										<%-- <form:option value="">Select One</form:option>   --%>    		            
										<form:options items="${freightChargeByList}"  />
									</form:select>
									<label id="lblChargeById" class="valid">* Charge By</label>
									<label id="lblChargeByErrorId" class="valid"></label>
							      </div>
							      </div>
							      					              
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
							       <div id="divFreightChargeType" class="styled-input">						                
									<label id="lblChargeType" class="valid">* Charge Type</label>
									<label id="lblChargeTypeErrorId" class="collapse"></label>
									<form:select  id="freightChargeType" path="freightChargeType" title="Freight Charge Type" onChange="ShowHideFCB();"  onclick="removeHasError('divFreightChargeType')">
										<form:option selected="${freight.freightChargeType}"  value="${freight.freightChargeType}">
										</form:option>
										<form:option value="">Select Freight Charge Type</form:option>      		            
										<form:options items="${freightChargeTypeList}"  />
									</form:select>
							      </div>
							      </div>
							      
							      
						      
							      
							      
							      
							       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
							       <div id="div_freightChargeOn" class="styled-input">						                
									<label id="lblChargeOn" class="valid">* Charge On</label>
									<label id="lblChargeOnErrorId" class="valid"></label>									
									<form:select  id="freightChargeOn" path="freightChargeOn" title="Freight Charge On" onChange="ShowHideFCO()" onclick="removeHasError('div_freightChargeOn')">
										<form:option selected="${freight.freightChargeOn}"  value="${freight.freightChargeOn}">
										</form:option>
										<%-- <form:option value="">Charge On</form:option> --%>	            
										<form:options items="${freightChargeOnList}"  />
									</form:select>

							      </div></div>
							      							      
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightChargeTkt">
						                <div class="styled-input">
						                  <form:input path="freightChargeFix"  size="5" onkeypress="onlyNumric(event,'qwerty')" value="${freight.freightChargeFix}" title="Freight Charge" readonly="false" />
						                  <label id="lblFreightChargeFix" class="valid">* Freight Charge</label>
						                  <label id="FreightChargeFixErrorId" class="collapse"></label>
						                  <%-- <form:errors path="freightChargeFix" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					              </div>
					              
						        <%--  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightChargeRepeat">
						                <div class="styled-input">
						                  <form:input path="freightChargeRepeat"  size="5" value="${freight.freightChargeRepeat}" readonly="false" />
						                  <label id="lblFreightChargeMax" class="valid">* Freight Charge </label>
						                  <form:errors path="freightChargeRepeat" generated="true" class="collapse" cssClass="error"/>
						                  <span></span> 
						                </div>
					              </div>
					               --%>
	
						        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightWeightMin">
						                <div class="styled-input">
						                  <form:input path="freightWeightMin" id="freightWeightMin1" onkeypress="onlyNumric(event,'qwerty')" size="5" value="${freight.freightWeightMin}" title="Freight Weight" readonly="false" />
						                  <label id="lblFreightWeightMin" class="valid">* Freight Weight</label>
						                  <label id="FreightWeightErrorId" class="collapse"></label>
						                 <%--  <form:errors path="freightWeightMin" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					              </div>
					              						              
						         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightWeightMax">
						                <div class="styled-input">
						                  <form:input path="freightWeightMax" id="freightWeightMax1" onkeypress="onlyNumric(event,'qwerty')" size="5" value="${freight.freightWeighteMax}" readonly="false" />
						                  <label id="lblFreightWeightMax" class="valid">* Freight Weight </label>
						                  <label id="FreightWeightmaxErrorId" class="collapse"></label>
						                <%--   <form:errors path="freightWeightMax" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					              </div>
						              					                   					              
						        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightDistanceMin">
						                <div class="styled-input">
						                  <form:input path="freightDistanceMin" id="freightDistanceMin1" size="5" onkeypress="onlyNumric(event,'qwerty')" value="${freight.freightDistanceMin}" title="Freight Distance" readonly="false" />
						                  <label id="lblFreightDistanceMin" class="valid">* Freight Distance</label>
						                  <label id="FreightDistanceMinErrorId" class="collapse"></label>
						                  <%-- <form:errors path="freightDistanceMin" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					             </div>
					             						              
						         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="freightDistanceMax">
						                <div class="styled-input">
						                  <form:input path="freightDistanceMax"  onkeypress="onlyNumric(event,'qwerty')" id="freightDistanceMax1" size="5" value="${freight.freightDistanceMax}" readonly="false" />
						                  <label id="lblFreightDistanceMax" class="valid">* Freight Distance </label>
						                  <label id="FreightDistanceErrorId" class="collapse"></label>
						                  <%-- <form:errors path="freightDistanceMax" generated="true" class="collapse" cssClass="error"/> --%>
						                  <span></span> 
						                </div>
					              </div>
					              
				              
						    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"> 
					                    <div id="DivStartDate" class="styled-input">
					                       <div class="input-group date datetimepicker1">
					                         <form:input id="startDate" path="startDate"  
					                         type="text"  class="selecttag" value="${freight.startDate}"
					             				 onfocus="removeHasError('DivStartDate');selecttag('labelStartDate','startDate')"
					             				onclick="emptyerror(event,'startDateError');showlabel('labelStartDate','startDateError');selecttag('labelStartDate','startDate')" />
					                        	<label id="labelStartDate" class="valid">Start Date:</label>
					                         	<label id="startDateError" class="collapse"></label>
					                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelStartDate');"></i> </i>
					                       </div>
					                     </div> 
					                     
					           </div> 	
					           
					           <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
									<div id="DivStatusId" class="styled-input">					                
											<form:select id="freightStatus" path="freightStatus" title="freightStatus" class="selecttag" onchange="selecttag('labelStatusId','freightStatus');" 
											 onfocus="removeHasError('DivStatusId');" onclick="this.setAttribute('value', this.value);" value="">
								
												<form:option selected="${freight.freightStatus}"  value="${freight.freightStatus}">
												</form:option> 
												<form:options items="${freightStatusList}"  />
											</form:select>
										<label id="labelStatusId" class="valid">Freight Status</label>
										<label id="StatusErrorId" class="collapse"></label>
										<span></span>
								      </div>
								</div>
					           
					           
					           
					           			              
					              					              								       
						            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="startDate">
						                <div class="styled-input">
						                  <form:hidden path="freightId"   value="${freight.freightId}" readonly="false" />
						                  <span></span> 
						                </div>
					         </div> 
					           
					              
					              							      					              					              							      					              
			                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning" onclick="return validateForm(event);">Submit</button>
			                      </div>
						       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt"> 
						          <hr>
						        </div>
						        
						         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	     <!--   <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"> -->
	       </div>
						        			                      					              					              
					        	</form:form>
					        		 <c:if test="${!empty freights}">
										<div class="col-xs-12">
											<div class="transaction-table">
												<div class="table-responsive">
	
													<table class="table table-bordered table-striped" id="table_id">
														<thead>
															<tr>
															<!-- <th>Id</th> -->
															<th>Freight Code</th>
															 <th>Freight Description</th>
															 <th>Charge By</th>
															 <th>Charge Type</th>
															 <th>Charge On</th>
															 <th>Amount</th>          
															 <th>Status</th>
															 <th>Action</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${freights}" var="freight">
															
															<c:if test="${freight.freightStatus>0}">
																 <tr>
																 <td><c:out value="${freight.freightCode}"/></td>
																  <td><c:out value="${freight.freightDesc}"/></td>
																   <td><c:out value="${freight.freightChargeBy}"/></td>																  
																  <td><c:out value="${freight.freightChargeType}"/></td>
																   <td><c:out value="${freight.freightChargeOn}"/></td>
																   <td><c:out value="${freight.freightChargeFix}"/></td>																   
																     <td><c:out value="${freightStatusList[freight.freightStatus]}"/></td>
																  <td align="center"><a href="editFreight?freightId=${freight.freightId}">Edit</a> | <a href="deleteFreight?freightId=${freight.freightId}">Delete</a></td>
																 </tr>
																</c:if>
															</c:forEach>												
														</tbody>
													  </table>												

												</div>
											</div>					        		 
										</div>
									
									</c:if>
					        </div>
				</section>
			</div>

	</div>
 </body>  
</html>