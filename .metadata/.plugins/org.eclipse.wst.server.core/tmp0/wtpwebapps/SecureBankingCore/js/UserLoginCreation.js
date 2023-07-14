// Function for backToLoginListPage
function backToLoginListPage(event){
	
}
function reload(){
}	

$(document).ready(function() {
	$('#table_id').DataTable( {
        "scrollY":        "500px",
        "scrollX":        "600px",
        "scrollCollapse": true,
        "paging":         true,
        "pagingType": "simple_numbers"
       
    } );
	
	$("#proceedBtn").click(changePassword);
	$("#password").click(passwordBlank);
	$("#confirmPassword").click(passwordBlank);
} );






var passwordBlank =function(){
	$("#span_errorId").html("");
}






var idd1;
var button;
var buttonObject;
var accountLblValue;
function activateDe(buttonId,event,userId, labelValue)
{
	buttonObject = buttonId;
	var i=buttonId.id;
	var x = document.getElementById(i).value;
	idd1=userId;
	button=x;
	accountLblValue = labelValue;
	console.log(accountLblValue);
	console.log(button);
	$("#dialog2").dialog("open");
}


function userInfo(event){
	var comment=$('#Activatecomment').val();
	
	
	 if (comment=="") {  
	    	
	    	$('#commentErrorId').show();
	    	$('#commentErrorId').html("<font color='red'>Kindly enter comment.</font>");
	    	
		 // alert('Please enter comment')  
	        return false;
	    } 
	 
	 
$.ajax({
	async: true,
	url: 'ajax/userInfoAjax',
	type:'POST',
	dataType: "json",
	data:'userId='+idd1+'&comment='+comment+'&button='+button,
	success:function(response)
	{
		console.log(response);
		if(response) {
			if("Deactivate" == button) {
				$('#'+button).val("Activate");
				$('#'+accountLblValue).val("Activate");
			} else if("Activate" == button) {
				$('#'+button).val("Deactivate");
				$('#'+accountLblValue).val("Deactivate");
			}
		} else {
			$('#errorId').val("Something went wrong. Try again later !");
		}
		window.location.reload()
		
	},
	  error: function(e) {
										
			  }
});

 event.preventDefault();
 return true;
}


function removeMsg(){
	$('#commentErrorId').html("");
}



function showSettlementType(lab_settlementTypeId){
	$('#'+lab_settlementTypeId).show();
}

function refresh(successMessageId){
	$('#'+successMessageId).html('');
}
//Function for User Edit form validation
function validateUserEditForm(event){
	
	
	var completeCheck = true;
	
	
	var dob=$('#dob').val().trim();
	if(dob.length==0){
		$('#div_dob').addClass('has-error');
		 completeCheck=false;
			}
	
	
	var userName = $.trim($("#userName").val());
	if(userName.length==0){
		$("#userNamedivId").addClass('has-error');
		completeCheck = false;
	}
	
		
	var userEmailId = $.trim($("#userEmailId").val());
	if(userEmailId.length==0){
		$("#userEmailIdivId").addClass('has-error');
		completeCheck = false;
	}else{
		var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		 if (!reg.test(userEmailId)){
				$("#userEmailId").val('');
				 $('#userEmailId1').hide();
			    $('#userEmailIdErrorId').show();
			 $('#userEmailIdErrorId').html("<font color='red'> Invalid Id</font>");
			 $('#emailId').val('');
			 completeCheck = false;
	}
	
	}
		
	
	var userMobile = $.trim($("#userMobile").val());
	
	
	
	if(userMobile.length==0 || userMobile.length<10){
		
		$("#div_userMobile").addClass('has-error');
		$("#userMobile").val('');
		
		completeCheck = false;
	}
	if($('#pinCode').val().length==0)
	{
		$("#div_pinCode").addClass('has-error');
		completeCheck =false;

	}
	if($('#locality').val().length==0)
	{
		//document.getElementById("label_locality").style.color = "red";
		$("#div_locality").addClass('has-error');
		completeCheck =false;

	}
	if($('#addressIdDefault').val().length==0)
	{
		$("#div_address").addClass('has-error');
		completeCheck =false;

	}
	if($('#district').val().length==0)
	{
		//document.getElementById("label_district").style.color = "red";
		$("#div_district").addClass('has-error');
		completeCheck =false;

	}
	if($('#state').val().length==0)
	{
		//document.getElementById("label_state").style.color = "red";
		$("#div_state").addClass('has-error');
		completeCheck =false;

	}
	if($('#country').val().length==0)
	{
		//document.getElementById("label_country").style.color = "red";
		$("#div_country").addClass('has-error');
		completeCheck =false;

	}
	if($('#nickName').val().length==0)
	{
		$("#div_nickName").addClass('has-error');
		completeCheck =false;

	}


	var  altMobNo  = $('#alternateMobileNo').val().trim();
	   var altCountryCodedivId =$('#altCountryCodeId').val().trim();
	                
	if((altCountryCodedivId=="")&&(altMobNo.length==10)){
		$("#altCountryCodeErrorId_div").addClass('has-error');
		completeCheck = false;
	}
 
	if(!(completeCheck)){
		event.preventDefault();
		return false;
	}
	else{
		return true;
	}
}



