function fetchAddress(){
	$('#buttonClickErrorId').html("");
	var pinCode = $('#pin').val().trim(); 
	if(pinCode.length==0){
		$('#lab_pinCodeErrorId').html("<b><font color='red'>Kindly enter PIN Code.</font></b>");
		$('#lab_pinCodeErrorId').addClass('valid');
		$('#lab_pinCodeErrorId').removeClass('collapse');
		return false;
	}
	else if((pinCode<=110000)&&(pinCode>=855118)){
		$('#lab_pinCodeErrorId').html("<b><font color='red'>Kindly enter valid PIN Code.</font></b>");
		return false;
	}

	
	if(pinCode.length<6){
		$('#lab_pinCodeErrorId').html("<b><font color='red'>PIN Code should be 6 digit long.</font></b>");
		return false;
	}
	else{
	if(pinCode.length>0){
	   $.ajax({
		   url: "ajax/fetchAddress",
		   type: "POST",
		   async:false,
		   dataType: "json",
		   data: "pinCode="+pinCode,
		   success:function(response){
			   var addressData = response;
			   
			   $('#addressSelectTableId').html("<tr><td align='center' width='100%' colspan='6'><b>Select Address</b></td></tr>");
			   $('#addressSelectTableId').append("<tr><td align='center'><table border='2' width='100%'  cellspacing='1' cellpadding='0' class='tableMain'>");
			   $('#addressSelectTableId').append("<tr><td width='10%'>Select</td><td width='25%'>Location</td><td width='15%'>PIN Code</td><td width='20%'>District</td><td width='15%'>State</td><td width='10%'>Country</td></tr>");
			   for(var i=0;i<addressData.length;i++){
				   $('#addressSelectTableId').append('<tr><td><input type="radio" id="addressSelectionId'+addressData[i].id+'" name="addressSelectionId" value='+addressData[i].id+' onchange="fillAddressDetail(\''+addressData[i].id+'\',\''+addressData[i].location+'\',\''+addressData[i].pincode+'\',\''+addressData[i].district+'\',\''+addressData[i].state+'\',\''+addressData[i].country+'\',\''+addressData[i].region+'\');"/></td><td>'+addressData[i].location+'</td><td>'+addressData[i].pincode+'</td><td>'+addressData[i].district+'</td><td>'+addressData[i].state+'</td><td>'+addressData[i].country+'</td></tr>');
			   }
			   $('#addressSelectTableId').append("</table></td></tr>");
			   $('#addressSelectDivIdPopup').dialog({
				   
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
		   }
	   });	
	}
	}
	}


function fillAddressDetail(id,location,pincode,district,state,country,region){
	if($('#addressSelectionId'+id).is(':checked')){
		$('#pinCode').val(pincode);
		$('#locality').val(location);
		$('#region').val(region);
		$('#district').val(district);
		$('#statess').val(state);
		$('#country').val(country);
		$('#pinaddressId').val(id);
	}
}

