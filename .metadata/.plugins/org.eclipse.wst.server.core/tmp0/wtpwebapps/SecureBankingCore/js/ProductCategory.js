 $( document ).ready(function() {
	 $("#newstatus").val('');
	 var afterAddmess='${message}';
    if(afterAddmess=='')
    	{
        	$("#after_addProduct_mess").hide();
        }
   // ***************** validate Method to Submit Product Category detail--------
    $("form").submit(function(){
    	
    	var productCatName=$("#lable_proCatName").val().trim();
    	var fullDesc=$("#lable_proCatFullDescription").val().trim();
    	var submitFlag=true;
    	if(productCatName.length<=0){
    		
    		$("#lable_proCatName1").hide();
    		$("#errmsgProCatName").show();
    		$("#errmsgProCatName").html("<p class='text-danger'> Product Category cannotbe blank !</p>");
    		$("#lable_proCatName").val('');
    		 submitFlag=false;
    	}
    	if(briefDesc.length<=0){
    		
    		$("#lable_newstatus").hide();
    		$("#errmsgProCatBriefDesc").show();
    		$("#errmsgProCatBriefDesc").html("<p class='text-danger'> Please Select Status</p>");
    		submitFlag= false;
    	}
    	if(fullDesc.length<=0){
    		
    		$("#lable_proCatFullDescription1").hide();
    		$("#errmsgProCatFullDesc").show();
    		$("#errmsgProCatFullDesc").html("<p class='text-danger'> Full Description cannot be blank !</p>");
    		submitFlag= false;
    		
    	}
    	
    	//****************validate product category on page if exist on page
    	if(productCatName!=null && productCatName!='' && productCatName.length>0){
    		
    	var flag=false;
        var newCatName= $('#lable_proCatName').val().trim();
    	$('#abc tr').each(function(row, tr){ 
    		       
    		        var d=$(tr).find('td:eq(0)').text(); 
    		        if(newCatName==d.trim()){
    		        	$("#lable_proCatName1").hide();
    		    		$("#errmsgProCatName").show();
    		        	$("#errmsgProCatName").html("<p class='text-danger'>"+d.trim()+" Already exist !</p>")
    		        	$("#lable_proCatName").val('');
    		        	
    		        	 flag=true;
    		        	return false;
    		        }
    		       
    	  });
    	  if(flag){
    		  return false;
    	  }
    	}
    	
    	
    	
    	if(submitFlag){
    		//do submit
    	}
    	else{
    		return false;
    	}
    	
    	}); 
    
   //*************** ajax call to server for updating product status by product categoryName and currentSatatusvalue
	 $('input[type="image"]').bind('click', function() { 
		var currentStatusvalue=$(this).val();
		var statusId = $(this).attr('id');
		var productCatName = $(this).closest('tr').find('td:first').text();
		
		$.ajax({
            type: "POST",
            url: "ajax/updatProductCatStatus",
			dataType: "json",
            data: {
                'productCatName':productCatName,
                'statusId':currentStatusvalue
               },
            success: function(data){
            	var messageArray = data.split(':');
            	var newupdatedStatus=messageArray[1]
            	if(newupdatedStatus=='true'){
            		$("#"+statusId).attr('src', '');
                	$("#"+statusId).removeAttr('src');
                	$('#'+statusId).attr('src','/securebanking/images/unlock.gif');
                	$( "#"+statusId ).attr( "title" ,'unlock');
                	$( "#"+statusId ).attr('value', newupdatedStatus);
               	}
            	else if(newupdatedStatus=='false'){
            		$("#"+statusId).attr('src', '');
                	$("#"+statusId).removeAttr('src');
                	$('#'+statusId).attr('src','/securebanking/images/lock.gif');
                	$( "#"+statusId ).attr("title" ,'lock');
                	$( "#"+statusId ).attr('value', newupdatedStatus);
            	}
            	$("#statusmess").html('');
            	$("#after_addProduct_mess").html('');
            	$("#after_edit_mess").html('');
            	$("#after_addProduct_mess").append(messageArray[0]);
               
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                $( "#after_edit_mess" ).html('');
                $( "#after_edit_mess" ).append('Ajax Exception');
            }
       });
		return false;
		 });

  return false;
 });  

function refresh()
{
	$("#lable_proCatName").val('');
	$("#lable_proCatBriefDescription").val('');
	$("#lable_proCatFullDescription").val('');
}



function productValidation(formName,event)
{
	
	var productCatName=$("#lable_proCatName").val().trim();
	var fullDesc=$("#lable_proCatFullDescription").val().trim();
	var newstatusName=$("#newstatus").val().trim();
	var submitFlag=true;
	if(productCatName.length<=0){
		$("#lable_proCatName1").hide();
		$("#errmsgProCatName").show(); 
		$("#errmsgProCatName").html("<p class='text-danger'> Product Category cannot be blank !</p>");
		 submitFlag=false;
	}
	if(fullDesc.length<=0){
		$("#lable_proCatFullDescription1").hide();
		$("#errmsgProCatFullDesc").show();
		$("#errmsgProCatFullDesc ").html("<p class='text-danger'> Full Description cannot be blank !</p>");
		
		submitFlag= false;
	}
	if(newstatusName.length==0){
		$('#divID_InventoryFor').addClass('has-error');
		submitFlag=false;
		
		
	}
	
	//****************validate product category on page if exist on page
	if(productCatName!=null && productCatName!='' && productCatName.length>0){
		
	var flag=false;
    var newCatName= $('#lable_proCatName').val().trim();
	$('#abc tr').each(function(row, tr){ 
		       
		        var d=$(tr).find('td:eq(0)').text(); 
		        if(newCatName==d.trim()){
		        	$("#lable_proCatName1").hide();
		    		$("#errmsgProCatName").show();
		        	$("#errmsgProCatName").html("<p class='text-danger'>"+d.trim()+" Already exist !</p>")
		        	 flag=true;
		        	return false;
		        }
	  });
	  if(flag){
		  return false;
	  }
	}
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