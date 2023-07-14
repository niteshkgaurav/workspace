var valueArray = new Array();
var minArray = new Array();
var maxArray = new Array();
var count=1;
var maxValue=new Array();


function removeClass(label,id)
{	var idd=$("#"+id).val();
			if(idd.length==0)
			{	$("#"+label).removeClass("valid");}
		
		
}
function addCommission()
{
	var hostCommission=$("#hostCommission").val().trim();
	var Distributor=$("#distCommission").val().trim();
	var SubDistributor=$("#subDistCommission").val().trim();
	var AgentCommission=$("#agentCommission").val().trim();
	var BankCommission=$("#bankCommission").val().trim();
	var hostVal;
	var distVal;
	var agentVal;
	var subDistVal;
	var bankVal;
	if(hostCommission.length<=0){
		hostVal=0;
	}else{
		hostVal=hostCommission;
	}
	if(SubDistributor.length<=0){
		subDistVal=0;
	}else{
		subDistVal=SubDistributor;
	}
	if(AgentCommission.length<=0){
		agentVal=0;
	}else{
		agentVal=AgentCommission;
	}
	if(Distributor.length<=0){
		distVal=0;
	}else{
		distVal=Distributor;
	}
	if(BankCommission.length<=0){
		bankVal=0;
	}else{
		bankVal=BankCommission;
	}
	var totalCommission=parseFloat(hostVal) + parseFloat(subDistVal)+parseFloat(agentVal)+parseFloat(distVal)+parseFloat(bankVal);
	if(totalCommission>=0.0){
	$("#totalCommission").val(totalCommission);
	}
}

function addSubscription()
{
	var hostSubscription=$("#hostSubscription").val().trim();
	var distSubscription=$("#distSubscription").val().trim();
	var subDistSubscription=$("#subDistSubscription").val().trim();
	var agentSubscription=$("#agentSubscription").val().trim();
	var bankSubscription=$("#bankSubscription").val().trim();
	var hostVal;
	var distVal;
	var agentVal;
	var subDistVal;
	var bankVal;
	if(hostSubscription.length<=0){
		hostVal=0;
	}else{
		hostVal=hostSubscription;
	}
	if(subDistSubscription.length<=0){
		subDistVal=0;
	}else{
		subDistVal=subDistSubscription;
	}
	if(agentSubscription.length<=0){
		agentVal=0;
	}else{
		agentVal=agentSubscription;
	}
	if(distSubscription.length<=0){
		distVal=0;
	}else{
		distVal=distSubscription;
	}
	if(bankSubscription.length<=0){
		bankVal=0;
	}else{
		bankVal=bankSubscription;
	}
	var totalCommission=parseFloat(hostVal) + parseFloat(subDistVal)+parseFloat(agentVal)+parseFloat(distVal)+parseFloat(bankVal);
	if(totalCommission>=0.0){
	$("#totalSubscription").val(totalCommission);
	}
}
function validateCommission(event){
	
var completeCheck=true;
var tempName=$("#tempName").val().trim();
var hostCommission=$("#hostCommission").val().trim();
var Distributor=$("#distCommission").val().trim();
var SubDistributor=$("#subDistCommission").val().trim();
var AgentCommission=$("#agentCommission").val().trim();
var customerCommission=$("#customerCommission").val();
var BankCommission=$("#bankCommission").val().trim();
var customerTypeCommission=$("#customerTypeCommission").val();

var hostVal;
var distVal;
var agentVal;
var subDistVal;
var bankVal;
if(hostCommission.length<=0){
	hostVal=0;
}else{
	hostVal=hostCommission;
}
if(SubDistributor.length<=0){
	subDistVal=0;
}else{
	subDistVal=SubDistributor;
}
if(AgentCommission.length<=0){
	agentVal=0;
}else{
	agentVal=AgentCommission;
}
if(Distributor.length<=0){
	distVal=0;
}else{
	distVal=Distributor;
}
if(BankCommission.length<=0){
	bankVal=0;
}else{
	bankVal=BankCommission;
}
 if(parseFloat(hostVal) + parseFloat(subDistVal)+parseFloat(agentVal)+parseFloat(distVal)+parseFloat(bankVal)>100.0){
		$("#errorstatusMessage").show(); 
		 $("#errorstatusMessage").html("<font color='#ff0000'>Total commission cannot be greater than 100</font>"); 
		 completeCheck = false;
 }

if(tempName.length<=0){
	$('#name').addClass('has-error');
	 completeCheck = false;
 }

if(customerCommission.length<=0){
	$('#commission-input').addClass('has-error');
	 completeCheck = false;
}

if(customerTypeCommission.length<=0){
	$('#commission-type-input').addClass('has-error');
	 completeCheck = false;
}

if(!completeCheck){
		
		return false;
	}else{
		return true;
	}
}

