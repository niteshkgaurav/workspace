<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page session="false" %>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">	
    <title>Routes</title>
</head>

    
<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/js/jquery.validate.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/additional-methods.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

<script type="text/javascript">
$(document).ready(
		   function() {
		    var table = $('#route-table').DataTable(
		      {
		       dom : 'lBfrtip',
		       buttons : [ {
		        extend : 'excel',
		        text : 'Export Excel'
		       } ],
		       "lengthMenu" : [ 5, 10, 20, 50, 100 ],
		       "pagingType" : "simple_numbers",
		       "processing" : true,
		       "serverSide" : true,
		       "ajax" : {
		        url : "${pageContext.request.contextPath}/routes",
		        type : "POST",
		        data : function(data) {
		         return JSON.stringify(data);
		        },
		        "dataType" : "json",
		        "processData" : false,
		        contentType : 'application/json;charset=UTF-8'
		       },
		       "columns" : [{
		        "data" : "routeNumber"
		       }, {
		        "data" : "routeDesc"
		       }, {
		        "data" : "noOfBuses"
		       }, {
		        "data" : "frequency"
		       }, {
			    "data" : "runningTime"
			   }, {
				"data" : "distanceCovered"
		       }]
		      });
		   });

		 function refreshTable() {
		  var $routeTable = $("#route-table").dataTable({
		   bRetrieve : true
		  });
		  $routeTable.fnDraw();
		 }

</script>
 
 <script type="text/javascript">
 $(window).load(function(){
 	$(document).ready(function(){
 		$(#uploadRoute).validate({
 			rules:{
 				"xlsFile":{
 					required:true
 				}
 				
 			},
 			message:{
 				"xlsFile":{
 				 	required:"Please select a file to proceed"
 				}
 			},
			submitHandler: function (form) {
	             form.submit(); 
	        } 			
 		});
 	});
});	
 </script>

<body onload="refreshTable();">
	<div id="mainbody" class="container-fluid">
	
		<!-- <div class="row"> --> 
		
                
                <!--Right Container Start-->      
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<section class="white">
						        <div class="heading-inner">
						          <h1>Add Route</h1>
						          <div class="clearfix"></div>
						          <hr>
						        </div>
						    <div class="row"> 
							<form action="saveRoute.html" method="post" name="routeForm">
						              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="hidden" value="" />
						                  <span></span> 
						                </div>
						              </div>						
						              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Route Number</label>
						                  <span></span> 
						                </div>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <select class="form-control">
						                  <option>Source Station</option>
						                </select>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <select class="form-control">
						                  <option>Destination Station</option>
						                </select>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Description </label>
						                  <span></span> 
						                </div>
						              </div>  
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Number Of Buses </label>
						                  <span></span> 
						                </div>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Bus Frequency </label>
						                  <span></span> 
						                </div>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Running Time </label>
						                  <span></span> 
						                </div>
						              </div>
						              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						                <div class="styled-input">
						                  <input type="text" required value="" />
						                  <label>* Distance Covered </label>
						                  <span></span> 
						                </div>
						              </div>
			                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			                        <button type="submit" class="btn btn-warning">Submit</button>
			                      </div>						                                                                                                            
						</form>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>

	
								<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 mb"> Upload Route Data to Server </div>
								
								<form method="post" name="uploadRoute" action="upload.html" enctype="multipart/form-data">
								           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
												<div class="styled-input">								
													<label>Select a file to upload routes</label>
													<input type="file" name="xlsFile"/>
													<form:errors path="xlsFile" generated="true" cssClass="error"/>
													 <span></span> 
												</div>
								          </div>
								          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">						            
								           	<input type="submit" class="btn btn-warning" name="Submit" value="Submit"/>
								          </div>      
								</form>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
						          <hr>
						        </div>
						
						<c:if test="${!empty routes}">

							<div class="col-xs-12">
								<div class="transaction-table">
									<div class="table-responsive">
										<table class="table table-bordered table-striped" id="route-table">
										<thead>
											<tr>
											 <th>Route Number</th>
											 <th>Route Description</th>      
											 <th>No Of Buses</th>
											 <th>Frequency</th>				 
											 <th>Running Time</th>
											 <th>Distance Covered</th>
											 <th>&nbsp;</th>
											</tr>
		                                </thead>
										<tfoot>
										 <tr>
										  <th>routeNumber</th>
										  <th>routeDesc</th>
										  <th>noOfBuses</th>
										  <th>frequency</th>
										  <th>runningTime</th>
										  <th>distanceCovered</th>	
										  <th>&nbsp;</th>										  										  
										 </tr>
										</tfoot>
		                              <tbody>										

										</tbody>	   	
									</table>
								</div>	  
							</div>
						</div>
						</c:if>
					</div>	
				</section>
			</div>
		<!-- </div>  -->
	</div>
</body>
</html>