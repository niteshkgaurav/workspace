function validateUserByDOB(dobId,useNameId){
	
	//alert("fsfsdfsfsdf")
	 
	//alert("dob :"+dobId +" userName :"+useNameId);
	var userNameId=$("#"+useNameId).val().trim();
	var dobId=$("#"+dobId).val();
	var checkAvailaity=true;
	
	if(userNameId.length<=0){
		
		
		$("#label_lab_userName").hide();
		$("#lab_userNameorEmailErrorId").show();
		$("#lab_userNameorEmailErrorId").html("<p class='text-danger'> Please Enter User Name !</p>")
		checkAvailaity=false;
	}
	if(dobId.length<=0){
		
		$("#label_lab_dob").hide();
		$("#lab_dobErrorId").show();
		$("#lab_dobErrorId").html("<p class='text-danger'> Please Select DOB !</p>")
		checkAvailaity=false;
	}
	if(checkAvailaity){
		
		
		$.ajax({
			 url: '/securebanking/AdminUI/UserMgmt/ajax/validateByLoginNameDob',
			  type: 'GET',
			  dataType: "json",
			  data: {
		            'userName': userNameId,
		             'dob' : dobId
		            
	                  },
			  success: function(response) {
				 
				var firstTimeLoginDataResponse=response;
				//alert("firstTimeLoginDataResponse :"+firstTimeLoginDataResponse.validUserStatus);
				if(firstTimeLoginDataResponse.validUserStatus==true){
					$("#question").show();
				}
				else{
					$("#lab_userName").val('');
					$("#label_lab_userName").hide();
					$("#lab_userNameorEmailErrorId").show();
					$("#lab_userNameorEmailErrorId").html("<p class='text-danger'> Invalid User Name or DOB !</p>");
					
				}
				
			  },
			  error: function(e) {
				  //alert("error: "+e);
				  console.log(e.message);
			  }
			});
		
		
		
		
	}
	  
	
	
}
var pass=true;
function passwordMatch(){
	var currentPassword=$("#currentPasswordId").val().trim();
	var newPassword=$("#newPasswordId").val().trim();
	if(currentPassword==newPassword){
		$("#lab_passwordErrorId").show();
		$("#lab_passwordErrorId").html("<p class='text-danger'>Current Password and New Password can not be same</p>");
		$("#currentPasswordId").val('');
		$("#newPasswordId").val('');
		pass=false;
	}
	
}

