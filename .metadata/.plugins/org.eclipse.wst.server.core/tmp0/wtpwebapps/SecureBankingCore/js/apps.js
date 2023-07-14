function validateCreateApps(event){

	var check=true;
	var apName=$('#apName').val().trim();
	if(apName.length==0){
		$('#appNamestyled-input').addClass('has-error');
		check=false;
	}
	
	var appDesc=$('#appDesc').val().trim();
	if(appDesc.length==0){
		$('#appDescstyled-input').addClass('has-error');
		check=false;
	}
		 var statusId=$('#statusId').val().trim();
		 if(statusId.length==0){
			 document.getElementById("statId").style.color = "red";
			 $('#statusDiv').addClass('has-error');
			 check=false;
		 }
	
	var productId=$('#productId').val().trim();
	if(productId.length==0)
    {
		document.getElementById("prodId").style.color = "red";
        $('#productDiv').addClass('has-error');
        check=false;
    }
	var amount=$('#appAmount').val().trim();
	if(amount.length==0)
    {
        $('#appAmountStyled-input').addClass('has-error');
        check=false;
    }

	var startDate =$('#startDate').val().trim();
	if(startDate.length == 0){
		$('#divID_start_date').addClass("has-error");
		check = false;
	}
	var endDate =$('#endDate').val().trim().trim();
	if(endDate.length == 0){
		$('#toDate_divID').addClass("has-error");
		check = false;
	}
	
	
	
	if(endDate.length != 0 && startDate.length != 0){
	if(Date.parse(endDate)<Date.parse(startDate)){
		$('#toDate_divID').addClass("has-error");
		$('#endDate').val('');
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		check = false;
	}
	 var toDate = new Date();
	 toDate.setHours(0,0,0,0);
	    if (Date.parse(endDate)< Date.parse(toDate)) {
	    	$('#toDate_divID').addClass("has-error");
	    	$('#endDate').val('');
			$('#endDateId').hide();
			$('#endDateErrorId').show();
			$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than or equal to current date</font>');
			check = false;
	    }
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	return check;
} 
function refresh(successMessageId){
	$('#'+successMessageId).html('');
}
function selct(label_payCardApp){
	$("#"+label_payCardApp).addClass('valid');	
}

function toggleform(id)
{
	$('#msgId').html('');
$("#"+id).toggle("slow",function(){
	
  /*
   * 
   */
});

}
function removeClass(label,id)
{	var idd=$("#"+id).val();
			if(idd.length==0)
			{	$("#"+label).removeClass("valid");}
		
		
}
function onlyNumeric(id,errorId,labelid){
	  $('#'+errorId).html('');
	  $('#'+labelid).show();
	 var str=$('#'+id).val().trim();
	 if(str.length!=0){
	 for(var i=0;i<str.length;i++){
	   var asciiValue=str.charCodeAt(i);
	   if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
	    
	    $('#'+id).val('');
	    $('#'+errorId).html('<font color="red">Only Numeric are allowed</font>');
	    $('#'+labelid).hide();
	    $('#'+errorId).show();
	   
	    event.preventDefault();
	    return false;
	   }
	 }
	 }}
	 

