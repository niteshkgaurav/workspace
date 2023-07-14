//Function for show inventory order type div information

/*$(document).ready(function(){
 $('#msgId').html('');

 }); */

//get-products-type-details
function deleteRow(tableID) {
	try {
		$('#ProductTypeIdPayCard').html("");
		$('#qtyErrorIdPayCard').html("");
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		if (rowCount > 2) {
			table.deleteRow(rowCount - 1);

			$('#ProductErrorIdD').html("");
			$('#masterVersionErrorIdD').html("");
			$('#qtyErrorIdD').html("");

		}

	} catch (e) {
	}
}

var finalArray = new Array();
var mvArray = new Array;
var product_MV = new Array();
function showOrderTypeDivPanel() {
	var orderTypeVal = $("#orderTypeVal").val();
	$('#statusMessage').html("")
	$('#errorstatusMessage').html("");
	$('#orderTypeErrorId').html("");
	if (orderTypeVal == "SELF") {
		$("#orderInfoDiv").show();
		$('#onBehalfInfoDiv').hide();
	} else if (orderTypeVal == "ONBEHALF") {

		$.ajax({
			type : "POST",
			url : "ajax/getOnBehalfDetails",
			dataType: "json",
			success : function(response) {
				var objVal = response;
				createOnbehalfDivInfo(objVal);
				$("#orderInfoDiv").show();
			}
		});
	} else {
		$("#orderInfoDiv").hide();
		$('#onBehalfInfoDiv').hide();
	}
}

function createOnbehalfDivInfo(objVal) {
	var groupAccountList = objVal.groupAccountList;
	var childAccountList = objVal.childAccountList;
	var groupCode = objVal.groupCode;
	$('#onBehalfInfoDiv').val(groupCode);
	var html = "";
	html = "	<tr>"
			+ "		<td width='33%' align='right'>Select On-Behalf Account</td>"
			+ "		<td width='5%' align='center'>:</td>"
			+ "		<td width='33%' align='left'>"
			+ "			<select path='onBehalfType' name='onBehalfType' style='width:180px' id='onBehalfType' onchange='showHideAccountDetails();'>"
			+ "				<option value=''><--Select Onbehalf--></option>";
	for (var i = 0; i < groupAccountList.length; i++) {
		var gCode = groupAccountList[i].codeVal;
		var gDesc = groupAccountList[i].description;
		html = html + "<option value='" + gCode + "'>" + gDesc + "</option>";
	}
	html = html
			+ "	</select>"
			+ "		</td>"
			+ "	</tr>"
			+ "	<tr><td colspan='3' align='center'><div align='center' id='groupCodeErrorId'></div></td></tr>";

	if (groupCode == "HO") {
		html = html
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Host Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='hostName' id='hostName' size='10' style='width:180px' name='hostName' value='"
				+ objVal.hostName
				+ "' readonly>"
				+ "			<input type='hidden' path='hostId' id='hostId' name='hostId' value='"
				+ objVal.hostId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Select Distributor</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<select path='distName' name='distId' style='width:180px' id='distId' onchange='getAccountListByParentId(\"distId\",\"subDistId\",\"DI\"),emptyerror(event,\"distIdErrorId\");'>"
				+ "				<option value=''><--Select Acount--></option>";
		for (var i = 0; i < childAccountList.length; i++) {
			var id = childAccountList[i].id;
			var name = childAccountList[i].name;
			html = html + "<option value='" + id + "'>" + name + "</option>";
		}
		html = html
				+ "			</select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='distIdErrorId'></div></td></tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right' id='subDistId1' style='display:none'>Select Sub-Distributor</td>"
				+ "		<td width='5%' align='center' id='subDistId2' style='display:none'>:</td>"
				+ "		<td width='33%' align='left' id='subDistId3' style='display:none'>"
				+ "			<select path='subDistId' name='subDistId' style='width:180px' id='subDistId' onchange='getAccountListByParentId(\"subDistId\",\"agentId\",\"SD\"),emptyerror(event,\"subDistIdErrorId\");'></select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='subDistIdErrorId'></div></td></tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right' id='agentId1' style='display:none'>Select Agent</td>"
				+ "		<td width='5%' align='center' id='agentId2' style='display:none'>:</td>"
				+ "		<td width='33%' align='left' id='agentId3' style='display:none'>"
				+ "			<select path='agentId' name='agentId' style='width:180px' id='agentId' onchange='emptyerror(event,\"agentIdErrorId\");'></select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='agentIdErrorId'></div></td></tr>";
	}
	if (groupCode == "DI") {

		html = html
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Host Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='hostName' id='hostName' style='width:180px' size='10' name='hostName' value='"
				+ objVal.hostName
				+ "' readonly>"
				+ "			<input type='hidden' path='hostId' id='hostId' name='hostId' value='"
				+ objVal.hostId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Distributor Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='distName' id='distName' style='width:180px' size='10' name='distName' value='"
				+ objVal.distName
				+ "' readonly>"
				+ "			<input type='hidden' path='distId' id='distId' name='distId' value='"
				+ objVal.distId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Select Distributor Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<select path='subDistId' name='subDistId' style='width:180px' id='subDistId' onchange='getAccountListByParentId(\"subDistId\",\"agentId\",\"SD\"),emptyerror(event,\"subDistIdErrorId\");'>"
				+ "				<option value=''><--Select Account--></option>";
		for (var i = 0; i < childAccountList.length; i++) {
			var id = childAccountList[i].id;
			var name = childAccountList[i].name;
			html = html + "<option value='" + id + "'>" + name + "</option>";
		}
		html = html
				+ "	</select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='subDistIdErrorId'></div></td></tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right' id='agentId1' style='display:none'>Select Agent</td>"
				+ "		<td width='5%' align='center' id='agentId2' style='display:none'>:</td>"
				+ "		<td width='33%' align='left' id='agentId3' style='display:none'>"
				+ "			<select path='agentId' name='agentId' style='width:180px' id='agentId' onchange='emptyerror(event,\"agentIdErrorId\");'></select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='agentIdErrorId'></div></td></tr>";
	}
	if (groupCode == "SD") {

		html = html
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Host Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='hostName' id='hostName' size='10' style='width:180px' name='hostName' value='"
				+ objVal.hostName
				+ "' readonly>"
				+ "			<input type='hidden' path='hostId' id='hostId' name='hostId' value='"
				+ objVal.hostId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Distributor Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='distName' id='distName' size='10' style='width:180px' name='distName' value='"
				+ objVal.distName
				+ "' readonly>"
				+ "			<input type='hidden' path='distId' id='distId' name='distId' value='"
				+ objVal.dsitId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Sub-Distributor Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<input type='textbox' path='subDistName' id='subDistName' style='width:180px' size='10' name='subDistName' value='"
				+ objVal.subDistName
				+ "' readonly>"
				+ "			<input type='hidden' path='subDistId' id='subDistId' name='subDistId' value='"
				+ objVal.subDistId
				+ "'>"
				+ "		</td>"
				+ "	<tr>"
				+ "		<td width='33%' align='right'>Select Distributor Name</td>"
				+ "		<td width='5%' align='center'>:</td>"
				+ "		<td width='33%' align='left'>"
				+ "			<select path='agentId' name='agentId' style='width:180px' id='agentId' onchange='emptyerror(event,\"agentIdErrorId\");'>"
				+ "				<option value=''><--Select Account--></option>";
		for (var i = 0; i < childAccountList.length; i++) {
			var id = childAccountList[i].id;
			var name = childAccountList[i].name;
			html = html + "<option value='" + id + "'>" + name + "</option>";
		}
		html = html
				+ "	</select>"
				+ "		</td>"
				+ "	</tr>"
				+ "	<tr><td colspan='3' align='center'><div align='center' id='agentIdErrorId'></div></td></tr>";
	}
	$('#onBehalfInfoDiv').show();
	$('#orderOnbehalgInfoTable tbody').empty();
	$('#orderOnbehalgInfoTable tbody').append(html);
}

