function checkEmail(str)
{
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(str)){
    	$('#emailId1').hide();
    	$('#emailIdErrorId').show();

    	$('#emailIdErrorId').html("<font color='red'> Not a valid Email-id</font>");
    	$('#emailId').val('');
    	return false;
    }
}


function showError(id){

	return false;
}

$(document).ready(function() {
    $('#table_id1').DataTable({
    	 "scrollY":   "500px",
         "scrollCollapse": true,
         "paging":         true,
         "pagingType": "simple_numbers"
    });
} ); 

function emptyNonEmpty(id){
	$("#"+id).css({
		"border": "",
		"background": ""
	});
}
var fflag=true;
var kflag=true;
var completecheck=true;




function selectType(event)
{
	$("#SearchByAutoSearch").hide();
	$("#SearchByTable").hide();
	$("#header").hide();
	$("#host").hide();
	$("#host1").hide();
	$("#host2").hide();
	$("#hostRowId").hide();
	$("#header1").hide();
	$("#hostId").val('');
	$("#vendorId").val('');
	$("#hostErrorId").html('');

	var sel= $("#Select_type").val();

	if(sel=='HOST')
	{
		$("#hostRowId").show();
		$("#host").show();
		$("#host1").show();
		$("#host2").show();
		$("#hostId").val('');
		$("#vendor1").hide();
		$("#vendor").hide();
		$("#vendor2").hide();
		$("#table_id").hide();
		$("#header1").hide();

	}
	if(sel=='VENDOR')
	{
		$("#hostRowId").show();
		$("#vendor1").show();
		$("#vendor").show();
		$("#vendor2").show();
		$("#table_id").hide();
		$("#header1").hide();
		$("#vendorId").show();
	}
	if(sel=='0')
	{
		$("Select_type").show();
		$("#hostRowId").show();
		$("#vendorId").hide();
		$("#vendor").hide();
		$("#vendor1").hide();
		$("#vendor2").hide();
		$("#table_id").hide();
	}



}

function hideSearchBy()
{
	$("#SearchByTable").hide();
	$("#SearchByAutoSearch").hide();
	$("#table_id").hide();
	$("input[name=radioGroup]").attr('checked', false);
	$("input:radio").removeAttr("checked");
	$("#email").val('');
	$("#mobile").val('');
	$("#userName").val('');




}


function checkEcryption(event,encryptionKeyErrorId)
{
	var completeCheck=true;
	$.ajax({
		url: 'ajax/encryptionKey',
		type:'POST',
		data:'encryptionKeyId='+encryptionKey,
		success:function(response)
		{
			if(response==0)
			{

				$('#encryptionKeyErrorId').html("<font color='green'>Name Available!!</font>");
				completeCheck = true;
			}else
			{
				$('#encryptionKeyErrorId').html("<font color='red'> Name already exists!!</font>");
				$('#encryptionKeyId').val('');
				completeCheck = false;
			}
		}
	});


}






function validateAccountType(){
	if($("#accountTypeId").val()==''){

		$('#div_accountTypeId').addClass('has-error');
		$("#accountType").val("");
		return false;
	}
	else
	{
		$("#accountType").val($('#accountTypeId option:selected').text()); //$('#accountTypeId option:selected').text();
	}
}

function addMore(tableId){
	var hiddenAccountNo=parseInt($("#hiddenAccountNo").val())+1; 
	var table=document.getElementById(tableId);
	var tr=table.insertRow();
	tr.setAttribute("id","row"+hiddenAccountNo);

	//========== name ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","name"+hiddenAccountNo);
	input.setAttribute("name","nameArr");
	input.setAttribute("type","text");
	input.setAttribute("placeholder","Enter name");
	input.setAttribute("style","width:100px;");
	input.setAttribute("onfocus","emptyerror(event,'nameErrorId"+hiddenAccountNo+"')");
	td.appendChild(input);
	tr.appendChild(td);

	//========== email ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","email"+hiddenAccountNo);
	input.setAttribute("name","emailArr");
	input.setAttribute("type","text");
	input.setAttribute("placeholder","Enter email");
	input.setAttribute("style","width:100px;");
	input.setAttribute("onfocus","emptyerror(event,'emailErrorId"+hiddenAccountNo+"')");
	td.appendChild(input);
	tr.appendChild(td);

	//========== mobile ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","mobile"+hiddenAccountNo);
	input.setAttribute("name","mobileArr");
	input.setAttribute("type","text");
	input.setAttribute("placeholder","Enter mobile");
	input.setAttribute("style","width:100px;");
	input.setAttribute("maxlength","10");
	input.setAttribute("onfocus","emptyerror(event,'mobileErrorId"+hiddenAccountNo+"')");
	input.setAttribute("onchange","checkDuplicateMobile(this.id)");
	td.appendChild(input);
	tr.appendChild(td);

	//========== login name ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","loginName"+hiddenAccountNo);
	input.setAttribute("name","loginNameArr");
	input.setAttribute("type","text");
	input.setAttribute("placeholder","Enter login name");
	input.setAttribute("style","width:100px;");
	input.setAttribute("onfocus","emptyerror(event,'loginNameErrorId"+hiddenAccountNo+"')");
	input.setAttribute("onchange","checkDuplicateLoginName(this.id)");
	td.appendChild(input);
	tr.appendChild(td);

	//========== password ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","password"+hiddenAccountNo);
	input.setAttribute("name","passwordArr");
	input.setAttribute("type","password");
	input.setAttribute("placeholder","Enter password");
	input.setAttribute("style","width:100px;");
	input.setAttribute("onfocus","emptyerror(event,'passwordErrorId"+hiddenAccountNo+"')");
	td.appendChild(input);
	tr.appendChild(td);

	//=========== status =============
	var td=tr.insertCell();
	var select=document.createElement('select');
	select.setAttribute("id","status"+hiddenAccountNo);
	select.setAttribute("name","statusArr");
	select.setAttribute("style","width:100px;");

	select.options[select.options.length] = new Option("Unblocked","0");
	select.options[select.options.length] = new Option("Blocked","1");

	td.appendChild(select);
	tr.appendChild(td);


	//=========== account Type =============
	var td=tr.insertCell();
	var select=document.createElement('select');
	select.setAttribute("id","accountType"+hiddenAccountNo);
	select.setAttribute("name","accountTypeArr");
	select.setAttribute("style","width:150px;");

	td.appendChild(select);
	tr.appendChild(td);

	//========== remove button ============
	var td=tr.insertCell();
	var input=document.createElement('input');
	input.setAttribute("id","removeBtn"+hiddenAccountNo);
	input.setAttribute("value","Remove");
	input.setAttribute("type","button");
	input.setAttribute("onclick","removeRow('row"+hiddenAccountNo+"')");
	td.appendChild(input);
	tr.appendChild(td);

	table.appendChild(tr);

	var tr=table.insertRow();
	var errorRow="erow"+hiddenAccountNo;
	tr.setAttribute("id",errorRow);

	var td=tr.insertCell();
	var lab=document.createElement('label');
	lab.setAttribute("id","nameErrorId"+hiddenAccountNo);
	td.appendChild(lab);
	tr.appendChild(td);

	var td=tr.insertCell();
	var lab=document.createElement('label');
	lab.setAttribute("id","emailErrorId"+hiddenAccountNo);
	td.appendChild(lab);
	tr.appendChild(td);

	var td=tr.insertCell();
	var lab=document.createElement('label');
	lab.setAttribute("id","mobileErrorId"+hiddenAccountNo);
	td.appendChild(lab);
	tr.appendChild(td);

	var td=tr.insertCell();
	var lab=document.createElement('label');
	lab.setAttribute("id","loginNameErrorId"+hiddenAccountNo);
	td.appendChild(lab);
	tr.appendChild(td);

	var td=tr.insertCell();
	var lab=document.createElement('label');
	lab.setAttribute("id","passwordErrorId"+hiddenAccountNo);
	td.appendChild(lab);
	tr.appendChild(td);

	table.appendChild(tr);
	$('#accountType2 option').clone().appendTo('#accountType'+hiddenAccountNo); // copy first dropdown option in another
	$("#hiddenAccountNo").val(hiddenAccountNo);
}

