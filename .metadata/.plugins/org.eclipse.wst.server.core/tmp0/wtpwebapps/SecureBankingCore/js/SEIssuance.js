function checkProduct(){
	$('#seTableId').hide();
	
}

function fillAddressDetail(id,location,pincode,district,state,country,region){
	if($('#addressSelectionId'+id).is(':checked')){
		$("#address").val(location);
		$('#pinCode').val(pincode);
		$('#locality').val(location);
		$('#region').val(region);
		$('#district').val(district);
		$('#state').val(state);
		$('#country').val(country);
		$('#pinaddressId').val(id);
		$('#addressSelectTableId').hide();
	}
}
function changePinCode(){
	var address=$('#address').val('');
	var locality=$('#locality').val('');
	var district=$('#district').val('');
	var country=$('#country').val('');
	var region=$('#region').val('');
	var state=$('#state').val('');
	$('#lab_pinCodeErrorId').html("");
	
}

function fetchAddress(){
	
	$('#buttonClickErrorId').html("");
	pinCode = $('#pinCode').val().trim(); 
//	alert(pinCode);
	if(pinCode.length==0)
	{
		$("#div_pinCode").addClass('has-error');
		completeCheck =false;

	}
	else if((pinCode<=110000)||(pinCode>=855118)){
		$('#lab_pinCodeErrorId').html("<font color='red'>Kindly enter valid PIN Code.</font>");
		return false;
	}


	if(pinCode.length<6){
		$('#lab_pinCodeErrorId').html("<font color='red'>PIN Code should be 6 digit long.</font>");
		return false;
	}
	else{
		if(pinCode.length>0){
			$('#addressSelectTableId').show();
			$.ajax({
				url: "ajax/fetchAddress",
				dataType:'json',
				type: "POST",
				dataType: 'json',
				data: "pinCode="+pinCode,
				success:function(response){
					var addressData = response ;
					if(addressData.length>0){
						$('#addressSelectTableId').html("<tr><td align='center' width='100%' colspan='6'>Select Address</td></tr>");
						$('#addressSelectTableId').append("<tr><td align='center'><table border='2' width='100%'  cellspacing='1' cellpadding='0' class='tableMain'>");
						$('#addressSelectTableId').append("<tr><td width='10%'>Select</td><td width='25%'>Location</td><td width='15%'>PIN Code</td><td width='20%'>District</td><td width='15%'>State</td><td width='10%'>Country</td></tr>");
						for(var i=0;i<addressData.length;i++){
							$('#addressSelectTableId').append('<tr><td><input type="radio" id="addressSelectionId'+addressData[i].id+'" name="addressSelectionId" value='+addressData[i].id+' onchange="fillAddressDetail(\''+addressData[i].id+'\',\''+addressData[i].location+'\',\''+addressData[i].pincode+'\',\''+addressData[i].district+'\',\''+addressData[i].state+'\',\''+addressData[i].country+'\',\''+addressData[i].region+'\');"/></td><td>'+addressData[i].location+'</td><td>'+addressData[i].pincode+'</td><td>'+addressData[i].district+'</td><td>'+addressData[i].state+'</td><td>'+addressData[i].country+'</td></tr>');
						}
						$('#addressSelectTableId').append("</table></td></tr>");
						
					}else{
						$('#lab_pinCodeErrorId').html("<font color='red'>Kindly enter valid PIN Code.</font>");
					}
				}
			});	

		}
	}
}


/*$('input:radio[name="radio"]').change(function(){
    alert($(this).val());
	if($(this).val()=="YES"){
		alert();
	}
});*/





function resendOtp(){
	var userType = $('#userType').val();
	var mobileNo = 0;
	if(userType==='CUSTOMER'){
		mobileNo = $('#custMobileNo').val();
	}else if(userType==='AGENT'){
		mobileNo = $('#agentMobileNo').val();
	}
	$.ajax({
		url :"ajax/deactivateSE",
		type :"POST",
		data :"mobileNo="+mobileNo+"&userType="+userType,
		dataType: "json",
		success:function(response){
			console.log(JSON.stringify(response));
			
		}
	});
}

function clearOTP(){
	$('#otpErrorId').html('');
}
function deactivateSE(event,exernNo){
	
	var userType = $('#userType').val();
	var mobileNo = 0;
	if(userType==='CUSTOMER'){
		mobileNo = $('#custMobileNo').val();
	}else if(userType==='AGENT'){
		mobileNo = $('#agentMobileNo').val();
	}
//	if(exernNo.length>0){
	$.ajax({
		url :"ajax/deactivateSE",
		type :"POST",
		async:true,
		dataType: "json",
		data :"mobileNo="+mobileNo+"&userType="+userType,
		success:function(response){
			
		}
	});
	$('#reasonTableId').html("<tr><td align='center' width='100%'><b>Reason for deactivation</b></td></tr>");
	$('#reasonTableId').append("<tr><td align='center' width='100%'><textarea  rows='4' cols='35' id='statereasonId' onclick='hidemessage()' placeholder='State reason'/></td></tr>");
	$('#reasonTableId').append("<tr><td align='center' width='100%'><div id='statereasonIdErrorId'></div></td></tr>");
	$('#reasonId').dialog({
		width: 375,
		height: 200,
		title: '\tReason for deactivation',
		buttons : {
			"OK" : function (response)
			{
				var otpId = response.id;
				var reason = $('#statereasonId').val().trim();
				if(reason.length>0){
				$(this).dialog("close");
				
				$('#otpTableId').append("<tr><td align='center' width='100%'><input type='text' id='otpId' placeholder='Enter OTP' onclick='clearOTP();'/></td></tr>");
				$('#otpTableId').append("<tr><td align='center' width='100%'><div id='otpErrorId'></div></td></tr>");
				$('#otpdivId').dialog({
					width: 400,
					height: 170,
					title: '\tEnter OTP',
					buttons : {
						"Confirm OTP" : function (){
							var otpIdVal = $('#otpId').val();
							var deactivateReason = $('#statereasonId').val();
						//	var externalNumber = $("#label_externalNoId").text();
							var deactivateStatus = $("#deactivateStatus").val();
								$.ajax({
									type : 'POST',
									url : 'ajax/confirmOtp',
									async:false,
									dataType: "json",
									data : 'confirmationOtp='+otpIdVal+'&deactivateReason='+deactivateReason+'&externalNumber='+exernNo+"&mobileNo="+mobileNo+"&productStatus="+deactivateStatus,
									success:function(response){
										if(response===true || response==='true'){
											$('#lab_statusId').html('Deactivated');
											 $("#deactivButtonId").prop("disabled",true);
											$('#otpdivId').dialog("close");
											/*$('#adrssTable').show();*/
										}else{
											$('#otpErrorId').html("<font color='red'>Enter correct OTP</font>");
										}
									}
								});
								
								
								
							},
							"Resend OTP" : function (){
								$.ajax({
									url :"ajax/deactivateSE",
									type :"POST",
									dataType: "json",
									data :"mobileNo="+mobileNo+"&userType="+userType,
									success:function(response){
									
									}
								});
							}
						}
					});
					}else{
						$('#statereasonIdErrorId').html("<font color='red'>Reason Can Not Be Blank</font>");
					}
				},
				"CANCEL" : function(){
					$(this).dialog("close");
				}
			}
		});
	//}
	
}

