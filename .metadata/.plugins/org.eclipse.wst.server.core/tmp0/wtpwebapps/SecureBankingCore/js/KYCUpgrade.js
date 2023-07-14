var checkIdCount=0;
var kycTableIdHtml;
function clearFields() {
//	console.log("Clear All Fields");
	$('#tableDataId').hide();
	$('#lab_Phone_no').val('');
	$('#lab_Product_Name').val('');
	$('#lab_Master_Version').val('');
	$('#lab_Host_Sub_Version').val('');
	$('#custId').val('');
	$('#externalNo').val('');
	$('#lab_KYC_Upgrade_Name').val('');
	$('#lab_KYC_Upgrade_LastName').val('');
	$('#dateOfBirth').val('');
	$('#pinCode').val('');
	$('#address').val('');
	$('#locality').val('');
	$('#region').val('');
	$('#district').val('');
	$('#state').val('');
	$('#country').val('');
	$('#email').val('');
	kycTableIdHtml = $('#kycTableId').html();
	console.log(kycTableIdHtml);
//	kycTableIdHtml = document.getElementById('kycTableId').innerHTML;
	$("#kycTableId input:checkbox").each(function() {
		$('#valueCheck'+$(this).val()).prop('checked', false);
	});
	
//	$('#manadatory_message').html('');
	
	
}
function removeErrorMsg(){
	//alert("you");
//	$("#phErrorId").html("");
	$('#label_phoneNo').show();
	$('#phErrorId').hide();
}

function removeEmailError(errorId, labelId) {
	$("#"+errorId).hide();
	$("#"+labelId).show();
	
	
}



function onlyAlphabets(event, errorId, labelId, textId) {
//	alert("OnlyAlphabets Calling");
	
	var asciiValue = event.which || event.keycode;
	asciiValue = eval(asciiValue);
	if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) || asciiValue == 8 ){
		$('#'+errorId).html("");
		$('#'+labelId).show();
	} else {
		f = 2;
		$('#'+labelId).hide();
		$('#'+errorId).addClass("valid");
		$('#'+errorId).show();
		$('#'+textId).val('');
		$('#'+errorId).html("<font color='red'>Only alphabets are allowed </font>");
		
		event.preventDefault();
		return false;
	}
	if(asciiValue == 13) {
		$('#'+errorId).hide();
		$('#'+labelId).show();
		$('#'+textId).val('');

		event.preventDefault();
		return false;
	}
	return true;
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

