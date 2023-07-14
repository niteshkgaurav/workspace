function vaidatePhysicalReceipt()
{
	var qrValue = $('#qrValue').val();
	var status_Id = $('#status_Id').val();
	var vendorId = $('#label_vendorId').val();
	var invoiceNumber = $('#invoiceNumber').val();
	var lab_invoiceDate = $('#lab_invoiceDate').val();
	var e = document.getElementById("orderId");
	var productssId = $('#productss').val();
	var orderId = e.options[e.selectedIndex].text;
	
	
	
	 $('.select_Product').removeClass('has-error');
	 $('#label_vendor').removeClass('has-error');
	 $('#lab_qrCodeValueId').removeClass('has-error');
	 $('#divID_scanId').removeClass('has-error');
	 $('#div_invoiceNumber').removeClass('has-error');
	 $('datetimepicker1').removeClass('has-error');
	 $('#div_orderId').removeClass('has-error');

	
	
	
	if($("#productss").val()==""){
		$('.select_Product').addClass('has-error');
		return false;
	}
	if($("#label_vendorId").val()==""){
		$('#label_vendor').addClass('has-error');
		return false;
	}
	
	if(status_Id.length==0)
	{
		$('#divID_scanId').addClass('has-error');
		return false;	
	}
	if(vendorId.length==0)
	{
		$('#label_vendor').addClass('has-error');
		return false;	
	}
	if(qrValue.length==0)
		{$('#lab_qrCodeValueId').addClass('has-error');
		return false;
		}
	
	
	
	
if($("#openProduct").is(":hidden")==false){
	if(invoiceNumber.length==0)
	{
		$('#div_invoiceNumber').addClass('has-error');
	return false;
	}
	
	if(lab_invoiceDate.length==0)
	{
		$('#datetimepicker1').addClass('has-error');
		return false;	
	}

	if(e.length==0)
	{
		$('#div_orderId').addClass('has-error');
		return false;
	}
	}
	
	 var intValArray=qrValue.split('|');
	 
	 if(productssId==2)
     {
		 $.ajax({
				type: "post",
				url: "ajax/getInfoForMvAndProducts",
				dataType: "json",
				data: 'product='+intValArray[0]+'&masterVersion='+intValArray[1]+'&overlayOrCard='+productssId,
				success: function(response){
				
					var array = JSON.parse(JSON.stringify(response));
					$('#errorId').html("");
					if(productssId==1)
					{
						if(status_Id==1)
						{
							$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>Main Series From</th><th>Main Series To</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th><th>Invoice Number</th><th>Invoice Date</th><th></th></tr></thead><tbody>');
						}
						else
						{
							$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>External-Number</th><th>Order Number</th><th>Invoice Number</th><th>Invoice Date</th></tr></thead><tbody>');
						}
						if(status_Id==1)
						{		
							$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+intValArray[6]+'</td><td align="center">'+intValArray[7]+'</td><td align="center">'+intValArray[8]+'</td><td align="center">'+intValArray[9]+'</td><td align="center">'+intValArray[10]+'</td><td align="center">'+intValArray[11]+'</td></tr>');
						}
						else
						{
							$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+orderId+'</td><td align="center">'+invoiceNumber+'</td><td align="center">'+lab_invoiceDate+'</td></tr>');
						}	
					}
					else if(productssId==2)
					{
						if(status_Id==1)
						{
							$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Card Type</th><th>Main Series From</th><th>Main Series To</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th><th>Invoice Number</th><th>Invoice Date</th><th></th></tr></thead><tbody>');
						}
						else
						{
							$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Card Type</th><th>External-Number</th><th>Order Number</th><th>Invoice Number</th><th>Invoice Date</th></tr></thead><tbody>');
						}
						if(status_Id==1)
						{		
							$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+intValArray[6]+'</td><td align="center">'+intValArray[7]+'</td><td align="center">'+intValArray[8]+'</td><td align="center">'+intValArray[9]+'</td><td align="center">'+intValArray[10]+'</td><td align="center">'+intValArray[11]+'</td></tr>');
						}
						else
						{
							$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+orderId+'</td><td align="center">'+invoiceNumber+'</td><td align="center">'+lab_invoiceDate+'</td></tr>');
						}	
					}
					$('#tempDetailsSubmit').show();
				}
		})
     }
	 else if(productssId==1)
     {
		 $.ajax({
				type: "post",
				url: "ajax/getInfoForMvAndProducts",
				dataType: "json",
				data: 'product='+intValArray[0]+'&masterVersion='+intValArray[1]+'&overlayOrCard='+productssId,
				success: function(response){
					
					var array = JSON.parse(JSON.stringify(response));
					$('#errorId').html("");
					if(status_Id==1)
					{
						$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>Main Series From</th><th>Main Series To</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th><th>Invoice Number</th><th>Invoice Date</th><th></th></tr></thead><tbody>');
					}
					else
					{
						$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Master-Version</th><th>External-Number</th><th>Order Number</th><th>Invoice Number</th><th>Invoice Date</th></tr></thead><tbody>');
					}
					if(status_Id==1)
					{		
						$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[3]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+intValArray[6]+'</td><td align="center">'+intValArray[7]+'</td><td align="center">'+intValArray[8]+'</td><td align="center">'+intValArray[9]+'</td><td align="center">'+intValArray[10]+'</td><td align="center">'+intValArray[11]+'</td></tr>');
					}
					else
					{
						$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+array[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+orderId+'</td><td align="center">'+invoiceNumber+'</td><td align="center">'+lab_invoiceDate+'</td></tr>');
					}	
					$('#tempDetailsSubmit').show();
				}
		})
	}
	 
	 else{
		 
		 
		 
		 $.ajax({
				type: "post",
				url: "ajax/getInfoForMvAndProducts",
				dataType: "json",
				data: 'product='+intValArray[0]+'&overlayOrCard='+productssId,
				success: function(response){
					
					var array = JSON.parse(JSON.stringify(response));
					$('#errorId').html("");
					if(status_Id==1)
					{
						$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>Main Series From</th><th>Main Series To</th><th>Box Series From</th><th>Box Series To</th><th>Box Number</th><th>Box Size</th><th>Order Number</th><th>Order Date</th><th>Invoice Number</th><th>Invoice Date</th><th></th></tr></thead><tbody>');
					}
					else
					{
						$('#template_details').html('<thead><tr class="mainTableHeader"><th>Product Name</th><th>External-Number</th><th>Order Number</th><th>Invoice Number</th><th>Invoice Date</th></tr></thead><tbody>');
					}
					if(status_Id==1)
					{		
						$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+intValArray[1]+'</td><td align="center">'+intValArray[2]+'</td><td align="center">'+intValArray[4]+'</td><td align="center">'+intValArray[5]+'</td><td align="center">'+intValArray[6]+'</td><td align="center">'+intValArray[7]+'</td><td align="center">'+intValArray[8]+'</td><td align="center">'+intValArray[9]+'</td><td align="center">'+intValArray[10]+'</td><td align="center">'+intValArray[11]+'</td></tr>');
					}
					else
					{
						$('#template_details').append('<tr><td align="center">'+array[0]+'</td><td align="center">'+intValArray[1]+'</td><td align="center">'+orderId+'</td><td align="center">'+invoiceNumber+'</td><td align="center">'+lab_invoiceDate+'</td></tr>');
					}	
					$('#tempDetailsSubmit').show();
				}
		})
	 }
	
}

