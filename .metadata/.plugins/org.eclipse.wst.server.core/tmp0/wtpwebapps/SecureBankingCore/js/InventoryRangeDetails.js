//Function for get box details.
function getBoxDetailsByRangeId(rangeId) {
		$.ajax({
			type : "post",
			url : 'ajax/getBoxDetailsByRangeId',
			cache : false,
			dataType: "json",
			data : {
				rangeId : rangeId
			},
			success : function(response) {
				var boxDetailsList = response;
				var tableHead = setBoxDetailHeader();
				// alert("tableHead : "+tableHead);
				var tableData = setBoxDetailsRecord(boxDetailsList);
				// alert("tableData : "+tableData);
				$('#boxInfoDiv'+rangeId).show();
				$('#boxDetailsInfoDiv'+rangeId+' thead').empty();
				$('#boxDetailsInfoDiv'+rangeId+' thead').append(tableHead);

				$('#boxDetailsInfoDiv'+rangeId+' tbody').empty();
				$('#boxDetailsInfoDiv'+rangeId+' tbody').append(tableData);
				$('#btnGetBoxDetailsDiv'+rangeId).hide();
				$('#btnShowHideBoxDetailsDiv'+rangeId).show();
		},
			error : function(errorThrown) {
				return false;
			}
		});
	}

//Function for show-hide box details div
function showHideBoxDetails(rangeId){
	if($('#boxInfoDiv'+rangeId).is(':visible'))
	{  
		$('#boxInfoDiv'+rangeId).hide();
		$('#btnShowHideBoxDetails'+rangeId).val("Show Box Details");
	}else{
		$('#boxInfoDiv'+rangeId).show();
		$('#btnShowHideBoxDetails'+rangeId).val("Hide Box Details");
	}
}


//Set Order Record Header 
function setBoxDetailHeader() {
	var groupCode=$("#groupCode").val();
	var tableHead = "<tr>" 
				+"		<td colspan='6'>"
				+"			<div class='mainTableHeader' align='center' style='font-size:11pt;font-weight:bold;' >"
				+"				<font color='white'> Available Box Details</font>"
				+"			</div>"
				+"		</td>"
				+"	</tr>"
				+"	<tr>";
		if(groupCode=="SD" || groupCode=="RE"){
			tableHead=tableHead	+ "	<th>Box Number</th>"
			+ "	<th>From Range</th>"
			+ "	<th>To Range</th>"
			+ "	<th>Box Qty</th>"
			+ "	<th>Avail Qty</th>";
			+ "	<th>Action</th>"
		}else{
			tableHead=tableHead+ "	<th>Action</th>"
			+ "	<th>Box Number</th>"
			+ "	<th>From Range</th>"
			+ "	<th>To Range</th>"
			+ "	<th>Box Qty</th>"
			+ "	<th>Avail Qty</th>";
		}
		tableHead=tableHead+ "</tr>";
	return tableHead;
}

