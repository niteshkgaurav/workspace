function getRaioTextValue(selectedRadioTdId,divId){
	
	$("#newPassword").val('');
	$("#cnfPassword").val('');
	
	$("#lable_cnfPasswordErrorId").html('');
		$("#lable_emailOrUserIdErrorId").html('');
	$('#newPassword').attr("value", "");
	$('#cnfPassword').attr("value", "");
			$("#lable_emailOrUserIdErrorId").html('');
		 $("#lable_newPasswordErrorId").html("");
		$("#lable_cnfPasswordErrorId").html('');

	$("#emailMobileUserTextboxTable").remove();
	$('#notMatchMessage').html('');
	
	//$('#emailMobileUserTextbox').remove();
	var selectedRadioType=$("#"+selectedRadioTdId).text().trim();
	
	var label="'selectedRadioTypeId'";
	var errorId="'lable_emailOrUserIdErrorId'";
	//alert(" get RadioTextValue :"+selectedRadioType +" div Id :"+divId);
	if(selectedRadioType==='Mobile Number'){
		
		$("#tbodyid").empty();
		var html='<div id="emailMobileUserTextboxTable" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">'+
        '<div id="emailMobileUserTextbox" class="styled-input">'+
        '<input type="text" class="selecttag" id="emailOrUserId" name="'+selectedRadioType+'"  onchange="selecttag('+"'selectedRadioTypeId'"+','+"'emailOrUserId'"+');mobileNumberValidation();" '+
		 'onfocus="removeHasError('+"'emailMobileUserTextbox'"+');showlabel('+"'selectedRadioTypeId'"+','+"'lable_emailOrUserIdErrorId'"+')" onkeypress="onlyNumric1(event,'+errorId+','+label+');" maxlength="10"  onclick="this.setAttribute('+"'value'"+', this.value);emptyerror(event,'+errorId+');" placeholder=" " value="" />'+
        '<label id="selectedRadioTypeId">* '+selectedRadioType+'</label>'+
        '<label id="lable_emailOrUserIdErrorId" class="collapse"></label>'+
        '<span></span></div></div>';
	
	
	}else{
		
		$("#tbodyid").empty();
 var html='<div id="emailMobileUserTextboxTable" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">'+
			 '<div id="emailMobileUserTextbox" class="styled-input">'+
			 '<input type="text" id="emailOrUserId" class="selecttag" name="'+selectedRadioType+'"  onchange="selecttag('+"'selectedRadioTypeId'"+','+"'emailOrUserId'"+')" '+
			 'onfocus="removeHasError('+"'emailMobileUserTextbox'"+');showlabel('+"'selectedRadioTypeId'"+','+"'lable_emailOrUserIdErrorId'"+')"     onclick="this.setAttribute('+"'value'"+', this.value);emptyerror(event,'+errorId+');" placeholder=" " value=""  />'+
			 '<label id="selectedRadioTypeId">* '+selectedRadioType+'</label>'+
			 '<label id="lable_emailOrUserIdErrorId" class="collapse"></label>'+
			 '<span></span></div></div>';
	 
	 
	}
 $(html).appendTo($("#"+divId));
 $("#"+divId).show();
 $('#resetByErrorId').html("");
// $("#"+selectedRadioTdId).attr('checked', 'checked');
 //$('#emailMobileUserTextbox').remove();
	
}

function validateResetPasswordPage(){
		//alert("validationResetPasswordPage ");
	
	var completeCheck = true;
	
	//********************************* Check Radio Button ************************************************
	if(!($('#email').is(":checked")) && (!($('#mobile').is(":checked"))) && (!($('#userName').is(":checked"))))
	{
		$('#resetByErrorId').html("");
		$('#resetByErrorId').html("<font color='red'>Kindly check atleast one radio button !</font>");
		completeCheck = false;
	}
	else{
		var emailMobileUserId=$("#emailOrUserId").val().trim();
		var selectedRadioType=$("#selectedRadioTypeId").text().trim();
		if(emailMobileUserId.length<=0){
			
			$("#selectedRadioTypeId").hide();
			$("#lable_emailOrUserIdErrorId").show();
			$("#lable_emailOrUserIdErrorId").html('<font class="red">Kindly enter  '+selectedRadioType.substring(2,selectedRadioType.length-1)+ '</font>');
			 completeCheck = false;
		}
	}
	
	/* if(!($('#email').is(':checked')) && !($('#mobile').is(':checked')) && !($('#userName').is(':checked')))
	 {
		// alert("hyfghgh ");
		 $('#resetByErrorId').html("");
		 $('#resetByErrorId').html("<b><font color='red'>Kindly Choose One Radio  !</font></b>");
		 completeCheck = false;
	 }
	 else{
		 $('#resetByErrorId').html("<b><font color='red'>Kindly Choose One Radio  !</font></b>");
		 completeCheck = false;
	 }*/
	var newPassword=$("#newPassword").val();
	
	
	if(newPassword.length<=0){
		/*$("#lab_NewPassword2").hide();
		$("#lable_newPasswordErrorId").show(); 
		 $("#lable_newPasswordErrorId").html("<font color='red'>Kindly enter new password</font>");*/
		$("#div_newPassword").addClass('has-error');
		 completeCheck = false;
	 }
	var cnfPassword =$("#cnfPassword").val();
	
	if(cnfPassword.length<=0){
		/*$("#lab_ConfirmPassword2").hide();
		$("#lable_cnfPasswordErrorId").show();
		$("#lable_cnfPasswordErrorId").html("<font color='red'>Kindly enter confirm password</font>");*/
		$("#div_cnfPassword").addClass('has-error');
		
		completeCheck = false;
	}
	if(newPassword!==cnfPassword){
		$("#cnfPassword").val('');
		$("#lab_ConfirmPassword2").hide();
		$("#lable_cnfPasswordErrorId").show();
		$("#lable_cnfPasswordErrorId").html("<font color='red'>Password does not match</font>");
		completeCheck = false;
	}
	
	if(newPassword===cnfPassword){
		 if((cnfPassword.length<6)&&(newPassword.length<6)){
			
				$("#newPassword").val('');
				$("#lab_NewPassword2").hide();
				$("#lable_newPasswordErrorId").show();
				$("#lable_newPasswordErrorId").html("<font color='red'>Must be atleast 6 characters long. </font>");
				$("#cnfPassword").val('');
				$("#lab_ConfirmPassword2").hide();
				$("#lable_cnfPasswordErrorId").show();
				$("#lable_cnfPasswordErrorId").html("<font color='red'>Must be atleast 6 characters long. </font>");
				completeCheck = false;
		 }
		
	}
	
	if(!completeCheck){
		
		return false;
	}
	
}


function mobileNumberValidation(){
	var mobileNumberRegex=/^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$/;
	var data=$("#emailOrUserId").val();
	if(!mobileNumberRegex.test(data)){
		$("#emailOrUserId").val('')
		/*$("#selectedRadioTypeId").hide();
		$("#lable_emailOrUserIdErrorId").show();
		$("#lable_emailOrUserIdErrorId").html("<font color='red'>Please enter valid mobile number.</font>");*/
		$("#emailMobileUserTextbox").addClass('has-error');
		
		
		return false;
	}
		else{
			$('#'+errorid).html("");
			return true;
		
	}
}