// Function for Inventory PO raise page validation
function inventoryPoRaiseValidate(event) {
	var completeCheck = true;
	var orderType = $("#orderTypeVal").val();
	if (orderType.length == 0) {
		$('#orderTypeErrorId').html(
				"<font color='red'>Kindly select order type!</font>");
		completeCheck = false;
	} else {
		$('#orderTypeErrorId').html("");
		if (orderType == "ONBEHALF") {
			var onBehalfType = $("#onBehalfType").val();
			var distId = $("#distId").val();
			var subDistId = $("#subDistId").val();
			var agentId = $("#distId").val();
			if (onBehalfType.length == 0) {
				$('#groupCodeErrorId')
						.html(
								"<font color='red'>Kindly select onbehalf account!</font>");
				completeCheck = false;
			} else {
				$('#groupCodeErrorId').html("");

				if (onBehalfType == "DI") {
					if (distId.length == 0) {
						$('#distIdErrorId')
								.html(
										"<font color='red'>Kindly select distributor account!</font>");
						completeCheck = false;
					} else {
						$('#distIdErrorId').html("");
					}
				}

				if (onBehalfType == "SD") {
					if (distId.length == 0) {
						$('#distIdErrorId')
								.html(
										"<font color='red'>Kindly select distributor account!</font>");
						completeCheck = false;
					} else {
						$('#distIdErrorId').html("");
					}

					if (subDistId.length == 0) {
						$('#subDistIdErrorId')
								.html(
										"<font color='red'>Kindly select sub-distributor account!</font>");
						completeCheck = false;
					} else {
						$('#subDistIdErrorId').html("");
					}
				}

				if (onBehalfType == "RE") {
					if (distId.length == 0) {
						$('#distIdErrorId')
								.html(
										"<font color='red'>Kindly select distributor account!</font>");
						completeCheck = false;
					} else {
						$('#distIdErrorId').html("");
					}

					if (subDistId.length == 0) {
						$('#subDistIdErrorId')
								.html(
										"<font color='red'>Kindly select sub-distributor account!</font>");
						completeCheck = false;
					} else {
						$('#subDistIdErrorId').html("");
					}

					if (agentId.length == 0) {
						$('#agentIdErrorId')
								.html(
										"<font color='red'>Kindly select agent account!</font>");
						completeCheck = false;
					} else {
						$('#agentIdErrorId').html("");
					}
				}
			}
		}
		var productId = $("#productId").val();
		var mvId = $("#mvId").val();
		var productOrderQty = $("#element10").val();

		if (productId.length == 0) {
			$('#productIdErrorId').html(
					"<font color='red'>Kindly select product.</font>");
			completeCheck = false;
		} else {
			$('#productIdErrorId').html("");
		}

		if (mvId.length == 0) {
			$('#mvIdErrorId').html(
					"<font color='red'>Kindly select master version!</font>");
			completeCheck = false;
		} else {
			$('#mvIdErrorId').html("");
		}

		if (productOrderQty.length == 0) {
			$('#productOrderQtyErrorId').html(
					"<font color='red'>Kindly enter product order qty!</font>");
			completeCheck = false;
		} else {
			$('#productOrderQtyErrorId').html("");
		}
	}
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		return true;
	}
}

// Function for Check user email id
function getMasterVersionByHostSubVersionId() {

	var hsvId = $("#hsvId").val();

	if (hsvId != "") {
		$.ajax({
			type : "post",
			url : 'ajax/getMasterVersionByHostSubVersionId',
			cache : false,
			dataType: "json",
			data : {
				hsvId : hsvId
			},
			success : function(response) {

				if (response != "") {
					if (response.indexOf(";") > 0) {
						var mvArray = response.split(";");
						$("#msvId1").show();
						$("#msvId2").show();
						$("#mvId").val(mvArray[0]);
						$("#mvName").val(mvArray[1]);
					}
					return false;
				} else {
					return true;
				}
			},
			error : function(errorThrown) {
				return false;
			}
		});
	} else {
		$('#hsvIdErrorId').html(
				"<font color='red'>Kindly select host sub version!</font>");
		return false;
	}
}

// Function for change show hide account type
function showHideAccountDetails() {
	$('#groupCodeErrorId').html("");
	var accountType = $("#onBehalfType").val();
	if (accountType == "DI") {
		$('#subDistId1').hide();
		$('#subDistId2').hide();
		$('#subDistId3').hide();
		$('#agentId1').hide();
		$('#agentId2').hide();
		$('#agentId3').hide();
	}
	if (accountType == "SD") {
		$('#agentId1').hide();
		$('#agentId2').hide();
		$('#agentId3').hide();
	}
}

// Function for getting all child List by parent id
function getAccountListByParentId(sourceId, targetId, currentGroupId) {
	var parentId = $("#" + sourceId).val();
	var accountType = $("#onBehalfType").val();
	if (accountType != "" && accountType != "") {
		if (parentId != "") {
			if (currentGroupId != accountType) {
				$.ajax({
					type : "post",
					url : 'ajax/getAccountListByParentId',
					cache : false,
					dataType: "json",
					data : {
						parentId : parentId,
						accountType : accountType
					},
					success : function(response) {
						var childAccountList = response;
						$('#' + targetId + '1').show();
						$('#' + targetId + '2').show();
						$('#' + targetId + '3').show();
						var select = $('#' + targetId);
						select.find('option').remove();
						$('<option>').val("").text("<--Select Account-->")
								.appendTo(select);
						for (var i = 0; i < childAccountList.length; i++) {
							var id = childAccountList[i].id;
							var name = childAccountList[i].name;
							var select = $('#' + targetId);
							$('<option>').val(id).text(name).appendTo(select);
						}
					},
					error : function(errorThrown) {
					}
				});
			}
		} else {
			$('#' + sourceId + 'ErrorId').html(
					"<font color='red'>Kindly select account !</font>");
			var select = $('#' + targetId);
			select.find('option').remove();
			$('<option>').val("").text("<--Select Account-->").appendTo(select);
		}
	} else {
		$('#groupCodeErrorId').html(
				"<font color='red'>Kindly select onbehalf account!</font>");
	}
}

