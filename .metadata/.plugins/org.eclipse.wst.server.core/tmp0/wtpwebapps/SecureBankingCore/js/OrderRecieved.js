var dialogue=this;
function removeOrder(rowId,id)
{
	
	$.ajax({
		type:"POST",
		url :"ajax/removeOrderlist",
		data :"id="+id,
		dataType: "json",
		success:function(response)
		{
		},
		error : function(e)
		{
		}

	});
	
	
}

function toDateError()
{ 
	var check=true;
	var endDate = $("#lab_end_date").val(); 
	var fromDate = $('#lab_start_date').val();
		/*if(fromDate.length==0)
		{
			$('#lab_end_date').val("");
			$('#lab_end_date').addClass("has-error");
			$('#label_fromDate').hide();
			$('#lab_start_date_ErrorId').show();
			$('#lab_start_date_ErrorId').html("<p class='text-danger'>Kindly Select From date</p>");
			
		select=true;
		}*/
		if(endDate.length!=0 && fromDate.length!=0)
		{
			if(endDate<fromDate)
			{
				$('#div_toDate').addClass("has-error");
				$('#label_toDate').hide();
				$('#lab_end_date_ErrorId').show();
				$('#lab_end_date_ErrorId').html("<p><font color='red'>From date should be smaller then To date</font></p>");
				$('#lab_end_date').val("");
				check=false;
				
			}
			else{return false;}	
		} 
}

function filterOrder()
{


	var entityid=$("#Entity_Id").val();


	var fromDate=$("#lab_start_date").val();

	var endDate  =$("#lab_end_date").val();
	var statusid=$('#statusId').val();

	if(entityid==0)
	{
		return false;
	}


//	$.ajax({

//	url: 'getOrderDetails',
//	type : "POST",

//	data: '&fromDate='+fromDate+'&endDate='+endDate+'&entityid='+entityid+'&statusid='+statusid,
//	success: function(response){
//	alert("true");

//	var valuess=response;

//	},
//	error : function(e)
//	{
//	alert("zfd");
//	}
//	});

	var flag=false;;
	$("#orderno").dialog({

		width: 375,
		height: 225,
		title: ''+name,
		buttons : {
			"Submit" : function ()
			{

				if(flag==true)
				{
					$(this).dialog("close");

				}
			}
		}
	});	

}
//var selected = new Array();
// function selOrderBycheck(ordertoshippedId,id)
// {
//	 
////	 var shippingdataId = $('#OrderRecieved_table').attr('selected');
////	 shippingdataId +=','+id;
////	 $('#shippingdataId').val(id);
////	 var href = $("#hyperlinkId").attr("href");
////	 $("#hyperlinkId").attr("href"+href + shippingdataId);
////	 
////	  $('#hyperlinkId').append(shippingdataId);
//	if( $('#'+ordertoshippedId).prop('checked'))
//	 
//	 {		
//		
//		selected.push(id);
//	 }
//	
//		
// alert(selected);
// }
// 
// 
 

function printdiv(divID)
{
//	 var printContents = document.getElementById(divID).innerHTML;
//	 w=window.open();
//	 w.document.w(printContents);
//	 w.print();
//	 w.close();
	
	
	
	var inpText = new Array();
	  var oldPage = document.body.innerHTML;
	  var len=document.getElementsByTagName("input").length;
	  for(var i=0;i<len;i++)
		  {
	
	 inpText[i]=  document.getElementsByTagName("input")[i].value;
		  }
	
	  var divElements = document.getElementById(divID).innerHTML;

      document.body.innerHTML = 
        "<html><head><title></title></head><body>" + 
        divElements + "</body>";
      for(var i=0;i<len;i++){
     document.getElementsByTagName("input")[i].value = inpText[i];
      }
   
      window.print();
     
  document.body.innerHTML = oldPage;
//   for(var i=0;i<len;i++){
//  document.getElementsByTagName("input")[i].value = inpText[i];
//      }

  
	// return true;
	}


	/*$.ajax({
	
		url: 'getOrderDetails',
		type : "POST",
		
		data: '&fromDate='+fromDate+'&endDate='+endDate+'&entityid='+entityid+'&statusid='+statusid,
		success: function(response){
			var valuess=response;
			
		},
	   error : function(e)
	   {
	   }
	});*/
	
	
