function selectAllFunc()
{
	var i = 0;
	if($('#alldenominator_0').prop('checked'))
	{
		$('#pinTableId :checkbox').each(function(){
		if($(this).val()!=0){
			$('#denominator_'+$(this).val()).prop('checked','checked');
			$('#quantity_'+$(this).val()).prop('disabled',false);
			$('#expiryDate_'+$(this).val()).prop('disabled',false);
			$('#expiryDate_'+$(this).val()).prop('readonly',true);
		}});
	}else
	{
		$('#pinTableId :checkbox').each(function(){
			if($(this).val()!=0)
			{	
				$('#denominator_'+$(this).val()).prop('checked',false);
				$('#quantity_'+$(this).val()).prop('disabled',true);
				$('#expiryDate_'+$(this).val()).prop('disabled',true);
				$('#expiryDate_'+$(this).val()).prop('readonly',false);
				$('#lab_quantityErrorId_'+$(this).val()).html('');
				$('#lab_expiryErrorId_'+$(this).val()).html('');
			}});
	}
}

function setDisable(denominatorId,id)
{
	alert(denominatorId);
	
	if($('#'+denominatorId).prop('checked'))
	{
		$('#quantity_'+id).prop('disabled',false);
		$('#expiryDate_'+id).prop('disabled',false);
		$('#expiryDate_'+id).prop('readonly',true);
	}else
	{
		$('#quantity_'+id).val('');
		$('#quantity_'+id).prop('disabled',true);
		$('#expiryDate_'+id).prop('readonly',false);
		$('#expiryDate_'+id).val('');
		$('#expiryDate_'+id).prop('disabled',true);
		$('#lab_quantityErrorId_'+$(this).val()).html('');
		$('#lab_expiryErrorId_'+$(this).val()).html('');
	}
}

function quantityCheck(event,quantityId,errorId)
{
	if($('#'+quantityId).val()>10000)
	{
		$('#'+errorId).html("<font color='red'><b>Quantity cannot be greater than 10000</b></font>");
		$('#'+quantityId).val('');
	}
	else if($('#'+quantityId).val()==0)
	{
		$('#'+errorId).html("<font color='red'><b>Quantity cannot be 0</b></font>");
		$('#'+quantityId).val('');
	}
	else
	{
		$('#'+errorId).html("");
	}
}

function duplicateCheck(errorId)
{
	var templateName = $('#templateName').val();	

	$.ajax({
		  url: 'ajax/checkDuplicateTemplateName',
		  type: 'POST',
		  data: 'templateName='+templateName,
		  dataType: "json",
		  success: function(data) {
			  if(data != 0)
			  {
				  $('#'+errorId).html("<font color='red'>This Template Name is not available !!</font>");
				  $('#templateName').val('');
			  }
			  else
			  {
				  $('#'+errorId).html("<font color='green'>This Template Name is available !!</font>");
			  }
		  }
	});
}
/*
$(document).ready(function() { 
    $('#submitId').click(function() { 
    	alert("hellllooooooooooooooo");
    	$('#spinnerId').show();
    	$('#spinnerId').html("<tr><td colspan='2'><img src='/images/spinner.gif'></img></td></tr>");
    	$('#spinnerTableId').dialog({
    		width: 375,
    		height: 225,
    		title: 'wait..',
    		buttons : {
    			"submit" : function ()
    			{
    			}
    			}
    		});
//        $.blockUI({ message: '<h1>Just a moment...</h1>' }); 
//        $.blockUI({ message: '<h1>Just a moment...</h1>' });   spinnerIds
    	
    	event.preventDefault();
    }); 
});
*/
function pinGenerationValidate(event)
{
	var templateName = $('#templateName').val();
	var templateDescription = $('#templateDescription').val();
	var pinNumber =0;
	var flag = true;
	$('#pinTableId :checkbox:checked').each(function(i){
	pinNumber = $(this).val();
	if(pinNumber!=0){
	if($('#quantity_'+pinNumber).val().trim().length==0)
	{
		$('#lab_quantityErrorId_'+pinNumber).html("<b><font color='red'>Quantity cannot be empty!!</font></b>");
		flag = false;
	}
	var expiryDate_=$('#expiryDate_'+pinNumber).val();
	alert(expiryDate_);
	if($('#expiryDate_'+pinNumber).val().trim().length==0)
	{
		
		$('#lab_expiryErrorId_'+pinNumber).html("<b><font color='red'>Expiry Date cannot be empty!!</font></b>");
		//emptyer(event);
		flag = false;
	}
	}
     });
	
	if(templateName.trim().length==0)
	{
		$('#lab_templateNameErrorId').html("<b><font color='red'>Template Name cannot be empty!!</font></b>");
		flag = false;
	}
	if(templateDescription.trim().length==0)
	{
		$('#lab_templateDescriptionErrorId').html("<b><font color='red'>Template Description cannot be empty!!</font></b>");
		flag = false;
	}
	if(flag == false)
	{
		event.preventDefault();
	}
	else
	{
		showLoading();
		hideThis();
		event.submit();
	}
		
}


function hideThis(){
	$('#submitId').hide();
	$('#waitBtnId').show();
}


function showLoading() {
	$.blockUI({ message: '<h1><img src="/securebanking/images/ajax-loader.gif" /> Please Wait...</h1>' });
}
/*emptyer(datepick)
		{
			 
	
		 /*  $("pickerOpts").click(function() {
			   alert("hh");
			   $('#lab_expiryErrorId_'+pinNumber).html("");
		   });
		
		$('.ui-datepicker-trigger').click(function(){
		if($('#expiryDate_'+pinNumber).val().trim().length!=0)
		$('#lab_expiryErrorId_'+pinNumber).html("");
		//return false;
		if(flag == false)
		{
			event.preventDefault();
		}
	});
	
	
		//}*/
