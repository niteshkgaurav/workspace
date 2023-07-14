
var count=0;
var currentvalue=null;
var wallets = new Array();
var walletsid = new Array();
var fixedWallet=new Array();
var providers= new Array();
var priorityid= new Array();
var tempWallet=new Array();


function Disable_priorityBox(walletpriority)
{
	var priority=$('#'+walletpriority).val();
	$('#' + walletpriority).attr("disabled",true);
	
}


function checkMasterVersionName(id){
	
	var vname=$("#"+id).val().trim();
	if(vname.length==0){
		
		$('#label_mVersionName').hide();
		$('#mVersionNameErrorId').show();
		$('#mVersionNameErrorId').html("<font color='red'>Enter version name.</font>");
		return false;
	}
	if(mVersionName==''){
		$('#label_mVersionName').hide();
		$('#mVersionNameErrorId').show();
		$('#mVersionNameErrorId').html("<font color='red'>Enter version name.</font>");
		return false;
	}
	else{
		$('#mVersionNameErrorId').html("");
	}
	if(vname!=''){
		$.ajax({
			url: 'ajax/checkMasterVersionName',
			type: 'POST',
			data: 'vname='+vname,
			dataType: "json",
			success: function(data) {
				
				if(data.length==0)
				{
					$('#label_mVersionName').hide();
					$('#mVersionNameErrorId').show();
					$('#mVersionNameErrorId').html("<font color='red'>Either Masterversion name is blank</font>");}
				if(data=='success'){
					$('#mVersionNameErrorId').html("<p class='text-success'>Version name available.</font>");
				}
				else if(data=='fail'){
					
					$("#"+id).val('');
					$('#mVersionNameErrorId').show();
					$('#mVersionNameErrorId').html("<font color='red'>Either Master Version name is already exist or blank</font>");
				}
			else if(data=='error'){
				$('#mVersionNameErrorId').html("<font color='red'>Error in checking version name.</font>");
			}

			}

		});
	}
}

function enablePopUp(obj){
	 $('#check').val(obj.value);
	 $("#dialog").dialog("open");
	 	
}
function enableOrDisableMasterVersion(mvId) {
	var status = $('#check').val();
	var comment=$('#comment').val();
	var data = {};
	data["mvId"] = mvId;
	data["status"] = status;
	data["comment"] = comment;
	if(comment.trim().length<=0){
		$('#commError').html('<font color="red">Kindly Enter Comment</font>');	
	}else{
	$.ajax({
		url: 'ajax/changeStatus',
		type: 'POST',
		data: data,
		dataType: "json",
		success: function(data) {
			if(data=='success'){
				$('#msgId').html("<p class='text-success'>Master Version successfully enabled...</font><br/><br/>");
			} else if(data=='disabled'){
				$('#msgId').html("<font color='red'>Master Version successfully disabled...</font><br/><br/>");
			} else if(data=='error'){
				$('#msgId').html("<font color='red'>Error occured in enable or disable master version</font><br/><br/>");
			}
			$('#comment').val('')
			$("#dialog").dialog("close");
		},
	
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		},
		done : function(e) {
			console.log("DONE");
		}

	});
	}
}

function removeCommError(){
	 $("#commError").html('');
}
var countt=0;

function enableSelectbox(id,walletpriority,walletid)
{ 
	 /*$("#wallettd").css("display","block");
	 $("#wallettd").show();*/
	
	$("#"+walletpriority).prop('disabled', false);
	
	
	
	$('#walletTypeErrorId').hide();
	var myTest=document.getElementById(walletpriority);
	var str=myTest.value.toString();
	var str1=str.charAt(2);
	wallets=remove(wallets,str1);
	var checkbox = walletid;
	var select = walletpriority;
	if ($('#' + checkbox).is(":checked")) {
		$('#' + walletpriority).show();
		return false;
	} else {
		$('#' + walletpriority).attr("disabled",false);
		$("#"+walletpriority).val("");
		var myTest=document.getElementById(walletpriority);
		var str=myTest.value.toString();
		var str1=str.charAt(2);
		wallets=remove(wallets,str1);
		$('#' + walletpriority).hide();
		return false;
	}
}

function remove(arrOriginal, elementToRemove){
    return arrOriginal.filter(function(el){return el !== elementToRemove});
}

function  enableprority()
{



}

var arrid = new Array();


function multipleDropdownValidation(id,walletpriority,walletid)
{
	$('#'+walletpriority).prop('disabled', true);
	priorityid.push(walletpriority);
	++count;
	var checkbox=walletid;
	var counter=0;
	var current=0;
	var priority=$('#'+walletpriority).val();
   arrid.push(id);
	var str=priority.toString();
	var str1=str.charAt(2);
	wallets.push(str1);
	
	 $('#walletTypeErrorId').hide();
	
				for(var i=0;i<wallets.length;i++)
					{	
						for(var j=i+1;j<wallets.length;j++)
							{
								if(wallets[i]==wallets[j])
							
									{  $('#walletTypeErrorId').show();
									
										$('#walletTypeErrorId').html("<font color='red'>Duplicate selection of priorities not allowed</font>");
										$('#'+checkbox).removeAttr("checked");
										$('#'+walletpriority).val('');
										$('#'+walletpriority).hide();
										wallets.pop(j,1);
										
										 return false;
							}
									}
						}
				
				}