function getBoxDetails() {
	var linkVal = $("input[name=linkViewOrder]:hidden").val();
	$("#GetDetails").prop("disabled", true);
	$("#msgId").html('');
	$("#OrderForErrorId").html('');
	var orderTypeVl = $('#orderTypeVl').val();
	var check = true;
	$("#msgId").html('');
	var onbehalf_Account = $('#onbehalf_Account').val();
	var select_onbehalf = $('#select_onbehalf').val();
	if (orderTypeVl.length == 0) {
		$("#DataErrorId").html('');
		$("#GetDetails").prop("disabled", false);
		$('#divID_orderTypeVl').addClass('has-error');

		check = false;
	}

	if (orderTypeVl == "SELF") {
		$
				.ajax({
					url : 'ajax/getBoxDetail',
					type : 'post',
					dataType : 'json',
					data : 'orderTypeVl=' + orderTypeVl,
					success : function(response) {

						var valuess = response;
						if (valuess.length > 0) {

							for (var i = 0; i < valuess.length; i++) {

								var pn = valuess[i].productName;
								var mv = valuess[i].mvName;

								$('#template_details')
										.append(
												'<tr><td align="center">'
														+ valuess[i].productName
														+ '</td><td align="center">'
														+ valuess[i].productCode
														+ '</td><td align="center">'
														+ valuess[i].mvName
														+ '</td><td align="center">'
														+ valuess[i].mvCode
														+ '</td><td align="center"><a href="'
														+ linkVal
														+ '/AdminUI/inventoryMgmtController/getBoxDetailsInventory?pn='
														+ pn
														+ '&mv='
														+ mv
														+ '"><font color="00000">'
														+ valuess[i].availableStock
														+ '</a></td><td align="center">'
														+ valuess[i].availableUnits
														+ '</td></tr>');
							}
						} else {
							$('#DataErrorId').html(
									"<font color='red'>No Data Found.</font>");
						}
					},
					error : function(e) {

					}

				});
	}
	if (orderTypeVl == "ONBEHALF") {
		if (onbehalf_Account == 0) {
			$("#DataErrorId").html('');
			$("#GetDetails").prop("disabled", false);
			$('#onBehlf').addClass('has-error');
			$('#search').addClass('has-error');
			check = false;
		}
		if (select_onbehalf.length == '') {
			$("#DataErrorId").html('');
			$("#GetDetails").prop("disabled", false);
			$('#search').addClass('has-error');
			check = false;
		}

		if (onbehalf_Account.length == 0) {
			$("#DataErrorId").html('');
			$("#GetDetails").prop("disabled", false);
			$('#search').addClass('has-error');
			check = false;
		}
		if (check == true) {
			onbehalf();
		}

	}

}
var product = new Array();
var mvArray = new Array();
var quantity = new Array();
var rowDelete = new Array();
var rowDeleteMv = new Array();
var rowDeleteQty = new Array();
var rowCount = 0;
var counter = 1;

function addMoreRow(tableID) {

	if ($('#productType').val() == "Overlay") {

		var table = document.getElementById(tableID);
		rowCount = table.rows.length - 1;
		var product = $('#productId0').val();
		var mvId = $('#mvId0').val();
		var qty = $('#0').val();

		var p;
		var v;
		var q;
		var myOpts = document.getElementById('productId0').options;
		var myOpts1 = document.getElementById('mvId0').options;

		var tr = document.createElement("tr");
		tr.id = "elementr" + rowCount;
		var td = document.createElement('td');
		var td1 = document.createElement('td');
		td1.innerHTML = " <font color=red>&nbsp;&nbsp;*</font>&nbsp;Product Type &nbsp;:&nbsp;";
		var td2 = document.createElement('td');
		td2.innerHTML = " <font color=red>&nbsp; *</font>&nbsp;Master Version &nbsp;:&nbsp;";
		var vrow = document.createElement('td');
		vrow.innerHTML = " <font color=red>&nbsp; *</font>&nbsp;Vendor&nbsp;:&nbsp;";
		var td4 = document.createElement('td');
		var select = document.createElement('select'), option, i = 0, il = myOpts.length;
		select.name = "productId";
		select.id = "productId" + rowCount;
		select.style.height = "25px";
		select.onchange = function() {
			finalArray = [];
			$("#ProductErrorIdD").html('');
			$("#duplicateErrorId").html('');
			var m = $(this).val();
			p = m;

			if (m.length == 0) {
				$("#ProductErrorIdD").html(
						'<font color="red">Kindly select Product Type</font>');
				check = false;
			}
			abc(p, v, q);
		}

		var select1 = document.createElement('select'), option, j = 0, il2 = myOpts1.length;
		select1.name = "mvId";
		select1.id = "mvId" + rowCount;
		select1.style.height = "25px";
		select1.onclick = function() {

			$('#masterVersionErrorIdD').html('');
		}
		select1.onchange = function() {

			$('#masterVersionErrorIdD').html('');
			var m = $(this).val();
			v = m;
			if (m.length == 0) {

				$('#masterVersionErrorIdD').html(
						"<font color='red'>Kindly select MasterVersion</font>");
				check = false;

			}
			abc(p, v, q);
			if (m.length != 0) {

				$("#masterVersionErrorIdD").html('');

			}

		}

		var td3 = document.createElement('td');
		td3.innerHTML = " <font color=red>&nbsp; *&nbsp;</font>Quantity&nbsp;&nbsp;:&nbsp;";

		var element1 = document.createElement("input");
		element1.type = "text";
		element1.setAttribute('name', 'qty');
		element1.setAttribute('maxlength', 7);
		element1.id = "element1" + rowCount;
		element1.style.width = "100px";
		element1.style.height = "25px";
		element1.onfocus = function() {

			$("#qtyErrorIdD").html('');
		}
		element1.onclick = function() {

			$("#qtyErrorIdD").html('');
		}
		element1.onkeypress = function() {
			$("#qtyErrorIdD").html('');
		}
		element1.onkeyup = function() {
			var str = $(this).val()
			var zeroindex;
			q = str;
			zeroindex = str[0];
			abc(p, v, q);
			if (zeroindex == 0) {

				$('#qtyErrorIdD').html(
						"<font color='red'>Enter valid data</font>");
				$('#element1' + rowCount).val('');
				check = false;
			}
			var res = str.split("");
			for (var i = 0; i < res.length; i++) {
				var a = res[i];
				var asciiValue = a.charCodeAt();
				if ((asciiValue >= 97 && asciiValue <= 122)
						|| (asciiValue >= 65 && asciiValue <= 90)
						|| (asciiValue >= 34 && asciiValue <= 38)
						|| (asciiValue >= 40 && asciiValue <= 46)
						|| asciiValue == 47 || asciiValue == 58
						|| asciiValue == 32 || asciiValue == 59
						|| asciiValue == 60 || asciiValue == 61
						|| asciiValue == 63 || asciiValue == 39
						|| asciiValue == 62 || asciiValue == 64
						|| asciiValue == 33
						|| (asciiValue >= 91 && asciiValue <= 95)
						|| asciiValue == 96
						|| (asciiValue >= 123 && asciiValue <= 126)) {
					$('#qtyErrorIdD')
							.html(
									"<font color='red'>Only Numeric are allowed</font>");
					$('#element1' + rowCount).val('');
					event.preventDefault();
					return false;
				}
			}
		}

		for (; i < il; i += 1) {
			option = document.createElement('option');
			option.setAttribute('value', myOpts[i].value);
			option.appendChild(document.createTextNode(myOpts[i].text));
			select.appendChild(option);

		}
		select.name = "productId";
		select.style.width = "100px";
		tr.appendChild(td1);
		tr.appendChild(select);

		for (; j < il2; j += 1) {
			option1 = document.createElement('option');
			option1.setAttribute('value', myOpts1[j].value);
			option1.appendChild(document.createTextNode(myOpts1[j].text));
			select1.appendChild(option1);

		}
		select1.name = "mvId";
		select1.style.width = "100px";

		tr.appendChild(td2);
		tr.appendChild(select1);

		tr.appendChild(td3);
		tr.appendChild(element1);

		tr.appendChild(td4);
		// td4.appendChild(del);

		tr.appendChild(td);
		table.appendChild(tr);

		counter++;
		// $("#addMore").hide();
	}

}
var arr = new Array();