//Function for User Creation form validation
function validateUserCreationForm(event,deployed){
	var completeCheck = true;
	
	var userMobile = $("#userMobile").val().trim();
    var alternateMobileNo = $("#alternateMobileNo").val().trim();
    var altCountryCodeId= $("#altCountryCodeId").val().trim();
	var userAccountType=$('#accountTypeId').val().trim();
	var host = $.trim($("#hostId").val());
	var state=$("#state").val().trim();
	if(state.length==0)
	{
	
		$("#div_state").addClass('has-error');
		completeCheck =false;

	}
	var nickName=$("#nickName").val().trim();
	if(nickName.length==0)
	{
		$("#nickName").val('');
		$("#div_nickName").addClass('has-error');
		completeCheck =false;

	}
	var district=$("#district").val().trim();
	if(district.length==0)
	{
		//document.getElementById("label_district").style.color = "red";
		$("#district").val('');
		$("#div_district").addClass('has-error');
		completeCheck =false;

	}
	var country=$("#country").val().trim();
	if(country.length==0)
	{
		//document.getElementById("label_country").style.color = "red";
		$("#country").val('');
		$("#div_country").addClass('has-error');
		completeCheck =false;

	}
	if(host.length==0)
			{
				$("#hostId").val('');
				$("#div_hostId").addClass('has-error');
				completeCheck =false;
		
			}
	 if(userAccountType.length==0){
		 	$("#accountTypeId").val('');
		 	document.getElementById("accountTypeId1").style.color = "red";
		 	$("#div_accountTypeId").addClass('has-error');
		 
		 
		completeCheck = false;
	}
		var hostId = "";
		var distributorId = "";
		var subDistributorId = "";
		var retailerId = "";
		hostId = $.trim($("#hostId").val());
		if(hostId.length==0){
			$("#hostId").val('');
			$("#div_hostId").addClass('has-error');
		
			completeCheck = false;
		}
		if (userAccountType.indexOf(",HO") >-1) {
			hostId = $.trim($("#hostId").val());
			if(hostId.length==0){
				$("#hostId").val('');
				$("#div_hostId").addClass('has-error');
				
				completeCheck = false;
			}else {
				$('#hostIdErrorId').html("");	
			}
			$('#distributorIdErrorId').html("");
			$('#subDistributorIdErrorId').html("");
			$('#retailerIdErrorId').html("");
		}

		if (userAccountType.indexOf(",DI") >-1) {
			hostId = $.trim($("#hostId").val());
			distributorId = $.trim($("#distributorId").val());
			if(hostId.length==0){
				document.getElementById("distributorId1").style.color = "red";
				$("#hostId").val('');
				$("#div_hostId").addClass('has-error');
			
				completeCheck = false;
			}else {
				$('#hostIdErrorId').html("");	
			}

			if(distributorId.length==0){
				$("#distributorId").val('');
				$("#distributorId2").addClass('has-error');
				
				completeCheck = false;
			}else{
				$('#distributorIdErrorId').html("");
			}
			$('#subDistributorIdErrorId').html("");
			$('#retailerIdErrorId').html("");
		}
		if (userAccountType.indexOf(",SD") >-1) {
			
			
			hostId = $.trim($("#hostId").val());
			distributorId = $.trim($("#distributorId").val());
			subDistributorId = $.trim($("#subDistributorId").val());
			if(hostId.length==0){
				$("#hostId").val('');
				$("#div_hostId").addClass('has-error');
				
				completeCheck = false;
			}else {
				$('#hostIdErrorId').html("");	
			}
			
			
			if(distributorId.length===0 && $('#subDistributorId2').is(':visible')){
				$("#distributorId").val('');
				$("#distributorId1").hide();
				$('#distributorIdErrorId').html("");
				$('#distributorIdErrorId').show();
				$('#distributorIdErrorId').html("<font color='red'>Kindly select Distributor</font>");
				completeCheck = false;
			}else{
				$('#distributorIdErrorId').html("");
			}
			if(subDistributorId.length==0 && $('#subDistributorId2').is(':visible')){
				$("#subDistributorId").val('');
				$("#subDistributorId1").hide();
				$('#subDistributorIdErrorId').html("");
				$('#subDistributorIdErrorId').show();
				$('#subDistributorIdErrorId').html("<font color='red'>Kindly select Sub-Distributor</font>");
				completeCheck = false;
			}else{
				$('#subDistributorIdErrorId').html("");
			}
			$('#retailerIdErrorId').html("");
		}
		if (userAccountType.indexOf(",RE") >-1) {
			hostId = $.trim($("#hostId").val());
			distributorId = $.trim($("#distributorId").val());
			subDistributorId = $.trim($("#subDistributorId").val());
			retailerId = $.trim($("#retailerId").val());
			if(hostId.length==0){
				$("#hostId").val('');
				$("#div_hostId").addClass('has-error');
				
				completeCheck = false;
			}else {
				$('#hostIdErrorId').html("");	
			}
			
			if(distributorId.length==0 && $('#distributorId2').is(':visible')){
				$("#distributorId").val('');
				$("#distributorId1").hide();
				$('#distributorIdErrorId').html("");
				$('#distributorIdErrorId').show();
				$('#distributorIdErrorId').html("<font color='red'>Kindly select Distributor</font>");
				completeCheck = false;
			}else{
				$('#distributorIdErrorId').html("");
			}
			
			if(subDistributorId.length==0 && $('#subDistributorId2').is(':visible')){
				$("#subDistributorId").val('');
				$("#subDistributorId1").hide();
				$('#subDistributorIdErrorId').html("");
				$('#subDistributorIdErrorId').show();
				$('#subDistributorIdErrorId').html("<font color='red'>Kindly select Sub-Distributor</font>");
				completeCheck = false;
			}else{
				$('#subDistributorIdErrorId').html("");
			}
			if(retailerId.length==0 && $('#retailerId2').is(':visible')){
				$("#retailerId").val('');
				$("#retailerId1").hide();
				$('#retailerIdErrorId').html("");
				$('#retailerIdErrorId').show();
				$('#retailerIdErrorId').html("<font color='red'>Kindly select Agent</font>");
				completeCheck = false;
			}else{
				$('#retailerIdErrorId').html("");
			}
		}

		var userName = $.trim($("#userName").val());
		if(userName.length==0){
			$("#userName").val('');
			$("#div_userName").addClass('has-error');
			
			completeCheck = false;
		}else{
			$('#userNameErrorId').html("");
		}
		
		
		var emailId=$('#userEmailId').val().trim();
		if(emailId.length==0){
			$('#div_userEmailId').addClass('has-error');

			completeCheck = false;
		}else{
			var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			 if (!reg.test(emailId)){
					$("#userEmailId").val('');
					 $('#userEmailId1').hide();
				    $('#userEmailIdErrorId').show();
				 
				 $('#userEmailIdErrorId').html("<font color='red'> Invalid Id</font>");
				 $('#emailId').val('');
				 completeCheck = false;
		}
		}
		if($('#pinCode').val().length==0 )
		{
			$("#div_pinCode").addClass('has-error');
			completeCheck =false;
	
		}
		if($('#locality').val().length==0)
		{
			$("#div_locality").addClass('has-error');
			completeCheck =false;
	
		}
		if($('#addressIdDefault').val().length==0)
		{
			$("#div_address").addClass('has-error');
			completeCheck =false;
	
		}
		
/*		
		if(country=='india'){
		if(userEmailId.length==0){
			$("#userEmailId").val('');
			$("#userEmailId1").hide();
			$('#userEmailIdErrorId').html("");
			$('#userEmailIdErrorId').show();
			$('#userEmailIdErrorId').html("<font color='red'>Kindly enter Email id</font>");
			completeCheck = false;

		}else{
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		    if (emailReg.test(userEmailId)) {
		    	$('#userEmailIdErrorId').html("");
		    }
		    else {
		    	$("#userEmailId").val('');
				$("#userEmailId1").hide();
				$('#userEmailIdErrorId').html("");
				$('#userEmailIdErrorId').show();
		    	$('#userEmailIdErrorId').html("<font color='red'>Kindly enter valid Email Id</font>");
				completeCheck = false;

			}
		}
		}*/
		
		if(userMobile.length==0 || userMobile.length<10){
			$("#div_userMobile").addClass('has-error');
			$("#userMobile").val('');
			completeCheck = false;

		}
		var countryCodeId=$("#countryCodeId").val().trim();
		if((countryCodeId.length==0)){
			$('#contrycodedivId').addClass('has-error');
		
			completeCheck=false;

		}else{
			$('#countrycodeErrorId').html("");
		}
		
		if((countryCodeId=="")&&(userMobile.length==10)){
			
			
			$("#contrycodedivId").addClass('has-error');
			completeCheck = false;
		}
		
	   
	        
	        if((altCountryCodeId=="")&&(alternateMobileNo.length!=0)){
				$("#altcountrydivId").addClass('has-error');
				completeCheck = false;
			}
		
		
		var userLoginName = $("#userLoginName").val().trim();
		if(userLoginName.length==0){
			$("#userLoginName").val('');
			$("#div_userLoginName").addClass('has-error');
			
			completeCheck = false;
		}else{
			$('#userLoginNameErrorId').html("");
		}
		
		var userPassword = $.trim($("#userPassword").val());
		if(userPassword.length==0){
			$("#userPassword").val('');
			$("#div_userPassword").addClass('has-error');
			
			completeCheck = false;
		}
		else if(userPassword.length<6){
			$("#userPassword").val('');
			$("#userPassword1").hide();
			$('#userPasswordErrorId').html("");
			$('#userPasswordErrorId').show();
			$('#userPasswordErrorId').html("<font color='red'>Password should be atleast 6 digits long</font>");
			completeCheck = false;
		}else{
			$('#userPasswordErrorId').html("");
		}
		
		var rPassword = $.trim($("#rPassword").val());
		if(rPassword.length==0){
			$("#rPassword").val('');
			$("#div_rPassword").addClass('has-error');
			
			completeCheck = false;
		}else{
			$('#rPasswordErrorId').html("");
		}
		if(userPassword!="" && rPassword!=""){
			if(userPassword!=rPassword){
				$("#rPassword").val('');
				$("#rPassword1").hide();
				$('#rPasswordErrorId').html("");
				$('#rPasswordErrorId').show();
				$('#rPasswordErrorId').html("<font color='red'>Password does not match.</font>");
				completeCheck = false;
			}
		}
		
		
	
	if(!(completeCheck)){
		event.preventDefault();
		return false;
	}
	else
	{
			return true;
	}
}