function validateCustomer(){
	$('#lab_hostNameId').html('');
	$('#lab_productId').html('');
	//$('#label_externalNoId').html('');
	$('#lab_statusId').html('');
	var userType = $('#userType').val();
	var productType =  $('#productType').val();
	var cust= $('#custId').val().trim();
	var externalNo= $('#externalNo').val().trim();
	var agent=$('#agentName').val().trim();
	
	$("#custMobileNoDivId").removeClass("has-error");
	$(".mvErrorDiv").removeClass("has-error");
	$(".svErrorDiv").removeClass("has-error");
	$("#custDivId").removeClass("has-error");
	$("#divID_externalNo").removeClass("has-error");
	$("#divID_datepicker").removeClass("has-error");
	$("#agentval").removeClass("has-error");
	
	
	/*
	if(userType==0)
	{
		$('#usertypeDivId').addClass("has-error");
		return false;
	}
	
	if(agent==0)
	{
		$('#agentval').addClass("has-error");
		 document.getElementById("label_agentName").style.color = "red";
		
		return false;
	
	}
	if(productType ==='0'){
		$('#productTypedivId').addClass("has-error");
		return false;
	}
         if(cust.length==0)
        	 {
        	 $('#custDivId').addClass("has-error");
        	 return false;
        	 }
         if(externalNo.length==0)
        	 {
        	 $('#divID_externalNo').addClass("has-error");
        	 return false;
        	 }
    var  datepick =$('#datepick').val().trim();
       if(datepick.length==0)
    	   {
    	   $('#divID_datepicker').addClass("has-error");
    	   return false;
    	   }
	else*/
	$("#productTypedivId").removeClass("has-error");
	if($("#productType").val()=="0" ){
		$('#productTypedivId').addClass("has-error");
		return false;
	} 
		if(userType==='CUSTOMER'){
			
		var custMobileNo = $('#custMobileNo').val().trim();
		var productType =  $('#productType').val().trim();
		if(custMobileNo==""){
			$('#custMobileNoDivId').addClass("has-error");
			return false;
		} if(custMobileNo.length > 0 && custMobileNo.length != 10 && custMobileNo.length != 12 ){
			$('#lab_custMobilenumberErrorId').show();
			$('#lab_custMobilenumberErrorId').addClass('valid');
			$('#lab_custMobilenumberErrorId').html("<font color='red'>Customer Mobile Number should be 10 or 12 digit number</font>");
			return false;
		} 
		
		if($("#externalNo").val()==""){
			$("#divID_externalNo").addClass("has-error");
			return false;
		}
		if($(".masterVersionDiv").is(":hidden")==false && ($("#masterVersion").val()=="" || $("#masterVersion").val()==null) ){
			$(".mvErrorDiv").addClass("has-error");
			return false;
		}
		if($(".subVersionDiv").is(":hidden")==false && ($("#hostSubVersionId").val()=="" ||$("#hostSubVersionId").val()==null) ){
			$(".svErrorDiv").addClass("has-error");
			return false;
		}
		if($("#custId").val()==""){
			//$("#custDivId").addClass("has-error");
			//return false;
		}
		if($("#datepick").val()==""){
			$("#divID_datepicker").addClass("has-error");
			return false;
		}
		//return true;
				if(productType != '0'){
			var seIssuanceData = {};
			seIssuanceData.firstName=$("#firstName").val();
			seIssuanceData.lastName=$("#lastName").val();
			seIssuanceData.email=$("#emailId").val();
			seIssuanceData.pinCode=$("#pinCode").val();
			seIssuanceData.address=$("#address").val();
			seIssuanceData.locality=$("#locality").val();
			seIssuanceData.region=$("#region").val();
			seIssuanceData.district=$("#district").val();
			seIssuanceData.state=$("#state").val();
			seIssuanceData.country=$("#country").val();
			
			seIssuanceData.custMobileNo=custMobileNo;
			seIssuanceData.productType=productType;
			seIssuanceData.userType=userType;
			//data:'custMobileNo='+custMobileNo+'&productType='+productType+'&userType='+userType,
		//	$('#seTableId').hide();
		$.ajax({
				type:'POST',
				contentType: "application/json",
				url:'ajax/validateCustomerOrAgent?custMobileNo='+custMobileNo+'&productType='+productType+'&userType='+userType,
				data:JSON.stringify(seIssuanceData),
				success:function(response){
					
					var responseEntityList = [] 
					responseEntityList=response.responseEntityList;
					
					
					if($.isEmptyObject(responseEntityList)==false)
					{
						$('#adrssTable').hide();
						$('#emptyId').hide();
						$('#seTableId').show();
						/*$('#lab_hostNameId').html('');
						$('#lab_productId').html('');
						$('#label_externalNoId').html('');
						$('#lab_statusId').html('');*/
						//$('#lab_hostNameId').append(response.hostName);
						//$('#lab_productId').append(response.productName);
						//$('#label_externalNoId').append(response.externalNumber);
						//$('#lab_statusId').append(response.status);
						$('#firstName').val(responseEntityList[0].firstName);
						$('#lastName').val(responseEntityList[0].lastName);
						$('#pinCode').val(responseEntityList[0].pinCode);
						$('#address').val(responseEntityList[0].address);
						$('#locality').val(responseEntityList[0].locality);
						$('#region').val(responseEntityList[0].region);
						$('#district').val(responseEntityList[0].district);
						$('#state').val(responseEntityList[0].state);
						$('#country').val(responseEntityList[0].country);
						$('#datepick').val(responseEntityList[0].dob);
						$('#email').val(responseEntityList[0].email);
						$('#pinaddressId').val(responseEntityList[0].pinAddressId);
						$('#custId').val(responseEntityList[0].custId);
						$('#emailId').val(responseEntityList[0].email);
						$("#seTablebodyId").empty();
						var tbody = '';
						var localDate = new Date();
						//ts.toLocaleDateString()
						var productStatusUtil=[];
						productStatusUtil=response.productStatusUtil;
						var option ='';
						
						
						for (var i = 0; i < productStatusUtil.length; i++) {
							option=option+'<option value='+productStatusUtil[i]+'>'+productStatusUtil[i]+'</option>';
						}
						var select='<select id="deactivateStatus" name="productType" class="selecttag">'+option+'</select>';
						
						
						for (var i = 0; i < responseEntityList.length; i++) {
							 localDate = new Date(responseEntityList[i].createdOn);

							
							tbody=tbody+'<tr>'+
							'<td align="center" id="LAB_ISSUED_BY">'+responseEntityList[i].hostName+'</td>'+
							'<td align="center" id="LAB_PRODUCT_TYPE">'+responseEntityList[i].productName+'</td>'+
							'<td align="center" id="label_externalNo">'+responseEntityList[i].externalNumber+'</td>'+
							'<td align="center" id="LAB_ISSUED_ON">'+localDate.toLocaleDateString()+'</td>'+
							'<td align="center">'+
							select+
							/*'<>'*/
							'<input type="button" value="Deactivate" id="deactivButtonId" onclick="deactivateSE(event,'+responseEntityList[i].externalNumber+');" />'+
							'</td>';
						}
						$("#seTablebodyId").append(tbody);
						if(response.status==true){
							
							//return true;
						//}
						//return response.status; 
						var fileName = response.fileName;
						var idProofId = response.idProofId;
						var userIdNo = response.userIdNo;
						var i =0;
						if(fileName != null) {
							for(i=0;i<fileName.length;i++)
							{
								$('#idProofCheck'+idProofId[i]).prop('checked',true);
								$('#fileNameId'+idProofId[i]).html(fileName[i]);
								$('#idNo'+idProofId[i]).val(userIdNo[i]);
								$('#uploadButton'+idProofId[i]).prop('disabled',false);
								$('#removeButton'+idProofId[i]).prop('disabled',false);
								$('#idNo'+idProofId[i]).attr('disabled',false);
								//i++
							}
						}
						if(i>0){
							$('#kycTableId').show();
						}
						$('#emptyId').html('');
						return false;
					}else if(response.status){
						
						 $( "#seIssuanceFormId" ).submit();
					}else{
						return false;
					}
					}
					if(response.status==true){
						$( "#seIssuanceFormId" ).submit();
						 return true;
					}
					else{
						return false;
					}
					
					
				}
		
			});
		}
	}	
	else if(userType==='AGENT'){
		var agentName = $('#agentName').val();
		var agentMobileNo = $('#agentMobileNo').val();
		
		if($("#externalNo").val()==""){
			$("#divID_externalNo").addClass("has-error");
			return false;
		}
		if(agentName==='0'){
			
			$("#agentval").addClass("has-error");
			//$('#agentval').html("<font color='red'>Kindly Select Agent Name</font>");
			return false;
		}
		
		if($("#externalNo").val()==""){
			$("#divID_externalNo").addClass("has-error");
			return false;
		}
		if($(".masterVersionDiv").is(":hidden")==false && ($("#masterVersion").val()==""||$("#masterVersion").val()==null)) {
			$(".mvErrorDiv").addClass("has-error");
			return false;
		}
		if($(".subVersionDiv").is(":hidden")==false && ($("#hostSubVersionId").val()=="" || $("#hostSubVersionId").val()==null) ){
			$(".svErrorDiv").addClass("has-error");
			return false;
		}
		if($("#custId").val()==""){
			//$("#custDivId").addClass("has-error");
			//return false;
		}
		if($("#datepick").val()==""){
			$("#divID_datepicker").addClass("has-error");
			return false;
		}
		

		if(productType != '0'){
			$('#seTableId').hide();
			$.ajax({
				type:'POST',
				url:'ajax/validateCustomerOrAgent',
				dataType: "json",
				data:'custMobileNo='+agentMobileNo+'&productType='+productType+'&userType='+userType,
				success:function(response){
					if(response.hostName!=null)
					{
				
						
						$('#adrssTable').hide();
						$('#seTableId').show();
						$('#LAB_ISSUED_BY').append(response.hostName);
						$('#LAB_PRODUCT_TYPE').append(response.productName);
						$('#label_externalNo').append(response.externalNumber);
						$('#lab_statusId').append(response.status);
						$('#firstName').val(response.firstName);
						$('#lastName').val(response.lastName);
						$('#pinCode').val(response.pinCode);
						$('#address').val(response.address);
						$('#locality').val(response.locality);
						$('#region').val(response.region);
						$('#district').val(response.district);
						$('#state').val(response.state);
						$('#country').val(response.country);
						$('#datepick').val(response.dob);
						$('#email').val(response.email);
						$('#pinaddressId').val(response.pinAddressId);
						$('#custId').val(response.custId);
						$('#emailId').val(response.email);
						var fileName = response.fileName;
						var idProofId = response.idProofId;
						var userIdNo = response.userIdNo;
						for(var i=0;i<fileName.length;i++)
						{
							$('#idProofCheck'+idProofId[i]).prop('checked',true);
							$('#fileNameId'+idProofId[i]).html(fileName[i]);
							$('#idNo'+idProofId[i]).val(userIdNo[i]);
							$('#uploadButton'+idProofId[i]).prop('disabled',false);
							$('#removeButton'+idProofId[i]).prop('disabled',false);
							$('#idNo'+idProofId[i]).attr('disabled',false);
						}
						$('#emptyId').html('');
					}else if(response.custId!=null){
						$( "#seIssuanceFormId" ).submit();	
					
					}
						else{
							
							$( "#seIssuanceFormId" ).submit();
						}
				}
			});
		}
	}
       return false;
}



