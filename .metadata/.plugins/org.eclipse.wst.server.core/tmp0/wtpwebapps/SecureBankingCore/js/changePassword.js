function checkChangePass(event)
{
	
	var currPass = $('#userPassword').val().trim();
	var newPass = $('#newPassword').val().trim();
	var rePass = $('#rePassword').val().trim();
	var check = true;
	if(currPass.length> 0){
		check = checkPassword();
		if(!check){
			$('#userPassword').val('');
			$('#lab_currentPasswordErrorId').html("<font color='red'>Invalid Password </font>");
		}
	}
	
	if(currPass.length == 0)
	{	 
		$('#div_userPassword').addClass('has-error');
		
		check = false;
	}
	if(newPass.length == 0)
	{	
		$('#div_newPassword').addClass('has-error');
		
		check = false;
	}
	if(rePass.length == 0)
	{
		$('#div_rePassword').addClass('has-error');
	
		check = false;
	}
	if(newPass.length!=0 && rePass.length!=0){
		
		if(newPass!=rePass)
		
		{
			$("#label_rePassword").hide();
			$("#lab_repasswordErrorId").show();
			$('#lab_repasswordErrorId').html("<font color='red'>Passwords does not Match !</font>");
			$('#'+newPassword).val("");
			$('#'+rePassword).val("");
			 check = false;
		}
		
	}
	if(newPass.length!=0 && newPass.length<6){
		$('#label_newPassword').hide();
		$("#lab_newPasswordErrorId").show();
		$("#lab_newPasswordErrorId").html("<font color='red'>Must be atleast 6 characters long.</font>");
		$('#newPassword').val('');
		check= false;
	}
	
	if(rePass.length!=0 && rePass.length<6){
		
		$('#label_rePassword').hide();
		$('#lab_repasswordErrorId').show();
		$('#lab_repasswordErrorId').html("<font color='red'>Must be atleast 6 characters long.</font>");
		$('#rePassword').val('');
		check= false;
	}
	
	if(!(check))
	{	
		event.preventDefault();
		return false;
	}
	else
	{
		//$('#changePasswordForm').submit();
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
		
		$("#label_rePassword").hide();
		$("#lab_repasswordErrorId").show();
		$('#lab_repasswordErrorId').html("<font color='red'>Passwords does not Match !</font>");
		$('#'+newPassword).val("");
		$('#'+rePassword).val("");
	}

}

function emptySuccessmessage(){
	$('#successMessageId').html("");
}

function checkPassword(){
	       $('#lab_currentPasswordErrorId').hide();
			var userPassword = $("#userPassword").val();
		var check = function(){	
		var completeCheck=true;
		$.ajax({
			async: false,
			url: 'ajax/checkPassword',
			type:'POST',
			data:'userPassword='+userPassword,
			success:function(response)
			{
				
				if(response=="0")
				{
					$('#lab_currentPasswordErrorId').html("");
					
					completeCheck = true;
				}else
				{
					$('#lab_currentPasswordErrorId').show();
					$('#lab_currentPasswordErrorId').html("<font color='red'>Current Password does not match</font>");
					$('#userPassword').val('');
					completeCheck = false;
				}
			},
			  error: function(e) {
												
					  }
		});
		return completeCheck;
		}();

return check;
	}


