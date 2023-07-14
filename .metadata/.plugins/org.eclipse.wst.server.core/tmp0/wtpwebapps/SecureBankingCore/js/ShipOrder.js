function preview()
{
	
	var clone = $('#shiporder_table').clone();
	
	  $( "#popup" ).dialog({
		 
		  
	        open: function( event, ui ) {
	            $(this).html(clone);
	        }
	    }); 
	  

		
	return false;
	
}


function shippedData()
{
	
	var val= $("#select_type_id").val();
	
	 $('input:text').each(function(){
	       if( $("#select_type_id").val().length == 0)
	          alert("plz insert all text boxes")
	          
	    });
	
	        var values = "";
	        $("input[name=select_type_id]").each(function () {
	            values += $(this).val() + "\n";
	            
	        });

return false;
}

function validatestatus(event)
{
var statusId=$('#SoldstatusId').val();	
if(statusId=="0")
	{
	$("#Status_errorId").html("<font color='red'><b>please Select Status</b></font>");
	event.preventDefault();
	}


}
function statuserror(event)
{
	$("#Status_errorId").hide();



}