function hideFunction(){
	$('#firstName').val("");
	$('#lastName').val("");
	$('#pinCode').val("");
	$('#address').val("");
	$('#locality').val("");
	$('#region').val("");
	$('#district').val("");
	$('#state').val("");
	$('#country').val("");
	$('#datepick').val("");
	$('#email').val("");
	$('#pinaddressId').val("");
	$('#custId').val("");
	$('#emailId').val("");
	$('#kycTableId').hide();
	$('#adrssTable').hide();
}
function switchFunction()
{
	
	$('#lab_productErrorId').html("");
	var userType  = $('#userType').val();
	/*var userType  = $('#userType').val();
	if(userType==='0'){
		$('#customerId').hide();
		//$('#agentId').hide();
		$(".agentDiv").hide();
		$('#custMobileNo').val('');
		$('#agentName').val(0);
		$('#seTableId').hide();
		$('#agentMobileNo').val('');
		$('#agentUserType').val('');
		$('#emptyId').html('');
		$('#productType').val(0);
		hideFunction();
		$('#lab_custMobilenumberErrorId').html("");
		$('#agentNameErrorId').html("");
	}
	else */
	if(userType==='AGENT'){
		$('#customerId').hide();
		$('#seTableId').hide();
		//$('#agentId').show();
		$(".agentDiv").show();
		$('#custMobileNo').val('');
		$('#emptyId').html('');
		$('#productType').val(0);
		hideFunction();
		$('#lab_custMobilenumberErrorId').html("");
	}else if(userType==='CUSTOMER'){
		$('#customerId').show();
		//$('#agentId').hide();
		$(".agentDiv").hide();
		$('#agentName').val(0);
		$('#productType').val(0);
		$('#seTableId').hide();
		$('#agentMobileNo').val('');
		$('#agentUserType').val('');
		$('#emptyId').html('');
		hideFunction();
		$('#agentNameErrorId').html("");
	}
}

