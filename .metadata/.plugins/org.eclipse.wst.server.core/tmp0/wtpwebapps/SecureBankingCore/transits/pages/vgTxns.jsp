<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<title>Transit System-Fare Collection</title>
<script>
$(function () {
	
	 var currentDate=new Date(); 
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			 maxDate : 'now',
            useCurrent: true,

      });
		
	});
</script>
<script type="text/javascript">
	function validate(){
		// alert("This is a test");
		var vigilanceName = $("#selectedUserId").val();
		// alert("vigilanceName : "+ vigilanceName);
		var dateFrom = $("#dateFrom").val(); 
		// alert("dateFrom : "+ dateFrom);
		var dateTo = $("#dateTo").val(); 
		// alert("dateTo : "+ dateTo);
		if(new Date(dateFrom).valueOf() > new Date(dateTo).valueOf()){
			alert("Select a valid date range to proceed");
			return false;
		}
		if (vigilanceName.length==0 && dateFrom.length==0 && dateTo.length==0){
			alert("Select a Vigilance or date range  to proceed");
			return false;
		}
		
	}
</script>
</head>
 <body>
	 <div id="mainbody" class="container-fluid" >
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<section class="white">
	       <div class="heading-inner">
	         <h1>Vigilance Collection</h1>
	         <div class="clearfix"></div>
	         <hr>
	       </div>	  
       <div class="row">	
      	
			  <form:form method="POST" action="${pageContext.request.contextPath}/AdminUI/vgTxns/showVgTxns">
	      
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		                    <div id="DivDateFrom" class="styled-input">
		                       <div class="input-group date datetimepicker1">
		                         <form:input id="dateFrom" path="dateFrom" 
		                         type="text"  class="selecttag" value="${vigilanceTxn.dateFrom}"
		             				 onfocus="removeHasError('DivDateFrom');selecttag('labelDateFrom','dateFrom')"
		             				onclick="emptyerror(event,'dateFromError');showlabel('labelDateFrom','dateFromError');selecttag('labelDateFrom','dateFrom')" />
		                        	<label id="labelDateFrom" class="valid">Date From:</label>
		                         	<label id="dateFromError" class="collapse"></label>
		                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelDateFrom');"></i> </i>
		                       </div>
		                     </div>      
		           </div>
			      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		                    <div id="DivDateTo" class="styled-input">
		                       <div class="input-group date datetimepicker1">
		                         <form:input id="dateTo"  path="dateTo"
		                         type="text"  class="selecttag" value="${vigilanceTxn.dateTo}"
		             				 onfocus="removeHasError('DivDateTo');selecttag('labelDateTo','dateTo')"
		             				onclick="emptyerror(event,'dateFromError');showlabel('labelDateTO','dateFromTo');selecttag('labelDateto','dateTo')" />
		                        	<label id="labelDateTo" class="valid">Date To:</label>
		                         	<label id="dateFromTo" class="collapse"></label>
		                        	<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"  onclick="selecttag1('labelDateTo');"></i> </i>
		                       </div>
		                     </div>      
		           </div>

				 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">	
					<div id="DivIduserId" class="styled-input">					                
							<form:select id="selectedUserId"  path="selectedUserId" title="selectedUserId" class="selecttag" onchange="selecttag('labelUserId','selectedUserId');" 
							 onfocus="removeHasError('DivIduserId');" onclick="this.setAttribute('value', this.value);" value="">
				
								<c:if test="${!empty vigilanceTxn.selectedUserId}"> 
								<form:option selected="${vigilanceTxn.selectedUserId}"  value="${vigilanceTxn.selectedUserId}">${vgs[vigilanceTxn.selectedUserId]}
								</form:option>
								</c:if>  
								<form:option value="" label=" " ></form:option>      		            
								<form:options items="${vgs}"  />
				
							</form:select>
						<label id="labelUserId" class="valid">Select Vigilance</label>
						<label id="userIdErrorId" class="collapse"></label>
						<span></span>
				      </div>
				</div>			

		    
		          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		            <button type="submit" onclick="return validate();" class="btn btn-warning">Submit</button>
		          </div>
		          
		          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right">
	       <input id="downloadId" type="submit" name="download" value="Download Report" class="btn btn-warning">
	<!--        <input id="downloadId" type="submit" name="download" value="Download Sample.xls" class="btn btn-warning"> -->
	       </div>
		          	      	      	             	      	      	      	      	      
			  </form:form>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt">
	         <hr>
	       </div>
		   		 <c:if test="${!empty vgTxns}">
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
					
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
										<!-- <th>Id</th> -->
										 <th>Txn ID</th>
										 <th>Txn No</th>										 
										 <th>Txn Date</th>
										 <th>Txn Time</th>										 
										 <th>Reader No</th>
										 <th>Penalty Type</th>
										 <th>Penalty Amount</th>
										 <th>Vigilance ID</th>
										 <th>Customer </th>										 								 									 															           
										</tr>
									</thead>
									<tbody>
							 			<c:forEach items="${vgTxns}" var="vgTxn">
										   <tr>
											    <td><c:out value="${vgTxn.vgTxnId}"/></td>
											    <td><c:out value="${vgTxn.vgTxnNo}"/></td>
											    <td><c:out value="${vgTxn.vgTxnDate}"/></td>
											    <td><c:out value="${vgTxn.vgTxnTime}"/></td>
											    <td><c:out value="${vgTxn.readerNo}"/></td>
											    <td><c:out value="${penaltyList[vgTxn.penaltyType]}"/></td>
											    <td><c:out value="${vgTxn.penaltyAmount}"/></td>
											    <td><c:out value="${vgs[vgTxn.vigilanceId]}"/></td>
											    <td><c:out value="${vgTxn.customerName }"/></td>
										   </tr>
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