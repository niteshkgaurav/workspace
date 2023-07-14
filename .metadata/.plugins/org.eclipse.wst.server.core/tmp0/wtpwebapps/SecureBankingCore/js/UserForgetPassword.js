function validateEmailDob()
{	
	var emailorusername = $('#userNameorEmail').val();	
	var dob = $('#lab_dob').val();
	var check = true;
	
	if(dob.length!=0)
	{	
		$("#label_lab_dob").addClass("valid");
		$("#label_securityQuestionId").addClass("valid");}
	


	if(emailorusername.length<=0)
	{	
		$('#lab_userNameorEmailId').hide();
		$('#lab_userNameorEmailErrorId').show();
		$('#lab_userNameorEmailErrorId').html("<font color='red'>Kindly Fill UserName / E-mail / Mobile </font>");
		check = false;
	}
	if(dob.length<=0)
	{
     $("#div_dob").addClass('has-error');

		check = false;
	}
	if(check == true)
	{
		$.ajax({
			type : "POST",
			url : "ajax/validateEmailDob",
			dataType: "json",
			data : 'emailorusername='+emailorusername+'&dob='+dob,
			success:function(response)
			{
				$.each(response, function (key, val) {
					if(key==1)
					{
						$('#radioValuetErrorId').show();
						$('#lab_dobErrorId').show();
						$('#lab_dob').val('');
						$('#userNameorEmail').val('');
						$('#lab_userNameorEmailId').hide();
						$('#lab_securityQuestionId').hide();
						$('#div_securityQuestion').hide();
						$('#div_password').hide();
						$('#div_repassword').hide();
						$('#div_submit').hide();
						$('#lab_userNameorEmailErrorId').show();
						$('#lab_userNameorEmailId').show();
						$('#radioValuetErrorId').html("<p class='text-danger'>"+val+"</p>");
						$('#userNameorEmail').attr('readonly',false);
					}
					if(key==2)
					{
						$('#div_securityQuestion').show();
						$('#div_password').show();
						$('#div_repassword').show();
						$('#div_submit').show();
						
						
						$('#lab_securityQuestionId').show();
						$('#answerId').show();
						$('#userPasswordId').show();
						$('#rePasswordId').show();
						
						$("#securityQuestionId").show();
						$("#answer").show();
						$("#userPassword").show();
						$("#rePassword").show();
						$("#forgetId").show();
						$('#question').show();
						$('#securityQuestionId').val(val);
						$('#userNameorEmail').attr('readonly',true);
					}
				});
			}
		});
	}
	
}

function validateUser()
{
	var emailorusername = $('#userNameorEmail').val();	
	var dob = $('#lab_dob').val();
	var answer = $('#answer').val();
	var check = true;
	if(answer.length<=0)
	{	

		$("#div_securityAnswerId").addClass('has-error');
		/*$('#label_securityAnswerid').hide();
>>>>>>> .r8287
		$('#lab_answerErrorId').show();
		$('#lab_answerErrorId').html("<font color='red'>Kindly Fill Answer !</font>");*/
		check = false;
	}
	if(check == true)
	{
		$.ajax({
			type : "POST",
			url  :  "ajax/validateEmailDobAns",
			dataType: "json",
			data : 'emailorusername='+emailorusername+'&dob='+dob+'&answer='+answer,
			success:function(response)
			{
				$.each(response, function (key, val) {
					if(key==='accountId')
					{
						$('#accountId').val(val);
						$('#userPassword').attr('readonly',false);
						$('#rePassword').attr('readonly',false);
					}	
					if(key==='invalidLoginCount')
					{
						if(val<2)
						{
							$('#label_securityAnswerid').hide();
							$('#lab_answerErrorId').show();
							$('#lab_answerErrorId').html("<font color='red'>Wrong Answer! Try Again!!</font>");
						}
						else if(val==2)
						{
							$('#label_securityAnswerid').hide();
							$('#lab_answerErrorId').show();
							$('#lab_answerErrorId').html("<font color='red'>Its your last Attempt</font>");
						}
						else if(val==3)
						{
							$('#label_securityAnswerid').hide();
							$('#lab_answerErrorId').show();
							$('#lab_answerErrorId').html("<font color='red'>Contact Customer Care!! You are Blocked!</font>");
						}
						$('#answer').val("");
					}
					if(key==='blockId')
					{
						$('#label_securityAnswerid').hide();
						$('#lab_answerErrorId').show();
						$('#lab_answerErrorId').html("<font color='red'>Contact Customer Care!! You are Blocked!</font>");
						$('#answer').val("");
					}
				});
			}
		});
	}
}

