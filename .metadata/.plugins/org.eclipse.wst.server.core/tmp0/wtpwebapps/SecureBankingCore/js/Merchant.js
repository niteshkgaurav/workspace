var reg = new RegExp(/^[A-Za-z]{4}[0-9]{6,7}$/);
function getStates(countryId,stateId){
	var countryId=$("#"+countryId).val();
	if(countryId.length==0){
		return false;
	}
	
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getStates',
		  type: 'POST',
		  data: 'countryId='+countryId,
		  dataType: "json",
		  success: function(data) {
			  var obj=data.states;

			  var select = $('#'+stateId);
			  select.find('option').remove();
			     $('<option>').val('').text('<-----Select----->').appendTo(select);
			     $.each(obj, function(key,value)
			     {
			       $('<option>').val(key).text(value).appendTo(select);
			     })
	  },
		  error: function(e) {
		
		  }
		});
}

function fetchKycDescData(key){
	
	if($('#idProofCheck'+key).prop('checked'))
	{
		$('#uploadButton'+key).prop('disabled',false);
		$('#removeButton'+key).prop('disabled',false);
		$('#idNo'+key).attr('disabled',false);
		$('#personalStartDate'+key).prop('disabled',false);
		$('#personalEndDate'+key).prop('disabled',false);
		$('#idMandatoryErrorId'+key).html('');
		
	}else{
		$('#uploadButton'+key).val('');
		$('#uploadButton'+key).prop('disabled',true);
		$('#removeButton'+key).prop('disabled',true);
		$('#idNo'+key).val('');
		$('#personalStartDate'+key).val('');
		$('#personalEndDate'+key).val('');
		$('#idNoErrorId'+key).html('');
		$('#idValidFrom'+key).html('');
		$('#idValidTo'+key).html('');
		$('#uploadButtonErrorId'+key).html('');
		$('#idMandatoryErrorId'+key).html('');
		$('#idNo'+key).attr('disabled',true);
		$('#personalStartDate'+key).prop('disabled',true);
		$('#personalEndDate'+key).prop('disabled',true);
		$('#fileNameId'+key).html('');
	}
}

function approveRejectComment(status,event){
	$("#commentId").val("");
	$("#myModal1").modal('show');
	if(status==0){
		$("#approve").val("0");
	}else{
		$("#approve").val("1");
	}
	event.preventDefault();
}


function validateComment(){
	$("#commentErrorId").html("");
	var commentVal=$("#commentId").val();
	if(commentVal==""){
		$("#commentErrorId").html("<font color='red'>Comment field can not be blank.</font>");
		return false;
	}else{
		$('#myModal1').modal('hide');
		$('#merchantregistration').submit();
		
	}
}

function removeCommentError(){
	$("#commentErrorId").html("");
}


function fetchBusinessKycData(key){
	
	if($('#businessIdProofCheck'+key).prop('checked'))
	{
		$('#businessUploadButton'+key).prop('disabled',false);
		$('#businessRemoveButton'+key).prop('disabled',false);
		$('#startDate'+key).prop('disabled',false);
		$('#endDate'+key).prop('disabled',false);
		$('#idNameMandatoryErrorId'+key).html('');
		$('#idName'+key).attr('disabled',false);
	}else{
		$('#businessUploadButton'+key).val('');
		$('#businessUploadButtonErrorId'+key).html('');
		$('#fromDateErrorId'+key).html('');
		$('#toDateErrorId'+key).html('');
		$('#idNameErrorId'+key).html('');
		$('#idNameMandatoryErrorId'+key).html('');
		$('#businessUploadButton'+key).prop('disabled',true);
		$('#startDate'+key).prop('disabled',true);
		$('#endDate'+key).prop('disabled',true);
		$('#startDate'+key).val('');
		$('#endDate'+key).val('');
		$('#idName'+key).val('');
		$('#idName'+key).attr('disabled',true);
		
	}
}

function getSortedArrays(data){
	var arr=[];
	var obj=data;
	 $.each(obj, function(key, value) {
		 arr.push({key:key,value:value});
	 });
	 //========== sort the array by balue ===========
	 arr = arr.sort(function (a, b) {
		 return a.value.localeCompare( b.value );
	});
	return arr;
}

function showTills(){
	 var merchant=$("#merchantType option:selected").val();
	 if(merchant=="CORPORATE_MERCHANT"){
		$("#table_id").hide();
	 
	 }else{
		 $("#table_id").show();	 
	 }
}