function validateCreateWallet(event){
	var check=true;
	var walletTypeName=$('#walletTypeName').val().trim();
	if(walletTypeName.length==0){
		$('#walletNamestyled-input').addClass('has-error');
		check=false;
	}
	
	var walletTypeDesc=$('#walletTypeDesc').val().trim();
	if(walletTypeDesc.length==0){
		$('#walletDescstyled-input').addClass('has-error');
		check=false;
	}
	
	var statusId=$('#statusId').val().trim();
	if(statusId.length==0)
    {
		document.getElementById("statId").style.color = "red";
		$('#statId').removeClass('');
        $('#statusDiv').addClass('has-error');
        check=false;
    }
	var amount=$('#walletTypeAmount').val().trim();
	if(amount.length==0)
    {
        $('#walletAmountstyled-input').addClass('has-error');
        check=false;
    }
	var startDate =$('#startDate').val().trim();
	if(startDate.length == 0){
		$('#divID_start_date').addClass("has-error");
		check = false;
	}
	var endDate =$('#endDate').val().trim();
	if(endDate.length == 0){
		$('#toDate_divID').addClass("has-error");
		check = false;
	}
	
	if(endDate.length != 0 && startDate.length != 0){
	if(Date.parse(endDate)<Date.parse(startDate)){
		$('#toDate_divID').addClass("has-error");
		$('#endDate').val('');
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		check = false;
	}
	 var toDate = new Date();
	 toDate.setHours(0,0,0,0);
	    if (Date.parse(endDate)< Date.parse(toDate)) {
	    	$('#toDate_divID').addClass("has-error");
	    	$('#endDate').val('');
			$('#endDateId').hide();
			$('#endDateErrorId').show();
			$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than or equal to current date</font>');
			check = false;
	    }
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	return check;
} 
function validateCreatePartner(event){
	var check=true;
	var partnerName=$('#partnerName').val().trim();
	if(partnerName.length==0){
		$('#partnerNamestyled-input').addClass('has-error');
		check=false;
	}
	
	var partnerDescription=$('#partnerDescription').val().trim();
	if(partnerDescription.length==0){
		$('#partnerDescstyled-input').addClass('has-error');
		check=false;
	}
	var status=$('#status').val().trim();
	if(status.length==0)
    {
		document.getElementById("statId").style.color = "red";
        $('#statusDiv').addClass('has-error');
        check=false;
    }
	var appId=$('#appId').val().trim();
	if(appId.length==0)
    {
		document.getElementById("lab_appId").style.color = "red";
        $('#appDiv').addClass('has-error');
    }
	
	var startDate =$('#startDate').val().trim();
	if(startDate.length == 0){
		$('#divID_start_date').addClass("has-error");
		check = false;
	}
	var endDate =$('#endDate').val().trim();
	if(endDate.length == 0){
		$('#toDate_divID').addClass("has-error");
		check = false;
	}
	if(endDate.length != 0 && startDate.length != 0){
	if(Date.parse(endDate)<Date.parse(startDate)){
		$('#toDate_divID').addClass("has-error");
		$('#endDate').val('');
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		
		check = false;
	}
	 var toDate = new Date();
	 toDate.setHours(0,0,0,0);
	    if (Date.parse(endDate)< toDate) {
	    	$('#toDate_divID').addClass("has-error");
	    	$('#endDate').val('');
			$('#endDateId').hide();
			$('#endDateErrorId').show();
			$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than or equal to current date</font>');
			check = false;
	}
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	return check;
}
	function getBalance(currentId,hid,did,sdid){
		$("#"+hid).val('');
		$("#"+did).val('');
		$("#"+sdid).val('');
		var value=$("#"+currentId.id).val();
		if(value.length>0){
			$("#amount").show();
			$("#commentId").show();
			$("#reference").show();
			$.ajax({
				type:"POST",
				dataType:"json",
				url :'/securebanking/AdminUI/walletManagement/ajax/getBalance',
				data :'accntId='+value,
				success:function(response)
				{
				
					$("#walletBalance").val(response);
					$("#balance").show();
				},
				error: function(){
					return false;
					}
			});
		
		
		}else{
			$("#commentId").hide();
			$("#reference").hide();
			$("#balance").hide();
			$("#amount").hide();	
		}

	}
	
	
	
	function validateTopUp(event){
	
		var comment=$('#comment').val().trim();
		var amount=$('#amount').val().trim();
		if(comment.length==0){
			$('#commDiv').addClass('has-error');
			check=false;
		}
		if(amount.length==0){
			$('#amountDiv').addClass('has-error');
			check=false;
		}
		if(!check){
			event.preventDefault();
			return false;
		}
		
	}