function linkViewOrder() {

	var linkViewOrder = $("input[name=linkViewOrder]:hidden").val();
	linkViewOrder = linkViewOrder
			+ "/AdminUI/inventoryMgmtController/inventoryViewOrder";
	a = document.getElementById('showLink');
	a.setAttribute("href", linkViewOrder);

}

function boxDetailshowLink() {
	var boxDetailshowLink = $("input[name=linkViewOrder]:hidden").val();
	boxDetailshowLink = boxDetailshowLink
			+ "/AdminUI/inventoryMgmtController/getBoxDetailsInventory";
	a = document.getElementById('boxDetailshowLink');
	a.setAttribute("href", boxDetailshowLink);

}
var payCardQty = new Array();
var readerQty = new Array();
var finalArrayMv = new Array();
var finalArrayQty = new Array();

function validatePoRaise(minimumPackageSize) {
	var minimumPackageSize = minimumPackageSize;
	$('#MvError').empty();
	finalArray = [];
	payCardQty = [];
	mvArray = [];
	product_MV = [];
	qty = [];
	var check = true;
	var orderTypeVl = $('#orderTypeVl').val();
	var vendor = $('#vendorId').val();
	var onbehalf_Account = $('#onbehalf_Account').val();
	var select_onbehalf = $('#select_onbehalf').val();
	var groupCode = $("#groupCode").val();

	var productType = $('#productType').val();
	errVendor();
	if ($("#orderTypeVl").val() == undefined || $("#orderTypeVl").val() == "") {
		$('#divID_orderTypeVl').addClass('has-error');
		// check=false;
		return false;
	}
	if (productType == undefined || productType == null
			|| productType.length == 0) {
		$('#divID_productType').addClass('has-error');
		// check=false;
		return false;
	}
	if ($("#orderTypeVl").val() == "ONBEHALF") {
		if ($("#onbehalf_Account").val() == ""
				|| $("#onbehalf_Account").val() == "0") {
			$('#onBehlf').addClass('has-error');
			return false;
		}
		if ($("#select_onbehalf").val() == "") {
			$('#search').addClass('has-error')
			return false;
		}

	}

	if ($(".masterVersion").attr('status') == undefined) {
		if ($("#mvId").val() == undefined || $("#mvId").val() == ""
				|| $("#mvId").val() == "") {

			$('#MvError').append("Kindly Select Master Version.");

			return false;
		}
	}
	if ($(".quantity").attr('status') == undefined) {
		if ($("#element10").val() == undefined || $("#element10").val() == "") {
			$('#MvError').append("Kindly Enter Quantity.");
			// $('#qtyErrorIdD').addClass('has-error');
			return false;
		}
	}
	if ($("#element10").val() != undefined
			&& $("#element10").val() % minimumPackageSize != 0) {
		$('#MvError').append(
				"Order should be multiple of " + minimumPackageSize);
		// $('#qtyErrorIdD').addClass('has-error');
		return false;
	}
	/*
	 * if(groupCode=='PP') { if(vendor.length==0){
	 * $('#divID_vendorId').addClass('has-error'); check=false; } }
	 */
	if (orderTypeVl.length == 0) {
		$("#DataErrorId").html('');
		$("#GetDetails").prop("disabled", false);
		$('#VendorErrorId').html("");
		$('#duplicateErrorId').html("");
		$('#divID_orderTypeVl').addClass('has-error');
		// check=false;
		return false;
	}

	if ($('#orderTypeVl').val() == "ONBEHALF") {

		check = true;
		$("#DataErrorId").html('');
		$("#GetDetails").prop("disabled", false);
		$('#VendorErrorId').html("");
		$('#duplicateErrorId').html("");

		if ($('#onbehalf_Account').val() == "0") {

			$('#DataErrorId').html('');
			$("#GetDetails").prop("disabled", false);
			$('#onBehlf').addClass('has-error');
			// check=false;
			return false;
		}
		if (select_onbehalf.length == 0) {
			$('#DataErrorId').html('');
			$("#GetDetails").prop("disabled", false);
			$('#search').addClass('has-error');
			// check=false;
			return false;
		}

	}
	if (check == true) {

		$("#PoRaise").submit();

		return true;

		// checkpaycardValues(groupCode);
		/*
		 * if($('#productType').val()=="PayCard"){ var
		 * payCardCheck=checkpaycardValues(groupCode); }
		 * if($('#productType').val()=="Overlay"){ var
		 * overlayCheck=checkOverlay(groupCode); }
		 * 
		 * 
		 * if($('#productType').val()=="Reader"){ var
		 * overlayCheck=checkReadervalue(groupCode); }
		 */

	}

}
function clearmsg(id) {
	$("#" + id).html('');
	$("#msgId").html('');

}
function clearmvmsg(id) {
	$("#masterVersionErrorId").html('');
	$("#msgId").html('');

}

function clearpvmsg(id) {

	$("#ProductErrorId").html('');
	$("#duplicateErrorId").html('');
	$("#msgId").html('');
}

function clearSmsg(msgId) {
	$("#msgId").html('');
	$("#VendorErrorId").html('');

}
function clearvmsg(id) {
	$("#msgId").html('');
	$("#VendorErrorId").html('');
}
function onSelect() {
	$('#select_onbehalf').val('');
}

function showVendor() {
	$("#vendor").hide(0);
	var orderTypeVl = $('#orderTypeVl').val();
	$('#no_onbehalf1').hide();
	$('#no_onbehalf').hide();
	var b = 1;
	$.ajax({
		url : 'ajax/groupCode',
		type : 'post',
		async : false,
		dataType: "json",
		data : 'b=' + b,
		success : function(response) {
			var valuess = response;
			var a = valuess;
			if (a == null || a == undefined || a == "") {

				location.reload();
			}
			/*
			 * if(a=='PP') {
			 */
			if (orderTypeVl == "SELF") {
				$('#vendorlist').show();
				$('#vendorId').show();
				$("#vendor").show();
			}
			// }
			else {
				$('#no_onbehalf1').show();
				$('#no_onbehalf').show();
				$('#vendorlist').hide(0);
				$("#vendor").hide(0);
				$("#vendor").val() == "1";
			}
		},
		error : function(e) {
		}
	});

}

var a = "";
function errVendor(event) {
	var b = 1;
	var orderTypeVl = $('#orderTypeVl').val();
	if (orderTypeVl == undefined || orderTypeVl == "") {
		return false;
	}
	$.ajax({
		url : 'ajax/groupCode',
		type : 'post',
		async : false,
		dataType: "json",
		data : 'b=' + b,
		success : function(response) {

			var valuess = response;
			a = valuess;

			if (a == 'PP') {
				if (orderTypeVl == "SELF") {
					var vendorId = $('#vendorId').val();
					if (vendorId == null || vendorId == undefined
							|| vendorId.length == 0) {
						$('#divID_vendorId').addClass('has-error');
						check = false;
					}
				}
			}
		},
		error : function(e) {
		}

	});
	return a;
}