var table;
var table1;
var idIndex = 0;
var statusIndex = 0;
function validateOrderReceived()	
{
	var  select =false;

	idIndex = $("#Entity_Id").prop('selectedIndex');
	statusIndex = $("#statusId").prop('selectedIndex');
	var entityId=$("#Entity_Id").val();
	var fromdate=$("#lab_start_date").val();
	var todate=$("#lab_end_date").val();
	var status=$("#statusId").val();

	
	if(fromdate.length==0){
		$("#div_fromDate").addClass('has-error');
		select=true;
	
	}
	if(todate.length==0) {
		$("#div_toDate").addClass('has-error');
		select=true;
	}
	
	if(!select) {
		$("#submitButtonId").attr('disabled','disabled');
		
		$.ajax({
			"dataSrc": "data",
			"type": "POST",
			 dataType: "json",
			"url": "ajax/getOrderReceivedDetails",
			"dataType": "json",
			"data": 'fromDate='+fromdate+'&endDate='+todate+'&item='+entityId+'&status='+status,
			success: function(response){
	
				var valuess=response.orders;
				
				var orders=[];
				orders=response.orderCountObject;
				var status = response.status;
				$('#Entity_Id').get(0).selectedIndex = idIndex;
				$('#statusId').get(0).selectedIndex = statusIndex;
				$('#lab_start_date').val(fromdate);
				$('#lab_end_date').val(todate);
				$("#submitButtonId").removeAttr("disabled");
				
				
//				console.log(JSON.stringify(valuess));
				
				$('#tBodyId').empty();
				//$('#OrderRecieved_table1').html('').scrollTop();
				if(orders!=null){
					for(var i=0;i<orders.length;i++)
					{
						
//						console.log(orderfor);
						
							$('#tBodyId').append('<tr id="rowId"> <td>'+orders[i].product+' </td><td>'+orders[i].masterVersion+'</td> <td>'+orders[i].orderCount+'</td></tr>');
						
					}
				}
			
				
				
				if ($.isEmptyObject(response.orders)) 
				{
					$('#OrderRecieved_table').removeAttr("class");
					$('#OrderRecieved_table').html('<p class="text-danger">There are no orders to display.</p>');
					$("#submitButtonId").removeAttr("disabled");
					$("#div_ship").hide();
					return false;
				}
				else {
					$("#div_ship").show();
					$('#OrderRecieved_table').html('<thead class="default"><tr><th align="center">Select</th><th align="center">Order Number</th><th align="center">Order For</th><th align="center">Order By</th><th align="center">Order Date</th><th align="center">Master Version</th><th align="center">Units Ordered</th><th align="center">Units Dispatched</th><th align="center">Units Pending</th><th align="center">Order Status</th><th align="center">Action</th></tr></thead><tbody>').scrollTop();
					
					if(valuess.length>0){
						if(table!=undefined){
							table.destroy();
						}
					}
					
					
					
				/*	for(var i=0;i<valuess.length;i++)
					{
						var orderfor = ""+valuess[i].orderfor;
						var orderStatus = valuess[i].statusId;
						var productId = valuess[i].productId;
						var id = valuess[i].id;
//						console.log(orderfor);
						if(orderStatus.toUpperCase() =="CANCELLED" || orderStatus.toUpperCase() =="COMPLETE")
						{		
							$('#OrderRecieved_table1').append('<tr id="rowId"> <td id="orderChk_'+id+'"><input type="radio" path="ordertoshipped" disabled = "true" id="ordertoshipped_'+id+'" name="ordertoshipped" value="unchecked" disabled="true"  /> <c:set var="checkbox" value="ordertoshipped_'+id+'"> </c:set> </td><td>'+valuess[i].orderNumber+'</td> <td>'+valuess[i].orderfor+'</td> <td>'+valuess[i].orderBy+'</td> <td>'+valuess[i].orderDate+'</td><td>'+valuess[i].mvName+'</td> <td>'+valuess[i].unitordered+'</td> <td>'+valuess[i].orderShippedQty+'</td> <td>'+valuess[i].orderPendingQty+'</td> <td id="productstatus_'+id+'">'+valuess[i].statusId+'</td> <td id="action_'+id+'"><input id="remove_'+id+'" path="" disabled = "true" type="button" class="btn btn-warning" value="Cancel" class="removerow" />');
						}
						else
						{
							$('#OrderRecieved_table').append('<tr id="rowId_'+id+'"> <td id="orderChk_'+id+'"><input type="radio" path="ordertoshipped" id="ordertoshipped_'+id+'" name="ordertoshipped" value="'+id+'#'+productId+'" /> <c:set var="checkbox" value="ordertoshipped_'+id+'"> </c:set></td> <td>'+valuess[i].orderNumber+'</td> <td>'+valuess[i].orderfor+'</td> <td>'+valuess[i].orderBy+'</td> <td>'+valuess[i].orderDate+'</td> <td>'+valuess[i].mvName+'</td> <td>'+valuess[i].unitordered+'</td> <td>'+valuess[i].orderShippedQty+'</td> <td>'+valuess[i].orderPendingQty+'</td> <td id="productstatus_'+id+'">'+valuess[i].statusId+'</td> <td id="action_'+id+'"><input id="remove_'+id+'" type="button" class="btn btn-warning" value="Cancel" class="removerow" onclick="dialoguebox('+id+');"></td></tr>');
						}
					}*/
					
					
					
					for(var i=0;i<valuess.length;i++)
					{
						var orderfor = ""+valuess[i].orderfor;
						var orderStatus = valuess[i].statusId;
						var productId = valuess[i].productId;
						var id = valuess[i].id;
//						console.log(orderfor);
						if(orderStatus.toUpperCase() =="CANCELLED" || orderStatus.toUpperCase() =="COMPLETE")
						{		
							$('#OrderRecieved_table').append('<tr id="rowId_'+id+'"> <td id="orderChk_'+id+'"><input type="radio" path="ordertoshipped" disabled = "true" id="ordertoshipped_'+id+'" name="ordertoshipped" value="unchecked" disabled="true"  /> <c:set var="checkbox" value="ordertoshipped_'+id+'"> </c:set> </td><td>'+valuess[i].orderNumber+'</td> <td>'+valuess[i].orderfor+'</td> <td>'+valuess[i].orderBy+'</td> <td>'+valuess[i].orderDate+'</td><td>'+valuess[i].mvName+'</td> <td>'+valuess[i].unitordered+'</td> <td>'+valuess[i].orderShippedQty+'</td> <td>'+valuess[i].orderPendingQty+'</td> <td id="productstatus_'+id+'">'+valuess[i].statusId+'</td> <td id="action_'+id+'"><input id="remove_'+id+'" path="" disabled = "true" type="button" class="btn btn-warning" value="Cancel" class="removerow" />');
						}
						else
						{
							$('#OrderRecieved_table').append('<tr id="rowId_'+id+'"> <td id="orderChk_'+id+'"><input type="radio" path="ordertoshipped" id="ordertoshipped_'+id+'" name="ordertoshipped" value="'+id+'#'+productId+'" /> <c:set var="checkbox" value="ordertoshipped_'+id+'"> </c:set></td> <td>'+valuess[i].orderNumber+'</td> <td>'+valuess[i].orderfor+'</td> <td>'+valuess[i].orderBy+'</td> <td>'+valuess[i].orderDate+'</td> <td>'+valuess[i].mvName+'</td> <td>'+valuess[i].unitordered+'</td> <td>'+valuess[i].orderShippedQty+'</td> <td>'+valuess[i].orderPendingQty+'</td> <td id="productstatus_'+id+'">'+valuess[i].statusId+'</td> <td id="action_'+id+'"><input id="remove_'+id+'" type="button" class="btn btn-warning" value="Cancel" class="removerow" onclick="dialoguebox('+id+');"></td></tr>');
						}
					}	
					table = $('#OrderRecieved_table').DataTable({
				          "scrollY":        "350px",
				          "scrollX":        "350px",
				          "scrollCollapse": true,
				          "paging":         true,
				          "pagingType": "simple_numbers",
//				          "fixedHeader": true
				    });
					
					
					/*table1 = $('#OrderRecieved_table1').DataTable({
				          "scrollY":        "350px",
				          "scrollX":        "350px",
				          "scrollCollapse": true,
				          "paging":         true,
				          "pagingType": "simple_numbers",
//				          "fixedHeader": true
				    });*/
					
					/*table =  $('#OrderRecieved_table').DataTable( {
					    paging: true,	
					    "ajax": {
							"url":'ajax/getOrderReceivedDetails?fromDate='+fromdate+'&endDate='+todate+'&item='+entityId+'&status='+status,
							"type": "POST",
							dataSrc: 'orders'
					    },	
							columns: [
						            { "data": "orderNumber" },
						            { "data": "orderfor" },
						            { "data": "orderBy" },
						            { "data": "mvName" },
						            { "data": "unitordered" },
						            { "data": "orderShippedQty" },
						            { "data": "orderPendingQty" },
						            { "data": "statusType" },
						            { "data": "statusId" },
						        ]
						});*/
//					$("#showSubmit").show();
//					$("#showLink").show();
//					$('#waitId').hide();
//					$('#submitId').show();
				}
			}, 
			error:function(ex){
				$('#OrderRecieved_table').removeAttr("class");
				$('#OrderRecieved_table').html('<p class="text-danger">Somthing went wrong.</p>');
				$("#submitButtonId").removeAttr("disabled");
				$("#div_ship").hide();
			}
		});
		
	} else {
		return false;
	}



}
/*function validateship(event)
{
	if (!jQuery("#ordertoshipped_${acList.id}").is(":checked")) {
       // alert("none checked");
        return false;
    }
   
}*/


