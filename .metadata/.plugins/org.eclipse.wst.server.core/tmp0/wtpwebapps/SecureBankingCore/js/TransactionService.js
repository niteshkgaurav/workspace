function validateTransactionService(formId,event)
{
	$('#submitId').hide();
	var completeCheck = true;
	var chkFor = $('#chkFor').val();
	var providers = $('#providers').val();
	var lab_start_date = $('#lab_start_date').val();
	var lab_end_date = $('#lab_end_date').val();
	var transactionType = $('#transactionType').val();
	

	if(lab_start_date.length==0)
	{
		$('#lab_start_date_ErrorId').html("<b><font color='red'>Kindly Select From date.</font></b>");
	}
	
	if(lab_end_date.length==0)
	{
		$('#lab_end_date_ErrorId').html("<b><font color='red'>Kindly Select To date.</font></b>");
	}
	if(Date.parse(lab_start_date) > Date.parse(lab_end_date)){
		$('#dateErrorId').html("<b><font color='red'>From date should be smaller then To date.</font></b>");
	}
		
	if(chkFor==0)
	{
		$('#chkForErrorId').html("<b><font color='red'>Kindly select Check for.</font></b>");
		completeCheck= false;
	}
	if(providers==0)
	{
		$('#providersErrorId').html("<b><font color='red'>Kindly select provider.</font></b>");
		completeCheck= false;
	}
	
	if(transactionType.length==0)
	{
		$('#pinErrorId').html("<b><font color='red'>Kindly select transaction type.</font></b>");
		completeCheck= false;
	}
	$.ajax({
		type: "post",
		url: "ajax/transactionReportDetails",
		dataType: "json",
		data:"fromDate="+lab_start_date+"&endDate="+lab_end_date+"&chkFor="+chkFor+"&provider="+providers+"&transactionType="+transactionType,
		success: function(response){
			var valuesss=response;
			var valuess=valuesss.transactionServiceData;
			$('#template_details').html('<thead><tr class="mainTableHeader"><th>Serial number</th><th>Initiator</th><th>Payer Wallet Name</th><th>Payer Wallet Id</th><th>Payee Wallet Code</th><th>Payee Wallet Id</th><th>Transaction Type</th><th>Debit Amount</th><th>Credit Amount</th><th>Host Transaction Id</th><th>Payer Transaction Id</th><th>Payee Transaction Id</th><th>Provider Name</th><th>Partner Name</th><th>Status</th><th>Subscriber Name</th></tr></thead><tbody>');
			for(var i=0;i<valuess.length;i++)
			{
				$('#template_details').append('<tr><td align="center">'+i+1+'</td><td align="center">'+valuess[i].initiator+'</td><td align="center">'+valuess[i].payerWalletName+'</td><td align="center">'+valuess[i].payerWalletId+'</td><td align="center">'+valuess[i].payeeWalletName+'</td><td align="center">'+valuess[i].payeeWalletId+'</td><td align="center">'+valuess[i].transactionTypes+'</td><td align="center">'+valuess[i].debit+'</td><td align="center">'+valuess[i].credit+'</td><td align="center">'+valuess[i].hostTxnId+'</td></td><td align="center">'+valuess[i].payerTxnId+'</td><td align="center">'+valuess[i].payeeTxnId+'</td><td align="center">'+valuess[i].providerId+'</td><td align="center">'+valuess[i].partnerId+'</td><td align="center">'+valuess[i].status+'</td><td align="center">'+valuess[i].subscriberId+'</td></tr>');
			}	
			
			$("#tempDetails").show();
			$('#template_details').show();
			$("#showSubmit").show();
			$("#debitAmount").val(valuesss.debitAmount);
			$("#creditAmount").val(valuesss.creditAmount);
			$("#netAmount").val(valuesss.netAmount);
			$("#showLink").show();
			$('#waitId').hide();
			$('#submitId').show();
			var pinId=$( "#providers option:selected" ).text();
			var context=$('#contextPath').val();
			var h=context+"/AdminUI/transactionService/download.do?providerId="+pinId;
			a = document.getElementById('showLink');
			a.setAttribute("href",h);
		}
	});
	
	if(!completeCheck)
	{
		alert('fail')
		$("#showLink").hide();
		event.preventDefault();
	}
	else
	{
		alert('true')
		$('#'+formID).submit();
	}
}

$(document).ready( function (){
	$("#tempDetails").hide();
	$("#showSubmit").hide();
}); 


function getTelcoAndPartner(chkFor,providers)
{
	var chkFor=$("#"+chkFor).val();
	if(chkFor==0){
		$('#'+providers).find('option:not(:first)').remove();
		 $("#"+providers).append('-----Select-----');
		return false;
	}
	else
	{	
		$.ajax({
			  url: 'ajax/getTelcoDetails',
			  type: 'POST',
			  dataType: "json",
			  data: 'chkFor='+chkFor,
			  success: function(data) {
				  obj=data.providerMap;
				  obj=JSON.stringify(obj);
				  var arr=getSortedArray(obj);
				  $('#'+providers).find('option:not(:first)').remove();
				  for(var i=0;i<arr.length;i++){
					  var key=arr[i].key;
					  var value=arr[i].value;
					  $("#"+providers).append(new Option(value,key));
				  }
			  },
			  error: function(e) {
				
			  }
			});
	}
}

