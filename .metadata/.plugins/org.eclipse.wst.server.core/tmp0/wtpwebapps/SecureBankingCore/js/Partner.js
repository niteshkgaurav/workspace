$(document).ready(function() {
	
    $('#providerCodeTableId').DataTable( {
        "scrollY":        "400px",
        "scrollCollapse": true,
        "paging":         true, 
        "pagingType": "simple_numbers"
    } );
    $('#fspprovidercodeTableId').DataTable( {
        "scrollY":        "400px",
        "scrollCollapse": true,
        "paging":         true, 
        "pagingType": "simple_numbers"
    } );
} );

function getFspAndOtherServices(financial,fsp,other){
	financial=financial.replace("[", '').replace("]",'').replace(/ +/g, "").trim();
	fsp=fsp.replace("[", '').replace("]",'').replace(/ +/g, "").trim();
	other=other.replace("[", '').replace("]",'').replace(/ +/g, "").trim();
	var financialArr=financial.split(",");
	var fspArr=fsp.split(",");
	var otherArr=other.split(",");
	$.ajax({
		type:"POST",
		dataType:"json",
		data:"financialList="+financialArr,
		url : "/securebanking/AdminUI/partner/ajax/fundTransferServices",
		success:function(response)
		{
			var content = '';
			var otherContent='';
			if($('#bankServiceval').val().length>0){
				$('#finButton').prop('disabled', false);
				  $('#otherButton').prop('disabled', false);
				 $('#fspButton').prop('disabled', false);
			}
			  for (var i = 0; i < response.length; i++) {
			if(response[i].type=='BANKING' ||  response[i].type==null){
				var isBank=response[i].isBankIncluded;
				var desctype=response[i].descType;
				var fspVal="FSP_Fund_Transfer_Services_Bank_List";
				var otherVal="Other_Services_Bank_List";
				if(fspArr.includes(response[i].id.toString())){
				content+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\'' + fspVal+ '\','+isBank+',\'' +desctype+'\');emptyerrorId(event,\'fspregisterErrorId\'\); name="fspotherServices" value="'+response[i].id+'" checked/></td><td align="left" width="40%">';
				}else{
				content+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\'' + fspVal+ '\','+isBank+',\'' +desctype+'\');emptyerrorId(event,\'fspregisterErrorId\'\); name="fspotherServices" value="'+response[i].id+'"/></td><td align="left" width="40%">';	
				}
				content+=response[i].desc+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>'+response[i].descType+'</td><td></td></tr>';
			    
			}
			if(response[i].type=='OTHER'){
				if(otherArr.includes(response[i].id.toString())){
				otherContent+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\''+otherVal+'\','+isBank+',\''+desctype+'\');emptyerrorId(event,\'otherServiceErrorId\'\); name="otherServices" value="'+response[i].id+'" checked/></td><td align="left" width="40%">'
				}else{
				otherContent+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\''+otherVal+'\','+isBank+',\''+desctype+'\');emptyerrorId(event,\'otherServiceErrorId\'\); name="otherServices" value="'+response[i].id+'"/></td><td align="left" width="40%">'	
				}
				otherContent+=response[i].desc+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>'+response[i].descType+'</td><td></td></tr>';
			}
		
			  }
			  if ( $.fn.DataTable.isDataTable( '#table_id' ) ) {
				   $("#table_id").dataTable().fnDestroy()
			  }
			  if ( $.fn.DataTable.isDataTable( '#table_id1' ) ) {
				   $("#table_id1").dataTable().fnDestroy()
			  }
			  $('#table_id tbody').html(content); 	
			  $('#table_id1 tbody').html(otherContent); 	 
			  refreshTable();
			 
		}
	});	
}