function getAgentData()
{
	var agentId = $('#agentName').val();
	$('#seTableId').hide();
	$('#adrssTable').hide();
	
	if(agentId.length!=0)
	{$('#label_agentMobileNo').addClass('valid');
	$('#label_agentUserType').addClass('valid');}
	//$('#emptyId').hide();	
		$.ajax({
			type:"POST",
			url:"ajax/agentData",
			data:"agentId="+agentId,
			dataType: "json",
			success:function(response){
				$('#agentMobileNo').val(response[0]);
				$('#agentUserType').val(response[1]);
				$('#agentMobileNo').attr('readonly',true);
				$('#agentUserType').attr('readonly',true);
			}
		});
}

/*$("#externalNo").on('change',function(){
	alert(21);
});*/


function getMvAndSubVersion()
{
		var externalNo = $('#externalNo').val();
		if(externalNo.length==0){
			$('#divID_externalNo').addClass('has-error');
			//$('#label_externalNoErrorId').html("<font color='red'>Kindly fill External No></font>");
		}else if(externalNo.length!=15){
			
			//$('#label_externalNo').hide();
			$('#label_externalNo').addClass('valid');
			$('#externalNo').val('')
			
			$('#label_externalNoErrorId').html("<font color='red'>External No should be 15 digits number</font>");
		}else{
			$.ajax({
				type : "POST",
				url  : "ajax/mvAndSubVersion",
				data : "externalNo="+externalNo,
				dataType: "json",
				success:function(response){

					var status = response.responseEntity.message;
					var hostSubVersions = response.responseEntity.hostSubVersion;
					
					
					if(status!=null)
						{
						
						$('#label_externalNoErrorId').html("<font color='red'>"+status+"</font>");
						
						$('#externalNo').val('');
						
						
						}
				if(response.responseEntity.productId!=null && response.responseEntity.productId!=undefined){
					
					
					$( "#productType" ).val(response.responseEntity.productId);
					if(response.productType!=undefined&&response.productType.masterVirsion!=undefined&&response.productType.masterVirsion==true){
						
						getMasterVersionByProductId();
						if(response.responseEntity.mvId!=null){
							$( "#masterVersion" ).val(response.responseEntity.mvId);
							getHostSubVersionByMasterVersionId();
							//$( "#masterVersion option:selected" ).text(response.masterVersion);
						}
					}else{
						$(".masterVersionDiv").hide();
						$(".subVersionDiv").hide();
					}
						
					/*	if(response.hostSubVersion!=null){
							$( "#hostSubVersionId option:selected" ).text(response.masterVersion);
						}*/
						
					
				}
				
				
				
				
			/*		else if(response.hostSubVersion!=null){
					if(response.masterVersion!=null)
					{
						$('#label_externalNoErrorId').html('');
						$('#masterVersion').val(response.masterVersion);
						$('#lab_masterVersion').addClass("valid");
						$('#masterVersion').attr('readonly', true);
						var select = $('#subVersion');                        
						select.find('option').remove();  
						var hostSubVersions = response.hostSubVersion;
						$('#label_subVersion').addClass("valid");
						
						$.each(hostSubVersions,function(key, value) 
						{
						    select.append('<option value=' + key + '>' + value + '</option>');
						});
						$('#mgmtId').val(response.mgmtId);
					}else{
						$('#externalNo').val('');
						$('#label_externalNoErrorId').html("<font color='red'>External No. "+externalNo+" does not exist</font>");
					}
					}else{
						$('#externalNo').val('');
						$('#label_externalNoErrorId').html("<font color='red'>External No. "+externalNo+" is already used</font>");
					}*/
				}
			});
		}
}
var walletData = [];
function showWallet(){
	if($('#subVersion').val()!=0)
	{
		var subVersion = $('#subVersion').val(); 
		$.ajax({
			url:"ajax/fetchWallets",
			type:"POST",
			data:"subVersion="+subVersion,
			dataType: "json",
			success:function(response){
				if(response!=null){
				$('#walletTableId').show();
				var walletTable = $('#walletTable');
				var i = 0;
				$.each(response,function(key,value){
					walletTable.append('<tr><td>'+value[0]+'</td><td>'+value[1]+'</td></tr>');
					walletData[i++] = value[2];
				});
				$('#walletIds').val(walletData);
				}else{
					$('#walletTableId').hide();
				}
			}
		});	
	}else{
		$('#walletTableId').hide();
	}
}
var showopencheck = 0;
var keys = new Array();
var i=0;