function clearPageOnChangeRole(loginGroupCode,selectedRoleCode) {
	if ( loginGroupCode == "PP") {
		$('#hostId').val("");
	}

	if ( loginGroupCode == "HO") {
		if (selectedRoleCode != "HO") {
			$('#distributorId').val("");
		}
	}
	
	if (loginGroupCode == "DI") {
		if (selectedRoleCode != "DI") {
			$('#subDistributorId').val("");
		}
	}
	
	if (loginGroupCode == "SD") {
		if (selectedRoleCode != "SD") {
			$('#retailerId').val("");
		}
	}
	
	
}

// Show Hide Drop Down boxs
function showHideFunction() {

	var accountType = $("#accountTypeId").val();
	var groupCode = $("#groupCode").val();
	$("#errorstatusMessage").html("");
	$("#statusMessage").html("");
	$("#userName").val('');
	
	
	if (accountType != "") {
		$('#accountTypeErrorId').html("");
		var msg = accountType.split(",");
		if (msg[1] != "") {
			if (msg[1] == "HO") {
				$('#distributorId2').hide();
				$('#distributorId2').hide();
				$('#distributorIdErrorId').html("");
				$('#subDistributorId2').hide();
				$('#subDistributorId2').hide();
				$('#subDistributorIdErrorId').html("");
				$('#retailerId2').hide();
				$('#retailerId2').hide();
				$('#retailerIdErrorId').html("");
				$('#lab_settlementTypeId').hide();
			}
			if (msg[1] == "DI") {
				$('#subDistributorId2').hide();
				$('#subDistributorId2').hide();
				$('#subDistributorIdErrorId').html("");
				$('#retailerId2').hide();
				$('#retailerId2').hide();
				$('#retailerIdErrorId').html("");
				$('#lab_settlementTypeId').hide();
				if (groupCode == "HO") {
					
					$('#distributorId2').show();
					$('#distributorId').val("");
				}
				if (groupCode == "PP") {
					
					$('#distributorId2').show();
					getAccountListByParentId('hostId', 'distributorId','subDistributorId','retailerId');
				}
			}
			if (msg[1] == "SD") {
				$('#retailerId1').hide();
				$('#retailerId2').hide();
				$('#retailerIdErrorId').html("");
				$('#lab_settlementTypeId').hide();
				if (groupCode == "DI") {
					$('#subDistributorId1').show();
					$('#subDistributorId2').show();
					$('#subDistributorId').val("");
				}
				if (groupCode == "HO") {
					$('#subDistributorId2').hide();
					$('#subDistributorId2').hide();
					$('#distributorId2').show();
					$('#distributorId2').show();
					$('#distributorId').val("");
				}
				if (groupCode == "PP") {
					$('#subDistributorId2').hide();
					$('#subDistributorId2').hide();
					$('#distributorId2').hide();
					$('#distributorId2').hide();
					getAccountListByParentId('hostId', 'distributorId','subDistributorId','retailerId');
				}
			}
			if (msg[1] == "RE") {
				if (groupCode == "SD") {
					$('#lab_settlementTypeId').show();
					$('#retailerId2').show();
					$('#retailerId2').show();
					$('#retailerId').val("");
				}
				if (groupCode == "DI") {
					$('#retailerId2').hide();
					$('#retailerId2').hide();
					$('#subDistributorId2').show();
					$('#subDistributorId2').show();
					$('#subDistributorId').val("");
				}
				if (groupCode == "HO") {
					$('#retailerId1').hide();
					$('#retailerId2').hide();
					$('#subDistributorId1').hide();
					$('#subDistributorId2').hide();
					$('#distributorId1').show();
					$('#distributorId2').show();
					$('#distributorId').val("");
				}
				if (groupCode == "PP") {
					$('#retailerId2').hide();
					$('#retailerId2').hide();
					$('#subDistributorId2').hide();
					$('#subDistributorId2').hide();
					$('#distributorId2').hide();
					$('#distributorId2').hide();
					getAccountListByParentId('hostId', 'distributorId','subDistributorId','retailerId');
				}
			}

		} else {
			$('#accountTypeErrorId').html("<font color='red'>Kindly select account type</font>");
			
		}
	}else{
		$('#hostId').val("");
		$('#distributorId').val("");
		$('#distributorId2').hide();
		$('#distributorId2').hide();
		$('#subDistributorId').val("");
		$('#subDistributorId2').hide();
		$('#subDistributorId2').hide();
		$('#retailerId').val("");
		$('#retailerId2').hide();
		$('#retailerId2').hide();
	}
}