function removeRow(rowId){
	$("#"+rowId).remove();
	$("#e"+rowId).remove();

}


function getStates(countryId,stateId){
	var countryId=$("#"+countryId).val();
	if(countryId.length==0){
		return false;
	}
	if(countryId=="0")
	{

		$('#'+stateId).find('option:not(:first)').remove();

	}
	//========== ajax call ==============
	$.ajax({
		url: 'ajax/getStates',
		type: 'POST',
		data: 'countryId='+countryId,
		dataType: "json",
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
		}
	});
}

function accountVisbility(){
	var groupCode=$("#hiddenAccountGroupCode").val();
	if(groupCode=='HO'){
		$("#hostRow").hide();
		$("#distributorRow").hide();
		$("#subDistributorRow").hide();
		$("#retailerRow").hide();
		$("#tableForHost").show();
		$("#encryptionRowId").show();
	}
	else if(groupCode=='DI'){
		$("#hostRow").show();
		$("#distributorRow").hide();
		$("#subDistributorRow").hide();
		$("#retailerRow").hide();
		$("#tableForHost").hide();
		$("#encryptionRowId").show();
	}
	else if(groupCode=='SD'){
		$("#hostRow").show();
		$("#distributorRow").show();
		$("#subDistributorRow").hide();
		$("#retailerRow").hide();
		$("#tableForHost").hide();
		$("#encryptionRowId").show();
	}
	else if(groupCode=='RE'){
		$("#hostRow").show();
		$("#distributorRow").show();
		$("#subDistributorRow").show();
		$("#retailerRow").hide();
		$("#tableForHost").hide();
		$("#encryptionRowId").show();
	}
	else if(groupCode=='BC'){
		$("#hostRow").show();
		$("#distributorRow").show();
		$("#subDistributorRow").show();
		$("#retailerRow").show();
		$("#tableForHost").hide();
		$("#encryptionRowId").hide();
	}

	else if(groupCode=='VE')
	{


		$("#hostRow").hide();
		$("#distributorRow").hide();
		$("#subDistributorRow").hide();
		$("#retailerRow").hide();
		$("#tableForHost").hide();
		$("#encryptionRowId").hide();

	}
}

function getAccount(parentId,parentCode,childId,subDistributorId){
	var parentId=$("#"+parentId).val();
	if(parentId.length==0){
		$("#"+childId).val("");
		$("#"+subDistributorId).val("");
		return false;
	}

	//========== ajax call ==============
	$.ajax({
		url: 'ajax/getAccount',
		type: 'POST',
		dataType: 'json',
		data: 'parentId='+parentId+'&parentCode='+parentCode,
		success: function(data) {
			var data1 = data;
			data=data1.platformChain;
			var obj;
			if(parentCode=='HO'){
				obj=data.distributorMap;
			}
			else if(parentCode=='DI'){
				obj=data.subDistributorMap;
			}
			else if(parentCode=='SD'){
				obj=data.retailerMap;
			}
			obj=JSON.stringify(obj);
			var arr=getSortedArray(obj);
			$('#'+childId).find('option:not(:first)').remove();
			$('#'+subDistributorId).find('option:not(:first)').remove();
			for(var i=0;i<arr.length;i++){
				var key=arr[i].key;
				var value=arr[i].value;
				$("#"+childId).append(new Option(value,key));
				$("#"+subDistributorId).append(new Option(value,key));
			}
		},
		error: function(e) {
		}
	});


}
var flag = true;
function checkDuplicateAccount(){
	
	var companyName=$("#companyNameId").val();
var groupCode=$("#hiddenAccountGroupCode").val();
var parentId=0;
if(groupCode=='DI'){
 parentId=$("#hostId").val();
}
else if(groupCode=='SD'){
 parentId=$("#distributorId").val();
}
else if(groupCode=='RE'){
 parentId=$("#subDistributorId").val();
}
else if(groupCode=='BC'){
 parentId=$("#retailerId").val();
}

//========== ajax call ==============
var cname=$("#companyNameId").val();
cname = cname.replace(/\s/g,'');
				
var editFlag = function(){
 var finaleditflag=true; 
 if(cname.length!=0){
  $.ajax({
   async: false,
   url: 'ajax/checkDuplicateAccount',
   type: 'POST',
   data: 'companyName='+companyName+'&groupCode='+groupCode+'&parentId='+parentId,
   success: function(data) {
    

    finaleditflag=data;
    if(finaleditflag==true){
    	 $('#companyNameErrorId').show();
    	 $('#companyNameId1').hide();
     $('#companyNameErrorId').html("<font color='red'>Company name Already Exist</font>");
     $("#companyNameId").val('');
    }
    else if(finaleditflag==false)
    {
    	$('#companyNameErrorId').addClass("valid");
    	$('#companyNameErrorId').show();
    	
    	 $('#companyNameId1').hide();
    	$('#companyNameErrorId').html("<font color='green'>Company name available.</font>");
    }
   },


   error: function(e) {

   }
  });
 }
 if(finaleditflag=='false')
 {
  return false;}
 if(finaleditflag=='true'){

  return true;

 }


}();

return editFlag;}

function checkDuplicateAccountEdit(){
	var companyName=$("#companyNameId").val();
	var compnyNameOrignal=$("#companyNameEdit").val();
	if(companyName===compnyNameOrignal){
	}else{
var groupCode=$("#hiddenAccountGroupCode").val();
var parentId=0;
if(groupCode=='DI'){
 parentId=$("#hostId").val();
}
else if(groupCode=='SD'){
 parentId=$("#distributorId").val();
}
else if(groupCode=='RE'){
 parentId=$("#subDistributorId").val();
}
else if(groupCode=='BC'){
 parentId=$("#retailerId").val();
}

//========== ajax call ==============
var cname=$("#companyNameId").val();
cname = cname.replace(/\s/g,'');


var editFlag = function(){
 var finaleditflag=true; 
 if(cname.length!=0){
  $.ajax({
   async: false,
   url: 'ajax/checkDuplicateAccount',
   type: 'POST',
   data: 'companyName='+companyName+'&groupCode='+groupCode+'&parentId='+parentId,
   success: function(data) {
    finaleditflag=data;
    if(finaleditflag==true){
    	 $('#companyNameErrorId').show();
    	 $('#companyNameId1').hide();
    	 
     $('#companyNameErrorId').html("<font color='red'>Company name Already Exist</font>");

     $("#companyNameId").val('');
    }
    else if(finaleditflag==false)
    {
    	$('#companyNameErrorId').addClass("valid");
    	 $('#companyNameErrorId').show();
    	 $('#companyNameId1').hide();
     $('#companyNameErrorId').html("<font color='green'>Company name available.</font>");
    }
   },

  
   
   

   error: function(e) {

   }
  });
 }
 if(finaleditflag=='false')
 {
  return false;}
 if(finaleditflag=='true'){

  return true;

 }
 


}();

return editFlag;

	}
	
}

