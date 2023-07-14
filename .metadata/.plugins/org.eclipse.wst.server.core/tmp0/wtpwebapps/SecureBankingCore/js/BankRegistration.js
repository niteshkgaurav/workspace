function validatePortalRegistration(event){
	var completeCheck=true;
	var bankName= $('#bankNameId').val().trim();
	
	var contactNumber= $('#contactId1').val().trim();
	
	var address=$('#addressIdDefault').val().trim();
	var description= $('#bankDescriptionId').val().trim();
	if(bankName==0){
		
		$('#div_bankNameId').addClass('has-error');
		 completeCheck=false;
		
	}
	
	if(description==0){
		$('#div_bankDescriptionId').addClass('has-error');
		 completeCheck=false;
	}
	
	if(contactNumber==0){
		$('#div_mobileNumber').addClass('has-error');
		 completeCheck=false;
	}
	
	if(address==0){
		$('#div_address').addClass('has-error');
		 completeCheck=false;
	}
	
	if(completeCheck==true)
	{
		
	return true;
	}
     if(completeCheck==false)
	{
	event.preventDefault();
	return false;
	}

	
	
	
	
	
}


function emptyerror11(id){
	$('#'+id).html("");
}


function validatePortalRegistrationEdit(){
	
	
	
	var bankName= $('#bankNameId').val().trim();
	var pinCode = $('#pinCode').val().trim(); 
	
	/*var firstName=$("#firstName").val().trim();
	if(bankName.length==0){
		$('#div_bankNameId').addClass('has-error');
		return false;
		
	}*/
	
	if(firstName.length==0)
		{
		$('#div_firstName').addClass('has-error');
		return false;
		}
	if(pinCode.length==0){
		$('#div_pinCode').addClass('has-error');
		return false;
	}
	
	if(pinCode.length!=6){
		$('#label_pinCode').hide();
		$('#lab_pinCodeErrorId').show();
		$('#lab_pinCodeErrorId').html("<font color='red'>Enter valid pincode</font>");
		$('#pinCode').val('');
		 return false;
	}
	
}



function fetchAddress(){
	$('#addressSelectTableId').html("");
	$('#addressErrorId').html("");
	$('#locality').val("");
	$('#region').val("");
	$('#district').val("");
	$('#state').val("");
	$('#country').val("");
	$('#buttonClickErrorId').html("");
	var pinCode = $('#pinCode').val().trim(); 
	if($('#pinCode').val().trim().length==0)
	{
		$("#div_pinCode").addClass('has-error');
		completeCheck =false;
return false;
	}
	 if((pinCode<=110000)||(pinCode>=855118)){
		$('#pinCode').val("");
		$('#lab_pinCodeErrorId').html("<font color='red'>Kindly enter valid PIN Code.</font>");
		$('#lab_pinCodeErrorId').show();
		return false;
	}


	/*if(pinCode.length>0){
		$('#pinCode').val("");
		$('#lab_pinCodeErrorId').show();
		$('#lab_pinCodeErrorId').html("<font color='red'>PIN Code should be 6 digit long.</font>");
		return false;
	}
	else{*/
		if(pinCode.length>0){
			$('#addressSelectTableId').show();
			$.ajax({
				url: "ajax/fetchAddress",
				dataType:'json',
				type: "POST",
				dataType: 'json',
				data: "pinCode="+pinCode,
				success:function(response){
					
					var addressData = response ;
					if(addressData.length>0){
						$('#addressSelectTableId').html("<tr><td align='center' width='100%' colspan='6'>Select Address</td></tr>");
						$('#addressSelectTableId').append("<tr><td align='center'><table border='2' width='100%'  cellspacing='1' cellpadding='0' class='tableMain'>");
						$('#addressSelectTableId').append("<tr><td width='10%'>Select</td><td width='25%'>Location</td><td width='15%'>PIN Code</td><td width='20%'>District</td><td width='15%'>State</td><td width='10%'>Country</td></tr>");
						for(var i=0;i<addressData.length;i++){
							$('#addressSelectTableId').append('<tr><td><input type="radio" id="addressSelectionId'+addressData[i].id+'" name="addressSelectionId" value='+addressData[i].id+' onchange="fillAddressDetail(\''+addressData[i].id+'\',\''+addressData[i].location+'\',\''+addressData[i].pincode+'\',\''+addressData[i].district+'\',\''+addressData[i].state+'\',\''+addressData[i].country+'\',\''+addressData[i].region+'\');"/></td><td>'+addressData[i].location+'</td><td>'+addressData[i].pincode+'</td><td>'+addressData[i].district+'</td><td>'+addressData[i].state+'</td><td>'+addressData[i].country+'</td></tr>');
						}
						$('#addressSelectTableId').append("</table></td></tr>");
						$("#pinCodeFlag").val("0");
					
						/*$('#addressSelectDivId').dialog({
							autoOpen: false,
							width: 525,
							height: 350,
							title: '\tSelect Address',
							  buttons: {
				                  OK: function() {$(this).dialog("close");}
				               },
						});*/
					}else{
						/*$('#manualPinCodeDiv').show();
						$('#fetchAddressDiv').hide();*/
						$("#addressSelectDivId").load(location.href + " #addressSelectDivId");
						//$('#addressFetchId').hide();
						$('#addressErrorId').html("<font color=red>Enter Valid Pincode to Fetch Address or Fill Address Manually</font>");
						$("#pinCodeFlag").val("1");
						
						$('#locality').attr('readonly', false);
						$('#district').attr('readonly', false);
						$('#region').attr('readonly', false);
						$('#state').attr('readonly', false);
						$('#country').attr('readonly', false);
						
					}
				}
			});	

		}
	}