function checkSmscode(id,event)
{

	var smscode=$("#smscode").val().trim();
	if(smscode!=''){

		$.ajax({
			url: 'ajax/checkSmscode',
			type: 'POST',
			data: 'smscode='+smscode,
			dataType: "json",
			success: function(data) {
				
				if(data=='success'){
				

				}
				else if(data=='fail'){
					$('#label_smscode').hide();
					$('#msmsCodeErrorId').show();
					$('#msmsCodeErrorId').html("<font color='red'>Either sms code is already exist or blank</font>");
					$("#smscode").val('');
					event.preventDefault();
				
				
				}
				else if(data=='error'){
					$('#label_smscode').hide();
					$('#msmsCodeErrorId').show();
					$('#msmsCodeErrorId').html("<font color='red'>Error in checking SMS Code .</font>");
				}

			}
		});

	}

}

function showProviderRow(id){
	var context=$("#context").val();

	var imgId="imgId"+id;
	var src=$('#'+imgId).attr('src');
	src= src.substring(src.lastIndexOf('/')+ 1);
	if(src=='add_image_icon.png'){
		$("#"+imgId).attr("src",context+"/images/minus.png");
		$("#providerRowId"+id).show();
	}
	else{
		$("#"+imgId).attr("src",context+"/images/add_image_icon.png");
		$("#providerRowId"+id).hide();
	}
}

function validateForm(){

	var mVersionName=$("#mVersionName").val().trim();
	var smscode=$("#smscode").val().trim();
	
	
	for(var i=0;i<wallets.length;i++)
	{ 
		tempWallet.push(i);
	}
	wallets.sort();
	
	if(mVersionName==''){
		$('#label_mVersionName').hide();
		$('#mVersionNameErrorId').show();
		$('#mVersionNameErrorId').html("<font color='red'>Either Master Version name is already exist or blank</font>");
		return false;
	}
	else{
		$('#mVersionNameErrorId').html("");
	}
	if(smscode.length==0){
		
		$('#label_smscode').hide();
		$('#msmsCodeErrorId').show();
		$('#msmsCodeErrorId').html("<font color='red'>Either sms code is already exist or blank</font>");
		return false;
	}
	else{
		$('#mVersionNameErrorId').html("");
	}
	
	
	
	
	var checkedCheckboxes = document.querySelectorAll("[name='providers']:checked");
	
	
	if (checkedCheckboxes.length == 0) {
		$('#providerErrorId').show();
		$('#providerErrorId').html("<font color='red'>Select a Provider</font>");
		return false;
		
		}
	
	checkMasterVersionName('mVersionName');
	hideThis();
	
	

}

	

function hideThis(){
	//alert("hise")
	$('#submitDIV').hide();
	$('#submitWait').show();
}
function getMasterVersionDetails(){
	var context=$("#context").val();

	//========== ajax call ==============
	$.ajax({
		url: 'ajax/getMasterVersionDetail',
		type: 'POST',
		data: '',
		dataType: "json",
		success: function(data) {
			var table=document.getElementById('MyTable');
			$("#MyTable tr:gt(0)").remove();
			$.each(data, function( key, value ) {
				var versionName=value.mVersionName;
				var versionCode=value.mVersionCode;
				var desc=value.mVersionDecsription;
				var id=value.id;

				var tr=table.insertRow();

				var td=tr.insertCell();
				td.innerHTML=versionName;
				tr.appendChild(td);

				var td=tr.insertCell();
				td.innerHTML=versionCode;
				tr.appendChild(td);

				var td=tr.insertCell();
				td.innerHTML=desc;
				tr.appendChild(td);

				var td=tr.insertCell();
				var anchor = document.createElement("A");
				anchor.setAttribute("href",context+"/AdminUI/MasterVersionCreation/mvEdit?id="+id);
				var src=document.createElement('IMG');
				src.setAttribute("title","Edit Master Version");
				src.setAttribute("src",context+"/images/edit.gif");
				anchor.appendChild(src);
				td.appendChild(anchor);
				tr.appendChild(td);

				table.appendChild(tr);


			});
		}
	});
}
function removeMsg()
{
	$("#msgId").html("");	
}

function pushWallet()
{
	var myTest=document.getElementsByName("walletpriority");
	for(var i=0;i<myTest.length;i++)
	{ if(myTest[i].value.toString())
		{
			var str=myTest[i].value.toString();
			var str1=str.charAt(2);
			wallets.push(str1);
		}
	}

}


function ifchecked(id)
{
	if(jQuery.inArray(id, providers) !== -1)		
	{		
		providers.pop();		
			
	}	
	
		          	
	if ($('#providers'+id).is(":checked")) {
		
		providers.push(id);
		$('#providerErrorId').hide();
		
	}
	else
		{
		providers.pop();
		$('#providerErrorId').hide();
		}
	
	
}

$(document).ready( function (){
	
	var proviserl= document.querySelectorAll("[name='walletname']:checked");
	
	           if($('input[name="walletcheckBoxName"]:checked'))
	        	   
	        	   {
	        	   
	        	 $("#wallettd").show();
	        	   
	        	   }
	           else
	        	   {
	        	   $("#wallettd").hide();
	        	   }
	           
	           
	           
	
});


function toggleform(id)
{
	$('#msgId').html('');
$("#"+id).toggle("slow",function(){
	
  
});

}