function generateTills(noOfTill,tableId,errorId)
{	
	var names = $('#tillNames').val().substring(1,$('#tillNames').val().length-1).split(',');
	var descriptions = $('#tillDescriptions').val().substring(1,$('#tillDescriptions').val().length-1).split(',');
	var ips = $('#tillIps').val().substring(1,$('#tillIps').val().length-1).split(',');
	var counter = names.length;
	if($('#'+noOfTill).val().trim().length==0)
	{
		$('#'+errorId).html("<b><font color='red'>Kindly fill No Of Till</font></b>");
	}
	else
	{
		var i=0;
		$('#lab_tillErrorId').html("");
		$("#"+tableId).html("<tr><th><b>S.NO</b></th><th><b>Select</b></th><th><b>Counter Name</b></th><th><b>Counter Description</b></th><th><b>IP</b></th></tr>");
		for(var count=1;count<=$('#'+noOfTill).val();count++)
		{
			if(count<=counter)
			{
				$("#"+tableId).append('<tr><td align="center">'+count+'</td><td align="center"><input type="checkbox" id="tillCheck_'+count+'" value="'+count+'" checked="checked" name="tillCheck" onclick="changeTillNameDescStatus(\'tillCheck_'+count+'\'\,\'tillName_'+count+'\'\,\'tillDesc_'+count+'\'\,\'tillIp_'+count+'\'\);"/></td><td align="center"><input type="text" id="tillName_'+count+'" value="'+names[i].trim()+'" name="tillName" placeholder="Counter Name" onclick="emptyerror(\'event\'\,\'tillNameErrorId_'+count+'\'\);"/></td><td align="center"><input type="text" id="tillDesc_'+count+'" name="tillDesc" value="'+descriptions[i].trim()+'" onclick="emptyerror(\'event\'\,\'tillDescErrorId_'+count+'\'\);" placeholder="Counter Description" /></td><td align="center"><input type="text" id="tillIp_'+count+'" value='+ips[i++]+' name="tillIp" onchange="validateIp(\'tillIp_'+count+'\'\,\'tillIpErrorId_'+count+'\');" onclick="emptyerror(\'event\'\,\'tillIpErrorId_'+count+'\'\);" placeholder="IP" /></td></tr>');
				$("#"+tableId).append('<tr><td></td><td></td><td align="center"><div id="tillNameErrorId_'+count+'"></div></td><td align="center"><div id="tillDescErrorId_'+count+'"></div></td><td align="center"><div id="tillIpErrorId_'+count+'"></div></td></tr>');
			}else
			{
				$("#"+tableId).append('<tr><td align="center">'+count+'</td><td align="center"><input type="checkbox" id="tillCheck_'+count+'" value="'+count+'" name="tillCheck" onclick="changeTillNameDescStatus(\'tillCheck_'+count+'\'\,\'tillName_'+count+'\'\,\'tillDesc_'+count+'\'\,\'tillIp_'+count+'\'\);"/></td><td align="center"><input type="text" id="tillName_'+count+'" name="tillName" placeholder="Counter Name" onclick="emptyerror(\'event\'\,\'tillNameErrorId_'+count+'\'\);" disabled="true"/></td><td align="center"><input type="text" id="tillDesc_'+count+'" name="tillDesc" onclick="emptyerror(\'event\'\,\'tillDescErrorId_'+count+'\'\);" placeholder="Counter Description" disabled="true"/></td><td align="center"><input type="text" id="tillIp_'+count+'" name="tillIp" onchange="validateIp(\'tillIp_'+count+'\'\,\'tillIpErrorId_'+count+'\');" onclick="emptyerror(\'event\'\,\'tillIpErrorId_'+count+'\'\);" placeholder="IP" disabled="true"/></td></tr>');
				$("#"+tableId).append('<tr><td></td><td></td><td align="center"><div id="tillNameErrorId_'+count+'"></div></td><td align="center"><div id="tillDescErrorId_'+count+'"></div></td><td align="center"><div id="tillIpErrorId_'+count+'"></div></td></tr>');
			}
		}
	}
}

function validateIp(tillIp,errorId)
{
	var ipValue = $('#'+tillIp).val();
	var status = true;
	
	if(ipValue.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)==null)
	{
		$('#'+tillIp).val('');
		$('#'+errorId).html("<b><font color='red'>Invalid Ip!! kindly fill valid Ip!!</font></b>");
		status = false;
	}else{
		status = true;
	}
	if(status === true)
	{
		$.ajax({
		url: 'ajax/validateIps',
		  type: 'POST',
		  dataType: "json",
		  data: 'ipValue='+ipValue,
		  success: function(data) {
			  if(data > 0)
			  {
				  $('#'+errorId).html("<b><font color='red'>Ip already present in Database!! Kindly fill new Ip!!</font></b>");
				  $('#'+tillIp).val('');
			  }
		  }
		});
	}
}

