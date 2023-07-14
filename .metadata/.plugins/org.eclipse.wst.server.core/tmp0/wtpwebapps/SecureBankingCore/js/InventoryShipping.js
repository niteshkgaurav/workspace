// Function for Inventory History page validation
function getInventoryOrderHistoryByAccountId(event) {
	// alert("11");
	var completeCheck = true;
	var groupCode = $("#groupCode").val();
	var accountId=""; 
	if (groupCode.length != 0) {
		if (groupCode == "PP") {
			accountId=$("#hostId").val();
			if (accountId.length == 0) {
				$('#hostIdErrorId').html(
						"<b><font color='red'>Kindly select host!</font></b>");
				completeCheck = false;
			} else {
				$('#hostIdErrorId').html("");
			}
		}
		
		if (groupCode == "HO") {
			accountId=$("#distId").val();
			if (accountId.length == 0) {
				$('#distIdErrorId').html(
						"<b><font color='red'>Kindly select distributor!</font></b>");
				completeCheck = false;
			} else {
				$('#distIdErrorId').html("");
			}
		}
		
		if (groupCode == "DI") {
			accountId=$("#subDistId").val();
			if (accountId.length == 0) {
				$('#subDistIdErrorId').html(
						"<b><font color='red'>Kindly select sub-distributor!</font></b>");
				completeCheck = false;
			} else {
				$('#subDistIdErrorId').html("");
			}
		}
		
		if (groupCode == "SD") {
			accountId=$("#agentId").val();
			if (accountId.length == 0) {
				$('#agentIdErrorId').html(
						"<b><font color='red'>Kindly select agent!</font></b>");
				completeCheck = false;
			} else {
				$('#agentIdErrorId').html("");
			}
		}
	} 
	

	if (completeCheck) {
		$.ajax({
			type : "post",
			url : 'ajax/getInventoryOrderHistoryByAccountId',
			cache : false,
			dataType: "json",
			data : {
				accountId : accountId
			},
			success : function(response) {
				var orderHistoryList = response;
				alert(orderHistoryList);
				var tableHead = setOrderRecordHeader();
				 alert("tableHead : "+tableHead);
				var tableData = setOrderHistoryRecord(orderHistoryList);
				// alert("tableData : "+tableData);
				$('#orderInfoDiv').show();
				$('#orderHistoryInfoDiv thead').empty();
				$('#orderHistoryInfoDiv thead').append(tableHead);

				$('#orderHistoryInfoDiv tbody').empty();
				$('#orderHistoryInfoDiv tbody').append(tableData);

			},
			error : function(errorThrown) {
				return false;
			}
		});
	}
}

//Set Order Record Header 
function setOrderRecordHeader() {
	var tableHead = "<tr>" 
				+"		<td colspan='12'>"
				+"			<div class='mainTableHeader' align='center' style='color: black;' >"
				+"				<font color='white'> Received Orders Detail</font>"
				+"			</div>"
				+"		</td>"
				+"	</tr>";

	tableHead = tableHead + "<tr>" + "	<th>Order No.</th>"
			+ "	<th>Order Place By</th>" + "	<th>Order Recieved By</th>"
			+ "	<th>Order Onbehalf By</th>" + "	<th>MV Name</th>"
			+ "	<th>Product Name</th>" + "	<th>Ordered Qty</th>"
			+ "	<th>Order Shipped Qty</th>" + "	<th>Order Pending Qty</th>"
			+ "	<th>Order Date</th>" + "	<th>Order Status</th>"
			+ "	<th>Action</th>" + "</tr>";
	return tableHead;
}

function setOrderHistoryRecord(orderHistoryList) {
	var tableData = "";
	var tempOrderHistoryList=orderHistoryList;
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
					tableData = tableData
							+ "<td>"
							+ "	<input type='submit'  value='Ship Order' onclick='SetValBeforeSubmit(\""
							+ orderHistoryList[i].id+ "\",\""+ orderHistoryList[i].orderNumber+ "\",\""+ orderHistoryList[i].productId+ "\",\""+ orderHistoryList[i].mvId+ "\");'/>"
							+ "	<input type='button'  value='Reject Order' onclick='return showReasonPopUpWindow(\""
							+ orderHistoryList[i].id + "\",\""
							+ orderHistoryList[i].orderNumber
							+ "\",\"Reject\");'/>" + "</td>";
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

function showOrderHistoryList(orderHistoryList, cLength){
	/*alert("Method List Length : "+orderHistoryList.length);
	alert("Var Length : "+cLength);*/
	var count=0;
	for (var i = 0; i < orderHistoryList.length; i++) {
		count++;
	}
	//alert("Count : "+count);
}

function showReasonPopUpWindow(orderId, orderNumber) {
	var flag = confirm('Are you sure?');
	if (flag) {
		var html = '<table width="95%" border="1"><tr><td height="40px" align="center" style="top-margin:15pt;bottom-margin:15pt;font-size:11pt;font-weight:bold;">Reason for '
				+ ' Reject Order</td></tr>'
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
				+ ' Reject order reason</td>'
				+ '			<td align = "center" width="5%">:</td>'
				+ '			<td align = "left"><textarea id="cancelRejectReason" name="cancelRejectReason" placeholder="'
				+ ' Reject Order Reason" rows="2" cols="30" /></td>'
				+ '		</tr>'
				+ '		<tr>'
				+ '			<td align = "center" colspan="3"><div id="cancelRejectReasonErrorId" align="center"></div></td>'
				+ '		</tr>' + '		<tr>';
				+ "			<td align = 'center' colspan='3'><input type='button'  value='Reject Order' onclick='return inventoryOrderRejectedByParent(\""
				+ 				orderId + "\",\"" + orderNumber + "\");'/></td>";
				+ '		</tr>' + '	</table></td>' + '</tr></table>';

		$('#informationDiv').empty();
		$('#informationDiv').append(html);
		$('#informationDiv').attr('title', 'Reject Order');
		$('#informationDiv').dialog({
			width : 550,
			height : 250
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
				var tableHead = setOrderRecordHeader(orderType, orderStatus);
				var tableData = setOrderHistoryRecord(orderHistoryList,
						orderType, orderStatus);
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

//Function for set value in hidden before submit of ship order button
function SetValBeforeSubmit(orderId, orderNumber, productId, mvId){
	$('#orderId').val(orderId);
	$('#orderNumber').val(orderNumber);
	$('#productId').val(productId);
	$('#mvId').val(mvId);
}
