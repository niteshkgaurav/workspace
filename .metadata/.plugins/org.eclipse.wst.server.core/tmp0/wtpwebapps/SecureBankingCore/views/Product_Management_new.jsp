
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@ page import="com.ng.sb.common.dataobject.ProductManagementData" %>
<%@ page import="com.ng.sb.common.util.KeyEncryptionUtils" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.util.SystemConstant" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/Product_Management.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>	
<title>Product Management</title>
<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
			  "scrollY":"400px",
		        
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"			  
		  });
	  }	  
} );

function selectCommissionTag(label,id)
{	
	var idd=$("#"+id).val();
	if(idd!=undefined && idd.length!=0){	
		$("#"+label).addClass("valid");
	}
	
	 var commission = document.getElementById("commission").value;
	 if(commission == 1) {
		 document.getElementById("txnTypeDivId").style.display="block";
	 } else if (commission == 0) {  
	 	document.getElementById("txnTypeDivId").style.display="none";
	 }   	
}
</script>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body class="PageType">
	

	<form:form id="productCreationForm1" name="productCreationForm1"
		method="post" modelAttribute="productManagementData"
		action="${pageContext.request.contextPath}/AdminUI/sysSetting/createProduct"
		enctype="multipart/form-data">
		
	               		 
	                    <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="PRODUCT_MGMT"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    
									<div id="successMessageId"  class="  col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                            <p class="text-success">${message}</p> 
									</div> 
							
							
							
			          				 <div id="errorstatusMessage" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
			           			
			                                            <p class="text-danger">${errorMessage}</p> 
								 
									</div>
							
	                    </div>
	                    
	                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right ">
			<button type="button" class="btn btn-warning " onclick="toggleform('productrowId');">Create
				Product</button>

		</div>
	
	
	<div style="height:75px" ></div>
	<br>
	              
          			<div class="row collapse"    id="productrowId">
          					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input">
		                          <spring:message code="lable_productName" var="lable_productName" /> 
										<form:input type='text' id="lable_productName" path="productName"
								name='newsubcategoryname' size='40' maxlength='40' 
								class="selecttag" onblur="javascript:return Category_check()"
								onfocus="showlabel('lab_productName','productNameErrorId');jkl();removeerrormessege();"
								onclick="abc();emptyerror(event,'productNameErrorId');" 
								onkeypress="blockSpecialChar(event,'productNameErrorId','lab_productName','lable_productName');validateSpace(event,'productNameErrorId'); "
								onchange="selecttag('lab_productName','lable_productName');checkField('lable_productName','Products','productName','productNameErrorId','lab_productName');return validateProductName(event,'productNameErrorId');" />
					    					 <label id="lab_productName"class="valid">${lable_productName}</label>
					    					  <label id="productNameErrorId" class="collapse"></label>
					    					 
                          		 </div>
                      		</div>  
            
	            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_Product_description" var="lab_Product_description" /> 
			                          <form:input type='text'
										id="lable_productDescription" path="description"
										name='description' size='40' maxlength='120' class="selecttag"
										onkeypress="blockSpecialChar(event,'productTypeErrorId','lab_productDescription','lable_productDescription');" 
										onfocus="showlabel('lab_productName','productNameErrorId');"
										onchange="selecttag('lab_productDescription','lable_productDescription');spaceNotAllowed();" 
										onclick="adc();emptyerror(event,'productTypeErrorId');" />
			                          <label id="lab_productDescription"class="valid">${lab_Product_description}</label>
			                          <label id="productTypeErrorId" class="collapse"></label>
	                          </div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	
			                          <form:select id="typeId" class="selecttag"  onfocus="showlabel('lable_typeId','productSubTypeErrorId')"
										path="typeId" onchange="adf();fgh();selecttag('lable_typeId','typeId')" onclick="this.setAttribute('value', this.value);" value="">
										<form:option value="0" label=" " />
										<form:option value="OVERLAY" label="OVERLAY" />
										<form:option value="SD_CARD" label="SD_CARD" />
										<form:option value="MIFARE_CARD" label="MIFARE_CARD" />
										<form:option value="READER" label="READER" />
									</form:select>
								 <label id="lable_typeId"class="valid"><spring:message code="LABEL_BASE_PLATFORM" /></label>
			                     <label id="productSubTypeErrorId" class="collapse"></label>
					    		</div>		
	                     	 </div>
      		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="commission-input">
					
					<form:select  path="commission" id="commission" class="selecttag"						
							onfocus="removeHasError('commission-input');showlabel('commissionId','commissionErrorId');emptyerror(event,'commissionErrorId');" onclick="this.setAttribute('value', this.value);emptyerror(event,'commissionErrorId'); refresh('successMessageId');"
							onChange="selectCommissionTag('commissionId','commission');"
						  onkeypress="emptyerror(event,'commissionErrorId');">
						
						<form:option value="1" label="Yes" />
						<form:option value="0" label="No" />
		
					</form:select>
					<label id="commissionId" class="valid"><spring:message code="LABEL_COMMISSION" /></label>  
					<label id="commissionErrorId" class="collapse"></label>
				</div>
				</div>

             <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="txnTypeDivId">
				<div class="styled-input" id="txnType-input">											
					<select id="txnTypeId" style="float:left;" path="serviceStk" name="serviceStk"
						onfocus="removeHasError('txnType-input'); showlabel('txnTypeId','txnTypeErrorId'); onChange="selecttag('txnTypeId','txnType');
					  	onkeypress="emptyerror(event,'txnTypeErrorId'); onclick="this.setAttribute('value', this.value);>
							<c:forEach items="${serviceConfig}" var="svc">
				        		<option value="${svc.stkCode}">${svc.serviceDescription}</option>
							</c:forEach>
					</select>
					
					
					<%-- <form:input type="number"  min="0" max="1" class="selecttag" path="commission" id="commission" 
						onclick="emptyerror(event,'commissionErrorId'); refresh('successMessageId');" 
						onfocus="removeHasError('commission-input');showlabel('commissionId','commissionErrorId');emptyerror(event,'commissionErrorId')"
					  	onChange="selecttag('commissionId','commission');"
					  onkeypress="emptyerror(event,'commissionErrorId');"/> --%>
					<label id="txnTypeId" class="valid"><spring:message code="LABEL_TXN_TYPE" /></label>  
					<label id="txnTypeErrorId" class="collapse"></label>
				</div>
				</div>
	                     	 
				 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                     	 <input type='submit'
							value="Submit" class="btn btn-warning"
							src='${pageContext.request.contextPath}/images/Submit.gif'
							id='addBtn' onClick="return validateProductfrom(event);"
							onMouseOver="submitBtn.src = 'image/ui/Add_Rollover.gif'"
							onMouseOut="submitBtn.src = 'image/ui/Submit.gif'">
	                      	</div>
			
	                      	
	                      	<div class="clearfix"></div>
		                      </div>
						<br>	
	                	<div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="table_id" class="table table-bordered table-striped">
	                              <thead>
	                                <tr>
	                                  	<th><spring:message code="lab_Product_Name" /></th>
										<th><spring:message	code="lab_Product_description" /></th>
						  				<th><spring:message code="lab_Type" /></th>
										<th><spring:message code="lab_Action" /></th>
	                                </tr>
	                              </thead>
	                              <tbody>
	                                <c:forEach items="${productList}" var="product" varStatus="status">
										<tr>
											<td>${product.name}</td>
											<td>${product.description}</td>
											<td>${product.typeId}</td>
											
											<%
											Integer menuId=(Integer)request.getAttribute("menuId");
											Integer submenuId=(Integer)request.getAttribute("submenuId");
											
												Integer id=	((ProductManagementData)(pageContext.findAttribute("product"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "productId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td  align="center"><a
											href="${pageContext.request.contextPath}/AdminUI/sysSetting/editProduct?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
											title="edit"
											src='${pageContext.request.contextPath}/images/edit.gif'
											style='cursor: hand' align="center" /></a></td>
										</tr>
									</c:forEach>
	                                
	                              </tbody>
	                            </table>
	                          </div>
	                        </div>
                     	 </div>
                      
	                
					<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
		
			
	</form:form>


</body>
</html>