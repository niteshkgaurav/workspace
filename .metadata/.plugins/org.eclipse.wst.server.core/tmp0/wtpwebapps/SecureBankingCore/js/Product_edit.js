
$(document).ready( function ()
		{
	        
               //***********Page  validate function On Product Edit 
			 $("form").submit(function(){
			    	
			    	var productName=$("#lable_productName").val().trim();
			    	var briefDesc=$("#lable_productBriefDesc").val().trim();
			    	var fullDesc=$("#lable_productFullDesc").val().trim();
			    	var productByPrice=$("#lable_productByPrice").val().trim();
			    	var productSellPrice=$("#lable_productSellPrice").val().trim();
			    	
			    	var submitFlag=true;
			    	if(productName.length<=0){
			    		
			    		$("#errmsgProductName").html("<p class='text-danger'> Product Name cannot be blank !</p>");
			    		 submitFlag=false;
			    	}
			    	if(briefDesc.length<=0){
			    		
			    		$("#errmsgByBriefDesc").html("<p class='text-danger'> Brief Description cannot be blank !</p>");
			    		submitFlag= false;
			    	}
			    	if(fullDesc.length<=0){
			    		$("#errmsgByFullDesc").html("<p class='text-danger'> Full Description cannot be blank !</p>");
			    		
			    	  submitFlag= false;
			    		
			    	}
			    	if(productByPrice.length<=0){
			    		$("#errmsgByPrice").html("<p class='text-danger'> Product Price cannot be blank !</p>");
			    		submitFlag= false;
			    	}
			    	if(productSellPrice.length<=0){
			    		
			    		$("#errmsgSellPrice").html("<p class='text-danger'> Sell Price cannot be blank !</p>");
			    		submitFlag= false;
			    	}
			    	
			    	if(submitFlag){
			    		//do submit
			    	}
			    	else{
			    		return false;
			    	}
			    	
			   }); 
	 
	 	});

function validateProductfrom(){
	
	//var contactName=$("#lab_contactPersonName_"+id).val();
	var loginStatusArr = new Array();
	
	var productName = $("#lable_productName").val();
		
	var productType = $("#lable_productType").val();
		
	var productSubType = $("#lable_productSubType").val();
		
	var productImage1 = $("#lable_productImage1").val();
	var commission = $("#commission").val().trim();
	var completeCheck = true;
	if(productName.length<1)
	{
		completeCheck=false;
		$("#lab_productName").hide();
		$("#productNameErrorId").show();
		$("#productNameErrorId").html("<p class='text-danger'>Product Name can't be blank or One Character. !</p>");
	}
	if(productType.length==0 || productType.length>8)
	{
		completeCheck=false;
		$("#lab_productDescription").hide();
		$("#productTypeErrorId").show();
		$("#productTypeErrorId").html("<p class='text-danger'>Product Type can't be blank.!</p>");
	}
	if(commission.length==0)
	{
		$('#commission-input').addClass('has-error');
		completeCheck=false;
	}
	if(productSubType.length==0 )
	{
		completeCheck=false;
		$("#lable_typeId").hide();
		$("#productSubTypeErrorId").show();
		$("#productSubTypeErrorId").html("<p class='text-danger'>Product SubType can't be blank.!</p>");
	}
	
	if(!(completeCheck))
	{	
		event.preventDefault();
		return false;
	}
		
	else
	{
		$('#loginStatus').val(loginStatusArr);
		$('#productCreationForm1').submit();
	}
	
}
function validateProductEditfrom1(event){
	//alert("test validateProductEditfrom1")
	$("#after_edit_product_mess").html("");
	
	var loginStatusArr = new Array();
	
	var productName = $("#lable_productName").val();
		
	var productDescription = $("#lable_productDescription").val();

	var productType = $("#typeId").val();
		
	var completeCheck = true;
	if(productName.length==0)
	{
		completeCheck=false;
		$("#lab_productName").hide();
		$("#productNameErrorId").show();
		$("#productNameErrorId").html("<p class='text-danger'>Product Name cannot be blank. </p>");
	}
	
	if(productDescription.length==0)
	{
		completeCheck=false;
		$("#lab_productDescription").hide();
		$("#productTypeErrorId").show();
		$("#productTypeErrorId").html("<p class='text-danger'>Description cannot be blank. </p>");
	}
	
	if(productType=='0')
	{
		completeCheck=false;
		$("#lable_typeId").hide();
		$("#productSubTypeErrorId").show();
		$("#productSubTypeErrorId").html("<p class='text-danger'>Kindly select type. </p>");
	}
	
	if(!(completeCheck))
	{	
		event.preventDefault();
		return false;
	}
		
	else
	{
		$('#loginStatus').val(loginStatusArr);
		$('#productCreationForm1').submit();
	}
	
}
/*****Ajax-call for product name****/
function validateProductName(event,productNameErrorId)
{
	alert("call in");
	var ProviderNameId = $('#lable_productName').val();
	alert(ProviderNameId);
	if(ProviderNameId==0){
		$("#errmsgProductName").html("<p class='text-danger'>Product name cannot be null.</p>");
	}
      
	var completeCheck=true;
	$.ajax({
		url: 'ajax/checkProductName',
		type:'POST',
		data:'ProviderNameId='+ProviderNameId,
		dataType: "json",
		success:function(response)
		{
			
			//alert(response);
			if(response==0)
			{
			
				$('#errmsgProductName').html("<p class='text-danger'><b>Name Available!!</p>");
				completeCheck = true;
			}else
			{
				$('#errmsgProductName').html("<p class='text-danger'> Name already exists!!</p>");
				$('#lable_productName').val('');
				completeCheck = false;
			}
		}
	});
}
function abc(){
	

	$("#errmsgProductName").html("");
	
}
function adc(){
	
	$("#productTypeErrorId").html("");
}
function adf(){
	$("#productSubTypeErrorId").html("");
}

function removeErrorMessage(){
	$("#productNameErrorId").html("");
}

function removeDescErrorMessage(){
	$("#productTypeErrorId").html("");
}