var kycIds = new Array();
var totalIds = 0;
/***Ajax-call****/
function getKycUpgrade(event,phErrorId,label_phoneNo)
{
//	$("#kycTableId").find("tr:gt(0)").remove();
	var number = $("#lab_Phone_no").val();
	$("#phoneNo").val(number);
	if(number.length==0) {
		$('#'+label_phoneNo).hide();
		$('#'+phErrorId).html("<b><font color='red'> Enter phone number or customer id. </font></b>");
		$('#'+phErrorId).addClass('valid');
		$('#'+phErrorId).show();
		event.preventDefault();
		return false;
	} 
	if(number.length > 12) {
		$('#'+label_phoneNo).hide();
		$('#'+phErrorId).html("<b><font color='red'> Mobile number or Customer Id should not be exceed from 12 digit.</font></b>");
		$('#'+phErrorId).addClass('valid');
		$('#'+phErrorId).show();
		event.preventDefault();
		return false;
	}
	
      //alert(PhoneNo);
	var completeCheck=true;
	$.ajax({
		url: 'ajax/getKycUpgrade',
		dataType: "json",
		data:'PhoneNo='+number,
		success:function(response)
		{
			console.log("Success Occured");
			
			//alert(response.name);
			var values=response;
//			console.log(JSON.stringify(values));
			if(values.productName==null) {
				clearFields();
				$('#'+phErrorId).addClass('valid');
				$('#'+phErrorId).show();
				$('#'+label_phoneNo).hide();
				$('#'+phErrorId).html("<b><font color='red'>This user is not registered !</font></b>");
			}
			else {
//				$('#kycTableId').html('');
				$('#kycTableId').html(kycTableIdHtml);
				$('#tableDataId').show();
				$('#'+phErrorId).hide();
				$('#'+label_phoneNo).show();
				/***Name***/
				$('#kycupgradeId').show();
//				$("#kycupgradetableId").show();
				$('#lab_KYC_Upgrade_Name').val(values.name);
				$('#lab_KYC_Upgrade_LastName').val(values.lastName);
				/***Product Name***/
				$('#productNameid').show();
				$('#lab_Product_Name').val(values.productName);	
				/***Master Version***/
				$('#masterVersionId').show();
				$('#lab_Master_Version').val(values.masterVersion);
				/***Master Version***/
				$('#hostSubVersion').show();
				$('#lab_Host_Sub_Version').val(values.hostSubVersion);
				/***Documents***/
				
				$('#pinCodeId').show();
				$('#pinCode').val(values.pinCode);
				$('#address').val(values.address);
				$('#locality').val(values.locality);
				$('#region').val(values.region);
				$('#district').val(values.district);
				$('#state').val(values.state);
				$('#country').val(values.country);
				$('#email').val(values.email);
				$('#externalNo').val(values.externalNo);
				$('#custId').val(values.custId);
				$('#dateOfBirth').val(values.dateOfBirth);
				$('#pinaddressId').val(values.pinaddressId);
				var fileName = response.fileName;
				var fileType = response.fileType;
				var fileUrl = response.url;
				var addedOn = response.addedOn;
				var addedBy = response.addedBy;
				var comments = response.commentsArray;
				var verifiedOn = response.verifiedOnArray;
				var verifiedBy = response.verifiedByArray;
				var idproofs = response.idproofs;
				var docList = response.docList;
				console.log("Deleted Ids id = "+docList);
				console.log(idproofs);
				console.log(fileName);
				var mapKeys = Object.keys(idproofs);
				$('#kycTableId').show();
				for(var f=0; f<docList.length; f++) {
//					$("table#innerKycTableId tr#kycRow"+docList[f]).remove();
					$('#kycRow'+docList[f]).remove();
					$('#kycRowError'+docList[f]).remove();
				}
				
				/*if(Object.keys(idproofs).length == Object.keys(fileName).length) {
					$('#kycTableId').hide();
				} else {
					$('#kycTableId').show();
				}*/
				
				
	//			alert("*******"+fileName);
				var kycUpgradedata = response.idProofCheck;
				var userIdNo = response.userIdNo;
				var status = response.status;
				var i =0;
//				console.log(fileUrl);
				console.log(JSON.stringify(response));
				if(fileName != null && fileName != "") {
					$('#submittedKycTableDiv').show();
					$("#submittedKycTable").find("tr:gt(0)").remove();
					for(i=0;i<fileName.length;i++) {
//						kycIds.push(kycUpgradedata[i]);
//						$('#kycRow'+kycUpgradedata[i]).remove();
//						$('#kycRowError'+kycUpgradedata[i]).remove();
						totalIds++;
						var str = "";
						if(status[i] == "PENDING") 
							str = "<td align='center'  style='color: #7c7e57;'><b>"+status[i]+"</b></td>";
						else if(status[i] == "APPROVED")
							str = "<td align='center'  style='color: green;'><b>"+status[i]+"</b></td>";
						else if(status[i] == "REJECTED")
							str = "<td align='center'  style='color: red;'><b>"+status[i]+"</b></td>";
						
						$('#submittedKycTable').append("<tr><td align='center'>"+fileType[i]+"</td><td align='center'><a href="+fileUrl+"/"+fileName[i]+" target='_blank'>"+userIdNo[i]+"</a></td>"+str+"<td align='center'>"+addedOn[i]+"</td><td align='center'>"+addedBy[i]+"</td><td align='center'>"+verifiedOn[i]+"</td><td align='center'>"+verifiedBy[i]+"</td><td align='center'>"+comments[i]+"</td></tr>");
											
						
					}
				}
				
			}
		},
	
	
		error:function(response) {
			console.log("Success Occured");
			var values=response;
			if(values==null) {
				$('#'+phErrorId).html("<b><font color='red'>This user is not registered !</font></b>");
			}
		}
			
	});
}


function removeFunction(key){
	$('#uploadButton'+key).val('');
}


var pinCode = "";

function fetchAddress(){
	
	$('#buttonClickErrorId').html("");
	pinCode = $('#pinCode').val().trim(); 
	if($('#pinCode').val().length==0)
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
						/*$('#addressSelectDivId').dialog({
							autoOpen: false,
							width: 525,
							height: 350,
							title: '\tSelect Address',
							  buttons: {
				                  OK: function() {$(this).dialog("close");}
				               },
						});*/
					}else{
						$('#lab_pinCodeErrorId').html("<font color='red'>Kindly enter valid PIN Code.</font>");
					}
				}
			});	

		}
	}
}
var lastPinCode = "";

function fillAddressDetail(id,location,pincode,district,state,country,region){
	if($('#addressSelectionId'+id).is(':checked')){
		lastPinCode = pincode;
		$('#pinCode').val(pincode);
		$('#locality').val(location);
		$('#region').val(region);
		$('#district').val(district);
		$('#state').val(state);
		$('#country').val(country);
		$('#pinaddressId').val(id);
		$('#addressSelectTableId').hide();
		removeHasError('div_locality')
		removeHasError('div_region')
		removeHasError('div_district')
		removeHasError('div_state')
		removeHasError('div_country')
		
		
	}
}
var newPin = "";
function changePincode(id) {
	newPin = $('#pinCode').val();
	console.log(newPin);
}

function validateSubscribersForm(){
	var completeCheck=true;
	var phone = $("#lab_Phone_no").val();
	if(phone.length==0)
	{
		completeCheck=false;
		$("#phErrorId").html("<b><font color='red'> Enter phone no! </font></b>");
		return false;
	}
	
	if(completeCheck==false)
	{	kycUpgradeValidate();
		alert("Kyc Check False");
		event.preventDefault();
		return false;
	}
}


