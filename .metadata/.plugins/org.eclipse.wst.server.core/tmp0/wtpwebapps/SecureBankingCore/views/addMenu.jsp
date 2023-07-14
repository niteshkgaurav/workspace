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

<!-- <script type="text/javascript" src=https://code.jquery.com/jquery-1.12.4.js></script>
<script type="text/javascript" src=https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js></script>
 -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
 
 <script type="text/javascript" src=https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css></script>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/datepicker.min.css />
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonfunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/addmenu.js"></script>
<script type="text/javascript" src=${pageContext.request.contextPath}/js/moment.min.js></script>	
<script type="text/javascript" src=${pageContext.request.contextPath}/js/datepicker.min.js></script>


 
 
<title>addMenu</title>
<script type="text/javascript">

$(document).ready(function(){
  // Check or Uncheck All checkboxes
  $("#checkall").change(function(){
    var checked = $(this).is(':checked');
    if(checked){
      $(".sysAccountGroupArray").each(function(){
        $(this).prop("checked",true);
      });
    }else{
      $(".sysAccountGroupArray").each(function(){
        $(this).prop("checked",false);
      });
    }
  });

 // Changing state of CheckAll checkbox 
 $(".sysAccountGroupArray").click(function(){

   if($(".sysAccountGroupArray").length == $(".sysAccountGroupArray:checked").length) {
     $("#checkall").prop("checked", true);
   } else {
     $("#checkall").removeAttr("checked");
   }

 });
});

</script>
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
<body class="PageType">
<div class="row">

<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	       		<h1 class="pull-left">Add Menu</h1>
	       		<div class="clearfix"></div>
	       		<hr>
			</div>
			<div class="heading-inner  ">
				<h1 class="pull-left">
					
				</h1>
				<c:if test="${successMessage!=''}">
									<div id="msgId"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
                                            <p class="text-success">${successMessage}</p> 
									</div> 
								</c:if>

