<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/KYCDescriptor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/popupImage.js"></script>
<script type="text/css" src="${pageContext.request.contextPath}/css/popupImage.css"></script>

<title>KYC Descriptor</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
	  showImage();
} );
var arr;
var com = new Array();
var commentId = new Set();
var map = new Map();
function addActions(obj) {
	map.set(obj.id, obj.value);
	var id = obj.id;
	commentId.add(id);
	arr = new Array();
	var itr = map.values();
	for(var val of itr) {
		arr.push(val);
	}
}
function setActions() {
	 $('#actionDocs').val(arr);
	 var flag = 0;
	 for(var s of commentId) {
		 if($('#comment'+s).val() == "") {
			 alert("Please give reason for approval or rejection.");
			 return false;
		 } else {
			 com.push($('#comment'+s).val());
			 flag = 1;
		 }
	 }
	 if(flag == 1) {
		 $('#comment').val(com);
		 return true;
	 }
		 
	return false;
} 

</script>	

</head>
<body class="PageType">
	<form:form id="" name="kycDescriptorForm" method="post" modelAttribute="kycUpgradedata" 
	action="${pageContext.request.contextPath}/AdminUI/kycController/approveKYCData">
						<div class="heading-inner  ">
	     					<!-- ****************************************** Form Heading  ******************************* -->
		                      <h1 class="pull-left">KYC Approval </h1>
		                      <div class="clearfix"></div>
		                      <hr>
	                     
	                    </div>
	                     <div class="row">
	     
	                        <div class="col-xs-12">
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           			 <table class="table table-bordered table-striped" id="table_id">
	                           			 	<tr>
<!-- 	                           			 		<th align="center">Id</th> -->
												<th align="center">Name</th>
												<th align="center">Mobile Number</th>
												<th align="center">Email Id</th>
	                           			 	</tr>
												<tr>
<%-- 													<td align="center">${kycUpgradedata.id} </td> --%>
													<td align="center">${kycUpgradedata.name} </td>
													<td align="center">${kycUpgradedata.phoneNo} </td>
													<td align="center">${kycUpgradedata.email} </td>
												</tr>
	                           			 </table>
	                           		</div>
	                           	</div>
	                        </div>
	                   </div>
	                   
	                       <div class="clearfix"></div>
                      			<hr></hr>
                      			
							<c:set var="index" value="1" scope="page"></c:set>	
	                      <div class="col-xs-12">
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           			 <table class="table table-bordered table-striped" id="table_id" border="2">
	                           			 	<tr>
	                           			 		<!-- <th align="center">SerialNumber</th>
												<th align="center">Document</th> -->
												<th align="center">Id Number</th>
												<th align="center">Document Type</th>
												<th align="center">Status</th>
												<th align="center">Added On</th>
												<th aligh="center">Added By</th>
												<th align="center">Action</th>
												<th align="center">Comment</th>
	                           			 	</tr>
	                           			 	<c:set var="i" value="1" />
	                           			 	<c:forEach  var="listVar" items="${kycUpgradedata.data}" varStatus="counter" >
	                           			 		
	                           			 		<c:if test="${listVar.statuss eq 'PENDING'}">
													<tr>
<%-- 														<td align="center"><a target="_blank" href="${kycUpgradedata.downloadUrl}${listVar.docName}">${listVar.docName}</a></td> --%>
<!-- 													<td> -->
<%-- 														<img id="myImg${index}" onclick="showImage('${index}');" src="${kycUpgradedata.downloadUrl}${listVar.docName}" alt="${listVar.docName}" style="width:50%;max-width:30px"> --%>
<%-- 														<div id="myModal${index}" class="modal"> --%>
<!-- 															<span class="close">&times;</span> -->
<%-- 															<img class="modal-content" id="img${index}"> --%>
<%-- 															<div id="caption${index}"></div> --%>
<!-- 														</div> -->
														