function onbehalf() {
	$("#DataErrorId").html('');
	var linkVal = $("input[name=linkViewOrder]:hidden").val();
	$('#vendorlist').hide(0);
	$("#vendor").hide(0);
	$('#no_onbehalf1').show();
	$('#no_onbehalf').show();

	var select_type = $('#onbehalf_Account').val();
	var tagName = $("#select_onbehalf").val();

	$
			.ajax({
				url : 'ajax/getBoxDetailOnBehalf',
				type : 'post',
				dataType : 'json',
				data : 'tagName=' + tagName,
				success : function(response) {

					var valuess = response;

					if (valuess.length == 0) {
						$('#DataErrorId').html(
								"<font color='red'>No Data Found</font>");
						check = false;
					}
					for (var i = 0; i < valuess.length; i++) {
						var pn = valuess[i].productName;
						var mv = valuess[i].mvName;

						$('#template_details')
								.append(
										'<tr><td align="center">'
												+ valuess[i].productName
												+ '</td><td align="center">'
												+ valuess[i].productCode
												+ '</td><td align="center">'
												+ valuess[i].mvName
												+ '</td><td align="center">'
												+ valuess[i].mvCode
												+ '</td><td align="center"><a href="'
												+ linkVal
												+ '/AdminUI/inventoryMgmtController/getBoxDetailsInventory?pn='
												+ pn
												+ '&mv='
												+ mv
												+ '><font color="black">'
												+ valuess[i].availableStock
												+ '</a></td><td align="center">'
												+ valuess[i].availableUnits
												+ '</td></tr>');

					}

				},
				error : function(e) {
				}

			});

	$('#template_details').show();
}

function checkvalue(groupCode) {

	$("#tableRow").hide(0);
	$('#vendorId').val('');
	$('#productType').val('');
	$("#onbehalfErrorId").html('');
	$("#DataErrorId").html('');
	$("#GetDetails").prop("disabled", false);

	showVendor();
	// $("#onBehlf").load(location.href + " #onBehlf");
	$("#select_onbehalf").val('');
	$("#onbehalfTypeErrorId").html('');
	$("#selectedOnBehalfErrorId").html('');
	$('#duplicateErrorId').html('');
	$("#msgId").html('');
	$("#OrderForErrorId").html('');
	var orderTypeVl = $('#orderTypeVl').val();
	if (orderTypeVl == "") {
		location.reload();
		/*
		 * $('#vendor').hide(); $('#vendorId').hide();
		 */
	}
	if (orderTypeVl == "SELF") {
		$('#no_onbehalf1').hide();
		$('#no_onbehalf').hide();

		$("#DataErrorId").html('');
	}
	if (orderTypeVl == "ONBEHALF") {
		$('#no_onbehalf1').show();
		$('#no_onbehalf').show();
		$('#vendor').hide();
		$('#vendorId').hide();
		$("#DataErrorId").html('');
		$("#GetDetails").prop("disabled", false);
	}
	if (groupCode != 'PP') {
		$("#divID_vendorId").hide();
	}
}

function checkProduct() {
	var productFlag = 1;
	finalArray = [];
	finalArrayMv = [];
	finalArrayQty = [];
	product = [];
	mvArray = [];
	quantity = [];
	check = true;
	/*
	 * var productId=$('#productId').val();
	 * if(productId==undefined||productId.length==0){
	 * 
	 * $("#ProductErrorIdD").html('<font color="red">Kindly select Product Type</font>');
	 * finalArray=[]; finalArrayMv=[]; finalArrayQty=[]; product = []; mvArray =
	 * []; quantity = []; productFlag=0; check=false; }
	 */
	productFlag = 1;
	for (var i = 0; i < counter + 1; i++) {
		product.push($('#productId' + i).val());
	}
	for (var i = 0; i < counter + 1; i++) {
		if (typeof product[i] === 'undefined') {
		} else {
			finalArray.push($('#productId' + i).val());
		}
	}

	for (var i = 0; i < finalArray.length; i++) {
		if (finalArray[i].length == 0) {
			productFlag = 0;
		}
	}

	for (var i = 0; i < finalArray.length; i++) {
		if (finalArray[i].length == 0) {
			productFlag = 0;
		}
	}
	if (productFlag == 0) {
		$("#ProductErrorIdD").html(
				'<font color="red">Kindly select Product Type</font>');
		finalArray = [];
		finalArrayMv = [];
		finalArrayQty = [];
		product = [];
		mvArray = [];
		quantity = [];
		check = false;

	}
	if (productId == undefined || productId.length == 0) {
		$("#ProductErrorIdD").html(
				'<font color="red">Kindly select Product Type</font>');
		finalArray = [];
		finalArrayMv = [];
		finalArrayQty = [];
		product = [];
		mvArray = [];
		quantity = [];
		productFlag = 0;
		check = false;
	}
	var productId = $('#productId').val().trim();

	if (productId == 0) {
		$("#ProductErrorIdD").html(
				'<font color="red">Kindly select Product Type</font>');
	}
	if (productFlag != 0) {
		$("#ProductErrorIdD").html('');
	}
	if (check == false) {
		finalArray = [];
		finalArrayMv = [];
		finalArrayQty = [];
		product = [];
		mvArray = [];
		quantity = [];
		return false;

	}

}
function zerocheck() {
	var zeroindex;
	var qty = $('#qty').val();
	zeroindex = qty[0];

	if (zeroindex == 0) {

		$('#qtyErrorIdD').html("<font color='red'>Enter valid data</font>");
		$('#qty').val('');
		check = false;
	}

	if (qty != 0 && qty > 100000000) {
		$('#qtyErrorIdD').html(
				"<font color='red'>Maximum length is 100000000</font>");
		$('#qty').val('');
	}
}

function zerocheckCard(chk, err) {
	var zeroindex;
	var qty = $('#' + chk).val();
	zeroindex = qty[0];

	if (zeroindex == 0) {

		$('#' + err).html("<font color='red'>Enter valid data</font>");
		$('#' + chk).val('');
		return false;
	}

}

function showButton() {
	$("#onbehalfErrorId").html('');
	var select_type = $('#onbehalf_Account').val();

	$("#select_onbehalf").autocomplete(
			{
				source : function(request, response) {
					if (select_type != '0') {
						var tagName = $("#select_onbehalf").val();
					}
					$.ajax({
						url : "ajax/getTags",
						type : "GET",
						async : false,
						dataType: "json",
						data : 'tagName=' + tagName + '&select_type='
								+ select_type,
						success : function(data) {

							if (data.length == 0) {

								$('#label_no_onbehalf').hide();
								$('#select_onbehalf').val('');
								$('#onbehalfErrorId').show();
								$('#onbehalfErrorId').html(
										"<font color='red'>Not valid.</font>");

							} else {
								$("#input[type=button]").removeAttr("disabled",
										"disabled");
							}

							response($.map(data, function(item) {
								return item.split(",");
							}));
						}
					});
				},
				select : function(e, ui) {

					// alert(ui.item.label);
				},

				change : function(e, ui) {

					// alert(ui.item.label);
				}

			});

	function getSelectedValue(event, ui) {
		alert(ui.item.label);
	}
}

function goBack() {
	window.history.back();
}

function addMoreVisible() {
	var product = $('#productId').val();
	var mvId = $('#mvId').val();
	var qty = $('#qty').val();
	if (mvId != 0) {
		$('#masterVersionErrorIdD').html('');
	}
	if (product != 0 && mvId != 0 && qty.length != 0) {

	} else {

	}

}

