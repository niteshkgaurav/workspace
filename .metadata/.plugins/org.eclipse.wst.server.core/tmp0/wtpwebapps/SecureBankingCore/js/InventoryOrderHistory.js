function setCalender() {
	$(function() {
		var pickerOpts = {
			minDate : "-12M",
			maxDate : "+0D",
			numberOfMonths : 1,
		};
		$("#fromDate").datepicker(pickerOpts);
		$("#toDate").datepicker(pickerOpts);
	});
}

function CalculateDiff() {
	// alert("abc");
	var flag = 0;
	if ($("#fromDate").val() != "" && $("#toDate").val() != "") {
		var From_date = new Date($("#fromDate").val());
		var To_date = new Date($("#toDate").val());
		var diff_date = To_date - From_date;
		var years = Math.floor(diff_date / 31536000000);
		var months = Math.floor((diff_date % 31536000000) / 2628000000);
		var days = Math
				.floor(((diff_date % 31536000000) % 2628000000) / 86400000);
		if (diff_date > 5270400000) {
			$("#dateErrorID")
					.html(
							"<b><font color='red'>Date diffrence could not be greater than from two months.</font></b>");
			flag = 1;
		} else if (diff_date < 0) {
			$("#dateErrorID").html(
					"<b><font color='red'>From-Date could not be greater from To-Date.</font></b>");
			flag = 1;
		}
	} else {
		$("#dateErrorID").html("<b><font color='red'>Kindly select From-Date and To-Date.</font></b>");
		flag = 1;
	}
	if (flag == 1) {
		return false
	} else {
		$("#dateErrorID").html("");
		return true;
	}
}

// Function for Inventory History page validation
function inventoryHistoryValidate(event) {
	// alert("11");
	var completeCheck = true;
	var orderType = $("#orderType").val();
	var statusType = $("#statusType").val();
	var productOrderQty = $("#productOrderQty").val();

	if (orderType.length == 0) {
		$('#orderTypeErrorId').html(
				"<b><font color='red'>Kindly select order type!</font></b>");
		completeCheck = false;
	} else {
		$('#orderTypeErrorId').html("");
	}

	if (statusType.length == 0) {
		$('#statusTypeErrorId').html(
				"<b><font color='red'>Kindly select order status!</font></b>");
		completeCheck = false;
	} else {
		$('#statusTypeErrorId').html("");
	}
	var frmDate=$("#fromDate").val();
	var toDate=$("#toDate").val();
	if(frmDate .length == 0 || toDate .length == 0){
		$("#dateErrorID").html("<b><font color='red'>Kindly select From-Date and To-Date.</font></b>");
		completeCheck = false;
	}else{
		$('#dateErrorID').html("");
	}

	if (completeCheck) {
		completeCheck = CalculateDiff();
	}

	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		return true;
	}
}

// Function for Check user email id
function getInventoryOrderHistoryByDate(event) {
	// alert("11");
	var completeCheck = true;
	var fromDate = $("#fromDate").val();
	var toDate = $("#toDate").val();
	var orderType = $("#orderType").val();
	var orderStatus = $("#statusType").val();

	if (orderType.length == 0) {
		$('#orderTypeErrorId').html(
				"<b><font color='red'>Kindly select order type!</font></b>");
		completeCheck = false;
	} else {
		$('#orderTypeErrorId').html("");
	}

	if (orderStatus.length == 0) {
		$('#statusTypeErrorId').html(
				"<b><font color='red'>Kindly select order status!</font></b>");
		completeCheck = false;
	} else {
		$('#statusTypeErrorId').html("");
	}

	if (completeCheck) {
		completeCheck = CalculateDiff();
	}
	if (completeCheck) {
		$.ajax({
			type : "post",
			url : 'ajax/getInventoryOrderHistoryByDate',
			cache : false,
			dataType: "json",
			data : {
				orderType : orderType,
				orderStatus : orderStatus,
				fromDate : fromDate,
				toDate : toDate
			},
			success : function(response) {
				var orderHistoryList = response;
				var tableHead = setOrderRecordHeader(orderType, orderStatus);
				// alert("tableHead : "+tableHead);
				var tableData = setOrderHistoryRecord(orderHistoryList,
						orderType, orderStatus);
				// alert("tableData : "+tableData);
				$('#orderInfoDiv').show();
				$('#orderHistoryInfoDiv thead').empty();
				$('#orderHistoryInfoDiv thead').append(tableHead);

				$('#orderHistoryInfoDiv tbody').empty();
				$('#orderHistoryInfoDiv tbody').append(tableData);

				$("#fromDateHidden").val(fromDate);
				$("#toDateHidden").val(toDate);
				$("#orderTypeHidden").val(orderType);
				$("#statusTypeHidden").val(orderStatus);
			},
			error : function(errorThrown) {
				return false;
			}
		});
	}
}

