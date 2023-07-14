<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<link rel="stylesheet" type="text/css" 	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Denomination.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>

<title>Denomination Creation</title>
<script>
$(function () {
	  var currentDate=new Date(); 
	  currentDate.setDate(currentDate.getDate() + 1);
	  $('.datetimepicker1').datetimepicker({
	         
	   format: 'YYYY-MM-DD',
	   minDate : currentDate,
	            useCurrent: false,
});
});

</script>

<script>
$(document).ready(function(){
	
	   var modelAttributeValue = '${denominationData.denominationDataList.size()}';
	 if(modelAttributeValue==0)
	{
		 $('#list').hide();
	}
	}); 
</script>

<style type="text/css">
  li {
    color: black;
  }
</style>

<script>
	$(document).ready(function() {
    $('#table_id').DataTable({
    	"scrollY":"400px",
        
        "scrollCollapse": true,
        "paging":         true,
        "pagingType": "simple_numbers"
    	
    	
    }	
    );
} ); 
	</script>
	
	<style>
	#remarks{
	resize:none;
	
	}
	</style>
	
</head>
<body class="PageType">
<div>
<form:form id="denominationCreation" method="post"  modelAttribute="denominationData" action="${pageContext.request.contextPath}/AdminUI/pinMgmnt/denominationCreation">
	           <div class="heading-inner  ">
	           <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left"><spring:message code="lab_denominationAdd"/></h1>
	                      <div class="clearfix"></div>
	                      <hr>
	                    <%--  <c:if test="${denominationData.denominationDataList.size()==0}">
									<script>
									alert('');
									$('#list').hide();
									</script>
							</c:if>
							<c:if test="${denominationData.denominationDataList.size()!=0}">
									<script>
									$('#list').show();
									</script>
							</c:if> --%>
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
	        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="lab_denominationName"  var="lab_denominationName"/>
					<form:input type="text" class="selecttag" path="denominationName"   id="IddenominationName" autocomplete="off" 
						onclick="selct('denominationNameId');emptyerror(event,'denominationNameErrorId');" 
						onfocus="showlabel('denominationNameId','denominationNameErrorId');clearmsg();"
					  	onChange="selecttag('denominationNameId','denominationName');"/>
					<label id="denominationNameId" class="valid">${lab_denominationName}</label>  
					<label id="denominationNameErrorId" class="collapse"></label>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="styled-input">
					<spring:message code="lab_denominationValue" var="lab_denominationValue"/>
					<form:input type="text" path="denominationValue" id="denominationValue" maxlength="3" autocomplete="off" 
					      onkeypress="onlyNumric(event,'lab_denominationValueErrorId','denominationValueId');" class="selecttag"
					      onclick="selct('denominationValueId');emptyerror(event,'lab_denominationValueErrorId');"
					      onfocus="showlabel('denominationValueId','lab_denominationValueErrorId');clearmsg();"
					  	onChange="selecttag('denominationValueId','denominationValue');"/>
					<label id="denominationValueId" class="valid">${lab_denominationValue}</label>
					<label id="lab_denominationValueErrorId" class="collapse"></label><span></span>
	  			</div>
	  		</div>
		
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
                          <div   class="styled-input" >
                           <div class="input-group date datetimepicker1">
         <form:input id="startDate" type="text"  path="startDate" class=" selecttag"
          autocomplete="off" onchange="selecttag('startDateId','startDate');" 
          onfocus="emptyerror(event,'startDateErrorId');emptyerror(event,'errorId');
          showlabel('startDateId','startDateErrorId')"  />
          <label id="startDateId"class="valid"><spring:message code="lab_start_date" /></label>
          <label id="startDateErrorId" class="collapse"></label>
          <i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
           onclick="selecttag1('startDateId');showlabel('startDateId','startDateErrorId');"></i> </i>
            </div>
           </div>
          </div>
			
			
			
			
			
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 "> 
           <div class="styled-input" >
            <div class="input-group date datetimepicker1">
         <form:input id="endDate" autocomplete="off"
          path="endDate" class="selecttag" type="text" 
          onchange="selecttag('endDateId','endDate');" 
          onfocus="emptyerror(event,'endDateErrorId');emptyerror(event,'errorId');
         showlabel('endDateId','endDateErrorId')"/>
           <label id="endDateId"class="valid"><spring:message code="lab_end_date" /></label>
           <label id="endDateErrorId" class="collapse"></label>
          <i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
          onclick="selecttag1('endDateId');showlabel('endDateId','endDateErrorId');"></i> </i>
           </div>
                        </div>
                       </div>
			
			
	  				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  					<input id="submitId" type="submit" class="btn btn-warning"  value="Submit" onclick="validateDenomination(event);"/>
	  				</div>
	  	<div id="lab_denominationErrorId"></div>
	  	</div>
	  	<div class="row">&nbsp;</div>
	  	<div class="row" id="denolist">
	   <div id='divId' align='center' class="collapse col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
	  							<div class="styled-input">
	  								<textarea class="selecttag" maxlength="125" rows="5" cols="25" id="remarks" onfocus="showlabel('reason','remarksErrorId');" onchange="selecttag('reason','remarks')"></textarea>
	  								<label id="reason"class="valid">Reason for deactivation</label>
	  								<label id="remarksErrorId" class="collapse"></label>
	  							</div>
						
					
						 <input type='button' value='Deactivate' id='btnYes' onclick="deactivate('${listVar.id}')" />
   						 <input type='button' value='Cancel' id='btnNo' onclick="cancel();"/> 
					</div> 
	  	<div>&nbsp;</div>
				<c:set var="fspService" value="1" scope="page" />
				
				
	  			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb" >
	  			
                 <div class="transaction-table">
                 
                     <div class="table-responsive">
                     
                    <div id="lab_deactiveId" class="collapse" align="center"></div>
                   
						<table class="table table-striped table-bordered table-hover" id='table_id' >
                           <thead> 
	  					<tr class="mainTableHeader"  id="list">
	  						<th align="center"><b><spring:message code = "lab_denominationName"/></b></th>
	  						<th align="center"><b><spring:message code = "lab_denominationValue"/></b></th>
	  						<th align="center"><b><spring:message code = "fromDate"/></b></th>
	  						<th align="center"><b><spring:message code = "toDate"/></b></th>
	  						<th align="center"><b><spring:message code = "lab_action"/></b></th>
	  					</tr>
	  					</thead>
	  					
	  				
	  					<!--     <div class="table-responsive" style="height: 200px; overflow: auto;">
	  					    
	  					    <table id="tableData" class="table table-bordered table-striped table-condensed" style="table-layout:fixed">
	  					 -->   
	  					  <tbody>
	  					<c:forEach var="listVar" items="${denominationData.denominationDataList}" varStatus="counter"> 
	  						<tr id="rowId_${listVar.id}">
	  							<td align="center">${listVar.denominationName}</td>
	  							<td align="center">${listVar.denominationValue}</td>
	  							<td align="center">${listVar.startDate}</td>
	  							<td align="center">${listVar.endDate}</td>
	  							<td align="center"><input id="deactivate_${listVar.id}" type="button" value="Deactivate" class="rwDel" onclick="dialoguebox('rowId_${listVar.id}','${listVar.id}');"/></td>
	  						</tr>
	  						
	  					</c:forEach>
	  					</tbody>
	  				</table>
	  				
	  					<label id="lab_deactiveId" class="collapse"></label>
	  				</div>
	  				</div>
	  			</div>
</div>

<%-- <form:hidden path="hiddenid" value="${denominationData.id}" /> --%>
<form:hidden path="deactivateid"  id="deactivateid" />
</form:form>
</div>
</body>
</html>