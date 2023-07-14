/*
 
  <script type="text/javascript">
 	$(window).load(function(){
 		$(document).ready(function() {
 		    
 		    $("#routeForm").validate({
 		    	
 		        rules: {
 		            "routeNumber": {
 		                required: true,
 		                minlength: 2
 		            },
 		            "routeDescription": {
 		                required: true,
 		                minlength: 3
 		            },
 		            "routeType": {
 		            	required: true
 		            },
 		           "depotId": {
		            	required: true
		            }, 
 		           "noOfStops": {
		            	required: true,
		            	digits: true
		            },
 		            
 		            "noOfBuses": {
 		            	required: true,
 		            	digits: true
 		            },
 		            "busFrequency": {
 		            	required: true,
 		            	digits: true
 		            },	
 		            "runningTime": {
 		            	required: true,
 		            	digits: true
 		            },	
 		            "distanceCovered": {
 		            	required: true,
 		            	digits: true
 		            }			            
 		        },
 		        messages: {
 		            "routeNumber": {
 		                required: "Route Number  is required!",
 		                minlength: "Route Number must be at least 2 characters long"
 		            },
 		            "routeDescription": {
 		                required: "Route Description is required",
 		                minlength: "Route Description can be at least 3 characters long"
 		            },
 		            "routeType": {
 		                required: "Select route type to proceed",
 		            },
 		            
 		           "depotId": {
		                required: "Select depotId type to proceed",
		            },
 		            
 		           "noOfStops": {
		                required: "No of Stop is required",
		                digits: "Provide a nemeric value"
		            },
 		            "noOfBuses": {
 		                required: "No of Buses is required",
 		                digits: "Provide a nemeric value"
 		            },
 		            "busFrequency": {
 		                required: "Provide bus frequency in minutes",
 		                digits: "Provide a nemeric value"
 		            },
 		            "runningTime": {
 		                required: "Providing average running time for the route",
 		                digits: "Provide a nemeric value"
 		            },
 		            "distanceCovered": {
 		                required: "Provide deistance covered by the route",
 		                digits: "Provide a nemeric value"
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
	var routeNumber=$('#routeNumber').val().trim();
	
	
	if (routeNumber.length == 0) {
		
		$('#div_routeNumber').addClass('has-error');
		check=false;
		}
	
	var routeDescription=$('#routeDescription').val().trim();

	if (routeDescription.length == 0) {
		
		$('#div_routeDescription').addClass('has-error');
		check=false;
		}
	 
	var srcStation=$('#srcStation').val().trim();
	if (srcStation.length == 0){
	$('#div_routeType').addClass('has-error');
	check=false;
	}
	
	var destStation=$('#destStation').val().trim();
	
	if (destStation.length == 0) {
		
		$('#div_destStation').addClass('has-error');
		check=false;
		}
	
	var noOfStops=$('#noOfStops').val().trim();
	
if (noOfStops.length == 0) {
		
		$('#div_noOfStops').addClass('has-error');
		check=false;
		}
	
	var noOfBuses=$('#noOfBuses').val().trim();
if (noOfBuses.length == 0) {
		
		$('#div_noOfBuses').addClass('has-error');
		check=false;
		}
	
	var busFrequency=$('#busFrequency').val().trim();
if (busFrequency.length == 0) {
		$('#div_busFrequency').addClass('has-error');
		check=false;
		}
	
	var runningTime=$('#runningTime').val().trim();
if (runningTime.length == 0) {
		
		$('#div_runningTime').addClass('has-error');
		check=false;
		}
	
	
	var distanceCovered=$('#distanceCovered').val().trim();
if (distanceCovered.length == 0) {
		$('#div_distanceCovered').addClass('has-error');
		check=false;
		}
if(!check){
	event.preventDefault();
}
	
}