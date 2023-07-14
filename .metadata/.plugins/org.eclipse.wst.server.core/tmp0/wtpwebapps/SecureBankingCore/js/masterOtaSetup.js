function checkMasterData(e){
	$('#statusmsg').empty();
	var desc = $('#desc').val();
	var protocol = $('#protocol').val();
	var dcs = $('#dcs').val();
	var udh = $('#udh').val();
	if(desc == "" || protocol == "" || dcs == "" || udh == "" ) {
		$('#infomsg').text("Please fill the form");
		e.preventDefault();
		return false;
	}
	return true;
}

function checkOTAData(e){
	$('#statusmsg').empty();
	var destinationAdd = $('#destinationAdd').val();
	var sourceAdd = $('#sourceAdd').val();
	if(destinationAdd == "" || sourceAdd == "") {
		$('#infomsg').text("Please fill the mandatory fields");
		e.preventDefault();
		return false;
	}
	return true;
}

function setupconf() {
	$('#masterConfFormId').hide();
	$('#smsOtaConfFormId').hide();
}

function fillMaster(obj) {
	if(obj.value == 0) {
		$('#masterConfFormId').hide();
		return false;
	}
	$.ajax({
		url: '/securebanking/AdminUI/otaservice/ajax/mastersetupbyid',
		type:'GET',
		contentType: "application/json",
        dataType: "json",
		data:'id='+obj.value,
		success: function(response) {
			$('#protocolr').val(response.protocol);
			$('#dcsr').val(response.dcs);
			$('#udhr').val(response.udh);
			$('#masterConfFormId').show();
        },
        error: function(response) {
            console.log(response);
        }
	});
}

function fillSMS(obj) {
	if(obj.value == 0) {
		$('#smsOtaConfFormId').hide();
		return false;
	}

	$.ajax({
		url: '/securebanking/AdminUI/otaservice/ajax/otasmssetupbyid',
		type:'GET',
		contentType: "application/json",
        dataType: "json",
		data:'id='+obj.value,
		success: function(response) {
			$('#svctyper').val(response.serviceType);
			$('#sourceaddtonr').val(response.sourceAddTon);
			$('#sourceaddnpir').val(response.sourceAddNpi);
			$('#sourceAddr').val(response.sourceAdd);
			$('#destinationAddTonr').val(response.destinationAddTon);
			$('#destinationAddNpir').val(response.destinationAddNpi);
			$('#esmClassr').val(response.esmClass);
			$('#priorityFlagr').val(response.priorityFlag);
			$('#scheduleDeliveryTimer').val(response.scheduleDeliveryTime);
			$('#validityPeriodr').val(response.validityPeriod);
			$('#registeredDeliveryr').val(response.registeredDelivery);
			$('#replaceIfPresentFlagr').val(response.replaceIfPresentFlag);
			$('#smDefaultMsgIdr').val(response.smDefaultMsgId);

			$('#smsOtaConfFormId').show();
        },
        error: function(response) {
            console.log(response);
        }
	});
}

function checkOTASetup(e) {
	var desc = $("#desc").val();
	var mSelect = $("#masterSelect option:selected").val();
	var otaSelect = $("#OTASmsSelect option:selected").val();
	
	if(mSelect == 0 || otaSelect == 0 || desc == "") {
		$('#infomsg').text("Please fill description, select Master Setup and OTA Sms Setup");
		setTimeout(function(){
			$('#infomsg').empty();
		}, 4000);		
	} else {
			$.ajax({
			url: '/securebanking/AdminUI/otaservice/ajax/sotaConfig',
			contentType: "application/json",
	        dataType: "json",
			data:'desc='+desc+'&mSelect='+mSelect+'&otaSelect='+otaSelect,
			success: function(response) {
				$('#otaForm').submit();
			},
	        error: function(response) {
	    		$('#infomsg').text("Failed to submit, please try again!!");
	            console.log(response);
	        }
		});
	}
}