function validateSubscription(event){
	
	var completeCheck=true;
	var tempName=$("#tempName").val().trim();
	var hostSubscription=$("#hostSubscription").val().trim();
	var distSubscription=$("#distSubscription").val().trim();
	var subDistSubscription=$("#subDistSubscription").val().trim();
	var agentSubscription=$("#agentSubscription").val().trim();
	var customerSubscription=$("#customerSubscription").val();
	var bankSubscription=$("#bankSubscription").val().trim();
	var hostVal;
	var distVal;
	var agentVal;
	var subDistVal;
	var bankVal;
	if(hostSubscription.length<=0){
		hostVal=0;
	}else{
		hostVal=hostSubscription;
	}
	if(subDistSubscription.length<=0){
		subDistVal=0;
	}else{
		subDistVal=subDistSubscription;
	}
	if(agentSubscription.length<=0){
		agentVal=0;
	}else{
		agentVal=agentSubscription;
	}
	if(distSubscription.length<=0){
		distVal=0;
	}else{
		distVal=distSubscription;
	}
	if(bankSubscription.length<=0){
		bankVal=0;
	}else{
		bankVal=bankSubscription;
	}
	if(parseFloat(hostVal) + parseFloat(subDistVal)+parseFloat(agentVal)+parseFloat(distVal)+parseFloat(bankVal) <100){
		$('#host-input').addClass('has-error');
		$('#dist-input').addClass('has-error');
		$('#subDist-input').addClass('has-error');
		$('#agent-input').addClass('has-error');
		$('#bank-input').addClass('has-error');
		
		$("#errorstatusMessage").show(); 
		 $("#errorstatusMessage").html("<font color='#ff0000'>Total Subscription Should Be Equal To 100</font>");
		 completeCheck = false;
	 }else if(parseFloat(hostVal) + parseFloat(subDistVal)+parseFloat(agentVal)+parseFloat(distVal)+parseFloat(bankVal)>100.0){
			$("#errorstatusMessage").show(); 
			 $("#errorstatusMessage").html("<font color='#ff0000'>Total Subscription Cannot Be Greater Than 100</font>"); 
			 completeCheck = false;
	 }

	if(tempName.length<=0){
		$('#name').addClass('has-error');
		 completeCheck = false;
	 }

		if(customerSubscription.length<=0){
			$('#commission-input').addClass('has-error');
			 completeCheck = false;
		 }
	if(!completeCheck){
			
			return false;
		}else{
			return true;
		}
	}



function clearmsg(){
	
	$('#sucessMessage').html('');
}
function clearmsgMapping(){
	$('#sucessMessage').html('');
	$('#duplicationErrorId').html('');
}

function showLabelProduct(prodId){
	var prodIdNew=prodId.id;
		var idCount=parseInt(prodIdNew.replace( /[^\d.]/g, '' ));
		$("#label_productId"+idCount).show();
		$("#productIdError"+idCount).html("");
		
	
}

function validateCommissionMapping(event,newOrEdit){
	var check=true;
	var name=$('#tempName').val();
	if(name.length<=0){
		$("#label_tempName").hide();
		$("#nameError").show(); 
		 $("#nameError").html("<font color='#ff0000'>Kindly Enter Name</font>");
		 event.preventDefault();
		 check = false;
	 }
	
	if(!check){
		event.preventDefault();
		return false;
	}else{
		document.getElementById("CommissionProductMappingForm").submit();
	}
			
}



