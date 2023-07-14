function validateRole(event){
	var checkedvalues=[];
var	menuId=$("#menuId").val().trim();
$(".accountcheckBox:checked").each(function() {
	checkedvalues.push($(this).val());
});

if(menuId.length<=0){
	$("#divID_menu").addClass('has-error');
	event.preventDefault();
	return false;
}else{
	
	if(checkedvalues.length==0){
		$("#errorId").html("<font color=red>Select Checkbox</font>");
		event.preventDefault();
		return false;
	}

}


}

function listOfAccountGroup(id){
	
	var checkedvalues=[];
	$(".accountcheckBox:checked").each(function() {
		checkedvalues.push($(this).val());
	});
	
	for(var i=0;i<checkedvalues.length;i++){
		$("#accountcheckBox"+checkedvalues[i]).prop('checked', false);
	}
	

	
	// $("#menuTableId").load(location.href + " #menuTableId");
var menuId=$(id).val()
		 $.ajax({
	         url : "/securebanking/AdminUI/roleController/ajax/listOfAccountGroup",
	         type : "GET",
	         async: false,
	         data :'menuId='+menuId,
	         dataType: "json",
	         success : function(response) {
	        	for(var i=0;i<response.length;i++){
	        		$("#accountcheckBox"+response[i]).prop('checked', true);
	        	}
	         },
	         error: function(){
	        	return false;
				}
	  });
		
		
	
}
function emptySuccess(event,msgId){
	$("#"+msgId).html('');
}