// Function for getting all Host List
function getHostList(){
	$.ajax({
		type: "post",
		url: '/ajax/getAllHostList',
		cache: false,
		dataType: "json",
		success: function(response){
			var obj = response;
			if(obj.msg=="1"){
				var hostList = obj.hostMap;
				var select = $('#hostId');
				select.find('option').remove();
				$('<option>').val("").text("<---select--->").appendTo(select);
				$.each(hostList, function( index, value ) {
					var select = $('#hostId');
					$('<option>').val(index).text(value).appendTo(select);
				});
			}
		},	error: function(errorThrown){
		    var select = $('#hostId');
			select.find('option').remove();
			$('<option>').val("").text("<---select--->").appendTo(select);
		}
	});
}

//Function for getting all child List by parent id
function getAccountListByParentId(sourceId, targetId, node1, node2){
	$("#statusMessage").html("");
	$("#"+sourceId+"ErrorId").show();
	$("#"+targetId+"ErrorId").show();
	$("#"+targetId+"ErrorId").html('');
	$("#"+node1+"ErrorId").hide();
	$("#"+node2+"ErrorId").hide();
     $("#accountTypeErrorId").hide();	
	$("#userName").val('');
	$("#distributorId").val();
	$("#subDistributorId").val();
	$("#retailerId").val("");
	$("#subDistributorId2").val();
	if(node1!=null){
		$("#"+node1).val('');
		$("#"+node1+"1").hide();
		$("#"+node1+"2").hide();
	}
	if(node2!=null){
		$("#"+node2).val('');
		$("#"+node2+"1").hide();
		$("#"+node2+"2").hide();
	}
	

	var parentId=$("#"+sourceId).val();
	var accountType=$("#accountTypeId").val();
	if (accountType != "") {
		if (parentId != "") {
			$('#' + sourceId + 'ErrorId').html("");
			$.ajax({
				type : "post",
				url : '/securebanking/AdminUI/UserMgmt/ajax/getAccountListByParentId',
				dataType: 'json',
				cache : false,
				data : {
					parentId : parentId,
					accountType : accountType
				},
				success : function(response) {
					var obj = response;
				/*	obj=JSON.parse(obj);*/
					var msg = obj.msg;
					if (msg == "1") {
						$('#' + targetId + '1').show();
						$('#' + targetId + '2').show();
						var select = $('#' + targetId);
						select.find('option').remove();
						$('<option>').val("").text("").appendTo(select);
						var childAccountList = obj.childAccountListMap;
						$.each(childAccountList, function(index, value) {
							var select = $('#' + targetId);
							$('<option>').val(index).text(value).appendTo(select);
						});
					}
				},
				error : function(errorThrown) {
					
				}
			});
		} else {
			$('#' + sourceId + 'ErrorId').html(	"<font color='red'>Kindly select account </font>");
			$('#' + targetId + '1').hide();
			$('#' + targetId + '2').hide();
			$('#'+targetId).val("");
		}
	} else {
		$('#accountTypeErrorId').html("<font color='red'>Kindly select account type</font>");
	}
}
 