function validatetextbox(value)
{
var val=$('#orderforlist_'+value).val();


}
var temp =null;

function limitcheck(orderfor,id)
{
	//alert("limit check function");
	if($('#ordertoshipped_'+id).prop("checked"))
		{
	if(temp==null)
		{
		temp=orderfor;
		}
	else
		{
         if(temp==orderfor)
        	 {
        	 }
         if(temp!=orderfor)
        	 {
        	 $('#ordertoshipped_'+id).prop("checked",false);
        	$("#checkboxErrorId").html("<font class='red'>Could not ship for more than one person</font>");
        	 }
		
		}
		}
}



	
function dialoguebox(id)
{
	if(confirm("Are you sure you want to cancel this order ?")){
		$.ajax({
			type:"POST",
			url :"ajax/removeOrderlist",
			data :"id="+id,
			dataType: "json",
			success:function(response) {
				var myarray = response.split(',');
				if(response==="NO") {
					$("#productstatus_"+id).html("CANCELLED");
					/*$("#action_"+id).html("");*/
					document.getElementById("ordertoshipped_"+id).disabled = true;
					document.getElementById("remove_"+id).disabled = true;
					/*$("ordertoshipped_"+id).prop('disabled',true);*/
				} else if(myarray[0]==="YES")  {
					for(var i = 0; i < myarray.length; i++)
					{
						$("#orderstatus_"+myarray[i+1]).html("CANCELLED");
						$("#productstatus_"+myarray[i+1]).html("CANCELLED");
						/*$("#action_"+myarray[i+1]).html("");*/
						document.getElementById("ordertoshipped_"+myarray[i+1]).disabled = true;
						document.getElementById("remove_"+myarray[i+1]).disabled = true;
					}
				}
				
			},
			error : function(e) {
			}
			
		});
    }
    else{
    	$(this).dialog("close");
    }
	
	
//	$('#divId').appendTo('body')
//    .html('<div><h6>Are you sure to cancel the order ?</h6></div>')
//    .dialog({
//			width: 250,
//			height: 140,
//			title: 'Confirmation',
//			modal: true, 
//			zIndex: 10000, 
//			autoOpen: true,
//	        resizable: false,
//			buttons : {
//				"OK" : function () {	
//						$(this).dialog("close");
//						$.ajax({
//							type:"POST",
//							url :"/ajax/removeOrderlist",
//							data :"id="+id,
//							success:function(response) {
//								var myarray = response.split(',');
//								if(response==="NO") {
//									$("#productstatus_"+id).html("CANCELLED");
//									/*$("#action_"+id).html("");*/
//									document.getElementById("ordertoshipped_"+id).disabled = true;
//									document.getElementById("remove_"+id).disabled = true;
//									/*$("ordertoshipped_"+id).prop('disabled',true);*/
//								} else if(myarray[0]==="YES")  {
//									for(var i = 0; i < myarray.length; i++)
//									{
//										$("#orderstatus_"+myarray[i+1]).html("CANCELLED");
//										$("#productstatus_"+myarray[i+1]).html("CANCELLED");
//										/*$("#action_"+myarray[i+1]).html("");*/
//										document.getElementById("ordertoshipped_"+myarray[i+1]).disabled = true;
//										document.getElementById("remove_"+myarray[i+1]).disabled = true;
//									}
//								}
//								
//							},
//							error : function(e) {
//							}
//							
//						});
//					 
//					
//						
//					
//				},
//				
//			   "CANCEL" : function(){
//				   $(this).dialog("close");
//			   }
//			},
//			close: function (event, ui) {
//	            $(this).remove();
//	        }
//	   });
	
}
function validateship(id)