function checkAllBoxes(val,tableId){
	 var dataTable = $('#'+tableId).DataTable();
	  var rows = dataTable.rows({ 'search': 'applied' }).nodes();
	if($('#'+val.id).prop('checked')){
	      $(rows).each(function(){
	    	  var script = $('input[type="checkbox"]', this).attr("onclick");
	    	  script= script.split(';')[0];
	    	  var method=script.split("(");
	    	  var params=method[1].replace(")", '').replace(/"/g, '').replace(/'/g, '').split(",");
	    	if(!$('input[type="checkbox"]', this).prop('checked')){
	    	     $('input[type="checkbox"]', this).prop('checked', true);	
	    	     var fn = window[method[0]];
	    	     fn.apply(null, params);
	    	}  
	      });
	  }else{ 
		    $(rows).each(function(){
		    	  var script = $('input[type="checkbox"]', this).attr("onclick");
		    	  script= script.split(';')[0];
		    	  var method=script.split("(");
		    	  var params=method[1].replace(")", '').replace(/"/g, '').replace(/'/g, '').split(",");
		    	if($('input[type="checkbox"]', this).prop('checked')){
		    	     $('input[type="checkbox"]', this).prop('checked', false);	
		    	     var fn = window[method[0]];
		    	     fn.apply(null, params);
		    	}  
		      });
}
}
function emptyerrorId(event,errorid){
	$("#"+errorid).html('');
}
function validateFinancialInstrument(event){
var check=true;
var finName=$('#instrumentId').val().trim();
if(finName.length==0){
	$('#instrumentDivId').addClass('has-error');
	check=false;
}

var startDate=$('#lab_start_date').val().trim();
if(startDate.length==0){
	$('#div_fromDate').addClass('has-error');
	check=false;
}
	
var endDate=$('#lab_end_date').val().trim();
if(endDate.length==0){
	$('#div_toDate').addClass('has-error');
	check=false;
}

if(endDate.length != 0 && startDate.length != 0){
if(Date.parse(endDate)<Date.parse(startDate)){
	$('#div_toDate').addClass("has-error");
	$('#lab_end_date').val('');
	$('#label_toDate').hide();
	$('#lab_end_date_ErrorId').show();
	$('#lab_end_date_ErrorId').html('<font color="red" size="2">To Date Should Be Greater Than From Date</font>');
	check = false;
}
var toDate = new Date();
toDate.setHours(0,0,0,0);
   if (Date.parse(startDate)< Date.parse(toDate)) {
   	$('#div_fromDate').addClass("has-error");
   	$('#lab_start_date').val('');
		$('#label_fromDate').hide();
		$('#lab_start_date_ErrorId').show();
		$('#lab_start_date_ErrorId').html('<font color="red" size="2">From Date should be greater than or equal to current date</font>');
		check = false;
   }
}

if(!check){
	event.preventDefault();
	return false;
}else{
	return true;
}
	
}
function refresh(successMessageId){
	$('#'+successMessageId).html('');
}

function checkDuplicate()
{
	
	var  finId=$("#finId").val();
	
	var finName= $("#instrumentId").val().trim();
	
	if(finName.length>0){
	$.ajax({
		url: 'ajax/checkDuplicateName',
		type:'POST',
		data:'financialInstrumentName='+finName+'&id='+finId,
		success:function(response)
		{
			
			if(response==0)
			{
				  $('#lab_instrumentname_ErrorId').show();
			      $('#lab_instrumentname').hide();
			     $('#lab_instrumentname_ErrorId').html("<font color='red'>Name Already Exist</font>");

			     $("#instrumentId").val('');
				
			}
			if(response==1)
			{
				
				
				 $('#lab_instrumentname_ErrorId').addClass("valid");
			     $('#lab_instrumentname_ErrorId').show();
			     
			      $('#lab_instrumentname').hide();
			     $('#lab_instrumentname_ErrorId').html("<font color='green'>Name available.</font>");
			}
		}
	});
	
	
	}
}
var fundtransfercount =0;
var otherCount = 0;
var fspCount = 0;
var riCount = 0;
var finInstCount =0;
var fspfinInstCount =0;
function incInstrumentCount(id,name,instName)
{
	$("#lab_financialInstrumentErrorId").html('');
	$("#fspregisterErrorId").html('');
	$("#otherServiceErrorId").html('');
	if($('#'+id).prop('checked'))
	{
		if(name==='Financial Instrument Bank List')
		{
			if(instName==='BANK')
			{
				$('#finButton').prop('disabled', false);
				$('#lab_financialInstrumentErrorId').html("");
				finInstCount++;	
			}
		}
		if(name==='FSP Fund Transfer Services Bank List')
		{
			if(instName==='BANK')
			{
				$('#lab_fspFinancialInstrumentErrorId').html("");
				fspfinInstCount++;	
			}
		}
		var finId= id.replace( /[^\d]/g, '' );
		$.ajax({
			type:"POST",
			dataType:"json",
			data:"financialIstID="+finId,
			url : "/securebanking/AdminUI/partner/ajax/fundTransferList",
			success:function(response)
			{
				var content = '';
				var otherContent='';
				  for (var i = 0; i < response.length; i++) {
				if(response[i].type=='BANKING' ||  response[i].type==null){
					var isBank=response[i].isBankIncluded;
					var desctype=response[i].descType;
					var fspVal="FSP_Fund_Transfer_Services_Bank_List";
					var otherVal="Other_Services_Bank_List";
					content+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\'' + fspVal+ '\','+isBank+',\'' +desctype+'\');emptyerrorId(event,\'fspregisterErrorId\'\); name="fspotherServices" value="'+response[i].id+'"/></td><td  align="left" width="40%">'
					+response[i].desc+'</td><td>'+response[i].descType+'</td><td></td></tr>';
				}
				if(response[i].type=='OTHER'){
					otherContent+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\''+otherVal+'\','+isBank+',\''+desctype+'\');emptyerrorId(event,\'otherServiceErrorId\'\); name="otherServices" value="'+response[i].id+'"/></td><td align="left" width="40%">'
					+response[i].desc+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>'+response[i].descType+'</td><td></td></tr>';
				}
				  }
					if ($("#table_id").DataTable() instanceof $.fn.dataTable.Api) {
						 $('#table_id').dataTable().fnDestroy();
						 }
					  if ( $('#table_id1').DataTable() instanceof $.fn.dataTable.Api) {
						  $('#table_id1').dataTable().fnDestroy();
					  }
				  $('#table_id tbody').append(content); 	
				  $('#table_id1 tbody').append(otherContent); 	 
				  refreshTable();
				 
			}
		});
	}
	else
	{
		var checkedId=[];
		var checkedFin=[];
		var checkedOther=[];
		 $("input:checkbox[name=financialInstrument]:checked").each(function () {
			 checkedId.push($(this).val());
	        });
		 $("input:checkbox[name=fspotherServices]:checked").each(function () {
			 checkedFin.push($(this).val());
	        });
		 $("input:checkbox[name=otherServices]:checked").each(function () {
			 checkedOther.push($(this).val());
	        });
		if(name==='Financial Instrument Bank List')
		{
			if(instName==='BANK')
			{
				  $('#finButton').prop('disabled', true);
				  $('#otherButton').prop('disabled', true);
				 $('#fspButton').prop('disabled', true);
				 $('#bankServiceval').val('');
				 $('#fspFundTransferServiceval').val('');
				 $('#otherServiceval').val('');
				finInstCount--;	
			}
		}
		if(name==='FSP Fund Transfer Services Bank List')
		{
			if(instName==='BANK')
			{
				fspfinInstCount--;	
			}
		}
		
		if(checkedId.length>0){
		$.ajax({
			type:"POST",
			dataType:"json",
			data:"financialList="+checkedId,
			url : "/securebanking/AdminUI/partner/ajax/fundTransferServices",
			success:function(response)
			{
				var content = '';
				var otherContent='';
				  for (var i = 0; i < response.length; i++) {
				if(response[i].type=='BANKING' ||  response[i].type==null){
					var isBank=response[i].isBankIncluded;
					var desctype=response[i].descType;
					var fspVal="FSP_Fund_Transfer_Services_Bank_List";
					var otherVal="Other_Services_Bank_List";
					if(checkedFin.includes(response[i].id.toString())){
						content+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\'' + fspVal+ '\','+isBank+',\'' +desctype+'\');emptyerrorId(event,\'fspregisterErrorId\'\); name="fspotherServices" value="'+response[i].id+'" checked/></td><td>'	
					}else{
						content+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\'' + fspVal+ '\','+isBank+',\'' +desctype+'\');emptyerrorId(event,\'fspregisterErrorId\'\); name="fspotherServices" value="'+response[i].id+'"/></td><td>'
					}
					content+= response[i].desc+'</td><td>'+response[i].descType+'</td><td></td></tr>';
				}
				if(response[i].type=='OTHER'){
					if(checkedOther.includes(response[i].id.toString())){
						otherContent+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\''+otherVal+'\','+isBank+',\''+desctype+'\');emptyerrorId(event,\'otherServiceErrorId\'\); name="otherServices" value="'+response[i].id+'" checked/></td><td>'
					}else{
						otherContent+='<tr><td><input type=checkbox id=fundTransfer'+response[i].id+' onclick=incCount("fundTransfer'+response[i].id+'",\''+otherVal+'\','+isBank+',\''+desctype+'\');emptyerrorId(event,\'otherServiceErrorId\'\); name="otherServices" value="'+response[i].id+'"/></td><td>'	
					}
					otherContent+=response[i].desc+'</td><td>'+response[i].descType+'</td><td></td></tr>';
				}
				  }
				  if ($("#table_id").DataTable() instanceof $.fn.dataTable.Api) {
						 $('#table_id').dataTable().fnDestroy();
						 }
					  if ( $('#table_id1').DataTable() instanceof $.fn.dataTable.Api) {
						  $('#table_id1').dataTable().fnDestroy();
					  }
				  $('#table_id tbody').html(content); 	
				  $('#table_id1 tbody').html(otherContent); 
				
				  refreshTable();
				 
			}
		});	
		}else{
				$('#fundtransfer').hide();
			$('#otherServices').hide();
			 var table = $('#table_id').DataTable();
			 var tableOther = $('#table_id1').DataTable();
			 table.clear();
			 tableOther.clear();
		}
	}
}

function refreshTable(){

	  $('#fundtransfer').show();
	  $('#otherServices').show();
		 $('#table_id').DataTable( {
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers",
		        "aoColumnDefs": [{"sTitle": "<input type='checkbox' id='selectAll' value='0' onclick=checkAllBoxes(this,'table_id');emptyerrorId(event,'fspregisterErrorId')></input>","aTargets": [ 0 ],"orderable": false}]
		    } );
		 $('#table_id1').DataTable( {
		        "scrollY":        "400px",
		        "scrollCollapse": true,
		        "paging":         true,
		        "pagingType": "simple_numbers",
		        "aoColumnDefs": [{"sTitle": "<input type='checkbox' id='selectAll1' value='0' onclick=checkAllBoxes(this,'table_id1');emptyerrorId(event,'otherServiceErrorId')></input>","aTargets": [ 0 ],"orderable": false}]
		    } );
}
function incCount(id,name,isBankIncluded,descType)
{
	name=name.replace(/_/g, " ")
	
			if($('#'+id).prop('checked'))
			{
				if(name==='Other Services Bank List')
				{
					$('#otherServiceErrorId').html("");
					otherCount++;
				}
				else if(name==='FSP Fund Transfer Services Bank List')
				{
					$('#fspbankErrorId').html("");
					fspCount++;
				}
				else if(name==='RI FSP Fund Transfer Services Bank List')
				{
					$('#fspribankErrorId').html("");
					riCount++;
				}
			}
			else
			{
				if(name==='Other Services Bank List')
				{
					otherCount--;
				}
				else if(name==='FSP Fund Transfer Services Bank List')
				{
					fspCount--;
				}
				else if(name==='RI FSP Fund Transfer Services Bank List')
				{
					riCount--;
				}
			}
		
	
	
}

function storeBankVals(serviceval,errorId)
{
	var i=0;
	var flag = true;
	var selectedBankServiceval = [];
	$('#bankTableId :checkbox:checked').each(function(){
		if($(this).val()!=0)
	      selectedBankServiceval[i++] = $(this).val();
	     });
	$('#'+serviceval).val(selectedBankServiceval);
	if(selectedBankServiceval.length==0)
	{
		$('#bankPopUpErrorId').html("<p class='text-danger'>Kindly Select atleast one Bank !!</p>");
  	 flag = false;
	}
	else
	{
		flag = true;
		$('#'+errorId).html('');
	}
	return flag;
}

function checkSelectedBanks(vals,custName,len,name)
{
	var otherServic;
	if(vals.length>0)
	{
		otherServic = vals.split(",");
		if(otherServic.length==(len))
			$("#checkAll").prop('checked',true);
		for(var j = 0;j<otherServic.length;j++)
		{
			$('#bank'+custName+otherServic[j]).prop('checked','checked');
		}
	}
	
}

function openBank(name,divId,errorId)
{
	var i=0;
	var service='';
	var bankVal;
	var bankArray;
	var custName = name.replace(/\s/g, '');
	$('#bankTableId').html('<tr><td align="center" width="10%"><input type="checkbox" id="checkAll" value="0" onclick="toCheckAll();emptyerrorId(event,\'' + errorId+ '\');" /></td><td width="90%" align="left"><b>Check All</p></td></tr>');
	$.ajax({
		type:"POST",
		url : "ajax/bankList",
		dataType: "json",
		success:function(response)
		{
			if(name==='Financial Instrument Bank List')
			{
				for(i=0;i<response.length;i++)
				{
					$('#bankTableId').append('<tr><td width="10%" align="center"><input type="checkbox" id="bank'+custName+response[i].id+'" name="bank" value="'+response[i].id+'" onclick="emptyerrorId(event,\'' + errorId+ '\');"></td><td width="90%" align="left">'+response[i].name+'</td>');
				}
				checkSelectedBanks($('#bankServiceval').val(),custName,i,name);
			}
			if(name==='Other Services Bank List')
		    {
				 bankVal=$('#bankServiceval').val();
				 bankArray=bankVal.split(",");
				for(i=0;i<response.length;i++)
				{
					if(bankArray.includes(response[i].id.toString())){
					$('#bankTableId').append('<tr><td width="10%" align="center"><input type="checkbox" id="bank'+custName+response[i].id+'" name="bank" value="'+response[i].id+'" onclick="emptyerrorId(event,\'' + errorId+ '\');"></td><td width="90%" align="left">'+response[i].name+'</td>');
					}
					}
				
				checkSelectedBanks($('#otherServiceval').val(),custName,i,name);
		    }
			else if(name==='FSP Fund Transfer Services Bank List')
			{
				 bankVal=$('#bankServiceval').val();
				 bankArray=bankVal.split(",");
				for(i=0;i<response.length;i++)
				{
					if(bankArray.includes(response[i].id.toString())){
					$('#bankTableId').append('<tr><td width="10%" align="center"><input type="checkbox" id="bank'+custName+response[i].id+'" name="bank" value="'+response[i].id+'" onclick="emptyerrorId(event,\'' + errorId+ '\');"></td><td width="90%" align="left">'+response[i].name+'</td>');
					}
					}
				
				checkSelectedBanks($('#fspFundTransferServiceval').val(),custName,i,name);
			}
			else if(name==='RI FSP Fund Transfer Services Bank List')
			{
				checkSelectedBanks($('#riFspBankServiceval').val(),custName,i,name);
			}
			else if(name==='FSP Financial Instrument Bank List')
			{
				checkSelectedBanks($('#fspBankServiceval').val(),custName,i,name);
			}
			$('#bankTableId').append("<tr><td colspan='2' align='center'><div id='bankPopUpErrorId'></div></tr>");
		}
	});
	var flag = true;
/*	$('#'+divId).dialog({
        autoOpen: false,
        
        modal: true,
     });
	$('#'+divId).dialog( "open" );*/
	
	$('#'+divId).dialog({
		width: 410,
		height: 225,  
		modal: true,
		title: ''+name,  
		buttons : {
			"Submit" : function ()
			{
				  $('#otherButton').prop('disabled', false);
				  $('#fspButton').prop('disabled', false);
				if(name==='Financial Instrument Bank List')
				{
					service = 'bankServiceval';
					flag = storeBankVals(service,errorId);
				}
				if(name==='Other Services Bank List')
			    {
					service = 'otherServiceval';
					flag = storeBankVals(service,errorId);
			     }
				else if(name==='FSP Fund Transfer Services Bank List')
				{
					service = 'fspFundTransferServiceval';
					flag = storeBankVals(service,errorId);
				}
				else if(name==='RI FSP Fund Transfer Services Bank List')
			    {
					service = 'riFspBankServiceval';
					flag = storeBankVals(service,errorId);
			    }
				else if(name==='FSP Financial Instrument Bank List')
				{
					service = 'fspBankServiceval';
					flag = storeBankVals(service,errorId);
				}
				if(flag==true)
				{
					$(this).dialog("close");
					
				}
			},
			"Cancel":function()
			{
				$(this).dialog("close");
			}
	}
	});
	$('#'+divId).dialog( "open" );
}


function showWallet(partnerType)
{
	if($('#'+partnerType).val()==='WALLET')
	{
		$('#Div_walletTypeId').show();
	}
	else
	{
		$('#Div_walletTypeId').hide();
		$('#walletType').val('0');
		$('#branchCode').val('');
		$('#accountNumber').val('');
		$('#accountNumberId').hide();
		$('#branchCodeId').hide();
	}
}

function editLoad()
{
	var typeVal = $('#typeVal').val();
	var walletTypeVal = $('#walletTypeVal').val();
	var fspVal = $('#fspVal').val();
	var bankServiceval = $('#bankServiceval').val().split(",");
	var otherServiceval = $('#otherServiceval').val().split(",");
	var fspFundTransferServiceval = $('#fspFundTransferServiceval').val().split(",");
	var riFspBankServiceval = $('#riFspBankServiceval').val().split(",");
	var fspBankServiceval = $('#fspBankServiceval').val().split(",");
	var finName = 'Financial Instrument Bank List'.replace(/\s/g, '');
	var otherName = 'Other Services Bank List'.replace(/\s/g, '');
	var fspFundName = 'FSP Fund Transfer Services Bank List'.replace(/\s/g, '');
	var riFundName = 'RI FSP Fund Transfer Services Bank List'.replace(/\s/g, '');
	var fspName = 'FSP Financial Instrument Bank List'.replace(/\s/g, '');

	otherCount = $('#directBankCountVal').val();
	fspCount = $('#fspProviderBankCountVal').val();
	finInstCount = $('#directBankInstCountVal').val();
	fspfinInstCount = $('#fspProvBankInstCountVal').val();
	if(riFspBankServiceval.length>1){
		riCount++;
	}
	for(var i=0;i<bankServiceval.length;i++)
		$("#bank"+finName+bankServiceval[i]).prop('checked',true);
	for(var j=0;j<otherServiceval.length;j++)
		$("#bank"+otherName+otherServiceval[j]).prop('checked',true);
	for(var j=0;j<fspFundTransferServiceval.length;j++)
		$("#bank"+fspFundName+fspFundTransferServiceval[j]).prop('checked',true);
	for(var j=0;j<riFspBankServiceval.length;j++)
		$("#bank"+riFundName+riFspBankServiceval[j]).prop('checked',true);
	for(var j=0;j<fspBankServiceval.length;j++)
		$("#bank"+fspName+fspBankServiceval[j]).prop('checked',true);
	if(typeVal==='WALLET')
	{
		$('#Div_walletTypeId').show();
		if(walletTypeVal==='INTERNAL')
		{
			$('#branchCodeId').show();
			$('#accountNumberId').show();
		}
	}
	if(fspVal ==='1')
	{
		$('#fsp').prop('checked',true);
		$('#fspId').show();
	}
	if($('#rifspfinancialInstrument').prop('checked'))
	{
		$('#riFspProviderId').show();
	}
	
}

function confirmMappingNameValidity(mappingName)
{
	var mappingNameVal = $('#'+mappingName).val();
	if(mappingNameVal!=0)
	$.ajax({
		type:"POST",
		url:"ajax/mappingNameAlotingValidation",
		data:"mappingNameVal="+mappingNameVal,
		dataType: "json",
		success:function(response)
		{
			if(response>0)
			{
				$('#'+mappingName).val("0");
				$('#mappingNameId').hide();
				$('#lab_mappingNameErrorId').show();
				$('#lab_mappingNameErrorId').html("<p class='text-danger'>Already Present In Database!! kindly Select Other Mapping Name</p>");
			}
		}
	});
}




function showAccountDetails(walletType,branchCodeId,accountNumberId)
{
	if($('#'+walletType).val()=='INTERNAL')
	{
		$('#'+branchCodeId).show();
		$('#'+accountNumberId).show();
	}
	else
	{
		$('#'+branchCodeId).hide();
		$('#'+accountNumberId).hide();
	}
}

function toCheckAll()
{
	if($('#checkAll').prop('checked'))
	{
		$('#bankTableId :checkbox').each(function(){
		 $(this).prop('checked',true);
	     });
	}
	else
	{
		$('#bankTableId :checkbox').each(function(i){
			 $(this).prop('checked',false);
		     });
	}
}



function showProviderCode(providers,codeId,providerCodeId,errorCode)
{
	if($('#'+providers).prop('checked'))
	{
		$('#'+providerCodeId).prop('disabled',false);
		$('#'+providerCodeId).focus();
	}else
	{
		$('#'+providerCodeId).val('');
		$('#'+providerCodeId).prop('disabled',true);
		$('#'+errorCode).html("");
	}
}



function validatePartner(event)
{
	var companyName = $('#companyName').val();
	var partnerType = $('#partnerType').val();
	var walletType = $('#walletType').val();
	var nickName = $('#nickName').val().trim();
	var mappingName = $('#mappingName').val().trim();
	var branchCode = $('#branchCode').val().trim();
	var accountNumber = $('#accountNumber').val();
	var fspcatprovList = $('#fspcatprovlist').val().split(",");
	var provFlag = false;
	var status = true;
	$('#providerCodeTableId :text').each(function(){
		if($(this).val().trim().length===0)
		{
		  var id = $(this).attr('id');
		  if(!$('#'+id).attr('disabled'))
		  {
			  $('#'+id+'ErrorId').show();
			  $('#'+id+'Id').addClass("valid");
			
			  $('#'+id+'ErrorId').html("<p class='text-danger'>Third Party Code cannot be blank</p>");
			  status = false;
		  }
		}
     });
	$('#fspprovidercodeTableId :text').each(function(){
		if($(this).val().trim().length===0)
		{
			  var id = $(this).attr('id');
			  if(!$('#'+id).attr('disabled'))
			  {
				  $('#'+id+'ErrorId').show();
				  
				  $('#'+id+'Id').addClass("valid");
				    
				  
				  $('#'+id+'ErrorId').html("<p class='text-danger'>Third Party Code cannot be blank</p>");
				  status = false;
			  }
		}
	});
	for(var j=0;j<fspcatprovList.length;j++)
	{
		if($('#fspproviders_'+fspcatprovList[j]).prop('checked'))
		{
			provFlag = true;
		}
	}
if(finInstCount>0 && $('#bankServiceval').val().length==0){
	$('#lab_financialInstrumentErrorId').show();
	$('#lab_financialInstrumentErrorId').html("<p class='text-danger'>Kindly Select Atleast One Bank!!</p>");
	status = false;
}
	if(otherCount=='0')
	{
		$('#otherServiceErrorId').show();
		$('#otherServiceErrorId').html("<p class='text-danger'>Kindly Select Atleast One Banking Service!!</p>");
		status = false;
	}
	if(fspCount =='0')
	{
		$('#fspregisterErrorId').show();
		$('#fspregisterErrorId').html("<p class='text-danger'>Kindly Select Atleast One FSP Banking Service!!</p>");
		status = false;
	}
	
	if(otherCount>0 && $('#otherServiceval').val().length==0 && finInstCount>0){
		$('#otherServiceErrorId').show();
		$('#otherServiceErrorId').html("<p class='text-danger'>Kindly Select Atleast One Bank !!</p>");
		status = false;
	}
	if(fspCount>0 && $('#fspFundTransferServiceval').val().length==0 && finInstCount>0){
		$('#fspregisterErrorId').show();
		$('#fspregisterErrorId').html("<p class='text-danger'>Kindly Select Atleast One Bank !!</p>");
		status = false;
	}
	if(companyName.length==0)
	{
		$('#companyNameId').hide();
		$('#lab_partnerCompanyNameErrorId').show();
		$('#lab_partnerCompanyNameErrorId').html("<p class='text-danger'>Company Name cannot be Blank!! </p>");
		status= false;
	}
	if(partnerType=='0')
	{
		$('#partnerTypeId').hide();
		$('#lab_typeErrorId').show();
		$('#lab_typeErrorId').html("<p class='text-danger'>Kindly Select Partner Type!! </p>");
		status= false;
	}
	else
	{
		if(partnerType=='WALLET' && walletType=='0')
		{
			$('#walletTypeId').hide();
			$('#lab_walletTypeErrorId').show();
			$('#lab_walletTypeErrorId').html("<p class='text-danger'>Kindly Select Wallet Type!! </p>");
			status= false;
		}
		else if(walletType=='INTERNAL')
		{
			if(branchCode.length==0)
			{
				$('#branchCodeId').hide();
				$('#lab_branchCodeErrorId').show();
				$('#lab_branchCodeErrorId').html("<p class='text-danger'>Branch Code cannot be Blank!! </p>");
				status = false;
			}
			if(accountNumber.length==0)
			{
				$('#accountNumberId').hide();
				$('#lab_accountNumberErrorId').show();
				$('#lab_accountNumberErrorId').html("<p class='text-danger'>Account Number cannot be Blank!! </p>");
				status = false;
			}
		}
	}
	if(nickName.length == 0)
	{
		$('#nickNameId').hide();
		$('#lab_partnerNickNameErrorId').show();
		$('#lab_partnerNickNameErrorId').html("<p class='text-danger'>Nick Name Cannot be Blank!! </p>");
		status= false;
	}
	if(mappingName =='0')
	{
		$('#mappingNameId').hide();
		$('#lab_mappingNameErrorId').show();
		$('#lab_mappingNameErrorId').html("<p class='text-danger'>Kindly Select Mapping Name!! </p>");
		status= false;
	}
	
	
	
	if(!status)
	{
		event.preventDefault();
		return false;
	}
}