function checkVersion() {
	$('#masterVersionErrorIdD').html('');
	var mvId = $('#mvId').val();

	if (mvId == 0) {
		$('#masterVersionErrorIdD').html(
				"<font color='red'>Kindly select MasterVersion</font>");
	}
}

function abc(p, v, q) {
	if (p != 0 && v != 0 && q.length != 0) {
		$('#addMore').show();
	} else {

		$('#addMore').hide();
	}
}

function clearInputBox(id) {
	$('#' + id).val('');

}

function productTypeCheck() {
	if ($("#productType").val() == undefined || $("#productType").val() == "") {
		return false;
	}
	if ($("#orderTypeVl").val() != undefined && $("#orderTypeVl").val() == "SELF") {
		$.ajax({
			url : "ajax/get-product-vendors",
			type : "GET",
			async : false,
			dataType: "json",
			data : "productType=" + $("#productType").val(),
			success : function(data) {
				var responseArray = [];
				responseArray = data.responseEntityList;
				if (responseArray.length > 0) {

					var options = "";
					$.each(responseArray, function(index, value) {

						options += "<option value=" + responseArray[index].id
								+ " label='' >"
								+ responseArray[index].companyName
								+ "</option>";

					});
					$("#vendorId").empty();
					$("#vendorId").append(options);
				} else {
					$("#vendorId").empty();
				}
				if (data.productType.masterVirsion == false) {
					$(".masterVersion").hide();
					$(".masterVersion").attr('status', 'hidden')
				} else {
					$(".masterVersion").show();
					if($(".masterVersion").attr('status')!=undefined){
						$(".masterVersion").removeAttr('status');
					}
					//$(".masterVersion").attr('status', undefined)
				}
				if (data.productType.quantity == false) {
					$(".quantity").hide();
					$(".quantity").attr('status', 'hidden')

				} else {
					$(".quantity").show();
					$(".quantity").attr('status', undefined)
				}

			},
			complete : function(xhr, status) {
				// on complete code here

			},
			error : function(ex) {
				// alert(JSON.stringify(ex));

			}
		});
	} else {

		$.ajax({
			url : "ajax/get-products-type-details",
			type : "GET",
			dataType: "json",
			async : false,
			data : "productType=" + $("#productType").val(),
			success : function(data) {
				var productType = {};
				productType = data.productType;
				if (productType.masterVirsion != undefined) {
					if (productType.masterVirsion == false) {
						$(".masterVersion").hide();
						$(".masterVersion").attr('status', 'hidden')
					} else {
						$(".masterVersion").show();
						$(".masterVersion").attr('status', undefined)
					}

				}
			}

		});
	}

	/*
	 * if($('#productType').val()=="Overlay"){ $('#productTypeOverlay').show();
	 * $('#tablid').show(); $('#payCardDiv').hide(); $('#readerDiv').hide();
	 * $('#ProductErrorIdD').html(''); $('#masterVersionErrorIdD').html('');
	 * $('#qtyErrorIdD').html('');
	 * 
	 * clearReader(); clearPaycard(); } if($('#productType').val()=="PayCard"){
	 * 
	 * $('#payCardDiv').show(); $('#productTypeOverlay').hide();
	 * $('#readerDiv').hide(); $("#ProductTypeIdPayCard").html('');
	 * $('#qtyErrorIdPayCard').html(''); clearReader(); clearOverlay();
	 * 
	 * 
	 *  } if($('#productType').val()=="Reader") {
	 * 
	 * $('#readerDiv').show(); $('#productTypeOverlay').hide();
	 * $('#payCardDiv').hide(); $("#ProductTypeIdReader").html('');
	 * $('#qtyErrorIdReader').html(''); clearPaycard(); clearOverlay();
	 *  }
	 */

	$('#productTypeOverlay').show();
}

function clearReader() {
	var table = document.getElementById('tablidReader');
	var rowCount = table.rows.length;
	for (rowCount; rowCount > 2; rowCount--) {
		table.deleteRow(rowCount - 1);
	}
	$('#readerId0').val('');

	$('#elements0').val('');
}

function clearPaycard() {
	var table = document.getElementById('tablidPayCard');
	var rowCount = table.rows.length;
	for (rowCount; rowCount > 2; rowCount--) {
		table.deleteRow(rowCount - 1);
	}
	$('#payCardTypeId0').val('');

	$('#element0').val('');
}

function clearOverlay() {
	var table = document.getElementById('tablid');
	var rowCount = table.rows.length;
	for (rowCount; rowCount > 2; rowCount--) {
		table.deleteRow(rowCount - 1);
	}
	$('#productId').val('');

	$('#mvId').val('0');
	$('#element10').val('');
}

function addMoreRowpayCard(tableId) {

	var table = document.getElementById(tableId);
	var rowCount = table.rows.length - 1;
	var tr = document.createElement("tr");
	var payCardTypeId = $('#payCardTypeId0').val();
	var myOpts = document.getElementById('payCardTypeId0').options;

	var select = document.createElement('select'), option, i = 0, il = myOpts.length;
	select.name = "payCardTypeId";
	select.id = "payCardTypeId" + rowCount;
	select.style.height = "25px";

	var td = document.createElement('td');
	var td1 = document.createElement('td');
	td1.innerHTML = " <font color=red>&nbsp;&nbsp;*</font>&nbsp;Product Type &nbsp;:&nbsp;";
	var card = document.createElement('td');
	card.innerHTML = " <font color=red>&nbsp;&nbsp;</font>&nbsp;Pay Card &nbsp;&nbsp;";
	var td2 = document.createElement('td');
	td2.innerHTML = " <font color=red>&nbsp; *</font>&nbsp;Card Type &nbsp;:&nbsp;";
	var td4 = document.createElement('td');

	var td3 = document.createElement('td');
	td3.innerHTML = " <font color=red>&nbsp; *&nbsp;</font>Quantity&nbsp;&nbsp;:&nbsp;";

	var element1 = document.createElement("input");
	element1.type = "text";
	element1.setAttribute('name', 'qtyPayCard');
	element1.setAttribute('maxlength', 7);
	element1.id = "element1" + rowCount;
	element1.style.width = "100px";
	element1.style.height = "25px";
	element1.onfocus = function() {

		$("#qtyErrorIdPayCard").html('');
	}
	element1.onclick = function() {
		$("#qtyErrorIdPayCard").html('');
	}
	element1.onkeypress = function() {

		$("#qtyErrorIdPayCard").html('');
	}
	element1.onkeyup = function(event) {

		var str = $(this).val()
		var zeroindex;
		q = str;
		zeroindex = str[0];
		if (zeroindex == 0) {

			$('#qtyErrorIdPayCard').html(
					"<font color='red'>Enter valid data</font>");
			$('#element1' + rowCount).val('');
			check = false;
		}
		var res = str.split("");
		for (var i = 0; i < res.length; i++) {
			var a = res[i];
			var asciiValue = a.charCodeAt();
			if ((asciiValue >= 97 && asciiValue <= 122)
					|| (asciiValue >= 65 && asciiValue <= 90)
					|| (asciiValue >= 34 && asciiValue <= 38)
					|| (asciiValue >= 40 && asciiValue <= 46)
					|| asciiValue == 47 || asciiValue == 58 || asciiValue == 32
					|| asciiValue == 59 || asciiValue == 60 || asciiValue == 61
					|| asciiValue == 63 || asciiValue == 39 || asciiValue == 62
					|| asciiValue == 64 || asciiValue == 33
					|| (asciiValue >= 91 && asciiValue <= 95)
					|| asciiValue == 96
					|| (asciiValue >= 123 && asciiValue <= 126)) {
				$('#qtyErrorIdPayCard').html(
						"<font color='red'>Only Numeric are allowed</font>");
				$('#element1' + rowCount).val('');
				event.preventDefault();
				return false;
			}
		}
	}
	for (; i < il; i += 1) {
		option = document.createElement('option');
		option.setAttribute('value', myOpts[i].value);
		option.appendChild(document.createTextNode(myOpts[i].text));
		select.appendChild(option);

	}
	select.name = "payCardTypeId";
	select.style.width = "100px";
	select.onclick = function() {
		$("#ProductTypeIdPayCard").html('');
	}
	select.onchange = function() {
		finalArray = [];
		$("#ProductTypeIdPayCard").html('');
		$("#duplicateErrorId").html('');
		var m = $(this).val();
		p = m;

		if (m.length == 0) {
			$("#ProductTypeIdPayCard").html(
					'<font color="red">Kindly select Card Type</font>');
			check = false;
		}
	}

	tr.appendChild(td2);
	tr.appendChild(select);
	tr.appendChild(td3);
	tr.appendChild(element1);
	tr.appendChild(td4);

	table.appendChild(tr);
	counter++;

}

