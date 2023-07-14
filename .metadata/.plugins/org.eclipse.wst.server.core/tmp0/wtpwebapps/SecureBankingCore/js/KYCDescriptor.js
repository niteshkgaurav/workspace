var pid=0;
var kycPreviousName=null;
function populateForEdit(id,kycName,kycDescription,subscriberType,weightage,dailyCreditLimit,dailyDebitLimit,dailyTxnCount,monthlyCreditLimit,monthlyDebitLimit,monthlyTxnCount,yearlyCreditLimit,yearlyDebitLimit,yearlyTxnCount)
{ 
	pid=id;
	
	$('#label_kycName').addClass('valid');
	$('#label_kycDescription').addClass('valid');
	$('#label_subscriberType').addClass('valid');
	$('#label_kycWeight').addClass('valid');
	$('#label_dailyDebitLimit').addClass('valid');
	$('#label_dailyCreditLimit').addClass('valid');
	$('#label_dailyTxnCount').addClass('valid');
	$('#label_monthlyDebitLimit').addClass('valid');
	$('#label_monthlyCreditLimit').addClass('valid');
	$('#label_monthlyTxnCount').addClass('valid');
	$('#label_yearlyDebitLimit').addClass('valid');
	$('#label_yearlyCreditLimit').addClass('valid');
	$('#label_yearlyTxnCount').addClass('valid');
	removeHasError('div_kycName');
	removeHasError('div_kycDescription');
	removeHasError('div_subscriberType');
	removeHasError('div_kycWeight');
	removeHasError('div_dailyDebitLimit');
	removeHasError('div_dailyCreditLimit');
	removeHasError('div_dailyTxnCount');
	removeHasError('div_monthlyDebitLimit');
	removeHasError('div_monthlyCreditLimit');
	removeHasError('div_monthlyTxnCount');
	removeHasError('div_yearlyDebitLimit');
	removeHasError('div_yearlyCreditLimit');
	removeHasError('div_yearlyTxnCount');
	$('#kycDescId').val(id);
	$('#kycName').val(kycName);
	$('#kycDescription').val(kycDescription);
	$('#subscriberType').val(subscriberType);
	$('#kycWeight').val(weightage);
	$('#dailyDebitLimit').val(dailyDebitLimit);
	$('#dailyCreditLimit').val(dailyCreditLimit);
	$('#dailyTransactionCount').val(dailyTxnCount);
	$('#monthlyDebitLimit').val(monthlyDebitLimit);
	$('#monthlyCreditLimit').val(monthlyCreditLimit);
	$('#monthlyTransactionCount').val(monthlyTxnCount);
	$('#yearlyDebitLimit').val(yearlyDebitLimit);
	$('#yearlyCreditLimit').val(yearlyCreditLimit);
	$('#yearlyTransactionCount').val(yearlyTxnCount);
	/*$('#kycLevel').val(kycLevel);
	$('#maxBalance').val(maxBalance);
	$('#perTxnLimit').val(perTxnLimit);
	$('#dailyTxnLimit').val(dailyTxnLimit);
	$('#monthlyTxnLimit').val(monthlyTxnLimit);*/
	$('#successMessageId').html('');
	$('#errorMessageId').html('');
	$('#lab_maxBalanceErrorId').html('');
	$('#lab_perTxnLimitErrorId').html('');
	$('#lab_dailyTxnLimitErrorId').html('');
	$('#lab_monthlyTxnLimitErrorId').html('');
	$('#lab_NameErrorId').html('');
	$('#lab_kycDescripionErrorId').html('');
	$('#lab_levelErrorId').html('');
	$('#submitBtn').attr('value','Update');
	kycPreviousName=$('#kycName').val();
}

function valid()
{}