function showKycTable(event)
{
	showopencheck++;
	$('#kycTableId').show();
}

function hideKycTable(){
	showopencheck--;
	$('#kycTableId').hide();
}

function fetchKycDescData(key){
	
	if($('#idProofCheck'+key).prop('checked'))
	{
		$('#uploadButton'+key).prop('disabled',false);
		$('#removeButton'+key).prop('disabled',false);
		$('#idNo'+key).attr('disabled',false);
	}else{
		$('#uploadButton'+key).val('');
		$('#uploadButton'+key).prop('disabled',true);
		$('#removeButton'+key).prop('disabled',true);
		$('#idNo'+key).val('');
		$('#idNoErrorId'+key).html('');
		$('#uploadButtonErrorId'+key).html('');
		$('#idNo'+key).attr('disabled',true);
		$('#fileNameId'+key).html('');
	}
}



function checkDocumentStatus(event) {
//	console.log(showopencheck);
	if(showopencheck > 0) {
		var keysize = keys.length;
//		console.log(keysize);
		if(keysize != 0) {
			return validateSEIssuance(event);
		}
	} else {
		return validateSEIssuance(event);
	}
//	return false;
}

function addKeys(key){
	keys.push('idProofCheck'+key);
}

function removeKeys(key) {
	var pos = keys.indexOf(key);
	keys = keys.splice(pos,1);
}


function removeFunction(key){
	$('#uploadButton'+key).val('');
	$('#fileNameId'+key).html('');
	$('#photoSpan'+key).val('');
	$('#photoSpan'+key).html('No file ...lected.');
}

function validateSEIssuance(event){
	
	var flag = true;
	var userType = $('#userType').val();
	var productType =  $('#productType').val();


	 if(userType==='CUSTOMER'){
		var custMobileNo = $('#custMobileNo').val().trim();
		var productType =  $('#productType').val();
		if(custMobileNo.length==0){
			$('#lab_custMobilenumberErrorId').html("<font color='red'>Kindly fill Customer Mobile Number</font>");
			flag = false;
		}
	}
	else if(userType==='AGENT'){
		var agentName = $('#agentName').val();
		var agentMobileNo = $('#agentMobileNo').val();
		if(agentName==='0'){
			$('#agentNameErrorId').html("<font color='red'>Kindly Select Agent Name</font>");
			flag = false;
		}
	}
	var externalNo = $('#externalNo').val();
	if(externalNo.length==0){
		$('#divID_externalNo').addClass('has-error');
		
		flag = false;
	}else if(externalNo.length!=15){
		
		//$('#label_externalNo').hide();
		$('#divID_externalNo').addClass('has-error');
		$('#label_externalNoErrorId').html("<font color='red'>External No should be 15 digits number</font>");
		flag = false;
	}
	var dob = $('#datepick').val();
	if(dob.length==0){
		$('#divID_datepicker').addClass('has-error');
		flag = false;
	}
	if(showopencheck>0){
		$("#kycTableId input:checkbox").each(function() {
			if($('#idProofCheck'+$(this).val()).prop('checked')){
				if($('#uploadButton'+$(this).val()).val().length<=0){
					$('#uploadButtonErrorId'+$(this).val()).html("<font color='red'>Kindly upload File</font>");
					flag = false;
				}
				if($('#idNo'+$(this).val()).val()==""){
					$('#idNoErrorId'+$(this).val()).html("<font color='red'>Kindly fill id number.</font>");
					flag = false;
					event.preventDefault();
					return false;
					
				}
				if($('#idNo'+$(this).val()).val().length>5||$('#idNo'+$(this).val()).val().length>20){
					$('#idNoErrorId'+$(this).val()).html("<font color='red'>Id number length should be upto 20 digit.</font>");
					flag = false;
				}
			}
		});
	}
	if(!flag){
		event.preventDefault();
		return false;
	}
	return true;
}
function emailValidation1(event,emailId,lab_Email_IdErrorId){
	
	var email = $('#emailId').val().trim();
	if(email.length>0){
		flag = emailValidation(event,'emailId','lab_Email_IdErrorId');
	}
		}

function ZeroCheck(){
	userType = $('#userType').val();
	if(userType==='CUSTOMER'){
		mobileNo = $('#custMobileNo').val();
	}/*else if(userType==='AGENT'){
		mobileNo = $('#agentMobileNo').val();
	}*/
	var zeroCheck=mobileNo[0];
	if(zeroCheck==0){
		$('#custMobileNo').val('');
		$('#lab_custMobilenumberErrorId').html("<font color='red'>Enter valid Mobile Number</font>");
	}
}