{
	if($('input[type=radio]:checked').length == 0)
		{
	
		$('#checkboxErrorId').html("<font class='red'>Select atleast one checkbox</font>")
		return false;
		}


}

$( function() {
	$("#label_Order_Number").autocomplete({  
			    source : function(request, response) {
		
			    	var poNumber= $('#label_Order_Number').val().trim();
			  	  $.ajax({
			            url : "ajax/autoOrderNumbernew",
			            type : "GET",
			            dataType: "json",
			            data :'poNumber='+poNumber+'&filter=orderreceived',
			           // data :'poNumber='+poNumber+'&select_onbehalf='+ +'&onbehalf_Account='+ +'&filter=orderreceived',
			         
			            success : function(data) {
			  
			            	if(data.length==0){
			            		
			            		
			            		$('#label_Order_Number').val('');
			            		$('#divID_Order_Number').addClass('has-error');
			            		$('#lab_orderNumber').hide();
			            		$('#label_Order_Number_errorId').show();
			            		$('#label_Order_Number_errorId').html("<font color='red'>No details found</font>");
			            		
			            		//$("input[type=submit]").attr("disabled", "disabled");
			            		}
	                    	else {
	                    			$("input[type=submit]").removeAttr("disabled", "disabled");
                    			
	                    			}
			            			
			          	  response($.map(data, function (item) {
			          	        return item.split(",");
			          	    })); 
			            }
			    });
			}
			});	
});

