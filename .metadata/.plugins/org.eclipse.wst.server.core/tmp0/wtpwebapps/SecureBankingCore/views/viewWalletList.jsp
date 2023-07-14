<%@page import="com.ng.sb.common.model.WalletType"%>
<%@page import="com.ng.sb.common.util.SystemConstant"%>
<%@page import="java.io.PrintWriter, com.ng.sb.common.util.KeyEncryptionUtils"%>
<%@ page import="com.ng.sb.common.dataobject.LoginData" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.UUID" %>
<%@ page import="com.ng.sb.common.dataobject.UserAccountData" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatable_js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.min.css"></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script>
$(function () {

	 var currentDate=new Date(); 
	 currentDate.setDate(currentDate.getDate() - 1);
	 $('.datetimepicker1').datetimepicker({
         
			format: 'YYYY-MM-DD',
			minDate : currentDate,
            useCurrent: false,

      });
		
	});
 </script>
<!-- <script type="text/javascript">
history.pushState({}, '', '/securebanking/AdminUI/walletManagement/getWalletList');
</script> -->
<style type="text/css">
  li {
    color: black;
  }
</style>

<script type="text/javascript">
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable();
	  }
} );



function removeStyleTag(id)
{
	$("#"+id).attr("style","");
}
</script>	
	
</head>
<%
  LoginData loginData = (LoginData)session.getAttribute(SystemConstant.LOGINDATA);
  String key = loginData.getKey();
 %>