function checkUniqueKycName()
{
	
	var kycNewName=$('#kycName').val().trim();
	
	if(kycNewName.length!=0){
		if(kycNewName!=kycPreviousName){
	$.ajax({
		url:"ajax/checkUniqueKycName",
		type:"POST",
		data:"kycName="+kycNewName+'&pid='+pid,
		success:function(response){
//			console.log(response);
			
			if(response == 1){
				$('#kycName').show();
				$('#label_kycName').html('<font color="red">KYC Name Already Used</font>');	
				$('#kycName').val('');
			}
			if(response == 0){
				
				$('#kycName').show();
				$('#label_kycName').html('<font color="green"><b>Name Available</font>');	
				
				
				
			}
		}
	});
	}
	}
}

function validateKycLevel()
{
	var kycLevel = $('#kycLevel').val();
	var kycDescId = $('#kycDescId').val();
	$.ajax({
		url:"ajax/checkUniqueKycLevel",
		type:"POST",
		data:"kycLevel="+kycLevel+"&kycDescId="+kycDescId,
		success:function(response){
			console.log(response);
			if(response==true)
			{
				console.log(response);
				$('#kycLevel').val(0);
				$('#div_kycLevel').addClass('has-error');
				
				/*$('#label_kycLevel').hide();
				$('#lab_levelErrorId').show();
				$('#lab_levelErrorId').html('<font color="red">KYC Level already used.</font>');*/
			}
			
		}
	});
}