<%-- 														<c:set var="index" value="${index + 1}" scope="page"/> --%>
<!-- 													</td> -->
														<td align="center" ><a target="_blank" href="${kycUpgradedata.downloadUrl}${listVar.docName}">${listVar.userId}</a></td>
														<td align="center" >${listVar.idType}</td>
														<td align="center">${listVar.statuss}</td>
														<td align="center">${listVar.date}</td>
														<td align="center">${listVar.singleAddedBy}</td>
														<td>
															<input id="${i}" type="radio" name="${listVar.userId}" value="${listVar.id}#APPROVED" onclick="addActions(this);" />APPROVE<br>
															<input id="${i}" type="radio" name="${listVar.userId}" value="${listVar.id}#REJECTED" onclick="addActions(this);" />REJECT
															
														</td>
														<td>
														<input id="comment${i}" type="text"/>
														</td>
														</tr>
													</c:if>
													<c:set var="i" value="${i+1}"/>
											</c:forEach>
	                           			 </table>
	                           		</div>
	                           	</div>
	                        </div>
	                   </div>
	                   
	                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                       		<input type="submit" id="submitBtn" value="Submit" onclick="return setActions();" class="btn btn-warning" />
	                       </div>
	                       
	                        <div class="col-xs-12">
	                        &nbsp; <br>
	                        </div>
	                           
	                       <div class="col-xs-12">
	                     	<h4 align="center" style="color:#ecbf67">   Approved/Rejected Document List</h4>
	                       		 <div class="transaction-table">
	                         		<div class="table-responsive">
	                           			 <table class="table table-bordered table-striped" id="table_id" border="2">
	                           			 	<tr>
	                           			 		<!-- <th align="center">SerialNumber</th>
												<th align="center">Document</th> -->
												<th align="center">Id Number</th>
												<th align="center">Document Type</th>
												<th align="center">Status</th>
												<th align="center">Added On</th>
												<th aligh="center">Added By</th>
												<th align="center">Verified By</th>
												<th align="center">Verified On</th>
												<th align="center">Comment</th>
	                           			 	</tr>
	                           			 	
	                           			 	<c:forEach  var="listVar" items="${kycUpgradedata.data}" varStatus="counter"> 
	                           			 	
	                           			 	 <c:if test="${listVar.statuss ne 'PENDING'}"> 
												<tr>
<!-- 													<td align="center"> -->
<%-- 														<a target="_blank"  href="${kycUpgradedata.downloadUrl}${listVar.docName}">${listVar.docName}</a> --%>
<!-- 													</td> -->
													
													<%-- <td>
														<img id="myImg${index}" onclick="showImage('${index}');" src="${kycUpgradedata.downloadUrl}${listVar.docName}" alt="${listVar.docName}" style="width:50%;max-width:30px">
														<div id="myModal${index}" class="modal">
															<span class="close">&times;</span>
															<img class="modal-content" id="img${index}">
															<div id="caption${index}"></div>
														</div>
														
														<c:set var="index" value="${index + 1}" scope="page"/>
													</td> --%>
													<td align="center" ><a target="_blank" href="${kycUpgradedata.downloadUrl}${listVar.docName}">${listVar.userId}</a></td>
													<td align="center" >${listVar.idType}</td>
													<c:if test="${listVar.statuss eq 'APPROVED'}">
														<td align="center" style='color: green;'><b>${listVar.statuss}</b></td>
													</c:if>
													<c:if test="${listVar.statuss eq 'REJECTED'}">
														<td align="center" style='color: red;'><b>${listVar.statuss}</b></td>
													</c:if>
													<td align="center">${listVar.date}</td>
													<td align="center">${listVar.singleAddedBy}</td>
													<td align="center">${listVar.verifiedBy}</td>
													<td align="center">${listVar.verifiedOn}</td>
													<td align="center">${listVar.comments}</td>
													</tr>
												</c:if> 
											</c:forEach>
	                           			 </table>
	                           		</div>
	                           	</div>
	                        </div>
	                        
	                   </div>
				<form:hidden id="actionDocs" path="actionDoc" />
				<form:hidden id="comment" path="comment" />
				<input type="hidden" value="${kycUpgradedata.subscriberId}" name="subsId">
	          	<input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId"> 
</form:form>

</body>
</html>