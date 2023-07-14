function formValidate(event){
var check=true;
	
	var stationName=$('#stationName').val().trim();
	if(stationName.length==0){
		$('#div_stationName').addClass('has-error');
				
				check = false;
			}
	var stnShortName=$('#stnShortName').val().trim();
	if(stnShortName.length==0){
		$('#div_stnShortName').addClass('has-error');
				
				check = false;
			}
	var stnLat=$('#stnLat').val().trim();
	if(stnLat.length==0){
		$('#div_stnLat').addClass('has-error');
				
				check = false;
			}
	var stnLong=$('#stnLong').val().trim();
	if(stnLong.length==0){
		$('#div_stnLong').addClass('has-error');
				
				check = false;
			}
	var depotId=$('#depotId').val().trim();
	if(depotId==""){
		$('#div_depotId').addClass('has-error');
				
				check = false;
			}
	
	if(!check){
		event.preventDefault();
	}
}