<body class="PageType">
	

		<form:form 	id="appList" method="post" modelAttribute="walletData"
			action="${pageContext.request.contextPath}/AdminUI/walletManagement/walletDataSubmit"
			enctype="multipart/form-data">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="LABEL_WALLET_MANAGEMENT"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                     	<c:if test="${successMessage!=''}">
									<div id="msgId"  class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
                                           <p class="text-success">${successMessage}</p> 
									</div> 
							</c:if>	 
							<c:if test="${errorMessage!=''}"> 
								
				          				 <div id="ermsgId" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center" >
				           			
				                                           <p class="text-danger">${errorMessage}</p> 
									 
										</div>
								</c:if> 
						 
	                    </div>
	
				
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-right ">
					<button type="button" class="btn btn-warning " onclick="toggleform('account');">Create Wallet</button>
					</div>
					<div style="height:75px" ></div>
				<div class="row collapse" id="account">
          		
          		
          		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="walletNamestyled-input">
					
					<form:input type="text" minlength="5" maxlength="50" class="selecttag" path="walletTypeName" id="walletTypeName"
						onclick="emptyerror(event,'walletNameErrorId');refresh('successMessageId');selct('walletNameId');"
						 onfocus="removeHasError('walletNamestyled-input');showlabel('walletNameId','walletNameErrorId');emptyerror(event,'walletNameErrorId')"
					  	onChange="checkField('walletTypeName','WalletType','walletTypeName','walletNameErrorId','walletNameId'); removeClass('walletNameId','walletTypeName')"
					  		onkeypress="onlyAlphabetlatest(event,'walletNameErrorId','walletNameId');emptyerror(event,'walletNameErrorId');"/>
					<label id="walletNameId" class="valid"><spring:message code="lab_walletName" /></label>  
					<label id="walletNameErrorId" class="collapse"></label>
				</div>
			</div>
        
          		  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="walletDescstyled-input">
					
					<form:input type="text" maxlength="125" class="selecttag" path="walletTypeDesc" id="walletTypeDesc" 
						onclick="emptyerror(event,'walletDescErrorId'); refresh('successMessageId');" 
						onfocus="removeHasError('walletDescstyled-input');showlabel('walletDescId','walletDescErrorId');emptyerror(event,'walletDescErrorId')"
					  	onChange="selecttag('walletDescId','walletTypeDesc');"
					  onkeypress="emptyerror(event,'walletDescErrorId');"/>
					<label id="walletDescId"  class="valid"><spring:message code="lab_Description" /></label>  
					<label id="walletDescErrorId" class="collapse"></label>
				</div>
			</div>
          
	                      
	                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="statusDiv">
			                          <form:select class="selecttag" path="status" id="statusId" 
			                          onclick="removeStyleTag('statId');emptyerror(event,'statusError');refresh('successMessageId');this.setAttribute('value', this.value);" value=""  
			                          onchange="selecttag('statId','statusId')" 
			                          onfocus="removeHasError('statusDiv');showlabel('statId','statusError');emptyerror(event,'statusError')"
			                          onkeypress="emptyerror(event,'statusError');">
			                          <form:option value="" label=" " />
													<form:option value="true" label="active" />
													<form:option value="false" label="Inactive" />
															</form:select>
			                           
			                           <label id="statId" class="valid"><spring:message code="lab_status" /></label>
			                          <label id="statusError" class="collapse"></label>
	                          </div>
	                      </div>
	                      
	                      
          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_start_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input id="startDate" type="text"  path="startDate" class=" selecttag"
									onkeyup="onlyNumeric('startDate','startDateErrorId','startDateId');" 
									maxlength="12"
										autocomplete="off" onchange="selecttag('startDateId','startDate');selct('startDateId')" 
										onclick="removeHasError('divID_start_date')"
										onfocus="emptyerror(event,'startDateErrorId');emptyerror(event,'errorId'); 
										removeHasError('divID_start_date');showlabel('startDateId','startDateErrorId')"  />
										<label id="startDateId" class="valid"><spring:message code="lab_start_date" /></label>
										<label id="startDateErrorId" class="collapse"></label>
										<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('startDateId');showlabel('startDateId','startDateErrorId');removeHasError('divID_start_date');"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="toDate_divID" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="endDate" autocomplete="off"
										path="endDate" class="selecttag" type="text" 
										onkeyup="onlyNumeric('endDate','endDateErrorId','endDateId');" 
									maxlength="12"
										onchange="selecttag('endDateId','endDate');selct('startDateId')" 
										onclick="removeHasError('toDate_divID')"
										onfocus="emptyerror(event,'endDateErrorId');emptyerror(event,'errorId');
										removeHasError('toDate_divID');showlabel('endDateId','endDateErrorId')"/>
											<label id="endDateId" class="valid"><spring:message code="lab_end_date" /></label>
											<label id="endDateErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('endDateId');showlabel('endDateId','endDateErrorId');removeHasError('toDate_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>
                      	  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="walletAmountstyled-input">
					
					<form:input type="number"  min="1" max="100000" class="selecttag" path="amount" id="walletTypeAmount" 
						onclick="emptyerror(event,'walletAmountErrorId'); refresh('successMessageId');" 
						onfocus="removeHasError('walletAmountstyled-input');showlabel('walletAmountId','walletAmountErrorId');emptyerror(event,'walletAmountErrorId')"
					  	onChange="selecttag('walletAmountId','walletTypeAmount');"
					  onkeypress="emptyerror(event,'walletAmountErrorId');"/>
					<label id="walletAmountId" class="valid" ><spring:message code="lab_amount" /></label>  
					<label id="walletAmountErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center" id="submit">
					<input type='submit' class="btn btn-warning" value="Submit" onclick="return validateCreateWallet(event);">
					</div>
					<div class="clearfix"></div>
		</div>	
		  <br> 
	                     <div class="col-xs-12">
	                        <div class="transaction-table">
	                          <div class="table-responsive" style="height: 500px; overflow: auto;">
	                            <table id="table_id" class="table table-bordered table-striped">
	                            	
	                               <thead>
	                              	   	<tr>
	                              	   		<th><spring:message code="lab_walletName" /></th>
											<th><spring:message code="lab_Description" /></th>
											<th><spring:message code="lab_start_date" /></th>
											<th><spring:message code="lab_end_date" /></th>
											<th><spring:message code="lab_status" /></th>
											<th><spring:message code="lab_edit" /></th>
	                              	   	</tr>
	                              	</thead>
	                              <c:forEach items="${walletDataList.walletTypeDetails}" var="walletList">
								 <tr id="rowId_${walletList.id}">
								<td>${walletList.walletTypeName}</td>
								<td>${walletList.walletTypeDescription}</td>
								<td><%=KeyEncryptionUtils.dateToString(((WalletType)(pageContext.findAttribute("walletList"))).getStartDate(), SystemConstant.DATE_FORMAT)%>      </td>
								<td><%=KeyEncryptionUtils.dateToString(((WalletType)(pageContext.findAttribute("walletList"))).getEndDate(), SystemConstant.DATE_FORMAT)%> </td>
								<td><c:if test="${walletList.status=='false'}">
   									 <p>Inactive</p>
   									 	</c:if>
									<c:if test="${walletList.status=='true'}">
    									<p>active</p>
										</c:if>
										</td>
										<%
											Integer menuId=Integer.parseInt((String)request.getAttribute("menuId"));
											Integer submenuId=Integer.parseInt((String)request.getAttribute("submenuId"));
												Integer id=	((WalletType)(pageContext.findAttribute("walletList"))).getId();
												String encryptedId=KeyEncryptionUtils.encryptUsingKey(key, "id="+id+"&menuId="+menuId+"&submenuId="+submenuId);
												String param=UUID.randomUUID().toString();
												String param1=UUID.randomUUID().toString();
												%>
				                <td align="center" width="10%"><a href="${pageContext.request.contextPath}/AdminUI/walletManagement/updateWallet?enc=<%=encryptedId %>&param1=<%=param %>&param2=<%=param1 %>">
								<img title="view"src='${pageContext.request.contextPath}/images/edit.gif'
								style='cursor: hand'/>
											</a></td> 			
									
							</tr>
					</c:forEach> 
          
				 
	                              </table>
	                             </div>
	                            </div>
	                           </div>
	                      <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	                           
	                           </form:form>
	<script>
		$("#showSubmit").hide();
	</script>
</body>
</html>