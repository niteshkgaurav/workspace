/***Ajax-call****/
var previousName=null;
function validateName(event,NameErrorId)
{
	
	var ProviderNameId = $('#lab_Name').val().trim();
	var LoginId =$()
      //alert(ProviderNameId);
	if(ProviderNameId!=previousName){
	var completeCheck=true;
	if(ProviderNameId.length!=0){
	$.ajax({
		url: 'ajax/checkNameDuplicacy',
		type:'POST',
		dataType: "json",
		data:'ProviderNameId='+ProviderNameId,
		success:function(response)
		{
			
			//alert(response);
			if(response==0)
			{
			
				/*$('#label_Name').hide();
				$('#NameErrorId').show();*/
				$('#label_Name').addClass('valid');
				$('#label_Name').html("<font color='green'>Name Available!!</font>");
				completeCheck = true;
			}else
			{
				/*$('#label_Name').hide();
				$('#NameErrorId').show();*/
				$('#label_Name').addClass('valid');
				$('#label_Name').html("<font color='red'> Name already exists!!</font>");
				$('#lab_Name').val('');
				completeCheck = false;
			}
		}
	});
}
}
}
/*****IDCreation validation****/
function validateIDCreationfrom(event){
	//alert("test")
	$("#after_edit_product_mess").html("");

	var loginStatusArr = new Array();
	
	var Name = $("#lab_Name").val().trim();
		
	var Description = $("#lab_Description").val().trim();

	var KYCDescriptor = $('#kycdescriptor').val();
	var Idtype=$('#idtype').val().trim();
	var Weight=$('#IdProofWeight').val().trim();
	//alert(KYCDescriptor);
		
	var completeCheck = true;
	if(Name.length==0)
	{
		completeCheck=false;
		/*$('#label_Name').hide();
		$('#NameErrorId').show();
		$("#NameErrorId").html("<font color='red'> Name can not be blank. </font>");*/
		$('#div_lab_Name').addClass('has-error');
	}
	
	if(Description.length==0)
	{
		completeCheck=false;
		/*$('#label_Description').hide();
		$('#descriptionErrorId').show();
		$("#descriptionErrorId").html("<font color='red'>Description cannot be blank. </font>");*/
		$('#div_lab_Description').addClass('has-error');
	}
	if(Weight.length==0)
	{
		completeCheck=false;
		document.getElementById("label_IdProofWeight").style.color = "red";
		$('#IdProofWeightId').addClass('has-error');
	}
	if(Idtype.length==0)
	{
		completeCheck=false;
		document.getElementById("lab_username1").style.color = "red";
		$('#idtypeID').addClass('has-error');
	}
	
	if(KYCDescriptor==0)
	{
		/*$('#label_kycdescriptor').hide();
		$('#descripErrorId').show();
		$('#descripErrorId').html("<font color='red'>Kindly select KYC Descriptor type. </font>");*/
		$('#div_kycdescriptor').addClass('has-error');
		completeCheck=false;
		
	}
	
	if(!(completeCheck))
	{	
		event.preventDefault();
		return false;
	}
		
	else
	{
		$('#loginStatus').val(loginStatusArr);
		$('#productCreationForm').submit();
	}
	
}

function forEdit(id,kycdescriptor,name,description,code,idtype,idProofWeight){
	
	
	$("#idtype").val(idtype);
	$("#IdProofWeight").val(idProofWeight);
	$('#username1').addClass('valid');
	$('#label_IdProofWeight').addClass('valid');
	$('#label_Name').addClass('valid');
	$('#label_Description').addClass('valid');
	$('#label_kycdescriptor').addClass('valid');
	$('#NameErrorId').html("");
	$('#descriptionErrorId').html("");
	$('#descripErrorId').html("");
	$('#hiddencodeid').val(code);
	$('#kycdescriptor').val(id);
	$('#lab_Name').val(name);
	$('#lab_Description').val(description);
	$('#manadatory_message').html('');
	$('#hiddenId').val(id);
	//$('#errorMessageId').html('');
	$('#addBtn').attr('value','Update');
	previousName=$('#lab_Name').val();
}

function abc(){
	//alert("hh");
	
	$("#manadatory_message").html("");
	
}

function adf(){
	
	$("#productSubTypeErrorId").html("");
}