function setOrderRecordHeader(orderType, orderStatus) {
	// alert("orderType : "+orderType);
	var tableHead = "";
	if (orderType == "0")
		tableHead = "<tr><td colspan='12'><div class='mainTableHeader' align='center' style='color: black;' ><font color='white'> Placed Orders Detail</font></div></td></tr>";
	else if (orderType == "1")
		tableHead = "<tr><td colspan='12'><div class='mainTableHeader' align='center' style='color: black;' ><font color='white'> Received Orders Detail</font></div></td></tr>";
	else
		tableHead = "<tr><td colspan='12'><div class='mainTableHeader' align='center' style='color: black;' ><font color='white'> Onbehalf Orders Detail</font></div></td></tr>";

	tableHead = tableHead + "<tr>" + "	<th>Order No.</th>"
			+ "	<th>Order Place By</th>" + "	<th>Order Recieved By</th>"
			+ "	<th>Order Onbehalf By</th>" + "	<th>MV Name</th>"
			+ "	<th>Product Name</th>" + "	<th>Ordered Qty</th>"
			+ "	<th>Order Shipped Qty</th>" + "	<th>Order Pending Qty</th>"
			+ "	<th>Order Date</th>" + "	<th>Order Status</th>"
			+ "	<th>Action</th>" + "</tr>";
	return tableHead;
}

function setOrderHistoryRecord(orderHistoryList, orderType, orderStatus) {
	var tableData = "";
	if (orderHistoryList.length != undefined) {
		if (orderHistoryList.length > 0) {
			for (var i = 0; i < orderHistoryList.length; i++) {
				tableData = tableData + "<tr>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].orderNumber + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].hostName + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].distName + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].subDistName + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].mvName + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].productName + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].productOrderQty + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].orderShippedQty + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].orderPendingQty + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].orderDate + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ orderHistoryList[i].statusType + "</td>";
				if (orderHistoryList[i].statusType == "PENDING"
						|| orderHistoryList[i].statusType == "PARTIAL SHIPPED") {
					if (orderType == "0") {
						tableData = tableData
								+ "<td><input type='button'  value='Cancel Order' onclick='return showReasonPopUpWindow(\""
								+ orderHistoryList[i].id + "\",\""
								+ orderHistoryList[i].orderNumber
								+ "\",\"Cancel\");'/></td>";
					} else if (orderType == "2") {
						tableData = tableData
								+ "<td><input type='button'  value='Cancel Order' onclick='return showReasonPopUpWindow(\""
								+ orderHistoryList[i].id + "\",\""
								+ orderHistoryList[i].orderNumber
								+ "\",\"Onbehalf\");'/></td>";
					} else {
						tableData = tableData
								+ "<td>"
								+ "	<input type='button'  value='Ship Order' onclick='return inventoryOrderShipByParent(\""
								+ orderHistoryList[i].id
								+ "\",\""
								+ orderHistoryList[i].orderNumber
								+ "\");'/>"
								+ "	<input type='button'  value='Reject Order' onclick='return showReasonPopUpWindow(\""
								+ orderHistoryList[i].id + "\",\""
								+ orderHistoryList[i].orderNumber
								+ "\",\"Reject\");'/>" + "</td>";
					}
				} else {
					tableData = tableData + "<td align='center'>----</td";
				}
				tableData = tableData + "</tr>";
			}
		} else {
			tableData = "<tr><td colspan='12' align='center' style='font-size: 11pt;'>No record found.</td></tr>";
		}
	} else {
		tableData = "<tr><td colspan='12' align='center' style='font-size: 11pt;'>No record found.</td></tr>";
	}
	return tableData;
}