function fillAddressDetail(id,location,pincode,district,state,country,region){
	
	if($('#addressSelectionId'+id).is(':checked')){
		
		$('#locality').attr('readonly', true).val(location);
		$('#pinCode').val(pincode);
		$('#region').attr('readonly', true).val(region);
		$('#district').attr('readonly', true).val(district);
		$('#state').attr('readonly', true).val(state);
		$('#country').attr('readonly', true).val(country);
		$('#pinaddressId').attr('readonly', true).val(id);
		$('#label_locality').addClass("valid");
		$('#label_region').addClass("valid");
		$('#label_district').addClass("valid");
		$('#label_state').addClass("valid");
		$('#label_country').addClass("valid");
		removeHasError('div_pinCode');
		removeHasError('div_country');
		removeHasError('div_state');
		removeHasError('div_district');
		removeHasError('div_locality');
		removeHasError('div_region');
		
	}
	$('#addressSelectTableId').hide();
}

function forEdit(bankName,bankShortName){
}

function checkDuplicateBankName()
{
	
	var  bankid=$("#hiddenId").val();
	
	var bankName= $("#bankNameId").val().trim();
	
	if(bankName.length>0){
	$.ajax({
		url: 'ajax/checkDuplicateBankName',
		type:'POST',
		data:'bankName='+bankName+'&bankid='+bankid,
		success:function(response)
		{
			
			if(response==0)
			{
				  $('#bankNameErrorId').show();
			      $('#label_bankNameId').hide();
			     $('#bankNameErrorId').html("<font color='red'>Bank name Already Exist</font>");

			     $("#bankNameId").val('');
				
			}
			if(response==1)
			{
				
				
				 $('#bankNameErrorId').addClass("valid");
			     $('#bankNameErrorId').show();
			     
			      $('#label_bankNameId').hide();
			     $('#bankNameErrorId').html("<font color='green'>Company name available.</font>");
			}
		}
	});
	
	
	}
}

function toggleform(id)
{
	$('#msgId').html('');	
$("#"+id).toggle("slow",function(){
	
  
});

}

function showAddressTable()
{
	
$('#addMoreTableId').toggle();


}