function generateTill(noOfTill,tableId,errorId)
{	
	if($('#'+noOfTill).val().trim().length==0)
	{
		$('#'+errorId).html("<b><font color='red'>Kindly fill No Of Till</font></b>");
	}
	else
	{
		$('#lab_tillErrorId').html("");
		if(counter==2)
		{
			$("#"+tableId).html("<tr><th>&nbsp;&nbsp;&nbsp;&nbsp;<b>Number of Counters</b></th><th>&nbsp;&nbsp;&nbsp;<b>Counter Descriptions</b></th><th></th></tr>");
			for(var count=0;count<$('#'+noOfTill).val();count++)
			{
				$("#"+tableId).append('<tr><td align="center"><input type="text" id="tillName_'+count+'" name="tillName" onclick="emptyerror(\'event\'\,\'tillNameErrorId_'+count+'\'\);" placeholder="Counter Name" /></td><td align="center"><input type="text" id="tillDesc_'+count+'" name="tillDesc" onclick="emptyerror(\'event\'\,\'tillDescErrorId_'+count+'\'\);" placeholder="Counter Description" /></td><td align="center"></td></tr>');
				$("#"+tableId).append('<tr><div id="tillNameErrorId_'+count+'"></div></td><td align="center"><div id="tillDescErrorId_'+count+'"></div></td><td align="center"></td></tr>');
			
			
			
			}
		}else
		{
			$("#"+tableId).html("<tr><th>&nbsp;&nbsp;&nbsp;&nbsp;<b>Number of Lanes</b></th><th>&nbsp;&nbsp;&nbsp;<b>Lane Descriptions</b></th><th></th></tr>");
		
			for(var count=0;count<$('#'+noOfTill).val();count++)
			{
				
				$("#"+tableId).append('<tr><td align="center"><input type="text" id="tillName_'+count+'" name="tillName" onclick="emptyerror(\'event\'\,\'tillNameErrorId_'+count+'\'\);" placeholder="Lane Name" /></td><td align="center"><input type="text" id="tillDesc_'+count+'" name="tillDesc" onclick="emptyerror(\'event\'\,\'tillDescErrorId_'+count+'\'\);" placeholder="Lane Description" /></td><td align="center"></td></tr>');
				$("#"+tableId).append('<tr><div id="tillNameErrorId_'+count+'"></div></td><td align="center"><div id="tillDescErrorId_'+count+'"></div></td><td align="center"></td></tr>');
			
			
			
			}
		}	
		
	}
}

var counter;
function multipleCounter(a){
	counter=a;
	if(a==1)
		{
		var count=0;
		$("#tillTable").empty();
		$("#multipleCounter").hide();
		$("#tillTable").html("<tr><th>&nbsp;&nbsp;&nbsp;<b>Counter Name</b></th>&nbsp;&nbsp;&nbsp;<th><b>Counter Description</b></th></tr>");
		$("#tillTable").append('<tr><td align="center"><input type="text" id="tillName_'+count+'" name="tillName" onclick="emptyerror(\'event\'\,\'tillNameErrorId_'+count+'\'\);" placeholder="Counter Name" /></td><td align="center"><input type="text" id="tillDesc_'+count+'" name="tillDesc" onclick="emptyerror(\'event\'\,\'tillDescErrorId_'+count+'\'\);" placeholder="Counter Description" /></td><td align="center"></td></tr>');
		$("#tillTable").append('<tr><td></td><td></td><td align="center"><div id="tillNameErrorId_'+count+'"></div></td><td align="center"><div id="tillDescErrorId_'+count+'"></div></td><td align="center"></td></tr>');
	
		}
	else
		{
		$("#tillTable").empty();
		$("#multipleCounter").show();
		if(a==2)
			$("#laneName").html("<font color='red'>*&nbsp;</font>No.of Counter&nbsp;&nbsp;:&nbsp;");
		else
			$("#laneName").html("<font color='red'>*&nbsp;</font>No.of Lanes&nbsp;&nbsp;:&nbsp;");
		}
	
}






function checkDuplicateEncryptionKey(event)
{
	
	var encryptionKeyId = $('#encryptionKey').val();
	$.ajax({
		url: 'ajax/checkDuplicateEncryptionKey',
		type:'POST',
		dataType: "json",
		data:'encryptionKeyId='+encryptionKeyId,
		success:function(response)
		{
			if(response==0)
			{
				$('#lab_encryptionKeyErrorId').html("<font color='green'><b>Encryption Key availlable!!</b></font>");
				completeCheck = true;
			}else
			{
				$('#lab_encryptionKeyErrorId').html("<font color='red'><b>Encryption Key already exists!!</b></font>");
				$('#encryptionKey').val('');
				completeCheck = false;
			}
		}
	});
}

