var completeCheck = true;

jQuery.validator.setDefaults({
	  debug: true,
	  success: "valid"
	});

$( "#portalForm" ).validate({
	  rules: {
		  callBackUrl: {
	      required: true,
	      url: true
	    }
	  }
	});





function clearmessage(event)
{
	$('#companyUrlErrorId').html('');

}

var companyurl = $("#portalurl").val();


function ipvalidator(event)
{

	var companyUrlsEdit=$("input[name=portalurls]").val();

	var ipformat = /^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i;
	if(!ipformat.test(companyUrlsEdit))
	{
		$('#companyUrlId1').hide();
		$('#companyUrlErrorId').show();
		$('#companyUrlErrorId').html("<font color='red'>Invalid Ip.</font>");  
		$("input[name=portalurls]").val("");
		return false;
	}
	else
	{
		return true;
		//  $('#companyUrlErrorId').html("<font color='red'>valid Ip.</font>");   

	}

}


//start
function emailValidation(event,emailIds,emailErrorId) {


	var temp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var email= $("#emailIds").val();


	if(temp.test(email))
	{
		/*$('#emailId1').hide();*/
		$("#emailId1").addClass('valid');
		$("#emailId1").html("<font color='green'>Email is valid</font>");

	}
	else{
		$('#emailId1').hide();
		$("#emailErrorId").show();
		$("#emailErrorId").html("<font color='red'>Email is not valid</font>");
		$("#emailIds").val("");
	}


}

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

function checkDuplicateEncryptionKey(event)
{
	var encryptionKeyId = $('#encryptionKeyId').val();
	$.ajax({
		url: 'ajax/checkDuplicateEncryptionKey',
		type:'POST',
		async:false,
		dataType: "json",
		data:'encryptionKeyId='+encryptionKeyId,
		success:function(response)
		{
			if(response==0)
			{
				$('#encryptionKeyId1').hide();
				$('#encryptionKeyErrorId').show();
				$('#encryptionKeyErrorId').addClass("valid");
				$('#encryptionKeyErrorId').html("<font color='green'>Encryption Key Available</font>");
				completeCheck = true;
			}else
			{
				$('#encryptionKeyId1').hide();
				$('#encryptionKeyErrorId').show();
				$('#encryptionKeyErrorId').addClass("valid");
				$('#encryptionKeyErrorId').html("<font color='red'>Encryption Key Already Exists</font>");
				$('#encryptionKeyId').val(''); 
				completeCheck = false;
				
			}
		}
	});
}

function validatePortalRegistration(formId,event)
{
	var completeCheck = true;

	var companyName = $('#companyNameId').val();
	var companyUrl = $('#companyUrlId').val();
	var PersonName = $('#houseNoId').val();
	var encryptionKey = $('#encryptionKeyId').val();
	var callBackUrl = $("#callBackUrl").val().trim();
	var companyUrlsEdit=$("input[name=portalurls]").val();
   
	
	var taskArray = new Array();
	$("input[name=portalurls]").each(function() {
	
		if($(this).val().trim().length>0){
		if(/^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test($(this).val())){
		} else {
			$(this).val("");
			$('#errmsgportalUrlTableValue').html("<font color='red'>Wrong Call Back Url</font>");
			completeCheck= false;
		}
		}
		
	   taskArray.push($(this).val());
	});
	
	if(encryptionKey.length==0)
	{

		completeCheck= false;
		$('#div_encryptionKeyId').addClass('has-error');
	}
	
	if($("#callBackUrl").val().trim().length==0)
	{
		completeCheck= false;
		$('#div_callBackUrl').addClass('has-error');
	}
	
	if($("#lab_contactOne").val().trim().length==0)
	{
		completeCheck= false;
		$('#phone1').addClass('has-error');
	}

	if(companyName.length==0)
	{
		completeCheck= false;
		$('#div_companyNameId').addClass('has-error');


	}
	

	if(typeof companyUrlsEdit!=='undefined'){
	if (companyUrlsEdit.length==0){                                         

		completeCheck= false;
		$('#div_companyUrlId').addClass('has-error');
		$('#companyUrlId1').hide();
		$('#companyUrlErrorId').show();
		$('#companyUrlErrorId').html("<font color='red'>Kindly Provide Atleast One URL.</font>");

	}
	}
	
	if(encryptionKey.length>=24 && encryptionKey.length<=48 && formId!='portalEdit')
	{

		checkDuplicateEncryptionKey(event);
	}
	
	if(callBackUrl.length!=0  ){
		
		if(/^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test($("#callBackUrl").val())){
		} else {
			
			$('#callBackUrlId').hide();
			$('#callBackUrlErrorId').show();
			$('#callBackUrlErrorId').html("<font color='red'>Wrong Call Back Url</font>");
			completeCheck= false;
		}
	}
	if(document.getElementById("uploadFilePath").value != "") {
		var fileName=$("#uploadFilePath").val();
		 var allowed_extensions =["jpg","png","gif","jpeg","PNG"];
		    var file_extension = fileName.split('.').pop(); 
		    
		    for(var i = 0; i <= allowed_extensions.length; i++)
		    {
		        if(allowed_extensions[i]==file_extension.toLowerCase())
		        {
		        	$('#uploadErrorId').html("");
		        	 check=true;
		        	 
		        	 break;
		        }
		        else{
		        	
		        	 check=false;
		 		    $('#uploadErrorId').show();
		 			$('#uploadErrorId').html('<font color="red" size="2"> Upload valid file</font>');
		        	
		        }
		    }

		   
		}
	else{
		$('#divID_uploadFilePath').addClass('has-error');
		$('#uploadErrorId').html('<font color="red" size="2"> Upload file</font>');
		check=false;
	}
	


	if(PersonName.length==0){
			$('#div_personNameId').addClass('has-error');
			completeCheck= false;
		}
	if(typeof companyUrl!=='undefined' ){
	if(companyUrl.length>0){
	if(/^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test(companyUrl)){
	}else{
		$('#companyUrlId1').hide();
		$('#companyUrlErrorId').show();
		$('#companyUrlErrorId').html("<font color='red'>Wrong White Listed Url</font>");
		completeCheck = false;
	}
	}
	}
	if(!completeCheck)
	{
		event.preventDefault();
		return false;

	}
	else
	{
		$('#'+formID).submit();
	}
	
	if(companyUrl.length==0)
	{

		completeCheck= false;
		$('#div_companyUrlId').addClass('has-error');

	}
	

	if(!completeCheck)
	{
		event.preventDefault();
		return false;

	}
	else
	{
		$('#'+formID).submit();
	}

}

