function getCommissionDetails(agentCompanyId,agentId){
	$('#template_details').html('');
	$('#DataErrorId').html(	"");
	$.ajax({
        url : "ajax/getCommissionDetails",
        type : "POST",
        async: false,
		dataType: "json",
        data :'agentId='+agentId+'&agentCompanyId='+agentCompanyId,
        success : function(response) {
       	
       var valuess= response;
       
       
		if(valuess.length>0){
			$('#template_details').append('<tr><th align="center">ProductName</th><th align="center">TxnType</th><th align="center">HostCommission</th><th align="center">distributorCommission</th><th align="center">subdistributorCommission</th></tr>');
			$('#template_details').show();
			for(var i=0;i<valuess.length;i++)
			{


				$('#template_details').append('<tr><td align="center">'+valuess[i].productName+'</td><td align="center">'+valuess[i].txnType+'</td><td align="center">'+valuess[i].hostCommission+'</td><td align="center">'+valuess[i].distributorCommission+'</td><td align="center">'+valuess[i].subdistributorCommission+'</td></tr>');
			}
		}
		else{
			$('#template_details').hide();
			$('#DataErrorId').html(	"<font color='red'>No Data Found.</font>");
		}
       
       
       
       
        },
        error: function(data){
       	return false;
		}
 });
}

	function getDistributor(currentId,did,sdid){
		var select1 = $('#'+sdid);
		select1.find('option').remove();
		var value=$("#"+currentId.id).val();
		if(value.length>0){
			$.ajax({
				type:"POST",
				dataType:"json",
				url :'/securebanking/AdminUI/miscontroller/ajax/getDistributor',
				data :'accntId='+value,
				success:function(response)
				{
					if(response!=null){
						var select = $('#'+did);
						select.find('option').remove();
						 $('<option>').val('').text('').appendTo($('#'+did));
							$.each(response, function( index, value ) {
							    $('<option>').val(index).text(value).appendTo($('#'+did));
							   });
					}
				},
				error: function(){
					return false;
					}
			});
		}else{
			var select2 = $('#'+sdid);
			select2.find('option').remove();
			var select3 = $('#'+did);
			select3.find('option').remove();
		}
		}
	
		function getSubdistributor(currentId,hid,sdid){
			var select = $('#'+sdid);
			select.find('option').remove();
		var value=$("#"+currentId.id).val();
		if(value.length>0){
			$.ajax({
				type:"POST",
				dataType:"json",
				url :'/securebanking/AdminUI/miscontroller/ajax/getSubDistributor',
				data :'accntId='+value,
				success:function(response)
				{
					if(response!=null){
						 $('<option>').val('').text('').appendTo($('#'+sdid));
						$.each(response, function( index, value ) {
						    $('<option>').val(index).text(value).appendTo($('#'+sdid));
						   });
					}
				},
				error: function(){
					return false;
					}
			});
		}else{
			var select2 = $('#'+sdid);
			select2.find('option').remove();
		}
		}
		function validateMIS(event){
			var flag = true;
			var startDate =$('#startDate').val().trim();
			var endDate =$('#endDate').val().trim();
			if(startDate.length == 0 && endDate.length > 0 ){
				$('#startDateId').hide();
				$('#startDateErrorId').show();
				$('#startDateErrorId').html('<font color="red" size="2">Select From Date</font>');
				flag = false;
			}
			
			if(endDate.length == 0 && startDate.length > 0){
				$('#endDateId').hide();
				$('#endDateErrorId').show();
				$('#endDateErrorId').html('<font color="red" size="2">Select To Date</font>');
				flag = false;
			}
			
			if(Date.parse(endDate)< Date.parse(startDate)){
				$('#endDateId').hide();
				$('#endDateErrorId').show();
				$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
				$('#endDate').val('');
				flag = false;
			}
			
			if(!flag)
			{
				event.preventDefault();
			}
			return flag;
		}
		
		
		
		function validateWtWMIS(event){
			var flag = true;
			var startDate =$('#startDate').val().trim();
			var endDate =$('#endDate').val().trim();
			var custPho =$('#custPhnNo').val().trim();
			
			if(startDate.length == 0){
				$('#startDateId').hide();
				$('#startDateErrorId').show();
				$('#startDateErrorId').html('<font color="red" size="2">Select From Date</font>');
				flag = false;
			}
			
			if(endDate.length == 0 ){
				$('#endDateId').hide();
				$('#endDateErrorId').show();
				$('#endDateErrorId').html('<font color="red" size="2">Select To Date</font>');
				flag = false;
			}
			
			if(Date.parse(endDate)< Date.parse(startDate)){
				$('#endDateId').hide();
				$('#endDateErrorId').show();
				$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
				$('#endDate').val('');
				flag = false;
			}
			
			if(custPho.length == 0)
				{
				$('#div_bankNameId').addClass('has-error');
				$("#bankNameErrorId").text("Customer mobile number is mandatory.");
				showError("bankNameErrorId","label_bankNameId");
				flag = false;
				}
			
			if(custPho.length < 12)
			{
			$('#div_bankNameId').addClass('has-error');
			$("#bankNameErrorId").text("Please enter valid mobile number.");
			showError("bankNameErrorId","label_bankNameId");
			flag = false;
			}
			
			if(!flag)
			{
				event.preventDefault();
				return false;
			}else{
				$('#formDown').submit();
			}
			
			return flag;
		}

