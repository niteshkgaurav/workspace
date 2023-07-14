
function onload(){
	//alert($('#lab_account_type1').val());
	if($('#lab_account_type1').val()==0){
		//alert()
		$("#seq1 ").attr("checked", false);
		 $("#lab_account_type1").attr("disabled", true); 
		}
	/*else{
		//
		$("#lab_account_type1 ").prop('disabled', 'disabled');
		}
	if($('#seq2').is(':checked')){}
	else{ 
		//alert('hi');
		$("#lab_account_type2").prop('disabled', 'disabled');
	}*/
		//$("#lab_account_type2").prop('disabled', 'disabled');}
	//if ( $('#seq1').prop('checked')==true){alert();$('#row1').show();}else{ $('#row1').hide();}
	//if ( $("#seq2").prop('checked')==true){$('#row2').show();}else{ $('#row2').hide();}
}

function enableSelect()
{
	$('#seqErrorId').html('');
	$('#lab_partnerPrefErrorId').html('');
	$("#lab_account_type1").val('');
	$('#lab_partnerPrefErrorId').html('');
	if($('#seq1').is(':checked')){
		$("#select1").load(location.href + " #select1");
	}
	else{
		($('#seq1').is(':checked')) ? $('#row1').show() : $("#lab_account_type1").attr("disabled", true);
			
		}
	
	
}

function enableSelect2()
{
	$("#seqErrorId").html('');
	$('#lab_partnerPrefErrorId').html('');
	$("#lab_account_type2").val('');
	$('#lab_partnerPrefErrorId').html('');
	if($('#seq2').is(':checked')){
		$("#select2").load(location.href + " #select2");
		
	}
	else{
		($('#seq2').is(':checked')) ? $('#row2').show() : $("#lab_account_type2").attr("disabled", true);
		}
	
}


function getRaioTextValue(divId){
	$('#bankAccErrorId').html("");
	$('#ccErrorId').html("");
 if(divId === 'IMPS'){
	 $('#mmidErrorId').html("");
	 $('#instrumentErrorId').html("");
 $('#mmidDIV').show();
 $('#bankDIV').hide();
$('#ccDIV').hide();
$('#walletDIV').hide();
 }
 if(divId === 'CREDITCARD'){
	 $('#bankAccErrorId').html("");
	 $('#ccErrorId').html("");
	 $('#instrumentErrorId').html("");
 $('#mmidDIV').hide();
 $('#mmidErrorId').html("");
	$('#bankDIV').hide();
	$('#ccDIV').show();
	$('#walletDIV').hide();
 }
 if(divId === 'BANK'){
	 $('#bankAccErrorId').html("");
	 $('#ccErrorId').html("");
	 $('#instrumentErrorId').html("");
	 $('#mmidErrorId').html("");
	 $('#mmidDIV').hide();
		$('#bankDIV').show();
		$('#ccDIV').hide();
		$('#walletDIV').hide();
	 }
 
 
 if(divId === 'WALLET'){
	 $('#bankAccErrorId').html("");
	 $('#ccErrorId').html("");
	 $('#instrumentErrorId').html("");
	 $('#mmidErrorId').html("");
	 $('#mmidDIV').hide();
		$('#bankDIV').hide();
		$('#ccDIV').hide();
		$('#walletDIV').show();
	 }
}

function validateMerchantPage(){
	
	//alert("validationResetPasswordPage ");
	var completeCheck = true;
	
	var type1=$( "#lab_account_type1").val();
	var type2=$( "#lab_account_type2").val();
	//alert(type1+":"+type2)
	
	
	if((type1==0)&&(type2==0)){
		$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
		return false;
	}
	if(type1!=0){
		
	if(type1==type2){
		
		$("#label_account_type1").hide();
		$("#label_account_type2").hide();
		$("#lab_partnerPrefErrorId").show();
		$("#lab_partnerPrefErrorId").html("<p class='text-danger'>Duplicate sequence are not allowed.</p>");
		return false;
	}
	}
	
	if($('#seq1').is(':checked')){
		
		if(type1==0){
			$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
			return false;
		}	
		}
	if($('#seq2').is(':checked')){
		
		if(type2==0){
			
			$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
			return false;
		}	
		}
	if(!($('#IMPS').is(":checked"))&& (!($('#CREDITCARD').is(":checked"))) && (!($('#BANK').is(":checked"))) && (!($('#WALLET').is(":checked"))))
	{
		$('#instrumentErrorId').html("");
		$('#instrumentErrorId').html("<p class='text-danger'>Kindly check atleast one radio button !</p>");
		completeCheck = false;
	}
	
	if(($('#IMPS').is(":checked")))
	{
		var mmid=$("#mmid").val();
		if(mmid.length<=0){
		$('#mmidErrorId').html("");
		$('#mmidErrorId').html("<p class='text-danger'>Kindly Enter mmid !.</p>");
		completeCheck = false;
		}
		
	}
	
	if(($('#CREDITCARD').is(":checked")))
	{
		var cardNo=$("#cardNo").val();
		var cardHolderName=$("#cardHolderName").val();
		if(cardNo.length<=0 && cardHolderName.length<=0){
		$('#ccErrorId').html("");
		$('#ccErrorId').html("<p class='text-danger'>Kindly Enter cc details!.</p>");
		completeCheck = false;
		}
		
	}
	
	if(($('#BANK').is(":checked")))
	{
		var bankAcc=$("#bankAcc").val();
		var ifsc=$("#ifsc").val();
		if(bankAcc.length<=0 && ifsc.length<=0){
		$('#bankAccErrorId').html("");
		$('#bankAccErrorId').html("<p class='text-danger'>Kindly Enter bank details !.</p>");
		completeCheck = false;
		}
		
	}
	
	
	
	var merchantCode=$("#merchantCode").val();
	if(merchantCode.length<=0){
		 $("#lab_MerchantCodeErrorId").html("<p class='text-danger'>Kindly Enter merchant Code !.</p>");
		 completeCheck = false;
	 }
	
	if(!completeCheck){
		event.preventDefault();
		return false;
	}
	
	
	
	
	
}