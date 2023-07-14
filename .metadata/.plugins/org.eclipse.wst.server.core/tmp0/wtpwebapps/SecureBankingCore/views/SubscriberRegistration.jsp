
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SubsRegistration.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/blitzer/jquery-ui.css">
 	<script src="${pageContext.request.contextPath}/js/jquery-ui_1.11.4.js"></script>
	
	

	<title>Welcome to NextGen</title>
	
	<script>
  $(function() {
	   var pickerOpts = {
	            changeMonth: true,
	            changeYear: true,
	            yearRange: '1950:2050',
	            dateFormat: 'yy-mm-dd',
	      
	            maxDate:0,
	            
	        };
    $( "#dobId" ).datepicker(pickerOpts);
  });
  </script>
	
	
 	</head>
 	<body>
 	
	<form:form method="post"  modelAttribute="subscriberData"  action="${pageContext.request.contextPath}/AdminUI/subMgmt/registrationSubmit" enctype="multipart/form-data"> 
    	      <table id="mainTable" align="center" class='thickBorder' width="100%" height="100%">
			<tr>
				<td align="center">
				<h3 id="msgId" align="center" style="color:green;">${statusMessage}</h3>
				<h3 id="errMsgId" align="center" style="color:red;">${errorMessage}</h3>
			<table width="80%" border='0' class='tableMain' cellspacing='8' cellpadding='1' border='0' bordercolor='#000000'>
				<tr><td colspan="2"><div align="center" class="mainTableHeader"><spring:message code="lable.subscriber.title.page"/></div></td></tr>
				<tr>
					<td align="right"><font color=red>*&nbsp;</font><spring:message code="LABEL_ISSUED_TO" />&nbsp;:&nbsp;&nbsp;
					</td>
				<td>
  					<form:select id="issueToId" path="issuedTo" style="width:150px;" onclick="emptyerror(event,'label_Issued_ErrorId')" onchange="removeReadonly()"> 
  						<form:option value="0" label="Subscriber Type"/> 
	     				<form:option value="AGENT" label="Agent"/>      
	     				<form:option value="CUSTOMER" label="Customer"/>                                                                              
	     			</form:select>
  				</td>
				</tr>
				<tr><td width="50%"></td><td width="50%"><div id="label_Issued_ErrorId" align="left"></div></td></tr>
				<tr style="display: none;" id="agentMobRowId">
					<td align="right"><font color=red>*&nbsp;</font><spring:message code="lab_MobileNumber" />&nbsp;:&nbsp;&nbsp;
					</td>
				<td>
  					<form:select id="mobileId" path="mobile" style="width:150px;" onclick="emptyerror(event,'label_agent_mobile_ErrorId')" onchange="makeReadonly()"> 
	     				<form:option value="" label="Select Mobile" maxlength="10" placeholder="Enter mobile number"/>                                                                      
	     			</form:select>
  				</td>
				</tr>
				<tr><td width="50%"></td><td width="50%"><div id="label_agent_mobile_ErrorId" align="left"></div></td></tr>
				
				<tr style="display: none;" id="custMobRowId">
					<td align="right"><font color=red>*&nbsp;</font><spring:message code="lab_MobileNumber" />&nbsp;:&nbsp;&nbsp;
					</td>
				<td>
  						<form:input style="width: 149px" id="mobileId2" path="mobile" minlength="10" maxlength="12" placeholder="Enter mobile number" onkeypress="onlyNumric(event,'label_customer_mobile_ErrorId');"  onchange="validPhoneNumber();"   onclick="emptyerror(event,'label_customer_mobile_ErrorId')"/>
  				</td>
				</tr>
				<tr><td width="50%"></td><td width="50%"><div id="label_customer_mobile_ErrorId" align="left"></div></td></tr>
				<tr>
					<td colspan="2" align="center">
						
						<table class='thickBorder' align="center" style="width:400px;"  cellspacing='8' cellpadding='1'>
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="LABEL_NAME" />&nbsp;:&nbsp;&nbsp;
								</td>
							 <td>
							 	<form:input style="width: 200px" id="nameId" path="userName" placeholder="Enter name" onclick="emptyerror(event,'label_name_ErrorId')"/>
							 </td>
							</tr>
							<tr><td width="50%"></td><td width="50%"><div id="label_name_ErrorId" align="left"></div></td></tr>
							
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="lab_dob" />&nbsp;:&nbsp;&nbsp;
								</td>
							 <td>
							 	<form:input style="width: 200px" id="dobId" path="dob" placeholder="Enter date of birth" onclick="emptyerror(event,'label_dob_ErrorId')"/>
							 </td>
							</tr>
							<tr><td width="50%"></td><td width="50%"><div id="label_dob_ErrorId" align="left"></div></td></tr>
							<tr>
								<td align="right"><spring:message code="emailId" />&nbsp;:&nbsp;&nbsp;
								</td>
							 	<td>
							 		<form:input style="width: 200px" id="emailId" path="emailId" placeholder="Enter email ID"/>
							 	</td>
							</tr>
						</table>
						
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						
						<table class='thickBorder' align="center" style="width:500px;"  cellspacing='8' cellpadding='1'>
					
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="label_master_version" />&nbsp;:&nbsp;&nbsp;
								</td>
								<td>
  									<form:select id="mvId" path="mvId" style="width:200px;" onclick="emptyerror(event,'label_master_ErrorId')"> 
	     								<form:option value="0" label="Master Version"/>  
	     								  <form:options items="${subscriberData.mvMap}" />                                                                            
	     							</form:select>
  								</td>
							</tr>	
							<tr><td width="50%"></td><td width="50%"><div id="label_master_ErrorId" align="left"></div></td></tr>
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="lable_host_sub_version" />&nbsp;:&nbsp;&nbsp;
								</td>
								<td>
  									<form:select id="hsvId" path="hsvId" style="width:200px;" onclick="emptyerror(event,'label_hsv_ErrorId')"> 
	     								<form:option value="0" label="Host Sub Version"/>                                                                      
	     							</form:select>
  								</td>
							</tr>	
							<tr><td width="50%"></td><td width="50%"><div id="label_hsv_ErrorId" align="left"></div></td></tr>
							
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="lab_Product_Type"/>&nbsp;:&nbsp;&nbsp;
								</td>
								<td>
  									<form:select id="productId" path="productId" style="width:200px;" onclick="emptyerror(event,'label_product_ErrorId')"> 
	     								<form:option value="0" label="Product"/>     
	     								  <form:options items="${subscriberData.productMap}" />                                                                   
	     							</form:select>
  								</td>
							</tr>	
							<tr><td width="50%"></td><td width="50%"><div id="label_product_ErrorId" align="left"></div></td></tr>
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="LABEL_IN_STOCK" />&nbsp;:&nbsp;&nbsp;
								</td>
							 	<td>
							 		<form:input id="instockId" path="instock" style="width:195px" readonly="true"/>
							 	</td>
							</tr>
							
							
							<tr>
								<td align="right"><font color=red>*&nbsp;</font><spring:message code="label_serialNo" />&nbsp;:&nbsp;&nbsp;
								</td>
								<td>
  									<form:select id="serialNumberId" path="serialNumber" style="width:200px"  onclick="emptyerror(event,'label_SE_ErrorId')"> 
	     								<form:option value="0" label="Serial Number"/>                                                                      
	     							</form:select>
  								</td>
							</tr>	
							<tr><td width="50%"></td><td width="50%"><div id="label_SE_ErrorId" align="left"></div></td></tr>
						</table>
						
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Submit" onclick="return validateSubscribersForm();" />
					</td>
				</tr>
			</table>
			
				
			
				
				</td>
			</tr>
		
		</table>
	<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
							
	</form:form>
	
</body>
</html>