function addMoreReaders(tableId) {

	var table = document.getElementById(tableId);
	var rowCount = table.rows.length - 1;
	var tr = document.createElement("tr");
	var readerId = $('#readerId0').val();
	var myOpts = document.getElementById('readerId0').options;

	var select = document.createElement('select'), option, i = 0, il = myOpts.length;
	select.name = "readerId";
	select.id = "readerId" + rowCount;
	select.style.height = "25px";

	var td = document.createElement('td');
	var td1 = document.createElement('td');
	td1.innerHTML = " <font color=red>&nbsp;&nbsp;*</font>&nbsp;Product Type &nbsp;:&nbsp;";
	var card = document.createElement('td');
	card.innerHTML = " <font color=red>&nbsp;&nbsp;</font>&nbsp;Pay Card &nbsp;&nbsp;";
	var td2 = document.createElement('td');
	td2.innerHTML = " <font color=red>&nbsp; *</font>&nbsp;Reader Type &nbsp;:&nbsp;";
	var td4 = document.createElement('td');

	var td3 = document.createElement('td');
	td3.innerHTML = " <font color=red>&nbsp; *&nbsp;</font>Quantity&nbsp;&nbsp;:&nbsp;";

	var element1 = document.createElement("input");
	element1.type = "text";
	element1.setAttribute('name', 'qtyreader');
	element1.setAttribute('maxlength', 7);
	element1.id = "element1" + rowCount;
	element1.style.width = "100px";
	element1.style.height = "25px";
	element1.onfocus = function() {

		$("#qtyErrorIdReader").html('');
	}
	element1.onclick = function() {
		$("#qtyErrorIdReader").html('');
	}
	element1.onkeypress = function() {

		$("#qtyErrorIdReader").html('');
	}
	element1.onkeyup = function(event) {

		var str = $(this).val()
		var zeroindex;
		q = str;
		zeroindex = str[0];
		if (zeroindex == 0) {

			$('#qtyErrorIdReader').html(
					"<font color='red'>Enter valid data</font>");
			$('#element1' + rowCount).val('');
			check = false;
		}
		var res = str.split("");
		for (var i = 0; i < res.length; i++) {
			var a = res[i];
			var asciiValue = a.charCodeAt();
			if ((asciiValue >= 97 && asciiValue <= 122)
					|| (asciiValue >= 65 && asciiValue <= 90)
					|| (asciiValue >= 34 && asciiValue <= 38)
					|| (asciiValue >= 40 && asciiValue <= 46)
					|| asciiValue == 47 || asciiValue == 58 || asciiValue == 32
					|| asciiValue == 59 || asciiValue == 60 || asciiValue == 61
					|| asciiValue == 63 || asciiValue == 39 || asciiValue == 62
					|| asciiValue == 64 || asciiValue == 33
					|| (asciiValue >= 91 && asciiValue <= 95)
					|| asciiValue == 96
					|| (asciiValue >= 123 && asciiValue <= 126)) {
				$('#qtyErrorIdReader').html(
						"<font color='red'>Only Numeric are allowed</font>");
				$('#element1' + rowCount).val('');
				event.preventDefault();
				return false;
			}
		}
	}
	for (; i < il; i += 1) {
		option = document.createElement('option');
		option.setAttribute('value', myOpts[i].value);
		option.appendChild(document.createTextNode(myOpts[i].text));
		select.appendChild(option);

	}
	select.name = "readerId";
	select.style.width = "100px";
	select.onclick = function() {
		$("#readerId").html('');
	}
	select.onchange = function() {
		finalArray = [];
		$("#readerId").html('');
		$("#duplicateErrorId").html('');
		var m = $(this).val();
		p = m;

		if (m.length == 0) {
			$("#readerId").html(
					'<font color="red">Kindly select Reader Type</font>');
			check = false;
		}
	}

	tr.appendChild(td2);
	tr.appendChild(select);
	tr.appendChild(td3);
	tr.appendChild(element1);
	tr.appendChild(td4);

	table.appendChild(tr);
	counter++;

}

function checkReadervalue(groupCode) {

	var readerCheck = true;
	var table = document.getElementById('tablidReader');
	var rowCount = table.rows.length;
	if ($('#productType').val() == "Reader") {
		var table = document.getElementById('tablidReader');
		var rowCount = table.rows.length;
		for (var i = 0; i < rowCount - 1; i++) {
			finalArray.push($('#readerId' + i).val());
		}

		payCardQty.push($('#elements0').val());
		for (var i = 1; i < rowCount - 1; i++) {
			payCardQty.push($('#element1' + i).val());
		}
		for (var i = 0; i < finalArray.length; i++) {
			if (finalArray[i].length == 0) {
				$('#ProductTypeIdReader').show();
				$('#ProductTypeIdReader').html(
						'<font color="red"> Kindly Select Reader Type.</font>');
				readerCheck = false;
			}

		}

		for (var i = 0; i < payCardQty.length; i++) {
			if (payCardQty[i].length == 0) {
				$('#qtyErrorIdReader').show();
				$('#qtyErrorIdReader').html(
						'<font color="red"> Kindly Enter Quantity.</font>');
				readerCheck = false;
			}

			else if (payCardQty[i] != '' && payCardQty[i] < 10) {
				$('#ProductTypeIdReader').show();
				$('#qtyErrorIdReader')
						.html(
								'<font color="red"> Quantity should not be less than 10 units.</font>');
				readerCheck = false;
			}

			/*
			 * else if(groupCode=='HO'){ if (payCardQty[i]!='' && payCardQty[i]<
			 * 10){ //alert("HO") $('#ProductTypeIdPayCard').show();
			 * $('#qtyErrorIdPayCard').html('<font color="red"> Quantity should
			 * not be less than 10 units.</font>'); readerCheck=false; } } else
			 * if(groupCode=='DI'){ if (payCardQty[i]!='' && payCardQty[i]<
			 * 10){ $('#ProductTypeIdPayCard').show();
			 * $('#qtyErrorIdPayCard').html('<font color="red"> Quantity should
			 * not be less than 10 units.</font>'); readerCheck=false; } } else
			 * if(groupCode=='SD'){ if (payCardQty[i]!='' && payCardQty[i]<
			 * 10){ $('#ProductTypeIdPayCard').show();
			 * $('#qtyErrorIdPayCard').html('<font color="red"> Quantity should
			 * not be less than 10 units.</font>'); readerCheck=false; } }
			 */

		}

		if (finalArray.length != 0) {

			for (var i = 0; i < finalArray.length - 1; i++) {
				for (var j = i + 1; j < finalArray.length; j++) {

					if (finalArray[i].length != 0
							&& finalArray[i] == finalArray[j]) {
						$('#ProductTypeIdReader').show();
						$('#ProductTypeIdReader')
								.html(
										'<font color="red"> Duplicate selection of products not allowed.</font>');
						readerCheck = false;

					}

				}
			}
		}

		if (readerCheck == true) {

			$("#PoRaise").submit();
		}
		return true;
	}

}