/*function OrderAutoSearch1(){

	var poNumber= $("#label_Order_Number").val();
	//alert(poNumber);
	$("#label_Order_Number").autocomplete({  
				
			    source : function(request, response) {
			    	
			  	  $.ajax({
			            url : "autoOrderNumber",
			            type : "GET",
			            data :'poNumber='+poNumber, 
			            success : function(data) {
			            	if(data.length==0)
			            		{
			            		
			            		$('#label_Order_Number').val('');
			            		$('#divID_Order_Number').addClass('has-error');
			            		$('#lab_orderNumber').hide();
			            		$('#label_Order_Number_errorId').show();
			            		$('#label_Order_Number_errorId').html("<p class='text-danger'>Please choose correct Order </p>");
	                    		//$("input[type=submit]").attr("disabled", "disabled");
	                    		
	                    		}
	                    	else {
	                    			$("input[type=submit]").removeAttr("disabled", "disabled");}
			          	  response($.map(data, function (item) {
			          	        return item.split(",");
			          	    })); 
			            }
			    });
			}
			});	
}*/

function validateOrderNumber()
{
	var orderNumber=$("#label_Order_Number").val();
	if(orderNumber.length==0)
	{
		$('#divID_Order_Number').addClass('has-error');
		/*$('#lab_orderNumber').hide();
		$('#label_Order_Number_errorId').show();
		$("#label_Order_Number_errorId").html("<p class='text-danger'>Kindly Provide An Order Number</p>");*/
		return false;
	}
	else
		{ 
		$('#shippingHistoryDivId').show();
		
		
		return true;
		}
}

