function getInfo(){
	resetPassword();
		
}

function resetPassword(){
	
	var email=$("#emailOrUserId").val();
	var mobile=$("#emailOrUserId").val();
	var userName=$("#emailOrUserId").val();
	var completeCheck = true;
	if(!($('#email').is(":checked")) && (!($('#mobile').is(":checked"))) && (!($('#userName').is(":checked"))))
	{
		$('#resetByErrorId').html("");
		$('#resetByErrorId').html("<font color='red'> Please select atleast one option</font>");
		completeCheck = false;
	}
	if(($('#email').is(":checked")) && (!($('#mobile').is(":checked"))) && (!($('#userName').is(":checked"))))
	{
		if(email.length==0)
		{
			$("#emailMobileUserTextbox").addClass('has-error');
		}
		else{
		$("#tbodyid").empty();
		$.ajax({
			  url: 'ajax/getInfo',
			  type: 'post',
			  dataType: 'json',
			  data: 'email='+email,
			 success: function(response){
				if(response.emailId!=null){
				$("#divID_newPassword").show();
				 $("#divID_cnfPassword").show();
				 $("#div_submit").show();
				 
				 
				$('#template_details').append('<tr><td align="right"  width="46%">Name :</td><td align="left"> &nbsp; '+response.name+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Email :</td><td align="left"> &nbsp; '+response.emailId+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Mobile Number :</td><td align="left"> &nbsp; '+response.mobileNo+'</td></tr>');
			 }else{
				 $("#resetPasswordErrorIdDiv").show();
				 $("#resetPasswordErrorIdDiv").val("email id not in database");
				 $("#emailMobileUserDivErrorId").html("user not available in database")
			 }
			 },
			 error: function(e) {
				
				 $("#emailMobileUserTextbox").addClass('has-error');
				 $("#emailOrUserId").val('');
				
				  }
			 
		});
		
		}
	}
	if(!($('#email').is(":checked")) && ($('#mobile').is(":checked")) && (!($('#userName').is(":checked"))))
	{
		if(mobile.length==0)
		{
			$("#emailMobileUserTextbox").addClass('has-error');
		} else{
		$("#tbodyid").empty();
		$.ajax({
			  url: 'ajax/getInfoByMobile',
			  type: 'post',
			  dataType: 'json',
			  data: 'mobile='+mobile,
			 success: function(response){
				 if(response.mobileNo!=null){
				 $("#divID_newPassword").show();
				 $("#divID_cnfPassword").show();
				 $("#div_submit").show();
				 
				 $('#template_details').append('<tr><td align="right"  width="46%">Name :</td><td align="left"> &nbsp; '+response.name+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Email :</td><td align="left"> &nbsp; '+response.emailId+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Mobile Number :</td><td align="left"> &nbsp; '+response.mobileNo+'</td></tr>');
				 }else{
					 
					 $("#emailOrUserId").val("Mobile Number not in database");
					 $("#emailMobileUserDivErrorId").html("user not available in database")
				 }
				 },
			 error: function(e) {
				 $("#emailMobileUserTextbox").addClass('has-error');
				 $("#emailOrUserId").val('');
				  }
			
		});
		
		}
	}
	
	if(!($('#email').is(":checked")) && (!($('#mobile').is(":checked"))) && ($('#userName').is(":checked")))
	{
		
		if(userName.length==0)
			{
			$("#emailMobileUserTextbox").addClass('has-error');
			}else{
		$("#tbodyid").empty();
		$.ajax({
			  url: 'ajax/getInfoByUserName',
			  type: 'post',
			  data: 'userName='+userName,
			  dataType: 'json',
			 success: function(response){
				
				 
				  var obj = JSON.parse(response);
			if(obj.name!=null){
				 $("#divID_newPassword").show();
				 $("#divID_cnfPassword").show();
				 $("#div_submit").show();
				 
				$('#template_details').append('<tr><td align="right"  width="46%">Name :</td><td align="left"> &nbsp; '+obj.name+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Email :</td><td align="left"> &nbsp; '+obj.emailId+'</td></tr>');
				$('#template_details').append('<tr><td align="right"  width="46%">Mobile Number :</td><td align="left"> &nbsp; '+obj.mobileNo+'</td></tr>');
			}
				  
			else{
				 $("#emailMobileUserDivErrorId").html("user not available in database")
			}
			 
					 },
		
			 error: function(e) {
				 $("#emailMobileUserTextbox").addClass('has-error');
				 $("#emailOrUserId").val('');
				  }
		
		});
		
			}
	}
}