function checkDuplicateAccount(event){
	var completeCheck=true;
	var companyName=$("#companyNameId").val();
	var sname=$('#companyName').val();

	//========== ajax call ==============
	var cname=$("#companyNameId").val();
	if(cname.length==0){
		
		$('#div_companyNameId').addClass('has-error');
		 completeCheck=false;
		 if(!completeCheck)
			{
			 event.preventDefault();	
			 return false;
			}
		 $('#div_companyNameId').addClass('has-error');
		completeCheck=false;
		if(!completeCheck)
		{
			return false;
			event.preventDefault();
		}
	}
	cname = cname.replace(/\s/g,'');
	if(cname.length!=0){
		$.ajax({
			dataType: "json",
			url: 'ajax/checkDuplicateAccount',
			type: 'POST',
			data: 'companyName='+companyName,
			success: function(data) {

				var flag=data.flag;

				var flag=data.flag;


				
				var data1=JSON.parse(data);
				var flag=data1.flag;
				
				
				if(flag==true){
					$('#companyNameId1').hide();
					$('#companyNameErrorId').show();
					$('#companyNameErrorId').html("<font color='red'>Company name already exist.</font>");
					$("#companyNameId").val('');
				}
				else{
					/*$('#companyNameId1').hide();
					$('#companyNameErrorId').show();*/
					$('#companyNameId1').addClass('valid');
					$('#companyNameId1').html("<font color='green'>Company name available.</font>");
				}
			},
			error: function(e) {

			}
		});
	}
}

function checkDuplicateUrl(event){
	var companyUrl=$("#companyUrlId").val();
	
	if(companyUrl.length!=0){ 
		if(ipvalidator(event)){
		$.ajax({
			url: 'ajax/checkDuplicatecompanyUrl',
			type: 'POST',
			data: 'companyUrl='+companyUrl,
			dataType: "json",
			success: function(data) {
				var flag=data.flag;
				if(flag==true){
					$('#companyUrlId1').hide();
					$('#companyUrlErrorId').show();
					$('#companyUrlErrorId').html("<font color='red'>Company Url already exist.</font>");
					$("#companyUrlId").val('');
				}
				else{
					/*$('#companyUrlId1').hide();
					$('#companyUrlErrorId').show();*/
					$('#companyUrlId1').addClass('valid');
					$('#companyUrlId1').html("<font color='green'>Company Url available.</font>");
				}
			},
			error: function(e) {

			}
		});
		}
	}
}

function addRows(tableID) {
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length-2;
	var tr = document.createElement("tr");
	var td = document.createElement('td');
	var td1 = document.createElement('td');
	td.style.width = '200px';
	td1.style.width = '200px';
	td1.innerHTML="White Listed Source URL "+(rowCount+1)+" :";
	td.setAttribute("align", "left");
	td1.setAttribute("align", "right");
	var elementMax = document.createElement("input");
	elementMax.type = "text";
	elementMax.size=14;
	elementMax.setAttribute("align","left");
	elementMax.setAttribute("class","selecttag");
	var length=(table.rows.length)-1;
	elementMax.name = "portalurls";
	td.appendChild(elementMax);
	tr.appendChild(td1);
	tr.appendChild(td);
	table.appendChild(tr);
}

function deleteRow(tableID) {
	try {
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;

		if(rowCount>2){
			table.deleteRow(rowCount-1);
		}
	}catch(e) {

	}
}

function getUrl(update)
{
	var h;
	var u;
	a = document.getElementById('showLink');
	var commissionUrl=$( "#commissionId option:selected" ).val();
	if(commissionUrl==0)
	{
		$("#showSubmit").hide();
	}
	else
	{	
		$("#showSubmit").show();
		if(update==1)
		{
			var context=$('#contextPath').val();
			h=context+"/AdminUI/portalCreation/commissionForUrl?portalCommissionId="+commissionUrl;
			a.setAttribute("href",h);
		}
		else
		{
			var contextUpdate=$('#contextPath').val();
			u=contextUpdate+"/AdminUI/portalCreation/commissionForUrl?portalCommissionId="+commissionUrl; 
			a.setAttribute("href",u);
		}
	}
}

function toggleform(id)
{
	
$("#"+id).toggle("slow",function(){
	
  
});

}

function showAddressTable(index)
{
if(index.value=="Add More Information"){
	index.value="Show Less";
}else{
	index.value="Add More Information";	
}
$('#addMoreTableId').toggle()

}