function onlyNumricCheck(errorId,value,id){
	var res=value.split("");
	 for(var i=0;i<res.length;i++){
		 var a=res[i];
		 var asciiValue=a.charCodeAt();
		 if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			 $('#'+errorId).html("<font color='red'>Only Numeric are allowed </font>");
				$('#rangeError').show();
			document.getElementById(id).value="";
				event.preventDefault();
			}
	 }
	

}
function refresh(divId){
	$('#'+divId).load(location.href + " #"+divId);
	
}
function refreshMessage(successMessageId){
	$('#'+successMessageId).html('');
	$("#host-input").removeClass("has-error");		
	$("#dist-input").removeClass("has-error");	
	$("#subDist-input").removeClass("has-error");	
	$("#agent-input").removeClass("has-error");	
	$("#bank-input").removeClass("has-error");	
}
function onlyNumricNew(){
	var str=$('#custCommFixedValue').val();
	for(var i=0;i<str.length;i++){
		 var asciiValue=str.charCodeAt(i);
		 if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			 
			 if(asciiValue!=46){
			 $('#custCommFixedValue').val('');
			 $('#custCommFixedValueError').html('<font color="red">Only Numeric are allowed</font>');
				event.preventDefault();
				return false;
			}
		 }
	 
	}
}


function toggleform(id)
{
	$('#sucessMessage').html('');

$("#"+id).toggle("slow",function(){
	
  
});

}
function deleteCommission(rowId,commId){
	if (confirm('Are you sure you want to delete this template?')) {
	$.ajax({
		type:"POST",
		url :'/securebanking/AdminUI/commission/ajax/deleteCommission',
		data :'commissionId='+commId,
		success:function(response)
		{
		if(response>=1){
			location.reload();
			$('#sucessMessage').html('<p class="text-success">Deleted Successfully</p>');
			$('#sucessMessage').show();
		}else{
			$('#sucessMessage').html('<font color="red">Commission is mapped to product</font>');
			$('#sucessMessage').show();
		}
		},
		error: function(){
			return false;
			}
	});
	}
}
function deleteSubscription(rowId,commId){
	if (confirm('Are you sure you want to delete this template?')) {
	$.ajax({
		type:"POST",
		url :'/securebanking/AdminUI/commission/ajax/deleteSubscription',
		data :'subscriptionId='+commId,
		success:function(response)
		{
		if(response>=1){
			location.reload();
			$('#sucessMessage').html('<p class="text-success">Deleted Successfully</p>');
			$('#sucessMessage').show();
		}else{
			$('#sucessMessage').html('<font color="red">Subscription Is Mapped To Product</font>');
			$('#sucessMessage').show();
		}
		},
		error: function(){
			return false;
			}
	});
	}
}
function deleteCommissionMapping(rowId,commId){
	if (confirm('Are you sure you want to delete this template?')) {
	$.ajax({
		type:"POST",
		url :'/securebanking/AdminUI/commission/ajax/deleteCommissionMapping',
		data :'commissionId='+commId,
		success:function(response)
		{
		if(response==1){
		//	location.reload(); old
			  window.location.href = window.location.href + "?menuId="+$('#menuId').val()+"&submenuId="+$('#submenuId').val();
			$('#sucessMessage').html('<p class="text-success">Deleted Successfully</p>');
			$('#sucessMessage').show();
		}
		else{
			$('#sucessMessage').html('<font color="red">Commission is mapped to Agent</font>');
			$('#sucessMessage').show();
		}
		},
		error: function(){
			return false;
			}
	});
	}
}
	
	function checkName(value,tablename,field,errorId,lableid)
	{
		  var table=tablename;
		  var val= $('#'+value).val().trim();
		if(val.length>0 && val.length>4){
		$.ajax({
			   url: "/securebanking/AdminUI/common/ajax/checkCommissionName",
			   type: "GET",
			   dataType:"json",
			   data: "val="+val+'&table='+table+'&field='+field,
			   success:function(response){
				   
				   if(response==1)
					{
						  $('#'+errorId).show();
					      $('#'+lableid).hide();
					     $('#'+errorId).html("<font color='red'>Name Already Exist</font>");

					     $("#"+value).val('');
						
					}
					if(response==0)
					{
						
						 $('#'+errorId).addClass("valid");
						  $('#'+errorId).show();
					     
						  $('#'+lableid).hide();
					     $('#'+errorId).html("<font color='green'>Name Available</font>");
					}
				   
			   },
			   error:function(e)
			   {
				//   alert(e);
			   }
			   });
		}else{
			  $('#'+errorId).show();
		      $('#'+lableid).hide();
		     $('#'+errorId).html("<font color='red'>Length should be greater than or equal to 5</font>");

		     $("#"+value).val('');
		}


	}
