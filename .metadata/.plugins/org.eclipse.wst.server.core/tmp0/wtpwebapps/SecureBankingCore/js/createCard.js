function validateCreateCard(event){
	var check=true;
	var cardName=$('#cardName').val().trim();
	if(cardName.length==0){
		$('#cardNamestyled-input').addClass('has-error');
		check=false;
	}
	
	var bankId=$('#bankId').val();
	if(bankId.length==0){
		$('#bankDiv').addClass('has-error');
		check=false;
	}
	

	/*if($("input[name='radio']:checked").size()<=0){
		$('#radioValuetErrorId').show();
		$('#radioValuetErrorId').html('<font color="red" size="2"> Kindly Select Radio Button</font>');
		check=false;
		event.preventDefault();
	}
*/
	var a=$(".rcheck").is(":checked");
	if(a==false)
		{
		$('#radioValuetErrorId').show();
		$('#radioValuetErrorId').html('<font color="red" size="2"> Kindly Select Radio Button</font>');
		check=false;
		event.preventDefault();
		}
	
	if(document.getElementById("uploadFilePath").value != "") {
		var fileName=$("#uploadFilePath").val();
		 var allowed_extensions =["jpg","png","gif","doc","docx","xls","pdf","xlsx","jpeg","PNG"];
		    var file_extension = fileName.split('.').pop(); 
		    
		    // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.
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
		check=false;
	}
	
	
	var payCardApp1=$('#payCardApp1').val();
	var payCardApp2=$('#payCardApp2').val();
	var payCardApp3=$('#payCardApp3').val();
	var payCardApp4=$('#payCardApp4').val();
	
	if(payCardApp1.length==0&&payCardApp2.length==0&&payCardApp3.length==0&&payCardApp4.length==0){
		
		$('#partner1').addClass('has-error');
		check=false;
	}
	//uncomment for wallet type validation
	/*if($("#walletType option:selected").length==0)
    {
		$('#walletTypeErrorId').show();
	$('#walletTypeErrorId').html('<font color="red" size="2"> Kindly Select Wallet Type</font>');
        check = false;
    }*/
	var cardType=$('#cardType').val();
	if(cardType.length==0)
    {
        $('#cardTypeDiv').addClass('has-error');
        check = false;
    }
	
	var startDate =$('#startDate').val().trim();
	if(startDate.length == 0){
		$('#startDateId').hide();
		$('#startDateErrorId').show();
		$('#startDateErrorId').html('<font color="red" size="2">From Date can not be empty</font>');
		check = false;
	}
	var endDate =$('#endDate').val().trim();
	if(endDate.length == 0){
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date can not be empty</font>');
		check = false;
	}
	
	if(Date.parse(endDate)<=Date.parse(startDate)){
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		$('#endDate').val('');
		check = false;
	}

	var duplicacyArray=[];
	if(payCardApp1.length!=0){
		
		duplicacyArray.push(payCardApp1);
	}
		if(payCardApp2.length!=0){	
			duplicacyArray.push(payCardApp2);
			}
		if(payCardApp3.length!=0){
			duplicacyArray.push(payCardApp3);
		}
		if(payCardApp4.length!=0){
			duplicacyArray.push(payCardApp4);
		}
		 var a=[];
		 var b=[];
		 var prev;
		 duplicacyArray.sort();
		 for ( var counter = 0; counter < duplicacyArray.length; counter++ ) {
		     if ( duplicacyArray[counter] !== prev ) {
		         a.push(duplicacyArray[counter]);
		         b.push(1);
		     } else {
		         b[b.length-1]++;
		     }
		     prev = duplicacyArray[i];
		 }
for ( var j= 0; j < b.length; j++ ) {
			 if(b[j]!=1){
				 $('#radioValuetErrorId').show();
					$('#radioValuetErrorId').html('<font color="red" size="2">Duplicate selection of App not allowed</font>');
					check=false;
			 }
		 }
	
	
	
	if(!check){
		event.preventDefault();
	}
	return check;
} 

function partnerSelection(partnerList,payCardPartnerErrorId){
	
	var partnerListNew=$('#'+partnerList).val();
	
		if(partnerListNew.length>3){
	     $('#'+payCardPartnerErrorId).show();
	 	$('#'+payCardPartnerErrorId).html('<font color="red" size="2"> You can select upto 4 options only</font>');
	     
	  }
}
function selct(label_payCardApp){
	$("#"+label_payCardApp).addClass('valid');	
}