function checkDuplicateEncryptionKey(){

	var encryptionKey=$("#encryptionKeyId").val().trim();
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}
	var completeCheck=true;
	if(encryptionKey.length()>0){
		$.ajax({
			url: 'ajax/checkDuplicateEncryptionKey',
			async: false,
			type:'POST',
			data:'encryptionKey='+encryptionKey+'&groupCode='+groupCode+'&parentId='+parentId,
			success:function(response)
			{
				if(response!=0)
				{
					$('#encryptionKeyErrorId').html("<font color='red'>Encryption Key already exists!!</font>");
					$('#encryptionKeyId').val('');
					completeCheck = false;
				}else
				{
					$('#encryptionKeyErrorId').html("<font color='green'> Encryption Key Available!!</font>");
					completeCheck = true;
				}
			}
		});
	}
}
var keyflag;
function checkDuplicateEncryptionKeyEdit(){
	var encryptionKey=$("#encryptionKeyId").val().trim();
	if(encryptionKey.length==0){
		$('#encryptionKeyErrorId').html("<font color='red'>Enter unique encryption key.</font>");
		flag="false";}
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}
	var completeCheck=true;
	$.ajax({
		url: 'checkDuplicateEncryptionKeyEdit',
		type:'POST',
		data:'encryptionKey='+encryptionKey+'&groupCode='+groupCode+'&parentId='+parentId,
		success:function(response)
		{
			if(response!=0)
			{
				$('#encryptionKeyId1').hide();
				$('#encryptionKeyErrorId').show();
				$('#encryptionKeyErrorId').html("<font color='red'>Encryption Key already exists!!</font>");
				$('#encryptionKeyId').val('');
				keyflag = false;
			}else
			{
				$('#encryptionKeyErrorId').html("<font color='green'> Encryption Key Available!!</font>");
				keyflag = true;
			}
		}
	});
	return keyflag;
}



var coid=0;
function getId(companyName){

	$.ajax({
		url: 'ajax/getIdbyCompanyName',
		type:'POST',
		data:'companyName='+companyName,
		success:function(response)
		{
			coid=response;
		}
	});



}

function validateAccountEditForm(event,ediOrNew){
	var flag=true;
	var editfinalflag=true;
	var companyName=$("#companyNameId").val();
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	var pinCode=$('#pinCode').val().trim();
	if(pinCode.length==0){
		$('#div_pinCode').addClass('has-error');

		event.preventDefault();

		flag="false";
	}
	
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}

	$('#submitDIV').hide()
	$('#submitWaitDIV').show();
	
	var groupCode=$("#hiddenAccountGroupCode").val();
	if(groupCode=='DI'){
		if($("#hostId").val()==''){

			$("#div_hostId").addClass('has-error');
			$("#hostId1").hide();
			$('#hostErrorId').show();
			$('#hostErrorId').html("<font color='red'>Select host.</font>");
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}
	}
	else if(groupCode=='SD'){
		if($("#hostId").val()==''){
			$("#div_hostId").addClass('has-error');
			$("#hostId1").hide();
			$('#hostErrorId').show();
			$('#hostErrorId').html("<font color='red'>Select host.</font>");
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}
		if($("#distributorId").val()==''){
			
			flag="false";
		}
		else{
			$('#distributorErrorId').html("");
		}
	}
	else if(groupCode=='RE'){
		if($("#hostId").val()==''){
			$("#div_hostId").addClass('has-error');
			$("#hostId1").hide();
			$('#hostErrorId').show();
			$('#hostErrorId').html("<font color='red'>Select host.</font>");
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}

		if($("#distributorId").val()==''){
			
			flag="false";
		}
		else{
			$('#distributorErrorId').html("");
		}

		if($("#subDistributorId").val()==''){
		
			flag="false";
		}
		else{
			$('#subDistributorErrorId').html("");
		}
	}
	else if(groupCode=='BC'){
		if($("#hostId").val()==''){
			$("#div_hostId").addClass('has-error');
			$("#hostId1").hide();
			$('#hostErrorId').show();
			$('#hostErrorId').html("<font color='red'>Select host.</font>");
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}

		if($("#distributorId").val()==''){
			$("#distributorId1").hide();
			$('#distributorErrorId').show();
			$('#distributorErrorId').html("<font color='red'>Select disitributor.</font>");
			flag="false";
		}
		else{
			$('#distributorErrorId').html("");
		}

		if($("#subDistributorId").val()==''){
			$("#subDistributorId1").hide();
			$('#subDistributorErrorId').show();
			$('#subDistributorErrorId').html("<font color='red'>Select sub-disitributor.</font>");
			flag="false";
		}
		else{
			$('#subDistributorErrorId').html("");
		}

		if($("#retailerId").val()==''){
			$("#retailerId1").hide();
			$('#retailerErrorId').show();
			$('#retailerErrorId').html("<font color='red'>Select retailer.</font>");
			flag="false";
		}
		else{
			$('#retailerErrorId').html("");
		}
	}
	
	if($("#companyNameId").val()==''){
		$('#div_companyNameId').addClass('has-error');

		flag="false";
	}
	else{
		var cname=$("#companyNameId").val();
		if(cname.length==0){
			$('#div_companyNameId').addClass('has-error');

			flag="false";
		}else{
			$('#companyNameErrorId').html("");
		}

	}
	var address=$('#address').val().trim();
	
	if(address.length==0||address==undefined){
	     $('#div_address').addClass('has-error');
	   //  document.getElementById("label_address").style.color = "red";
		flag="false";
	}
	var state=$('#state').val().trim();
	if(state.length==0){
		 $('#div_state').addClass('has-error');
		// document.getElementById("label_state").style.color = "red";

		flag="false";
	}
	else{
		$('#stateErrorId').html("");
	}
	var country=$('#country').val().trim();
	if(country.length==0){
		 $('#div_country').addClass('has-error');
		// document.getElementById("label_country").style.color = "red";

		flag="false";
	}
	else{
		$('#countryErrorId').html("");
	}

	if($('#locality').val().length==0)
	{
		//document.getElementById("label_locality").style.color = "red";
		$("#div_locality").addClass('has-error');
		flag ="false";

	}
	if($('#district').val().length==0)
	{
		//document.getElementById("label_district").style.color = "red";
		$("#div_district").addClass('has-error');
		flag ="false";

	}
	var emailId=$('#emailId').val().trim();
	if(emailId.length==0){
		 $('#div_emailId').addClass('has-error');
	
		flag="false";
	}
	var countryCodeId=$("#countryCodeId").val().trim();
	if((countryCodeId.length==0)){
		$('#div_countryCodeId').addClass('has-error');
	
		flag="false";
	}else{
		$('#countryCodeerroeId1').html("");
	}
	

	var mobileNumber=$("#mobileNumber").val().trim();
	if((mobileNumber.length==0)){
		$('#div_mobileNumberId').addClass('has-error');
	
		flag="false";
	}else{
		$('#mobileNumberErrorId').html("");
	}
	
	var altmobileNumber=$('#alternateMobileNumber').val().trim();
	var altcountryCodeId=$('#altCountryCodeId').val().trim();
	 if((altmobileNumber!=0)){
		 if(altmobileNumber.length<10){
			 $('#altCountryCodeErrorId_div').addClass('has-error');
			 
			 $('#alternateMobileNoErrorId').show();
				$('#alternateMobileNo').val('');
				$('#alternateMobileNoErrorId').html("<font color='red'>Mobile Number should be 10 digit long.</font>")
				return false;
			 
		 }
		 if(altcountryCodeId==0){
			 $('#altCountryCodeErrorId_div').addClass('has-error');

				flag="false";
		 }
		 
	 }
	if(groupCode=='HO'){
		if($("#deploymentTypeId").val()=='SAAS'){
			if($("#gatewayIpId").val()==''){


				$('#divID_gatewayIp').addClass('has-error');

				flag="false";
			}
			
			else{


				/*if(!iPAddressRegex.test($("#gatewayIpId").val())){
					$('#gatewayIpId1').hide();
					$('#gatewayIpErrorId').show();
					$('#gatewayIpErrorId').html("<font color='red'>Enter valid IP.</font>");
					flag="false";
				}
				else{
					$('#gatewayIpErrorId').html(""); 
				}*/

			}
		}
		else{
			var gatewayIp=$("#gatewayIpId").val().trim();
			var porTId=$("#portId").val().trim();
			var urLId=$("#urlId").val().trim();
			
			if(gatewayIp.length>0){

				$('#div_gatewayIp').addClass('has-error');

				flag="false"; 

			}
			if(gatewayIp.length>0 && porTId.length==0 ){

				$('#div_port').addClass('has-error');

				flag="false"; 

			}
			if(gatewayIp.length==0 && porTId.length>0 ){

				$('#divID_gatewayIp').addClass('has-error');

				flag="false"; 

			}
			if(gatewayIp.length==0 && porTId.length==0 ){
				
				if(urLId.length==0)
				{
					
					$('#urlId1').hide();
					$('#urlErrorId').show();
					$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
					$("#gatewayIpId1").hide();
					$('#gatewayIpErrorId').show();
				//	$('#gatewayIpErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
					flag="false";
				}
			} 
				
			
			if(gatewayIp.length!=0 && porTId.length==0 &&urLId!=0 )
				
				{
				$("#gatewayIpId").val(" ");
				$("#portId").val(" ");
				$("#urlId").val(" ");
			$('#urlId1').hide();
			$('#urlErrorId').show();
			
			$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL</font>");
			$("#gatewayIpId1").hide();
			$('#gatewayIpErrorId').show();
			$('#gatewayIpErrorId').html("<font color='red'>Enter either IP and Port or URL</font>");
			$('#portErrorId').show();
			$("#portErrorId").html("<font color='red'>Enter either IP and Port or URL</font>");
			flag="false";
				
				
				
				}
			
			if(gatewayIp.length==0 && porTId.length!=0 &&urLId!=0 )
				
			{
			$("#gatewayIpId").val(" ");
			$("#portId").val(" ");
			$("#urlId").val(" ");
		$('#urlId1').hide();
		$('#urlErrorId').show();
		
		$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL</font>");
		$("#gatewayIpId1").hide();
		$('#gatewayIpErrorId').show();
		$('#gatewayIpErrorId').html("<font color='red'>Enter either IP and Port or URL</font>");
		
		$('#portErrorId').show();
		$("#portErrorId").html("<font color='red'>Enter either IP and Port or URL</font>");
		flag="false";
			
			
			
			}
			
			
			if(gatewayIp.length!=0 && porTId.length!=0 && urLId!=0){
				$("#gatewayIpId").val(" ");
					$("#portId").val(" ");
					$("#urlId").val(" ");
				$('#urlId1').hide();
				$('#urlErrorId').show();
				
				$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
				$("#gatewayIpId1").hide();
				$('#gatewayIpErrorId').show();
				//$('#gatewayIpErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
				flag="false";
			}
			var uploadedfile=$("#uploadedfile").html();
			if(uploadedfile.length==1){
				var fl=checkImageSizeAndExtension();
				if(fl==false){
					flag="false";
				}
			}
		}
	}

	if(flag=="true")
		{
		return true;
		}
	if(flag=="false")
		{
		event.preventDefault();
		return false;
		
		}
	
}


