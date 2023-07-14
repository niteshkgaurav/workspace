<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/fileinput.css />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Merchant.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SEIssuance.js"></script>

	<title>Merchant Registration</title>
	<script>
	function Showdiv(){
		$('#Merchantdata').show();
		$('#kycTableId').show();
		$('#BusinessId').show();
	}
	
	</script>
</head>
<body>


<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<h5 style="color:#ecbf67">Merchant Details</h5>
<input type="text" id="myInput"  ><input type="Button" id="myInput" class="btn btn-warning" value="Search" onclick="getData();Showdiv();">
</div>

<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
&nbsp;
</div>
<div class="col-xs-12 " id='Merchantdata'>
					<div class="transaction-table">
						<div class="table-responsive">
							<table   id="merchantInfo" class="table table-bordered table-striped">
<!--  <table id="merchantInfo" class="display" style="width:100%"> -->
        <thead>
            <tr>
            	
									<th style="width: 12%">Name</th>
									<th style="width: 14%">Mobile Number</th>
									<th style="width: 20%">Account No.</th>
									<th style="width: 12%">IFS Code</th>
									<th style="width: 20%">Email</th>
									<th style="width: 20%">MerchantId</th>
									
								
            
            
            
            
       
            </tr>
        </thead>
        </div>
        </div>
       
     
    </table> 


<form:form id="merchantkycInfo" modelAttribute="merchantData" method="post" action="${pageContext.request.contextPath}/AdminUI/merchantMgmnt/getMerchantRegistrationEdit">
<c:if test="${groupCode != 'HO'}">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left"> <h1><u>KYC</u></h1></div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<label style="color:#999;"></label>
					<div class="clearfix"></div>
				</div>
				
					</div>
					<br>
						
					<div class="col-xs-12 " id='kycTableId'>
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th style="width: 12%"><spring:message code="lab_idName" /></th>
									<th style="width: 12%"><spring:message	code="lab_maxBalance" /></th>
									<th style="width: 12%"><spring:message	code="lab_perTxnLimit" /></th>
									<th style="width: 12%"><spring:message	code="lab_dailyTxnLimit" /></th>
									<th style="width: 12%"><spring:message	code="lab_monthlyTxnLimit" /></th>
									<th style="width: 15%"><spring:message code="lab_idNo" /></th>
									<th style="width: 25%"><spring:message code="lab_action" /></th>
								</tr>
								<c:forEach items="${kycDetails}" var="idProofData"
									varStatus="status">
								
									<tr>
									<td><form:checkbox
												id="idProofCheck${idProofData.id}" path="idProofCheck"
												value="${idProofData.id}" onclick="addKeys('${idProofData.id}');fetchKycDescData('${idProofData.id}')"/>&nbsp;${idProofData.name}</td>
										<td>${idProofData.maxBalance}</td>
										<td>${idProofData.perTxnLimit}</td>
										<td>${idProofData.dailyTxnLimit}</td>
										<td>${idProofData.monthlyTxnLimit}</td>
									
									<td>
									
									
									<form:input id="idNo${idProofData.id}"
												onkeypress="blockSpecialCharIdNumber(event,'idNoErrorId${idProofData.id}')"
												type="text" path="idNo" placeholder="ID Number"
												style="width:96%"
												onclick="emptyerror(event,'idNoErrorId${idProofData.id}')"
												disabled="true"  /></td>
									<td align="center">
									<div id="filename${idProofData.id}"></div>
											<form:input class="myfileclass"
												path="file" type="file"
												name="uploadButton${idProofData.id}"
												id="uploadButton${idProofData.id}" value="Upload"
												onclick="emptyerror(event,'uploadButtonErrorId${idProofData.id}');" 
												onchange="checkMultipleImageSizeAndExtension('uploadButton${idProofData.id}');"
												disabled="true" />
											<input align="left"
												style="width: 40%" id="removeButton${idProofData.id}"
												type="button" value="Remove"
												onclick="removeFunction(${idProofData.id});"
												disabled="disabled" />	
										</td>
									</tr>
									
										<c:forEach items="${merchantkycDetails}" var="merchantkyc">
									
									<c:if test="${idProofData.id == merchantkyc.idProofId}">
									<script>
									var id11='#idNo${idProofData.id}';
									var filename='#filename${idProofData.id}';
									$(id11).val('${merchantkyc.userIdProofId}');
									$(filename).html('${merchantkyc.documentName}');
									</script>
									</c:if>
									
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
		
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left"> <h1><u>Business Kyc</u></h1><br></div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<label style="color:#999;"></label>
					<div class="clearfix"></div>
				</div>
				
					</div>
					<br>
						
					<div class="col-xs-12 " id='BusinessId'>
					<div class="transaction-table">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th style="width: 12%">MerchantId</th>
									<th style="width: 12%">Name</th>
									<th style="width: 12%">Mobile no.</th>
									<th style="width: 12%">Edit</th>
								</tr>
							
			</table>
			</div>
			</div>
			</div>
			
			</c:if>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
									<input type="button" class="btn btn-warning" value="Submit" onclick="getData(email,contactNumber); " />
								</div>
			<script>
			$('#Merchantdata').hide();
			$('#kycTableId').hide();
			$('#BusinessId').hide();
			
			</script> 
</form:form>
</body>
</html>