function emailValidation(sEmail,errorId,msg)
{
	var sEmailVal=$.trim($("#"+sEmail).val());
	//var asciiValue = event.which || event.keycode;
    //asciiValue = eval(asciiValue);
	 var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if (reg.test(sEmailVal)){
		 emptyerror(event,errorId,msg);
	 return true; 
	}
	 else{
		 $('#'+errorId).show();
		 $('#'+errorId).html("<font color='red'> Not a valid Email-id</font>");
		 $('#'+sEmail).val('');
		 event.preventDefault();
	 return false;
	 } 
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
	 
	}
	
	
}
function refresh(id){
	$("#"+id).html("");
}
function changeValues(){
	$('#locality').val('');
	$('#district').val('');
	$('#region').val('');
	$('#state').val('');
	$('#country').val('');

	return false;
}

function checkEmail() {

    var email = document.getElementById('emailId');
  // var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var filter = /^([a-zA-Z0-9_\.\-])+\@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!filter.test(email.value.trim())) {
    $('#div_emailId').addClass('has-error');
    $('#emailId').val('Please enter valid Email Id');
    email.focus;
    return false;
 }

}
function clr(){
	 $('#emailId').val(' ');
	
}
function validateCreatebank(event){
	var check=true;
	var bankName= $('#bankNameId').val().trim();
	
	var contactNumber= $('#mobileNumber').val().trim();
	var address=$('#addressIdDefault').val().trim();
	var description= $('#bankDescriptionId').val().trim();
	var pinCode=$("#pinCode").val().trim();
	var locality=$("#locality").val().trim();
	var region=$("#region").val().trim();
	var district=$("#district").val().trim();
	var state=$("#state").val().trim();
	var country=$("#country").val().trim();
	/*var email=$("#emailId").val().trim();
	if(email==0){
		$('#div_emailId').addClass('has-error');
		check=false;
	}*/
	if(bankName.length==0){
		$('#div_bankNameId').addClass('has-error');
		check=false;
	}
	if(description.length<100){
		$('#div_bankDescriptionId').addClass('has-error');
		$("#bankDescriptionErrorId").text("Bank Description field length should be 100 at least.");
		showError("bankDescriptionErrorId","label_bankDescriptionId");
		check=false;
	}
	if(contactNumber.length==0 || contactNumber.length<10 || contactNumber.length>12){
		$('#div_mobileNumber').addClass('has-error');
		check=false;
	}
	
	if(address.length==0){
		$('#div_address').addClass('has-error');
		check=false;
	}
	if(pinCode.length==0){
		$('#div_pinCode').addClass('has-error');
		check=false;
	}
	/*if(pinCode.length!=6){
		$('#addressErrorId').html("<font color=red>Length of Pin Code should be 6</font>");
		 completeCheck=false;
	}*/
	if(district.length==0){
		$("#div_district").addClass('has-error');
		document.getElementById("label_district").style.color="red"
			check=false;
	}
	
	
	
	if(locality.length==0){
		$('#div_locality').addClass('has-error');
		document.getElementById("label_locality").style.color="red"
			check=false;
	}
	if(region.length==0){
		$('#div_region').addClass('has-error');
		document.getElementById("label_region").style.color="red"
			check=false;
	}
	/*
	if(district==0){
		$('#div_district').addClass('has-error');
		 completeCheck=false;
	}*/
	if(state.length==0){
		$('#div_state').addClass('has-error');
		document.getElementById("label_state").style.color="red"
			check=false;
	}
	if(country.length==0){
		$('#div_country').addClass('has-error');
		document.getElementById("label_country").style.color="red"
			check=false;
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	return check;
		
}

function showError(errorId,labelId){
	$("#"+errorId).removeClass("collapse");
	$("#"+errorId).addClass("valid");
	$("#"+labelId).removeClass("valid");
	$("#"+labelId).addClass("collapse");
	$("#errorId").text("");
};

function hideError(errorId,labelId){
	$("#"+labelId).removeClass("collapse");
	$("#"+labelId).addClass("valid");
	$("#"+errorId).removeClass("valid");
	$("#"+errorId).addClass("collapse");
};