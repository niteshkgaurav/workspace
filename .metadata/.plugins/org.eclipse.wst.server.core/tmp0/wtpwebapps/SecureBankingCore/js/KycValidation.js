var internalKycTableDiv;
var kycPath = "";
function onLoad() {
	internalKycTableDiv = $('#internalKycTableDiv');
	$('#internalKycTableDiv').hide();
	kycPath = $('#link').val()+$('#kycPath').val()+"/";
//	$('#lab_end_date').val('');
//	$('#lab_start_date').val('');
}

function fetchAgentDistributor(parentName,childName,type){
	var parentId = $('#'+parentName).val();
	if(parentId!=0){
		$.ajax({
			type : 'POST',
			url : 'ajax/fetchChilds',
			dataType: "json",
			data : 'parentId='+parentId+'&type='+type,
			success: function(response){
				var count = 0;
				var select = $('#'+childName);                        
				select.find('option').remove();  
				select.append("<option value= '0' ></option>");
				$.each(response,function(key, value) 
				{
					count++;
				    select.append('<option value=' + key + '>' + value + '</option>');
				});
//				if(count>0){
//					select.append('<option value= "-1">ALL</option>');
//				}
				if(type==='DI'){
					var select1 = $('#agentName');                        
					select1.find('option').remove();  
					select1.append("<option value= '0' ></option>");
				}
			}
		});
	}
}

function changeClass(labelId, errorId) {
	$('#'+labelId).addClass("valid");
	$('#'+labelId).show();
	$('#'+errorId).hide();
	$('#'+errorId).addClass("collapse");
}


var result;
function fetchData(){
	$('#fetchButton').attr('disabled', true);
	var distributorName = $('#distributorName').val();
	var status = $('#status').val();
	var subDistributor = $('#subDistributorName').val();
	var agentName = $('#agentName').val();
	var fromDate = $('#lab_start_date').val();
	var toDate = $('#lab_end_date').val();
	var flag = true;
	$('#customerDetailsTable').find("tr:gt(0)").remove();
	if(distributorName == 0) {
		$('#div_DistName').addClass("has-error");
		flag = false;
	}
	if(subDistributor == 0) {
		$('#div_SubDistName').addClass("has-error");
		flag = false;
	}
	if(agentName == 0) {
		$('#div_AgentName').addClass("has-error");
		flag = false;
	}
	if(status.length < 1	) {
		$('#div_Status').addClass("has-error");
		flag = false;
	}
	var b = checkDate();
	if(b == false || flag == false) {
		$('#fetchButton').attr('disabled', false);
		return false;
	}
	$('#label_toDate').show();
	$('#toDateErrorId').hide();
	
	
	if(b && flag){
		if(distributorName!=0||subDistributor!=0||agentName!=0 ){
			$.ajax({
				type:'POST',
				url: 'ajax/fetchKycData',
				dataType: "json",
				data: 'distributor='+distributorName+'&subDistributor='+subDistributor+'&agent='+agentName+'&status='+status+'&fromDate='+fromDate+'&toDate='+toDate,
				success: function(response){
					result = response;
					if(response.length==0){
						$('#ZeroLengthErrorId').html("<font color='red'>No Record Found.</font>");
						$('#kycDataTableId').hide();
					}else{
						$('#ZeroLengthErrorId').html("");
						$('#customerDetailsTable').show();
						
					}
					var datas = response;
					for(var i=0;i<datas.length;i++){ 
						var custId = datas[i].custId;
						$('#customerDetailsTable').append("<tr onclick='showDocument(this);' class="+"clickable-row"+" id="+custId+"><td align='center'>"+(i+1)+"</td><td align='center'>"+datas[i].custId+"</td><td align='center'>"+datas[i].custName+"</td><td align='center'>"+datas[i].custMsisdn+"</td><td align='center'>"+datas[i].custAddDate+"</td><td align='center'>"+datas[i].custStatus+"</td></tr><tr><td colspan="+6+" id="+"row"+custId+"></td></tr>");
					}
					$('#fetchButton').attr('disabled', false);
				},
				error: function(response){
				}
			});
		}
	}
}
var kycRowId;
function showDocument(obj) {
	var id = obj.id;
	if(kycRowId != null)
		$('#'+kycRowId).html('');
	
	$('#internalKycTable').find("tr:gt(0)").remove();
	kycRowId = "row"+id;
	var list;
	for(var i=0; i<result.length; i++) {
		var custId = result[i].custId;
		if(id == custId) {
			list = result[i].idList;
			break;
		}
	}
	if(list != null) {
		for(var k=0;k<list.length;k++){ 
			var str = "<tr colspan="+6+" class=''>";
			str = str+"<td align='center'>"+(k+1)+"</td>";
			str = str+"<td align='center'>"+list[k].docName+"</td>";
			str = str+"<td align='center'><a href="+kycPath+list[k].idName+">"+list[k].idName+"</a></td>";
			str = str+"<td align='center'>"+list[k].idNum+"</td>";
			str = str+"<td align='center'>"+list[k].docStatus+"</td>";
			str = str+"<td align='center'>"+list[k].addedOn+"</td>";
			if(list[k].updatedOn == null)
				str = str+"<td align='center'>NA</td>";
			else 
				str = str+"<td align='center'>"+list[k].updatedOn+"</td>";
			str = str+"<td align='center'>"+list[k].comment+"</td></tr>";
			
			$('#internalKycTable').append(str);
		}
		$('#'+kycRowId).addClass('');
		$('#'+kycRowId).html($('#internalKycTableDiv').html());
	}
	
	
	
}