function changeTillNameDescStatus(tillCheckId,tillNameId,tillDescId,tillIp)
{
	if($("#"+tillCheckId).prop('checked'))
	{
		$("#"+tillNameId).prop('disabled',false);
		$("#"+tillDescId).prop('disabled',false);
		$("#"+tillIp).prop('disabled',false);
	}
	else
	{
		$("#"+tillNameId).val('');
		$("#"+tillDescId).val('');
		$("#"+tillIp).val('');
		$("#"+tillNameId).prop('disabled',true);
		$("#"+tillDescId).prop('disabled',true);
		$("#"+tillIp).prop('disabled',true);
	}
}
var walletsCount = 0;
function changeWalletStatus(selectAllId,walletId)
{
	if(!$('#'+walletId).prop('checked'))
	{
		$('#'+selectAllId).prop('checked',false);
	}else{
		$('#lab_wallet_nameErrorId').html('');
	}
}

function showCorporateMer(merchantType,corporateMerchantId,value,tableId,walletTableId)
{
	if($('#'+merchantType).val()=='COMPANY_OWNED_STORE' || $('#'+merchantType).val()=='FRANCHISE_OWNED_STORE')
	{
		$('#encryptId').hide();
		$('#'+corporateMerchantId).show();
		$('#'+tableId).show();
			$('#'+walletTableId).hide();
			$('#financialInstrumentId').hide();
	}
	else if($('#'+merchantType).val()==value)
	{
		$('#encryptId').show();
		$('#'+corporateMerchantId).hide();
		$('#'+tableId).hide();
	}
	else
	{
		$('#encryptId').show();
		$('#'+corporateMerchantId).hide();
		$('#'+tableId).show();
		
	}
}