</div>
</div>
<div class="row">
<form:form id="" method="post"
		modelAttribute="addMenuData" action="${pageContext.request.contextPath}/AdminUI/roleController/addMenu">
		<%-- <form:input path="name" type="text"/>
		<form:input path="menuDescription" type="text"/>
		 --%>
		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_menuname" class="styled-input">
												<form:input type="text" class="selecttag" id="name" path="name"
													name="name" onchange="selecttag('menuname1','name');" onfocus="removeHasError('div_menuname');emptySuccess(event,'msgId');"
													autocomplete="off"/>
												<label id="menuname1" class="valid">Name</label>
												<label id="menuNameErrorId" class="collapse" ></label>
												
												 <span></span>
											</div>
										</div>
										
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_description" class="styled-input">
												<form:input type="text" class="selecttag" id="description" path="description"
													name="description" onchange="selecttag('descriptionname1','description');" onfocus="removeHasError('div_description');emptySuccess(event,'msgId');"
												    autocomplete="off"/>
												<label id="descriptionname1" class="valid">Description</label>												
												<label id="DescriptionErrorId" class="collapse"></label>
												
												 <span></span>
											</div>
										</div>
											
										
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_menuIndex" class="styled-input">
												<form:input type="text" class="selecttag" id="menuIndex" path="menuIndex" onkeyup="onlyNumeric('menuIndex','menuIndexErrorId','menuIndexname')"
													name="menuIndex" onchange="selecttag('menuIndexname','menuIndex');" onfocus="removeHasError('div_menuIndex');emptySuccess(event,'msgId');"
													 autocomplete="off"/>
												<label id="menuIndexname" class = "valid">Menu Index</label>											
												<label id="menuIndexErrorId" class ="collapse"></label>
												
												 <span></span>
											</div>
										</div>
									
																	
																	
											<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="vendor">
									<div id="divID_parent" class="styled-input">
										<form:select name="ParentId" path="ParentId" class="selecttag" id="ParentId"
											onfocus="removeHasError('divID_parent');emptySuccess(event,'msgId');"
											onclick="this.setAttribute('value', this.value);"
											value="" onchange="selecttag('label_ParentId','ParentId');">
											<form:option value="" label=" " />
											<form:options items="${menuList}" />
										</form:select>
										<label id="label_ParentId" class="valid">Parent</label> <label id="ParentId" class="collapse"></label>
									</div>
								</div>
																	
											
											
											
											
											
											
											
											
											
											
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_placement" class="styled-input">
												<form:input type="text" class="selecttag" id="placement" path="placement"
													name="placement" onchange="selecttag('placementname1','placement');" onfocus="removeHasError('div_placement');emptySuccess(event,'msgId');"
													 autocomplete="off"/>
												<label id="placementname1" class= "valid">Placement</label>												
												<label id="placementErrorId" class= "collapse" ></label>
												
												 <span></span>
											</div>
										</div>
										
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div id="div_status" class="styled-input">
											<label id="username1"  class="valid">Status</label>
											<form:select  path="status" class="selecttag"						
												onfocus="removeHasError('divID_status');emptySuccess(event,'msgId');" onclick="this.setAttribute('value', this.value);"
												>
												
												<form:option value="Active" label="Active" />
												<form:option value="InActive" label="InActive" />
								
											</form:select>
											</div>
											</div>
											
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_action" class="styled-input">
												<form:input type="text" class="selecttag" id="action" path="action"
													name="action" onchange="selecttag('actionname1','action');" onfocus="removeHasError('div_action');emptySuccess(event,'msgId');"
													 autocomplete="off"/>
												<label id="actionname1" class="valid">Url To Map</label>												
												<label id="actionErrorId" class="collapse"></label>
												
												 <span></span>
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											
											<div id="div_priority" class="styled-input">
												<form:input type="text" class="selecttag" id="priority" path="priority"
													name="priority" onchange="selecttag('priorityname1','priority');" onfocus="removeHasError('div_priority');emptySuccess(event,'msgId');"
													 autocomplete="off"/>
												<label id="priorityname1" class="valid">Display Sequence</label>											
												<label id="priorityErrorId" class= "collapse"></label>
												
												 <span></span>
											</div>
										</div>	
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
											<div id="div_isMenu" class="styled-input">
											<label id="isMenuLabel"  class="valid">isMenu</label>
											<form:select  path="ismenu" class="selecttag"						
												onfocus="removeHasError('div_isMenu');emptySuccess(event,'msgId');" onclick="this.setAttribute('value', this.value);"
												>
												
												<form:option value="1" label="Yes" />
												<form:option value="0" label="No" />
								
											</form:select>
											</div>
											</div>	
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">						
									<div id="errorid"></div>
											<div class="table-responsive  transaction-table">
												<div id="menuTableId">
														<table class="table table-striped table-bordered table-hover " id="table_id">
														<thead>
															<tr>   
															<th><input type="checkbox" id="checkall" class="checkbox" onclick="remove_error();"/>Action</th>
															<th>AccountType</th>
														<th>Group</th>
															</tr>
														</thead>
														<tbody>
														
																		<c:forEach items="${sysAccountList}" var="sysAccountLst">
																	
														<tr class ="tableLabel">
														<td><form:checkbox	path="sysAccountGroupArray" class="sysAccountGroupArray" name="sysAccountGroupArray[]" id="sysAccountGroupArray" value="${sysAccountLst.id}" onclick="remove_error();"/></td><td>${sysAccountLst.accountType}  </td><td>${sysAccountLst.groupName}</td></tr>
																	</c:forEach>
																	</tbody>
																	</table>
																	</div>
																	</div>	
																	
																	</div>			
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
									<input type="submit" class="btn btn-warning" value="Submit" onclick="return validateAddMenu(event)" />
								</div>
								 <input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
								
																			
								</form:form>
								</div>
								
						
						</body>
						</html>
						














