<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/SystemSettingCommon.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<script type="text/javascript"
src=${pageContext.request.contextPath}/js/IDCreatipon.js></script>
	
<title>ID Creation</title>
    &nbsp;
	                      &nbsp;
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );
</script>	


<script>
function removeStyleTag(id)
{
	$("#"+id).attr("style","");
}
</script>
</head>
<body class="PageType">


	<form:form id="productCreationForm" name="productCreationForm"
		method="post" modelAttribute="idCreationData"
		action="${pageContext.request.contextPath}/AdminUI/kycController/IDCreation"
		enctype="multipart/form-data">
					<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="ID_Creation"/></h1>
	                      <div class="clearfix"></div>
	                     
	                     	<c:if test="${message!=''}">
									<div id="manadatory_message"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${message}</p> 
									</div> 
							</c:if>	 
				          				 <div id="statusmess" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
									 
										</div>
								
							
	                    </div>
	                     <div class="row">
	                     
	                      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                       &nbsp; &nbsp;
	                      </div>
	                      
	                    	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_lab_Name" class="styled-input">
												<form:input type="text" class="selecttag"
													id="lab_Name" path="name" name="name" size='40' maxlength='40'
													onchange="validateName(event,'NameErrorId');selecttag('label_Name','lab_Name')" 
													onclick="emptyerror(event,'NameErrorId'); abc();"
													onfocus="removeHasError('div_lab_Name');showlabel('label_Name','NameErrorId')" 
													onkeypress="blockSpecialChar(event,'NameErrorId');"
												 ></form:input>
											<span></span>
										<label id="label_Name" class="valid"><spring:message code="lab_Name" /></label>
										<label id=NameErrorId class="collapse"></label>
										
								</div>
	                      	</div>
	                      	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_lab_Description" class="styled-input">
												<form:input  type="text" class="selecttag"
													id="lab_Description" path="description" name="description"
													size='40' maxlength='40' onchange="selecttag('label_Description','lab_Description')"
													value="" onclick="emptyerror(event,'descriptionErrorId');abc();showlabel('label_Description','descriptionErrorId')"
													onkeypress="blockSpecialChar(event,'descriptionErrorId');" onfocus="removeHasError('div_lab_Description');" 
												 ></form:input>
											<span></span>
										<label id="label_Description" class="valid"><spring:message code="lab_Description" /></label>
										<label id=descriptionErrorId class="collapse"></label>
										
								</div>
	                      	</div>
	                      	
	                      	
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="idtypeID">
											<label id="lab_username1"  class="valid">Id Type</label>
										<form:select path="idtype" id="idtype"  onfocus="removeHasError('idtypeID');" onclick="removeStyleTag('lab_username1');refresh('msgId');refresh('ermsgId');emptyerror('lab_StatusErrorId');"
										 >
										<form:option value=" " label=" "/>
	  				                                  <form:option value="PhotoId"  label="Photo Id Proof"/>
													  <form:option value="AddressId"  label="Address Id Proof"/>
													   <form:option value="BiometricId"  label="Bio-Metric Proof"/>
										
	  				     </form:select>			
											</div>
									</div>
	                      	
	                      	
	                      	
	                      		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div  class="styled-input" id="IdProofWeightId">
											<label id="label_IdProofWeight" class="valid">Id Proof Weight</label>
										<form:select path="idProofWeight" id="IdProofWeight"  
										onfocus="removeHasError('IdProofWeightId');" value= "${productlist.idProofWeight}"
										onclick="removeStyleTag('label_IdProofWeight');refresh('msgId');refresh('ermsgId');emptyerror('lab_StatusErrorId');">
	  				                 	<form:option value="" label=" " />
											<form:options items="${weight}" />
													  
										
	  				     </form:select>			
											</div>
									</div>
	                      	
	                      	
	                      	
	                      <%-- 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					              <div id="div_kycdescriptor" class="styled-input">
												 <form:select path="kycdescriptor" class="selecttag" 
												  onfocus="removeHasError('div_kycdescriptor');showlabel('label_kycdescriptor','descripErrorId')" value=""
													 onclick="emptyerror(event,'descripErrorId'); abc();this.setAttribute('value', this.value)"
													  onchange="selecttag('label_kycdescriptor','kycdescriptor')"> 
												     <form:option value=" "  label=" "/>
													 <form:option value=photoid"  label="photoid"/>
													  <form:option value="addressid"  label="addressid"/>
													   <form:option value="biometricid"  label="biometricid"/>

	    										 </form:select>
											<span></span>
										<label id="label_kycdescriptor">Id Type</label>
										<label id=descripErrorId class="collapse"></label>
										
								</div>
	                      	</div> --%>
	                      	 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	                      	
	                      		<input type='submit' class="btn btn-warning" value="Submit"
									src='${pageContext.request.contextPath}/images/Submit.gif'
									id='addBtn' onClick="return validateIDCreationfrom(event);"
									onMouseOver="submitBtn.src = 'image/ui/Add_Rollover.gif'"
									onMouseOut="submitBtn.src = 'image/ui/Submit.gif'">
	                      	</div>
	                      	
	                  
	                      	<div class="clearfix"></div>
	                      		
						     <script type="text/javascript">
						     
						     $("#lab_Name").val('');
						     
						     </script>
						     <script type="text/javascript">
						     
						     $("#lab_Description").val('');
						     
						     </script>
							 <script type="text/javascript">
						     
						     //$("#lab_KYC_Descriptor").val('');
						     
						     </script>
	                      	    &nbsp;
	                      &nbsp;
	                      	<div class="col-xs-12">
			                   <div class="transaction-table">
			                      <div class="table-responsive">
			                          <table id="table_id" class="table table-bordered table-striped">
			                         	<tr>
			                         		<th><spring:message code="lab_Name" /></th>
											<th><spring:message code="lab_Description" /></th>
											<th>Id Proof Weight</th>
											<th>Id Type</th>
											<th><spring:message code="lab_Action" /></th>
			                         	</tr>
			                         	 <c:forEach items="${idCreationData.iddatalist}" var="productlist" >
											 <tr>
											  
												<td>${productlist.name}</td>
												<td>${productlist.description}</td>
												 <td>${productlist.idProofWeight}</td>
												 <td>${productlist.idtype}</td>
												<form:hidden path="checkname" value="${productlist.name}"/>
															<td align="center"><img align="middle" style="cursor: hand" src="/securebanking/images/edit.gif" title="edit" 
														onclick="forEdit('${productlist.id}','${productlist.kycdescriptor}','${productlist.name}','${productlist.description}','${ productlist.code}', '${productlist.idtype}', '${productlist.idProofWeight}');"></td>
						
											</tr>
					
                  					 	</c:forEach>
			                          </table>
			                      </div>
			                   </div>
			               </div>
	                     </div>
		
     <form:hidden id="hiddenId" path="hiddenId" value=""/>
     <form:hidden id="hiddencodeid" path="hiddencodeid" value=""/> 
   
		<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	</form:form>


</body>
</html>