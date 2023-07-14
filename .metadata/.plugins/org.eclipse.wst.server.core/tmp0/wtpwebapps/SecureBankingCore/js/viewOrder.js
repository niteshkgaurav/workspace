

var loadListener = function(){
	$("#no_onbehalf1").hide();
	$("#no_onbehalf").hide();
	$("#orderBy").attr('disabled',true);
	new Date().getTime()-604800000;
	
} 

$(document).ready(loadListener);
function showForOnbehalf(groupcode)
{
	$('#onbehalf_Account').val('0');
	$('#select_onbehalf').val('');
	$('#orderBy').val('0');
	var viewfor = $('#viewfor').val();
	if(viewfor==1)	
		{
			if(groupcode=='PP')
				{
				$("#orderBy").val('1');
				$("#label_orderBy").addClass("valid");
				$("#divID_orderBy").removeClass("has-error");
				var orderBy = $('#orderBy').val();
					if(orderBy==1)
						{ 
						 	$("#orderBy").attr('disabled',true);
						}
				}
				$('#onbehalfTypeErrorId').html("");
				$('#onbehalfErrorId').html("");
				$('#orderbyErrorId').html("");
		}
	if(viewfor==2)
	{
		
		$("#orderBy").removeAttr("disabled");
		$("#no_onbehalf1").val('0');
		$("#no_onbehalf").val('');
		$("#no_onbehalf1").show();
		$("#no_onbehalf").show();
	}
	else
	{
		
		$("#no_onbehalf1").hide();
		$("#no_onbehalf").hide();
	}
}
var table;
function validateViewOrder(formId,event)
{
	
	var completeCheck = true;
	var viewfor = $('#viewfor').val();
	var onbehalf_Account = $('#onbehalf_Account').val();
	var fromDate = $('#lab_start_date').val();
	var endDate = $('#lab_end_date').val();
	var status = $('#status').val();
	var ponumber="";//$('#label_Order_Number').val().trim();
	var items = new Array();
	items.push(status);
	if(viewfor == "2")
		items.push(onbehalf_Account);
	else 
		items.push("");
	items.push(ponumber);

	if(viewfor==1)
	{
		$('#onbehalfTypeErrorId').html("");
		$('#onbehalfErrorId').html("");
		event.preventDefault();
	}
	if(viewfor==2)
	{
		console.log("*****"+onbehalf_Account);
		if(onbehalf_Account==0 || onbehalf_Account==null)
		{
			$('#divID_onbehalf_Account').addClass('has-error');
			
			event.preventDefault();
			completeCheck=false;
		}
	}
	
	if(fromDate.length==0)
	{
		$('#divID_start_date').addClass("has-error");
		/*$('#label_fromDate').hide();
		$('#lab_start_date_ErrorId').show();
		$('#lab_start_date_ErrorId').html("<p class='text-danger'>Kindly Select From date</p>");*/
		event.preventDefault();
		completeCheck=false;
	}
	
	if(endDate.length==0)
	{
		$('#toDate_divID').addClass("has-error");
		event.preventDefault();
		completeCheck=false;
	}
	
	if(endDate.length!=0 && fromDate.length!=0)
	{
		
		if(endDate<fromDate)
		{
			
			$('#toDate_divID').addClass("has-error");
			$('#label_toDate').hide();
			$('#lab_end_date_ErrorId').show();
			$('#lab_end_date_ErrorId').html("<p><font color='red'>Selected date should not be less than From Date </font></p>");
			$('#lab_end_date').val("");
			event.preventDefault();
			completeCheck=false;
		}
		
		
	} 
	
	
	if(status==0)
	{
		$('#status_divID').addClass("has-error");
		/*$('#statusErrorId').html("<p class='text-danger'>Kindly select status</p>");*/
		event.preventDefault();
		completeCheck=false;
	}
	if(completeCheck) {
		//$("#submitButtonId").attr('disabled','disabled');
		$.ajax({
			type: "post",
			url: "ajax/viewOrderDetailsForAccount",
			dataType: "json",
			data: 'fromDate='+fromDate+'&endDate='+endDate+'&viewfor='+viewfor+'&items='+items,
			success: function(response){
//				var unit = response.stock;
//				console.log(unit);
				var valuess=response.orders;
				if ($.isEmptyObject(response.orders)) 
				{
					$('#template_details').removeAttr("class");
					$('#template_details').html('<p class="text-danger">There are no orders to display.</p>');
					$("#submitButtonId").removeAttr("disabled");
					return false;
				}
				else {
					$('#errorId').html("");
					if(table!=undefined){
						table.destroy();
					}
					//$('#template_details').html('<thead class="default"><tr><th align="center">Order Number</th><th align="center">Product</th><th align="center">Order by</th><th align="center">Order For</th><th align="center">Order To</th><th align="center">Order Date</th><th align="center">Master-Version</th><th align="center">Card Type</th><th align="center">Unit Quantity</th><th align="center">Unit Received</th><th align="center">Pending Quantity</th><th align="center">Available Stock</th><th align="center">Order Status</th><th align="center">Action</th></tr></thead><tbody>').scrollTop();
					$('#template_details').html('<thead class="default"><tr><th align="center">Order Number</th><th align="center">Product</th><th align="center">Order by</th><th align="center">Order For</th><th align="center">Order To</th><th align="center">Order Date</th><th align="center">Master-Version</th><th align="center">Card Type</th><th align="center">Unit Quantity</th><th align="center">Unit Received</th><th align="center">Pending Quantity</th><th align="center">Order Status</th><th align="center">Action</th></tr></thead><tbody>').scrollTop();
					for(var i=0;i<valuess.length;i++)
					{
						if(valuess[i].statusType==="Pending" || valuess[i].statusType==="Partial_Complete")
						{		
							$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input id="remove_${acList.id}" type="button" value="Cancel" onclick="cancelOrder('+valuess[i].id+')"/></td></tr>');
							//$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input id="remove_${acList.id}" type="button" value="Cancel" onclick="cancelOrder('+valuess[i].id+')"/></td></tr>');
						}
						else
						{
							$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input type="button" value="Cancel" disabled="disabled"/></td></tr>');
							
							//$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input type="button" value="Cancel" disabled="disabled"/></td></tr>');
						}
					}	
					table = $('#template_details').DataTable({
				          "scrollY":        "350px",
				          "scrollX":        "350px",
				          "scrollCollapse": true,
				          "paging":         true,
				          "pagingType": "simple_numbers",
				          "order":[],
//				          "fixedHeader": true
				    });
					$("#showSubmit").show();
					$("#showLink").show();
					$('#waitId').hide();
					$('#submitId').show();
					$("#submitButtonId").removeAttr("disabled");

				}
			}, 
			error:function(ex){
				$('#template_details').removeAttr("class");
				$('#template_details').html('<p class="text-danger">Somthing went wrong.</p>');
				$("#submitButtonId").removeAttr("disabled");
			}
		});
		
	} else {
		return false;
	}
}
function cancelOrder(id)
{
	var viewfor = parseInt($('#viewfor').val());
	var select_onbehalf = "";
	if(viewfor==2){
		select_onbehalf = $('#onbehalf_Account').val();
	}

	
	var orderBy = $('#orderBy').val();
	var fromDate = $('#lab_start_date').val();
	var endDate = $('#lab_end_date').val();
	var status = $('#status').val();
	var items = new Array();
	
	
	items.push(status);
	items.push(select_onbehalf);
	$('#reasonId').dialog({
		width: 300,
		height: 150,
		title:'Confirmation',
		buttons : {
			"OK" : function (response)
			{$.ajax({
				
				type: "post",
				url: "ajax/cancelOrder",
				dataType: "json",
				data: 'fromDate='+fromDate+'&endDate='+endDate+'&viewfor='+viewfor+'&orderBy='+orderBy+'&orderId='+id+'&items='+items,
				success: function(response){
					var valuess=response;
					if ($.isEmptyObject(response)) 
					{
						$('#errorId').html("<p class='text-danger'>There are no orders to display.</p>");
						$('#template_details').html('');
					}
					else
					{
						table.destroy();
						$('#errorId').html("");
						//$('#template_details').html('<thead><tr class="mainTableHeader"><th>Order Number</th><th>Product</th><th>Master-Version</th><th>Unit Quantity</th><th>Unit Received</th><th>Pending Quantity</th><th>Product Status</th><th>Order Status</th><th>Order by</th><th>Order For</th><th>Order To</th><th>Action</th><th></th></tr></thead><tbody>');
						for(var i=0;i<valuess.length;i++)
						{
							if(valuess[i].statusType==="Pending" || valuess[i].statusType==="Partial_Complete")
							{		
								//$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].statusType+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center"><input id="remove_${acList.id}" type="button" value="Cancel"  class="btn btn-warning" onclick="cancelOrder('+valuess[i].id+')"></td></tr>');
								$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input id="remove_${acList.id}" type="button" value="Cancel" onclick="cancelOrder('+valuess[i].id+')"/></td></tr>');

							}
							else
							{
								//$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].statusType+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center"><input id="remove_${acList.id}" type="button" class="btn btn-warning buttonDisabled" value="Cancel" disabled=true"></td></tr>');
								$('#template_details').append('<tr><td align="center">'+valuess[i].orderNumber+'</td><td align="center">'+valuess[i].product+'</td><td align="center">'+valuess[i].orderDoneBy+'</td><td align="center">'+valuess[i].orderDoneFor+'</td><td align="center">'+valuess[i].orderDoneTo+'</td><td align="center">'+valuess[i].orderDate+'</td><td align="center">'+valuess[i].masterVersion+'</td><td align="center">'+valuess[i].cardType+'</td><td align="center">'+valuess[i].unitQuantity+'</td><td align="center">'+valuess[i].unitReceived+'</td><td align="center">'+valuess[i].pendingQuantity+'</td><td align="center">'+valuess[i].orderStatus+'</td><td align="center"><input type="button" value="Cancel" disabled="disabled"/></td></tr>');
							}	
						}
						// $('#template_details').DataTable();
						$("#tempDetails").show();
						$('#template_details').show();
						$("#showSubmit").show();
						$("#showLink").show();
						$('#waitId').hide();
						$('#submitId').show();
						$('#reasonId').dialog("close");

					}
					
				}
			});},
			
			"CANCEL" : function(){
				$(this).dialog("close");
			}
		},
	modal: true
	});

	
}

