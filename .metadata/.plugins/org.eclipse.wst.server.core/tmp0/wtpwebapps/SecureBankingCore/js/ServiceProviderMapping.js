var final=0;
var check=true;
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
	}
}

function removemsg(errorId) {	
	$('#'+errorId).html("");
}

function validateProviderCode() {
	
	return true;
}

function saveProviderMapping() {	
	var providerMap = [];
	var hsvId = document.getElementById("hostSubversionSelect").value; 
	$('#table_id tr').each(function() {
	    var providerCode = parseInt($(this).find(".providerCode input").val());
	    var providerId = parseInt($(this).find(".providerId input").val());
	    var mappingId = parseInt($(this).find(".mappingId input").val());
	    var providerStatus = parseInt($(this).find(".providerStatus input").val());
	    console.log("providerCode "+providerCode+" providerId "+providerId+" mappingId "+mappingId);
	    if(providerId) {
	    	providerMap.push({
	    		mappingId: mappingId, 
	    		providerId: providerId, 
	    		thirdPartyBillerCode: providerCode, 
	    		status: providerStatus, 
	    		hsvId: hsvId
	    	});
	    }
	});

	if(validateProviderCode()) {
		$.ajax({
			url: 'ajax/providerMappingThirdPartyUpdate',
			contentType: "application/json",
			type:'POST',
			data: JSON.stringify(providerMap),
			success:function(response) {
				if(response.success=="true"){
					document.getElementById('providerMappingForm').submit();
				}else {
					$('#msgErrorP').text(response.msg);
					setTimeout(function(){
						$('#msgErrorP').text("");
					}, 3000);
				}
			}
		});
	}
}