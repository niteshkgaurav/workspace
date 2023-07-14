<%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ page import="java.util.*" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        
        <script type="text/javascript" src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script> 
       <script type="text/javascript" src=${pageContext.request.contextPath}/js/Product_edit.js></script> 
       <script type="text/javascript"
	src=${pageContext.request.contextPath}/js/Product_Management.js></script>
	<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
      
<title>Product Management Edit</title>
<script>
$(document).ready(function(){
	var commission = document.getElementById("commission").value;
	if(commission == 1) {
		 document.getElementById("txnTypeDivId").style.display="block";
	} else if (commission == 0) {  
	 	document.getElementById("txnTypeDivId").style.display="none";
 	}	
})

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
<body onload="afterPageLoad">
<form:form id="productEditForm1" name="productEditForm1" method="post"  modelAttribute="productManagementData" action="${pageContext.request.contextPath}/AdminUI/sysSetting/editProduct">              		 
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
	                	 
          			<div class="row">
                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div class="styled-input">
		                          <spring:message code="lable_productName" var="lable_productName" /> 
										<form:input type='text' id="lable_productName" path="productName"
											name='newsubcategoryname' size='40' maxlength='40' placeholder="."
											class="selecttag" onblur="javascript:return Category_check()"
											onfocus="showlabel('lab_productName','productNameErrorId');jkl();removeerrormessege();"
											onclick="abc();removeErrorMessage();" 
											onkeypress="blockSpecialChar(event,'productNameErrorId'); "
											onchange="selecttag('lab_productName','lable_productName');return validateProductName(event,'productNameErrorId');" />
					    					 <label id="lab_productName" class="valid">${lable_productName}</label>
					    					  <label id="productNameErrorId" class="collapse"></label>
					    					 
                          		 </div>
                      		</div>
                      		 
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                       	 <div class="styled-input">
	                        	<spring:message code="lab_Product_description" var="lab_Product_description" /> 
			                          <form:input type='text'
										id="lable_productDescription" path="description"
										name='description' size='40' maxlength='120' class="selecttag"
										onkeypress="blockSpecialChar(event,'productTypeErrorId');" 
										onfocus="showlabel('lab_productName','productNameErrorId');"
										onchange="selecttag('lab_productDescription','lable_productDescription');spaceNotAllowed();" 
										onclick="adc();removeDescErrorMessage();" />
			                          <label id="lab_productDescription" class="valid">${lab_Product_description}</label>
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
								 <label id="lable_typeId" class="valid"><spring:message code="lab_Type" /></label>
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
					<form:select path="serviceStk" id="txnTypeId" style="float:left;" 
						onfocus="showlabel('txnTypeId','txnTypeErrorId');" 
						onclick="this.setAttribute('value', this.value);">
						<c:forEach items="${serviceConfig}" var="svc">
			        		<form:option value="${svc.stkCode}">${svc.serviceName}</form:option>
						</c:forEach>
					</form:select>
					<label id="commissionId" class="valid" ><spring:message code="LABEL_COMMISSION" /></label>  
					<label id="commissionErrorId" class="collapse"></label>
				</div>
               	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6  col-md-offset-2">
               	 	<form:input type="hidden" path="id" name="id" id="id"></form:input>
              	 </div>
              	  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                   	 <input type='submit' value="Update" class="btn btn-warning" src='${pageContext.request.contextPath}/images/Submit.gif' id='addBtn' 
					onClick="return validateProductfrom(event,'${productId}'); " onMouseOver = "submitBtn.src = 'image/ui/Add_Rollover.gif'" 
					onMouseOut = "submitBtn.src = 'image/ui/Submit.gif'"/>
                   	</div>
				</div>
					
		 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>


</body>
</html>