var f=0;
function checkDate(){
	
	$('#ZeroLengthErrorId').html('');
	var fromDate=$('#lab_start_date').val();
	var toDate=$('#lab_end_date').val();
	if(fromDate.length!=0){
		$('#label_fromDate').addClass("valid");
		$('#fromDateErrorId').html('');
	} else {
		$('#div_fromDate').addClass("has-error");
		f = 1;
	}
	if(toDate.length!=0){
		$('#label_toDate').addClass("valid");
		$('#toDateErrorId').html('');
	} else {
		$('#div_toDate').addClass("has-error");
		f = 1;
	}
	if(fromDate.length!=0 && toDate.length!=0){
		if(fromDate>toDate){
			
			$('#label_toDate').hide();
			$('#toDateErrorId').addClass("valid");
			$('#toDateErrorId').show();
			$('#toDateErrorId').html('<font color="red">To Date must be greater than From Date.</font>');
		//$('#fromDate').val('');
			$('#toDate').val('');
			return false;
		}
	}	
	if(f == 1)
		return false;
	return true;
}

	

function acceptApplicationStatus(id){
	$('#tbody').empty();
	var status = "ACCEPT";
	$.ajax({
		
		url:'ajax/applicationStatus',
		type:'POST',
		dataType: "json",
		data:'id='+id+'&status='+status,
		success:function(response){
			$('#applicationtableId').append("<tr ><td></td>><td colspan='2' align='center'><font color='red'>Application Accepted</font></td></tr>");
		
		}
	});
	//return false;
}

function rejectApplicationStatus(id){
	$('#tbody').empty();
	var status = "REJECT";
	$.ajax({
		url:'ajax/applicationStatus',
		type:'POST',
		dataType: "json",
		data:'id='+id+'&status='+status,
		success:function(response){
			$('#applicationtableId').append("<tr><td colspan='2' align='center'><font color='red'>Application Rejected</font></td></tr>");	
		}
	});
	//return false;
}
//to change the status of document with the Ok and Not Ok
function changeToApproveStatusPerDoc(value){
	var status = 'APPROVED';
	$.ajax({
		type:'POST',
		url:'ajax/changeStatus',
		dataType: "json",
		data:'id='+value+'&status='+status,
		success: function(response){
				try{
			$('#docStatusId').html(status);
			$('#documentValidationTable').show();
			$('#documentValidationTableId').show();
			$('#applicationStatusRowId').show();
			$('#applicationStatusId').show();
				}
				catch (e) {
				}
			
		//	$('#documentValidationTableId').append("<tr id='applicationStatusRowId'  ><td colspan='6' align='center'><table id='applicationStatusId' width='100%'><tr><td align='right'>Application Status</td><td><input type='button' value='Accept' onclick='acceptApplicationStatus("+id+")' acceptApplicationStatus()/>&nbsp;<input type='button' value='Reject' onclick='rejectApplicationStatus("+id+")'/></td></tr></table></td></tr>");
    	
			
		}
	});
	$('#applicationStatusRowId').show();
	$('#documentValidationTableId').show();
}

function removeError(id) {
	removeHasError(id);
}


function changeToRejectStatusPerDoc(value){
	var status = 'REJECTED';
	$.ajax({
		type:'POST',
		url:'ajax/changeStatus',
		dataType: "json",
		data:'id='+value+'&status='+status,
		success: function(response){
			$('#docStatusId').html(status);
			$('#applicationStatusRowId').show();
		}
	});
}

function emptyErrorMessage(){
	$('#noPendingDocsId').html('');
	
}

function removeSuccessMessage(){
	$('#msgId').html('');
}
function emptyAplicationErrorID(){
//	$('#applicationStatusId').html('');
}
function removeErrorMessage(){
	$('#ZeroLengthErrorId').html("");
	$('#ermsgId').html("");
}