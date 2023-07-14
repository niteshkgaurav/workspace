	function validateform(event)	
	 { 
		alert("fn called")
        		var check=true;
				var passCode = $("#passCode").val().trim();
				/*alert(passCode.length+"1")*/
				var passCategory  = $("#passCategory").val().trim();
				/*alert(passCategory.length+"2")*/
				var passDescription  = $("#passDescription").val().trim();
				/*alert(passDescription.length+"3")*/
				//var passCost  = $("#passCost").val().trim();
				//alert(passCost.length+"4")
				//var passCardCost  = $("#passCardCost").val().trim();
				//alert(passCardCost.length+"5")
		
				
				var passPeriod  = $("#passPeriod").val().trim();
				/*alert(passPeriod.length+"6")*/
				//var routeType  = $("#routeType").val().trim();
				//alert(routeType.length+"7")
				//var busTypesAllowed  = $("#busTypesAllowed").val().trim();
				//alert(busTypesAllowed.length+"8")
				//var routesAllowed  = $("#routesAllowed").val().trim();
				//alert(routesAllowed.length+"9")
				if (passCode.length==0) {
					/*alert("inside passcode")*/
					$('#DivIDbusPassCode').addClass('has-error');
					check=false;
					}
					
				if (passCategory.length==0) {
					/*alert(passCategory+"passCategory in")*/
					$('#DivIDbusPassCategory').addClass('has-error');
					check=false;
					}
				
				if (passDescription.length==0) {
					/*alert(passDescription+"passDescription in")*/
					$('#DivIDbusPassDescription').addClass('has-error');
					
					check=false;
					}
				
				/*if (passCost.length>3) {
					alert(passCost+"passCost in")
					$('#DivIdBusPassCost').addClass('has-error');
					check=false;
					}*/
				
               if (passPeriod.length==0) {
            	  /* alert(passPeriod+"passPeriod in")*/
					$('#DivIdBusPassFormCost').addClass('has-error');
					check=false;
					}
               
               
               /*if (passCardCost.length==0) {
            	   alert(passCardCost+"passCardCost in")
					$('#DivIdBusPassCardCost').addClass('has-error');
					check=false;
					}
               
               if (routeType.length==0) {
            	   alert(routeType+"routeType in")
					$('#DivIdBusPassRouteType').addClass('has-error');
					check=false;
					}
               
               if (busTypesAllowed.length==0) {
            	   alert(busTypesAllowed+"busTypesAllowed in")
					$('#DivIdBusTypesAllowed').addClass('has-error');
					check=false;
					}
               
               if (routesAllowed.length==0) {
            	   alert(routesAllowed+"routesAllowed in")
					$('#DivIdBusRoutesAllowed').addClass('has-error');
					check=false;
					}
             */
 /*   alert(check+"check")*/
				if(!check){
					event.preventDefault();
					
				}
	 }
