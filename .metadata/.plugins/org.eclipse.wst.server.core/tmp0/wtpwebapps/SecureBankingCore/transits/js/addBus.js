function removeAlertMsg(){
	$('#statusmsgId').html(" ");
}



	function validate(event)	
	 { 
        		var check=true;
				var busNumber = $("#busNumber").val();
				var busType = $("#busType").val();
				var seatingCapacity = $("#seatingCapacity").val();
				var fuelType = $("#fuelType").val();
				var manufacturedBy = $("#manufacturedBy").val();
				var depotAssigned = $("#depotAssigned").val();
				var busStatus =$("#busStatus").val();
				var standingCapacity=$("#standingCapacity").val();
			
				
				if (busNumber.length == 0) {
					$('#DivIDbusNumberId').addClass('has-error');
					check=false;
					}
					
				if (busType.length == 0) {
					//alert ("busType : " + busType);
					$('#DivIdbusTypeId').addClass('has-error');
					check=false;
					}
					
				if (seatingCapacity == 0) {
					//alert ("seatingCapacity : " + seatingCapacity);
					$('#DivIDseatingCapacity').addClass('has-error');
					check=false;
					}
				if (manufacturedBy.length == 0) {
					//alert ("manufacturedBy : " + manufacturedBy);
					$('#DivIdmanufacturedById').addClass('has-error');
					check=false;
					}
				if (fuelType.length == 0) {
					//alert ("fuelType : " + fuelType);
					$('#DivIdfuelTypeId').addClass('has-error');
					check=false;
					}
				if (standingCapacity.length == 0) {
					//alert ("fuelType : " + fuelType);
					$('#DivIDstandingCapacity').addClass('has-error');
					check=false;
					}
				if (depotAssigned.length == 0) {
					//alert ("depotAssigned : " + depotAssigned);
					$('#DivIdDepotAssignedId').addClass('has-error');
					check=false;
					}				
				if (busStatus.length == 0) {
					//alert ("busStatus : " + busStatus);
					$('#DivIdbusStatusId').addClass('has-error');
					check=false;
					}					
				if(!check){
					return false;
					}

		}
