

	function getAccountType() {
		//alert("hi")
		var labaccounttype=$('#lab_account_type').val();
		if(labaccounttype=="Super Admin"){
			$('#labsubaccount_type').hide();
		}
		else{
			
			$.ajax
			(
				{
					type: "post",
					url: '/securebanking/AdminUI/login/ajax/getSubAccountType',
					cache: false,
					dataType: "json",
					data:'account_type=' + labaccounttype,
					success: function(response)
					{
						alert(response);
						var obj1 = JSON.parse(response);
						var bcMap = obj1.accountTypeMap;
						var select = $('#lab_subaccount_type');
						select.find('option').remove();
					
						$.each(bcMap, function( key, value )
						{
							$('<option>').val(key).text(value).appendTo(select);
						});
						
					},
					error: function()
					{						
						
					}
			});
			
			
			
			$('#labsubaccount_type').show();
		}
		
		//alert(labaccounttype);
	}
	
	function usererrormessage(event)
	{
		
		
	var error=	$('.alert-danger').text();
	$('.alert-danger').hide();
	document.getElementById('hrefId').enable=true;
	
	}


	function removeMessage(){
	document.getElementById("successMessageID").innerHTML = '';		
	}
	
	function validateUser()
	{
	
		var user=$("#username").val().trim();
		var password=$("#password").val().trim();
		
		if(user.length==0 && password.length==0)
			{
		
			$("#div_username").addClass("has-error");
			$("#div_password").addClass("has-error");
			$('#userNameId').addClass('has-error');
			$("#div_password").addClass("has-error");
			
		      return false;
		     
			}
		
		if(user.length==0 && password.length>0)
		{
			
			$("#div_username").addClass("has-error");
			
		      return false;
		     
			}
	
	}
	
	
	function validateForgotPassword(){
		document.getElementById("successMessageID").innerHTML = '';		
		var user=$("#username").val().trim();
		var password=$("#password").val().trim();
		if(user.length>0 && password.length>0){
		
			$("#password").val('');
			return true;
		}
		
	}
	
	
	
	