function validateKycDescriptor(event){
	var flag = true;
	var kycName = $('#kycName').val().trim();
	var kycDescription = $('#kycDescription').val().trim();
	var subscriberType = $('#subscriberType').val();     
	var kycWeight = $('#kycWeight').val();
	var dailyDebitLimit = $('#dailyDebitLimit').val();
	var dailyCreditLimit = $('#dailyCreditLimit').val();
	var dailyTransactionCount = $('#dailyTransactionCount').val();
	var monthlyDebitLimit = $('#monthlyDebitLimit').val();
	var monthlyCreditLimit = $('#monthlyCreditLimit').val().trim();
	var monthlyTransactionCount = $('#monthlyTransactionCount').val().trim();
	var yearlyDebitLimit = $('#yearlyDebitLimit').val().trim();
	var yearlyCreditLimit = $('#yearlyCreditLimit').val().trim();
	var yearlyTransactionCount = $('#yearlyTransactionCount').val().trim();
	if(kycName.length==0){
		$('#div_kycName').addClass('has-error');
		flag = false;
	}
	if(kycDescription.length==0){
		$('#div_kycDescription').addClass('has-error');
		flag = false;
	}
	if(subscriberType == 0){
		$('#div_subscriberType').addClass('has-error');
		flag = false;
	}
	if(kycWeight.length==0){
		$('#div_kycWeight').addClass('has-error');
		flag = false;
	}
	if(dailyDebitLimit.length==0){
		$('#div_dailyDebitLimit').addClass('has-error');
		flag = false;
	}
	if(dailyCreditLimit.length==0){
		$('#div_dailyCreditLimit').addClass('has-error');
		flag = false;
	}
	if(dailyTransactionCount.length==0){
		$('#div_dailyTxnCount').addClass('has-error');
		flag = false;
	}
	if(monthlyDebitLimit.length==0){
		$('#div_monthlyDebitLimit').addClass('has-error');
		flag = false;
	}
	if(monthlyCreditLimit.length==0){
		$('#div_monthlyCreditLimit').addClass('has-error');
		flag = false;
	}
	if(monthlyTransactionCount.length==0){
		$('#div_monthlyTxnCount').addClass('has-error');
		flag = false;
	}
	if(yearlyDebitLimit.length==0){
		$('#div_yearlyDebitLimit').addClass('has-error');
		flag = false;
	}
	if(yearlyCreditLimit.length==0){
		$('#div_yearlyCreditLimit').addClass('has-error');
		flag = false;
	}
	if(yearlyTransactionCount.length==0){
		$('#div_yearlyTxnCount').addClass('has-error');
		flag = false;
	}
	if(dailyDebitLimit.length!=0 && monthlyDebitLimit.length!=0){
		if(eval(monthlyDebitLimit)<eval(dailyDebitLimit)){
			$('#div_monthlyDebitLimit').addClass('has-error');
			$('#label_monthlyDebitLimit').hide();
			$('#lab_monthlyDebitLimitErrorId').show();
			$('#monthlyDebitLimit').val('');
			$('#lab_monthlyDebitLimitErrorId').html('<font color="red">Monthly Debit Limit should be greater than Daily Debit Limit</font>');
			flag = false;
		}
		
		if(monthlyDebitLimit.length!=0 && yearlyDebitLimit.length!=0){
			if(eval(monthlyDebitLimit)>eval(yearlyDebitLimit)){
				$('#div_yearlyDebitLimit').addClass('has-error');
				$('#label_yearlyDebitLimit').hide();
				$('#lab_yearlyDebitLimitErrorId').show();
				$('#yearlyDebitLimit').val('');
				$('#lab_yearlyDebitLimitErrorId').html('<font color="red">Yearly Debit Limit should be greater than Monthly Debit Limit</font>');
				flag = false;
			}
	}
		}
	
	if(dailyCreditLimit.length!=0 && monthlyCreditLimit.length!=0){
		if(eval(monthlyCreditLimit)<eval(dailyCreditLimit)){
			$('#div_monthlyCreditLimit').addClass('has-error');
			$('#label_monthlyCreditLimit').hide();
			$('#lab_monthlyCreditLimitErrorId').show();
			$('#monthlyCreditLimit').val('');
			$('#lab_monthlyCreditLimitErrorId').html('<font color="red">Monthly Credit Limit should be greater than Daily Credit Limit</font>');
			flag = false;
		}
		
		if(monthlyCreditLimit.length!=0 && yearlyCreditLimit.length!=0){
			if(eval(monthlyCreditLimit)>eval(yearlyCreditLimit)){
				$('#div_yearlyCreditLimit').addClass('has-error');
				$('#label_yearlyCreditLimit').hide();
				$('#lab_yearlyCreditLimitErrorId').show();
				$('#yearlyCreditLimit').val('');
				$('#lab_yearlyCreditLimitErrorId').html('<font color="red">Yearly Credit Limit should be greater than Monthly Credit Limit</font>');
				flag = false;
			}
	}
		}
	
	if(dailyTransactionCount.length!=0 && monthlyTransactionCount.length!=0){
		if(eval(monthlyTransactionCount)<eval(dailyTransactionCount)){
			$('#div_monthlyTxnCount').addClass('has-error');
			$('#label_monthlyTxnCount').hide();
			$('#lab_monthlyTxnCountErrorId').show();
			$('#monthlyTransactionCount').val('');
			$('#lab_monthlyTxnCountErrorId').html('<font color="red">Monthly Transactions should be greater than Daily Transactions</font>');
			flag = false;
		}
		
		if(monthlyTransactionCount.length!=0 && yearlyTransactionCount.length!=0){
			if(eval(monthlyTransactionCount)>eval(yearlyTransactionCount)){
				$('#div_yearlyTxnCount').addClass('has-error');
				$('#label_yearlyTxnCount').hide();
				$('#lab_yearlyTxnCountErrorId').show();
				$('#yearlyTransactionCount').val('');
				$('#lab_yearlyTxnCountErrorId').html('<font color="red">Yearly Transactions should be greater than Monthly Transactions</font>');
				flag = false;
			}
	}
		}
	
	if(!flag){
		event.preventDefault();
		return false;
	}
}





function checkUniqueWeightage()
{
	 var kycWeight = $("#kycWeight option:selected"). val();
	 var subscriberType = $("#subscriberType option:selected"). val();
	//var Weightage=$('#kycName').val().trim();
	$.ajax({
		url:"ajax/checkUniqueWeightagelevel",
		type:"POST",
		async:false,
		data:"kycWeight="+kycWeight+'&subscriberType='+subscriberType,
		success:function(response){
			if(response == false)
				{
				alert("Already Mapped");
				$("#kycWeight").val($("#kycWeight option:first").val());
				}
			}
	});
	}
	

