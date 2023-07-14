function validateForm(event){
	var check=true;
	
	var penaltyCode=$('#penaltyCode').val().trim();
	if(penaltyCode.length==0){
		$('#div_penaltyCode').addClass('has-error');
				
				check = false;
			}
	
	var penaltyName=$('#penaltyName').val().trim();
	if(penaltyName.length==0){
$('#div_penaltyName').addClass('has-error');
		
		check = false;
	}
	
	var penaltyType=$('#penaltyType').val().trim();
	if(penaltyType.length==0 && penaltyType.length<=10){
		
		$('#divPenaltyType').addClass('has-error');
				
				check = false;
			}
	
	var penaltyAmount=$('#penaltyAmount').val().trim();
	if(penaltyAmount.length==0){
		$('#div_penaltyAmountt').addClass('has-error');
				
				check = false;
			}
			
	if(!check){
		event.preventDefault();
	}
			
}



