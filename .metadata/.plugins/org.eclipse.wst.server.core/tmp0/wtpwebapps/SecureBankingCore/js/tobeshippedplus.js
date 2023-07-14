function scaningtablelist()
{
	var scanitem=	$("#status_Id").val();
	var e = document.getElementById("Entity_Id");
	var poNo = e.options[e.selectedIndex].text;
	
	var status_Id = $('#status_Id').val();
	var qrValue = $('#qrValue').val();
	
	if($("#Entity_Id").val()==0){
		$('#divID_entity').addClass('has-error');
	return false;
	}
	if(qrValue.length<=0)
		{$('#divID_qrCodeValueId').addClass('has-error');
		return false;
		}
	
	
	
	
	var intValArray=qrValue.split('|');
	
	
	$.ajax({
		type: "post",
		url: "ajax/getInfoForMvAndProduct",
		dataType: 'json',
		data: 'product='+intValArray[0]+'&masterVersion='+intValArray[1]+'&poNo='+poNo,
		success: function(response){
			console.log("getInfoForMvAndProduct--------------response: "+response);
			$('#tempDetailsSubmit').show();
			$('#errorId').html("");
			
			if(status_Id==1)
			{
				$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th></tr></thead><tbody>');
				$('#template_details').append('<tr><td align="center">'+response[0]+'</td><td align="center">'+response[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+poNo+'</td><td align="center">'+response[2]+'</td></tr>');
			}	
			else
			{
				$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>External-Number</th><th>Order Number</th></tr></thead><tbody>');
				$('#template_details').append('<tr><td align="center">'+response[0]+'</td><td align="center">'+response[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+poNo+'</td></tr>');
				//$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+document.getElementById("orderno").value+'</td><td align="center">'+valuess[2]+'</td>');
				//$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+poNo+'</td><td align="center">'+valuess[2]+'</td>');
			}
			/*if(status_Id==1)
			{
				$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th></tr></thead><tbody>');
			}
			else
			{
				$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>External-Number</th><th>Order Number</th></tr></thead><tbody>');
			}
			if(status_Id==1)
			{		
				$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+poNo+'</td><td align="center">'+valuess[2]+'</td></tr>');
			}
			else
			{
				$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+poNo+'</td></tr>');
			}
		
			if(status_Id==1)
			{		
				//$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+document.getElementById("orderno").value+'</td><td align="center">'+valuess[2]+'</td></tr>');
				$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+poNo+'</td><td align="center">'+valuess[2]+'</td></tr>');
			}
			else
			{
				//$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+document.getElementById("orderno").value+'</td><td align="center">'+valuess[2]+'</td>');
				$('#template_details').append('<tr><td align="center">'+valuess[0]+'</td><td align="center">'+valuess[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+poNo+'</td><td align="center">'+valuess[2]+'</td>');
			}*/
			
			$('#tempDetailsSubmit').show();
		}
})
		}

	function validatetobehipped()
	{
		
		
		
		
	}