//Function for Check duplicate userId, emailId and MSISDN
function checkUniqueUserIDEmailIdAndMSISDN(){
	
	$('#settlementType').attr("disabled",false);
	var check=true;
	var userEmailId=$("#userEmailId").val();
	var userMobile=$("#userMobile").val();
	var userLogin=$("#userLoginName").val();
	$.ajax({
		type: "post",
		url: '/securebanking/AdminUI/UserMgmt/ajax/checkUniqueUserIDEmailIdAndMSISDN',
		cache: false,
		dataType: "json",
		data:{userEmailId :userEmailId, userMobile :userMobile, userLogin :userLogin},
		success: function(response){
			if(response!=""){
				var objVal = response;
				if(objVal.emailMsg!=""){
					$("#userEmailId").val("");
					$("#finalFlag").val("false");
					check= false;
					$("#userEmailId").val("");
					$('#userEmailIdErrorId').html("<font color='red'>"+objVal.emailMsg+"</font>");
				}else{
					$("#finalFlag").val("");
					$('#userEmailIdErrorId').html("");
				}
				if(objVal.mobileMsg!=""){
					$("#finalFlag").val("false");
					check= false;
					$("#userMobile").val("");
					$('#userMobileErrorId').html("<font color='red'>"+objVal.mobileMsg+"</font>");
				}else{
					$("#finalFlag").val("");
					$('#userMobileErrorId').html("");
				}
				if(objVal.userIdMsg!=""){
					$("#finalFlag").val("false");
					check= false;
					$("#userLoginName").val("");
					$('#userLoginNameErrorId').html("<font color='red'>"+objVal.userIdMsg+"</font>");
				}else{
					$("#finalFlag").val("");
					$('#userLoginNameErrorId').html("");
				}
			}
		},	error: function(errorThrown){ return false;	}
	});
	return check;
}
var check=true;

