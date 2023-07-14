function validateFileExport(formId,event)
{

	$('#waitId').show();
	$('#submitId').hide();
	var completeCheck = true;
	var pinId = $('#pinId').val();
	if(pinId==0)
	{
		$('#pinErrorId').html("<b><font color='red'>Kindly select pin template.</font></b>");
		completeCheck= false;
	}
	else
	{
		/*$('#label_Master_version_ErrorId').hide();*/
	
	
	$.ajax({
		type: "post",
		url: "ajax/fileExportSubmit",
		dataType: "json",
		data: 'pinId='+pinId,
		success: function(response){
			var valuess=response;
			$('#template_details').html('<thead><tr class="mainTableHeader"><th>Denominator Name</th><th>Quantity</th><th>Expiry Date</th></tr></thead><tbody>');
			for(var i=0;i<valuess.length;i++)
			{
				$('#template_details').append('<tr><td align="center">'+valuess[i].denominator+'</td><td align="center">'+valuess[i].quantity+'</td><td align="center">'+valuess[i].expiryDate+'</td></tr>');
			}	
			$("#tempDetails").show();
			$('#template_details').show();
			$("#showSubmit").show();
			$("#showLink").show();
			$('#waitId').hide();
			$('#submitId').show();
			var pinId=$( "#pinId option:selected" ).text();
			var context=$('#contextPath').val();
			var h=context+"/AdminUI/fileExport/download.do?templateId="+pinId;
			a = document.getElementById('showLink');
			a.setAttribute("href",h);
		}
	});
	}
	if(!completeCheck)
	{
		$("#showLink").hide('');
		//alert('fail')
		$("#showLink").hide('');
		//$("#tempDetails").show();
		$('#template_details').hide('');
		$('#waitId').hide();
		$('#submitId').show();

		event.preventDefault();
		
		
	}
	else
	{
		$('#'+formID).submit();
	}
}

function getDescription(pinId,descriptionId){
	var pinId=$("#"+pinId).val();
	if(pinId.length==0){
		return false;
	}
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getDescription',
		  type: 'POST',
		  data: 'pinId='+pinId,
		  dataType: "json",
		  success: function(data) {
			  obj=data.description;
			  $("#"+descriptionId).val(obj);
		  },
		  error: function(e) {
			alert("error: "+e);
		  }
		});
}

$(document).ready( function (){
	$("#tempDetails").hide();
	$('#waitId').hide();
	
}); 

function hideDetails(tableName)
{
	$("#"+tableName).hide();
}