$(document).ready( function (){
	$("#tempDetailsSubmit").hide();
	$("#openProduct").hide();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	today = yyyy+'/'+dd+'/'+mm;
	$("#lab_invoiceDate").val(today);
}); 
function getProductDetail()
{
	var status_Id = $('#status_Id').val();
	if(status_Id==2)
		{
			$("#openProduct").show();		
		}
	else
		{
			$("#openProduct").hide();
		}
}

function productTypeCheck(){
	if($("#productss").val()==undefined||$("#productss").val()==""){
		return false;
	}
	
		$.ajax({
		url : "ajax/get-product-vendors",
		type : "GET",
		dataType: "json",
		async:false,
		data :"productType="+$("#productss option:selected").text(),
		success : function(data) {
			var responseArray = [];
			responseArray = JSON.parse(JSON.stringify(data)).responseEntityList;
			if(responseArray.length>0)
			{
				
			var options =	"";
				$.each(responseArray, function( index, value ) {
					
					options+="<option value="+responseArray[index].id+" label='' >"+responseArray[index].companyName+"</option>";
					 
					});
				$("#label_vendorId").empty();
				$("#label_vendorId").append(options);
			}
			else {
				$("#label_vendorId").empty();
			}
		}
	});
	
}

function checkValue(id){
	var value=$('#valueOfHyperlink').val();
	//var value=${acList.shortBoxes};
	alert(value);
	if(id<=0){
		alert(value);
		var x=document.getElementById('link1').enable=true;  
		alert(x);
	}
}

function checkValue2(){
	var value=$('#valueOfHyperlink').val();
	alert(value);
	if(value<=0){
		document.getElementById('link2').disabled=true;
	}
}
/*
function disableLink()
{

document.getElementById('Link1').disabled=true;
document.getElementById('Link1').removeAttribute('href');    
document.getElementById('Link1').style.textDecoration = 'none';
document.getElementById('Link1').style.cursor = 'default';
}


function showLink()
{
    document.getElementById('Link1').disabled=false;
//assign href dynamically
document.getElementById('Link1').href = "shortBoxesView?product=${acList.product}&mv=${acList.masterVersion}&order=${acList.ordernumber}";
document.getElementById("Link1").style.textDecoration = "underline";
document.getElementById("Link1").style.cursor = "hand";
}
*/