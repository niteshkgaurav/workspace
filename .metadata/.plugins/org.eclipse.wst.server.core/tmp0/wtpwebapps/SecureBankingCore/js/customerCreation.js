function getStates(countryId,stateId){
	var countryId=$("#"+countryId).val();
	if(countryId.length==0){
		 $("#"+stateId).append(new Option("","-----Select---"));
		/*return false;*/
	}
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getStates',
		  type: 'POST',
		  dataType: "json",
		  data: 'countryId='+countryId,
		  success: function(data) {
			  obj=data.stateMap;
			  obj=JSON.stringify(obj);
			  var arr=getSortedArray(obj);
			  $('#'+stateId).find('option:not(:first)').remove();
			  for(var i=0;i<arr.length;i++){
				  var key=arr[i].key;
				  var value=arr[i].value;
				  $("#"+stateId).append(new Option(value,key));
			  }
		  },
		  error: function(e) {
			alert("error: "+e);
		  }
		});
}

function checkDuplicatePhoneNumbers(event,msgId)
{


	var phoneNumber = $('#customerMobileNumber').val();
	if(phoneNumber.length!=10 )
	{
	  $("#customerMobileNumberErrorId").html("<b><font color='red'>Contact number must be of 10 digits.</font></b>");
	  completeCheck = false;
	}
	else
		{
	$.ajax({
		url: 'ajax/checkDuplicatephoneNumber',
		type:'POST',
		dataType: "json",
		data:'phoneNumberId='+phoneNumber,
		success:function(response)
		{
			if(response==0)
			{
			
				$('#customerMobileNumberErrorId').html("<font color='green'><b>Mobile Number available!!</b></font>");
				completeCheck = true;
			}else
			{
				$('#customerMobileNumberErrorId').html("<font color='red'><b>Mobile Number already exists!!</b></font>");
				$('#customerMobileNumber').val('');
				completeCheck = false;
			}
		}
	});
		}
}
function selectAllFunc()
{
	$('#walletErrorId').html("");
	var i = 0;
	if($('#alldenominator_0').prop('checked'))
	{
		$('#walletTableId :checkbox').each(function(){
		if($(this).val()!=0){
			$('#denominator_'+$(this).val()).prop('checked','checked');
		}});
	}else
	{
		$('#walletTableId :checkbox').each(function(){
			if($(this).val()!=0)
			{	
				$('#denominator_'+$(this).val()).prop('checked',false);
			}});
	}
	
	
}

function validateCustomerRegistration(formName,event)
{
	var completeCheck = true;
	var walletsCount=0;
	var customerFirstName=$("#customerFirstName").val();
	var customerLastName=$("#customerLastName").val();
	var customerMobileNumber=$("#customerMobileNumber").val();
	/*var customerFirstName=$("#customerFirstName").val();*/
	if(customerFirstName==0){
		 $("#customerNameErrorId").html("<b><font color='red'>Kindly provide customer first name.</font></b>");
		 completeCheck = false;
	 }
	if(customerLastName==0){
		 $("#customerLastNameErrorId").html("<b><font color='red'>Kindly provide customer last name.</font></b>");
		 completeCheck = false;
	 }
	if(customerMobileNumber==0){
		 $("#customerMobileNumberErrorId").html("<b><font color='red'>Kindly provide customer contact number.</font></b>");
		 completeCheck = false;
	 }
	if(customerMobileNumber.length!=10 )
	{
		$("#customerMobileNumberErrorId").html("<b><font color='red'>Contact number must be of 10 digits.</font></b>");
		 completeCheck = false;
	}
	var walletsCount=$("input:checkbox:checked").length;
	/*$('#alldenominator_0 :checkbox:checked').each(function(i){
		walletsCount++;
	})*/
	//alert(walletsCount);
	if(walletsCount==0)
	{
			$('#walletErrorId').html("<b><font color='red'>Kindly select atleast 1 wallet.</font></b>");
			 completeCheck = false;
	}
	
	if(!completeCheck){
		return false;
	}
}
function validPhoneNumber() {
	var mobileId2=$("#mobileId2").val();
	var re = /^[\d]*$/;
	if (!re.test(mobileId2)) {
		 $("#label_customer_mobile_ErrorId").html("<b><font color='red'>Contact number must be numeric!.</font></b>");
		 $("#mobileId2").val("");
	}
	} 


function clearmsgId(msgId){
	$("#msgId").html("");
	
}

function clearfunc(alldenominator_0,walletErrorId){
	
	$('#walletErrorId').html("");
	$('#alldenominator_0').prop('checked', false);
	}



function fetchAddress(){
	var pinCode = $('#pinCode').val().trim(); 
	if(pinCode.length>0){
	   $.ajax({
		   url: "ajax/fetchAddress",
		   type: "POST",
		   dataType: "json",
		   data: "pinCode="+pinCode,
		   success:function(response){
			   if(response.length==0)
				   {
			   var addressData = response;
			   $('#addressSelectTableId').html("<tr><td align='center' width='100%' colspan='6'><b>Select Address</b></td></tr>");
			   $('#addressSelectTableId').append("<tr><td align='center'><table border='2' width='100%'  cellspacing='1' cellpadding='0' class='tableMain'>");
			   $('#addressSelectTableId').append("<tr><td width='10%'>Select</td><td width='25%'>Location</td><td width='15%'>Pincode</td><td width='20%'>District</td><td width='15%'>State</td><td width='10%'>Country</td></tr>");
			   for(var i=0;i<addressData.length;i++){
				   $('#addressSelectTableId').append('<tr><td><input type="radio" id="addressSelectionId'+addressData[i].id+'" name="addressSelectionId" value='+addressData[i].id+' onchange="fillAddressDetail(\''+addressData[i].id+'\',\''+addressData[i].location+'\',\''+addressData[i].pincode+'\',\''+addressData[i].district+'\',\''+addressData[i].state+'\',\''+addressData[i].country+'\',\''+addressData[i].region+'\');"/></td><td>'+addressData[i].location+'</td><td>'+addressData[i].pincode+'</td><td>'+addressData[i].district+'</td><td>'+addressData[i].state+'</td><td>'+addressData[i].country+'</td></tr>');
			   }
			   $('#addressSelectTableId').append("</table></td></tr>");
			   $('#addressSelectDivId').dialog({
					width: 525,
					height: 350,
					title: '\tSelect Address',
					buttons : {
						"OK" : function (response)
						{
							$(this).dialog("close");
						},
			   "CANCEL" : function(response){
				   $(this).dialog("close");
			   }
					}
			   });
		   }else{
			   $('#addressSelectTableId').html("<font color='red'><tr><td align='center' width='100%' colspan='6'><b>No Pincode Found</b></td></tr></font>");
		   }
		   }
	   });	
	}
}


function fillAddressDetail(id,location,pincode,district,state,country,region){
	if($('#addressSelectionId'+id).is(':checked')){
		$('#pinCode').val(pincode);
		$('#locality').val(location);
		$('#region').val(region);
		$('#district').val(district);
		$('#state').val(state);
		$('#country').val(country);
		$('#pinaddressId').val(id);
	}
}


	