//======================= account creation submit ===========================
function validateAccountCreationForm(event,ediOrNew){
	var flag="true";
	var companyName=$("#companyNameId").val();
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}
	$('#submitDIV').hide();
	$('#submitWaitDIV').show();
	var regURL = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	var iPAddressRegex= /\b(?:\d{1,3}\.){3}\d{1,3}\b/;

	var groupCode=$("#hiddenAccountGroupCode").val();
	if(groupCode=='DI'){
		if($("#hostId").val()==''){
			$('#div_hostId').addClass('has-error');
		//	hostId1 frr
			document.getElementById("hostId1").style.color = "red";
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}
	}
	else if(groupCode=='SD'){
		if($("#hostId").val()==''){
			$('#div_hostId').addClass('has-error');
	
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}
		if($("#distributorId").val()==''){
			$('#div_distributorId').addClass('has-error');
			//distributorId f
			document.getElementById("distributorId1").style.color = "red";
			flag="false";
		}
		else{
			$('#distributorErrorId').html("");
		}
	}
	else if(groupCode=='RE'){
		if($("#hostId").val()==''){
			$('#div_hostId').addClass('has-error');
			document.getElementById("hostId1").style.color = "red";
			flag="false";
		}
		else{
			$('#hostIdErrorId').html("");
		}

		if($("#distributorId").val()==''){
			$('#div_distributorId').addClass('has-error');
			document.getElementById("distributorId1").style.color = "red";
			flag="false";
		}
		else{
			$('#distributorErrorId').html("");
		}

		if($("#subDistributorId").val()==''){
			$('#div_subDistributorId').addClass('has-error');
	
			flag="false";
		}
		else{
			$('#subDistributorErrorId').html("");
		}
	}
	else if(groupCode=='BC'){
		if($("#hostId").val()==''){
			$('#div_hostId').addClass('has-error');
			/*$('#hostId1').hide();
			$('#hostIdErrorId').show();
			$('#hostIdErrorId').html("<font color='red'>Select host.</font>");*/
			flag="false";
		}
		else{
			$('#hostErrorId').html("");
		}

		if($("#distributorId").val()==''){
			$('#div_distributorId').addClass('has-error');

			flag="false";
		}
		else{
			$('#distributorIdErrorId').html("");
		}

		if($("#subDistributorId").val()==''){

			$('#div_subDistributorId').addClass('has-error');
			flag="false";
		}
		else{
			$('#subDistributorIdErrorId').html("");
		}
		if($("#retailerId").val()==''){
			$('#retailerId1').hide();
			$('#retailerIdErrorId').show();
			$('#retailerIdErrorId').html("<font color='red'>Select retailer.</font>");
			flag="false";
		}
		else{
			$('#retailerErrorId').html("");
		}
	}
	if($("#companyNameId").val()==''){
		$('#div_companyNameId').addClass('has-error');

		flag="false";
	}
	else{
		var cname=$("#companyNameId").val();
		cname = cname.replace(/\s/g,'');
		if(cname.length==0){
			$('#div_companyNameId').addClass('has-error');

			flag="false";
		}else{
			$('#companyNameErrorId').html("");
		}
	}
	if($('#locality').val().length==0)
	{
		//document.getElementById("label_locality").style.color = "red";
		$("#div_locality").addClass('has-error');
		flag="false";
		//completeCheck =false;

	}
	if($('#addressIdDefault').val().length==0||$("#addressIdDefault").val()==undefined)
	{
		
		$("#div_address").addClass('has-error');
		flag="false";
		//completeCheck =false;

	}
	if($('#district').val().length==0)
	{
		//document.getElementById("label_district").style.color = "red";
		$("#div_district").addClass('has-error');
		flag="false";
		//completeCheck =false;

	}
	if($('#state').val().length==0)
	{
		//document.getElementById("label_state").style.color = "red";
		$("#div_state").addClass('has-error');
		flag="false";
		//completeCheck =false;

	}
	if($('#country').val().length==0)
	{
		//document.getElementById("label_country").style.color = "red";
		$("#div_country").addClass('has-error');
		flag="false";
		//completeCheck =false;

	}
	var emailId=$('#emailId').val().trim();
	if(emailId.length==0){
		$('#div_emailId').addClass('has-error');


		flag="false";
	}
	
	var pinCode=$('#pinCode').val().trim();
	if(pinCode.length==0){
		$('#div_pinCode').addClass('has-error');

		event.preventDefault();

		flag="false";
	}
	var countryCodeId=$("#countryCodeId").val().trim();
	var mobileNumber=$("#mobileNumber").val().trim();

	if((countryCodeId.length==0)&&(mobileNumber.length==0)){
		$('#div_mobileNumber').addClass('has-error');

		$('#div_countryCodeId').addClass('has-error');



		flag="false";

	}
	else{
		if((countryCodeId.length==0)&&(mobileNumber.length!=0)){
			$('#div_countryCodeId').addClass('has-error');
			flag="false";

		}
		if((countryCodeId.length!=0)&&(mobileNumber.length==0)){
			$('#div_mobileNumber').addClass('has-error');

			flag="false";
		}

	}

	var altcountryCodeId=$("#altCountryCodeId").val().trim();
	var altmobileNumber=$("#alternateMobileNumber").val().trim();

 if((altmobileNumber.length!=0)){
	 if(altmobileNumber.length<10){
		 $('#altCountryCodeErrorId_div').addClass('has-error');
		 $('#alternateMobileNoErrorId').show();
			$('#alternateMobileNumber').val('');
			$('#alternateMobileNoErrorId').html("<font color='red'>Mobile Number should be 10 digit long.</font>")
			return false;
	 }
	 if(altcountryCodeId==0){
		 $('#altCountryCodeErrorId_div').addClass('has-error');

			flag="false";
	 }
	 
	   
   }else{
	   
	   
   }


	/*var address=$('#address').val().trim();
	if(address.length==0){
		$('#div_address').addClass('has-error');

		flag="false";
	}

	
	var state=$('#state').val().trim();
	if(state.length==0){
		$('#div_state').addClass('has-error');
	}*/

	if(groupCode=='HO'){
		if($("#deploymentTypeId").val()=='SAAS'){
			if($("#gatewayIpId").val()==''){


				$('#divID_gatewayIp').addClass('has-error');

				flag="false";
			}
			else{


				if(!iPAddressRegex.test($("#gatewayIpId").val())){
					$('#gatewayIpId1').hide();
					$('#gatewayIpErrorId').show();
					$('#gatewayIpErrorId').html("<font color='red'>Enter valid IP.</font>");
					flag="false";
				}
				else{
					$('#gatewayIpErrorId').html(""); 
				}

			}
		}
		else{
			var gatewayIp=$("#gatewayIpId").val().trim();
			var porTId=$("#portId").val().trim();
			var urLId=$("#urlId").val().trim();
			if(gatewayIp.length>0 && porTId.length==0 ){

				$('#div_port').addClass('has-error');

				flag="false"; 

			}
			if(gatewayIp.length==0 && porTId.length>0 ){

				$('#divID_gatewayIp').addClass('has-error');

				flag="false"; 

			}
			if(gatewayIp.length==0 && porTId.length==0 ){
				if(urLId.length==0)
				{

					$('#urlId1').hide();
					$('#urlErrorId').show();
					$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
					
					flag="false";
				}
			} 

			else if($("#gatewayIpId").val()=='' && $("#portId").val()==''){
				if($("#urlId").val()==''){

					$('#urlId1').hide();
					$('#urlErrorId').show();
					$('#urlErrorId').html("<font color='red'>Enter either IP and Port or URL.</font>");
					flag="false";
				}
				else{
					var url=$("#urlId").val();
					url = url.replace(/\s/g,'');
					if(url.length==0){

						$('#urlId1').hide();
						$('#urlErrorId').show();
						$('#urlErrorId').html("<font color='red'>Enter either URL or IP and Port.</font>");
						flag="false";
					}
					else if(!regURL.test(url)){

						$('#urlId1').hide();
						$('#urlErrorId').show();
						$('#urlErrorId').html("<font color='red'>Enter valid URL.</font>");
						flag="false";
					}
					else{
						$('#urlErrorId').html("");
					}

				}
			}

			else{
				$('#urlErrorId').html("");
				if($("#gatewayIpId").val()==''){


					$('#divID_gatewayIp').addClass('has-error');
					
					flag="false";
				}
				else{
					if(!iPAddressRegex.test($("#gatewayIpId").val())){

						flag="false";
					}
					else{
						$('#gatewayIpErrorId').html(""); 
					}
				}

				if($("#portId").val()==''){
					$('#div_port').addClass('has-error');
			
					flag="false";
				}
				else{
					if($("#portId").val().length!=4){
						$("#portId1").hide();
						$('#portErrorId').show();
						$('#portErrorId').html("<font color='red'>Enter 4-digit port.</font>");
						 $("#portId").val('');
						flag="false";
					}else{
						var firstChar=$("#portId").val().charAt(0);
						if(parseInt(firstChar)==0){
							$("#portId1").hide();
							$('#portErrorId').show();
							$('#portErrorId').html("<font color='red'>Enter valid port.</font>");
							flag="false";
						}else{
							$('#portErrorId').html("");
						}
					}



				}
			}
		}
	}

	if(flag=="true"){

		if(checkDuplicateAccount()){
			$('#submitDIV').show();
			$('#submitWaitDIV').hide();
			event.preventDefault();
			flag="false";
		}

		else{

			flag="true";
		}


	}
	if(flag=="false"){
		$('#submitDIV').show();
		$('#submitWaitDIV').hide();
		event.preventDefault();
		return false;

	}

	if(flag=="true")
	{

		return true;
	}



}
function checkDuplicateEncryptionKy(){
	var encryptionKey=$("#encryptionKeyId").val().trim();
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}
	var editFlag = function(){
		var completeCheck=true;	
		if(encryptionKey.length!=0) {
			$.ajax({
				url: 'checkDuplicateEncryptionKey',
				async: false,
				type:'POST',
				data:'encryptionKey='+encryptionKey+'&groupCode='+groupCode+'&parentId='+parentId,
				success:function(response)
				{
					if(response!=0)
					{
						$('#encryptionKeyId1').hide();
						$('#encryptionKeyErrorId').show();
						$('#encryptionKeyErrorId').html("<font color='red'>Encryption Key already exists!!</font>");
						$('#encryptionKeyId').val('');
						completeCheck = false;
					}else
					{
						$('#encryptionKeyErrorId').html("<font color='green'> Encryption Key Available!!</font>");

						completeCheck = true;
					}
				}
			});
		}
		return completeCheck;
	}();
	return editFlag;
}