function selectAllFunc()
{
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



function disableSomeSpecialCharacter(e,errorid){
    var evtobj=window.event? event : e;
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
   
    if(code===63 || code===47 || code===126 || code===96  || code===33 || code===64 || code===35 || code===36 || code===37 || code===94 || code===42 || code===40 || code===41 || code===95 || code===45 || code===43 || code===61 || code===91 || code===123 || code===93 || code===125 || code===92 || code===124 || code===59 || code===58 || code===39 || code===34 || code===44 || code===60 || code===46 || code===62){
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed !</font></b>");
    	e.preventDefault();
    	return false;
    } 
    emptyerror(e,errorid);
}




function validateMerchant(event,merID,deployedFor)
{
	
	
		var flag = true;
		var merchantName = $('#merchantCompanyName').val().trim();
		var contactPersonName = $('#contactPersonName').val().trim();
		var merchantType = $('#merchantType').val();
		var type = $('#license').val();
		var IFSCCode=$('#ifsc').val().trim();
		var city=$('#city').val().trim();
		var email=$('#email').val().trim();
		var address=$('#address').val().trim();
		var corporateMerchant = $('#corporateMerchant').val();
		var country = $('#country').val();
		
		var status = $('#status').val();
		var contactNumberVal = $('#contactNumber').val().trim();
		var encryptionKey = $('#encryptionKey').val().trim();
		var check=false;
		if(type==0)
		{
			$("#licenseId").addClass('has-error');
			flag = false;
		}
		

		if(merchantName.length==0)
		{
			$("#merchantCompanyNameDiv").addClass('has-error');
			$('#lab_merchantCompanyNameErrorId').removeClass("collapse");
			flag = false;
		}
		if(contactPersonName.length==0)
		{
			$("#merchantNameDiv").addClass('has-error');
			$('#lab_contactPersonErrorId').removeClass("collapse");
			flag = false;
		}
		
		if(merchantType==0)
		{
			$("#type_Div").addClass('has-error');
			flag = false;
		}
		
		if(merchantType=='COMPANY_OWNED_STORE' || merchantType =='FRANCHISE_OWNED_STORE')
		{
			if(corporateMerchant==0)
			{
				$("#corporateMerchantDiv").addClass('has-error');
				$('#lab_corporateMerchantErrorId').removeClass("collapse");
				flag = false;
			}
		}
		if(merchantType ==='INDIVIDUAL_MERCHANT' || merchantType ==='CORPORATE_MERCHANT')
		{
			if(encryptionKey.length==0 )
			{
				$('#lab_encryptionKeyErrorId').html("<b><font color='red'>Encryption Key cannot be blank!!</font></b>");
				$('#lab_encryptionKeyErrorId').removeClass("collapse");
				flag = false;
			}
		
			if((encryptionKey.length<24 || encryptionKey.length>48) && encryptionKey.length > 0)
			{
				$('#lab_encryptionKeyErrorId').html("<b><font color='red'>Encryption Key length must be between 24 to 48!!</font></b>");
				$('#lab_encryptionKeyErrorId').removeClass("collapse");
				flag = false;
			}
		}
		if(city.length==0 )
		{
			$('#cityDiv').addClass('has-error');
			$('#cityDiv').removeClass("collapse");
			flag = false;
		}
		
		if(address.length==0 )
		{
			$('#addressSelectDivId').addClass('has-error');
			$('#addressSelectDivId').removeClass("collapse");
			flag = false;
		}
		
		if (typeof corporateMerchant === "undefined") {
			corporateMerchant=0;
		}
		
		if(email.length==0 )
		{
			$('#emailDivId').addClass('has-error');
			$('#emailDivId').removeClass("collapse");
			flag = false;
		}
		if(merID!="null"){
			var mob=$('#mobileNo').val().trim();
			if(mob==contactNumberVal){
				check=true;
			}
		}
		if(contactNumberVal.length==0 )
		{
			$('#contactNumberDiv').addClass('has-error');
			$('#contactNumberDiv').removeClass("collapse");
			flag = false;
			
		}else{	
		if(check==false){
			  $.ajax({
			   async: false,
			   url: 'ajax/checkUniqueMobile',
			   type: 'POST',
			   dataType: "json",
			   data: 'contactNumber='+contactNumberVal+"&merchant=merchant",
			   success: function(data) {
			    if(data==true){
			    $('#mobileNumberErrorId').show();
			    $('#miaa').hide();
			    $('#mobileNumberErrorId').html("<font color='red'>Mobile Number Already Exist</font>");
			    $("#contactNumber").val('');
			    flag = false;
			    }
				
			   },
			   error: function(e) {
			   }
			  });
		}
			
		}
		if(country.length==0)
		{
			$('#countrydiv').addClass('has-error');
			$('#countrydiv').removeClass("collapse");
			flag = false;
		}
		
		
		if(deployedFor=="DEFAULT"){
			var pin = $('#pin').val().trim();
			var accountnumber=$('#accountNumber').val().trim();

			if(pin.length==0)
			{
				$("#div_pinCode").addClass('has-error');
				$('#lab_pinCodeErrorId').removeClass("collapse");
				flag = false;
			}
		if(accountnumber.length>0 && IFSCCode.length==0){
				$('#ifscCodeSelectDivId').addClass('has-error');
				$('#lab_ifscCodeErrorId').removeClass("collapse");
			flag = false;
		}
	
		else if(IFSCCode.length>0){
			if(accountnumber.length==0){
				$('#accountSelectDivId').addClass('has-error');
				$('#lab_accountErrorId').removeClass("collapse");
				flag = false;	
				
			}
			if(reg.test(IFSCCode)==false){
			$('#ifsc').val('');
			$('#ifscErrorId').html("<b><font color='red'>Invalid IFSC</font></b>");
			flag = false;
		}
		}
		}else{
			if(IFSCCode.length==0){
				$('#ifscCodeSelectDivId').addClass('has-error');
				$('#lab_ifscCodeErrorId').removeClass("collapse");
				flag = false;
			}else{
			if(!IBAN.isValid(IFSCCode)){
				  $('#lab_ifscCodeErrorId').show();
				  $('#lab_ifsc').hide();
				    $('#lab_ifscCodeErrorId').html("<font color='red'>Invalid IBAN</font>");
				    $("#ifsc").val('');
				flag = false;
			}
			}
		}
		
		if($("#merchantCategory").val()==0)
		{
			$("#merchantCategoryDiv").addClass('has-error');
			$('#lab_pinCodeErrorId').removeClass("collapse");
			flag = false;
		}
		
		if(status=='0')
		{
			$("#statusDiv").addClass('has-error');
			$('#lab_StatusErrorId').removeClass("collapse");
			flag = false;
		}
		if ($('input[name="radio"]:checked').attr('id') =='yes') {
			var atLeastOneIsChecked = $('input[name="idProofCheck"]:checked').length;
			var atLeastOneBusinessIsChecked = $('input[name="businessIdProofCheck"]:checked').length;
			if(atLeastOneIsChecked==0){
				$('#kycError').html("<font color='red'>Please Select All The Mandatory ID Proofs </font>")
		    	$('#kycError').show();	
				flag = false;
			}else{
				$('input[name="idProofCheck"]').each(function() {
					if(this.checked){
				var idNo=$("#idNo"+this.value).val().trim();
				var upload=$("#uploadButton"+this.value).val().trim();
				var span=$("#photoSpan"+this.value).text().trim();
				if(idNo.length==0){
					$('#idNoErrorId'+this.value).html("<font color='red'>Please Enter ID Number </font>")
			    	$('#idNoErrorId'+this.value).show();
					flag = false;
					
				}
				if(upload.length==0 && (span.length==0 || span.includes("No file"))){
					$('#uploadButtonErrorId'+this.value).html("<font color='red'>Please Upload ID Proof Document </font>")
			    	$('#uploadButtonErrorId'+this.value).show();
					flag = false;
					
				}
					}else{
						var idName=$('label[for='+this.id+']').text().trim();
						if(idName.includes('Mandatory')){
							$('#kycError').html("<font color='red'>Please Select All The Mandatory ID Proofs </font>");
					    	$('#kycError').show();	
							flag = false;	
						}
					}
				});
				
			} if(atLeastOneBusinessIsChecked==0){
				$('#kycError').html("<font color='red'>Please Select All The Mandatory ID Proofs </font>")
		    	$('#kycError').show();	
				flag = false;
			}else{
			
				$('input[name="businessIdProofCheck"]').each(function() {
					if(this.checked){
					var idName=$("#idName"+this.value).val().trim();
					var uploadButton=$("#businessUploadButton"+this.value).val().trim();
					var startDate=$("#startDate"+this.value).val().trim();
					var endDate=$("#endDate"+this.value).val().trim();
					var businessSpan=$("#businessSpan"+this.value).text().trim();
					if(idName.length==0 ){
						$('#idNameErrorId'+this.value).html("<font color='red'>Please Enter ID Number </font>")
				    	$('#idNameErrorId'+this.value).show();
						flag = false;
						
					}
					if(uploadButton.length==0 && (businessSpan.length==0 || businessSpan.includes("No file"))){
						$('#businessUploadButtonErrorId'+this.value).html("<font color='red'>Please Upload ID Proof Document </font>")
				    	$('#businessUploadButtonErrorId'+this.value).show();
						flag = false;
						
					}
					if(startDate.length==0){
						$('#fromDateErrorId'+this.value).html("<font color='red'>Please Enter Start Date</font>")
				    	$('#fromDateErrorId'+this.value).show();
						flag = false;
						
					}
					if(endDate.length==0){
						$('#toDateErrorId'+this.value).html("<font color='red'>Please Enter End Date</font>")
				    	$('#toDateErrorId'+this.value).show();
						flag = false;
						
					}
					}else{
						$('#kycError').html("<font color='red'>Please Select All The Mandatory ID Proofs </font>")
				    	$('#kycError').show();	
						flag = false;	
					}
					});
			}
		}
		return flag;
		
}



function validateOutlet(event,deployedFor,merID)
{
	
	
		var flag = true;
		var merchantName=$('#merchantName').val().trim();
		var dbaName=$('#dbaName').val().trim();
		var IFSCCode=$('#ifsc').val().trim();
		var city=$('#city').val().trim();
		var email=$('#email').val().trim();
		var address=$('#address').val().trim();
		var country = $('#country').val();
		var status = $('#status').val();
		var contactNumberVal = $('#contactNumber').val().trim();
		var check=false;
		
		if(merchantName==0 )
		{
			$('#merchantNameDiv').addClass('has-error');
			$('#merchantNameDiv').removeClass("collapse");
			flag = false;
		}
		
		if(dbaName.length==0 )
		{
			$('#dbaNameDiv').addClass('has-error');
			$('#dbaNameDiv').removeClass("collapse");
			flag = false;
		}
		if(city.length==0 )
		{
			$('#cityDiv').addClass('has-error');
			$('#cityDiv').removeClass("collapse");
			flag = false;
		}
		
		if(address.length==0 )
		{
			$('#addressSelectDivId').addClass('has-error');
			$('#addressSelectDivId').removeClass("collapse");
			flag = false;
		}
		
		
		
		if(email.length==0 )
		{
			$('#emailDivId').addClass('has-error');
			$('#emailDivId').removeClass("collapse");
			flag = false;
		}
		if(merID!=null){
			var mob=$('#mobileNo').val().trim();
			if(mob==contactNumberVal){
				check=true;
			}
		}
		if(contactNumberVal.length==0 )
		{
			$('#contactNumberDiv').addClass('has-error');
			$('#contactNumberDiv').removeClass("collapse");
			flag = false;
			
		}else{	
		if(check==false){
			  $.ajax({
			   async: false,
			   url: 'ajax/checkUniqueMobile',
			   type: 'POST',
			   dataType: "json",
			   data: 'contactNumber='+contactNumberVal+"&merchant=outlet",
			   success: function(data) {
			    if(data==true){
			    $('#mobileNumberErrorId').show();
			    $('#miaa').hide();
			    $('#mobileNumberErrorId').html("<font color='red'>Mobile Number Already Exist</font>");
			    $("#contactNumber").val('');
			    flag = false;
			    }
				
			   },
			   error: function(e) {
			   }
			  });
		}
			
		}
		if(country.length==0)
		{
			$('#countrydiv').addClass('has-error');
			$('#countrydiv').removeClass("collapse");
			flag = false;
		}
		
		
		if(deployedFor=="DEFAULT"){
			var pin = $('#pin').val().trim();
			var accountnumber=$('#accountNumber').val().trim();
			if($("#stopLat").val().length==0)
			{
				$("#DivIdstopLat").addClass('has-error');
				$('#lab_pinCodeErrorId').removeClass("collapse");
				flag = false;
			}
			if($("#stopLong").val().length==0)
			{
				$("#DivIdstopLong").addClass('has-error');
				$('#lab_pinCodeErrorId').removeClass("collapse");
				flag = false;
			}
			if(pin.length==0)
			{
				$("#div_pinCode").addClass('has-error');
				$('#lab_pinCodeErrorId').removeClass("collapse");
				flag = false;
			}
		if(accountnumber.length>0 && IFSCCode.length==0){
				$('#ifscCodeSelectDivId').addClass('has-error');
				$('#lab_ifscCodeErrorId').removeClass("collapse");
			flag = false;
		}
	
		else if(IFSCCode.length>0){
			if(accountnumber.length==0){
				$('#accountSelectDivId').addClass('has-error');
				$('#lab_accountErrorId').removeClass("collapse");
				flag = false;	
				
			}
			if(reg.test(IFSCCode)==false){
			$('#ifsc').val('');
			$('#ifscErrorId').html("<b><font color='red'>Invalid IFSC</font></b>");
			flag = false;
		}
		}
		}else{
			if(IFSCCode.length==0){
				$('#ifscCodeSelectDivId').addClass('has-error');
				$('#lab_ifscCodeErrorId').removeClass("collapse");
				flag = false;
			}else{
			if(!IBAN.isValid(IFSCCode)){
				  $('#lab_ifscCodeErrorId').show();
				  $('#lab_ifsc').hide();
				    $('#lab_ifscCodeErrorId').html("<font color='red'>Invalid IBAN</font>");
				    $("#ifsc").val('');
				flag = false;
			}
			}
		}
		
		if(status=='0')
		{
			$("#statusDiv").addClass('has-error');
			$('#lab_StatusErrorId').removeClass("collapse");
			flag = false;
		}
		
		return flag;
		
}



function removeBusinessFunction(key){
	$('#businessUploadButton'+key).val('');
	$('#businessSpan'+key).val('');
	$('#businessSpan'+key).html('No file ...lected.');
}

function removeError(errorId){
	$('#'+errorId).html('');	
	$('#'+errorId).hide();	
	
}
function checkMultipleImageSizeAndExtension(fileid, divFileId) {
	var obj = document.getElementById(fileid);
	var filepath = obj.value;
    var ext = filepath.substring(filepath.lastIndexOf('.')+1).toLowerCase();
    if (ext != "jpeg" && ext != "jpg" && ext != "png" ) {
        obj.value = '';
        return false;
    }
    var fsize = obj.files.item(0).size;
    var s = Math.round((fsize / 1024) * 1024);
    if (s > 512000) {
        obj.value = '';
        return false;
    }
    $('#'+divFileId).html('');
    return true;
}
function clrmsg(errId,lab){
	$("#"+errId).html("");
	$("#"+errId).addClass("collapse");
	$("#"+lab).show();
	
}
 function clrpincode(){
	 $("#lab_CountryErrorId").html(""); 
	 $("#lab_StateErrorId").html(""); 
		$("#lab_CountryErrorId").addClass("collapse");
		$("#lab_StateErrorId").addClass("collapse");
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





function fetchAddress(){
	$('#buttonClickErrorId').html("");
	var pinCode = $('#pin').val().trim(); 
	if(pinCode.length==0){
		$('#lab_pinCodeErrorId').html("<b><font color='red'>Kindly enter PIN Code.</font></b>");
		$('#lab_pinCodeErrorId').addClass('valid');
		$('#lab_pinCodeErrorId').removeClass('collapse');
		$('#pincode').hide();
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






function removeNumdiv(){
	if($("#noOfTill").val()==""){
		$("#tillTable").empty();
	}
}


function removemsg(){
	$('#lab_noOfTillErrorId').html(" ");
	$('#lab_merchantNumberErrorId').html(" ");
	$("#merchantNameDivId").removeClass('has-error');
	$('#addressSelectDivId').removeClass('has-error');
	$('#externalSelectDivId').removeClass('has-error');
	
}

function hide(){
	$('#mapDiv').hide();
}
function show1(){
	$('#mapDiv').show();
}
var showopencheck = 0;
var keys = new Array();
var i=0;
function showKycTable1(event)
{
	showopencheck++;
	$('#kycTable').show();
	$('#businessId').show();
}
function showKycTable(event)
{
	showopencheck++;
	$('#kycTableId').show();
	$('#businessId').show();
}

function addSpan(span,buttonId){
	var value=$('#'+buttonId).val().trim();
	if(value.length>0){
	var n = value.lastIndexOf('\\');
	value= value.substring(n + 1);
	$('#'+span).html(value);
	}
}

function hideKycTable1(){
	showopencheck--;
	$('#kycTable').hide();
	$('#businessId').hide();
}
function hideKycTable(){
	showopencheck--;
	$('#kycTableId').hide();
	$('#businessId').hide();
}

function validateIfsc(event) {
	$('#ifscErrorId').empty();
	var value=$('#ifsc').val().trim();
	if(value.length!=0){
	  
	    if (reg.test(value)) {
				 $.ajax({
					   async: false,
					   url: 'ajax/checkIFSC',
					   type: 'POST',
					   dataType: 'json',
					   data: 'IFSC='+value,
					   success: function(data) {
						   if(data.bankName!=null){
						   $('#bankNameDiv').show();
						   $('#bankName').val(data.bankName);
						   $('#branchDiv').show();
						   $('#branch').val(data.branch);
						   $('#bankAddressDiv').show();
						   $('#bankAddress').val(data.bankAddress);
						   }else{
							   $('#bankNameDiv').hide();
							   $('#branchDiv').hide();
							   $('#bankAddressDiv').hide();
							   $('#bankName').val('');
							   $('#branch').val('');
							   $('#bankAddress').val('');
							   $('#ifscErrorId').show();
							   $('#ifscErrorId').html("No Records Found, Details Will Be Added");  
						   }
					   },
					   error: function(e) {
					   }
					  });
					 
	      return true;
	      
	    } else {
	    	$('#ifscErrorId').append("<b><font color='red'>Invalid IFSC</font></b>");
	    		$('#bankNameDiv').hide();
	    		$('#branchDiv').hide();
			   $('#bankAddressDiv').hide();
			   $('#bankName').val('');
			   $('#branch').val('');
			   $('#bankAddress').val('');
			   $('#ifscErrorId').show();
	      return false;
	    }
	}else{
		$('#bankNameDiv').hide();
		   $('#branchDiv').hide();
		   $('#bankAddressDiv').hide();
		   $('#bankName').val('');
		   $('#branch').val('');
		   $('#bankAddress').val('');
		   $('#ifscErrorId').show();
		   $('#ifscErrorId').val('');
	}
	
	   
	}
function checkedTrue(id){
	$("#"+id).prop('checked',true);
}

function getData(){
	var contactnumber=$("#myInput").val();
/*	$('#example').DataTable( {
	    ajax:'ajax/searchmerchant-data?param='+contactnumber,
	    columns: [
	        { data:  merchantdata.merchantDetails. },
	        { data: 1 },
	        { data: 2 },
	        { data: 3 },
	        { data: 4 },
	        { data: 5 }
	    ]
	} );*/
	
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/searchmerchant-data',
		  type: 'POST',
		  data: 'param='+contactnumber,
		  dataType: "json",
		  success: function(merchantdata) {
			  var	array = [];
			  array = merchantdata.merchantDetails;
			 // $("#merchantInfo").empty();
			  $("#merchantInfo > tbody").empty();
			//  merchantInfo
			  var rows;
		for (var i = 0; i < array.length; i++) {
			rows=rows+'<tr>'+
			'<td>'+array[i].merchantName+'</td>'
			+'<td>'+array[i].contactNumber+'</td>'
			+'<td>'+array[i].accountNumber+'</td>'
			+'<td>'+array[i].ifscCode+'</td>'
			+'<td>'+array[i].email+'</td>'
			+'<td>'+array[i].merchantId+'</td>'
			+'</tr>';
			
		}
		$("#merchantInfo").append('<tbody>'+rows+'</tbody>');
		
		
	  },
		  error: function(e) {
			
		  }
		});
}
function refresh(successMessageId){
	$('#'+successMessageId).html('');
}

function toggleform(id)
{
	$('#msgId').html('');
$("#"+id).toggle("slow",function(){
});

}