<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="lable.usercreation.title.page" /></title>


<!-- 
<script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/role.js></script>

 
 
<title>role</title>

<script type="text/javascript">


$(document).ready(function(){
  // Check or Uncheck All checkboxes
  $("#checkall").change(function(){
    var checked = $(this).is(':checked');
    if(checked){
      $(".accountcheckBox").each(function(){
        $(this).prop("checked",true);
      });
    }else{
      $(".accountcheckBox").each(function(){
        $(this).prop("checked",false);
      });
    }
  });

 // Changing state of CheckAll checkbox 
 $(".accountcheckBox").click(function(){

   if($(".accountcheckBox").length == $(".accountcheckBox:checked").length) {
     $("#checkall").prop("checked", true);
   } else {
     $("#checkall").removeAttr("checked");
   }

 });
});
</script>



<!-- 


$(document).ready( function() {
$("#select_all").change(function(){  //"select all" change 
    $(".accountcheckBox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
});

//".checkbox" change 
$('.accountcheckBox').change(function(){ 
    //uncheck "select all", if one of the listed checkbox item is unchecked
    if(false == $(this).prop("checked")){ //if this item is unchecked
        $("#select_all").prop('checked', false); //change "select all" checked status to false
    }
    //check "select all" if all checkbox items are checked
    if ($('.accountcheckBox').length == $('.accountcheckBox').length ){
        $("#select_all").prop('checked', true);
    }
});







});


</script> -->
<script>
$(document).ready(function() {
	  if ($('body').is('.PageType')) {
		  $('#table_id').DataTable({
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers"
		  });
	  }
	  	  
} );





</script>
</head>
<body  class="PageType" >
<div class="row">
			<div class="heading-inner  ">
				<h1 class="pull-left">Add Role</h1>
				<div class="clearfix"></div>
	       		<hr>
</div>
</div>
 <div class="heading-inner  ">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      
	                      <div class="clearfix"></div>
	                      <hr>
	                      <c:if test="${successMessage!=''}">
									<div id="msgId"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
                                            <p class="text-success">${successMessage}</p> 
									</div> 
								</c:if>
								
	                    </div>
<div class="row">
<form:form id="" method="post"
		modelAttribute="accountTypeData" action="${pageContext.request.contextPath}/AdminUI/roleController/role">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="vendor">
			<div id="divID_menu" class="styled-input">
				<form:select name="menuId" path="menucheckBox" class="selecttag" id="menuId" 
					onfocus="removeHasError('divID_menu');emptySuccess(event,'msgId');"
					onclick="this.setAttribute('value', this.value);emptySuccess(event,'msgId');"
					value="" onchange="selecttag('label_menuId','menuId');listOfAccountGroup(this)">
					<form:option value="" label=" " />
					<form:options items="${menuList}" />
				</form:select>
				<label id="label_menuId" class="valid">Menu</label> <label id="menuErrorId" class="collapse"></label>
			</div>
		</div>
		
		
		
		
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb">
						<br>
						<div id="errorId"></div>
						<div class="transaction-table">
					<div class="table-responsive">
						<div id="menuTableId" >
						
								<table class="table table-striped table-bordered table-hover " id="table_id">
								<thead>
									<tr style="color: #e3a122">
									<th><input type="checkbox" id="checkall" class="checkbox"/>Action</th>
									<th>AccountType</th>
									<!-- <th>Menu Description</th>	 -->
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${sysAccountList}" var="sysAccountLst">
								<tr class="tableLabel">
								<td><form:checkbox	path="accountcheckBox" class="accountcheckBox" name="accountcheckBox" id="accountcheckBox${sysAccountLst.id}" value="${sysAccountLst.id}" /></td><td>${sysAccountLst.accountType}</td>
								
										
											</tr>
										
											</c:forEach>
								</tbody>
								</table>
								
								
						</div></div>
						</div>
						
						</div>
						
						
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<input type="submit" class="btn btn-warning" value="Submit" onclick="return validateRole(event)" />
		</div>
		
		 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form></div>

</body>












