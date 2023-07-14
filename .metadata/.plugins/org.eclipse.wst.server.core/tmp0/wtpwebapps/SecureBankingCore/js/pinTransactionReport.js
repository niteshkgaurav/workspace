function getTransactionInfo(){
	
	var fromDate=$("#lab_start_date").val();
	var endDate=$("#lab_end_date").val();
	var portalName=$("#portalName").val();
	$.ajax({
		type: "post",
		url: "ajax/getTransactionDetails",
		dataType: "json",
		data:"&fromDate="+fromDate+"&endDate="+endDate+"&portalName="+portalName,
		success: function(response){
			
			var valuess=response;
			$('#pinTransReport').html('<thead><tr class="mainTableHeaderNew"><th>Transaction Date</th><th>Transaction Id</th><th>Portal Name</th><th>Calling IP</th><th>Total pins</th><th>Gross Amount</th><th>Gross Commission</th><th>Tax</th><th>Surcharge</th><th>Net Commission</th><th>Net Amount</th><th>Trnx Status</th><th>Status</th></tr></thead><tbody>');
			for(var i=0;i<valuess.length;i++)
			{
	
				$('#pinTransReport').append('<tr><td align="center">'+valuess[i].transactionDate+'</td><td><a id="showLink" style="color: #00f;"  onclick="return hrefDetails('+valuess[i].id+');">'+valuess[i].transactionId+'</td><td>'+valuess[i].companyName+'</td><td>'+valuess[i].portalIp+'</td><td align="center">'+valuess[i].numbeOfPin+'</td><td align="center">'+valuess[i].totalAmount+'</td><td align="center">'+valuess[i].grossCommission+'</td><td align="center">'+valuess[i].tax+'</td><td align="center">'+valuess[i].surcharge+'</td><td align="center">'+valuess[i].netCommission+'</td><td align="center">'+valuess[i].netAmount+'</td><td align="center">'+valuess[i].portalTrxnStatus+'</td><td>'+valuess[i].status+'</td></tr>');
			}	
			$('#pinTransReport').show();
		}
	});
}

function hrefDetails(idValue)
{
	var fromDate=$("#lab_start_date").val();
	var endDate=$("#lab_end_date").val();
	var portalName=$("#portalName").val();
	$.ajax({
		type: "post",
		dataType: "json",
		url: "ajax/getPinDetail",
		data:"fromDate="+fromDate+"&endDate="+endDate+"&idValue="+idValue+"&portalName="+portalName,
		success: function(response){
			var valuess=response;
			$('#pinTransReport').html('<thead><tr><th>Transaction Date</th><th>Transaction Id</th><th>Portal Name</th><th>Portal IP</th><th>Total pins</th><th>Total Amount</th><th>Commission</th><th>Net Amount</th><th>Portal Transaction Status</th><th>Status</th></tr></thead><tbody>');
			for(var i=0;i<valuess.length;i++)
			{
				$('#pinTransReport').append('<tr><td align="center">'+valuess[i].transactionDate+'</td><td><a id="showLink" style="color: #00f;"  onclick="return hrefDetails('+valuess[i].id+');">'+valuess[i].transactionId+'</td><td>'+valuess[i].portalName+'</td><td>'+valuess[i].portalIp+'</td><td align="center">'+valuess[i].numbeOfPin+'</td><td align="center">'+valuess[i].totalAmount+'</td><td align="center">'+valuess[i].commission+'</td><td align="center">'+valuess[i].netAmount+'</td><td align="center">'+valuess[i].portalTrxnStatus+'</td><td>'+valuess[i].status+'</td></tr>');
				if(valuess[i].pinInfoData!=null && valuess[i].pinInfoData.length!=0)
				{
					$('#pinDetailsReport').html('<thead><tr><th align="center">Serial Number</th><th align="center">Denomination Amount</th><th align="center">Commission</th><th align="center">Net Amount</th><th align="center">Status</th></tr></thead><tbody>');
					for(var j=0;j<valuess[i].pinInfoData.length;j++)
					{
						$('#pinDetailsReport').append('<tr><td align="center">'+valuess[i].pinInfoData[j].pinSerialNumber+'</td><td align="center">'+valuess[i].pinInfoData[j].denominationValue+'</td><td align="center">'+valuess[i].pinInfoData[j].pinCommission+'</td><td align="center">'+valuess[i].pinInfoData[j].pinNetAmount+'</td><td align="center">'+valuess[i].pinInfoData[j].pinStatus+'</td></tr>');
					}
					$('#pinDetailsReport').dialog({
						width: 600,
						height: 200,
					});
				}
			}	
			$('#pinTransReport').show();
		}
	});
}

function validTransactionForm(event)
{
	var fromDate=$("#lab_start_date").val();
	var endDate=$("#lab_end_date").val();
	

	if(fromDate.length==0)
	{
		$('#start_dateErrorId').html("<b><font color='red'>Kindly Select From date.</font></b>");
	}
	
	if(endDate.length==0)
	{
		$('#dateErrorId').html("<b><font color='red'>Kindly Select To date.</font></b>");
	}
	if(Date.parse(fromDate) > Date.parse(endDate)){
		$('#dateErrorId').html("<b><font color='red'>From date should be smaller then To date.</font></b>");
	}
	else{
		getTransactionInfo();
	}



}