function checkDuplicateEncryptionKyEdit(){
	var encryptionKey=$("#encryptionKeyId").val().trim();
	var groupCode=$("#hiddenAccountGroupCode").val();
	var parentId=0;
	if(groupCode=='DI'){
		parentId=$("#hostId").val();
	}
	else if(groupCode=='SD'){
		parentId=$("#distributorId").val();
	}
	else if(groupCode=='RE'){
		parentId=$("#subDistributorId").val();
	}
	else if(groupCode=='BC'){
		parentId=$("#retailerId").val();
	}
	if(encryptionKey.length!=0) {	 
		$.ajax({
			url: 'checkDuplicateEncryptionKeyEdit',
			async: false, 
			type:'POST',
			data:'encryptionKey='+encryptionKey+'&groupCode='+groupCode+'&parentId='+parentId,
			success:function(response)
			{
				if(response!=0)
				{
					$('#encryptionKeyErrorId').html("<font color='red'>Encryption Key already exists!!</font>");
					$('#encryptionKeyId').val('');
					fflag = false;
				}else
				{

					$('#encryptionKeyErrorId').html("<font color='green'> Encryption Key Available!!</font>");

					fflag = true;
				}
			}
		});
		return fflag;
	}
}

function getMobileIdArray(){
	var input = document.getElementsByTagName('input');
	var mobileArr=[];
	for (var counter=0; counter<input.length; counter++) {
		if (input[counter].type=='text' && input[counter].name=='mobileArr') {
			mobileArr.push(input[counter].id);  
		}
	}
	return mobileArr;
}

function getLoginNameIdArray(){
	var input = document.getElementsByTagName('input');
	var loginNameArr=[];
	for (var counter=0; counter<input.length; counter++) {
		if (input[counter].type=='text' && input[counter].name=='loginNameArr') {
			loginNameArr.push(input[counter].id);  
		}
	}
	return loginNameArr;
}

function checkDuplicateMobile(id){
	var num = id.replace( /^\D+/g, '');
	var mobile=$("#"+id).val();
	//========== ajax call ==============
	$.ajax({
		url: 'ajax/checkDuplicateMobile',
		type: 'POST',
		data: 'mobile='+mobile,
		success: function(data) {
			var flag=data.flag;
			if(flag==true){
				$('#mobileErrorId'+num).html("<font color='red'>Mobile already exists.</font>");
				$("#"+id).val('');
			}
		},
		error: function(e) {
		}

	});
}