function checkDate(dateText){
	$('#lab_dobErrorId').html('');
}

function validateCus(event){
	/*var input = document.getElementById('custMobileNo');

	input.onkeydown = function() {*/
	    var key = event.keyCode;
	    var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
	    if( asciiValue == 8 || asciiValue == 127 || asciiValue == 46 )
	    {	$('#emptyId').hide();
	    	hideFunction();
	    }
//	}; 
  
}


function clearMasterVersion(){
	$('#masterVersion').val('');
}

function  hidemessage()
{
	
$('#statereasonIdErrorId').html("");
}

function showAddressTable()
{
	
$('#adrssTable').toggle();


}

function getMasterVersionByProductId(){
	$("#masterVersion").empty();
	$("#hostSubVersionId").empty();
	var productId = $("#productType").val();
	if(productId==undefined || productId=="0"){
		$('#productTypedivId').addClass('has-error');
		return false;
	}
	
	$.ajax({
		url:"ajax/get-master-version-for-product?productId="+productId,
		type:"GET",
		async:false,
		dataType: "json",
		success:function(response){
			var responseCode = response.responseCode;
			switch(responseCode)
			{
			case 200:
				manageMasterversionData(response);
				break;
			case 419:
				//open pop up for invalidating session.
				alert(response.responseMessage);
				break;
			case 500:
				
				alert(response.responseMessage);
				break;
			default:
				
				break;
			
			}
		}
	});	
}



function getHostSubVersionByMasterVersionId(){
	$("#hostSubVersionId").empty();
	var mvId = $("#masterVersion").val();
	if(mvId==undefined || mvId==""){
		$('#productTypedivId').addClass('has-error');
		return false;
	}
	$.ajax({
		url:"ajax/get-host-subversion?masterVersionId="+mvId,
		type:"GET",
		async:false,
		dataType: "json",
		success:function(response){
			var responseCode = response.responseCode;
			switch(responseCode)
			{
			case 200:
				managehostSubVersion(response);
				break;
			case 419:
				//open pop up for invalidating session.
				alert(response.responseMessage);
				break;
			case 500:
				
				alert(response.responseMessage);
				break;
			default:
				
				break;
			
			}
		}
	});	
}

function manageMasterversionData(response){
	$("#masterVersion").empty();
	var masterVersionsArray = [];
	var productType = {};
	productType=response.productType;
	if(productType.masterVirsion){
		//FOR TIME BEING REPLACE IT WHEN NEEDED
		$(".masterVersionDiv").hide();
		$(".subVersionDiv").hide();
		//UNCOMMET IT WHEN WE NEED TO SHOW MASTER VERSION AND HOST SUB VERSION
	//	$(".masterVersionDiv").show();
	//	$(".subVersionDiv").show();
		masterVersionsArray=response.responseEntityList;
		var masterVersionOptions='';//'<option value=""></option>'; 
		if(masterVersionsArray!=undefined){
			for (var i = 0; i < masterVersionsArray.length; i++) {
				masterVersionOptions=masterVersionOptions+'<option value='+masterVersionsArray[i].id+'>'+masterVersionsArray[i].name+'</option>';
			}
			
		}if(masterVersionOptions==''){
			$(".masterVersionDiv").hide();
			$(".subVersionDiv").hide();
		}else{
			$("#masterVersion").append(masterVersionOptions);
			getHostSubVersionByMasterVersionId();
		}
		
	}else{
		$(".masterVersionDiv").hide();
		$(".subVersionDiv").hide();
	}
	
}


function managehostSubVersion(response){
	$("#hostSubVersionId").empty();
	var hostSubVersionArray = [];
	hostSubVersionArray=response.responseEntityList;
		var masterVersionOptions='';//'<option value=""></option>'; 
		if(hostSubVersionArray!=undefined){
			for (var i = 0; i < hostSubVersionArray.length; i++) {
				masterVersionOptions=masterVersionOptions+'<option value='+hostSubVersionArray[i].id+'>'+hostSubVersionArray[i].name+'</option>';
			}
		}
		$("#hostSubVersionId").append(masterVersionOptions);
}
/**
 * get subscriber details
 */

function getSubscriberDetailsByMobileNumber(){
	//$("#hostSubVersionId").empty();
	var mobileNumber = $("#custMobileNo").val();
	/*if(mvId==undefined || mvId==""){
		$('#productTypedivId').addClass('has-error');
		return false;
	}*/
	$.ajax({
		url:"ajax/get-subscriber-details?mobileNo="+mobileNumber,
		type:"GET",
		async:false,
		dataType: "json",
		success:function(response){
			var responseCode = response.responseCode;
			switch(responseCode)
			{
			case 200:
				manageUserDetails(response);
				//managehostSubVersion(response);
				
				break;
			case 419:
				//open pop up for invalidating session.
				alert(response.responseMessage);
				break;
			case 500:
				
				alert(response.responseMessage);
				break;
			default:
				
				break;
			
			}
		}
	});	
}

