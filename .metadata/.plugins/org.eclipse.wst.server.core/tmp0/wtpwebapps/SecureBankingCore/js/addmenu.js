function remove_error()
{
	$("#errorid").html("");
	
}

function validateAddMenu(event){
			var check=true;
			var name=$("#name").val().trim();
			if(name.length==0){
				$("#div_menuname").addClass('has-error');
				check=false;
			}
			if($("input[name='sysAccountGroupArray']:checked").length==0){
				$("#errorid").html("<font color=red>Select checkBox</font>")
				$("#errorid").show();
				check=false;
				event.preventDefault();
			}
			
			
			
		   var description=$("#description").val().trim();
		if(description.length==0){
			$("#div_description").addClass('has-error');
			check=false;
		}
		if(!check){
			check=false;
			event.preventDefault();
		}
		
			var menuIndex=$("#menuIndex").val().trim();
			if(menuIndex.length==0){
				$("#div_menuIndex").addClass('has-error');
				check=false;
			}
			if(!check){
				check=false;
				event.preventDefault();
			}
			
			var placement=$("#placement").val().trim();
			if(placement.length==0){
				$("#div_placement").addClass('has-error');
				check=false;
			}
			if(!check){
				check=false;
				event.preventDefault();
			}
				 
			var action=$("#action").val().trim();
			if(action.length==0){
				$("#div_action").addClass('has-error');
				check=false;
			}
			if(!check){
				check=false;
				event.preventDefault();
			}
			
			var priority=$("#priority").val().trim();
			if(priority.length==0){
				$("#div_priority").addClass('has-error');
				check=false;
			}
			if(!check){
				check=false;
				event.preventDefault();
			}
			return check;
			
			
}
function validateEditMenu(event){
	var check=true;
	var name=$("#name").val().trim();
	if(name.length==0){
		$("#div_menuname").addClass('has-error');
		check=false;
	}
	/*if($("input[name='sysAccountGroupArray']:checked").length==0){
		$("#errorid").html("<font color=red>Select checkBox</font>")
		$("#errorid").show();
		check=false;
		event.preventDefault();
	}*/
	
	
	
   var description=$("#description").val().trim();
if(description.length==0){
	$("#div_description").addClass('has-error');
	check=false;
}
if(!check){
	check=false;
	event.preventDefault();
}

	var menuIndex=$("#menuIndex").val().trim();
	if(menuIndex.length==0){
		$("#div_menuIndex").addClass('has-error');
		check=false;
	}
	if(!check){
		check=false;
		event.preventDefault();
	}
	
	var placement=$("#placement").val().trim();
	if(placement.length==0){
		$("#div_placement").addClass('has-error');
		check=false;
	}
	if(!check){
		check=false;
		event.preventDefault();
	}
		 
	var action=$("#action").val().trim();
	if(action.length==0){
		$("#div_action").addClass('has-error');
		check=false;
	}
	if(!check){
		check=false;
		event.preventDefault();
	}
	
	var priority=$("#priority").val().trim();
	if(priority.length==0){
		$("#div_priority").addClass('has-error');
		check=false;
	}
	if(!check){
		check=false;
		event.preventDefault();
	}
	return check;
	
	
}

function emptySuccess(event,msgId){
	$("#"+msgId).html('');
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
