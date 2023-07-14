
function getCheckboxValues(event) {
	  var values = ['ussd','data','sms'];

	  for (var i=0; i=values.length; i++) {
	    if (values[i].checked) {
	      values.push(values[i].value);
	    }
	  }
	  
	  return values;
	}


$(document).ready( function ()
		{
	
	 var afterAddmess='${message}';
	    if(afterAddmess=='')
	    	{
	        $("#after_addProduct_mess").hide();
	       
	        }
	//********************** validate function on submit Product Creation
	 $("form").submit(function(){
	    	
	    	var productName=$("#lable_productName").val().trim();
	    	var briefDesc=$("#lable_productBriefDesc").val().trim();
	    	var fullDesc=$("#lable_productFullDesc").val().trim();
	    	var productByPrice=$("#lable_productByPrice").val().trim();
	    	var productSellPrice=$("#lable_productSellPrice").val().trim();

	    	var submitFlag=true;
	    	if(productName.length<=0){
	    		
	    		$("#errmsgProductName").html("<p class='text-danger'> Product Name cannot be blank </p>");
	    		 submitFlag=false;
	    	}
	    	if(briefDesc.length<=0){
	    		
	    		$("#errmsgByBriefDesc").html("<p class='text-danger'> Brief Description cannot be blank </p>");
	    		submitFlag= false;
	    	}
	    	if(fullDesc.length<=0){
	    		$("#errmsgByFullDesc").html("<p class='text-danger'> Full Description cannot be blank </p>");
	    		
	    	  submitFlag= false;
	    		
	    	}
	    	if(productByPrice.length<=0){
	    		$("#errmsgByPrice").html("<p class='text-danger'> Product Price cannot be blank </p>");
	    		submitFlag= false;
	    	}
	    	if(productSellPrice.length<=0){
	    		
	    		$("#errmsgSellPrice").html("<p class='text-danger'> Sell Price cannot be blank </p>");
	    		submitFlag= false;
	    	}
	    	
	    	
	    	//*************** check on client side Product is already Exist on page or not
	    	if(productName!=null || productName!='' || productName.length>0){
	    		
	    		var flag=false;
	    	  var newCatName= $('#lable_productName').val().trim();
	    	  if(newCatName!=''){
	    		 
	    		 $('#abc tr').each(function(row, tr){
	    		       
	    		        var d=$(tr).find('td:eq(0)').text() 
	    		        if(newCatName==d.trim()){
	    		             $("#errmsgProductName").html("<b>"+d.trim()+" Already exist !</p>");
	    		        	 flag=true;
	    		        	return false;
	    		        }
	    		       
	    	  });
	    	  if(flag){
	    		  return false;
	    	  }
	    	 }
	    	 
	    	 
	    	}
	    	
	    	if(submitFlag){
	    		//do submit
	    	}
	    	else{
	    		return false;
	    	}
	    	 
	    	}); 
		  //********************* on click image  update product status
		    $('input[type="image"]').bind('click', function() { 
					 
					var currentStatusvalue=$(this).val();
					var updatedStatus;
					
					var statusId = $(this).attr('id');
				    var productCatName = $(this).closest('tr').find('td:first').text();
					
					
				  var image=$(this).attr('src');
					
					$.ajax({
			            type: "POST",
			            url: "ajax/updatProductStatus",
						dataType: "json",
			            data: {
			                'productCatName':productCatName,
			                'statusId':currentStatusvalue
			             },
			            success: function(data){
			            	
			            	var messageArray = data.split(':');
			                var inputTitle = $( "#"+statusId ).attr( "title" )
			            	var newupdatedStatus=messageArray[1]
			            	if(newupdatedStatus=='0'){
			            		
			            		$("#"+statusId).attr('src', '');
			                	$("#"+statusId).removeAttr('src');
			                	$('#'+statusId).attr('src','/cug/images/unlock.gif');
			                	$( "#"+statusId ).attr( "title" ,'unlock');
			                	$( "#"+statusId ).attr('value', newupdatedStatus);
			                	
			            	}
			            	else if(newupdatedStatus=='1'){
			            		
			            		$("#"+statusId).attr('src', '');
			                	$("#"+statusId).removeAttr('src');
			                	$('#'+statusId).attr('src','/cug/images/lock.gif');
			                	$( "#"+statusId ).attr( "title" ,'lock');
			                	$( "#"+statusId ).attr('value', newupdatedStatus);
			            	}
			            	
			            	$( "#statusmess" ).html('');
			            	$("#after_addProduct_mess").html('');
			            	$("#after_edit_product_mess").html('');
			            	$( "#statusmess" ).append(messageArray[0]);
			                
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {
			                $( "#statusmess" ).html('');
			                $( "#statusmess" ).append('Ajex Exception');
			            }
			       });
					return false;
					 });
		  
		  
		  return false;
		  
		});
/*****Validation of product name*****/
function validateProductfrom(event,productId){
	//alert("test")
	$("#after_edit_product_mess").html("");
	//var contactName=$("#lab_contactPersonName_"+id).val();
	var loginStatusArr = new Array();
	
	var productName = $("#lable_productName").val().trim();
		
	var productDescription = $("#lable_productDescription").val().trim();

	var productType = $("#typeId").val();
	var commission = $("#commission").val().trim();
		
	var completeCheck = true;
	completeCheck=validateProductName(event,'productNameErrorId',productId);
	if(productName.length==0)
	{
		$("#lab_productName").hide();
		$("#productNameErrorId").show();
		$("#productNameErrorId").html("<font color=red>Product Name cannot be blank.</font>");
		completeCheck=false;
		//event.preventDefault();
		//return false;
		
		event.preventDefault();
	}
	//alert("after product name"+completeCheck);
	if(productDescription.length==0)
	{
		$("#lab_productDescription").hide();
		$("#productTypeErrorId").show();
		$("#productTypeErrorId").html("<font color=red>Description cannot be blank.</font> ");
		completeCheck=false;
		event.preventDefault();
	}
	if(commission.length==0)
	{
		$('#commission-input').addClass('has-error');
		completeCheck=false;
		event.preventDefault();
	}
	
	if(productType=='0')
	{
		$("#lable_typeId").hide();
		$("#productSubTypeErrorId").show();
		$("#productSubTypeErrorId").html("<font color=red>Kindly select type. </font>");
		completeCheck=false;
		event.preventDefault();
	}
	
	
	/*if(productType.length==0 || productType.length>8)
	{
		completeCheck=false;
		$("#productTypeErrorId").html("<p class='text-danger'>Product Type can't be blank.</p>");
	}
	if(productSubType.length==0 )
	{
		completeCheck=false;
		$("#productSubTypeErrorId").html("<p class='text-danger'>Product orientation can't be blank.</p>");
	}
	
*/	
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
function abc(){
	


	$("#manadatory_message").html("");
	
}
function adc(){
	$("#manadatory_message").html("");
}

function adf(){
	
	$("#productSubTypeErrorId").html("");
}

function fgh(){
	$("#manadatory_message").html("");
}
/***Ajax-call****/
function validateProductName(event,productNameErrorId,productId)
{
	var ProviderNameId = $('#lable_productName').val().trim();
	var completeCheck=true;
     if(ProviderNameId.length==0){
    	 $("#lab_productName").hide();
 		$("#productNameErrorId").show();
    	 $("#productNameErrorId").html("<p class='text-danger'>Product Name cannot be blank.</p>");
 		event.preventDefault();
 		return false;
 		completeCheck = false;
 	}
     else{
    	 var check = function(){	
	$.ajax({
		async: false,
		url: 'ajax/checkName',
		type:'POST',
		dataType: "json",
		data:'ProviderNameId='+ProviderNameId+'&productId='+productId,
		success:function(response)
		{
			//alert(response);
			if(response==0)
			{
				$("#lab_productName").hide();
				$("#productNameErrorId").show();
				$('#productNameErrorId').html("<p class='text-success'><b></p>");
				completeCheck = true;
			}else
			{
				$("#lab_productName").hide();
				$("#productNameErrorId").show();
				$('#productNameErrorId').html("<p class='text-danger'> Name already exists</p>");
//				$('#lable_productName').val('');
				event.preventDefault();
				return false;
				completeCheck = false;
			}
			
			
		}
	});
     
 return completeCheck;
     }();

     return check;
     	}
}

function jkl(){
	
	$("#after_edit_product_mess").html("");
}
function removeerrormessege(){

	$("#after_edit_product_mess").html("");
}

function spaceNotAllowed(){
	var productDescription = $("#lable_productDescription").val().trim();
	completeCheck=false;
	if(productDescription.length==0)
	{
		$("#lab_productDescription").hide();
		$("#productTypeErrorId").show();
		$("#productTypeErrorId").html("<p class='text-danger'>Description cannot be blank. </p>");
		completeCheck=false;
	}
}

function toggleform(id)
{
	$('#successMessageId').html('');
$("#"+id).toggle("slow",function(){
	
  
});

}

function clearmsgId(id){
	
	$("#"+id).html("");
}