function nameSelectt()
{
	var tagName = "";
	$("#onbehalfErrorId").html('');
	var selectType=$('#onbehalf_Account').val();
	
	
            $("#select_onbehalf").autocomplete({  
            source : function(request, response) {
            	
            	if(selectType!='0')
            		{
            		tagName= $("#select_onbehalf").val();
            			
            		}
          	  $.ajax({
                   url : "ajax/getTags",
                    type : "GET",
					dataType: "json",
                    data :'tagName='+tagName+'&selectType='+selectType+'&filter=viewordernew',
                    success : function(data) {
                    	if(data.length==0)
                    		{
                    		
                    		$("#select_onbehalf").val("");
                    		$('#divID_select_onbehalf').addClass("has-error");
                    		
                    		}
                    	
	            	else {
	            			$("#input[type=button]").removeAttr("disabled","disabled");
	            		}
                    	
                  	  response($.map(data, function (item) {
                  	        return item.split(",");
                  	    })); 
                    }
            });
    },
    select: function(e, ui) {  

        // alert(ui.item.label);
         },

         change: function(e, ui) {  
        	if(ui.item==null){
        		$("#select_onbehalf").val("");
        		$('#divID_select_onbehalf').addClass("has-error");
        	} 
          //  alert((ui.item==null)?"null":(ui.item.label==null));
         }
 },
 
 function showLabel1(event, ui) {
     alert(ui.item.label)
  }
            );

}

