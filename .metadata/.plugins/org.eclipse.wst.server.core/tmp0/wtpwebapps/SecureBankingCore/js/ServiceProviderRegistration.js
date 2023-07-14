var final=0;
function checkName(event,providerNameErrorId)
{
	var name = $("#providerName").val().trim();
	

if(name.length>0){
	$.ajax({
		url: 'ajax/checkName',
		type:'POST',
		data:'ProviderNameId='+name,
		dataType: "json",
		success:function(response)
		{
			if(response==0)
			{
			
				$("#label_providerName").hide();
				$("#providerNameErrorId").show();
				 $('#providerNameErrorId').addClass("valid");
				$('#providerNameErrorId').html("<p class='text-success'><b>Provider Available</p>");
				
			}else
			{
				$("#label_providerName").hide();
				$("#providerNameErrorId").show();
				 $('#providerNameErrorId').addClass("valid");
				$('#providerNameErrorId').html("<p class='text-danger'><b> Provider already exist or blank </p>");
				$('#providerName').val('');
			}
		}
	});

}
}


var check=true;
function providerFormValid(event){
	var loginStatusArr = new Array();
	var pName = $("#providerName").val().trim();
	var pDesc = $("#providerDescription").val();
	var cat = $("#lab_serviceCategoryId").val();
    var providerPhoneNumber = $("#providerPhoneNo").val().trim();
    var emailId = $("#providerEmailId").val();
    var countryCodeId = $("#countryCodeId").val();
	var completeCheck = true;
	
	if(pName.length==0)
	{
		completeCheck=false;

		$('#provider_name_errorId').addClass('has-error');
	
	}
//
  if(providerPhoneNumber.length==0){
	  completeCheck=false;
	  $('#provider_PhoneNoErrorId').addClass('has-error');
  }else if(providerPhoneNumber.length<10){
	  completeCheck=false;
	  $('#providerPhoneNoErrorId').addClass('valid');
	  $('#providerPhoneNoErrorId').html('<font color="red">Invalid Mobile Number</font>');
		 $('#label_providerPhoneNo').hide();
		 $('#providerPhoneNoErrorId').show();
  }
   var serviceCategories = $("#serviceCategories").val();
  if(serviceCategories.length==""){
	  completeCheck=false;
	  $('#serviceCategoriesDiv').addClass('has-error');
  }

  
	  if(countryCodeId.length==0||providerPhoneNumber==""){
	  completeCheck=false;
	  $('#country_CodeId1').addClass('has-error');
	  }
  
  
  if(emailId.length==0){
	  completeCheck=false;
	  $('#provider_EmailNoErrorId').addClass('has-error');
  }
	 
	if(!(completeCheck))
	{	
		event.preventDefault();
		
		return false;
	}
	else
	{
	
	    $('#loginStatus').val(loginStatusArr);
		
		//$('#paymentProviderform').submit();
		
	}
}





function checkLength(){
	 var cat = $("#lab_serviceCategoryId").val();
	 $("#divId").text("you have selected "+cat.length+"categories");
	 $("#categoryDivId").dialog({
			title: 'Kindly Confirm',
			  buttons: [{
			    text: 'Confirm',
			    
			    click: function() {
			    	final=1;
			    	$("#paymentProviderform").submit();
			       $(this).dialog('close');
			    }},{
			    text: 'Cancel',
			   
			    click: function() {
			    	final=0;
			       $(this).dialog('close');
			    }
			  }]
			});

		
		
		  return final;  
	 
	 
	}
	
	
	 
	
function createDialog(title, text, options) {
    return $("<div class='dialog' title='" + title + "'><p>" + text + "</p></div>")
    .dialog(options);
}

function checkCategories(){
	$("#success").html('');
	 var cat = $("#lab_serviceCategoryId").val();
	 $("#divId").html("<font color=red><b>"+cat.length+" categories selected</p>");
}
function checkCategoriesEdit(){
	 var cat = $("#serviceCategories").val();
	 $("#divId").html("<font color=red><b>"+cat.length+" categories selected</p>");
}

function AutoSearchByName(){
	
		var providerName= $("#lab_provider_nameAuto").val();
		
		$("#lab_provider_nameAuto").autocomplete({  
					
				    source : function(request, response) {
				    	
				  	  $.ajax({
				            url : "ajax/autoSearchByName",
				            type : "GET",
				            data :'providerName='+providerName, 
							dataType: "json",
				            success : function(data) {
				          	  response($.map(data, function (item) {
				          	        return item.split(",");
				          	    })); 
				            }
				    });
				}
				});	
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
function removemsg(errorId)
{	
	$('#'+errorId).html("");
}