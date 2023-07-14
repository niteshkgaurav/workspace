var counter=0;
function fetchWalletTopupData(contactNumberId)
{
	var contactNumber = $("#"+contactNumberId).val().trim();
	//alert(contactNumber);
	$('#contactNumber').attr('disabled','disabled');
	if(contactNumber.length==0)
	{
		$('#lab_contactNumberErrorId').html("<b><font color='red'>Kindly fill Contact Number!!</font></b>");
	}
	else if((contactNumber.length<10 || contactNumber.length>12)&& contactNumber.length>0)
	{
		$('#lab_contactNumberErrorId').html("<b><font color='red'>Contact Number should be between 10 to 12 digits!!</font></b>");
	}else
	{
	$.ajax({
		type:"POST",
		url:"ajax/fetchWalletDataForTopup",
		data:"contactNumber="+contactNumber,
		success:function(response){
			if(response==0)
			{
				$('#contactNumber').val('');
				$('#walletTopupTotalErrorId').html("<font color='red'><b>Contact Number do not exist in database !!</b></font>");
				$("#contactNumber").removeAttr('disabled');
			}
			if(response!=null && response.type.length>0 )
			{
				$('#detailsId').show();
				$('#customerName').val(response.customerName);
				$('#houseNoId').val(response.houseNo);
				$('#cityId').val(response.city);
				$('#lab_LandMark').val(response.landMark);
				$('#countryId').val(response.countryId);
				$('#stateId').val(response.stateId);
				$('#typeId').val(response.type);
				$('#pinCodeId').val(response.pinCode);
				$('#walletTopupTableId').html("<tr class='mainTableHeader'>"+
						"<th align='center'><input type='checkbox' id='walletTopup_0' value='0' onclick='selectAllFunc();'/></th>"+
						"<th align='center'>Wallet Name</th>"+
						"<th align='center'>Current Balance</th>"+
						"<th align='center'>Recharge Amount</th>"+
						"</tr>");
				if(response.walletData!=null)
				{
//					$('#forEachId').prop('items',response.walletData);
					$.each(response.walletData, function(index,data){
						counter++;
					$('#walletTopupTableId').append('<tr>'+
						'<td align="center"><input type="checkbox" id="walletTopup_'+data.id+'" name="walletTopupCheck" value="'+data.id+'" onclick="setDisable(\'walletTopup_'+data.id+'\'\,'+data.id+'\);"/></td>'+
						"<td align='center'>"+data.walletName+"</td>"+
						"<td align='center'>"+data.cashBalance+"</td>"+
						"<td align='center'>"+
							'<input type="text" id="topupId_'+data.id+'" placeholder="Topup Amount" maxlength="5" name="topupAmountId" disabled="true" onkeypress="onlyNumric(event,\'topupErrorId_'+data.id+'\');" onclick="emptyerror(event,\'topupErrorId_'+data.id+'\');"/>'+ //onclick='emptyerror(event,'lab_typeErrorId');  ----->>>>>   path='rechargeAmount'  class='selectbox''
            			"</td>"+
            		"</tr>");
					$('#walletTopupTableId').append('<tr><td></td><td></td><td></td><td><div id="topupErrorId_'+data.id+'"></div></td></tr>');
					});
				}
			}else {}
		}
	});
	}
}

function selectAllFunc()
{
	var i = 0;
	if($('#walletTopup_0').prop('checked'))
	{
		$('#walletTopupTableId :checkbox').each(function(){
		if($(this).val()!=0){
			$('#walletTopup_'+$(this).val()).prop('checked','checked');
			setDisable('walletTopup_'+$(this).val(),$(this).val());
		}});
	}else
	{
		$('#walletTopupTableId :checkbox').each(function(){
			if($(this).val()!=0)
			{	
				$('#walletTopup_'+$(this).val()).prop('checked',false);
				setDisable('walletTopup_'+$(this).val(),$(this).val());
			}});
	}
}

function setDisable(checkBoxId,id)
{
	if($('#'+checkBoxId).prop('checked'))
	{
		$('#topupId_'+id).prop('disabled',false);
		$('#walletTopupTableIdErrorId').html('');
	}
	else{
		$('#topupId_'+id).val('0');
		$('#topupId_'+id).prop('disabled',true);
	}
}

function clearAllData(detailsId,contactNumber)
{
	$('#'+detailsId).hide();
	$('#'+contactNumber).val('');
	$("#contactNumber").removeAttr('disabled');
}

function walletTopupValidate(event)
{
	var topupIdVal;
	var result=true;
	var countSelected = 0;
	$('#walletTopupTableId :checkbox:checked').each(function(i){
		topupIdVal = $(this).val();
		countSelected++;
		if($('#topupId_'+topupIdVal).val()<=0)
		{
			$('#topupErrorId_'+topupIdVal).html('<b><font color="red">Topup amount cannot be Negative Or Zero!!</font></b>');
			result = false;
		}
		else if($('#topupId_'+topupIdVal).val()>25000)
		{
			$('#topupErrorId_'+topupIdVal).html('<b><font color="red">Topup amount cannot exceed 25000!!</font></b>');
			result = false;
		}
		if($('#topupId_'+topupIdVal).val().length<=0)
		{
			$('#topupErrorId_'+topupIdVal).html('<b><font color="red">Kindly fill Topup amount!!</font></b>');
			result = false;
		}	
		});
	if(countSelected==0)
	{
		$('#walletTopupTableIdErrorId').html('<b><font color="red">Kindly select atleast one wallet for topup!!</font></b>');
		result = false;
	}
	if(!result)
	{
		event.preventDefault();
	}else
	{
		event.submit();
	}
}


