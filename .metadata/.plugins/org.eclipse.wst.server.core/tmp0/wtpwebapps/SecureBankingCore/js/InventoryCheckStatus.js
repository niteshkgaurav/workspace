

var table = undefined;
function onSelect()

{
	$('#DataErrorId').html('');
	$('#select_onbehalf').val('');
	$("#onbehalfTypeErrorId").html('');
	$("#onbehalfErrorId").html('');
	$("input[type=button]").removeAttr("disabled");
}

function selectInventory()
{
	
	$('#DataErrorId').html('');
	$('#info').hide();
	$("#template_details").load(location.href + " #template_details");
	$("#template_details").hide();
	$("input[type=button]").removeAttr("disabled");
var select=$("#InventoryFor").val();
if(select.length==0){
	$("#no_onbehalf1").hide();
	$("#no_onbehalf").hide();
}
if(select=='1')
	{
	$("#onbehalfTypeErrorId").html('');
	$("#onbehalfErrorId").html('');
	$("#no_onbehalf1").hide();
	$("#no_onbehalf").hide();
	//$("#onbehalf_Account").hide();
	$("#orderHistoryInfoDiv").hide();
	}
	if(select=='0')
		{
		$("#onbehalfTypeErrorId").html('');
		$("#onbehalfErrorId").html('');
		$('#onbehalf_Account').val('0');
		$('#select_onbehalf').val('');
		$("#orderHistoryInfoDiv").hide();
		$("#no_onbehalf1").show();
		$("#no_onbehalf").show();
		}

}
function nameSelectI()
{
	var tagName="";
	var select_type=$('#onbehalf_Account').val();
	$("#onbehalfErrorId").html('');
    $(function() {
            $("#select_onbehalf").autocomplete({  
            source : function(request, response) {
            	
            	if(select_type!='0')
            		{
            		tagName = $("#select_onbehalf").val();
            		}
          	  $.ajax({
                    url : "ajax/getTags",
                    type : "GET",
                    dataType: "json",
                    
                    //data :'tagName='+tagName+'&select_type='+select_type,
                    data :'tagName='+tagName+'&selectType='+select_type+'&filter=inventorycheckstatus', //Deepika
                    success : function(data) {
                    	if(data.length==0){
                    		$('#frmSearch').addClass('has-error');
                    		/*$('#label_select_onbehalf').hide();
                    		$('#onbehalfErrorId').show();
                    		$('#onbehalfErrorId').html("<font color='red'>Not a valid account name</font>");*/
                    		//$("input[type=button]").attr("disabled", "disabled");
                    		}
                    	else {
                    			$("input[type=button]").removeAttr("disabled", "disabled");
                    		}
                  	  response($.map(data, function (item) {
                  	         
                  	       return item.split(",");
                  	    })); 
                    },
                    error : function(ex) {
                    	console.log(JSON.stringify(ex));
                    }
            });
    }
 });
 });

}
	