function checkUniqueUserEmailId(){
	
	var userEmailId=$("#userEmailId").val();
	var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (emailReg.test(userEmailId)) {
    	
    	$.ajax({
    		type: "post",
    		async:false,
    		url: '/securebanking/AdminUI/UserMgmt/ajax/checkUniqueUserEmailId',
    		cache: false,
			dataType: "json",
    		data:{userEmailId :userEmailId},
    		success: function(response){
    			if(response!=""){
    				check=false;
    				$("#userEmailId").val('');
    				$('#userEmailIdErrorId').show();
    				$('#userEmailIdErrorId').html("<font color='red'>"+response+"</font>");
    				$("#finalFlag").val('false');
    			}else{
    				$("#finalFlag").val("");
    			}
    		},	error: function(errorThrown){ return false;	}
    	});
    }
    else {
    	$('#userEmailIdErrorId').show();
		$('#userEmailIdErrorId').html("<font color='red'>Kindly enter valid Email Id</font>");
		$("#userEmailId").val('');
		check = false;

	}
	
	return check;
}

//Function for Check user mobile number
var check=true;
function checkUniqueUserMobileNumber(){
	var check=true;
	var userMobile= $('#userMobile').val().trim();
	
	$.ajax({
		type: "post",
		url: '/securebanking/AdminUI/UserMgmt/ajax/checkUniqueUserMobileNumber',
		async: false,
		cache: false,
		dataType: "json",
		data:{userMobile :userMobile},
		success: function(response){
			
			if(response!=""){
				check= false;
				$("#userMobile").val('');
				$('#userMobileErrorId').show();
				$('#userMobileErrorId').html("<font color='red'>"+response+"</font>");
				$("#finalFlag").val('false');
			}else{
				$("#finalFlag").val("");
			}
		},	error: function(errorThrown){ 
		
			
			return false;	}
	});
	return check;
}