function manageUserDetails(response){
	var responseEntity ={};
	responseEntity=response.responseEntity;
if(responseEntity.name!=null && responseEntity.name!=undefined&&responseEntity.name!==""){
	$("#firstName").val(responseEntity.name);
	$("#firstName").attr('readonly',true);
	}else{
		$("#firstName").removeAttr('readonly');
	}
if(responseEntity.lastName!=null && responseEntity.lastName!=undefined&&responseEntity.lastName!==""){
	$("#lastName").val(responseEntity.lastName);
	$("#lastName").attr('readonly',true);
	}else{
		$("#lastName").removeAttr('readonly');
	}
if(responseEntity.pinCode!=null && responseEntity.pinCode!=undefined&&responseEntity.pinCode!==""){
	$("#pinCode").val(responseEntity.pinCode);
	$("#pinCode").attr('readonly',true);
	}else{
		$("#pinCode").removeAttr('readonly');
	}
if(responseEntity.address!=null && responseEntity.address!=undefined&&responseEntity.address!==""){
	$("#address").val(responseEntity.address);
	$("#address").attr('readonly',true);
	}else{
		$("#address").removeAttr('readonly');
	}
if(responseEntity.locality!=null && responseEntity.locality!=undefined&&responseEntity.locality!==""){
	$("#locality").val(responseEntity.locality);
	$("#locality").attr('readonly',true);
	}else{
		$("#locality").removeAttr('readonly');
	}
if(responseEntity.region!=null && responseEntity.region!=undefined&&responseEntity.region!==""){
	$("#region").val(responseEntity.region);
	$("#region").attr('readonly',true);
	}else{
		$("#region").removeAttr('readonly');
	}
if(responseEntity.district!=null && responseEntity.district!=undefined&&responseEntity.district!==""){
	$("#district").val(responseEntity.district);
	$("#district").attr('readonly',true);
	}else{
		$("#district").removeAttr('readonly');
	}
if(responseEntity.state!=null && responseEntity.state!=undefined&&responseEntity.state!==""){
	$("#state").val(responseEntity.state);
	$("#state").attr('readonly',true);
	}else{
		$("#state").removeAttr('readonly');
	}
if(responseEntity.country!=null && responseEntity.country!=undefined&&responseEntity.country!==""){
	$("#country").val(responseEntity.country);
	$("#country").attr('readonly',true);
	}else{
		$("#country").removeAttr('readonly');
	}
if(responseEntity.email!=null && responseEntity.email!=undefined&&responseEntity.email!==""){
	$("#emailId").val(responseEntity.email);
	$("#emailId").attr('readonly',true);
	}else{
		$("#emailId").removeAttr('readonly');
	}
if(responseEntity.dateOfBirth!=null && responseEntity.dateOfBirth!=undefined&&responseEntity.dateOfBirth!==""){
	$("#datepick").val(responseEntity.dateOfBirth);
	$("#datepick").attr('readonly',true);
	}else{
		$("#datepick").removeAttr('readonly');
	}
	
}

var idProofsRequired=function() {
    if (this.value == 'YES') {
    	$("#submittedKycTableDiv").show();
    	if(validateUserDetails()){
    		
    		idProofsAjaxCall();
    		$("#submittedKycTableDiv").show();
    	}else{
    		$("#no").prop('checked',true)
    		$("#kycTableId").hide();
    		$("#submittedKycTableDiv").hide();
    		
    		return false;
    	}
    }
    else{
    	$("#submittedKycTableDiv").hide();
    }
    
}

$(document).ready(function(){
	//switchFunction();
	$(".agentDiv").hide();
	$('input[type=radio][name=radio]').change(idProofsRequired);
	/**REMOVE IF NEEDED */
	$(".masterVersionDiv").hide();
	$(".subVersionDiv").hide();
	$("#submittedKycTableDiv").hide();
	
});




function validateUserDetails(){
	/*$('#lab_hostNameId').html('');
	$('#lab_productId').html('');
	$('#label_externalNoId').html('');
	$('#lab_statusId').html('');*/
	var userType = $('#userType').val();
	var productType =  $('#productType').val();
	var cust= $('#custId').val().trim();
	var externalNo= $('#externalNo').val().trim();
	var agent=$('#agentName').val().trim();
	
	$("#custMobileNoDivId").removeClass("has-error");
	$(".mvErrorDiv").removeClass("has-error");
	$(".svErrorDiv").removeClass("has-error");
	$("#custDivId").removeClass("has-error");
	$("#divID_externalNo").removeClass("has-error");
	$("#divID_datepicker").removeClass("has-error");
	$("#agentval").removeClass("has-error");
	$("#productTypedivId").removeClass("has-error");
	if($("#productType").val()=="0" ){
		$('#productTypedivId').addClass("has-error");
		return false;
	} 
		if(userType==='CUSTOMER'){
			
		var custMobileNo = $('#custMobileNo').val().trim();
		var productType =  $('#productType').val().trim();
		if(custMobileNo==""){
			$('#custMobileNoDivId').addClass("has-error");
			return false;
		} if(custMobileNo.length > 0 && custMobileNo.length != 10 && custMobileNo.length != 12 ){
			$('#lab_custMobilenumberErrorId').show();
			$('#lab_custMobilenumberErrorId').addClass('valid');
			$('#lab_custMobilenumberErrorId').html("<font color='red'>Customer Mobile Number should be 10 or 12 digit number</font>");
			return false;
		} 
		
		if($("#externalNo").val()==""){
			$("#divID_externalNo").addClass("has-error");
			return false;
		}
		if($(".masterVersionDiv").is(":hidden")==false && ($("#masterVersion").val()=="" || $("#masterVersion").val()==null) ){
			$(".mvErrorDiv").addClass("has-error");
			return false;
		}
		if($(".subVersionDiv").is(":hidden")==false && ($("#hostSubVersionId").val()=="" ||$("#hostSubVersionId").val()==null) ){
			$(".svErrorDiv").addClass("has-error");
			return false;
		}
		if($("#custId").val()==""){
			//$("#custDivId").addClass("has-error");
			//return false;
		}
		if($("#datepick").val()==""){
			$("#divID_datepicker").addClass("has-error");
			return false;
		}
	}
		else if(userType==='AGENT'){
			var agentName = $('#agentName').val();
			var agentMobileNo = $('#agentMobileNo').val();
			
			if($("#externalNo").val()==""){
				$("#divID_externalNo").addClass("has-error");
				return false;
			}
			if(agentName==='0'){
				
				$("#agentval").addClass("has-error");
				//$('#agentval').html("<font color='red'>Kindly Select Agent Name</font>");
				return false;
			}
			
			if($("#externalNo").val()==""){
				$("#divID_externalNo").addClass("has-error");
				return false;
			}
			if($(".masterVersionDiv").is(":hidden")==false && ($("#masterVersion").val()==""||$("#masterVersion").val()==null)) {
				$(".mvErrorDiv").addClass("has-error");
				return false;
			}
			if($(".subVersionDiv").is(":hidden")==false && ($("#hostSubVersionId").val()=="" || $("#hostSubVersionId").val()==null) ){
				$(".svErrorDiv").addClass("has-error");
				return false;
			}
			if($("#custId").val()==""){
				//$("#custDivId").addClass("has-error");
				//return false;
			}
			if($("#datepick").val()==""){
				$("#divID_datepicker").addClass("has-error");
				return false;
			}
		}
		return true;
} 