function checkDuplicacy(){
	var payCardApp1=$('#payCardApp1').val();
	var payCardApp2=$('#payCardApp2').val();
	var payCardApp3=$('#payCardApp3').val();
	var payCardApp4=$('#payCardApp4').val();
	var duplicacyArray=[];
	if(payCardApp1.length!=0){
	duplicacyArray.push($('#payCardApp1').val());
	}
	if(payCardApp2.length!=0){
		duplicacyArray.push($('#payCardApp2').val());
	}
	if(payCardApp3.length!=0){
		duplicacyArray.push($('#payCardApp3').val());
	}
	if(payCardApp4.length!=0){
		duplicacyArray.push($('#payCardApp4').val());
	}
	 var a=[];
	 var b=[];
	 var prev;
	 duplicacyArray.sort();
	 for ( var i = 0; i < duplicacyArray.length; i++ ) {
	     if ( duplicacyArray[i] !== prev ) {
	         a.push(duplicacyArray[i]);
	         b.push(1);
	     } else {
	         b[b.length-1]++;
	     }
	     prev = duplicacyArray[i];
	 }

	 for ( var k = 0; k < b.length; k++ ) {
		 if(b[k]!=1){
			 $('#radioValuetErrorId').show();
				$('#radioValuetErrorId').html('<font color="red" size="2"> Kindly Select Radio Button</font>');
		 }
	 }
	 
		
		
	
}


function dialoguebox(rowId,id)
{
	$('lab_deactiveId').html('');
	$('#remarks').val('');
	$("#deactivateid").val(id);
$('#divId').show();
}

function getListOfPartners(appId,partnersId){
	var payCardAppId=$('#'+appId).val();
	 $.ajax({
         url : "ajax/listOfPartners",
         type : "POST",
         async: false,
		 dataType: "json",
         data :'payCardAppId='+payCardAppId,
         success : function(response) {
        	var obj=response;
        	   var select = $('#'+partnersId);
        	   select.find('option').remove();
        	   $.each(obj, function( index, value ) {
        	    var select = $('#'+partnersId);
        	    $('<option>').val(index).text(value).appendTo(select);
        	   });
			  
         },
         error: function(){
        	return false;
			}
  });
}


function deactivate(id){
	
	var remarks=$('#remarks').val().trim();
	if(remarks.length<=0){
	$('#reason').hide();
	$('#remarksErrorId').show();
	$('#remarksErrorId').html("<p class='text-danger'>Enter Reason for deactivation</p>");
	return false;
	}
	var   deactivateId= $("#deactivateid").val();
	$.ajax({
		type:"POST",
		url :'ajax/deactivateCard',
		dataType: "json",
		data :'deactivateId='+deactivateId+'&remarks='+remarks,
		success:function(response)
		{
		if(response==1){
			var link=$("input[name=link]:hidden").val();
			
			link=link+"/AdminUI/cardManagement/cardList";
			
			
			
				window.location.replace(link);
			
			$('#remarks').val('');
		}
		},
		error: function(){
			return false;
			}
	});
}

function refresherrorid(event,radioValuetErrorId){
	$('#'+radioValuetErrorId).html('');
}
function checkApp(payCardApp){
	$('#radioValuetErrorId').html('');
 	if($('#'+payCardApp).val().trim().length==0){
		 $('#radioValuetErrorId').show();
			$('#radioValuetErrorId').html('<font color="red" size="2">Corresponding App not selected</font>');
			$('input[name="radio"]').prop('checked', false);
			return false;	
	}
}
function checkApp2(payCardApp,radioId){
	$('#radioValuetErrorId').html('');
 	if($('#'+payCardApp).val().trim().length==0 && 	$("#"+radioId).is(":checked")){
		 $('#radioValuetErrorId').show();
			$('#radioValuetErrorId').html('<font color="red" size="2">Select Corresponding App</font>');
			return false;	
 	}
	
}


function toggleform(id)
{
	$('#msgId').html('');
$("#"+id).toggle("slow",function(){
	/*
	 * 
	 * 
	 */
  
});

}
function rmvmsg(){
	
	
	$('#walletTypeErrorId').html('');
}