function uploadFunction(id){
	if(document.getElementById("uploadButton"+id).value != "") {
	
	$('#kyctableerrorId').html("");
		
		var fileName=$("#uploadButton"+id).val();
		 var allowed_extensions =["jpg","pdf","jpeg","PNG"];
		    var file_extension = fileName.split('.').pop(); 
		   var count=0;    
		    // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.
		    for(var i = 0; i <= allowed_extensions.length; i++)
		    {
		        if(allowed_extensions[i]==file_extension.toLowerCase())
		        {
		        	count++;
		        	 break;
		        }
		   }
	    if(!count>0)
    	{
	    	$('#kyctableerrorId').html("<font color='red'> Id Format should be jpg,pdf,jpeg,PNG </font>")
	    	$('#uploadButton90').val('');
    	}
	} else{
		$('#divID_uploadFilePath').addClass('has-error');
		check=false;
	}	

}

function changeValues() {
	$('#address').val('');
	$('#locality').val('');
	$('#region').val('');
	$('#district').val('');
	$('#state').val('');
	$('#country').val('');
	
}


var valid = true;
function validateForm(event) {
	valid = true;
	var fName = $('#lab_KYC_Upgrade_Name').val().trim();
	var lName = $('#lab_KYC_Upgrade_LastName').val().trim();
	var dob = $('#dateOfBirth').val().trim();
	var pin = $('#pinCode').val().trim();
	var add = $('#address').val().trim();
	var email = $('#email').val().trim();
	$("#kycTableId input:checkbox").each(function() {
		$('#uploadButtonErrorId'+$(this).val()).html("");
		$('#idNoErrorId'+$(this).val()).html("");
	});
	
	$("#kycTableId input:checkbox").each(function() {
		if($('#valueCheck'+$(this).val()).prop('checked')){
			if($('#uploadButton'+$(this).val()).val().length<=0){
				$('#uploadButtonErrorId'+$(this).val()).html("<font color='red'>Kindly upload file</font>");
				valid = false;
			}
			if($('#idNo'+$(this).val()).val().length<=0 || ($('#idNo'+$(this).val()).val() == '0')){
				$('#idNoErrorId'+$(this).val()).html("<font color='red'>Kindly fill id number.</font>");
				valid = false;
			}
		}
	});
	
	return valid;
	
}

function validateEmail1(emailField){
//	console.log("Email Validation");
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test($('#'+emailField).val()) == false) 
    {
    	$('#label_emailId').hide();
		$('#lab_Email_IdErrorId').show();
		$('#lab_Email_IdErrorId').html("<font color='red'>Enter valid Email</font>");
		$('#'+emailField).val('');
        return false;
    }

    return true;

}

function checkMultipleImageSizeAndExtension(objt, fileid, divFileId) {
	var fileName = objt.value;
	alert(fileName);
	var obj = document.getElementById(fileid);
	var filepath = obj.value;
    var ext = filepath.substring(filepath.lastIndexOf('.')+1).toLowerCase();
    if (ext != "jpeg" && ext != "jpg" && ext != "png" ) {
        alert('Please select a valid image file');
        obj.value = '';
        return false;
    }
    var fsize = obj.files.item(0).size;
    var s = Math.round((fsize / 1024) * 1024);
    if (s > 512000) {
        alert('Max Upload size is 512 KB only');
        obj.value = '';
        return false;
    }
    $('#'+divFileId).html('');
    return true;
}

function fetchKycDescData(key){
	
	if($('#valueCheck'+key).prop('checked'))
	{
		checkIdCount++;
		$('#uploadButton'+key).prop('disabled',false);
		$('#removeButton'+key).prop('disabled',false);
		$('#idNo'+key).attr('disabled',false);
		$('#submitButtonId').prop('disabled',false);
	}else{
		checkIdCount--;
		$('#uploadButton'+key).prop('disabled',true);
		$('#uploadButtonErrorId'+key).html('');
		$('#removeButton'+key).prop('disabled',true);
		$('#idNo'+key).attr('disabled',true);
		$('#idNoErrorId'+key).html('');
		$('#idNo'+key).val('');
		if(checkIdCount == 0)
			$('#submitButtonId').prop('disabled',true);
	}
}


//var flag = true;
//function validateKycDocs() {
//	console.log("validate kyc");
//	$("#kycTableId input:checkbox").each(function() {
//		if($('#idProofCheck'+$(this).val()).prop('checked')){
//			if($('#uploadButton'+$(this).val()).val().length<=0){
//				$('#uploadButtonErrorId'+$(this).val()).html("<font color='red'>Kindly upload File</font>");
//				flag = false;
//			}
//			if($('#idNo'+$(this).val()).val().length<=0){
//				$('#idNoErrorId'+$(this).val()).html("<font color='red'>Kindly fill ID Number</font>");
//				flag = false;
//			}
//		}
//	});
//	return flag;
//}

function completeCheck() {
	return valid;
}