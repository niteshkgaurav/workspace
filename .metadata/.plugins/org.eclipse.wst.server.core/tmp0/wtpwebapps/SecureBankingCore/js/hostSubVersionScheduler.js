function selct(label_payCardApp){
	$("#"+label_payCardApp).addClass('valid');	
}
function clearErrorMsg(id){
	$("#"+id).html('');	
}

function enableDateandStatus(checkboxid,dateId,statusId){
	if($('#'+checkboxid).is(':checked')){
		//empty
	}
	else{
		$('#'+dateId).val('');
	}
	
	($('#'+checkboxid).is(':checked')) ? $('#'+dateId).removeAttr("disabled") : $('#'+dateId).attr("disabled", "disabled");
	
	($('#'+checkboxid).is(':checked')) ? $('#'+statusId).removeAttr("disabled") : $('#'+statusId).attr("disabled", "disabled");
}
function validateform(event){
	
	var check=true;
	var checkedvalues=[];
	var date=[];
	$(".providercheckBox:checked").each(function() {
		checkedvalues.push($(this).val());
	});
    var length = checkedvalues.length;
    for (var i=0; i<length; i++) {
    	 date=checkedvalues[i];
    	var res = date.split("#");
    	var val="";
    	for(var j=0;j<res.length;j++){
    		val=val+res[j];
    	}
    	if($('#providersDate'+val).val()===""){
    		$('#datetd'+val).html('<font color="red" size="2"> Kindly Select Date</font>');
    		check=false;
			
		}
    	
		
    }
    
    var checkedWalletvalues=[];
	var walletdates=[];
	$(".walletcheckBox:checked").each(function() {
		checkedWalletvalues.push($(this).val());
	});
    var walletlength = checkedWalletvalues.length;
    for (var i=0; i<walletlength; i++) {
    	walletdates=checkedWalletvalues[i];
    	
    	if($('#walletDate'+walletdates).val()===""){
    		$('#walletdatetd'+walletdates).html('<font color="red" size="2"> Kindly Select Date</font>');
    		check=false;
			
		}
    	
		
    }
    
    var checkedServievalues=[];
	var servicedates=[];
	$(".servicescheckBox:checked").each(function() {
		checkedServievalues.push($(this).val());
	});
    var servicelength = checkedServievalues.length;
    for (var i=0; i<servicelength; i++) {
    	servicedates=checkedServievalues[i];
    	
    	if($('#serviceDate'+servicedates).val()===""){
    		$('#serviceDatetd'+servicedates).html('<font color="red" size="2"> Kindly Select Date</font>');
    		check=false;
			
		}
    	
		
    }
    
    
    if(check==false){
		event.preventDefault();	
		return false;
	}
	
	
	
}	