function generateQRcode(ordernumber,invoiceno,orderdate,invoicedate,mainseriesfrom,mainseriesto,productname,mvname,productcode,mvcode,qty,packageId)
{
var invoicenumber=invoiceno;
var product=productname;
var masterversion=mvname;
$("#qrgenerateidString").empty();
	$.ajax({
		type:"POST",
		url :"ajax/generateQRcode",
		dataType: "json",
		data :'ordernumber='+ordernumber+'&invoicenumber='+invoicenumber+'&orderdate='+orderdate+'&invoicedate='+invoicedate+'&mainseriesfrom='+mainseriesfrom+'&mainseriesto='+mainseriesto+'&product='+product+'&masterversion='+masterversion+'&productCode='+productcode
	+'&mvcode='+mvcode+'&packageId='+packageId,
		success:function(response)
		{
			if(response!=null)
				{
				$('#invoiceId').html(invoicenumber);
				$('#productdecId').html(product);	
				$('#mastervId').html(masterversion);
				$('#ordernoId').html(ordernumber);
				$('#productcodeId').html(productcode);	
				$('#mseriesFromId').html(mainseriesfrom);
				$('#mseriesToId').html(mainseriesto);
				$('#BseriesFromId').html(product);	
				$('#BseriesToId').html(masterversion);
				$('#boxnumberId').html(invoicenumber);
				$('#boxquantity').html(qty);	
				$('#orderdateId').html(orderdate);
				$('#invopicedateId').html(invoicedate);
				$('#productdecId').html(product);
				$('#mastercodeId').html(mvcode)
				$('#qrgenerateid1').html("<img src='"+response.qrImageUrl+"'></img>");
				$('#qrgenerateid1').show();
				$("#qrgenerateidString").append(response.qrString);
				$('#qrgenerateid').show();
				 $('#qrgenerateid').dialog({
						width: 800,
						height: 600,
						title: 'QR Code Details',
						buttons : {
							"Print" : function ()
							{	
								var divToPrint=document.getElementById('qrgenerateid');
								  var newWin=window.open('','Print-Window');
								  newWin.document.open();
								  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');
								  newWin.document.close();
								  setTimeout(function(){newWin.close();},10);
							},
				   "CANCEL" : function(){
					   $(this).dialog("close");
				   }
						}
				   });
				
				}
			
		},
		error : function(e)
		{
		}

	});

}

function orderDetails(ordernumber){

	$("#tbody").html("");
	$.ajax({
		type:"POST",
		url :"ajax/viewOrderDetails",
		dataType: "json",
		data :'ordernumber='+ordernumber,
		success:function(response)
		{
			for(var i=0;i<response.length;i++){
				$('#template_details').append('<tr><td align="center">'+response[i].unitordered+'</td><td align="center">'+response[i].unitsReceived+'</td><td align="center">'+response[i].orderBy+'</td><td align="center">'+response[i].orderDoneFor+'</td><td align="center">'+response[i].statusType+'</td><td align="center">'+response[i].fromDate+'</td></tr>');

			}
			//$('#order1').html("<img src='"+response+"'></img>");
			$('#order1').show();
			$('#order').show();
			 $('#order').dialog({
				    
					width: 550,
					height: 300,
					title: 'Order Details',
					buttons : {
						/*"Print" : function ()
						{	
							
							var divToPrint=document.getElementById('order');
							  var newWin=window.open('','Print-Window');
							  newWin.document.open();
							  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');
							  newWin.document.close();
							  setTimeout(function(){newWin.close();},10);
							
						},*/
			   "CLOSE" : function(){
				   $(this).dialog("close");
			   }
					}
			   });
		},
		error : function(e)
		{
			
		}

	});
}

$(document).ready(
		function(){
			loadListener();
		}

		);


var loadListener = function(){
	
	$('#selectAll').change(selectAll);
	$(".cbx").change(changeSelected);
	$("#generateQrForAll").click(generateQrForAll);
	$(".alreadyShippedId").click(alertBox);
} 


var changeSelected = function(){
	var checkBoxStatus = false;
/*if($('#selectAll').prop('checked')&&$(this).is(':checked')==false){
	$('#selectAll').prop('checked',false)
	
}*/

	
	var arr  = [];
	arr =  $('.cbx');

	for(var i=0;i<arr.length;i++){
	//alert((arr[i].checked==true));
	if (arr[i].checked === true) {
    	checkBoxStatus = true;
    }
    else{
    	checkBoxStatus = false;
    	break;
    }
	}
	
if(checkBoxStatus){
	$('#selectAll').prop('checked',true)
}else{
	$('#selectAll').prop('checked',false)
	}
}

