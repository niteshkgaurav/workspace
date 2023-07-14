/*
 * SubsRegistration.js
 * Written by Ram Kumar
 */

$(document).ready(function(){
	 $("#issueToId").change(function() {
		    var id = $(this);
		    $("#msgId").html("");
	    	$("#errMsgId").html("");
		    if(id.val()=='AGENT'){
		    	$("#agentMobRowId").show();
		    	$("#custMobRowId").hide();
		    	getAgentUserMobile();
		    }
		    else if(id.val()=='CUSTOMER'){
		    	$("#agentMobRowId").hide();
		    	$("#custMobRowId").show();
		    	
		    	resetField();
		    }
		    else{
		    	$("#agentMobRowId").hide();
		    	$("#custMobRowId").hide();
		    	
		    	resetField();
		    }
	 });
	  
	 $("#mobileId").change(function() {
		    var id = $(this).val();
		    if(id!=''){
		    	 getAgentUserDetail(id);
		    }
		    else{
		    	resetField();
		    }
		   
	 });
	 
	 
	 $("#mvId").change(function() {
		    var mvId = $(this).val();
		    if(mvId!=''){
		    	 getHostSubVersion(mvId)
		    }
		    else{
		    	$('#hsvId').find('option').not(':first').remove();
		    }
	 });
	 
	 
	 
	 $("#productId").change(function() {
		    var pId = $(this).val();
		    var mvId = $("#mvId").val();
		    getSerialNumber(pId,mvId);
		    
	 });
	 
	
});


function getSerialNumber(pId,mvId){
	$.ajax({
		type: "post",
		url: 'ajax/getSerialNumber',
		data:'mvId='+mvId+'&pId='+pId,
		dataType: "json",
		success: function(response){
			var serialNumberMap=response.serialNumberMap;
			var select = $('#serialNumberId');
			select.find('option').remove();
			$('<option>').val("0").text("Serial Number").appendTo(select);
			$.each(serialNumberMap, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
			});
			
			$("#instockId").val(response.availableInventory);
		}
	});
}


function resetField(){
	$("#nameId").val('');
	$("#emailId").val('');
	$("#dobId").val('');
}

function getHostSubVersion(mvId){
	$.ajax({
		type: "post",
		url: 'ajax/getHostSubVersion',
		data:'mvId='+mvId,
		dataType: "json",
		success: function(response){
			var hsvMap=response.hsvMap;
			var select = $('#hsvId');
			select.find('option').remove();
			$('<option>').val("0").text("Host Sub Version").appendTo(select);
			$.each(hsvMap, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
			});
		}
	});
}




//============== function to get agent user mobile number ================
function getAgentUserMobile(){
	
	//============ ajax call for gettting agent user mobile =============
	$.ajax({
		type: "post",
		url: 'ajax/getAgentUserMobile',
		data:'',
		dataType: "json",
		success: function(response){
			var mobileMap=response.mobileMap;
			var select = $('#mobileId');
			select.find('option').remove();
			$('<option>').val("0").text("Select Mobile").appendTo(select);
			$.each(mobileMap, function( key, value ){
				$('<option>').val(key).text(value).appendTo(select);
			});
		}
	});
}

//========== get user detail by mobile no ================
function getAgentUserDetail(id){
    $.ajax({
		type: "post",
		url: 'ajax/getAgentUserDetail',
		data:'id='+id,
		dataType: "json",
		success: function(response){
			$("#nameId").val(response.name);
			$("#emailId").val(response.emailId);
			$("#dobId").val(response.dob);
		}
	});
}

