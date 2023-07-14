<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/css"
	src="${pageContext.request.contextPath}/css/datatable_css/jquery.dataTables.css"></script>
<link rel="stylesheet" type="text/css"
	href=${pageContext.request.contextPath}/css/fileinput.css />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.css" />
<script src=${pageContext.request.contextPath}/js/jquery-1.10.2.min.js></script>
<script src=${pageContext.request.contextPath}/js/jquery.dataTables.js></script>
<script src=${pageContext.request.contextPath}/js/jquery-ui.js></script>
<script language='javascript'
	src=${pageContext.request.contextPath}/js/MyDate.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/json/jquery.js></script>
	
	<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/InventoryPoRaise.js></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/css"
	src="${pageContext.request.contextPath}/css/themes/start/jquery-ui.css"></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/commonfunction.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/js/viewOrder.js></script>


<title>Order raise</title>
<script>

 $(document).ready(function(){
	 
	 $('#errorstatusMessage').html('');
	 $('#vendorlist').hide(0);
		$("#vendor").hide(0);
		$("#tableRow").hide(0);
	 $("#po").load(location.href + " #po");
	 $('#vendorId').val('');
	 $('#orderTypeVl').val('');
	// $('#addMore').hide();
	});  
	
   // window.onload = showVendor();
  //  window.location.reload();