var selectAll = function () {
	if($(this).is(':checked')){
		$(".cbx").prop('checked', true);
	}else{
		$(".cbx").prop('checked',false);
	}
	
}


var generateQrCodeForAll = function(){
	var  dataArray = [];
	var arr  = [];
	arr =  $('.cbx');

	var index = 0;
	for(var i=0;i<arr.length;i++){
	//alert((arr[i].checked==true));
	if (arr[i].checked === true) {
    	//checkBoxStatus = true;
		dataArray[index]=arr[i].value;
		index++;
    }
	}
	if(dataArray.length>0){

		var requestObj = {};
		requestObj.dataObjList = dataArray;
		$.ajax({
			type:"POST",
			url :"ajax/generate-qr-code",
			 contentType: "application/json",
			data :JSON.stringify(requestObj),
			
			success:function(response)
			{
				var arr=[];
				arr = response.responseObj;

				for(var i=0;i<arr.length;i++){
					//$('#template_details').append('<tr><td align="center">'+response[i].unitordered+'</td><td align="center">'+response[i].unitsReceived+'</td><td align="center">'+response[i].orderBy+'</td><td align="center">'+response[i].orderDoneFor+'</td><td align="center">'+response[i].statusType+'</td><td align="center">'+response[i].fromDate+'</td></tr>');
					
					var cbArr  = [];
					cbArr =  $('.cbx');

					var index = 0;
					for(var j=0;j<cbArr.length;j++){
					//alert((arr[i].checked==true));
					if (cbArr[j].checked === true && arr[i].qrString==cbArr[j].value ) {
						//$(cbArr[j].parentElement.parentElement.lastElementChild.children).removeAttr("src")
						$(cbArr[j].parentElement.parentElement.lastElementChild.children).attr("src",arr[i].url);
				    }
					}

				}
			},
			error:function(e){
			alert(JSON.stringify(e)+":::error occured.");	
			}
			});
		
	}
}

var generateQrForAll = function(){
	var  dataArray = [];
	var arr  = [];
	arr =  $('.cbx');

	var index = 0;
	for(var i=0;i<arr.length;i++){
	//alert((arr[i].checked==true));
	if (arr[i].checked === true) {
    	//checkBoxStatus = true;
		dataArray[index]=arr[i].value;
		index++;
    }
	}
	if(dataArray.length>0){

		var requestObj = {};
		requestObj.dataObjList = dataArray;
		$.ajax({
			type:"POST",
			url :"ajax/generate-download-qr-code",
			 contentType: "application/json",
			data :JSON.stringify(requestObj),
			
			success:function(response)
			{
				var arr=[];
				arr = response.responseObj;

				for(var i=0;i<arr.length;i++){
					//$('#template_details').append('<tr><td align="center">'+response[i].unitordered+'</td><td align="center">'+response[i].unitsReceived+'</td><td align="center">'+response[i].orderBy+'</td><td align="center">'+response[i].orderDoneFor+'</td><td align="center">'+response[i].statusType+'</td><td align="center">'+response[i].fromDate+'</td></tr>');
					
					var cbArr  = [];
					cbArr =  $('.cbx');

					 newSrc =$(this).attr("href");
					  $("#modal1").append("<iframe src='http://localhost:8081/shipping/Test.pdf'></iframe>");
					
					var index = 0;
					for(var j=0;j<cbArr.length;j++){
					//alert((arr[i].checked==true));
					if (cbArr[j].checked === true && arr[i].qrString==cbArr[j].value ) {
						//$(cbArr[j].parentElement.parentElement.lastElementChild.children).removeAttr("src")
						$(cbArr[j].parentElement.parentElement.lastElementChild.children).attr("src",arr[i].url);
				    }
					}

				}
			},
			error:function(e){
			alert(JSON.stringify(e)+":::error occured.");	
			}
			});
		
	}
	
	
}


$(document).ready(loadListener);



var alertBox = function(){
	
	 $( "#dialog" ).dialog();
	//$("#alertModal").modal();
}
