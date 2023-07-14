<%@page import="java.util.Arrays"%>

<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
	<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
		<%@ page import="com.ng.sb.common.dataobject.FinancialInstrumentData" %>
		<%@ page import="java.util.UUID" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/Partner.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/commonfunction.js></script>
<title>Financial Instrument</title>

<script>
$(function () {

	 var currentDate=new Date(); 
	 currentDate.setDate(currentDate.getDate());
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			minDate : currentDate,
           // useCurrent: false,
    });
});
</script>
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>
<body>
<form:form id="financialInstruments" method="post"
	modelAttribute="financialinstrumentdata"
	action="${pageContext.request.contextPath}/AdminUI/partnerManagement/savefinancialinstrument">

<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			Financial Instruments
		</h1>
		<div class="clearfix"></div>	
		<hr>
  	<c:if test="${successMessage!=''}">
									<div id="successMessageId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
		
	</div>
	
	
	
            			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="instrumentDivId" class="styled-input" >
									<form:input
										id="instrumentId" path="instrumentname" class=" selecttag" type="text"  onclick="emptyerror('lab_instrumentname_ErrorId');refresh('successMessageId');" 
										onfocus="removeHasError('instrumentDivId');showlabel('lab_instrumentname','lab_instrumentname_ErrorId');emptyerror('lab_instrumentname_ErrorId')"
										onchange="checkField('instrumentId','FinancialInstruments','name','lab_instrumentname_ErrorId','lab_instrumentname');"
										onkeypress="onlyAlphabetlatest(event,'lab_instrumentname_ErrorId','lab_instrumentname');emptyerror('lab_instrumentname_ErrorId');" />
										<label id="lab_instrumentname" class="valid"><spring:message code="lab_instrumentname" /></label>
										<label id="lab_instrumentname_ErrorId" class="collapse"></label>
										
					    		</div>
					    	</div>
	
	
		                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="div_fromDate" class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_start_date" path="fromDate" class=" selecttag" autocomplete="off"
										type="text" onclick="selecttag1('label_fromDate','lab_start_date')"
										onfocus="emptyerror('lab_start_date_ErrorId');
										removeHasError('div_fromDate');selecttag('label_fromDate','lab_start_date')"  />
										<label id="label_fromDate"class="valid"><spring:message code="lab_start_date" /></label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_fromDate');removeHasError('div_fromDate');showlabel('label_fromDate','lab_start_date')"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="div_toDate" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="lab_end_date"
										path="toDate" class="selecttag" type="text" autocomplete="off"
										onclick="selecttag1('label_toDate','lab_end_date')"
										onchange="selecttag('label_toDate','lab_end_date');"
										onfocus="emptyerror('lab_end_date_ErrorId');
										removeHasError('div_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"/>
											<label id="label_toDate"class="valid"><spring:message code="lab_end_date" /></label>
											<label id="lab_end_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"><i class="glyphicon glyphicon-calendar" 
										onclick="removeHasError('div_toDate');selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId')"></i> </i>
					    		</div>
                      		</div>
                      	</div>
	                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
									<input type="submit" value="submit" class="btn btn-warning" onclick="validateFinancialInstrument(event)"/>
                     	</div>
						<div class="clearfix"></div>
		                      </div>
						<br>	
	                	<div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive">
	                            <table id="abc" class="table table-bordered table-striped">
	                              <thead>
	                                <tr>
	                                  	<th><spring:message code="lab_instrumentname" /></th>
										<th><spring:message	code="fromDate" /></th>
						  				<th><spring:message code="toDate" /></th>
						  				<th>Status</th>
										<th><spring:message code="lab_Action" /></th>
	                                </tr>
	                              </thead>
	                              <tbody>
	                                <c:forEach items="${financialinstrumentdata.lists}" var="instrumentlist" >
										<tr>
											<td>${instrumentlist.instrumentname}</td>
											<td>${instrumentlist.fromDate}</td>
											<td>${instrumentlist.toDate}</td>
											<td>${instrumentlist.status}</td>
											<%
														Integer menuId=(Integer)request.getAttribute("menuId");
												Integer submenuId=(Integer)request.getAttribute("submenuId");
												Integer id=	((FinancialInstrumentData)(pageContext.findAttribute("instrumentlist"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "instrumentId="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
											<td  align="center"><a
											href="${pageContext.request.contextPath}/AdminUI/partnerManagement/financialInsrumentsEdit?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>"><img
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