var completeCheck = true;
function getInventoryDetails(event){
	

	
	var tmp=$('#InventoryFor').val();
	
	if(tmp=='1')
		{
	
	$.ajax({
		
		url : 'ajax/setinventoryCheck',
		type : "GET",
		dataType: "json",
		success : function(response) {
		//	alert("setinventoryCheck")
			var inventorycheck = response;											
			var tableHead = setInventoryCheckHeader();
		//	alert(tableHead);
			var tableData = setOrderHistoryRecord(inventorycheck);
			//alert(tableData);
			$("#orderHistoryInfoDiv").show();
			$('#orderInfoDiv').show();
			$('#orderHistoryInfoDiv thead').empty();
			$('#orderHistoryInfoDiv thead').append(tableHead);
			
			
			$('#orderHistoryInfoDiv tbody').empty();
			$('#orderHistoryInfoDiv tbody').append(tableData);
		
		}
	});
		}
	

	
	if(tmp=='0')
		{
		//alert('ssss');
		var sel=$('#onbehalf_Account').val();
		if(sel=='0')
			{
			$('#onbehlf').addClass('has-error');
			/*$("#label_onbehalf_Account").hide();
			$("#onbehalfTypeErrorId").show();
			$("#onbehalfTypeErrorId").html("<p class='text-danger'>Kindly select Onbehalf Account</p>");*/
			completeCheck =false;
			
			}
		
		var text_sel=$('#select_onbehalf').val();
		if(text_sel=='')
			{
			$('#frmSearch').addClass('has-error');
			/*$("#label_select_onbehalf").hide();
			$("#onbehalfErrorId").show();
			$("#onbehalfErrorId").html("<p class='text-danger'>Kindly select  Account</p>");*/
			
			completeCheck =false;
			
			}
		else
			{
			var   accountname  =$('#select_onbehalf').val();
	
			
			$.ajax({
				
				url : 'ajax/setinventoryCheck1',
				type : "GET",
				dataType: "json",
                 data :'accountname='+accountname,
				
				success : function(response) {
					//alert(response);
					var inventorycheck = response;
					var tableHead = setInventoryCheckHeader();
					var tableData = setOrderHistoryRecord(inventorycheck);
					$("#orderHistoryInfoDiv").show();
					$('#orderInfoDiv').show();
					$('#orderHistoryInfoDiv thead').empty();
					$('#orderHistoryInfoDiv thead').append(tableHead);
					
					$('#orderHistoryInfoDiv tbody').empty();
					$('#orderHistoryInfoDiv tbody').append(tableData);
				
				}
			});
			
			
			
			
			}
			
	
		}
	if(!completeCheck)
		{
		event.preventDefault();
		}
		
}

	function setInventoryCheckHeader() {
		
		var tableHead = "";
					
					

		tableHead = tableHead + "<tr>" + "	<th>Product</th>"
				 + "<th>Master Version</th>"
				+  "<th>Units</th>"
				+  "<th>No of Boxes</th>"
				+  "	<th>Box Type</th>"+
				 "</tr>";	
		return tableHead;
	}
	
	
	function setOrderHistoryRecord(inventorycheck) {
		
		var tableData = "";
		var tempOrderHistoryList=inventorycheck;
		if (inventorycheck.length != undefined) {
			if (inventorycheck.length > 0) {
				for (var i = 0; i < inventorycheck.length; i++) {
					tableData = tableData + "<tr>"
							+ "	<td style='margin-left:20px;'>"
							+ inventorycheck[i].productName + "</td>"
							+ "	<td style='margin-left:20px;'>"
							+ inventorycheck[i].mvName+ "</td>"
					        + "	<td style='margin-left:20px;'>"
					        + inventorycheck[i].availableStock+ "</td>"
					        + "	<td style='margin-left:20px;'>"
					        + inventorycheck[i].no_of_boxes+ "</td>"
					        + "	<td style='margin-left:20px;'>"
					        + inventorycheck[i].box_type_id+ "</td>";
					tableData = tableData + "</tr>";
							
							
				}
			}
	
	
		}
		return tableData;
	}
	
	
	function hideOnBehalf(){
		if(document.getElementById("info")!=null&&document.getElementById("info")!=undefined){
		document.getElementById("info").style.display=='none';
		}
		 $("#info").hide();
		var select=$("#InventoryFor").val();
		
		if(select==''){
		//$("#onbehalfTypeErrorId").html('');
		//$("#onbehalfErrorId").html('');
		$("#no_onbehalf1").hide();
		$("#no_onbehalf").hide();
		
		}
		
		
	
	}
	
	function getBoxDetails(){
		var check=true;
		$("#msgId").html('');
		var orderTypeVl=$('#InventoryFor').val();
		var onbehalf_Account=$('#onbehalf_Account').val();
		var select_onbehalf=$('#select_onbehalf').val();
		
		/*if(dob.length!=0)
		{	
			$("#label_lab_dob").addClass("valid");
			$("#label_securityQuestionId").addClass("valid");}*/
		
		if(orderTypeVl.length==0){
			
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			$("input[type=button]").removeAttr("disabled");
			$('#divID_InventoryFor').addClass('has-error');
			/*$('#label_InventoryFor').hide();
			$('#OrderForErrorId').show();
			$('#OrderForErrorId').html(	"<p class='text-danger'>Kindly select</p>");*/
			
		
			check=false;
		}
		if(orderTypeVl=="0"){
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			if(select_onbehalf.length==0 && onbehalf_Account==0){
				$("input[type=button]").removeAttr("disabled");
				$('#onbehlf').addClass('has-error');
				/*$('#label_onbehalf_Account').hide();
				$('#onbehalfTypeErrorId').show();
				$('#onbehalfTypeErrorId').html(	"<p class='text-danger'>Kindly select</p>");*/
				
				$('#frmSearch').addClass('has-error');
				/*$('#label_select_onbehalf').hide();
				$('#onbehalfErrorId').show();
				$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
					check=false;
				}
			if(select_onbehalf.length==0){
				$('#DataErrorId').show();
				$('#DataErrorId').html('');
				$("input[type=button]").removeAttr("disabled");
				$('#frmSearch').addClass('has-error');
				/*$('#label_select_onbehalf').hide();
				$('#onbehalfErrorId').show();
				$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
				check=false;
			}
			/*if(onbehalf_Account==0){
					
					$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly select.</p>");
					check=false;
				}*/
			}
		if(onbehalf_Account.length==0){
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			$("input[type=button]").removeAttr("disabled");
			$('#frmSearch').addClass('has-error');
			/*$('#label_select_onbehalf').hide();
			$('#onbehalfErrorId').show();
			$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
			check=false;
		}
		if(check==true){
		if(orderTypeVl=="1"){
			$("#info").show();
			var linkVal = $("input[name=linkViewOrder]:hidden").val()
		$.ajax({
			  url: 'ajax/getBoxDetail',
			  type: 'post',
			  dataType: 'json',
			  data: 'orderTypeVl='+orderTypeVl,
			 success: function(response){
				var valuess= response;
				if(valuess.length>0){
					$("#template_details").show();	
				}else{
					$("#template_details").hide();
					$('#DataErrorId').show();
					$('#DataErrorId').html(	"<font color='red'>No Data to display</font>");
					check=false;
				}
				for(var i=0;i<valuess.length;i++)
				{
					var pn=valuess[i].productName;
					var mv=valuess[i].mvName;
					$('#showData').append('<tr><td align="center">'+valuess[i].productName+'</td><td align="center">'+valuess[i].mvName+'</td><td align="center">'+valuess[i].cardName+'</td><td align="center">'+valuess[i].noOfProducts+'</td></tr>');
				}
				
				
			 },
			 error: function(e) {
				  }
			
		});
		}
		/*if(orderTypeVl=="0")
		{
			onbehalf();
		}*/
		}
	}
	
	function getBoxDetails1(){
		var check=true;
		$("#msgId").html('');
		var orderTypeVl=$('#InventoryFor').val();
		var onbehalf_Account=$('#onbehalf_Account').val();
		var select_onbehalf=$('#select_onbehalf').val();
		
		/*if(dob.length!=0)
		{	
			$("#label_lab_dob").addClass("valid");
			$("#label_securityQuestionId").addClass("valid");}*/
		
		if(orderTypeVl.length==0){
			
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			$("input[type=button]").removeAttr("disabled");
			$('#divID_InventoryFor').addClass('has-error');
			/*$('#label_InventoryFor').hide();
			$('#OrderForErrorId').show();
			$('#OrderForErrorId').html(	"<p class='text-danger'>Kindly select</p>");*/
			
		
			check=false;
		}
		if(orderTypeVl=="0"){
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			if(select_onbehalf.length==0 && onbehalf_Account==0){
				$("input[type=button]").removeAttr("disabled");
				$('#onbehlf').addClass('has-error');
				/*$('#label_onbehalf_Account').hide();
				$('#onbehalfTypeErrorId').show();
				$('#onbehalfTypeErrorId').html(	"<p class='text-danger'>Kindly select</p>");*/
				
				$('#frmSearch').addClass('has-error');
				/*$('#label_select_onbehalf').hide();
				$('#onbehalfErrorId').show();
				$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
					check=false;
				}
			if(select_onbehalf.length==0){
				$('#DataErrorId').show();
				$('#DataErrorId').html('');
				$("input[type=button]").removeAttr("disabled");
				$('#frmSearch').addClass('has-error');
				/*$('#label_select_onbehalf').hide();
				$('#onbehalfErrorId').show();
				$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
				check=false;
			}
			/*if(onbehalf_Account==0){
					
					$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly select.</p>");
					check=false;
				}*/
			}
		if(onbehalf_Account.length==0){
			$('#DataErrorId').show();
			$('#DataErrorId').html('');
			$("input[type=button]").removeAttr("disabled");
			$('#frmSearch').addClass('has-error');
			/*$('#label_select_onbehalf').hide();
			$('#onbehalfErrorId').show();
			$('#onbehalfErrorId').html(	"<p class='text-danger'>Kindly enter</p>");*/
			check=false;
		}
		if(check==true){
			
		if(orderTypeVl=="1"){
			if(undefined!=table){
			table.destroy();
			}
			$("#info").show();
			var linkVal = $("input[name=linkViewOrder]:hidden").val();
			table =  $('#template_details1').DataTable( {
				 
				    paging: true,	
		ajax:'ajax/getBoxDetailAjax?orderTypeVl='+orderTypeVl,
		columns: [
		            { "data": "productName" },
		            { "data": "mvName" },
		            { "data": "cardName" },
		            { "data": "noOfProducts" }
		        ]
		});
		}
		if(orderTypeVl=="0")
		{
			onbehalf();
		}
		}
	}
	
	
	function onbehalf(){
		var select_type=$('#onbehalf_Account').val();
		var tagName= $("#select_onbehalf").val();
		if(undefined!=table){
			table.destroy();
			}
			$("#info").show();
			var linkVal = $("input[name=linkViewOrder]:hidden").val();
			table =  $('#template_details1').DataTable( {
				 
				    paging: true,	
		ajax:'ajax/getBoxDetailOnBehalfAjax?tagName='+tagName,
		columns: [
		            { "data": "productName" },
		            { "data": "mvName" },
		            { "data": "cardName" },
		            { "data": "noOfProducts" }
		        ]
		});
		
		/*$('#DataErrorId').html('');
		$('#no_onbehalf1').show();
		$('#no_onbehalf').show();
		$("#template_details").show();	
		var linkVal = $("input[name=linkViewOrder]:hidden").val()
		var select_type=$('#onbehalf_Account').val();
		var tagName= $("#select_onbehalf").val();
		
		$.ajax({
			  url: 'ajax/getBoxDetailOnBehalf',
			  type: 'post',
			  dataType: 'json',
			  data: 'tagName='+tagName,
			 success: function(response){
				
				var valuess= response;
				if(valuess.length>0){
					$("#template_details").show();	
				}else{
					$("#template_details").hide();
					$('#DataErrorId').show();
					$('#DataErrorId').html(	"<font color='red'>No Data to display.</font>");
					check=false;
				}
				$("#info").show();
				for(var i=0;i<valuess.length;i++)
				{
					$('#template_details').append('<tr><td align="center">'+valuess[i].productName+'</td><td align="center">'+valuess[i].mvName+'</td><td align="center">'+valuess[i].cardName+'</td><td align="center">'+valuess[i].noOfProducts+'</td></tr>');
				}
				
			 },
			 error: function(e) {
				
				  }
			
		});
		$('#template_details').show();*/
		
	}

	function boxDetailshowLink1(){
		
		//alert(pn)
		var boxDetailshowLink=$("input[name=linkViewOrder]:hidden").val();
		//alert('hi '+boxDetailshowLink);
		//alert(linkViewOrder);
		boxDetailshowLink=boxDetailshowLink+"/AdminUI/inventoryMgmtController/getBoxDetailsInventory";
		//alert('hi '+boxDetailshowLink);
		a = document.getElementById('boxDetailshowLink');
		//alert(a+"   :   a")
		a.setAttribute("href",boxDetailshowLink);
		
		
		
	}