function idProofsAjaxCall(){
	var mobileNumber =$('#custMobileNo').val();
	$.ajax({
		url:"ajax/get-subscriber-id-proof?mobileNo="+mobileNumber,
		//url:"ajax/get-subscriber-id-proof?mobileNo=9871769685",
		type:"GET",
		async:false,
		dataType: "json",
		success:function(response){
			var responseCode = response.responseCode;
			switch(responseCode)
			{
			case 200:
				manageIdproofs(response);
				//managehostSubVersion(response);
				
				break;
			case 419:
				//open pop up for invalidating session.
				alert(response.responseMessage);
				break;
			case 500:
				
				alert(response.responseMessage);
				break;
			default:
				
				break;
			
			}
		}
	});	
}

function manageIdproofs(response){
	var idproofsList=[];
	idproofsList=response.responseEntity.kycDescriptorDataList;
	if($.isEmptyObject(idproofsList)==false){
		
		$("#idproofsIdsList").empty();
		var myvar ='';
		for (var i = 0; i < idproofsList.length; i++) {
			 myvar = myvar+'<tr>'+
			'<td align="left"><input type="checkbox"' +
			'id="idProofCheck'+idproofsList[i].id+'" name="idProofCheck"'+
			' value="'+idproofsList[i].id+'"'+
			' onclick="addKeys('+idproofsList[i].id+');fetchKycDescData('+idproofsList[i].id+')" /> '+idproofsList[i].name+'</td>'+
			/*'<td>'+idproofsList[i].maxBalance+'</td>'+
			'<td>'+idproofsList[i].perTxnLimit+'</td>'+
			'<td>'+idproofsList[i].dailyTxnLimit+'</td>'+
			'<td>'+idproofsList[i].monthlyTxnLimit+'</td>'+*/
			'<td><input type="text" id="idNo'+idproofsList[i].id+'"'+
			' onkeypress="blockSpecialCharIdNumber(event,\''+'idNoErrorId'+idproofsList[i].id+'\')" '+
			' onchange="countId(this, \''+'idNoErrorId'+idproofsList[i].id+'\');" '+
			' type="text" name="idNo" placeholder="ID Number"'+
			' style="width:96%"'+
			' disabled="true"  /></td>'+
			'<td align="center">'+
			'<input  class="myfileclass"'+
			' name="file" type="file"'+
			' name="uploadButton'+idproofsList[i].id+'"'+
			' id="uploadButton'+idproofsList[i].id+'" value="Upload"'+
			' onchange="checkMultipleImageSizeAndExtension(\''+'uploadButton'+idproofsList[i].id+'\');"'+
			' disabled="true" />'+
			'<input align="left"'+
			' style="width: 40%" id="removeButton'+idproofsList[i].id+'"'+
			' type="button" value="Remove"'+
			' onclick="removeFunction('+idproofsList[i].id+');"'+
			' disabled="disabled" />	'+
			'</td>'+
			'</tr>'+'<tr>'+
						'<td><div id="idProofCheckErrorId'+idproofsList[i].id+'"></div></td>'+
						'<td><div id="idNoErrorId'+idproofsList[i].id+'"></div></td>'+
						'<td><div id="uploadButtonErrorId'+idproofsList[i].id+'"></div></td>'
					+'</tr>';
		}
		
		
		$("#idproofsIdsList").append(myvar);
		
		var kycDeailsWithStatus = [];
		kycDeailsWithStatus=(response.responseEntity==undefined||response.responseEntity.pendingkycDescriptorDataList==undefined)?[]:response.responseEntity.pendingkycDescriptorDataList;
		var rows ='';
			
			
			
			;
		$("#kycWithStatus").empty();
		for (var i = 0; i < kycDeailsWithStatus.length; i++) {
		//	var varifiedDate = kycDeailsWithStatus[i].verifiedOnDate;
			//alert(kycDeailsWithStatus[i].verifiedOnDate);
			var img = kycDeailsWithStatus[i].url;
			rows=rows+"<tr>"+
			
			"<td>"+kycDeailsWithStatus[i].kycName+"</td>"+
			"<td><a href="+img+" target='_blank'>"+kycDeailsWithStatus[i].kycDocumentName+"</a></td>"+
			//'<td>'+kycDeailsWithStatus[i].kycDocumentName+'</td>'+
			"<td>"+kycDeailsWithStatus[i].status+"</td>"+
			"<td>"+kycDeailsWithStatus[i].creationDate+"</td>"+
			"<td>"+kycDeailsWithStatus[i].createdBy+"</td>"+
			"<td>"+kycDeailsWithStatus[i].verifiedOnDate+"</td>"+
			"<td>"+(kycDeailsWithStatus[i].verifiedBy==null?"N/A":kycDeailsWithStatus[i].verifiedBy)+"</td>"+
			"<td>"+(kycDeailsWithStatus[i].comment==null?"N/A":kycDeailsWithStatus[i].comment)+"</td>"+
			"</tr>";
		}
		$("#kycWithStatus").append(rows);
	}
}

function countId(obj, lbl) {
	var id = obj.value;
	if(id.length > 20) {
		$('#'+lbl).html("<font color='red'>Id number length should be upto 20 digit.</font>");
		$('#submitButtonId').prop("disabled", true);
		return;
	} else {
		$('#'+lbl).html("");
		$('#submitButtonId').prop("disabled", false);
		return;
	}
	if(obj.value.trim() == "") {
		totalIds--;
	} 
}