function checkDuplicateLoginName(id){
	var num = id.replace( /^\D+/g, '');
	var loginName=$("#"+id).val();
	//========== ajax call ==============
	$.ajax({
		url: 'ajax/checkDuplicateLoginName',
		type: 'POST',
		data: 'loginName='+loginName,
		success: function(data) {
			var flag=data.flag;
			if(flag==true){
				$('#loginNameErrorId'+num).html("<font color='red'>Login name already exists.</font>");
				$("#"+id).val('');
			}
		},
		error: function(e) {
		}

	});
}

$(document).ready(function(){
	$("#deploymentTypeId").change(function() {
		var id = $(this);
		var value=id.val();
		if(value=='SAAS'){
			$("#portRow").hide();
			$('#urlErrorId').html("");
		}
		else{
			$("#portRow").show();
		}
	});
});



$(document).ready(function(){
	$("#accountTypeId").change(function() {
		$('#msgId').html("");
	});
});

$(document).ready(function(){
	var groupCode=$("#hiddenLoginGroupCodeId").val();
	if(groupCode!='PP'){
		$("#hostRowId").hide();
	}
});

function showLogo(){
	var src=$('#logoImage').attr('src');
	if(src!=''){
		var lastIndex=src.lastIndexOf("/");
		var imageName=src.substring(lastIndex+1);
		$("#logoName").html(imageName);
	}
}

function makeDropDownReadOnly(hiddenAccountTypeId){
	var accountType=$("#"+hiddenAccountTypeId).val();
	if(accountType=='DI'){
		makeDropdownReadonly('hostId');
	}
	else if(accountType=='SD'){
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
	}
	else if(accountType=='RE'){
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
		makeDropdownReadonly('subDistributorId');
	}
	else if(accountType=='BC'){ 
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
		makeDropdownReadonly('subDistributorId');
		makeDropdownReadonly('retailerId');
	}

}

function emptyMessage(){
	$('#msgId').html("");
}

function validateHost() {

	var hostIdVal=$("#hostId").val();

	if($("#hostId").val()==''){

		$('#div_hostId').addClass('has-error');

		return false;
	}

	else if(hostIdVal.length>0){

		$("#hostRowId").show();
		$("#host").show();
		$("#host1").show();
		$("#host2").show();
		$("#hostId").show();

	}

	if(sel=='HOST')
	{

		$("#hostRowId").show();
		$("#host").show();
		$("#host1").show();
		$("#host2").show();
		$("#hostId").show();
		$("#vendor1").hide();
		$("#vendor").hide();
		$("#vendor2").hide();
		$("#table_id").hide();
		$("#header1").hide();

	}

	$("#hostId").show();



}

function validatevendor() {

	if($("#vendorId").val()==''){
		$('#div_vendorId').addClass('has-error');
		return false;
	}


}

function emptyLanmarkErrorId(){
	$('#landMarkErrorId').html("");
}

function emptyHostErrorId(){
	$('#hostErrorId').html("");
}

function disappearMsg(){
	$('#successmsg1').html("");
	$('#errormsg1').html("");

}

function fetchAddress(){
	completeCheck =true;
	$('#buttonClickErrorId').html("");
	var pinCode = $('#pinCode').val().trim(); 
	if(!pinCode.length>0 ){
		$("#div_pinCode").addClass('has-error');
	}else if(pinCode.length<6 ){
		$('#addressErrorId').html("<font color='red'>PIN Code should be 6 digit long.</font>");
		completeCheck=false;
	}
	else if(((pinCode<=110000)||(pinCode>=855118)) && completeCheck==true){
		$('#addressErrorId').html("<font color='red'>Kindly enter valid PIN Code.</font>");
		completeCheck=false;
	}


	
	if(completeCheck==true){
		if(pinCode.length>0){
			$('#addressSelectTableId').show();
			$.ajax({
				url: "ajax/fetchAddress",
				dataType:'json',
				type: "POST",
				async:false,
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
						$("#pinCodeFlag").val("0");
						
					}else{
						
						$('#addressErrorId').html("<font color='red'>Change PinCode to Fetch Address or Fill Address Manually</font>");
						$('#addressSelectTableId').html("");
						$("#pinCodeFlag").val('1');
						$('#pinaddressId').val("");
						$('#locality').attr('readonly', false);
						$('#district').attr('readonly', false);
						$('#region').attr('readonly', false);
						$('#state').attr('readonly', false);
						$('#country').attr('readonly', false);
						
						completeCheck=false;
					}
				}
			});	
			
		}
	}
	if(completeCheck==false)
		{
		$('#addressSelectTableId').html("");
		$('#lab_pinCodeErrorId').removeClass("collapse");
		$('#lab_pinCodeErrorId').addClass("valid");
		$('#label_pinCode').removeClass("valid");
		$('#label_pinCode').addClass("collapse");
		return false;
		}
	
	return true;
}

function clearField(labelId,ErrorId)
{
	$("#"+labelId).removeClass("collapse");
	$("#"+labelId).addClass("valid");
	$("#pinCode").val("");
	$("#"+ErrorId).removeClass("valid");
	$("#"+ErrorId).addClass("collapse");
	$('#lab_pinCodeErrorId').html("");
	$('#addressErrorId').html("");
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
		selecttag1('label_locality');
		selecttag1('label_region');
		selecttag1('label_district');
		selecttag1('label_state');
		selecttag1('label_country');
		removeHasError('div_pinCode');
		removeHasError('div_country');
		removeHasError('div_state');
		removeHasError('div_district');
		removeHasError('div_locality');
		removeHasError('div_region');
		$('#addressSelectTableId').hide();

	}
}


function textAreaAdjust(el) {
	el.style.height = (el.scrollHeight > el.clientHeight) ? (el.scrollHeight)+"px" : "60px";
}


function pinLength(event,lab_pinCodeErrorId){

	var pinLength=$('#pinCode').val();
	if(pinLength<6){

		$('#lab_pinCodeErrorId').html("<font color='red'>PIN Code should be 6 digit long.</font>")
		return false;
	}
}

function changePinCode(msg){
	if(msg){
		var address=$('#address').val('');
		var address2=$('#address2').val('');
		var locality=$('#locality').val('');
		var district=$('#district').val('');
		var country=$('#country').val('');
		var region=$('#region').val('');
		var state=$('#state').val('');
	}
}


function mobLength(event,mobile,mobileNumberErrorId){

	var mobLength=$('#'+mobile).val().trim();
	if(mobLength!=0){
	if(mobLength.length<10){
		$('#userMobileErrorId').show();
		$('#mobileNumber').val('');
		$('#userMobileErrorId').html("<font color='red'>Mobile Number should be 10 digit long.</font>")
		return false;
	}
	}
	
}

var check=true;
function checkUniqueUserEmail(){
	var userEmailId =$("#emailId").val();

	 var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if (!reg.test(userEmailId)){
		 
		 
		 $('#emailId1').hide();
		 $('#emailIdErrorId').show();
		 
		 $('#emailIdErrorId').html("<font color='red'> Not a valid Email-id</font>");
		 $('#emailId').val('');
	 return false;
	}
	
	 else {
		$.ajax({
			type: "post",
			async:false,
			url: 'ajax/checkUniqueUserEmailId',
			cache: false,
			dataType: "json",
			data:{userEmailId :userEmailId},
			success: function(response){
				if(response!=""){
					check=false;
					$("#emailId").val('');
					$('#emailIdErrorId').show();
					$('#emailIdErrorId').html("<font color='red'>"+response+"</font>");
					
				}else{
					$("#finalFlag").val("");
				}
			},	error: function(errorThrown){ return false;	}
		});
	}

	return check;
}
function checkUniqueUserEmailId(){
	var userEmailId =$("#emailId").val();

	 var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if (!reg.test(userEmailId)){
		 
		 
		 $('#emailId1').hide();
		 $('#emailIdErrorId').show();
		 
		 $('#emailIdErrorId').html("<font color='red'> Not a valid Email-id</font>");
		 $('#emailId').val('');
	 return false;
	}
	
	 else {
		$.ajax({
			type: "post",
			async:false,
			url: 'ajax/checkUniqueUserEmailId',
			cache: false,
			data:{userEmailId :userEmailId},
			success: function(response){
				if(response!=""){
					check=false;
					$("#emailId").val('');
					$('#emailIdErrorId').show();
					$('#emailIdErrorId').html("<font color='red'>"+response+"</font>");
					
				}else{
					$("#finalFlag").val("");
				}
			},	error: function(errorThrown){ return false;	}
		});
	}

	return check;
}

