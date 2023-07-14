function validateForm(event){
	var check=true;
	var freightCode=$('#freightCode').val().trim();
	if (freightCode.length == 0) {
		
		$('#div_freightCode').addClass('has-error');
		check=false;
		}
	
	var freightDesc=$('#freightDesc').val().trim();
if (freightDesc.length == 0) {
		
		$('#div_freightDesc').addClass('has-error');
		check=false;
		}

var freightChargeBy=$('#freightChargeBy').val().trim();
if (freightChargeBy.length == 0) {
	
	$('#div_freightChargeBy').addClass('has-error');
	check=false;
	}


var freightChargeType=$('#freightChargeType').val().trim();
if (freightChargeType.length == 0) {
	
	$('#divFreightChargeType').addClass('has-error');
	check=false;
	}

var freightChargeOn=$('#freightChargeOn').val().trim();
if (freightChargeOn.length == 0) {
	
	$('#div_freightChargeOn').addClass('has-error');
	check=false;
	}

var freightChargeFix=$('#freightChargeFix').val().trim();
if (freightChargeFix.length == 0) {
	
	$('#freightChargeTkt').addClass('has-error');
	check=false;
	}

var freightWeightMin=$('#freightWeightMin1').val().trim();
if (freightWeightMin.length == 0) {
	
	$('#freightWeightMin').addClass('has-error');
	check=false;
	}

var freightWeightMax=$('#freightWeightMax1').val().trim();
if (freightWeightMax.length == 0) {
	
	$('#freightWeightMax').addClass('has-error');
	check=false;
	}

var freightDistanceMin=$('#freightDistanceMin1').val().trim();
if (freightDistanceMin.length == 0) {
	
	$('#freightDistanceMin').addClass('has-error');
	check=false;
	}

var freightDistanceMax=$('#freightDistanceMax1').val().trim();
if (freightDistanceMax.length == 0) {
	
	$('#freightDistanceMax').addClass('has-error');
	check=false;
	}

if(!check){
	event.preventDefault();
}
}