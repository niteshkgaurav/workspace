var deactivateId;
var duplicacycheck;
function validateDenomination(event)
{
	$('#msgId').html('');
	var flag = true;
	var denominationValue = $('#denominationValue').val().trim();
	var a;
	
			a=denominationValue[0];
	
	if(a==0){
		$('#denominationValueId').hide();
		$('#lab_denominationValueErrorId').show();
		$('#lab_denominationValueErrorId').html('<font color="red" size="2">Denomination Value can not be started with zero</font>');
		$('#denominationValue').val('');
		flag= false;
	}
	
	
	
	if(denominationValue==0)
	{
		$('#denominationValueId').hide();
		$('#lab_denominationValueErrorId').show();
		$('#lab_denominationValueErrorId').html('<font color="red" size="2">Denomination Value can not be 0</font>');
		$('#denominationValue').val('');
		flag = false;
	}
	if(denominationValue.length == 0)
	{
		$('#denominationValueId').hide();
		$('#lab_denominationValueErrorId').show();
		$('#lab_denominationValueErrorId').html('<font color="red" size="2">Denomination Value can not be empty</font>');
		flag = false;
	}
	
	var denominationName =$('#IddenominationName').val().trim();

	if(denominationName.length == 0){
		$('#denominationNameId').hide();
		$('#denominationNameErrorId').show();
		$('#denominationNameErrorId').html('<font color="red" size="2">Denomination Name can not be empty</font>');
		flag = false;
	}
	if(denominationName.length > 0){
	duplicacycheck=checkduplicacy();
	if(duplicacycheck==false){
		flag = false;
	}

}
	var startDate =$('#startDate').val().trim();
	if(startDate.length == 0){
		$('#startDateId').hide();
		$('#startDateErrorId').show();
		$('#startDateErrorId').html('<font color="red" size="2">From Date can not be empty</font>');
		$('#startDate').val('');
		flag = false;
	}
	
	if(Date.parse(startDate)<=new Date){
		$('#startDateId').hide();
		$('#startDateErrorId').show();
		$('#startDateErrorId').html('<font color="red" size="2">From Date should be greater than today</font>');
		$('#startDate').val('');
		flag = false;
	}
	//alert('outside');
	var endDate =$('#endDate').val().trim();
	if(endDate.length == 0){
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date can not be empty</font>');
		$('#endDate').val('');
		flag = false;
	}
	
	if(Date.parse(endDate)<=Date.parse(startDate)){
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		$('#endDate').val('');
		flag = false;
	}
	
	if(flag == false)
	{
		event.preventDefault();
	}
	else
	{
		$('#denominationCreation').submit();
	}
}


function removeDenomination(rowId,id)
{
		
	$.ajax({
		type:"POST",
		url :"ajax/removeDenomination",
		data :"id="+id,
		autoOpen: false,
		success:function(response)
		{
		
		}
	});
	$("#denominationListTable").on('click', '.rwDel', function () {
	    $(this).closest('tr').remove();
	});
}

function dialoguebox(rowId,id)
{
	$('#denominationNameErrorId').html('');
	$('#lab_denominationValueErrorId').html('');
	$('#startDateErrorId').html('');
	$('#endDateErrorId').html('');
	$('#denominationNameId').show();
	$('#denominationValueId').show();
	$('#startDateId').show();
	$('#endDateId').show();
	$('#lab_deactiveId').html('');
	$('#msgId').html('');
	$('#remarks').val('');
	deactivateId=id;
	//$("#deactivateId").val(id);
	//alert(''+id);
$('#divId').show();
	
}

function deactivate(){
	

	var remarks=$('#remarks').val().trim();
	if(remarks.length<=0){
	$('#reason').hide();
	$('#remarksErrorId').show();
	$('#remarksErrorId').html('<font color="red" size="2">Enter Reason for deactivation</font>');
	return false;
	}
	var menuId=$('#menuId').val().trim();
	var submenuId=$('#submenuId').val().trim();
	var returnflag = function(){
		
			
			$.ajax({
				type:"POST",
				url :'ajax/deactivateDenomination',
				async: false,
				data :'deactivateId='+deactivateId+'&remarks='+remarks+'&menuId='+menuId+'&submenuId='+submenuId,
				success:function(response)
				{
				if(response==1){
					alert(reponse);
					/*$('#lab_deactiveId').html('<p class="text-success">Deactivated Successfully</p>');
					$('#lab_deactiveId').show();
					$('#divId').hide();*/
				}
				
					
				},
				error: function(){
					}
			});
			
		
		
		return 1;
	}();

	var link=$("input[name=link]:hidden").val();
	link=link+"/AdminUI/pinMgmnt/getDenomination?&menuId="+menuId+"&submenuId="+submenuId;
	
	
	if(returnflag==1){
		window.location.replace(link);
	
	}
	$('#remarks').val('');
}

function clearmsg(){
	$('#msgId').html('');
}
function cancel(){
	$('#divId').hide();
}
function selct(id){
	$("#"+id).addClass('valid');	
}
var completeCheck = false;
function checkduplicacy(){
	var denominationName =$('#IddenominationName').val().trim();

	var editFlag = function(){
			
		if(denominationName.length!=0) {
			
			$.ajax({
			    url : "ajax/checkDuplicateName",
			    type : "POST",
			    async: false,
			    data :'denominationName='+denominationName,
			    success : function(response) {
			   	if(response!=0)
				   {
			   		
			   		$("#denominationNameId").hide();
			   		$("#IddenominationName").val('');
				    $('#denominationNameErrorId').html('<p> <font color="red"> Name already exists</font></p>');
				    $('#denominationNameErrorId').show();
				    completeCheck = false;
				   
				   }if(response==0)
				   {
					   completeCheck = true;
				    
				   }
			  
			    },
			    error: function(data){
			   	return false;
				}
			});
			
		
		}
		return completeCheck;
	}();
	
	
	
	return editFlag;
	
	
}



