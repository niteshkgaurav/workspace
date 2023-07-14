<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/apps.js"></script> 
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>
</head>


		<form:form 	id="appList" method="post" modelAttribute="walletDetails"
			action="${pageContext.request.contextPath}/AdminUI/walletManagement/updateWalletDetail"
			enctype="multipart/form-data">
         		<div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Wallet Topup</h1>
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
	                    
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-Left ">
			<table>
			<tr>
			<td>
			<font size="3px"><b>Commission Wallet Balance:&nbsp;</b>INR&nbsp;${commissionBalance}</font>
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			<font size="3px"><b>Trading Wallet Balance:&nbsp;</b>INR&nbsp;${tradingBalance}</font>
			</td>
			</tr>
			</table>
			</div>
			<div>&nbsp;<br></div>
			<c:if test="${not empty walletDetails.hostMap}">
				 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="hostDiv">
	                        
			                          <form:select class="selecttag" path="host" id="host" onclick="emptyerror(event,'productError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getBalance(this,'distributor','subDistributor','agent');selecttag('hostId','host');" 
			                           onfocus="removeHasError('hostDiv');showlabel('hostId','hostError');emptyerror(event,'hostError')"
			                          	onkeypress="emptyerror(event,'hostError');">
			                          <form:option value="" label=" " />
												<form:options items="${walletDetails.hostMap}" />
															</form:select>
			                           
			                           <label id="hostId" class="valid">Select Host</label>
			                          <label id="hostError" class="collapse"></label>
	                          </div>
	                      </div>
	                     </c:if> 
	                      <c:if test="${not empty walletDetails.distMap}">
	                      	 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="distDiv">
			                          <form:select class="selecttag" path="distributor" id="distributor" onclick="emptyerror(event,'productError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getBalance(this,'host','subDistributor','agent');selecttag('distId','distributor');" 
			                           onfocus="removeHasError('distDiv');showlabel('distId','distError');emptyerror(event,'distError')"
			                          	onkeypress="emptyerror(event,'distError');">
			                          <form:option value="" label=" " />
												 <form:options items="${walletDetails.distMap}" /> 
															</form:select>
			                           
			                           <label id="distId" class="valid">Select Partner</label>
			                          <label id="distError" class="collapse"></label>
	                          </div>
	                      </div>
	                      </c:if>
	                        <c:if test="${not empty walletDetails.subDistMap}">
	                      	 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="subDistDiv">
			                          <form:select class="selecttag" path="subDistributor" id="subDistributor" onclick="emptyerror(event,'subDistError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getBalance(this,'host','distributor','agent');selecttag('subDistId','subDistributor');" 
			                           onfocus="removeHasError('subDistDiv');showlabel('subDistId','subDistError');emptyerror(event,'subDistError')"
			                          	onkeypress="emptyerror(event,'subDistError');">
			                          <form:option value="" label=" " />
												 <form:options items="${walletDetails.subDistMap}" /> 
															</form:select>
			                           
			                           <label id="subDistId" class="valid">Select Mall</label>
			                          <label id="subDistError" class="collapse"></label>
	                          </div>
	                      </div>
	                      </c:if>
	                      	 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	                        <div class="styled-input" id="agentDiv">
			                          <form:select class="selecttag" path="agent" id="agent" onclick="emptyerror(event,'agentError');refresh('successMessageId');this.setAttribute('value', this.value);" value="" 
			                          onchange="getBalance(this,'host','distributor','subDistributor');selecttag('agentId','agent');" 
			                           onfocus="removeHasError('agentDiv');showlabel('agentId','agentError');emptyerror(event,'agentError')"
			                          	onkeypress="emptyerror(event,'agentError');">
			                          <form:option value="" label=" " />
												<form:options items="${walletDetails.agentMap}" /> 
															</form:select>
			                           
			                           <label id="agentId" class="valid">Select Outlet</label>
			                          <label id="agentError" class="collapse"></label>
	                          </div>
	                      </div>
	              <div id="balance" class="collapse col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="walletBalanceDiv">
					<form:input type="text"  maxlength="125" class="selecttag" path="walletBalance" id="walletBalance" readonly="true"/>
					<label id="appDescId" class="valid">Available Balance</label>  
				</div>
			</div>
			  <div id="amount" class="collapse col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="amountDiv">
					<form:input type="text"  maxlength="8" class="selecttag" path="amount" id="amount"
						onclick="emptyerror(event,'amountErrorId');refresh('successMessageId');showlabel('amountLab','amountErrorId');" 
						onfocus="removeHasError('amountDiv');showlabel('amountLab','amountErrorId');emptyerror(event,'amountErrorId')"
						onkeypress="onlyNumric(event,'amountErrorId','amountLab');"
					  	onChange="selecttag('amountLab','amount');"/>
					<label id="amountLab" class="valid">Enter Amount</label>  
					<label id="amountErrorId" class="collapse"></label>
				</div>
			</div>
			  <div id="reference" class="collapse col-xs-12 col-sm-12 col-md-6 col-lg-6">
				      <div class="styled-input" id="refDiv">
			                          <form:select class="selecttag" path="reference" id="ref" onclick="emptyerror(event,'agentError');refresh('successMessageId');this.setAttribute('value', this.value);" value="">
			                          <form:option value="By Cash" label="By Cash"/>
										<form:option value="By Cheque" label="By Cheque"/>
															</form:select>
			                           
			                           <label id="agentId" class="valid">Reference</label>
			                          <label id="agentError" class="collapse"></label>
	                          </div>
			</div>
			  <div id="commentId" class="collapse col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input" id="commDiv">
					<form:input type="text"  maxlength="30" class="selecttag" path="comment" id="comment"
						onclick="emptyerror(event,'commentErrorId');refresh('successMessageId');showlabel('commentLab','commentErrorId');" 
						onfocus="removeHasError('commDiv');showlabel('commentLab','commentErrorId');emptyerror(event,'commentErrorId')"
					  	onChange="selecttag('commentLab','comment');"/>
					<label id="commentLab" class="valid">Comment</label>  
					<label id="commentErrorId" class="collapse"></label>
				</div>
			</div>
          		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center ">
			<button type="submit" class="btn btn-warning " onclick="validateTopUp(event);">Submit</button>

		</div>	  
	                     </div>
	                     
	                     <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	                     
	                           </form:form>
</body>
</html>