function validateURL(URLField){
	var re = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
	if (!re.test(URLField.value)) { 
		 $('#urlId1').hide();
		 $('#urlErrorId').show();
		 
		 $('#urlErrorId').html("<font color='red'> Not a valid URL</font>");
		 $('#urlId').val('');
	 return false;
	}

}

function checkUniqueUserMobileNumber(){

	var check=true;
	var userMobile=$("#mobileNumber").val().trim();
	$.ajax({
		type: "get",
		url: 'ajax/checkUniqueUserMobileNumber',
		async: false,
		data:{userMobile :userMobile},
		success: function(response){
			if(response!=""){
				check= false;
				$("#mobileNumber").val('');
				$("#finalFlag").val('false');
				$("#mobileNumberErrorId").show();
				$('#mobileNumberErrorId').html("<font color='red'>"+response+"</font>");

			}else{
				$("#finalFlag").val("");
			}
		},	error: function(errorThrown){ 


			return false;	}
	});
	return check;
}

var radioboxid;
function getRaioTextValue(selectedRadioTdId,divId){


	$("#newPassword").val('');
	$("#cnfPassword").val('');

	$("#lable_cnfPasswordErrorId").html('');
	$("#lable_emailOrUserIdErrorId").html('');
	$('#newPassword').attr("value", "");
	$('#cnfPassword').attr("value", "");
	$("#lable_emailOrUserIdErrorId").html('');
	$("#lable_newPasswordErrorId").html("");
	$("#lable_cnfPasswordErrorId").html('');

	$("#emailMobileUserTextboxTable").remove();
	$('#notMatchMessage').html('');

	var selectedRadioType=$("#"+selectedRadioTdId).text().trim();
	radioboxid=selectedRadioType;


	var errorId="'lable_emailOrUserIdErrorId'";
	if(selectedRadioType==='Mobile Number'){

		var html='<table id="emailMobileUserTextboxTable" width="60%">'+
		'<tr id="emailMobileUserTextbox">'+
		'<td id="selectedRadioTypeId" align="right" width="45%"><font color="red">*&nbsp;</font>'+selectedRadioType+'&nbsp;:&nbsp;&nbsp;</td><td width="55%" align="left"><input type="text" id="emailOrUserId" name="'+selectedRadioType+'" maxlength="10" onkeypress="onlyNumric(event,'+errorId+');validatemob();" onclick="emptyerror(event,'+errorId+');" /></td>'+
		'</tr>'+
		'<tr><td  width="45%"></td><td width="55%" id="lable_emailOrUserIdErrorId" align="left"></td></tr>'+
		'</table>';
	}else{
		var html='<table id="emailMobileUserTextboxTable" width="60%">'+
		'<tr id="emailMobileUserTextbox">'+
		'<td id="selectedRadioTypeId" align="right" width="45%"><font color="red">*&nbsp;</font>'+selectedRadioType+'&nbsp;:&nbsp;&nbsp;</td><td width="55%" align="left"><input type="text" id="emailOrUserId" name="'+selectedRadioType+'" onclick="emptyerror(event,'+errorId+');" onkeypress="validatemob();"/></td>'+
		'</tr>'+
		'<tr><td  width="45%"></td><td width="55%" id="lable_emailOrUserIdErrorId" align="left"></td></tr>'+
		'</table>';
	}
	$(html).appendTo($("#"+divId));
	$("#"+divId).show();





	$('#resetByErrorId').html("");

}

function validateResetPasswordPage(){

	var completeCheck = true;



	//********************************* Check Radio Button ************************************************
	if(!($('#email').is(":checked")) && (!($('#mobile').is(":checked"))) && (!($('#userName').is(":checked"))))
	{
		$('#resetByErrorId').html("");
		$('#resetByErrorId').html("<font color='red'>Kindly check atleast one radio button !</font>");
		completeCheck = false;
	}
	else{
		var emailMobileUserId=$("#emailOrUserId").val().trim();
		var selectedRadioType=$("#selectedRadioTypeId").text().trim();
		if(emailMobileUserId.length<=0){

			$("#lable_emailOrUserIdErrorId").html('<font color=red>Kindly enter  '+selectedRadioType.substring(2,selectedRadioType.length-1)+ '</font>');
			completeCheck = false;
		}
	}

	var newPassword=$("#newPassword").val();


	if(newPassword.length<=0){

		$("#lable_newPasswordErrorId").html("<font color='red'>Kindly enter new password</font>");
		completeCheck = false;
	}
	var cnfPassword =$("#cnfPassword").val();

	if(cnfPassword.length<=0){
		$("#lable_cnfPasswordErrorId").html("<font color='red'>Kindly enter confirm password</font>");
		completeCheck = false;
	}
	if(newPassword!==cnfPassword){

		$("#lable_cnfPasswordErrorId").html("<font color='red'>Password does not match</font>");
		completeCheck = false;
	}


	if(!completeCheck){

		return false;
	}





}

function validatemob()
{
	var emailId=$("input[name='Email']").val();
	var mobno=$("input[name='Mobile Number']").val();
	var user=	$("input[name='UserName']").val();
	if(radioboxid==='Mobile Number')
	{
		$("#emailOrUserId").autocomplete({  

			source : function(request, response) {


				$.ajax({
					url : "userMobileNoUrl",
					type : "GET",
					dataType: "json",
					data :'mobno='+mobno, 
					success : function(data) {
						response($.map(data, function (item) {
							return item.split(",");
						})); 
					}
				});
			}
		});

	}
	if(radioboxid==='user'){
		$("#emailOrUserId").autocomplete({  

			source : function(request, response) {


				$.ajax({
					url : "userNameUrl",
					type : "GET",
					dataType: "json",
					data :'user='+user, 
					success : function(data) {
						response($.map(data, function (item) {
							return item.split(",");
						})); 
					}
				});
			}
		});	
	}
	if(radioboxid==='Email')
	{
		$("#emailOrUserId").autocomplete({  

			source : function(request, response) {


				$.ajax({
					url : "useremailUrl",
					type : "GET",
					dataType: "json",
					data :'emailId='+emailId, 
					success : function(data) {
						response($.map(data, function (item) {
							return item.split(",");
						})); 
					}
				});
			}
		});
	}
}

var radio="";
function radioSelect(identity)
{
	radio="";
	radio=identity;
}


function onkeyUpp()

{$('#table_id').html("");}


function nameSelect() {
	$("#select_onbehalf")
	.autocomplete( 
			{ 
				source : function(request, response) {
					var adminUi = "/AdminUI";
					var tagName = $("#select_onbehalf").val();
					var contextPath = $("#contextPath").val();
					var hostId = $("#hostId").val();
					var controllerPath = contextPath + adminUi
					$
					.ajax({
						url : controllerPath
						+ "/autosearch/getTags",
						type : "GET",
						data : 'tagName=' + tagName + '&radio='
						+ radio + '&hostId=' + hostId,
						success : function(data) {
							if (data.length == 0) {
								$('#onbehalfErrorId').html("<font color='red'>Name Does Not Exist</font>");
							}
							response($.map(data,
									function(item) {
								return item.split(",");
							}));
						}
					});
				},
				select: function (event, ui) { 
					getInfo(); }


			});
}

