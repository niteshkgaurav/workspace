$(document).ready( function ()
		{
		 
		//************************* Validate Method on submit Product Category Edit Page
			 $("form").submit(function(){
			    	
			    	var productCatName=$("#lable_proCatName").val().trim();
			    	var briefDesc=$("#lable_proCatBriefDescription").val().trim();
			    	var fullDesc=$("#lable_proCatFullDescription").val().trim();
			    	var submitFlag=true;
			    	if(productCatName.length<=0){
			    		
			    		$("#errmsgProCatName").html("<b><font color='red'> Product Category cannot be blank !</font></b>");
			    		 submitFlag=false;
			    	}
			    	if(briefDesc.length<=0){
			    		
			    		$("#errmsgProCatBriefDesc").html("<b><font color='red'> Brief Description cannot be blank !</font></b>");
			    		submitFlag= false;
			    	}
			    	if(fullDesc.length<=0){
			    		$("#errmsgProCatFullDesc").html("<b><font color='red'> Full Description cannot be blank !</font></b>");
			    		
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
function productValidation(formName,event)
{
	var productCatName=$("#lable_proCatName").val().trim();
	var fullDesc=$("#lable_proCatFullDescription").val().trim();
	var submitFlag=true;
	if(productCatName.length<=0){
		$("#lable_proCatName1").hide();
		$("#errmsgProCatName").show();
		 $("#errmsgProCatName").html("<font color='red'> Product Category cannot be blank !</font>");
		 submitFlag=false;
	}
	if(fullDesc.length<=0){
		$("#lable_proCatFullDescription1").hide();
		$("#errmsgProCatFullDesc").show();
		$("#errmsgProCatFullDesc").html("<font color='red'> Full Description cannot be blank !</font>");
		submitFlag= false;
	}
	
	//****************validate product category on page if exist on page
	
	if(submitFlag){
		formName.submit();
	}
	else{
		event.preventDefault();
	}
}

function refreshSuccess(successMessageId){
	$("#statusmess").html('');
	$("#after_edit_mess").html('');
	$("#after_addProduct_mess").html('');
}