function showReasonPopUpWindow(orderId, orderNumber, orderAction) {
	var flag = confirm('Are you sure?');
	if (flag) {
		var html = '<table width="95%" border="1"><tr><td height="40px" align="center" style="top-margin:15pt;bottom-margin:15pt;font-size:11pt;font-weight:bold;">Reason for '
				+ orderAction
				+ ' Order</td></tr>'
				+ '<tr> <td align="center">'
				+ '	<table width="100%" border="0">'
				+ '		<tr>'
				+ '			<td align = "right" height="30px" style="font-size:10pt;">Order No.</td>'
				+ '			<td align = "center" width="5%">:</td>'
				+ '			<td align = "left"><input type="textbox" style="height:20pt;" value="'
				+ orderNumber
				+ '" name="invOrderNo" id="invOrderNo" size="30" readonly></td>'
				+ '		</tr>'
				+ '		<tr>'
				+ '			<td align = "right" height="30px" style="font-size:10pt;">'
				+ orderAction
				+ ' order reason</td>'
				+ '			<td align = "center" width="5%">:</td>'
				+ '			<td align = "left"><textarea id="cancelRejectReason" name="cancelRejectReason" placeholder="'
				+ orderAction
				+ ' Order Reason" rows="2" cols="30" /></td>'
				+ '		</tr>'
				+ '		<tr>'
				+ '			<td align = "center" colspan="3"><div id="cancelRejectReasonErrorId" align="center"></div></td>'
				+ '		</tr>' + '		<tr>';
		if (orderAction == "Cancel") {
			html = html
					+ "			<td align = 'center' colspan='3'><input type='button'  value='Cancel Order' onclick='return inventoryOrderCancelledBySelf(\""
					+ orderId + "\",\"" + orderNumber + "\",\"0\");'/></td>";
		}
		if (orderAction == "Onbehalf") {
			html = html
					+ "			<td align = 'center' colspan='3'><input type='button'  value='Cancel Order' onclick='return inventoryOrderCancelledBySelf(\""
					+ orderId + "\",\"" + orderNumber + "\",\"2\");'/></td>";
		}
		if (orderAction == "Reject") {
			html = html
					+ "			<td align = 'center' colspan='3'><input type='button'  value='Reject Order' onclick='return inventoryOrderRejectedByParent(\""
					+ orderId + "\",\"" + orderNumber + "\");'/></td>";
		}
		html = html + '		</tr>' + '	</table></td>' + '</tr></table>';

		$('#informationDiv').empty();
		$('#informationDiv').append(html);
		$('#informationDiv').attr('title', orderAction + ' Order');
		$('#informationDiv').dialog({
			width : 550,
			height : 250
		});
	}
}

function inventoryOrderCancelledBySelf(orderId, orderNumber, orderType) {
	var fromDate = $("#fromDateHidden").val();
	var toDate = $("#toDateHidden").val();
	// var orderType = $("#orderTypeHidden").val();
	var orderStatus = $("#statusTypeHidden").val();
	var cancelRejectReason = $("#cancelRejectReason").val();
	var array=[orderStatus,fromDate,toDate,orderNumber,cancelRejectReason];
	if ($.trim(cancelRejectReason) == "") {
		
		$('#cancelRejectReasonErrorId')
				.html(
						"<b><font color='red'>Kindly enter cancel order reason !</font></b>");
	} else {
		alert('insert else')
		$('#cancelRejectReasonErrorId').html("");
		$.ajax({
			type : "post",
			url : 'ajax/inventoryOrderCancelledByChild',
			cache : false,
			dataType: "json",
			data : {
				array:array,
				orderType : orderType,
				orderId : orderId
			},
			success : function(response) {
				var orderHistoryList = response;
				var tableHead = setOrderRecordHeader(orderType, orderStatus);
				// alert("tableHead : " + tableHead);
				var tableData = setOrderHistoryRecord(orderHistoryList,
						orderType, orderStatus);
				// alert("tableData : " + tableData);
				$('#orderInfoDiv').show();
				$('#orderHistoryInfoDiv thead').empty();
				$('#orderHistoryInfoDiv thead').append(tableHead);

				$('#orderHistoryInfoDiv tbody').empty();
				$('#orderHistoryInfoDiv tbody').append(tableData);
				$('#informationDiv').dialog("close");
			},
			error : function(errorThrown) {
				return false;
			}
		});
	}
}

function inventoryOrderRejectedByParent(orderId, orderNumber) {
	var fromDate = $("#fromDateHidden").val();
	var toDate = $("#toDateHidden").val();
	var orderType = $("#orderTypeHidden").val();
	var orderStatus = $("#statusTypeHidden").val();
	var cancelRejectReason = $("#cancelRejectReason").val();
	if ($.trim(cancelRejectReason) == "") {
		$('#cancelRejectReasonErrorId')
				.html(
						"<b><font color='red'>Kindly enter reject order reason !</font></b>");
	} else {
		$('#cancelRejectReasonErrorId').html("");
		$.ajax({
			type : "post",
			url : 'ajax/inventoryOrderRejectedByParent',
			cache : false,
			dataType: "json",
			data : {
				orderId : orderId,
				orderNumber : orderNumber,
				orderStatus : orderStatus,
				cancelRejectReason : cancelRejectReason
			},
			success : function(response) {
				var orderHistoryList = response;
				var tableHead = setOrderRecordHeader();
				var tableData = setOrderHistoryRecord(orderHistoryList);
				$('#orderInfoDiv').show();
				$('#orderHistoryInfoDiv thead').empty();
				$('#orderHistoryInfoDiv thead').append(tableHead);

				$('#orderHistoryInfoDiv tbody').empty();
				$('#orderHistoryInfoDiv tbody').append(tableData);
				$('#informationDiv').dialog("close");
			},
			error : function(errorThrown) {
				return false;
			}
		});
	}
}