function setBoxDetailsRecord(boxDetailsList) {
	var tableData = "";
	var tempOrderHistoryList=boxDetailsList;
	if (boxDetailsList.length != undefined) {
		if (boxDetailsList.length > 0) {
			var groupCode=$("#groupCode").val();
			for (var i = 0; i < boxDetailsList.length; i++) {
					if(groupCode=="SD" || groupCode=="RE"){
						tableData = tableData + "<tr>"
						+"	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxNumber + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxStartRange + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxEndRange + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxQtyType + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].availableStock + "</td>"
						+"	<td>"
						+"		<div id='btnGetBoxSeDetailsDiv"+boxDetailsList[i].id+"' style='display: block;'>"
						+"			<input type='button' id='btnGetBoxSeDetails"+boxDetailsList[i].id+"'  value='Get Box SE Details' onclick='return getBoxSeDetailsByBoxId("+boxDetailsList[i].id+"});'/>"
						+"		</div>";
						+"		<div id='btnShowHideBoxSeDetailsDiv"+boxDetailsList[i].id+"' style='display: none;'>"
						+"			<input type='button' id='btnShowHideBoxSeDetails"+boxDetailsList[i].id+"' value='Hide Box SE Details' onclick='return showHideBoxSeDetails(${"+boxDetailsList[i].id+"});'/>"
						+"		</div>"
						+"	</td>"
						/*+"	<td><input type='button' name='btnSeDetails' id='btnSeDetails"+boxDetailsList[i].id+"' onClick='getBoxSeDetails(\""+boxDetailsList[i].id+"\")' /></td>"*/
						+"</tr>"
						+"<tr>"
						+"	<td colspan='6' align='center' valign='top'>"
						+"		<div align='center' id='boxSeInfoDiv"+boxDetailsList[i].id+"' style='display: none;''>"
						+"			<div width='90%' align='center' id='boxDivScroll' class='boxDivWithScroll'>"
						+"				<table id='boxSeDetailsInfoDiv"+boxDetailsList[i].id+"' border='1' width='100%'>"
						+"					<thead></thead>	<tbody></tbody>"
						+"				</table>"
						+"			</div>"
						+"		</div>"
						+"	</td>"
						+"</tr>";
					}else{
						tableData = tableData + "<tr>"
						+"<td><input type='checkbox' name='boxCheck' path='boxCheck' id='boxCheck"+boxDetailsList[i].id+"' onClick='setSelectedBox(this,\""+boxDetailsList[i].id+"\",\""+boxDetailsList[i].boxNumber+"\",\""+boxDetailsList[i].boxQtyType+"\")' /></td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxNumber + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxStartRange + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxEndRange + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].boxQtyType + "</td>"
						+ "	<td style='margin-left:20px;'>"
						+ boxDetailsList[i].availableStock + "</td>"
						+ "</tr>";
					}
			}
		} else {
			tableData = "<tr><td colspan='6' align='center' style='font-size: 11pt;'>No record found.</td></tr>";
		}
	} else {
		tableData = "<tr><td colspan='6' align='center' style='font-size: 11pt;'>No record found.</td></tr>";
	}
	return tableData;
}

//Funtion for setSelectedBox based on boxid and box number
var selectedBoxMap = {};
var counter=0;

function setSelectedBox(thisObj, boxId, boxNumber, boxQtyType){
	var checkBoxIdName=$(thisObj).attr("id");
	if($("#"+checkBoxIdName).is(':checked')){
		selectedBoxMap[boxId] = boxNumber+";"+boxQtyType;
		counter++;
	}else{
		delete selectedBoxMap[boxId];
		counter--;
	}
	var selectedBoxInfo = JSON.stringify(selectedBoxMap);
	//alert("selectedBoxList : "+selectedBoxList);
	$('#selectedBoxInfo').val(selectedBoxInfo);
	if(counter>0){
		$("#btnSubmitDiv").show();
	}else{
		$("#btnSubmitDiv").hide();
	}
}


//Function for Selected Box Validation
function checkSelectedBoxValidation(event){
	var completeCheck=true;
	if(counter<=0)
		completeCheck=false;
	return completeCheck;
}

//Function for show-hide box SE details div
function showHideBoxSeDetails(rangeId){
	if($('#boxSeInfoDiv'+rangeId).is(':visible'))
	{  
		$('#boxSeInfoDiv'+rangeId).hide();
		$('#btnShowHideBoxSeDetails'+rangeId).val("Show Box SE Details");
	}else{
		$('#boxSeInfoDiv'+rangeId).show();
		$('#btnShowHideBoxSeDetails'+rangeId).val("Hide Box SE Details");
	}
}

//Function for getting box SE details
function getBoxSeDetailsByBoxId(boxId){
	$.ajax({
		type : "post",
		url : 'ajax/getBoxSeDetailsByBoxId',
		cache : false,
		dataType: "json",
		data : {
			boxId : boxId
		},
		success : function(response) {
			var boxDetailsList = response;
			var tableHead = setBoxDetailHeader();
			// alert("tableHead : "+tableHead);
			var tableData = setBoxDetailsRecord(boxDetailsList);
			// alert("tableData : "+tableData);
			$('#boxSeInfoDiv'+boxId).show();
			$('#boxSeDetailsInfoDiv'+boxId+' thead').empty();
			$('#boxSeDetailsInfoDiv'+boxId+' thead').append(tableHead);

			$('#boxSeDetailsInfoDiv'+boxId+' tbody').empty();
			$('#boxSeDetailsInfoDiv'+boxId+' tbody').append(tableData);
			$('#btnSeGetBoxSeDetailsDiv'+boxId).hide();
			$('#btnShowHideBoxSeDetailsDiv'+boxId).show();
	},
		error : function(errorThrown) {
			return false;
		}
	});
}