function checkpaycardValues(groupCode) {

	var payCardCheck = true;
	var table = document.getElementById('tablidPayCard');
	var rowCount = table.rows.length;
	// if($('#productType').val()=="PayCard"){
	var table = document.getElementById('tablidPayCard');
	var rowCount = table.rows.length;
	for (var i = 0; i < rowCount - 1; i++) {
		finalArray.push($('#payCardTypeId' + i).val());
	}
	payCardQty.push($('#element0').val());
	for (var i = 1; i < rowCount - 1; i++) {
		payCardQty.push($('#element1' + i).val());
	}

	for (var i = 0; i < finalArray.length; i++) {
		if (finalArray[i].length == 0) {
			$('#ProductTypeIdPayCard').show();
			$('#ProductTypeIdPayCard').html(
					'<font color="red"> Kindly Select Card Type.</font>');
			payCardCheck = false;
		}

	}

	for (var i = 0; i < payCardQty.length; i++) {
		if (payCardQty[i].length == 0) {
			$('#qtyErrorIdPayCard').show();
			$('#qtyErrorIdPayCard').html(
					'<font color="red"> Kindly Enter Quantity.</font>');
			payCardCheck = false;
		}

		else if (payCardQty[i] != '' && payCardQty[i] < 10) {
			$('#ProductTypeIdPayCard').show();
			$('#qtyErrorIdPayCard')
					.html(
							'<font color="red"> Quantity should not be less than 10 units.</font>');
			payCardCheck = false;
		}

		/*
		 * else if(groupCode=='HO'){ if (payCardQty[i]!='' && payCardQty[i]<
		 * 10){ //alert("HO") $('#ProductTypeIdPayCard').show();
		 * $('#qtyErrorIdPayCard').html('<font color="red"> Quantity should not
		 * be less than 10 units.</font>'); payCardCheck=false; } } else
		 * if(groupCode=='DI'){ if (payCardQty[i]!='' && payCardQty[i]< 10){
		 * $('#ProductTypeIdPayCard').show(); $('#qtyErrorIdPayCard').html('<font
		 * color="red"> Quantity should not be less than 10 units.</font>');
		 * payCardCheck=false; } } else if(groupCode=='SD'){ if
		 * (payCardQty[i]!='' && payCardQty[i]< 10){
		 * $('#ProductTypeIdPayCard').show(); $('#qtyErrorIdPayCard').html('<font
		 * color="red"> Quantity should not be less than 10 units.</font>');
		 * payCardCheck=false; } }
		 */

	}

	if (finalArray.length != 0) {

		for (var i = 0; i < finalArray.length - 1; i++) {
			for (var j = i + 1; j < finalArray.length; j++) {

				if (finalArray[i].length != 0 && finalArray[i] == finalArray[j]) {
					$('#ProductTypeIdPayCard').show();
					$('#ProductTypeIdPayCard')
							.html(
									'<font color="red"> Duplicate selection of products not allowed.</font>');
					payCardCheck = false;

				}

			}
		}
	}

	if (payCardCheck == true) {

		$("#PoRaise").submit();
	}
	return true;
	// }
}

function checkOverlay(groupCode) {

	var overlayCheck = true;
	var table = document.getElementById('tablid');
	var rowCount = table.rows.length;
	var table = document.getElementById('tablid');
	var rowCount = table.rows.length - 1;
	for (var i = 0; i < rowCount; i++) {
		finalArray.push($('#productId' + i).val());
		mvArray.push($('#mvId' + i).val());
		qty.push($('#element1' + i).val());

	}

	for (var i = 0; i < finalArray.length; i++) {
		if (finalArray[i].length == 0) {
			$('#ProductErrorIdD').show();
			$('#ProductErrorIdD').html(
					'<font color="red"> Kindly Select Product Type.</font>');
			overlayCheck = false;
		}

	}

	for (var i = 0; i < mvArray.length; i++) {
		if (mvArray[i] == 0 || mvArray[i] == '') {
			$('#masterVersionErrorIdD').show();
			$('#masterVersionErrorIdD').html(
					'<font color="red"> Kindly Select Master Version.</font>');
			overlayCheck = false;
		}

	}

	for (var i = 0; i < qty.length; i++) {

		if (qty[i] == '') {

			$('#qtyErrorIdD').show();
			$('#qtyErrorIdD').html(
					'<font color="red"> Kindly Enter Quantity.</font>');
			overlayCheck = false;
		}

		else if (qty[i] < 10) {

			$('#qtyErrorIdD').show();
			$('#qtyErrorIdD')
					.html(
							'<font color="red"> Quantity must be 10 or greater than 10.</font>');
			overlayCheck = false;
		}

	}
	if (finalArray.length != 0 && mvArray.length != 0) {
		var product_mv = new Array();
		for (var i = 0; i < rowCount; i++) {
			var aa = $('#productId' + i).val();
			var bb = $('#mvId' + i).val();
			var asd = aa + "_" + bb;
			product_mv.push(asd);

			for (var i = 0; i < product_mv.length - 1; i++) {
				for (var j = i + 1; j < product_mv.length; j++) {

					if (product_mv[i] == product_mv[j]) {
						$('#ProductErrorIdD').show();
						$('#ProductErrorIdD')
								.html(
										'<font color="red"> Duplicate selection of products not allowed.</font>');
						overlayCheck = false;

					}

				}
			}

		}

	}

	if (overlayCheck == true) {

		$("#PoRaise").submit();
	}
	return true;
}

function numericVal(event, errorid, labelid, value, msg) {

	if (!event.ctrlKey) {
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
		if ((asciiValue >= 97 && asciiValue <= 122)
				|| (asciiValue >= 65 && asciiValue <= 90)
				|| (asciiValue >= 34 && asciiValue <= 38)
				|| (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47
				|| asciiValue == 58 || asciiValue == 32 || asciiValue == 59
				|| asciiValue == 60 || asciiValue == 61 || asciiValue == 63
				|| asciiValue == 39 || asciiValue == 62 || asciiValue == 64
				|| asciiValue == 33 || (asciiValue >= 91 && asciiValue <= 95)
				|| asciiValue == 96 || (asciiValue >= 123 && asciiValue <= 126)) {
			$('#MvError').empty();
			$('#MvError').append("Only Numeric are allowed")

			event.preventDefault();
			return false;
		}
	}
	emptyerror(event, errorid, msg);
}

/**
 * 
 * 
 */