function getInfo()
{

	var personDetails = $("#select_onbehalf").val();
	$("#SearchByTable").show();
	$("#SearchBy").show();
	$("#accountSearchBy").show();
	$("#SearchByAutoSearch").show();


	var adminUi = "/AdminUI";
	var contextPath = $("#contextPath").val();
	var controllerPath = contextPath + adminUi
	$.ajax({
		type: "get",
		dataType: "json",
		url : controllerPath
		+ "/autosearch/getInfo",
		data : 'personDetails=' + personDetails,
		success: function(response){
			var valuess=response;
			if (valuess.companyName==null) 
			{
				$('#onbehalfErrorId').html("<font color='red'>There are no accounts to display.</font>");
				$('#template_details').html('');
			}
			else
			{
				$("#SearchByTable").show();
				$('#table_id').html("");
				$('#table_id').html('<thead><tr class="mainTableHeader"><th>Company Name</th><th>Account Type</th><th>Address</th><th>Phone Number</th><th>E-mail Id</th><th>Host</th><th>Distributor</th><th>Sub-Distributor</th><th>Agent</th><th>Action</th></tr></thead><tbody>');
				$('#table_id').append('<tr><td align="center">'+valuess.companyName+'</td><td align="center">'+valuess.accountType+'</td><td align="center">'+valuess.address+'</td><td align="center">'+valuess.mobileNo+'</td><td align="center">'+valuess.emailId+'</td><td align="center">'+valuess.hostName+'</td><td align="center">'+valuess.distributorName+'</td><td align="center">'+valuess.subDistributorName+'</td><td align="center">'+valuess.retailerName+'</td><td align="center"><a href='+controllerPath+'/account/edit?id='+valuess.id+'><img title="edit" src='+contextPath+'/images/edit.gif style="cursor: hand" align="center"></a></td></tr>');
			}		
		}
	});
}

function removeSucessMessage(successMessageId){
	$('#successMessageId').html("");
}

function pinValidation(){
	var pinCode=$("#pinCode").val().trim();
	  var regPostcode = /^([1-9])([0-9]){5}$/;
	  if(!regPostcode.test(pinCode)){
		  $("#lab_pinCodeErrorId").show();
		  //$("#pinCode").val('');
		  $("#lab_pinCodeErrorId").html("<font color='red'Not a valid Pin Code</font>");
		  e.preventDefault();
			return false;
		}
		emptyerror(e,errorid,msg);
	}
	  

function validateIp(){
	var ipAdd=$("#gatewayIpId").val().trim();
	var iPAddressRegex= /\b(?:\d{1,3}\.){3}\d{1,3}\b/;
	if(!iPAddressRegex.test(ipAdd)){
		
		$("#gatewayIpId1").hide();
		$("#gatewayIpErrorId").show();
		$("#gatewayIpErrorId").html("<font color='red'>Invalid IP Address</font>");
		$("#gatewayIpId").val('');
		return false;
	}
	else{
		$("#gatewayIpErrorId").html("");
		return true;
	}
}

function checkUniqueUserEmailIdEdit(){
	var userEmailId=$("#emailId").val().trim();
	var userEmailIdEdit=$("#emailIdEdit").val();
	if(userEmailId===userEmailIdEdit){
		
	}else{
	 var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if (!reg.test(userEmailId)){
		 
		 
		 $('#emailId1').hide();
		 $('#lab_Email_IdErrorId').show();
		 
		 $('#lab_Email_IdErrorId').html("<font color='red'> Not a valid Email-id</font>");
		 $('#emailId').val('');
	 return false;
	}
	
	 else {
		$.ajax({
			type: "post",
			async:false,
			dataType: "json",
			url: 'ajax/checkUniqueUserEmailId',
			cache: false,
			data:{userEmailId :userEmailId},
			success: function(response){
				if(response!=""){
					check=false;
					$("#emailId").val('');
					$('#lab_Email_IdErrorId').show();
					$('#lab_Email_IdErrorId').html("<font color='red'>"+response+"</font>");
					
				}else{
					$("#finalFlag").val("");
				}
			},	error: function(errorThrown){ return false;	}
		});
	}
	
	return check;
}

}

function onlyNumricForPin(event,errorid,value,msg)
{ 
	if(!event.ctrlKey){
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
		if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			$('#lab_pinCodeErrorId').show();
			$('#pinCodeId').hide();
			$('#lab_pinCodeErrorId').html("<font color='red'>Only Numeric are allowed </font>");
			$('#pinCode').val('');
			event.preventDefault();
			return false;
		}
	}
    emptyerror(event,errorid,msg);
}

function validateMob(MobField,labelId,errorId,id){
    var reg = /^((\s*[\-]\s*)?|[0]?)?[0-9]\d{9}$/;
if(MobField.value.length>0){
    if (reg.test(MobField.value) == false) 
    {
    	$('#'+labelId).hide();
		$('#'+errorId).show();
		$('#'+errorId).html("<font color='red'>Enter valid Mobile No.</font>");
		$('#'+id).val('');
        return false;
        
    }
}
    return true;

}
var blockUnblockId;
var status;
function reason(id,stats){
	blockUnblockId=id;
	status=stats;
	$("#commentDiv").show();
	if($("#comment").val().length==0){
		$('#commentdiveId').addClass('has-error');
		return false;
	}else{
		return true;
	}
	
}
function blockUnblock(){
	
	var remarks=$('#comment').val().trim();
	if(remarks.length<=0){
		$('#commentdiveId').addClass('has-error');
	return false;
	}
	var menuId=$('#menuId').val().trim();
	var submenuId=$('#submenuId').val().trim();
	var returnflag = function(){
		
			
			$.ajax({
				type:"POST",
				url :'ajax/blockUnblock',
				async: false,
				data :'blockUnblockId='+blockUnblockId+'&remarks='+remarks+'&menuId='+menuId+'&submenuId='+submenuId+'&status='+status,
				success:function(response)
				{
				if(response==1){
					
				}
				
					
				},
				error: function(){
					}
			});
			
		
		
		return 1;
	}();

	var link=$("input[name=link]:hidden").val();
	link=link+"/AdminUI/account/hostlist?&menuId="+menuId+"&submenuId="+submenuId;
	
	
	if(returnflag==1){
		window.location.replace(link);
	
	}
	$('#remarks').val('');
}



function deactivate(){
	

	var remarks=$('#remarks').val().trim();
	if(remarks.length<=0){
	$('#reason').hide();
	$('#remarksErrorId').show();
	$('#remarksErrorId').html('<font color="red" size="2">Enter Reason for deactivation</font>');
	return false;
	}
	var menuId=$('#menuId').val().trim();
	var submenuId=$('#submenuId').val().trim();
	var returnflag = function(){
		
			
			$.ajax({
				type:"POST",
				url :'ajax/blockUnblock',
				async: false,
				data :'deactivateId='+deactivateId+'&remarks='+remarks+'&menuId='+menuId+'&submenuId='+submenuId,
				success:function(response)
				{
				if(response==1){
					/*$('#lab_deactiveId').html('<p class="text-success">Deactivated Successfully</p>');
					$('#lab_deactiveId').show();
					$('#divId').hide();*/
				}
				
					
				},
				error: function(){
					}
			});
			
		
		
		return 1;
	}();

	var link=$("input[name=link]:hidden").val();
	link=link+"/AdminUI/pinMgmnt/getDenomination?&menuId="+menuId+"&submenuId="+submenuId;
	
	
	if(returnflag==1){
		window.location.replace(link);
	
	}
	$('#remarks').val('');
}

function clearValues(){
	$('#addressSelectTableId').html("");
	$('#addressErrorId').html("");
	$('#locality').val("");
	$('#region').val("");
	$('#district').val("");
	$('#state').val("");
	$('#country').val("");
}
function showBrowseFiles(){
	$("#uploadedfile").hide();
}
