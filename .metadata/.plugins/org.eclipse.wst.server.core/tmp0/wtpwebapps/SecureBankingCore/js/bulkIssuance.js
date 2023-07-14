$(document).ready(function(){ 
	$("#showSubmit").hide();	
	
$("#mvId").change(function() {
		var mvId = $(this).val();
		    if(mvId!=''){
		    	 getHostSubVersion(mvId)
		    }
		    else{
		    	$('#hsvId').find('option').not(':first').remove();
		    }
	 });
});
function getHostSubVersion(mvId){
	$('#duplicate_SE_ErrorId').hide();
	$("#msgId").html("");
	$("#errorId").html("");
	$.ajax({
		type: "post",
		url: "ajax/getHostSubVersions",
		dataType: "json",
		data:"mvId="+mvId,
		success: function(response){
			var hsvMap=response.hsvMap;
			var select = $('#hsvId');
			select.find('option').remove();
			$('<option>').val("").text("Host Sub Version").appendTo(select);
			$.each(hsvMap, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
			});
		}
	});
}
function getSubDistributer(){
	$('#duplicate_SE_ErrorId').hide();
	$("#msgId").html("");
	$("#errorId").html("");
	var distributerId = $("#distributerId").val();
	if(distributerId==0)
	{
		$('#subdistributerId').hide();
		$('#agentIdForShow').hide();
	}
	else
	$('#subdistributerId').show();
	$.ajax({
		type: "post",
		url: "ajax/distributorsubdistributormapping",
		dataType: "json",
		data:"distributerId="+distributerId,
		success: function(response){
			var select = $('#subDistributerId');
			select.find('option').remove();
			$('<option>').val("0").text("All").appendTo(select);
			$.each(response, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
				$("#subdistributerId").show();
			});
		}
	});
}

function getAgent(){
	$('#duplicate_SE_ErrorId').hide();
	var subdistributerId = $("#subDistributerId").val();
	if(subdistributerId==0)
	{
		$('#agentIdForShow').hide();
	}
	else
	$('#agentIdForShow').show();
	$.ajax({
		type: "post",
		url: "ajax/subdistributoragentmapping",
		data:"subdistributerId="+subdistributerId,
		dataType: "json",
		success: function(response){
			var select = $('#agentId');
			select.find('option').remove();
			$('<option>').val("0").text("All").appendTo(select);
			$.each(response, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
				$("#agentIdForShow").show();
			});
		}
	});
}

function agentsRetrieve()
{
	$('#duplicate_SE_ErrorId').hide();
	$("#msgId").html("");
	$("#errorId").html("");
	var mvId = $('#mvId').val();
	var hsvId = $('#hsvId').val();
	var productId = $('#productId').val();
	var distributerId = $('#distributerId').val();
	var subDistributerId=$('#subDistributerId').val();
	var agentId = $('#agentId').val();
	if(mvId.length==0)
	{
		$('#label_Master_version_ErrorId').html("<b><font color='red'>Kindly Select Master Version</font></b>");
		return false;
	}
	else
	{
		$('#label_Master_version_ErrorId').hide();;
		
	}
	if(hsvId.length==0)
	{
		$('#label_host_version_ErrorId').html("<b><font color='red'>Kindly Select Host Sub Version</font></b>");
		return false;
	}
	if(productId.length==0)
	{
		$('#label_product_ErrorId').html("<b><font color='red'>Kindly Select Product</font></b>");
		return false;
	}
	if(distributerId.length==1)
	{
		$('#label_Distributer_ErrorId').html("<b><font color='red'>Kindly Select Distributer</font></b>");
		return false;
	}
	
	$.ajax({
		type: "post",
		url: "ajax/getAgentsUsers",
		dataType: "json",
		data:"mvId="+mvId+"&hsvId="+hsvId+"&productId="+productId+"&distributerId="+distributerId+"&subDistributerId="+subDistributerId+"&agentId="+agentId,
		success: function(response){
			var valuess=response;
			$('#bulk_issuance_details').html('<thead><tr><th>User Name</th><th>Mobile Number</th><th>Host Name</th><th>Distributer Name</th><th>Subdistributer Name</th><th>Agent Name</th><th>SE Name</th></tr></thead><tbody>');
			for(var i=0;i<valuess.length;i++)
			{
				$('#bulk_issuance_details').append('<tr><td>'+valuess[i].name+'</td><td>'+valuess[i].mobileNumber+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].distributerName+'</td><td>'+valuess[i].subdistributerName+'</td><td>'+valuess[i].agentName+'</td><td><select id="SEid'+i+'" name="SEMaps" onchange="emptyerror(event,\'duplicate_SE_ErrorId\');manageSE(\'SEMaps\',\'duplicate_SE_ErrorId\',\'SEid'+i+'\'\);"><option value="0" label="All" /><options items='+valuess[i].seMapForAgent+' /></select></td></tr>');
				var select = $('#SEid'+i);
			     select.find('option').remove();
			     $('<option>').val('').text('<-----Select----->').appendTo(select);
			     $.each(valuess[i].seMapForAgent, function(key,value)
			     {
			       $('<option>').val(key).text(value).appendTo(select);
			     });
			}	
			$('#bulk_issuance_details').show();
			$("#showSubmit").show();
		}
	});
}

function agentValidates(formID,event)
{
	var completeCheck = true;
	var mvId = $('#mvId').val();
	var hsvId = $('#hsvId').val();
	var productId = $('#productId').val();
	var distributerId = $('#distributerId').val();
	if(mvId.length==0)
	{
		$('#label_Master_version_ErrorId').html("<b><font color='red'>Kindly Select Master Version</font></b>");
		completeCheck= false;
	}
	else
	{
		/*$('#label_Master_version_ErrorId').hide();*/
	}
	if(hsvId.length==0)
	{
		$('#label_host_version_ErrorId').html("<b><font color='red'>Kindly select host sub version.</font></b>");
		completeCheck= false;
	}
	if(productId.length==0)
	{
		$('#label_product_ErrorId').html("<b><font color='red'>Kindly select a product.</font></b>");
		completeCheck= false;
	}
	if(distributerId.length==1)
	{
		$('#label_Distributer_ErrorId').html("<b><font color='red'>Kindly select a distributer.</font></b>");
		completeCheck= false;
	}
	var values = $.map($('select[name='+naam+'\]'), function (e) {
    if(values.length==0)
    {
    	$('#duplicate_SE_ErrorId').html("<b><font color='red'>Kindly issue SE to atleast one agent user.</font></b>");
    	completeCheck= false;
    }       	
    });
	if(!completeCheck)
	{
		event.preventDefault();
	}
	else
	{
	  formID.submit();
	}
}

function manageSE(naam,errorId,selectId)
{
	var values=[];	
	var el=$( "#"+selectId+" option:selected" ).text();
	values = $.map($('select[name='+naam+'\]'), function (e) {
        return $('option:selected', e).text();
    });
	for(var i=0;i<values.length;i++)
		{
			values[i]=values[i].replace(/\D+/g, '');
		}
	values = values.filter(Boolean);
	if (values.indexOf(el) == values.lastIndexOf(el))
	{
	}	
	else
	{
		$("#"+errorId).html("<b><font color='red'>This SE was already selected.Kindly select a different SE.</font></b>");
		$("#"+errorId).show();
		$( "#"+selectId).val('');
	}
}
function hideAgentDetails(tableId,submitId)
{
	$("#"+tableId).empty();
	$("#showSubmit").hide();
}
