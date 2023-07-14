<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=${pageContext.request.contextPath}/js/custom.js></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/masterOtaSetup.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script> 
<title>Header Setup</title>
</head>
<body>
<div>
	<form:form id="masterOtaForm" name="masterOtaForm" method="post" modelAttribute="masterOtaData" 
	action="${pageContext.request.contextPath}/AdminUI/otaservice/smasterotadata">	
		
		 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
    	      <div style="text-align:center;" id="statusmsg"><b><font color="red">${statusMessage}</font></b></div>
          	  <div style="text-align:center;" id="statusmsg"><b><font color="green">${successMessage}</font></b></div>
			  <div style="text-align:center;"><b><p id="infomsg"></p></b></div>
	     
               <h1 class="pull-left">Header Setup</h1>
               <div class="clearfix"></div>
                <hr>
           </div>	                    	
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                          <spring:message code="lab_desc" var="lab_desc" /> 
											<form:input id="desc" class="selecttag" type="text" path="desc" placeholder="."/>
					    					 <label id="label_Desc"class="valid">Description</label>
                          		 </div>
                      		</div>  
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="styled-input">
		                          <spring:message code="lab_protocol" var="lab_protocol" /> 
											<form:input id="protocol" class="selecttag" type="text" path="protocol" placeholder="."/>
					    					 <label id="label_Protocol"class="valid">Protocol</label>
                          		 </div>
                      		</div>  
            
	            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_dcs" var="lab_dcs" /> 
			                          <form:input id="dcs" class="selecttag" type="text" path="dcs" placeholder="."/>
			                          <label id="label_dcs"class="valid">DCS</label>
	                          </div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_udh" var="lab_udh" /> 
			                          <form:input id="udh" class="selecttag" type="text" path="udh" placeholder="."/>
			                          <label id="label_udh"class="valid">UDH</label>
	                          </div>
	                     	 </div>	                     	 
	                     	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 <input type="submit" class="btn btn-warning" value="Submit"
	                     	 onclick="return checkMasterData(event);"/>
	                      	</div>
						</div>
	  </form:form>
	  
	  <div class="row">&nbsp;</div>
	  <div class="row">&nbsp;</div>
	  <div class="row">
			<div class="col-xs-12">
				<div class="transaction-table">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="table_id">
							<thead>
								<tr>
								<th>Description</th>
								<th>Protocol</th>	
								<th>DCS</th>	
								<th>UDH</th>	
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${masterOtaConfig}"
									var="mda">
									<tr id="rowId_${mda.id}">
										<td>${mda.desc}</td>
										<td>${mda.protocol}</td>	
										<td>${mda.dcs}</td>	
										<td>${mda.udh}</td>	
									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>
					<div></div>
				</div>
			</div>
		</div>
</div>
</body>
</html>