</script>
<style type="text/css">
li {
	color: black;
}
</style>
</head>
<form:form id="PoRaise" method="post" modelAttribute="inventoryMgmtData"
	action="${pageContext.request.contextPath}/AdminUI/inventoryMgmtController/poRaise">
	<input type="hidden" value="${pageContext.request.contextPath}"
		name="linkViewOrder">
	<form:hidden path="groupCode" value="${groupCode}" id="groupCode" />

	<div class="heading-inner  ">
		<!-- ****************************************** Form Heading  ******************************* -->
		<h1 class="pull-left">
			<spring:message code="PO Raise" />
		</h1>
		<div class="clearfix"></div>
		<hr>

		<c:if test="${successMessage!=''}">
			<div id="msgId"
				class=" col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center">
				<p>
					<font color="green">${successMessage}</font>
				</p>
			</div>
		</c:if>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			<div id="divID_orderTypeVl" class="styled-input">
				<form:select id="orderTypeVl" path="orderTypeVl" class="selecttag"
					onchange="checkvalue('${groupCode}');selecttag('label_orderTypeVl','orderTypeVl')"
					onfocus="removeHasError('divID_orderTypeVl')"
					onclick="clearSmsg(msgId);emptyerror(event,'OrderForErrorId');this.setAttribute('value', this.value);"
					value="">
					<form:option value="" label=" " />
					<form:option value="SELF" label="Self" />
					<form:option value="ONBEHALF" label="Onbehalf" />

				</form:select>
				<label id="label_orderTypeVl"class="valid">Order For</label> <label
					id="OrderForErrorId" class="collapse"></label>
			</div>
		</div>
		
		<div id="productTypeDiv">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
				<div id="divID_productType" class="styled-input">
					<form:select id="productType" path="productType" class="selecttag"
						onchange="selecttag('label_productType','productType');productTypeCheck();"
						onfocus="removeHasError('divID_productType')"
						onclick="clearSmsg(msgId);emptyerror(event,'productTypeErrorId');this.setAttribute('value', this.value);"
						value="">
						
					
					<form:option value="" label=" " />
						<c:forEach var="product" items="${ProductMap}" >
						<form:option value="${product.productName}" label="${product.productName}" />
						</c:forEach> 
						
						<!--  ******  -->
						<%-- <form:option value="Overlay" label="Overlay" />
						<form:option value="PayCard" label="PayCard" />
						<form:option value="Reader" label="Reader" /> --%>
						<!--  ****** -->

					</form:select>
					<label id="label_productType"class="valid">Product Name</label> <label
						id="productTypeErrorId" class="collapse"></label>
				</div>
			</div>

		</div>

		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="vendor">
			<div id="divID_vendorId" class="styled-input">
				<form:select name="vendorId" path="vendorId" class="selecttag"
					onfocus="removeHasError('divID_vendorId')"
					onclick="clearSmsg(msgId);this.setAttribute('value', this.value);"
					value="" onchange="selecttag('label_vendorId','vendorId');">
					<%-- <form:option value="" label=" " />
					<form:options items="${vMap}" /> --%>
				</form:select>
				<label id="label_vendorId" class="valid">Vender</label> 
				<label id="VendorErrorId" class="collapse"></label>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="no_onbehalf1">
			<div class="styled-input" id="onBehlf">
				<form:select name="onbehalf_Account" class="selecttag"
					id="onbehalf_Account" path="onBehalfAccount"
					onfocus="showlabel('label_onbehalf_Account','onbehalfTypeErrorId');removeHasError('onBehlf')"
					onclick="clearvmsg(id);this.setAttribute('value', this.value);"
					value=""
					onchange="onSelect();emptyerror(event,'onbehalfTypeErrorId');selecttag('label_onbehalf_Account','onbehalf_Account');">
					<form:option value="0" label=" " />
					<c:choose>
						<c:when test="${groupCode == 'PP'}">
							<form:option value="HO" label="HOST" />
							<form:option value="DI" label="DISTRIBUTER" />
							<form:option value="SD" label="SUB-DISTRIBUTER" />
							<form:option value="RE" label="AGENT" />
						</c:when>
						<c:when test="${groupCode == 'HO'}">
								<form:option value="DI" label="DISTRIBUTER" />
							<form:option value="SD" label="SUB-DISTRIBUTER" />
							<form:option value="RE" label="AGENT" />
						</c:when>
						<c:when test="${groupCode == 'DI'}">
							<form:option value="SD" label="SUB-DISTRIBUTER" />
							<form:option value="RE" label="AGENT" />
						</c:when>
						<c:when test="${groupCode == 'SD'}">
							<form:option value="RE" label="AGENT" />
						</c:when>
						<c:when test="${groupCode == 'RE'}">
							<script>
                               for (i=0;i<orderTypeVl.length;  i++) {
                            	   if (orderTypeVl.options[i].value=='ONBEHALF') {
                            		   orderTypeVl.remove(i);
                            	   }
                            	}
                           	</script>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</form:select>
				<label id="label_onbehalf_Account" class="valid"><spring:message
						code="label_onbehalf_account" /></label> <label id="onbehalfTypeErrorId"
					class="collapse"></label>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="no_onbehalf">
			<div class="styled-input" id="search">
				<form:input id="select_onbehalf" class="selecttag" type="text"
					name="selectOnbehalf" path="selectOnbehalf"
					onfocus="removeHasError('search');showlabel('label_no_onbehalf','onbehalfErrorId')"
					onclick="emptyerror(event,'onbehalfErrorId');"
					onkeypress="nameSelectt();emptyerror(event,'onbehalfErrorId');"
					autocomplete="off"
					onchange="selecttag('label_no_onbehalf','select_onbehalf');" />
				<div id="suggestion-box"></div>
				<label id="label_no_onbehalf" class="valid"><spring:message
						code="label_Contact_Name" /></label> <label id="onbehalfErrorId"
					class="collapse"></label>
			</div>
		</div>
	
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center"
			id="DataErrorId"></div>

	</div>
	<%-- <div class="row" id='tableRow'>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<spring:message code="label_inventory_avail_stock" />
		</div>
		<div class="col-xs-12">
			<div class="transaction-table">
				<div class="table-responsive">
					<table id="template_details"
						class="table table-bordered table-striped">
						<tr>
							<th><spring:message code="lable_product_name" /></th>
							<th><spring:message code="lab_Product_Code" /></th>
							<th><spring:message code="lable_master_version" /></th>
							<th><spring:message code="masterVerCode" /></th>
							<th><spring:message code="label_no_of_boxes" /></th>
							<th><spring:message code="labl_avail_stock" /></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id='duplicateErrorId'
			class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		</div>

	</div> --%>

	
	<div id="productTypeOverlay" class="row collapse">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
			<table align="center">
				<tr>
					<td>
						<div class="col-xs-12  text-center">
							<div class="transaction-table  text-center">
								<div class="table-responsive  text-center" >
									<table id="tablid">

										<tr id="error_row">
											<td colspan="2"><div id='ProductErrorIdD' align='center'></div></td>
											<td colspan="2"><div id='masterVersionErrorIdD'
													align='center'></div></td>
											<td colspan="2"><div id='qtyErrorIdD' align='center'></div></td>
										</tr>

										<tr id="poRaise">
											<%-- <td><font color="red">&nbsp;&nbsp;*</font> <spring:message
													code="lab_products" />&nbsp;&nbsp;:&nbsp;</td>

											<td><form:select style="width:100px; height:25px"
													path="productId" id="productId0" name="productId"
													onChange="emptyerror(event,'duplicateErrorId');checkProduct();"
													onclick="clearmsg('ProductErrorIdD');emptyerror(event,'duplicateErrorId');">
													<form:select style="width:100px; height:25px"
													path="productId" id="productId0" name="productId"
													onChange="emptyerror(event,'duplicateErrorId');"
													onclick="clearmsg('ProductErrorIdD');emptyerror(event,'duplicateErrorId');">
													<form:option value="" label=" " />
													
													<form:options items="${ProductMap}" />
												</form:select></td>
 --%>
											<td class="masterVersion" style="width:140px; height:25px"><font color="red">&nbsp;&nbsp;*</font> <spring:message
													code="label_master_version" />&nbsp;&nbsp;:&nbsp;</td>

											<td class="masterVersion"><form:select path="mvId" id="mvId"
													style="width:100px; height:25px" onChange="checkVersion();"
													onclick="emptyerror(event,'masterVersionErrorIdD');">
													<form:option value="" label=" " />
													<c:forEach items="${mvMap}" var="mvMap">
														<form:option value="${mvMap.id}" label="${mvMap.name}" />
													</c:forEach>
												</form:select></td>


											<td class="quantity" style="width:140px; height:25px"><font color="red">*</font>&nbsp;Quantity&nbsp;&nbsp;:&nbsp;</td>


											<td class="quantity">
											<form:input type="text" id="element10" maxlength="7"
													path="qty" style="width:90px; height:25px"
													autocomplete="off"
													onfocus="emptyerror(event,'qtyErrorIdD');"
													onclick="clearmsg('qtyErrorIdD');clear('element10');"
													onkeypress="numericVal(event,'qtyErrorIdD');"
													onkeyup="zerocheckCard('element10','qtyErrorIdD');" /></td>



										</tr>
										<tr>
										<td colspan="4"><span id="MvError" style="color: red;"></span></td>
										</tr>

										<!-- <tr><td colspan="2"><div id='ProductErrorId' align='center'></div></td>
							<td></td><td><div id='masterVersionErrorId' align='left'></div></td>
							<td colspan="2"><div id='qtyErrorId' align='center'></div></td></tr> -->

									</table>

								</div>
							</div>
						</div>
				<!-- <tr>
					<td colspan="6" align="right"><input type="button" disabled="disabled"
						id="addMore" value="Add more" onclick="addMoreRow('tablid');" />
						<INPUT type="button" value="Delete Row"  disabled="disabled"
						onclick="deleteRow('tablid')" /></td>

				</tr> -->
			</table>
		</div>
	</div>



	<%-- <div id="payCardDiv" class="row collapse">
		<table align="center">
			<tr>
				<td>
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
						 	<table id="tablidPayCard">

									<tr id="error_rowPayCard">
										<!-- <td colspan="2"><div  align='center'></div></td> -->
										<td colspan="2"><div id='ProductTypeIdPayCard'
												align='center'></div></td>
										<td colspan="2"><div id='qtyErrorIdPayCard'
												align='center'></div></td>
									</tr>

									<tr id="payCardPoraise">
										<td><font color="red">&nbsp;&nbsp;*</font>
												<spring:message code="label_product_type" />&nbsp;&nbsp;:&nbsp;</td>
				
												<td>Pay Card</td>

										<td><font color="red">&nbsp;&nbsp;*</font> Card Type
											&nbsp;&nbsp;:&nbsp;</td>

										<td><form:select path="payCardTypeId" id="payCardTypeId0"
												onclick="clearmsg('ProductTypeIdPayCard');emptyerror(event,'ProductTypeIdPayCard');"
												style="width:100px; height:25px;">
												<form:option value="" label=" " />
												<form:options items="${cardDetailsMap}" />

											</form:select></td>


										<td><font color="red">&nbsp;&nbsp;*</font>&nbsp;Quantity&nbsp;&nbsp;:&nbsp;</td>
										<td><form:input type="text" id="element0" maxlength="7"
												path="qtyPayCard" style="width:100px; height:25px;"
												autocomplete="off"
												onfocus="emptyerror(event,'qtyErrorIdD');"
												onclick="clearmsg('qtyErrorIdPayCard');emptyerror(event,'qtyErrorIdPayCard');"
												onkeypress="onlyNumric(event,'qtyErrorIdPayCard');"
												onkeyup="zerocheckCard('element0','qtyErrorIdPayCard');" /></td>


									</tr>
								</table>

							</div>
						</div>
					</div>
			<tr>
				<td colspan="6" align="right"><input type="button"
					id="addMorePayCard" value="Add more" disabled="disabled"
					onclick="addMoreRowpayCard('tablidPayCard');" /></td>
				<td><INPUT type="button" value="Delete Row" disabled="disabled"
					onclick="deleteRow('tablidPayCard')" /></td>
			</tr>
		</table>

	</div> --%>
	<div id="readerDiv" class="row collapse">
		<table align="center">
			<tr>
				<td>
					<div class="col-xs-12">
						<div class="transaction-table">
							<div class="table-responsive">
								<table id="tablidReader">

									<tr id="error_rowReader">
										<!-- <td colspan="2"><div  align='center'></div></td> -->
										<td colspan="2"><div id='ProductTypeIdReader'
												align='center'></div></td>
										<td colspan="2"><div id='qtyErrorIdReader'
												align='center'></div></td>
									</tr>
									<tr id="ReaderPoraise">
										<%-- <td><font color="red">&nbsp;&nbsp;*</font>
												<spring:message code="label_product_type" />&nbsp;&nbsp;:&nbsp;</td>
				
												<td>Pay Card</td> --%>

										<td><font color="red">&nbsp;&nbsp;* </font> Reader Type
											&nbsp;&nbsp;:&nbsp;</td>
										<td><form:select path="readerId" id="readerId0"
												onclick="clearmsg('ProductTypeIdReader');emptyerror(event,'ProductTypeIdReader');"
												style="width:100px; height:25px;">
												<form:option value="" label=" " />
												<form:options items="${ReaderMap}" />
											</form:select></td>
										<td><font color="red">&nbsp;&nbsp;*</font>&nbsp;Quantity&nbsp;&nbsp;:&nbsp;</td>
										<td><form:input type="text" id="elements0" maxlength="7"
												path="qtyreader" style="width:100px; height:25px;"
												autocomplete="off"
												onfocus="emptyerror(event,'qtyErrorIdD');"
												onkeypress="onlyNumric(event,'qtyErrorIdReader');"
												onclick="clearmsg('qtyErrorIdReader');emptyerror(event,'qtyErrorIdReader');"
												onkeyup="zerocheckCard('elements0','qtyErrorIdReader');" 
												/>
											</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
		    	<tr>
				<td colspan="6" align="right"><input type="button"
					id="addMoreReader" value="Add Reader" disabled="disabled"
					
					onclick="addMoreReaders('tablidReader');" /></td>
				<td><INPUT type="button" value="Delete Row" disabled="disabled"
					onclick="deleteRow('tablidReader')" /></td>
			</tr>
		</table>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt text-center">
		<input type="button" value="Submit" class="btn btn-warning"	onclick="return validatePoRaise(${minimumPackageSize});"  />
		<!-- <input type="submit" id="submitPoDetails" onclick="return validatePoRaise();" value="Submit" class="btn btn-warning"	/> -->
	</div>
<input type="hidden" value="${pageContext.request.contextPath}" name="link">
	           <input type="hidden" value="${menuId}" name="menuId" id="menuId">
	           <input type="hidden" value="${submenuId}" name="submenuId" id="submenuId">
</form:form>
</body>
</html>