function getlabIdProof1() {
	var labidproof1=$.trim($('#lab_id_proof1').val());	
	
	if(labidproof1.length <= 0)
	{
		$('#lab_id_proof1ErrorId').html("<b><font color='red'>Plese selecte id proof !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_id_proof1ErrorId').html("");
		completeCheck = true;
	}
}


function getlabIdProof2() {
	var labidproof1=$.trim($('#lab_id_proof1').val());	
	
	if(labidproof1.length <= 0)
	{
		$('#lab_id_proof1ErrorId').html("<b><font color='red'>Plese selecte id proof !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_id_proof1ErrorId').html("");
		completeCheck = true;
	}
}

//============ validation of subscriber registration form ===============
//============ Written by Ram Kumar =================
function validateSubscriberForm(event){
	var mob = /^[1-9]{1}[0-9]{9}$/;
	var filter =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var completeCheck = true;
	
	//======== validate std code ============
	
	/*if($("#mobileNumberPrefix").val().length==0){
		$('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter STD Code.</font></b>");
		completeCheck = false;
	}
	else{
		var stdCode=$("#mobileNumberPrefix").val();
		 if(isNaN(stdCode)){
			 $('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter numeric STD Code.</font></b>");
			 completeCheck = false;
		 }
		 if(stdCode.length<2){
			 $('#lab_MobileNumberErrorId').html("<b><font color='red'>STD Code can't be less than 2-digits.</font></b>");
			 completeCheck = false;
		 }
	}*/
	
	
	//========== validate mobile number =============
	if($("#lab_MobileNumber").val().length==0){
		$('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter 10-digit mobile number.</font></b>");
		completeCheck = false;
	}
	else{
		var mobileNumber=$("#lab_MobileNumber").val();
		 if(isNaN(mobileNumber)){
			 $('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter numeric mobile number.</font></b>");
			 completeCheck = false;
		 }
		 if(mobileNumber.length<10){
			 $('#lab_MobileNumberErrorId').html("<b><font color='red'>Mobile number can't be less than 10-digits.</font></b>");
			 completeCheck = false;
		 }
	}
	
	//========== validate retailer and bc =====================
	/*var hiddenAccountTypeId=parseInt($("#hiddenAccountTypeId").val());
	if(hiddenAccountTypeId==1){ 
		var retailer=$("#lab_rtList").val();
		if(retailer=='0'){
			$('#lab_rtListErrorId').html("<b><font color='red'>Please select retailer.</font></b>");
			completeCheck = false;
		}
		//========= commented due to change ===============
		if($("#lab_bcList").val()=='0'){
			$('#lab_bcListErrorId').html("<b><font color='red'>Please select bc.</font></b>");
			completeCheck = false;
		}
	}*/
	
	if($("#subsTypeId").val()=='0'){
		$('#subsTypeIdErrorId').html("<b><font color='red'>Select subscriber type.</font></b>");
		completeCheck = false;
	}
	else{
		$('#subsTypeIdErrorId').html("");
	}
	
	if($("#subsTypeId").val()==16){
		if($("#lab_bcList").val()=='0'){
			$('#lab_bcListErrorId').html("<b><font color='red'>Select the bc.</font></b>");
			completeCheck = false;
		}
		else{
			$('#lab_bcListErrorId').html("");
		}
		/*
		if($("#bcMobileId").val()=='0'){
			completeCheck = false;
			$('#bcMobileErrorId').html("<b><font color='red'>Select the BC mobile number.</font></b>");
		}
		else{
			$('#bcMobileErrorId').html("");
		}*/
	}
	
	  
	//============= validate product , sim format and orientation ==================
	var productId=0;
	var simFormatId=0;
	var orientation=0;
	var walletMode=0;
	var arr=document.getElementsByTagName('input');
	for(var i=0; i<arr.length; i++){ 
        if(arr[i].type=='radio' && arr[i].name=='productType' && arr[i].checked){
        	productId=arr[i].value;
        }
        if(arr[i].type=='radio' && arr[i].name=='simformatType' && arr[i].checked){
        	simFormatId=arr[i].value;
        }
        if(arr[i].type=='radio' && arr[i].name=='orientationType' && arr[i].checked){
        	orientation=arr[i].value;
        }
        if(arr[i].type=='radio' && arr[i].name=='walletMode' && arr[i].checked){
        	walletMode=arr[i].value;
        }
    }
	
	 if(productId=='0'){
		 $('#lab_ProductErrorId').html("<b><font color='red'>Please select product.</font></b>");
		 completeCheck = false;
	 }
	 else{
		 $('#lab_ProductErrorId').html("");
		 
		 if(simFormatId=='0'){
			 $('#lab_simformatErrorId').html("<b><font color='red'>Please select sim format.</font></b>");
			 completeCheck = false;
		 }
		 else{
			 $('#lab_simformatErrorId').html("");
		 }
		 
	 }
	 
	
	 if(productId=='3'){
		 if(orientation=='0'){
			 $('#orientationErrorId').html("<b><font color='red'>Please select orientation.</font></b>");
			 completeCheck = false;
		 }
		 else{
			 $('#orientationErrorId').html("");
		 }
	 }
	 

	 
	 //============ validate host and sim version ===============
	 if($("#lab_hostType").val()=='0'){
		 $('#lab_hostTypeErrorId').html("<b><font color='red'>Please select host.</font></b>");
		 completeCheck = false;
	 }
	 
	 if($("#lab_hostSimVersion").val()=='0'){
		 $('#lab_hostSimVersionErrorId').html("<b><font color='red'>Please select host sim version.</font></b>");
		 completeCheck = false;
	 }
	 

	/* if($("#lab_walletType").val()=='0' || $("#lab_walletType").val()==null ){
		 $('#lab_walletTypeErrorId').html("<b><font color='red'>Please select wallet type.</font></b>");
		 completeCheck = false;
	 }*/
	 
	 if($("#lab_simSerialNumber").val()=='0'){
		 $('#simSerialNumberErrorId').html("<b><font color='red'>Enter SE Serial number .</font></b>");
		 completeCheck = false;
	 }
	 
	 if($("#hiddenCrn1").val()==1){
		 if($("#firstReference").val().length==0){
			 $('#1_crn_error_id').html("<b><font color='red'>Enter CRN.</font></b>");
			 completeCheck = false;
		 }
		 else{
			 $('#1_crn_error_id').html("");
		 }
	 }
	 
	 if($("#hiddenCrn2").val()==2){
		 if($("#secondReference").val().length==0){
			 $('#2_crn_error_id').html("<b><font color='red'>Enter CRN.</font></b>");
			 completeCheck = false;
		 }
		 else{
			 $('#2_crn_error_id').html("");
		 }
	 }
	 
	 
	 
	/* if(walletMode=='0'){
		 $('#walletModeErrorId').html("<b><font color='red'>Please select wallet mode.</font></b>");
		 completeCheck = false;
	 }*/
	 
	 //============= validate wallets ==============
	 	var counter=0;
	 	var arr=document.getElementsByTagName('input');
		for(var i=0; i<arr.length; i++){ 
	        if(arr[i].type=='checkbox' && arr[i].name=='walletCodeList' && arr[i].checked){
	        	//productId=arr[i].value;
	        	counter++;
	        }
		}
		
		if($("#subsTypeId").val()==13){
			if(counter>=1 && counter<=3){
				// completeCheck = true;
				 $('#walletModeErrorId').html("");
			}
			else if(counter==0){
				completeCheck = false;
				 $('#walletModeErrorId').html("<b><font color='red'>Select any wallet.</font></b>");
			}
			else{
				 completeCheck = false;
				 $('#walletModeErrorId').html("<b><font color='red'>Select any three wallet.</font></b>");
			}
		}
		else{
			if(counter>=1 && counter<=7){
				 //completeCheck = true;
				 $('#walletModeErrorId').html("");
			}
			else if(counter==0){
				completeCheck = false;
				 $('#walletModeErrorId').html("<b><font color='red'>Select any  wallet.</font></b>");
			}
			else{
				 completeCheck = false;
				 $('#walletModeErrorId').html("<b><font color='red'>Select any seven wallet.</font></b>");
			}
		}
	 
	 
	 
	 
	 //=========== validate pin code ==============
	 if($("#lab_Pin").val().length!=0){
		 if(isNaN($("#lab_Pin").val())){
			 $('#lab_PinErrorId').html("<b><font color='red'>Enter numeric pin code.!</font></b>");
			 completeCheck = false;
		 }
		 if($("#lab_Pin").val().length!=6){
			 $('#lab_PinErrorId').html("<b><font color='red'>Enter 6-digit numeric pin code.!</font></b>");
			 completeCheck = false;
		 }
	 }
	 
	 //========== validate landline number ==================
	 if($("#LandLineNumberPrefix").val().length!=0){
		 if($("#LandLineNumberPrefix").val().length<2){
			 $('#lab_LandLineNumberErrorId').html("<b><font color='red'>STD Code can't be less than 2-digit.!</font></b>");
			 completeCheck = false;
		 }
	 }
	 if($("#lab_LandLineNumber").val().length!=0){
		 if($("#lab_LandLineNumber").val().length<8){
			 $('#lab_LandLineNumberErrorId').html("<b><font color='red'>Landline nubmer can't be less than 8-digit.!</font></b>");
			 completeCheck = false;
		 }
	 }
	 
	 
      //========= validate transaction pin ============
	/* if($("#lab_login_pin").val().length!=0){
		 if($("#lab_login_pin").val().length!=6){
			 $('#lab_pinErrorId').html("<b><font color='red'>Enter 6-digit transaction pin.!</font></b>");
			 completeCheck = false;
		 }
	 }
	 
	 //=============validate login pin ============
	 if($("#lab_pin").val().length!=0){
		 if($("#lab_pin").val().length!=6){
			 $('#lab_login_pinErrorId').html("<b><font color='red'>Enter 6-digit login pin.!</font></b>");
			 completeCheck = false;
		 }
	 }*/
	 //=========== validate email id =================
	 if($("#lab_Email_Id").val().length!=0){
		 if (!(filter.test($("#lab_Email_Id").val()))){
				$('#lab_Email_IdErrorId').html("<b><font color='red'>Kindly enter valid Email ID !</font></b>");
				completeCheck = false;
			}
	 }
	 if(!(completeCheck)){	
		 event.preventDefault();
		 return false;
		}
		else{
			$('#subsRegistration').submit();
		}
}

//************************************** Function For Registration Form Validation ***********************************************
function subFormValid(event)
{	
var labidproof1_number=$.trim($("#lab_id_proof1_number").val());
	//alert(labidproof1_number);
	var completeCheck = true;
	if(labidproof1_number.length <= 0)
	{
		$('#lab_id_proof1_numberErrorId').html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;Id proof number can not be blank !</font></b>&nbsp;&nbsp;");
		completeCheck = false;
	}
	
	/*var labidproof1_number=$("#lab_id_proof1_number").val().trim();
	//alert("jhjh"+otp_limit);
	if(labidproof1_number == 0.0){
		$('#lab_otp_limitErrorId').html("<b><font color='red'>&nbsp;&nbsp;Otp limit can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}*/
	var password=$("#lab_pass").val();
	if(password.length==0){
		 $("#lab_passErrorId").html("<b><font color='red'>Password can't be blank.</font></b>");
		 completeCheck = false;
	}
	else if(password.length<=5){
		 $("#lab_passErrorId").html("<b><font color='red'>Password length should be more than 5 characters.</font></b>");
		 completeCheck = false;
	}
	/*var city=$("#lab_City").val();
	if(city.length==0){
		 $("#cityErrorId").html("<b><font color='red'>City can't be blank.!</font></b>");
		 completeCheck = false;
	}*/
	//======== written by Ram Kumar ===========
	var host=$("#lab_hostType").val();
	if(host.length==0){
		$("#lab_hostTypeErrorId").html("<b><font color='red'>Select the host.</font></b>");
		 completeCheck = false;
	}
	else if(host=='0'){
		$("#lab_hostTypeErrorId").html("<b><font color='red'>Select the host.</font></b>");
		 completeCheck = false;
	}
	//========== written by Ram Kumar ============
	var simVersion=$("#lab_hostSimVersion").val();
	 if(simVersion==null){
			$("#lab_hostSimVersionErrorId").html("<b><font color='red'>Select the host sim version.</font></b>");
			 completeCheck = false;
		}
	 else if(simVersion.length==0){
		$("#lab_hostSimVersionErrorId").html("<b><font color='red'>Select the host sim version.</font></b>");
		 completeCheck = false;
	}
	else if(simVersion=='0'){
		$("#lab_hostSimVersionErrorId").html("<b><font color='red'>Select the host sim version.</font></b>");
		 completeCheck = false;
	}
	
	

	var labSubscriberImage=$('#lab_SubscriberImage').val();
	if(labSubscriberImage.length==0){
		 $("#lab_SubscriberImage_err").html("<b><font color='red'>Select Subscriber image !</font></b>");
		 completeCheck = false;
	}
	else{
		checkExtSize('lab_SubscriberImage','lab_SubscriberImage_err');
	}
	
	
	var labsub_id_image1=$('#lab_sub_id_image1').val();
	if(labsub_id_image1.length==0){
		 $("#lab_image1ErrorId").html("<b><font color='red'>Select the user id !</font></b>");
		 completeCheck = false;
	}
	else{
		checkExtSize('lab_sub_id_image1','lab_image1ErrorId');
	}
	
	
	
	var proof1=$.trim($('#lab_id_proof1').val());	
	
	//var proof1=$('#proof1 :selected').text();
	if(proof1 == 0)
	{
		//alert("proof1"+proof1);
		$('#lab_id_proof1ErrorId').html("<b><font color='red'>Please selecte id proof type !</font></b>");
		completeCheck = false;
	}
	else{
		//alert("proof"+proof1);
		$('#lab_id_proof1ErrorId').html("");
		completeCheck = true;
	}
	
	
	
	
	var lab_walletType=$.trim($('#lab_walletType').val());	
	//alert(lab_rtList);
	var labwalletType=$('#lab_walletType :selected').text();
	if(lab_walletType.length <= 0)
	{
		$('#lab_walletTypeErrorId').html("<b><font color='red'>Plese selecte wallet Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_walletTypeErrorId').html("");
		completeCheck = true;
	}
	
	
	
	/*var lab_hostType=$.trim($('#lab_hostType').val());	
	//alert(lab_rtList);
	var labhostType=$('#lab_hostType :selected').text();
	if(lab_hostType.length <= 0)
	{
		$('#lab_hostTypeErrorId').html("<b><font color='red'>Plese selecte host !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_hostTypeErrorId').html("");
		completeCheck = true;
	}
	*/
	
	
	
	
	/*var id_proof=$("#lab_id_proof").val().trim();
	//alert("jhjh"+lab_simSerialNumber);
	if(id_proof.length<=0){
		$('#simSerialNumberErrorId').html("<b><font color='red'>&nbsp;&nbsp;Sim Serial Number can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}*/
	
	
	var lab_pin=$("#lab_pin").val().trim();
	//alert("jhjh"+lab_simSerialNumber);
	if(lab_pin.length<=0){
		$('#lab_pinErrorId').html("<b><font color='red'>&nbsp;&nbsp;Pin can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}
	
	var otp_limit=$("#lab_otp_limit").val().trim();
	//alert("jhjh"+otp_limit);
	if(otp_limit == 0.0){
		$('#lab_otp_limitErrorId').html("<b><font color='red'>&nbsp;&nbsp;Otp limit can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}
	
	var lab_login_pin=$("#lab_login_pin").val().trim();
	//alert("jhjh"+lab_simSerialNumber);
	if(lab_login_pin.length<=0){
		$('#lab_login_pinErrorId').html("<b><font color='red'>&nbsp;&nbsp;Login pin can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}
	
	
	var lab_simSerialNumber=$("#lab_simSerialNumber").val().trim();
	//alert("jhjh"+lab_simSerialNumber);
	if(lab_simSerialNumber.length<=0){
		$('#simSerialNumberErrorId').html("<b><font color='red'>&nbsp;&nbsp;Sim Serial Number can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
		
	}
	
	var lab_Product=$.trim($('#lab_Product').val());	
	var labProduct=$('#lab_Product :selected').text();
	if(lab_Product.length <= 0)
	{
		$('#lab_ProductErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		completeCheck = false;
	}
	
	
	var lab_simformat=$.trim($('#lab_simformat').val());	
	var labsimformat=$('#lab_simformat :selected').text();
	if(lab_simformat.length <= 0)
	{
		$('#lab_simformatErrorId').html("<b><font color='red'>Plese selecte sim format !</font></b>");
		completeCheck = false;
	}
	
	

	
	var lab_rtList=$.trim($('#lab_rtList').val());	
//	alert(lab_rtList);
	var labrtList=$('#lab_rtList :selected').text();
	//alert(labrtList);
	if(lab_rtList.length <= 0)
	{
		$('#lab_rtListErrorId').html("<b><font color='red'>Plese selecte retailer Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_rtListErrorId').html("");
		completeCheck = true;
	}
	
	
	
	
	
	var lab_subAccountType=$.trim($('#lab_subAccountType').val());	
	var countryName=$('#lab_subAccountType :selected').text();
	if(lab_subAccountType.length <= 0)
	{
		$('#lab_subAccountTypeErrorId').html("<b><font color='red'>Plese selecte Account Type !</font></b>");
		completeCheck = false;
	}
	
	
	//*********************************Company Name ************************************************
	var lab_SubscriberLoginName=$.trim($("#lab_SubscriberLoginName").val());
	
	//var completeCheck = true;
	if(lab_SubscriberLoginName.length <= 0)
	{
		$('#companyNameErrorId').html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;User login name can not be blank !</font></b>&nbsp;&nbsp;");
		completeCheck = false;
	}
	
	
	var lab_dob=$.trim($("#lab_dob").val());
	//var completeCheck = true;
	if(lab_dob.length <= 0)
	{
		$('#lab_dobErrorId').html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;Date of Birth can not be blank !</font></b>&nbsp;&nbsp;");
		completeCheck = false;
	}
	
	
	
    //*********************************Contact Person Name ************************************************
	var lab_contactPersonName=$.trim($('#lab_contactPersonName').val());
	if(lab_contactPersonName.length <= 0)
	{
		$('#contactPersonNamErrorId').html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact Person Name can not be blank !</font></b>");
		completeCheck = false;
	}
	//*********************************House No & Street ************************************************
	var lab_HouseNoStreet=$.trim($('#lab_HouseNoStreet').val());
	if(lab_HouseNoStreet.length <= 0)
	{
		$('#HouseNoStreetErrorId').html("<b><font color='red'>HouseNo. & Street can not be blank !</font></b>");
		completeCheck = false;
	}
	
	
	
	//********************************** Country ****************************************************
	var lab_Country=$.trim($('#lab_Country').val());	
	var countryName=$('#lab_Country :selected').text();
	//alert(lab_Country);
	if(lab_Country == 0)
	{
		$('#lab_CountryErrorId').html("<b><font color='red'>Country name can not be blank !</font></b>");
		completeCheck = false;
	}
	//********************************** State ****************************************************
	var lab_State=$('#lab_State').val();
	var stateName=$('#lab_State :selected').text();
	if(stateName != 'Other')
	{
		if(lab_State == 0)
		{
			$('#lab_stateErrorId').html("<b><font color='red'>State name can not be blank !</font></b>");
			completeCheck = false;
		}
	}
	//********************************** Other Country ****************************************************
	var lab_OtherCountry=$('#lab_OtherCountry').val();	
	if(countryName == 'Other')
	{
		if(lab_OtherCountry.length <= 0)
		{
			$('#lab_otherCountryErrorId').html("<b><font color='red'>Other Country name can not be blank !</font></b>");
			completeCheck = false;
		}
	}	
	//********************************** Other State ****************************************************
	var lab_otherState=$('#lab_otherState').val();
	if(countryName =='Other')
	{
		if(lab_otherState.length <= 0)
		{
			$('#lab_otherstateErrorId').html("<b><font color='red'>Other State name can not be blank !</font></b>");
			completeCheck = false;
		}
	}
	//********************************** Pin ****************************************************
	var lab_Pin=$('#lab_Pin').val();
	if(lab_Pin.length <= 0)
	{
		$('#lab_PinErrorId').html("<b><font color='red'>Pin can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
	}
	//********************************** Mobile Number ****************************************************
	var lab_MobileNumberPrefix=$('#mobileNumberPrefix').val();
	if(lab_MobileNumberPrefix.length <= 0)
	{
		$('#lab_MobileNumberErrorId').html("<b><font color='red'>Mobile Number Prefix can not be blank !</font></b>&nbsp;&nbsp;");
		completeCheck = false;
	}
	var lab_MobileNumber=$('#lab_MobileNumber').val();
	if(lab_MobileNumber.length <= 0)
	{
		$('#lab_MobileNumberErrorId').html("<b><font color='red'>Mobile Number can not be blank !</font></b>&nbsp;&nbsp;");
		completeCheck = false;
	}
	//********************************** Email ID ****************************************************
	var lab_Email_Id=$('#lab_Email_Id').val();
	//var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	var filter =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if(lab_Email_Id.length <= 0)
	{
		$('#lab_Email_IdErrorId').html("<b><font color='red'>&nbsp;&nbsp;Email ID can not be blank !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
	}
	else if (!(filter.test(lab_Email_Id)))
	{
		$('#lab_Email_IdErrorId').html("<b><font color='red'>&nbsp;&nbsp;Kindly enter valid Email ID !</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		completeCheck = false;
	}
	
	
	//alert(completeCheck);
	if(!(completeCheck))
	{	
		event.preventDefault();
		return false;
	}
	else
	{
		$('#subsRegistration').submit();
	}
}
//***************************** Function for set state ***************************************
function setState()
{
	var countryName=$('#lab_Country :selected').text();
	var lab_Country=$.trim($('#lab_Country').val());
	var lab_State=$('#lab_State').val();
	if(lab_Country.length == 0)
	{
		$("#lab_State option:selected").text("<-----Select----->");
		$('#mobileNumberPrefix').val("");
		$('#LandLineNumberPrefix').val("");
		$('#lab_OtherCountry_row_id').hide();
		$('#lab_otherCountryErrorId').html("");
		$('#lab_otherstateErrorId').html("");
		$('#lab_State').attr("disabled", false);
	}
	else if(countryName == 'Other' && lab_Country.length > 0)
	{
		$('#mobileNumberPrefix').attr("readonly", false);
		$('#LandLineNumberPrefix').attr("readonly", false);
		$('#lab_State').attr("disabled", true);
		$('#lab_stateErrorId').html("");
		$('#lab_CountryErrorId').html("");
		$('#lab_OtherCountry_row_id').show();
	}
	else if(lab_Country.length > 0 && countryName != 'Other')
	{
		$('#lab_State').attr("disabled", false);
		$('#lab_otherState').val("");
		$('#lab_OtherCountry').val("");
		$('#lab_stateErrorId').html("");
		$('#lab_CountryErrorId').html("");
		$('#lab_otherstateErrorId').html("");
		$('#lab_otherCountryErrorId').html("");
		$('#lab_OtherCountry_row_id').hide();
	}
}
//********************** Function for check uploaded file extension ( 'gif','png','jpg','jpeg' ) and size **************************************
function checkExtSize(fieldId,errorid)
{
	//***************************** Code for check file extension ****************************
	
	var ext = $('#'+fieldId).val().split('.').pop().toLowerCase();
	if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1)
	{
		$('#'+errorid).html("<b><font color='red'>Kindly upload file having extension .gif or .png or .jpg or jpeg !</font></b>");
		$('#'+fieldId).val('');
		return false;
	}
	//***************************** Code for check file size ****************************
	var fileSize = $('#'+fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize)/1024);
    if(fileSizeKB > 200)
    {
    	$('#'+errorid).html("<b><font color='red'>Kindly upload file having size less than or equal to 200 KB !</font></b>");
    	$('#'+fieldId).val('');
    	return false;
    }
    $('#'+errorid).html("");
}
//********************** Function for check uploaded file extension(PDF, DOC, DOCX) and size **************************************
function checkUploadedFile(fieldId,errorid)
{
	//***************************** Code for check file extension ****************************
	
	var ext = $('#'+fieldId).val().split('.').pop().toLowerCase();
	if($.inArray(ext, ['pdf','doc','docx']) == -1)
	{
		$('#'+errorid).html("<b><font color='red'>Kindly upload file having extension .pdf or .docx or .doc !</font></b>");
		$('#'+fieldId).val('');
		return false;
	}
	//***************************** Code for check file size ****************************
	var fileSize = $('#'+fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize)/1024);
	if(fileSizeKB > 2000)
    {
    	$('#'+errorid).html("<b><font color='red'>Kindly upload file having size less than 2 MB !</font></b>");
    	$('#'+fieldId).val('');
    	return false;
    }
    $('#'+errorid).html("");
}

function checkLoginDB(dynamicId)
{
	
	var subscriberLoginName=$.trim($('#lab_SubscriberLoginName').val());	
	if(subscriberLoginName.length <= 0)
	{
		$('#companyNameErrorId').html("<b><font color='red'>Enter login name !</font></b>");
		completeCheck = false;
	}
	
	else{
	
	$.ajax
	(
		{
			type: "Post",  
			url: "ajax/checkDuplicateLogin", 
			data: "subscriberLoginName="+subscriberLoginName,  
			dataType: "json",
			success: function(response)
			{
				var getResponse =JSON.parse(response); 
				if(getResponse)
				{
					$('#companyNameErrorId').html("<b><font color='red'> Login Name Available !</font></b>");
				}
				else
				{
					$('#companyNameErrorId').html("<b><font color='red'> Login Name already exist !</font></b>");
					$('#lab_SubscriberLoginName').val('');
					event.preventDefault();
					return false;
				}
			}
		}
	); 
	}
}
//**************************************** Function For Valid Registration ****************************************************************
function validateConfiguration()
{
	var submitFlag=true;
	var file1=$("#lab_uploadFile1").val();
	var stkMenu=$('#lab_stkMenu').val();
	if(stkMenu.length <= 0)
	{
		$('#lab_stkMenuErrorId').html("<b><font color='red'>ApplicationLink for STK Menu can not be blank !</font></b>");
		submitFlag = false;
		event.preventDefault();
		return false;
	}
	if(file1.length<=0){
		$('#lab_uploadFile1ErrorId').html("<b><font color='red'>Supporting Uploaded File1 mandatory !</font></b>");
		submitFlag = false;
		
		return false;
	}
	if(submitFlag)
	{
		$('#registrationSubmit').submit();
	}
	else
	{
		event.preventDefault();
		return false;
	}
}


function getHostAccount() {
	var lab_host_account=$.trim($('#lab_host_account').val());	
	var labProduct=$('#lab_host_account :selected').text();
	if(lab_host_account.length <= 0)
	{
		$('#lab_host_accountErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_host_accountErrorId').html("");
		completeCheck = true;
	}
}



function getAccountType() {
	var lab_subAccountType=$.trim($('#lab_subAccountType').val());	
	var labProduct=$('#lab_subAccountType :selected').text();
	if(lab_subAccountType.length <= 0)
	{
		$('#lab_subAccountTypeErrorId').html("<b><font color='red'>Plese selecte subscriber Account Type Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_subAccountTypeErrorId').html("");
		completeCheck = true;
	}
}


function getRTAccountType() {
	var lab_rtList=$.trim($('#lab_rtList').val());	
	//alert(lab_rtList);
	var labrtList=$('#lab_rtList :selected').text();
	//alert(labrtList);
	if(lab_rtList.length <= 0)
	{
		$('#lab_rtListErrorId').html("<b><font color='red'>Plese selecte retailer Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_rtListErrorId').html("");
		completeCheck = true;
	}
}

function productValType() {
	var lab_Product=$.trim($('#lab_Product').val());	
	var labProduct=$('#lab_Product :selected').text();
	if(lab_Product.length <= 0)
	{
		$('#lab_ProductErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		$('#simSerialNumberTrId').hide();
		completeCheck = false;
	}
	else{
		
		$('#lab_ProductErrorId').html("");
		$('#simSerialNumberTrId').show();
		completeCheck = true;
	}
}

function simformatTyp() {
	var lab_simformat=$.trim($('#lab_simformat').val());	
	var labProduct=$('#lab_simformat :selected').text();
	if(lab_simformat.length <= 0)
	{
		$('#lab_simformatErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_simformatErrorId').html("");
		completeCheck = true;
	}
}



function dobCheck() {
	var lab_dob=$.trim($('#lab_dob').val());	
	var labProduct=$('#lab_simformat :selected').text();
	if(lab_dob.length <= 0)
	{
		$('#lab_simformatErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_dobErrorId').html("");
		completeCheck = true;
	}
}


function getHostAccount() {
	var lab_host_account=$.trim($('#lab_host_account').val());	
	var labProduct=$('#lab_host_account :selected').text();
	if(lab_host_account.length <= 0)
	{
		$('#lab_host_accountErrorId').html("<b><font color='red'>Plese selecte Product Type !</font></b>");
		completeCheck = false;
	}
	else{
		$('#lab_host_accountErrorId').html("");
		completeCheck = true;
	}
}



function getBC()
{
	var rt=$('#lab_rtList').val();
	if(rt!='0')
	{
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/getBC',
				cache: false,
				data:'rt=' + rt,
				dataType: "json",
				success: function(response)
				{
					//alert(response);
					//var obj1 = JSON.parse(response);
					//alert(obj1);
					var bcMap = response.bcMap;
					//alert(bcMap);
					var select = $('#lab_bcList');
					select.find('option').remove();
					$('<option>').val("0").text("<--Select BC-->").appendTo(select);
					$.each(bcMap, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
				},
				error: function()
				{						
					$('#lab_CountryErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
		});
	}
}

function gethost()
{
	var walletType=$('#lab_walletType').val();
	//alert(walletType);
	if(walletType!='Others' && walletType!='')
	{
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/getHost',
				cache: false,
				dataType: "json",
				data:'walletType=' + walletType,
				success: function(response)
				{
					var obj1 = JSON.parse(response);
					var hostMap = obj1.hostMap;
					var select = $('#lab_hostType');
					select.find('option').remove();
					$('<option>').val(0).text("select").appendTo(select);
					$.each(hostMap, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
				},
				error: function()
				{						
					$('#lab_walletTypeErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
		});
	}
}





function gethostSimVersion()
{
	
	

	$("#lab_hostTypeErrorId").html("");
	var hostId=$('#lab_hostType').val();
	
	if(hostId!='Others' && hostId!='')
	{
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/gethostSimVersion',
				cache: false,
				dataType: "json",
				data:'hostId=' + hostId,
				success: function(response)
				{
					//var obj1 = JSON.parse(response);
					var hostSimVersionMap = response.hostSimVersionMap;
					var select = $('#lab_hostSimVersion');
					select.find('option').remove();
					$('<option>').val(0).text("<--Select-->").appendTo(select);
					$.each(hostSimVersionMap, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
					handleCrn(response);
					
					
				},
				error: function()
				{						
					$('#lab_hostSimVersionErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
		});
	}
	var select = $('#lab_walletType');
	select.find('option').remove();
	var select = $('#lab_simSerialNumber');
	select.find('option').remove();
	$("#lab_comment").val("");
}

//======= getting CRN =============
//======= written by: Ram [11-DEC-15] =============

function handleCrn(response){
	
	//$("#firstReference").val(response.firstReference);
	//$("#secondReference").val(response.secondReference);
	if(response.customerReferenceNumber1==1 || response.customerReferenceNumber2==2){
		$("#crnRowId").show();
		
		if(response.customerReferenceNumber1==1){
			$("#crnLable1").html(response.firstReference);
			$("#tdId1").show();
			$("#hiddenCrn1").val(response.customerReferenceNumber1);
		}
		else{
			$("#crnLable1").html("");
			$("#tdId1").hide();
			$("#hiddenCrn1").val();
		}
		
		if(response.customerReferenceNumber2==2){
			$("#crnLable2").html(response.secondReference);
			$("#tdId2").show();
			$("#hiddenCrn2").val(response.customerReferenceNumber2);
		}
		else{
			$("#crnLable2").html("");
			$("#tdId2").hide();
			$("#hiddenCrn2").val();
		}
		
		
	}
	else{
		$("#crnRowId").hide();
	}
}

//======= getting CRN =============
//======= written by: Ram [11-DEC-15] =============

function handleCrnForUpdate(){
	
	var crnLabel1=$("#hiddenCrn1").val();
	var crnLabel2=$("#hiddenCrn2").val();
	
	var crn1=$("#crn1").val();
	var crn2=$("#crn2").val();
	
	if(crn1==1 || crn2==2){
		$("#crnRowId").show();
		
		if(crn1==1){
			$("#crnLable1").html(crnLabel1);
			$("#tdId1").show();
		}
		
		if(crn2==2){
			$("#crnLable2").html(crnLabel2);
			$("#tdId2").show();
		}
	}
	else{
		$("#crnRowId").hide();
	}
}




//=========== function to get wallet type ==============
function getWalletType(){
	 $('#walletModeErrorId').html("");
	var select = $('#lab_walletType');
	select.find('option').remove();
	var simVersionId=$('#lab_hostSimVersion').val();
	
	if(simVersionId!='0'){
		$('#lab_hostSimVersionErrorId').html("");
		var walletMode;
		var arr=document.getElementsByTagName('input');
		for(var i=0; i<arr.length; i++){ 
	        if(arr[i].type=='radio' && arr[i].name=='walletMode' && arr[i].checked){
	        	walletMode=arr[i].value;
	        }
	    }
		
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/getWallet',
				cache: false,
				dataType: "json",
				data:'simVersionId=' + simVersionId+'&walletMode='+walletMode,
				success: function(response)
				{
					var walletMap = response.wallettypeMap;
					var select = $('#lab_walletType');
					select.find('option').remove();
					//$('<option>').val(0).text("Wallet Type").appendTo(select);
					$.each(walletMap, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
				},
				error: function()
				{						
					$('#lab_walletTypeErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
		});
	}
	else{
		$('#lab_hostSimVersionErrorId').html("<b><font color='red'>Please select sim version.</font></b>");
	}
}
//============= end ===============

function getWalletType2(){
	var hostId=$("#lab_hostType").val();
	var subsType=$("#subsTypeId").val();
	if(hostId=='0'){
		$('#lab_walletTypeErrorId').html("<b><font color='red'>Select the host.</font></b>");
		return false;
	}
	else{
		$('#lab_walletTypeErrorId').html("");
	}
	
	
	var walletMode;
	var arr=document.getElementsByTagName('input');
	for(var i=0; i<arr.length; i++){ 
        if(arr[i].type=='radio' && arr[i].name=='walletMode' && arr[i].checked){
        	walletMode=arr[i].value;
        }
    }
	
	$.ajax({
		type: "post",
		url: 'ajax/getWallet2',
		cache: false,
		dataType: "json",
		data:'hostId=' + hostId+'&walletMode='+walletMode+'&subsType='+subsType,
		success: function(response){
			var walletMap = response.wallettypeMap;
			
			var select = $('#lab_walletType');
			select.find('option').remove();
			
			$.each(walletMap, function( key, value )
			{
				$('<option>').val(key).text(value).appendTo(select);
			});
			
		},
		error: function(){						
			$('#lab_walletTypeErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
			
		}
	});
	
	
}



function showOrHideField(){
	var hiddenAccountTypeId=parseInt($("#hiddenAccountTypeId").val());
	
	/* if(hiddenAccountTypeId==16 || hiddenAccountTypeId==25 ){ 
		$("#retailerTdLab").hide();
		$("#retailerTd").hide();
		$("#bcTdLab").hide();
		$("#bcTd").hide();
	}*/
	if(hiddenAccountTypeId==25){
		//$("#lab_rtList").attr('selectedIndex',1);
		 //$("#lab_rtList select")[0].selectedIndex = 1;
		 //document.getElementById('lab_rtList').selectedIndex = 1;
		var subType=$("#subsTypeId").val();
		if(subType==16){
			$("#bcTdLab").show();
			 $("#bcTd").show();
		}
		else{
			$("#bcTdLab").hide();
			$("#bcTd").hide();
		}
		
		 
	}
	else if(hiddenAccountTypeId==16){
		 //document.getElementById('lab_rtList').selectedIndex = 1;
		 //document.getElementById('lab_bcList').selectedIndex = 1;
		 $("#bcTdLab").show();
		 $("#bcTd").show();
	}
}
//=========== function to get sim serial number ===============
function getSimSerialNumber(){
	var hiddenAccountTypeId=parseInt($("#hiddenAccountTypeId").val());
	var select = $('#lab_walletType');
	select.find('option').remove();
	$('#lab_comment').val("");
	
	//======== commented due to change =========
	/*	var retailerId; //25
	var bcId; ///16
	if(hiddenAccountTypeId==16 || hiddenAccountTypeId==25){ 
		retailerId=0;
		bcId=0; 
	}
	else if(hiddenAccountTypeId==1){ 
		retailerId=$("#lab_rtList").val();
		bcId=$("#lab_bcList").val();
	}*/
	var retailerId=$("#lab_rtList").val();
	var bcId=$("#lab_bcList").val();
	var productId;
	var simFormatId;
	var orientation;
	var arr=document.getElementsByTagName('input');
	for(var i=0; i<arr.length; i++){ 
        if(arr[i].type=='radio' && arr[i].name=='productType' && arr[i].checked){
        	productId=arr[i].value;
        }
        if(arr[i].type=='radio' && arr[i].name=='simformatType' && arr[i].checked){
        	simFormatId=arr[i].value;
        }
        if(arr[i].type=='radio' && arr[i].name=='orientationType' && arr[i].checked){
        	orientation=arr[i].value;
        }
    }
	
	if(productId!='3'){
		orientation=0;
	}
	
	
	var hostId=$("#lab_hostType").val();
	var hostSimVersionId=$("#lab_hostSimVersion").val();
	
	if(hostSimVersionId!='0'){
		 //========== ajax call ==============
		 $.ajax({
			  url: 'ajax/getSimSerialNumber',
			  type: 'POST',
			  dataType: "json",
			  data: 'hostId='+hostId+'&hostSimVersionId='+hostSimVersionId+'&retailerId='+retailerId+'&bcId='+bcId+'&productId='+productId+'&simFormatId='+simFormatId+"&orientation="+orientation,
			  success: function(data) {
				  
				  	//========= Map is coming as an object in data ============
				 	var select = $('#lab_simSerialNumber');
					select.find('option').remove();
					$('<option>').val(0).text("<--Select Serial-->").appendTo(select);
					$.each(data, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
			  },
			  error: function(e) {
				  alert("error: "+e);
				  console.log(e.message);
			  }
			});
	}
}

function getdes()
{
	$("#lab_hostSimVersionErrorId").html("");
	var hostSimVersion=$('#lab_hostSimVersion').val();
	//alert(hostId);
	if(hostSimVersion!='Others' && hostSimVersion!='')
	{
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/getdes',
				cache: false,
				data:'hostSimVersion=' + hostSimVersion,
				dataType: "json",
				success: function(response)
				{
					//var obj1 = JSON.parse(response);
					var des = response.des;
					var select = $('#lab_comment');
					$('#lab_comment').val(des);
					
					/*var selectWallet = $('#lab_walletType');
					var wallettype = response.wallettypeMap;
					selectWallet.find('option').remove();
					$.each(wallettype, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(selectWallet);
					});*/
					
				},
				error: function()
				{						
					$('#lab_hostSimVersionErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
		});
	}
}



function getStateListsub()
{
	var Country=$('#lab_Country').val();
	if(Country!='Others' && Country!='')
	{
		$.ajax
		(
			{
				type: "post",
				url: 'ajax/getStateList',
				cache: false,
				data:'Country=' + Country,
				dataType: "json",
				success: function(response)
				{
					//var obj1 = JSON.parse(response);
					var stateMap = response.stateCountryMap;
					var countryCode = response.countryCode;
					var select = $('#lab_State');
					$('#lab_OtherCountry_row_id').hide();
					select.find('option').remove();
					
					$('<option>').val(0).text("Select State").appendTo(select);
					$.each(stateMap, function( key, value )
					{
						$('<option>').val(key).text(value).appendTo(select);
					});
					
					$.each(countryCode, function( key, value ) 
					{
						var MobileNumberselect = $('#mobileNumberPrefix');
						var landLineselect = $('#LandLineNumberPrefix');
						if(value == 0)
						{
							MobileNumberselect.val("");
							landLineselect.val("");
						}
						else
						{
							MobileNumberselect.val(value);
							landLineselect.val(value);
						}
					});
				},
				error: function()
				{						
					$('#lab_CountryErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");
					
				}
				
				
				
				
		});
	}
	
	
	else if(Country=='Others')
	{   
		$('#lab_OtherCountry_row_id').show();
		$("#lab_OtherState_row_id").hide();
		var labState = $('#lab_State');		          
	    $('<option>').val("Other").text("Other").appendTo(labState);
	    
	    var arr=getIdOfSelectedCheckBox();
		 for(var i=0;i<arr.length;i++){
			 var id=arr[i];
			 $("#mobileNumberPrefix_"+id).val("");
			 $("#LandLineNumberPrefix_"+id).val("");
			 $("#mobileNumberPrefix_"+id).attr("readonly",false);
			 $("#LandLineNumberPrefix_"+id).attr("readonly",false);
			 
			 $("#mobileNumberPrefix_"+id).attr("size",'3');
			 $("#LandLineNumberPrefix_"+id).attr("size",'3');
		 }
		
	}
	
	
	
}


function checkSubscriberLoginName(){
	
	 var subscriberLoginName=  $("#lab_SubscriberLoginName").val();
	    
	    $.ajax({
         type: "POST",
         url: "ajax/checkDuplicateLogin",
         data: {
             'subscriberLoginName':subscriberLoginName
         },
		 dataType: "json",
         success: function(data){
         	if(data=="false"){
         		$("#companyNameErrorId").html('');
         		$("#companyNameErrorId").html("<b><font color='red'>Login Name already exist !</font></b>");
         		$('#lab_SubscriberLoginName').val('');
         	
         	}
         	else{
         		$("#companyNameErrorId").html('');
         		$("#companyNameErrorId").html("<b><font color='green'>Login Name Available !</font></b>");
         	}
         	
         	
         },
         error: function(XMLHttpRequest, textStatus, errorThrown) {
             $( "#statusmess" ).html('');
             $( "#statusmess" ).append('Ajex Exception');
         }
    });
	
	
	
	
}





function checkSubscriberMobileNumber(){
	
	 var mobileNumber=  $("#lab_MobileNumber").val();
	 
	//========== validate mobile number =============
		if($("#lab_MobileNumber").val().length==0){
			$('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter 10-digit mobile number.</font></b>");
			return false;
		}
		else{
			var mobileNumber=$("#lab_MobileNumber").val();
			 if(isNaN(mobileNumber)){
				 $('#lab_MobileNumberErrorId').html("<b><font color='red'>Please enter numeric mobile number.</font></b>");
				 return false;
			 }
			 if(mobileNumber.length<10){
				 $('#lab_MobileNumberErrorId').html("<b><font color='red'>Mobile number can't be less than 10-digits.</font></b>");
				 return false;
			 }
		}
	 
	 
	 
	    
	 if(mobileNumber!='')
		{
	    $.ajax({
        type: "POST",
        url: "ajax/checkDuplicatemobileNumber",
        data: {
            'mobileNumber':mobileNumber
        },
		dataType: "json",
        success: function(data){
        	
        	if(data==false){
        		$("#lab_MobileNumberErrorId").html('');
        		$("#lab_MobileNumberErrorId").html("<b><font color='green'>Mobile Number Available !</font></b>");
        		$('#lab_MobileNumberErrorId').val('');
        	
        	}
        	else{
        		$("#lab_MobileNumberErrorId").html('');
        		$("#lab_MobileNumberErrorId").html("<b><font color='red'>Mobile Number already exist !</font></b>");
        		$('#lab_MobileNumber').val('');
        	}
        	
        	
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $( "#statusmess" ).html('');
            $( "#statusmess" ).append('Ajex Exception');
        }
   });
	
		}
	
	
}





function checkSerialNumberAvailability(){
	
	var serialNumber=$("#lab_simSerialNumber").val().trim();
	var productId=$("#lab_Product").val();
	
	 $.ajax({
            type: "POST",
            url: "ajax/checkSerialNumberAvailability",
            data: {
                'serialNumber':serialNumber,
                'productId':productId
            },
			dataType: "json",
            success: function(data){
            	alert(data);
            	if(data=="2"){

            		$("#simSerialNumberErrorId").html('');
            		$("#simSerialNumberErrorId").html("<b><font color='green'>Serial Number Available !</font></b>");
            	
            	
            	}
            	else{
            		$("#simSerialNumberErrorId").html('');
            		$("#simSerialNumberErrorId").html("<b><font color='red'>Serial Number Invalid !</font></b>");
            		$('#lab_simSerialNumber').val('');
            	}
            	
            	
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                $( "#statusmess" ).html('');
                $( "#statusmess" ).append('Ajex Exception');
            }
       });
	
	
	
	
}

//========== function to show addition field ================
function showAdditionInfo(buttonId){
	
	/*if($("#"+buttonId).attr("value")=='Show Optional Field'){
		$("#table2").show(500);
		$("#table3").show(500);
		$("#table4").show(500);
		$("#"+buttonId).attr('value', 'Hide Optional Field');
	}
	else{
		$("#table2").hide(500);
		$("#table3").hide(500);
		$("#table4").hide(500);
		$("#"+buttonId).attr('value', 'Show Optional Field');
	}*/
	if(buttonId=='btn1'){
		if($("#"+buttonId).attr("value")=='Add Document'){
			$("#table4").show(500);
			$("#"+buttonId).attr('value', 'Hide Document');
		}
		else{
			$("#table4").hide(500);
			$("#"+buttonId).attr('value', 'Add Document');
		}
	}
	else if(buttonId=='btn2'){
		if($("#"+buttonId).attr("value")=='Add Address'){
			$("#table2").show(500);
			$("#"+buttonId).attr('value', 'Hide Address');
		}
		else{
			$("#table2").hide(500);
			$("#"+buttonId).attr('value', 'Add Address');
		}
		
	}
	else if(buttonId=='btn3'){
		if($("#"+buttonId).attr("value")=='Add addl.'){
			$("#table3").show(500);
			$("#"+buttonId).attr('value', 'Hide addl.');
		}
		else{
			$("#table3").hide(500);
			$("#"+buttonId).attr('value', 'Add addl.');
		}
		
	}
}





function DatepickerTest(){
	
	alert("jgjh");
	$("#datepicker").Datepicker();
	
	
}

function showDefaultPrefix(){
	$("#mobileNumberPrefix option[value='91']").attr('selected', 'selected');
	$("#LandLineNumberPrefix option[value='91']").attr('selected', 'selected');
}

function showSimFormat(id){
	if(id=='productId1'){
		$("#simFormatTdIdLab").show();
		$("#simFormatTdIdVal").show();
		$("#orientationRowId").hide();
		// product Nano should be  visible in case of SE
		$("input#simFormatId3").show();
		$('label[for="simFormatId3"]').show();
		
		var productId=$("#productId1").val();
		getProductImage(productId);
	}
	else{
		$("#simFormatTdIdLab").show();
		$("#simFormatTdIdVal").show();
		$("#orientationRowId").show();
		// product Nano should not be  visible in case of SE
		$("input#simFormatId3").hide();
		$('label[for="simFormatId3"]').hide();
		
		var productId=$("#productId2").val();
		getProductImage(productId);
	}
	
	
	/*$("#lab_hostSimVersion option[value='0']").attr('selected', 'selected');
	var select = $('#lab_simSerialNumber');
	select.find('option').remove();
	$("#lab_comment").val("");*/
	 clearField();
	
}

//========== function to get product image ==============
function getProductImage(productId){
	$.ajax({
			type: "post",
			url: 'ajax/getProductImage',
			cache: false,
			dataType: "json",
			data:'productId='+productId,
			success: function(response){
				//alert(response.image1Url);
				$("#productImageId").show();
				$("#productImageId").attr('src',response.image1Url);
			},
			error: function(){						
				$('#lab_ProductErrorId').html("<b><font color='red'>Please try after sometime.</font></b>");
			}
	});
}



function clearField(){
	$("#lab_hostSimVersion option[value='0']").attr('selected', 'selected');
	var select = $('#lab_simSerialNumber');
	select.find('option').remove();
	$("#lab_comment").val("");
	
	$("#lab_ProductErrorId").html("");
}
//=========== function for registration confirmation message ==============
function showPopupConfirmation(id){
	if($("#"+id).val()!=''){
		 $( "#dialog" ).dialog();
	}
}

function setOrientationVisible(id){
	if($("#"+id).val()=='3'){
		$("#simFormatTdIdLab").show();
		$("#simFormatTdIdVal").show();
		$("#orientationRowId").show();
	}
	else{
		$("#simFormatTdIdLab").show();
		$("#simFormatTdIdVal").show();
		$("#orientationRowId").hide();
	}
}


//======== function show or hide crn ==============
//======== Written by : Ram Kumar =================
function showCRN(id){
	var val=$("#"+id).val();
	if($('#'+id).prop('checked')){
		$("#tdId"+val).show();
	}
	else{
		$("#tdId"+val).hide();
		$('#'+val+'_crn_error_id').html("");
	}
}

function showCrnTextBox(){
	showCRN("customerReferenceNumber1");
	showCRN("customerReferenceNumber2");
}

$(document).ready(function(){
	 $("#subsTypeId").change(function() {
		    var $this = $(this);
		    if($this.val()==16){
		    	 $("#bcTdLab").show();
				 $("#bcTd").show();
				 $("#bcMobileRowId").show();
		    }
		    else{
		    	 $("#bcTdLab").hide();
				 $("#bcTd").hide();
				 $("#bcMobileRowId").hide();
		    }
	 });
});
//
$(document).ready(function(){
	 $("#bcMobileId").change(function() {
		    var mobileNo = $(this);
		   $("#lab_MobileNumber").val(mobileNo.val());
	 });
});

//=============== function to get bc mobile number ===================
function getBcMobileNumber(){
	var bcId=$("#lab_bcList").val();
	if(bcId!=0){
		$.ajax({
			type: "POST",
			url: 'ajax/getBcMobileNumber',
			data:'bcId='+bcId,
			dataType: "json",
			success: function(data){
				  data=JSON.stringify(data);
				 // alert(data);
				  data=JSON.parse(data);
				  data=data.bcMobileMap;
				  data=JSON.stringify(data);
				  
				 $('#bcMobileId').find('option:not(:first)').remove();
				 if(data!='null'){
					 var arr=getSortedArray(data);
					  for(var i=0;i<arr.length;i++){
						  var key=arr[i].key;
						  var value=arr[i].value;
						  $("#bcMobileId").append(new Option(value,key));
					  }
				 }
			},
			error: function(e){						
				//alert(e);
			}
		});
	}
}


function getHostWallet(){
	var hostId=$("#lab_hostType").val();
	var subsType=$("#subsTypeId").val();
	
	if(hostId!='0' && subsType!='0'){
		$.ajax({
			type: "POST",
			url: 'ajax/getHostWallet',
			dataType: "json",
			data:'hostId='+hostId+'&subsType='+subsType,
			success: function(data){
				  data=data.walletList;
				  displayWallet(data);
			},
			error: function(e){						
				alert(e);
			}
		});
	}
	else{
		
	}
}


function displayWallet(data){
	var table=document.getElementById('walletTableId');
    var numrows=table.rows.length;
    while(numrows>1)
    table.deleteRow(--numrows);
	for(var i=0;i<data.length;i++){
		var val=data[i];
		var walletId=val.walletId;
		var walletName=val.walletName;
		var walletType=val.walletType;
		var walletMode=val.walletMode;
		
		var tr=table.insertRow();
		var td1=tr.insertCell();
		var td2=tr.insertCell();
		var td3=tr.insertCell();
		var td4=tr.insertCell();
		
		var input=document.createElement('input');
		input.setAttribute('type','checkbox');
		input.setAttribute('id',walletId);
		input.setAttribute('value',walletId);
		input.setAttribute('name','walletCodeList');
		
		td1.appendChild(input);
		td2.innerHTML=walletName;
		td3.innerHTML=walletType;
		td4.innerHTML=walletMode;
		
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		
		table.appendChild(tr);
		
		
	}
}

//============= functions to check all checkbox ================ 
//============= written by Ram Kumar[30-DEC-15] =================
function checkAll(id){
	var arr=getIdOfAllCheckBox();
	var array=deleteElementFromArray(arr,id);
	if(isChecked(id)){
		for(var i=0;i<array.length;i++){
			var id=array[i];
			$('#'+id).prop('checked',true);
		}
	}
	else{
		for(var i=0;i<array.length;i++){
			var id=array[i];
			$('#'+id).prop('checked',false);
		}
	}
}


function validateForm(){
	if($("#instockId").val()=='0'){
		showAlert("Warning","Inventory not available.");
		return false;
	}
}

function validateSubscribersForm(event)
{
	var completeCheck = true;
	var issueToId=$("#issueToId").val();
	if(issueToId==0){
		 $("#label_Issued_ErrorId").html("<b><font color='red'>Kindly select to whom you want to issue SE!.</font></b>");
		 completeCheck = false;
	 }
	if(issueToId=="AGENT")
	{
		var mobileId=$("#mobileId").val();
		if(mobileId==0){
			 $("#label_agent_mobile_ErrorId").html("<b><font color='red'>Kindly select a contact number!.</font></b>");
			 completeCheck = false;
	 }
		}
	if(issueToId=="CUSTOMER")
		{
		var mobileId2=$("#mobileId2").val();
		$("#nameId").prop("readonly", false);
		$("#dobId").prop("readonly", false);
		$("#emailId").prop("readonly", false);
		if(mobileId2.length==0){
			 $("#label_customer_mobile_ErrorId").html("<b><font color='red'>Kindly provide contact number!.</font></b>");
			 completeCheck = false;
		 }
		}
	
	if(issueToId=="AGENT" && mobileId!=0)
	{
		var nameId=$("#nameId").val();
		if(nameId==0){
			 $("#label_name_ErrorId").html("<b><font color='red'>Kindly provide your name!.</font></b>");
			 completeCheck = false;
		 }
		
		var dobId=$("#dobId").val();
		if(dobId==0){
			 $("#label_dob_ErrorId").html("<b><font color='red'>Kindly provide your date of birth!.</font></b>");
			 completeCheck = false;
		 }
	}
	else if(issueToId=="AGENT" && mobileId==0)
		{
			 $("#label_agent_mobile_ErrorId").html("<b><font color='red'>Kindly select a contact number!.</font></b>");
			 completeCheck = false;
	 }
	
	if(issueToId=="CUSTOMER" && mobileId2!=0)
	{
		if(mobileId2.length < 10 || mobileId2.length > 12 )
		{
			$("#label_customer_mobile_ErrorId").html("<b><font color='red'>Contact number must be of 10 to 12 digits!.</font></b>");
			completeCheck = false;
		}
		var nameId=$("#nameId").val();
		if(nameId==0){
			 $("#label_name_ErrorId").html("<b><font color='red'>Kindly provide your name!.</font></b>");
			 completeCheck = false;
		 }
		
		var dobId=$("#dobId").val();
		if(dobId==0){
			 $("#label_dob_ErrorId").html("<b><font color='red'>Kindly provide your date of birth!.</font></b>");
			 completeCheck = false;
		 }
	}
	else if(issueToId=="CUSTOMER" && mobileId2==0)
		{
			 $("#label_customer_mobile_ErrorId").html("<b><font color='red'>Kindly select a contact number!.</font></b>");
			 completeCheck = false;
	 }
	
	/*if(mobileId!=0 || mobileId2!=0)
	{	
	var nameId=$("#nameId").val();
	if(nameId==0){
		 $("#label_name_ErrorId").html("<b><font color='red'>Kindly provide your name!.</font></b>");
		 completeCheck = false;
	 }
	
	var dobId=$("#dobId").val();
	if(dobId==0){
		 $("#label_dob_ErrorId").html("<b><font color='red'>Kindly provide your date of birth!.</font></b>");
		 completeCheck = false;
	 }
	}*/
	var mvId=$("#mvId").val();
	if(mvId==0){
		 $("#label_master_ErrorId").html("<b><font color='red'>Kindly select master version!.</font></b>");
		 completeCheck = false;
	 }
	var hsvId=$("#hsvId").val();
	if(hsvId==0){
		 $("#label_hsv_ErrorId").html("<b><font color='red'>Kindly select host sub version!.</font></b>");
		 completeCheck = false;
	 }
	var productId=$("#productId").val();
	if(productId==0){
		 $("#label_product_ErrorId").html("<b><font color='red'>Kindly select product!.</font></b>");
		 completeCheck = false;
	 }
	var serialNumberId=$("#serialNumberId").val();
	if(serialNumberId==0){
		 $("#label_SE_ErrorId").html("<b><font color='red'>Kindly select serial number you want to issue!.</font></b>");
		 completeCheck = false;
	 }
	if(!completeCheck){
		return false;
	}
}

function makeReadonly()
{
	var issueToId=$("#issueToId").val();
	var mobileId=$("#mobileId").val();
	if(issueToId=="AGENT" && mobileId!=0)
	{
		$("#nameId").prop("readonly", true);
		$("#emailId").prop("readonly", true);
		 $("#dobId" ).datepicker("");
	}
}
function removeReadonly()
{
	var issueToId=$("#issueToId").val();
	if(issueToId=="CUSTOMER")
	{
		$("#nameId").prop("readonly", false);
		$("#dobId").prop("readonly", false);
		$("#emailId").prop("readonly", false);
		$("#mvId").val("0");
		$("#hsvId").val("0");
		$("#productId").val("0");
		$("#instockId").val("");
		$("#serialNumberId").val("0");
	}
	if(issueToId=="AGENT")
	{
		$("#nameId").prop("readonly", true);
		$("#dobId").prop("readonly", true);
		$("#emailId").prop("readonly", true);
		$("#mvId").val("0");
		$("#hsvId").val("0");
		$("#productId").val("0");
		$("#instockId").val("");
		$("#serialNumberId").val("0");
		$("#nameId").val("");
		$("#emailId").val("");
		$("#dobId" ).val("");
	}
}

function validPhoneNumber() {
	var mobileId2=$("#mobileId2").val();
	var re = /^[\d]*$/;
	if (!re.test(mobileId2)) {
		 $("#label_customer_mobile_ErrorId").html("<b><font color='red'>Contact number must be numeric!.</font></b>");
		 $("#mobileId2").val("");
	}
	} 