function forgetPassOrFTLoginCheck(event,formId)
{
	
   var check = true;
	
	if(formId=='firstTimeLoginPage'){ 
		//alert("in submit ")
		var username = $('#lab_userName').val();	
		var dob = $('#lab_dob').val();
		var sequerityQuestion=$("#securityQuestionId").val().trim();
		var answer = $('#securityAnswerId').val().trim();
		var currentPassword = $('#currentPasswordId').val().trim();
		var newPassword=$('#newPasswordId').val().trim();
		var rePassword = $('#rePasswordId').val();
		
		
		if(username.length == 0)
		{

			$("#div_userName").addClass('has-error');
			/*$('#label_lab_userName').hide();
>>>>>>> .r8287
			$('#lab_userNameorEmailErrorId').show();
			$('#lab_userNameorEmailErrorId').html("<font color='red'>User name can not be blank </font>");*/
			check = false;
		}
		if(dob.length == 0)
		{

			$('#label_lab_dob').hide();
			$("#div_dob").addClass('has-error');
			/*$('#label_lab_dob').hide();
>>>>>>> .r8287
			$('#lab_dobErrorId').show();
			$('#lab_dobErrorId').html("<font color='red'>DOB can not be blank </font>");*/
			check = false;
		}
		if(sequerityQuestion.length<=0){
			

			$("#lab_securityQuestionId").addClass('has-error');
			/*$("#label_securityQuestionId").hide();
			$("#lab_securityQuestionErrorId").show();
			$("#lab_securityQuestionErrorId").html("<font color='red'>Security question can not be blank </font>");*/
		   check=false;
		}
		if(answer.length == 0)
		{
	$("#div_securityAnswerId").addClass('has-error');
			/*$('#label_securityAnswerid').hide();
			$('#lab_answerErrorId').show();
			$('#lab_answerErrorId').html("<font color='red'>Answer can not be blank </font>");*/
			check = false;
		}
		if(currentPassword.length == 0)
		{

			$("#div_currentPasswordId").addClass('has-error');
			/*$('#lable_currentPassword').hide();
			$('#lab_currentPasswordErrorId').show();
			$('#lab_currentPasswordErrorId').html("<font color='red'>User current password can not be blank </font>");*/
			check = false;
		}
		if(newPassword.length == 0)
		{

			$("#div_newPasswordId").addClass('has-error');
			/*$('#label_newPassword').hide();
			$('#lab_passwordErrorId').show();
			$('#lab_passwordErrorId').html("<font color='red'>User new password cannot be blank </font>");*/
			check = false;
		}
		
		if(rePassword.length == 0)
		{

			$("#div_rePasswordId").addClass('has-error');
			/*$('#label_rePassword').hide();
			$('#lab_repasswordErrorId').show();
			$('#lab_repasswordErrorId').html("<font color='red'>Retype new password can not be blank </font>");*/
			check = false;
		}
		if(rePassword.length> 0){
			if(newPassword===rePassword)
			{}
			else
			{
				$('#label_rePassword').hide();
				$('#lab_repasswordErrorId').show();
				$('#lab_repasswordErrorId').html("<p class='text-danger'>Passwords does not Match</p>");
 $('#'+newPassword).val("");
				 $(rePasswordId).val('');
				 check = false;
			}
			
		}
		
		if(!(check))
		{
			event.preventDefault();
			return false;
		}
		else
		{
			$('#'+formId).submit();
		}
		
		
		
	}
	else{
	var emailorusername = $('#userNameorEmail').val();	
	var dob = $('#lab_dob').val();
	var answer = $('#answer').val();
	var rePassword = $('#rePassword').val();
	var userPassword = $('#userPassword').val();
	if(emailorusername.length == 0)
	{
		$('#label_lab_userName').hide();
		$('#lab_userNameorEmailErrorId').show();
		$('#lab_userNameorEmailErrorId').html("<font color='red'>Kindly Fill UserName / E-mail / Mobile </font>");
		check = false;
	}
	if(dob.length == 0)
	{
		$('#label_lab_dob').hide();
		$('#lab_dobErrorId').show();
		$('#lab_dobErrorId').html("<font color='red'>Kindly Fill Date Of Birth</font>");
		check = false;
	}
	if(answer.length == 0)
	{
		$('#label_securityAnswerid').hide();
		$('#lab_answerErrorId').show();
		$('#lab_answerErrorId').html("<font color='red'>Answer Cannot be Blank !</font>");
		check = false;
	}
	if(rePassword.length == 0)
	{
		
		$('#label_rePassword').hide();
		$('#lab_repasswordErrorId').show();
		$('#lab_repasswordErrorId').html("<font color='red'>Re-Password Cannot be Blank !</font>");
		check = false;
	}
	if(userPassword.length == 0)
	{
		$('#label_userPassword').hide();
		$('#lab_passwordErrorId').show();
		$('#lab_passwordErrorId').html("<font color='red'>User Password Cannot be Blank !</font>");
		check = false;
	}
	if(!(check))
	{
		event.preventDefault();
		return false;
	}
	else
	{
		$('#'+formId).submit();
	}
	}
}

function matchPassword(newPassword,rePassword)
{
	var newPass = $('#'+newPassword).val();
	var rePass = $('#'+rePassword).val();
	if(newPass===rePass)
	{}
	else
	{
		$('#label_rePassword').hide();
		$('#lab_repasswordErrorId').show();
		$('#lab_repasswordErrorId').html("<font color='red'>Passwords does not Match </font>");
		$('#'+newPassword).val("");
		$('#'+rePassword).val("");
	}
}
function dateValidate(datetext)
{
	var currentdate=  moment().format('YYYY-MM-DD');
	if(datetext>currentdate)
		{
		$('#label_lab_dob').hide();
		$('#lab_dobErrorId').show();
		$('#lab_dobErrorId').html("<font color='red'>Date Can Not More Than Current Date </font>");
		$('#lab_dob').val('');
		}
	
	
	
}

function hideLoginDetails(){
	//alert("new")
	$('#login_detail_div').hide();
	$('#imageId').hide();
	$('#div_login-details_id').hide();
	
}

function removeErrorMessage(){
	$('#radioValuetErrorId').html('');
}