function toggleform(id)
{
	$('#msgId').html('');
$("#"+id).toggle("slow",function(){
	
  /*
   * 
   */
});
}
function refresh(successMessageId){
	$('#'+successMessageId).html('');
}

function activateDeactivate(index){
var comment=$('#comment').val();
if(comment.length>0){
	var id=$('#deactivateId').val();
	if(index=="Activate"){
		var value=true;
	}else{
		var value=false;
	}
$.ajax({
	type : "post",
	url : "	ajax/deActivate",
	dataType: 'json',
	async: false,
	data : 'comment=' + comment+ '&id='+ id+ '&value='+ value,
	success : function(response) {
	if(response==true){
		if(index=="Activate"){
			$('#'+index+"_"+id).prop('value', 'Deactivate');
			$('#'+index+"_"+id).attr('id', 'Deactivate_'+id);
		}else{
			$('#'+index+"_"+id).prop('value', 'Activate');
			$('#'+index+"_"+id).attr('id', 'Activate_'+id);
		}
		$('#successMessageId').html("<font color='green'>Status Successfully Updated</font>");
	}else{
		$('#successMessageId').html("<font color='red'>Status Updation Failed</font>");
	}
	$('#comment').val('');
	$("#dialog1").dialog("close");
	},
	error : function(e) {
	}
});	
}else{
	$('#commentErrorId').html("<font color='red'>Kindly Enter The Comment</font>");
	$('#commentErrorId').show();
}	  
}

function removeError(errorId){
	$('#'+errorId).html("");
	$('#'+errorId).hide();
}

function deactivationbox(id,index)
{
	$('#dialog1').dialog({
		width: 360,
		height: 180,  
		 buttons: [{
		        text: "submit",
		        "id": "reasonSubmit",
		        "value":index.value,
		        "class":"btn btn-warning",
		        click: function () {
		        	activateDeactivate(index.value);
		        },
		    }],
	});
	$("#dialog1").dialog("open");
	$('#deactivateId').val(id);
}
function validateUser(event){
	var check=true;
	var userName=$('#name').val().trim();
	if($('#compDiv').is(':hidden')==false && $("#companyId").val()==""){
		$('#companyDiv').addClass('has-error');
		check=false;
		return false;
	}
	
	if(userName.length==0){
		$('#name-input').addClass('has-error');
		check=false;
		return false;
	}
	
	var password=$('#password').val().trim();
	if(password.length==0){
		$('#password-input').addClass('has-error');
		check=false;
		return false;
	}
	
	
	var mobile=$('#mobile-number').val().trim();
	if(mobile.length==0)
    {
        $('#mobile-input').addClass('has-error');
        check=false;
        return false;
    }
	var dob =$('#dateOfBirth').val().trim();
	if(dob.length == 0){
		$('#dob_divID').addClass("has-error");
		check = false;
		return false;
	}
		
	if(dob.length> 0){
	 var age=moment(dob, "YYYY-MM-DD").fromNow().toString();
	
	    if (age.indexOf("hours")!=-1 || age.indexOf("day")!=-1  ||age.indexOf("days")!=-1 ||age.indexOf("in")!=-1) {
	    	$('#dob_divID').addClass("has-error");
	    	$('#dateOfBirth').val('');
			$('#dob_lab').hide();
			$('#dobErrorId').show();
			$('#dobErrorId').html('<font color="red" size="2">Age Should Be Greater Than Or Equal To 18 Years</font>');
			check = false;
			return false;
	    }else{
	    	 var actualAge= parseInt(age.replace(/[^0-9\.]/g, ''), 10);
	    	 if(actualAge<18){
	    		 $('#dob_divID').addClass("has-error");
	 	    	$('#dateOfBirth').val('');
	 			$('#dob_lab').hide();
	 			$('#dobErrorId').show();
	 			$('#dobErrorId').html('<font color="red" size="2">Age Should Be Greater Than Or Equal To 18 Years</font>');	 
	 			check = false;
	 			return false;
	    	 }
	    }
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	var flag = validateMobileNumber(mobile);
	return flag;
	//return true;
}


function validateMobileNumber(mobileNumber){
	$("#mobileErrorId").empty()
	 $("#mobileErrorId").attr("class","collapse");
	var flag=true;
	$("mobileErrorId").html('');	
	$.ajax({
		 url: 'ajax/validate-mobile?mobileNumber='+mobileNumber,
		  type: 'GET',
		  async:false,
		  dataType: "json",
		  success: function(response) {
			  if(response.code==200){
				  flag= true;
			  }if(response.code==409){
				  $('#mobile-input').addClass('has-error');
				  $("#mobile-number").val("");
				  $("#mobileErrorId").removeAttr("class");
				  $("#mobileErrorId").html('<font color="red" size="2">'+response.message+'</font>');
				  //$("#mobileErrorId").attr("class","collapse");
				  flag= false;
			  }
		  },
		  error: function(e) {
			  //alert("error: "+e);
			  console.log(e.message);
		  }
		});
	return flag;
}
function clrErrors(id){
	$(clrErrors).empty();
}


