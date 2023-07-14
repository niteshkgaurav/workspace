 <%@ page contentType="text/html;charset=UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
	<script type="text/javascript" src="${pageContext.request.contextPath}/json/json.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/MerchantConfiguration.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#mmidDIV').hide();
		$('#bankDIV').hide();
		$('#ccDIV').hide();
		$('#walletDIV').hide();
		// $("#lab_account_type1").prop('disabled', 'true');
		 ($('#seq1').is(':checked')) ? $('#row1').show() : $("#lab_account_type1").attr("disabled", true); 
		($('#seq2').is(':checked')) ? $('#row2').show() : $("#lab_account_type2").attr("disabled", true);
		onload();
	});
	

  </script>
</head>
<body>

<form:form id="merchentConfig"  method="post"  modelAttribute="hostPartnerPreferenceData" >
 		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="Partner Preference Edit" /></h1>
	                      <div class="clearfix"></div>
	                      <hr> </hr>
	                      
	                      <c:if test="${successmsg!=''}">
									<div id="messagesIds"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successmsg}</p> 
									</div> 
							</c:if>
						<div id="notMatchMessage" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center " >	
				           	
						</div>
							
	          </div>
	        
	          		
	        
	          <div class="row" id="rootTable">
	          					
	          					
	                    	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							        <div class="styled-input">
		                          		
											<input id="hostName" class="selecttag "  type="text" name="hostName" 
												value="${name}"	onchange="selecttag('hostName1','hostName')"
												readonly="true" />
					    				 <label id="hostName1" class="valid"><spring:message code="lab_Host_sub_version"/></label>
					    					
		                           </div>
			                </div>
	                      	
	                      	 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                        <div class="row">
		                          <div class="col-md-4 col-lg-4 pr0">
		                            	<div id="row1" class="checkbox">
					                          <form:checkbox id="seq1" path="seq1" value="1" checked="true" onclick="enableSelect();"/> 
					                          <label for="seq1"> <span>1 </span> </label>
					                        </div>
		                          </div>
		                          <div class="col-md-8 col-lg-8 pl0">
		                            <div class="styled-input" id="select1">
													<form:select id="lab_account_type1" path="typeName1" class="selecttag" value=""
													onchange="selecttag('label_account_type1','lab_account_type1')"
													onfocus="showlabel('label_account_type1','lab_partnerPrefErrorId')" 
													onclick="emptyerror(event,'lab_partnerPrefErrorId');emptyerror(event,'seqErrorId');this.setAttribute('value', this.value)">
			                                            <form:option value="0" label=" " />
			                                             <form:options items="${hostPartnerPreferenceData.type}"/>
			                                        </form:select>
													<span></span>
												<label  class="valid" id="label_account_type1"><spring:message
														code="Please select sequence" /></label>
												<label id="lab_partnerPrefErrorId" class="collapse"></label>
												
										</div>
		                          </div>
		                       </div>
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		                  <div class="row">
		                          <div class="col-md-4 col-lg-4 pr0">
		                            	<div id="row2" class="checkbox">
					                           <form:checkbox id="seq2" path="seq2" value="2" onclick="enableSelect2();"/>
					                          <label for="seq2"> <span>2 </span> </label>
					                     </div>
		                          </div>
		                          <div class="col-md-8 col-lg-8 pl0">
		                            <div class="styled-input" id="select2">
													<form:select id="lab_account_type2" path="typeName2" class="selecttag" value=""
													onfocus="showlabel('label_account_type2','lab_partnerPrefErrorId')" 
													onchange="selecttag('label_account_type2','lab_account_type2')" 
													onclick="emptyerror(event,'lab_partnerPrefErrorId');emptyerror(event,'seqErrorId');this.setAttribute('value', this.value)">
                                             <form:option value="0" label=" " />
                                             <form:options items="${hostPartnerPreferenceData.type}"/>
                                        </form:select>
													<span></span>
												<label  class="valid" id="label_account_type2"><spring:message
														code="Please select sequence" /></label>
												<label id="lab_partnerPrefErrorId" class="collapse"></label>
												
										</div>
		                          </div>
		                    </div>
                      </div>
                       <div  id="seqErrorId" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                   </div>
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
                      	<input type="submit"
							value="submit" onclick="return validateMerchantPage();" class="btn btn-warning" />
                      </div>
	         </div>
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>
</html>