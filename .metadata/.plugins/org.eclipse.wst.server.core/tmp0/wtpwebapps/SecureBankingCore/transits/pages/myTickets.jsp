
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/transits/js/addBus.js"></script>
 
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	

</head>
<body>



      
		   		 <c:if test="${!empty ticketInfo}">
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
					
								<table class="table table-bordered table-striped" id="table_id">
									<thead>
										<tr>
									
										 <th>User Id</th>
										 <th>Ticket Serial Number</th>
										 <th>Travel Date</th>
										 <th>Route Id</th>
										 <th>Source Station</th>
										 <th>Destination Station</th>
									
										 <th>Customer IMEI number</th>
										 <th>Fare Amount</th>
										 <th>QR Ticket Hash</th>
										 <th>Booked Date</th>								 									 															           
										 <th>Status</th>
										 <th>Ticket Id</th>
										 <th>Trip Detail Type</th>
										</tr>
									</thead>
									<tbody>
							 			<c:forEach items="${ticketInfo}" var="ticket">
							 			
										   <tr>
											    <td><c:out value="${ticket.userId}"/></td>
											    <td><c:out value="${ticket.tktSrNo}"/></td>
											    <td><c:out value="${ticket.travelDate}"/></td>
											    <td><c:out value="${ticket.routeId}"/></td>
											    <td><c:out value="${ticket.srcStn}"/></td>
											    <td><c:out value="${ticket.destStn}"/></td>
											
											    <td><c:out value="${ticket.cust_IMIE_No}"/></td>
											    <td><c:out value="${ticket.fareAmt}"/></td>
											    <td><c:out value="${ticket.qr_tkt_hash}"/></td>
											    <td><c:out value="${bus.bookedDate}"/></td>
											    <td><c:out value="${ticket.status}"/></td>
		                                        <td><c:out value="${ticket.tktId}"/></td>
		                                        <td><c:out value="${ticket.tripDetailType}"/></td>
											    
										   </tr>
										
									  </c:forEach>												
									</tbody>
								  </table>												
							</div>
						</div>					        		 
					</div>
				</c:if>  

</body>
</html>