//Function for Check user login name
function checkUniqueUserLoginName(){
	var check=true;
	var userLoginName=$("#userLoginName").val();
	$.ajax({
		type: "post",
		url: '/securebanking/AdminUI/UserMgmt/ajax/checkUniqueUserLoginName',
		cache: false,
		dataType: "json",
		data:{userLoginName :userLoginName},
		success: function(response){
			if(response!=""){
				check= false;
				$("#userLoginName").val('');
				$("#finalFlag").val('false');
				$('#userLoginNameErrorId').html("<font color='red'>User Name already exists.</font>");
			}else{
				$("#finalFlag").val("");
			}
		},	error: function(errorThrown){ return false;	}
	});
	return check;
}

function validEmail(){
	var userPassword = $.trim($("#userPassword").val());
	if(userPassword.length<6){
		$('#userPasswordErrorId').html("<font color='red'>Password should be atleast 6 digits long</font>");
		completeCheck = false;
	}else{
		$('#userPasswordErrorId').html("");
	}
	return completeCheck;
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
	
	var label="'selectedRadioTypeId'";
	var errorId="'lable_emailOrUserIdErrorId'";
	if(selectedRadioType==='Mobile Number'){
		
		var html='<div id="emailMobileUserTextboxTable" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">'+
        '<div id="emailMobileUserTextbox" class="styled-input">'+
	      '<input type="text" class="selecttag" id="emailOrUserId" name="'+selectedRadioType+'" maxlength="10" onfocus="showlabel('+"'selectedRadioTypeId'"+','+"'lable_emailOrUserIdErrorId'"+')" '+
	      'onchange="selecttag('+"'selectedRadioTypeId'"+','+"'emailOrUserId'"+')" onkeypress="onlyNumric1(event,'+errorId+','+label+');validatemob();" onclick="emptyerror(event,'+errorId+');" placeholder="." />'+
	      '<label id="selectedRadioTypeId">* '+selectedRadioType+'</label>'+
	      '<label id="lable_emailOrUserIdErrorId" class="collapse"></label>'+
	      '<span></span></div></div>';
		
		
	}else{
 var html='<div id="emailMobileUserTextboxTable" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 mb">'+
 		'<div id="emailMobileUserTextbox" class="styled-input">'+
	     '<input type="text" class="selecttag" id="emailOrUserId" name="'+selectedRadioType+'" onclick="emptyerror(event,'+errorId+');" onkeypress="validatemob();" '+
	     'onchange="selecttag('+"'selectedRadioTypeId'"+','+"'emailOrUserId'"+')" onfocus="showlabel('+"'selectedRadioTypeId'"+','+"'lable_emailOrUserIdErrorId'"+')" placeholder="."/>'+
	     
	      '<label id="selectedRadioTypeId">* '+selectedRadioType+'</label>'+
	        '<label id="lable_emailOrUserIdErrorId" class="collapse"></label>'+
	        '<span></span></div></div>';
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
		
		$("#lable_emailOrUserIdErrorId").html('<b><font color=red>Kindly enter  '+selectedRadioType.substring(2,selectedRadioType.length-1)+ '</font>');
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
	            url : "/securebanking/AdminUI/account/ajax/userMobileNoUrl",
	            type : "GET",
	            data :'mobno='+mobno, 
				dataType: "json",
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
	            url : "/securebanking/AdminUI/account/ajax/userNameUrl",
	            type : "GET",
	            data :'user='+user, 
				dataType: "json",
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
        url : "/securebanking/AdminUI/account/ajax/useremailUrl",
        type : "GET",
        data :'emailId='+emailId, 
		dataType: "json",
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


function validatemobileData(event,errorId)
{
	var userMobile=$("#userMobileOrg").val().trim();
		
	if(userMobile==0 || userMobile<10)
		{
		
		$("#userMobileErrorId").html("<font color='red'>Invalid Mobile number</font>");
		$("#userMobile").val('');
		}
	else
		{
		$("#userMobileErrorId").html("");
		}
	
	
}
function dateValidate(datetext)
{
}
 

function validRow(){
	var rowCount= $("#numberofrow").val().trim();
	if(rowCount==0){
		$("#validRowErrorId").html("<font color='red'>Please enter no of rows</font>");
		return false;
	}
	
}

function validPageNo(){
	  var pages = $('#pages').val();
	var enteredPageNo=$("#goToId").val();
	if(enteredPageNo>pages){
		$("#invalidPageErrorId").html("<font color='red'>Please enter valid page no</font>");
		return false;
	}
	
}


var radio="";
function radioSelect(selectedRadioTdId)
{
	$("#select_onbehalf").val("");
	$("#validRowErrorId").val("");
	
	radio=selectedRadioTdId;
	
}

function getInformation()
{
	
	var personDetails = $("#select_onbehalf").val();
	
	var adminUi = "/AdminUI";
	var contextPath = $("#contextPath").val();
	var controllerPath = contextPath + adminUi
	
	
	$.ajax({
		type: "get",
		url : controllerPath
		+ "/autosearch/getGenericInfo",
		data : 'personDetails=' + personDetails,
		
		success: function(response){
			var valuess=response;
			if ($.isEmptyObject(response)) 
			{
				$('#validRowErrorId').html("<font color='red'>There are no information to display.</font>");
			}
			
			
			else
				{
				
				$('#table_id').html("");
				$('#table_id').html('<thead><tr><th>User Name</th><th>Role Type</th><th>User Login</th><th>Email</th><th>Mobile Number</th><th>Host Name</th><th>Company Name</th>Distributor Name</tr><th>Sub-Distributor Name</th><th>Agent Name</th><th>Action</th></tr></thead>');
				$('#table_id').append('<tr><td align="center">'+valuess.userName+'</td><td align="center">'+valuess.accountTypeId+'</td></tr>');
					}		
		}
	});
}


function autosearch() {
	$("#select_onbehalf")
			.autocomplete( 
					{ 
						source : function(request, response) {
							
							var adminUi = "/AdminUI";
							var tagName = $("#select_onbehalf").val();
							
							
							var contextPath = $("#contextPath").val();
							
							var controllerPath = contextPath + adminUi
							$
									.ajax({
										url : controllerPath
												+ "/autosearch/getGenericTags",
										type : "GET",
										data : 'tagName=' + tagName + '&radio=' + radio,
										success : function(data) {
											if (data.length == 0) {
												$('#validRowErrorId')
														.html(
																"<font color='red'>Name Does Not Exist</font>");
											}
											response($.map(data,
													function(item) {
														return item.split(",");
													}));
										}
									});
						},
						select: function (event, ui) { 
						
							}
					
					
					});

}

function changeValues(){
	$('#locality').val('');
	$('#region').val('');
	$('#district').val('');
	$('#state').val('');
	$('#country').val('');
}
function onfocusChangeColor(id){
	document.getElementById("label_locality").style.color = "#eaa722";
}


var changePassword=function(){
	var pass=$("#password").val();
	var confirmPass=$("#confirmPassword").val();
	if(pass.length<1 || confirmPass.length<1){
		$("#span_errorId").html("Password confirm password fields are required.");
		return false;
	}
	if(pass==confirmPass){
		$("#declarationModel").modal('hide');
		var id=$("#usrId").val();
		$.ajax({
			type:"POST",
			url :'ajax/sendResetpassword',
			//async: false,
			data :'id='+id+'&password='+confirmPass,
			success:function(response)
			{
				
			if(response==1){
				$("#resetPasswordMsg").html("<font color=green>New Password Sent to Your mobile</font>");
				$("#declarationModel").modal('hide');
			}
			
				
			},
			error: function(){
				alert("error occured.")
				}
		});
	}else{
		$("#span_errorId").html("Password confirm password dosen't match.");
		$("#password").val("");
		$("#confirmPassword").val("");
	}
	
	
}



function getResetPassword(mobileNo,id){
	$("#span_errorId").empty();
	$("#usrId").val(id);
	$("#declarationModel").modal('show');
	
	
	return false;
	var returnflag = function(){
		
		
		
			
			/*$.ajax({
				type:"POST",
				url :'ajax/sendResetpassword',
				async: false,
				data :'id='+id,
				success:function(response)
				{
					
				if(response==1){
					$("#resetPasswordMsg").html("<font color=green>New Password Sent to Your mobile</font>");
				}
				
					
				},
				error: function(){
					
					}
			});*/
			
		
		
		return 1;
	}();

	
}




