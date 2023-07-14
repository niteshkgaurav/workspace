/*<script type="text/javascript">
$(window).load(function(){
	$(document).ready(function() {
	    
	    $("#depotForm").validate({
	    	
	        rules: {
	            "depotName": {
	                required: true,
	                minlength: 5,
	                maxlength: 45
	            },
	            "depotAddress": {
	                required: true,
	                minlength: 5,
	                maxlength: 250
	            }	            
	        },
	        messages: {
	            "depotName": {
	                required: "Depot name is required!",
	                minlength: "Depot name must be at least 5 characters long"
	            },
	            "depotAddress": {
	                required: "Depot address is required!",
	                minlength: "Depot address must be at least 5 characters long"
	            }	            
	        },
	        submitHandler: function (form) {
	        	//alert("submitting form");
	        	form.submit(); // <-- this is default
	            // alert('valid form');
	        }
	    });
	    
	});
});
</script>
*/

function validateForm(event){
var check=true;
	var depotName=$('#depotName').val().trim();
	if(depotName.length==0){
		$('#DivIdDepotName').addClass('has-error');
				
				check = false;
			}
	var depotAddress=$('#depotAddress').val().trim();
	if(depotAddress.length==0){
		$('#DivIdDepotAddress').addClass('has-error');
				
				check = false;
			}
	
	var depotPincode=$('#depotPincode').val().trim();
	if(depotPincode.length==0){
		$('#DivIdDepotPinCode').addClass('has-error');
				
				check = false;
			}
	
	var areaId=$('#areaId').val().trim();
	if(areaId.length==0){
		$('#DivIdAreaId').addClass('has-error');
				
				check = false;
			}
	
	if(!check){
		event.preventDefault();
	}
		
}