$( function() {
	
	$("#label_Order_Number").autocomplete({  
				
			    source : function(request, response) {
			    	
			    	var poNumber= $('#label_Order_Number').val().trim();
			    	var onbehalf_Account=$('#onbehalf_Account').val();
			    	
			  	  $.ajax({
			            url : "ajax/autoOrderNumber",
			            type : "GET",
			            dataType: "json",
			            data :'poNumber='+poNumber+'&selectOnbehalf='+select_onbehalf+'&onBehalfAccount='+onbehalf_Account+'&filter=vieworder',
			            //data :'poNumber='+poNumber+'&select_onbehalf='+select_onbehalf+'&onbehalf_Account='+onbehalf_Account+'&filter=vieworder', 
			            success : function(data) {
			            	if(data.length==0)
			            		{
			            		
				            		$('#lab_orderNumber').hide();
				            		$('#orderAutoSearchErrorId').show();
			            			$('#orderAutoSearchErrorId').html("<font color='red'>Not valid</font>");
			            			$("#label_Order_Number").val("");
			            		}
			            	
			          	  response($.map(data, function (item) {
			          	        return item.split(",");
			          	    })); 
			            }
			    });
			}
			});	
});

/*function OrderAutoSearch(){
	var poNumber= $('#label_Order_Number').val().trim();
	
	//alert("PO number"+     poNumber)
	//var select_onbehalf=$("#select_onbehalf").val();
	
	//document.getElementById('textbox_id').value
	//alert("select_onbehalf"+   select_onbehalf)
	var onbehalf_Account=$('#onbehalf_Account').val();
	//alert("onbehalf_Account"+   onbehalf_Account)
	$("#label_Order_Number").autocomplete({  
				
			    source : function(request, response) {
			    	
			    	var poNumber= $('#label_Order_Number').val().trim();
			    	var onbehalf_Account=$('#onbehalf_Account').val();
			    	
			  	  $.ajax({
			            url : "autoOrderNumber",
			            type : "GET",
			            data :'poNumber='+poNumber+'&select_onbehalf='+select_onbehalf+'&onbehalf_Account='+onbehalf_Account+'&filter=vieworder', 
			            success : function(data) {
			            	if(data.length==0)
			            		{
			            		
				            		$('#lab_orderNumber').hide();
				            		$('#orderAutoSearchErrorId').show();
			            			$('#orderAutoSearchErrorId').html("<font color='red'>Not valid</font>");
			            			$("#label_Order_Number").val("");
			            		}
			            	
			          	  response($.map(data, function (item) {
			          	        return item.split(",");
			          	    })); 
			            }
			    });
			}
			});	
}
*/

function validateOnbehalf(){
	$('#select_onbehalf').val("");

}

function emptyErrorMessage(event,errorid)
{
	$('#'+errorid).html("");
	return false;
}
