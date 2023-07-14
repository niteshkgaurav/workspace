var valuess=null;

$(document).ready(function() {
	$('#table_id').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "bInfo": false
    } );
	$('#table_id1').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "bInfo": false
    } );
	 $('#table_id2').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "bInfo": false
    } );
	  $('#table_id3').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "bInfo": false
    } );
} );

//========= function to get stk menu link ================
function getWalletByHost(hostId,errorId,selectedWalletId){
	var hostVal=$("#"+hostId).val();
	if(hostVal.length>0){
		$.ajax({
			url: 'ajax/getWalletByHostId',
			type: 'GET',
			dataType: "json",
			data: 'hostId='+encodeURIComponent(hostVal),
			success: function(response) {
				$("#walletTr").show(); 
				var select=$("#lab_walletType");
				select.find('option').remove();
				var walletMap=response;
				$.each(walletMap,function(key,value){
					console.log("key :"+key +"value :"+value);
					$('<option>').val(key).text(value).appendTo(select);
				})
				if(selectedWalletId!=''){
					$("#lab_walletType  option[value='"+selectedWalletId+"']").attr('selected','selected');
				}
			},
			error: function(e) {
				console.log(e.message);
			}
		});
	}
}

function getSTKMenuLink(){
	var hostId=$("#lable_HostName").val();
	if(hostId.length>0){
		//========== ajax call ==============
		$.ajax({
		});
	}
	else{
		$("#step1Tr").hide();
		$("#serviceTableId").hide();
		$("#step2Tr").hide();
		$("#paymentPartnerTableId").hide();
		$("#step3Tr").hide();
		$("#partnerCashInService").hide();
		$("#partnerCashOutService").hide();
		$("#cashInTableMenuServiceId").html('');
		$("#cashOutTableMenuServiceId").html('');
		$("#CashInTable").hide();
		$("#CashOutTable").hide();
	}
}

//Written by moin for show  mapped payment partner with host 
function generateTable(tableId,jsonData,serviceName){
	var table=document.getElementById(tableId);
	var numrows=table.rows.length; 
	while(numrows>0)
		table.deleteRow(--numrows);
	var len=jsonData.length;
	if(len=='0')
	{
		var html='<tr><td><b><span style="color: red">'+serviceName+'</span></b></td></tr>';
		$(html).appendTo($("#"+tableId));
	}
	else{
		var html='<tr style="color: black;" bgcolor="#1682ba">'+
		'<th><span>Selection</span></th>'+
		'<th><span>Host Partner Name</span></th>'+
		'<th><span>Service Name</span></th>'+
		'<th><span>Service Description</span></th>'+
		'<th><span>Service Version No</span></th>'+
		'<th><span>Creation Date</span></th>'+
		'</tr>';
		$(html).appendTo($("#"+tableId));
		for(var i=0;i<jsonData.length;i++){
			var serviceId=jsonData[i].serviceId;
			var companyName=jsonData[i].companyName;
			var stkMenu=jsonData[i].stkMenu;
			var description=jsonData[i].description;
			var version=jsonData[i].version;
			var creationDate=jsonData[i].creationDate;
			var html='<tr height="30">'+
			'<td align="center"><input type="checkbox" id="" name="stkMenuLinkscheckBoxName" value="'+serviceId+'"/></td>'+
			'<td align="center">'+companyName+'</td>'+
			'<td align="center">'+stkMenu+'</td>'+
			'<td align="center">'+description+'</td>'+
			'<td align="center">'+version+'</td>'+
			'<td align="center">'+creationDate+'</td>'+
			'</tr';
			$(html).appendTo($("#"+tableId));
		}
	}
}

//Written by moin for show  mapped payment partner with host
function genrateMappedPaymentPartnerTable(tableId,mappedPaymentPartnerjsonData,message){
	var table=document.getElementById(tableId);
	var numrows=table.rows.length; 
	while(numrows>0)
		table.deleteRow(--numrows);
	var len=mappedPaymentPartnerjsonData.length;
	if(len=='0'){
		var html='<tr><td><b><span style="color: red">'+message+'</span></b></td></tr>';
		$(html).appendTo($("#"+tableId));
	}
	else{
		var html='<tr style="color: black;" bgcolor="#1682ba">'+
		'<th><span>Selection</span></th>'+
		'<th><span>Payment Partner</span></th>'+
		'<th><span>Priority</span></th>'+
		'</tr>';
		$(html).appendTo($("#"+tableId));
		for(var i=0;i<mappedPaymentPartnerjsonData.length;i++){
			var hostPaymentPartnerId=mappedPaymentPartnerjsonData[i].id;
			var paymentPartnerName=mappedPaymentPartnerjsonData[i].paymentPartnerName;
			var priority=mappedPaymentPartnerjsonData[i].priority;
			var html='<tr height="30">'+
			'<td align="center"><input type="checkbox" id="" name="paymentPartnercheckBoxName" value="'+hostPaymentPartnerId+'"  onclick="return getStkServicesBySelectedPaymentPartner();"/></td>'+
			'<td align="center">'+paymentPartnerName+'</td>'+
			'<td align="center">'+priority+'</td>'+
			'</tr';
			$(html).appendTo($("#"+tableId));
		}
	}
}

function getStkServicesBySelectedPaymentPartner(){
	var hostId=$("#lable_HostName").val();
	var allSelectedPaymentPartner = [];
	$('#paymentPartnerTableId input:checkbox:checked').each(function () {
		allSelectedPaymentPartner.push($(this).val());
	});
	var cashInTableId="cashInTableMenuServiceId";
	var cashOutTableId="cashOutTableMenuServiceId";

	if(allSelectedPaymentPartner.length>0)
	{ 
		$.ajax({
			url: 'ajax/getChildStkMenuServiceByParentServiceId',
			type: 'POST',
			dataType: "json",
			data: {
				'partnercheckBoxName': allSelectedPaymentPartner,
				'serviceMenuId' : 0,
				'hostId' : hostId
			},
			success: function(response) {
				var jsonObj=JSON.parse(response);
				var stkMenuServiceList=jsonObj.stkMenuServiceList;
				var cashOutstkMenuServiceList=jsonObj.cashOutstkMenuServiceList;
				var cashInSettingServiceList=jsonObj.cashInSettingstkMenuServiceList;
				var cashOutSettingServiceList=jsonObj.cashOutSettingstkMenuServiceList;
				var cashInSettingServiceTableId="cashIn_setting_services";
				var cashOutSettingServiceTableId="cashOut_setting_services";
				genrateCashInServiceTree("CashInTable", stkMenuServiceList, cashInTableId);
				genrateCashOutServiceTree("CashOutTable", cashOutstkMenuServiceList ,cashOutTableId);
				$("#step3Tr").show();
				$("#partnerCashInService").show();
				$("#partnerCashOutService").show();
				$('#cashInImage').attr('src','/securebanking/images/add_image_icon.png');
				$('#cashOutImage').attr('src','/securebanking/images/add_image_icon.png');
				$("#CashInTable").hide();
				$("#CashOutTable").hide();
			},
			error: function(e) {
				console.log(e.message);
			}
		});
	}
	else{
		$("#CashInTable").toggle();
		$("#CashOutTable").toggle();
		$("#CashInTable").hide();
		var table=document.getElementById(cashInTableId);
		var numrows=table.rows.length; 
		while(numrows>0)
			table.deleteRow(--numrows);
		$("#CashOutTable").hide();
		var table=document.getElementById(cashOutTableId);
		var numrows=table.rows.length; 
		while(numrows>0)
			table.deleteRow(--numrows);
	}
}

function genrateCashInServiceTree(CashInServiceDivId, cashInServiceList ,cashInTableId, serviceType ,checkedServicesInEditMode){
	$("#serviceMenu").show();
	var errorId="'serviceErrorId'";
	var table=document.getElementById(cashInTableId);
	var numrows=table.rows.length; 
	while(numrows>0)
		table.deleteRow(--numrows);
	$.each(cashInServiceList , function(index, serviceConfigData) {
		var htmllevel2="";
		var html= '<tr  id="'+index+'" class="tableLabel"> ' +
		'<td align="left" >'+
		(serviceConfigData.subServiceList.length>0 ? '<a href="#!" onclick="showStkMenuSubServicesTree('+index+','+serviceConfigData.id+', '+serviceConfigData.level+');"><img src="/securebanking/images/add_image_icon.png"   id="cashInlevelServiceImage'+index+serviceConfigData.id+'"/></a>':'')+'</td>'+
		'<td align="left" width="100%">'+
		'<input type="checkbox"  name="cashInstkMenuServicecheckBoxName1" value="'+serviceConfigData.id+'"   id="stkMenuServicecheckBoxName'+serviceConfigData.id+'" onclick="removemsg(event,'+errorId+');emptyerror('+errorId+');unCheckAllSubServices('+serviceConfigData.id+');"/>'+' <b><span>'+serviceConfigData.serviceDesc+'</span></b>'+
		'</td>'+
		'</tr>'+
		'<tr>'+
		'<td></td>'+
		'<td>'+
		'<table id="cashInlevelTableService_'+serviceConfigData.id+'" style="display: none">'
		$.each(serviceConfigData.subServiceList, function(index, serviceConfigDatalevel2){
			console.log("service id :"+serviceConfigDatalevel2.id +" service Desc :"+serviceConfigDatalevel2.serviceDesc+" partnerId :"+serviceConfigDatalevel2.serviceProviderId);
			htmllevel2=htmllevel2+'<tr id="level2service_'+serviceConfigData.id+'">'+
			'<td></td>'+
			'<td align="left" width="100%">'+
			'<input type="checkbox"  name="cashInstkMenuServicecheckBoxName1"   value="'+serviceConfigDatalevel2.id+'"  id="stkMenuServicecheckBoxName'+serviceConfigDatalevel2.id+'"onclick="removemsg(event,'+errorId+');emptyerror('+errorId+');checkAllMainServices('+serviceConfigDatalevel2.id+','+serviceConfigData.id+');"/>' +'<b><span>'+serviceConfigDatalevel2.serviceDesc+'</span></b>'+
			'</td>'+
			'</tr>';
		});

		html=html+htmllevel2;
		$(html).appendTo($("#"+cashInTableId));
		
		
	});
	if(checkedServicesInEditMode!='' && checkedServicesInEditMode!==undefined){
		for(var c=0; c<checkedServicesInEditMode.length; c++){
			$("#stkMenuServicecheckBoxName"+checkedServicesInEditMode[c]).prop('checked',true);
		}
	}
}

function genrateCashOutServiceTree(CashOutServiceDivId, cashOutServiceList,cashOutTableId){
	var table=document.getElementById(cashOutTableId);
	var numrows=table.rows.length; 
	while(numrows>0)
		table.deleteRow(--numrows);
	$.each(cashOutServiceList, function(index, serviceConfigData) {
		var htmllevel2="";
		var html= '<tr  id="'+index+'" class="tableLabel"> ' +
		'<td align="left" ><a href="#!" onclick="showCashOutStkMenuSubServicesTree('+index+','+serviceConfigData.id+','+serviceConfigData.level+');"><img src="/securebanking/images/add_image_icon.png"   id="cashOutlevelServiceImage'+index+serviceConfigData.id+'"/></a></td>'+
		'<td align="left" width="100%"><input type="checkbox"  value="'+serviceConfigData.id+'#'+serviceConfigData.serviceProviderId+'"   id="stkMenuCashOutServicecheckBoxName'+serviceConfigData.id+'"/> <b><span>'+serviceConfigData.serviceName+'</span></b></td>'+
		'</tr>'+
		'<tr>'+
		'<td></td>'+
		'<td>'+
		'<table id="cashOut_levelTableService_'+serviceConfigData.id+'" style="display: none">'
		$.each(serviceConfigData.subServiceList, function(index, serviceConfigDatalevel2){
			console.log("service id :"+serviceConfigDatalevel2.id +" service Name :"+serviceConfigDatalevel2.serviceName +" partnerId :"+serviceConfigDatalevel2.serviceProviderId);
			var htmllevel3="";
			htmllevel2=htmllevel2+'<tr id="level2service_'+serviceConfigData.id+'">'+
			'<td></td>'+
			'<td align="left" ><a href="#!" onclick="showCashOutStkMenuSubServicesTree('+index+','+serviceConfigDatalevel2.id+');"><img src="/securebanking/images/add_image_icon.png" id="cashOutlevelServiceImage'+index+serviceConfigDatalevel2.id+'"/></a></td>'+
			'<td align="left" width="100%"><input type="checkbox"  name="cashOutstkMenuServicecheckBoxName2" value="'+serviceConfigDatalevel2.id+'#'+serviceConfigDatalevel2.serviceProviderId+'"   id="stkMenuServicecheckBoxName'+index+'"/><b><span>'+serviceConfigDatalevel2.serviceName+'</span></b></td>'+
			'</tr>'+
			//for level 3 
			'<tr>'+
			'<td></td>'+
			'<td colspan="2">'+
			'<table id="cashOut_levelTableService_'+serviceConfigDatalevel2.id+'" width="100%" style="display: none"> '
			$.each(serviceConfigDatalevel2.subServiceList, function(index, serviceConfigDatalevel3){
				console.log("service id :"+serviceConfigDatalevel3.id +" service Name :"+serviceConfigDatalevel3.serviceName +" partnerId :"+serviceConfigDatalevel3.serviceProviderId);
				var htmllevel4=""; 
				htmllevel3= htmllevel3+'<tr>'+
				'<td></td>'+
				'<td width="4%"></td>'+
				'<td align="left" ><a href="#!" onclick="showCashOutStkMenuSubServicesTree('+index+','+serviceConfigDatalevel3.id+');"><img src="/securebanking/images/add_image_icon.png" id="cashOutlevelServiceImage'+index+serviceConfigDatalevel3.id+'"/></a><input type="checkbox"   name="cashOutstkMenuServicecheckBoxName2"  value="'+serviceConfigDatalevel3.id+'#'+serviceConfigDatalevel3.serviceProviderId+'"  id="stkMenuServicecheckBoxName'+index+'"/> '+ 
				'<b><span>'+serviceConfigDatalevel3.serviceName+'</span></b>'+ 
				'</td>'+
				'</tr>'+
				//for level4 
				'<tr>'+
				'<td></td>'+
				'<td width="4%"></td>'+
				'<td>'+
				'<table id="cashOut_levelTableService_'+serviceConfigDatalevel3.id+'" width="100%" style="display: none">'
				$.each(serviceConfigDatalevel3.subServiceList,function(index , serviceConfigDatalevel4){
					var htmllevel5="";
					htmllevel4=htmllevel4+'<tr>'+
					'<td></td>'+
					'<td width="4%"></td>'+
					'<td align="left" width=""><a href="#!" onclick="showCashOutStkMenuSubServicesTree('+index+','+serviceConfigDatalevel4.id+');"><img src="securebanking/images/add_image_icon.png" id="cashOutlevelServiceImage'+index+serviceConfigDatalevel4.id+'"/></a><input type="checkbox"  name="cashOutstkMenuServicecheckBoxName2" value="'+serviceConfigDatalevel4.id+'#'+serviceConfigDatalevel4.serviceProviderId+'"   id="stkMenuServicecheckBoxName'+index+' "/> '+ 
					'<b><span>'+serviceConfigDatalevel4.serviceName+'</span></b>'+ 
					'</td>'+
					'</tr>'+
					//for level 5
					'<tr>'+
					'<td></td>'+
					'<td></td>'+
					'<td> <table id="cashOut_levelTableService_'+serviceConfigDatalevel4.id+'" width="100%" style="display: none">'
					$.each(serviceConfigDatalevel4.subServiceList,function(index , serviceConfigDatalevel5){
						htmllevel5=htmllevel5+'<tr>'+
						'<td></td>'+
						'<td width="4%"></td><td width="4%"></td>'+
						'<td align="left" width=""><a href="#!" onclick="showCashOutStkMenuSubServicesTree('+index+','+serviceConfigDatalevel5.id+');"><img src="securebanking/images/add_image_icon.png" id="cashOutlevelServiceImage'+index+serviceConfigDatalevel5.id+'"/></a><input type="checkbox"  name="cashOutstkMenuServicecheckBoxName2" value="'+serviceConfigDatalevel5.id+'#'+serviceConfigDatalevel5.serviceProviderId+'"   id="stkMenuServicecheckBoxName'+index+'"/> '+ 
						'<b><span>'+serviceConfigDatalevel5.serviceName+'</span></b>' +
						'</td>'+
						'</tr>';
					});

					htmllevel4=htmllevel4+htmllevel5 +'</table>'+ '</td>'+ '</tr>' ;
				});
				htmllevel3=htmllevel3+htmllevel4 +'</table>'+ '</td>'+ '</tr>' ;      
			});
			htmllevel2=htmllevel2+htmllevel3+ '</table>'+ '</td>'+ '</tr>' ;
		});
		html=html+htmllevel2;
		$(html).appendTo($("#"+cashOutTableId));
	});
}
//Setting services 
function genrateCashInSettingServiceTree(CashInSettingServiceDivId, cashInServiceList ,cashInTableId){

}

$(function() {

	$("#CashOutTable").hide();

});
//**********************function to change Image on click 
function showCashIntoggel(cashInServiceTableId,cashInImage){
	$("#"+cashInServiceTableId).toggle();
	var currentimageUrl=$('#'+cashInImage).attr('src');
	if(currentimageUrl=='/securebanking/images/add_image_icon.png'){
		$('#'+cashInImage).attr('src', '');
		$('#'+cashInImage).removeAttr('src');
		$('#'+cashInImage).attr('src','/securebanking/images/minus.png');
	}
	else if(currentimageUrl=='/securebanking/images/minus.png'){
		$('#'+cashInImage).attr('src', '');
		$('#'+cashInImage).removeAttr('src');
		$('#'+cashInImage).attr('src','/securebanking/images/add_image_icon.png');
	}
}
function showCashOuttoggel(cashOutServiceTableId,cashOutImage){
	$("#"+cashOutServiceTableId).toggle();
	var currentimageUrl=$('#'+cashOutImage).attr('src');
	if(currentimageUrl=='/securebanking/images/add_image_icon.png'){
		$('#'+cashOutImage).attr('src', '');
		$('#'+cashOutImage).removeAttr('src');
		$('#'+cashOutImage).attr('src','/securebanking/images/minus.png');
	}
	else if(currentimageUrl=='/securebanking/images/minus.png'){
		$('#'+cashOutImage).attr('src', '');
		$('#'+cashOutImage).removeAttr('src');
		$('#'+cashOutImage).attr('src','/securebanking/images/add_image_icon.png');

	}
}
//************ validate function for HostSim version Creation Page
function  testcheck(){
	var completeCheck = true;
	var lable_HostName=$("#lable_HostName").val();
	if(lable_HostName.length<=0){
		$("#errmsgByHostName").html('<b>Kindly select Host Name!.</b>');
		completeCheck=false;
	}
	else if(lable_HostName.length>0){
		var selectedServiceval = [];
		$('#serviceTableId :checkbox:checked').each(function(i){
			selectedServiceval[i] = $(this).val();
		});
		var selectedPaymentPartnerIds =[];
		$("#paymentPartnerTableId :checkbox:checked").each(function(i){
			selectedPaymentPartnerIds[i]=$(this).val();
		});
	}
	var stkMenuVersion=$("#lable_sys_stkMenuVersion").val().trim();
	if(stkMenuVersion.length<=0){
		$("#lable_sys_stkMenuVersionErrorId").html("<b><font color='red'>Kindly select Menu Version !.</font></b>")
		completeCheck=false;
	}
	else{
		var mainSelectedServices=[];
		$('#CashInTable :checkbox:checked').each(function(i){
			mainSelectedServices[i] = $(this).val();
		});
		var settingSelectedServices=[];
		$('#cashInsettingServiceTable :checkbox:checked').each(function(i){
			settingSelectedServices[i] = $(this).val();
		});
		if(mainSelectedServices.length<=0 && settingSelectedServices.length<=0){
			return false;
		}
	}
	var lable_HostSimVersionName=$("#lable_HostSimVersionName").val().trim();
	if(lable_HostSimVersionName.length<=0){
		$("#errmsgByHostSimVersionName").html("<b><font color='red'>Kindly Enter Host Sim Version Name !.</font></b>")
		completeCheck=false;
	}
	else{
		var hiddenServiceWithProvPartnerCommId=$("#serviceWithProvPartnerCommId").val();
		var hiddenSettingServiceWithProvPartner=$("#settingServiceWithProvPartner").val();
		if(hiddenServiceWithProvPartnerCommId.length<=0 && hiddenSettingServiceWithProvPartner<=0){
			return false;
		}
		if(hiddenServiceWithProvPartnerCommId.length<=0 && hiddenSettingServiceWithProvPartner.length<=0){

			return false;
		}
	}
	var cashInSelectedSettingServiceVal=[];
	$('#cashInsettingServiceTable #cashInlevelTableService_312 :checkbox:checked').each(function(i){
		cashInSelectedSettingServiceVal[i]=$(this).val();
	});
	var cashOutSelectedSettingServiceVal=[];
	$('#cashOutsettingServiceTable #cashOut_levelTableService_312 :checkbox:checked').each(function(i){
		cashOutSelectedSettingServiceVal[i]=$(this).val();
	});

	if(!completeCheck){
		return false;
	}
}
//This Method Show hide the Cash In Stk Menu Services  in Host Sim Version Creation (@Auther Moin on 21 May 2015)
function showStkMenuSubServicesTree(serviceIndex,checkedCurrentServiceMenuvalId,service_level){
	var index=serviceIndex;
	var cashInselectedServicesval = [];
	var currentimageUrl=$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src');
	if(currentimageUrl=='/securebanking/images/add_image_icon.png'){
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src', '');
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).removeAttr('src');
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src','/securebanking/images/minus.png');
		/*$('#stkMenuServicecheckBoxName'+checkedCurrentServiceMenuvalId).prop("checked",true);*/
		$("#cashInlevelTableService_"+checkedCurrentServiceMenuvalId).show();
		$("#cashInlevelTableService_"+checkedCurrentServiceMenuvalId).focus();
		//unCheckAllSubServices(checkedCurrentServiceMenuvalId);
	}
	else if(currentimageUrl=='/securebanking/images/minus.png'){
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src', '');
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).removeAttr('src');
		$('#cashInlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src','/securebanking/images/add_image_icon.png');
/*		$('#stkMenuServicecheckBoxName'+checkedCurrentServiceMenuvalId).prop("checked",true);*/
		$("#cashInlevelTableService_"+checkedCurrentServiceMenuvalId).hide();
		$("#cashInlevelTableService_"+checkedCurrentServiceMenuvalId).focus();
	} 
}
//This Method Show hide the CashOut In Stk Menu Services  in Host Sim Version Creation (@Auther Moin on 22 May 2015)
function showCashOutStkMenuSubServicesTree(serviceIndex,checkedCurrentServiceMenuvalId,service_level){
	var index=serviceIndex;
	var currentimageUrl=$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src');
	if(currentimageUrl=='/securebanking/images/add_image_icon.png'){
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src', '');
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).removeAttr('src');
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src','/securebanking/images/minus.png');
		$("#cashOut_levelTableService_"+checkedCurrentServiceMenuvalId).toggle();
	}
	else if(currentimageUrl=='/securebanking/images/minus.png'){
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src', '');
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).removeAttr('src');
		$('#cashOutlevelServiceImage'+index+checkedCurrentServiceMenuvalId).attr('src','/securebanking/images/add_image_icon.png');
		if(service_level==1){
			$('#stkMenuCashOutServicecheckBoxName'+checkedCurrentServiceMenuvalId).attr('checked',false);
			$("#stkMenuCashOutServicecheckBoxName"+checkedCurrentServiceMenuvalId).attr("disabled", false); 
		}
		$("#cashOut_levelTableService_"+checkedCurrentServiceMenuvalId).toggle();
	} 
}
function getServicesByMenuVersion(e,stkMenuVersion,errorId){
	$("#statusMessage").html("");
	var menuVersionId=$("#"+stkMenuVersion).val();
	var cashInTableId="cashInTableMenuServiceId";
	var otherService="otherService";
	if(menuVersionId.length>0){

		//ajax call*************************
		$.ajax({
			url: 'ajax/getServicesByMenuVersionId',
			type: 'POST',
			dataType: "json",
			data: {
				'menuVersionId' :menuVersionId,
				'parentMenuId' :0
			},
			success: function(response) {
				var jsonObj=response;
				var stkMenuServiceList=jsonObj.stkMenuServiceList;
				var partnerWalletDatas=jsonObj.partnerDatas;
				var serviceArr=jsonObj.serviceConfigIds;
				genrateCashInServiceTree("CashInTable", stkMenuServiceList, cashInTableId,otherService );
				if(partnerWalletDatas.length>0){
				showWallets(partnerWalletDatas);
				}else{
					$("#walletMenu").hide();
					  $('#walletTable tbody').html('')
				}
				var catArray=[];
				for(var k=0;k<stkMenuServiceList.length;k++){
					for(var j=0;j<stkMenuServiceList[k].subServiceList.length;j++){
						if(stkMenuServiceList[k].subServiceList[j].categoryId!=null){
							catArray.push(stkMenuServiceList[k].subServiceList[j].categoryId);
						}
					}
				}
				var rowsFsp = $('#table_id3 > tbody > tr');
				var rowsDirect = $('#table_id2 > tbody > tr');
				var other = $('#table_id1 > tbody > tr');
				var financial = $('#table_id > tbody > tr');
				for(var i=0;i<rowsFsp.length;i++){
					var fspId= rowsFsp[i].id;
					var catId=parseInt(fspId.replace( /[^\d]/g, '' ));
					if(!catArray.includes(catId)){
						$("[data-id='"+fspId+"']").hide();	
					}else{
						$("[data-id='"+fspId+"']").show();	
					}
					
				}
				for(var r=0;r<rowsDirect.length;r++){
					var directId= rowsDirect[r].id;
					var directCatId=parseInt(directId.replace( /[^\d]/g, '' ));
					if(!catArray.includes(directCatId)){
						$("[data-id='"+directId+"']").hide();	
						}else{
							$("[data-id='"+directId+"']").show();	
						}
				}
				for(var s=0;s<other.length;s++){
					var otherId= other[s].id;
					var otherServiceId=parseInt(otherId.replace( /[^\d]/g, '' ));
					if(serviceArr.includes(otherServiceId) || otherServiceId==0){
						$("[data-id='"+otherId+"']").show();	
						}else{
							$("[data-id='"+otherId+"']").hide();	
						}
				}
				for(var t=0;t<financial.length;t++){
					var financialId= financial[t].id;
					var financialServiceId=parseInt(financialId.replace( /[^\d]/g, '' ));
					if(serviceArr.includes(financialServiceId) || financialServiceId==0){
						$("[data-id='"+financialId+"']").show();	
						}else{
							$("[data-id='"+financialId+"']").hide();	
						}
				}
				 $('#table_id3').DataTable().draw();
				  $("#table_id2").DataTable().draw();
				  $('#table_id1').DataTable().draw();
				  $("#table_id").DataTable().draw();
				  
				  
				$("#step3Tr").show();
				$("#step4Tr").show();
				$("#partnerCashInService").show();
				$("#partnerCashInSettingService").show();
				$("#partnerCashOutService").show();
				$('#cashInImage').attr('src','/securebanking/images/add_image_icon.png');
				$('#cashOutImage').attr('src','/securebanking/images/add_image_icon.png');
			},
			error: function(e) {
				console.log(e.message);
			}
		});
	}
	else{
		$("#serviceMenu").toggle();
		$("#serviceMenu").hide();
		var table=document.getElementById(cashInTableId);
		var numrows=table.rows.length; 
		while(numrows>0)
			table.deleteRow(--numrows);
		$("#partnerCashInService").hide();
		$("#partnerCashOutService").hide();
		$("#step3Tr").hide();
	}
}
function showWallets(partnerWalletDatas){
	$("#walletMenu").show();
	var content = '';
	for(var i=0;i<partnerWalletDatas.length;i++){
		content+='<tr><td  width="40%" align="center">'+partnerWalletDatas[i].name+'</td>'
		content+='<td align="center" width="60%"><table><tr><td  width="40%"><input type="checkbox" name="walletcheckBoxName"  id="w'+partnerWalletDatas[i].id+'"'
		content+='onclick=showWalletType('+partnerWalletDatas[i].id+',0) value="'+partnerWalletDatas[i].id +'"/></td><td  width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td  width="40%"><div style="display: none"'
		content+='id="DrCrWalletTdId'+partnerWalletDatas[i].id+'" align="center"><select disabled="true" type="dropdown" class="formField"'
		content+='name="walletType" id="walletTypeId'+partnerWalletDatas[i].id+'"onchange="emptyerrormsg(\'walletTypeErrorId\'\);"'
		content+='><option value="0" label="<-Select->"/><-Select-></option>'
			 $.each(partnerWalletDatas[i].walletTypes, function(k, v){ content+='<option value='+k+' label="'+v+'">'+v+'</option>'; });
		content+='</select></td></tr></table></div></td></tr>';
	}
	  $('#walletTable tbody').html(content); 	
}
function unCheckAllSubServices(rootServiceId){
	var tableId="#cashInlevelTableService_"+rootServiceId;
	var rootCheckBoxId="#stkMenuServicecheckBoxName"+rootServiceId;
	if($(rootCheckBoxId).is(':checked')){
		$(tableId+ ' input[type=checkbox]').each(function() {
			$(this).prop("checked", $(rootCheckBoxId).is(':checked'));
		});
	}
	else{
		$(tableId+ ' input[type=checkbox]'  ).each(function() {
			$(this).prop("checked", false);
		});

	}
}

function checkAllMainServices(subServiceId,rootServiceId){
	var rootCheckBoxId="#stkMenuServicecheckBoxName"+rootServiceId;
	var CheckBoxId="#stkMenuServicecheckBoxName"+subServiceId;
	var tableId=$(CheckBoxId).closest('table').attr('id');
	var count=0;
	 $('#'+tableId).find('input[type="checkbox"]').each(function () {
		 if($(this)[0].checked==true){
		count++;
		 }
	 });
		if(count>0){
			$(rootCheckBoxId).prop("checked", true);
		}else{
			$(rootCheckBoxId).prop("checked", false);
		}
}


function getFinancialInstrumentPartner(selectedServiceSetValue,relationShipType,finInstrumentType){
	
	$('#financialInstrumentErrorId').hide();
	var istrumentValue=selectedServiceSetValue;
	$.ajax({
		url: 'ajax/getFinancialInstrumentPartner',
		type: 'GET',
		dataType: "json",
		data: {
			'instrumentId' :istrumentValue,
			'relationShipType':relationShipType,
		},
		success: function(response) {
			var partnerList=response;
			var partnerHTML = "";
			var directInstrumentPartnerTableId=''+relationShipType+'Partner_table'+selectedServiceSetValue+'';
			if($("#"+finInstrumentType+istrumentValue).is(":checked")){
				if(partnerList==''){
					$("#"+directInstrumentPartnerTableId).html("");
					partnerHTML = partnerHTML
					+ '<tr>'
					+ '<td id="'+relationShipType+'selectedPartnersErrorId'+istrumentValue+'"><span><b>No Partner Available</b></span></td>'+
					+'</tr>';
					$("#"+finInstrumentType+istrumentValue).prop('checked',false);
				}
				else{
					for (var k = 0; k < partnerList.length; k++) {
						partnerHTML = createPartnerTable(partnerHTML,directInstrumentPartnerTableId,partnerList[k],partnerList,istrumentValue,relationShipType,finInstrumentType,selectedServiceSetValue);
					} 
				}
			}
			else{
				$("#"+directInstrumentPartnerTableId).html("");
			}
			$('<tbody>' + partnerHTML + '</tbody>').appendTo($('#'+directInstrumentPartnerTableId));
		},
		error: function(e){
			console.log(e.message);
		}
	});
}
function getProviderPartners(selectedCheckBoxId,selectedServiceSetValue,relationShipType,providersType,providerCatId){
	var serviceValue=selectedServiceSetValue.split("_"); 
	var categoryValue=serviceValue[0];
	var providerValue=serviceValue[1];
	$.ajax({
		url: 'ajax/getProviderPartners',
		type: 'GET',
		dataType: "json",
		data: {
			'providerId' :providerValue,
			'categoryId' :categoryValue,
			'relationShipType':relationShipType,
		},
		success: function(response) {
			var partnerList=response;
			var partnerHTML = "";
			var directInstrumentPartnerTableId=''+relationShipType+'ProvidersPartner_table'+selectedServiceSetValue+'';
			if($("#"+selectedCheckBoxId).is(":checked")){
				if(partnerList.length<1){
					$("#"+directInstrumentPartnerTableId).html("");
					partnerHTML = partnerHTML
					+ '<tr>'
					+ '<td id="'+relationShipType+'selectedPartnersErrorId'+providerValue+'"><span><b>No Partner Available</b></span></td>'+
					+'</tr>';
					$("#"+selectedCheckBoxId).prop('checked',false);
				}
				else{
					$("#"+directInstrumentPartnerTableId).html("");
					for (var k = 0; k < partnerList.length; k++) {
						partnerHTML = createPartnerTable(partnerHTML,directInstrumentPartnerTableId,partnerList[k],partnerList,providerCatId+'#'+providerValue,relationShipType,providersType,selectedServiceSetValue);
					} 
		
				}
			}
			else{
				$("#"+directInstrumentPartnerTableId).html("");
			}
			$('<tbody>' + partnerHTML + '</tbody>').appendTo($('#'+directInstrumentPartnerTableId));
			 $('#table_id3').DataTable().draw(false);
			 $('#table_id2').DataTable().draw(false);
		
		},
		error: function(e){
			console.log(e.message);
		}
	});
}

function getServicePartners(selectedCheckBoxId,selectedServiceSetValue,relationShipType,servicesType){
	var providerValue=selectedServiceSetValue;
	$.ajax({
		url: 'ajax/getServicePartners',
		type: 'GET',
		dataType: "json",
		data: {
			'serviceId' :providerValue,
			'relationShipType':relationShipType,
		},
		success: function(response) {
			var partnerList=response;
			var partnerHTML = "";
			var directInstrumentPartnerTableId=''+relationShipType+'FSPServices_table'+selectedServiceSetValue+'';
			if($("#"+selectedCheckBoxId).is(":checked")){
				if(partnerList==''){
					$("#"+directInstrumentPartnerTableId).html("");
					partnerHTML = partnerHTML
					+ '<tr>'
					+ '<td id="'+relationShipType+'selectedPartnersErrorId'+providerValue+'"><span><b>No Partner Available</b></span></td>'+
					+'</tr>';
					$("#"+selectedCheckBoxId).prop('checked',false);
				}
				else{
					for (var k = 0; k < partnerList.length; k++) {
						partnerHTML = createPartnerTable(partnerHTML,directInstrumentPartnerTableId,partnerList[k],partnerList,providerValue,relationShipType,servicesType,selectedServiceSetValue);
					} 
				}
			}
			else{
				$("#"+directInstrumentPartnerTableId).html("");
			}
			$('<tbody>' + partnerHTML + '</tbody>').appendTo($('#'+directInstrumentPartnerTableId));
			 $('#table_id1').DataTable().draw(false);
			 $('#table_id').DataTable().draw(false);
		},
		error: function(e){
			console.log(e.message);
		}
	});
}
function createPartnerTable(partnerHTML,partnerTableId,partnerObject,partnerList,istrumentValue,relationShipType,providersType,selectedServiceSetValue){
	
	var firstIndex=istrumentValue.split('#');
	var partnerSequenceId='';
	var partnerForName='';
	var partnerId='';
	var partnerCommissionId;
	if(firstIndex.length>1){
		partnerSequenceId=relationShipType+providersType+'Sequence'+firstIndex[0]+firstIndex[1]+partnerObject.id;
		partnerCommissionId=relationShipType+providersType+'Commission'+firstIndex[0]+firstIndex[1]+partnerObject.id;
		partnerId=relationShipType+firstIndex[0]+firstIndex[1]+partnerObject.id;
		partnerForName=relationShipType+providersType+'Sequence'+firstIndex[0];

	}
	else{
		partnerSequenceId=relationShipType+providersType+'Sequence'+firstIndex[0]+partnerObject.id;
		partnerCommissionId=relationShipType+providersType+'Commission'+firstIndex[0]+partnerObject.id;
		partnerId=relationShipType+firstIndex[0]+partnerObject.id;
		partnerForName=relationShipType+providersType+'Sequence'+firstIndex[0];
	}
	var errorId=providersType+"ErrorId";
	partnerHTML = partnerHTML
	+ '<tr>'
	+ '<td align="left" style="margin: 10px; padding: 5px;">&nbsp;&nbsp;<input type="checkbox" name="'+partnerForName+'PartnerMapping" id="'
	+ partnerId
	+ '" value="'+istrumentValue+'#'+partnerObject.id
	+ '" onchange="emptyerrormsg(\''+errorId+'\');addSequence(\''+partnerSequenceId+'\',\''+partnerCommissionId+'\',\''+relationShipType+providersType+'Sequence'+'\','+partnerList.length+',\''+istrumentValue+'#'+partnerObject.id+'\',\''+partnerId+'\');"></input>&nbsp;&nbsp;'
	+ partnerObject.name
	+ '</td>'
	+ '<td style="margin: 10px; padding: 5px;"><select id="'+partnerSequenceId+'" style="width: 100px" path="financialInstrumentPartnerMappingSequence" data-name="'+relationShipType+providersType+selectedServiceSetValue+'Sequence" onchange=emptyerrormsg("'+relationShipType+providersType+selectedServiceSetValue+'SequenceErrorId");makeCommissionValue(\''+partnerSequenceId+'\',\''+partnerCommissionId+'\');managePartner("'+relationShipType+providersType+selectedServiceSetValue+'Sequence","'+partnerSequenceId+'","'+relationShipType+providersType+selectedServiceSetValue+'SequenceErrorId") style="display:none">'
	+'<option value=" " label="<- Select ->"></option>'
	+'<options value='+partnerSequenceId+' label='+partnerSequenceId+'/>'
	+'</select>'
	+'</td>'
	+ '<td style="margin: 10px; padding: 5px;"><select id="'+partnerCommissionId+'" style="width: 160px" path="financialInstrumentCommissionMappingSequence" name="'+relationShipType+providersType+'Commission" onchange=emptyerrormsg("'+relationShipType+providersType+selectedServiceSetValue+'SequenceErrorId");managePartner("'+relationShipType+providersType+selectedServiceSetValue+'Sequence","'+partnerSequenceId+'","'+relationShipType+providersType+selectedServiceSetValue+'SequenceErrorId") style="display:none">'
	+'<option value=" " label="<- Commission ->"></option>'
	+'<options value='+partnerCommissionId+' label='+partnerCommissionId+'/>'
	+'</select>'
	+'</td>'
	+'<td>'
	+'<div id="'+relationShipType+providersType+selectedServiceSetValue+'SequenceErrorId" align="left"></div>'
	+'</td>'
	+ '</tr>';
	return partnerHTML
}

function managePartner(selectId,partnerSequenceId,errorId)
{
	var values=[];	
	var el=$( "#"+partnerSequenceId+" option:selected" ).text();
	values = $.map($('select[data-name='+selectId+'\]'), function (e) {
		return $('option:selected', e).text();
	});
	for(var i=0;i<values.length;i++)
	{
		values[i]=values[i].replace(/\D+/g, '');
	}
	values = values.filter(Boolean);
	if (values.indexOf(el) != values.lastIndexOf(el))
	{
		$("#"+errorId).html("<font color='red'>Partners Can't Have Same Preference</font>");
		$("#"+errorId).show();
		$( "#"+partnerSequenceId).val('');
	}
}

function addSequence(seqId,commissionId,dropdownname,partnerList, partnerValue,currentpartnerId){
	if(typeof currentpartnerId!=='undefined'){
	if($("#"+currentpartnerId).is(":checked")){
		var sel='';
		var selval='<- Select ->';
		$('#'+seqId).find('option').remove();
		$('#'+seqId).show();
		var optionValuehtml='<option value="'+sel+'">'+selval+'</option>';
		for(var m=1;m<=partnerList; m++){
			optionValuehtml=optionValuehtml+
			'<option value="'+partnerValue+'#'+m+'">'+m+'</option>';
		}
		$('#'+seqId).append(optionValuehtml);
	}
	else{
		var partnerValuewithSequence=partnerValue;
		var sel='';
		var selval='<- Select ->';
		var selcal='<- commission ->';
		$('#'+seqId).find('option').remove();
		var optionValuehtml='<option value="'+sel+'">'+selval+'</option>';
		$(optionValuehtml).appendTo($('#'+seqId));
		
		$('#'+commissionId).find('option').remove();
		var optionValuehtmlComm='<option value="'+sel+'">'+selcal+'</option>';
		$(optionValuehtmlComm).appendTo($('#'+commissionId));
	}
	}
}
function showWalletType(walletId,edit){
	$('#walletTypeErrorId').hide();
	$("#walletTypeId"+walletId).val('0');
	if($("#w"+walletId).is(':checked')){
		$("#DrCrWalletTdId"+walletId).show();
		$("#DrCrWalletTdId"+walletId).children().show();
		$("#walletTypeId"+walletId).prop("disabled", false);
	}
	else{
		$("#walletTypeId"+walletId).prop("disabled", "disabled");
		if(edit==0){
		$("#DrCrWalletTdId"+walletId).hide(); 
		}else{
			$("#DrCrWalletTdId"+walletId).children().hide();	
		}
	}
}
function validateHostSubVersionPage(){
	var status=true;
	var masterVersion=$("#lable_sys_stkMenuVersion").val().trim();
	if(masterVersion.length<=0){
		$('#lable_sys_stkMenuVersion_ErrorId').html("<font color='red'>Kindly Select Master Version</font>");
		$("#lable_sys_stkMenuVersion_ErrorId").show();
		$("#lable_sys_stkMenuVersion_id").hide();
		status = false;
	}
	var hsvName=$("#lable_HostSimVersionName").val().trim();
	if(hsvName.length<=0){
		$('#errmsgByHostSimVersionName').html("<font color='red'>Kindly Enter Name</font>");
		$("#errmsgByHostSimVersionName").show();
		$("#hsvNameId").hide();
		status = false;
	}
	var smsCode=$("#lable_smsCode").val().trim();
	if(smsCode.length<=0){
		$("#errmsgBysmsCode").html("<font color='red'>Kindly Enter SMS Code</font>");
		$("#errmsgBysmsCode").show();
		$("#smsCodeId").hide();
		status = false;
	}
	var serviceMenu= [];
	$('#cashInTableMenuServiceId :checkbox:checked').each(function(i){
		serviceMenu[i] = $(this).val();
	});
	if(serviceMenu.length<=0){
		$("#serviceErrorId").html("<font color='red'>Kindly Select At Least One Service Menu</font>");
		$("#serviceErrorId").show();
		status = false;
	}
	
var checkedCheckboxes = document.querySelectorAll("[name='walletcheckBoxName']:checked");
	
	if (checkedCheckboxes.length > 0) {
		var CrArray=[];
		$("select[name='walletType'] option:selected").not(':disabled').each(function () {
			if($(this).text()==='Cr'|| $(this).text()==='Dr-Cr'){
				CrArray.push($(this).text());
			}
		});
			if(CrArray.length<checkedCheckboxes.length){
				$("#walletTypeErrorId").html("<font color='red'>Please Select Wallet Type</font>");
				$("#walletTypeErrorId").show()
				status = false;
			}
		
		
		}
	
	

	
	var financialInstrumentCheckboxes = document.querySelectorAll("[name='financialInstrument']:checked");
	
	if (financialInstrumentCheckboxes.length>0) {
		var finInstrument = [];
		$.each($("input[name='financialInstrument']:checked"), function(){            
			finInstrument.push($(this).val());
		});
		if(finInstrument.length>0){
			$.each(finInstrument, function (index, partnervalue) {
				var directInstrumentPartnetTableId='DIRECTPartner_table'+partnervalue;
				var finInstrumentPartner= [];
				var priority=[];
				$("select[data-name='DIRECTfinancialInstrument"+partnervalue +"Sequence'] option:selected").each(function (i) {
					if($(this).val().trim().length>0){
					priority[i]=$(this).val();
					}
				});
				$('#'+directInstrumentPartnetTableId+' :checkbox:checked').each(function(i){
					finInstrumentPartner[i] = $(this).val();
				});
				if(finInstrumentPartner.length<=0){
					$("#financialInstrumentErrorId").html("<font color='red'> Please Select At Least One Partner For Selected Financial Instrument</font>");
					$("#financialInstrumentErrorId").show();
					status = false;
				}else{
					if(priority.length<finInstrumentPartner.length){
						$("#DIRECTfinancialInstrument"+partnervalue +"SequenceErrorId").html("<font color='red'> Please Select Priority</font>");
						$("#DIRECTfinancialInstrument"+partnervalue +"SequenceErrorId").show();
						status = false;
					}
				}
			});
		}
		
		}
	
	


	var fspotherServices = [];
	$.each($("input[name='fspotherServices']:checked"), function(){            
		fspotherServices.push($(this).val());
	});
	if(fspotherServices.length>0){
		$.each(fspotherServices, function (index, fspServicesvalue) {
			var fspServicesPartnertTableId='FSP_PROVIDERFSPServices_table'+fspServicesvalue;
			var fspServicesPartner= [];
			var priority=[];
			$("select[data-name='FSP_PROVIDERfspotherServices"+fspServicesvalue +"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+fspServicesPartnertTableId+' :checkbox:checked').each(function(i){
				fspServicesPartner[i] = $(this).val();
			});
			if(fspServicesPartner.length<=0){
				$("#fspotherServicesErrorId").html("<font color='red'>Please Select At Least One Partner For Selected FSP Services</font>");
				$("#fspotherServicesErrorId").show();
				status = false;   
			}else{
				if(priority.length<fspServicesPartner.length){
					$("#FSP_PROVIDERfspotherServices"+fspServicesvalue +"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#FSP_PROVIDERfspotherServices"+fspServicesvalue +"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
		var otherServices = [];
	$.each($("input[name='otherServices']:checked"), function(){            
		otherServices.push($(this).val());
	});
	if(otherServices.length>0){
		$.each(otherServices, function (index, servicesPartnervalue) {
			var directOtherServicesPartnertTableId='DIRECTFSPServices_table'+servicesPartnervalue;
			var directOtherServicesPartner= [];
			var priority=[];
			$("select[data-name='DIRECTotherServices"+servicesPartnervalue +"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+directOtherServicesPartnertTableId+' :checkbox:checked').each(function(i){
				directOtherServicesPartner[i] = $(this).val();
			});
			if(directOtherServicesPartner.length<=0){
				$("#otherServicesErrorId").html("<font color='red'>Please Select At Least One  Partner For Selected Other Services</font>");    
				$("#otherServicesErrorId").show();
				status = false;
			}else{
				if(priority.length<directOtherServicesPartner.length){
					$("#DIRECTotherServices"+servicesPartnervalue +"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#DIRECTotherServices"+servicesPartnervalue +"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
	var providers = [];
	$.each($("input[name='providers']:checked"), function(){            
		providers.push($(this).val());
	});
	if(providers.length>0){
		$.each(providers, function (index, providervalue) {
			var test=providervalue.replace(/\s/g , "_")
			var providerPartnertTableId='DIRECTProvidersPartner_table'+test;
			var providersPartner= [];
			var priority=[];
			$("select[data-name='DIRECTproviders"+test +"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+providerPartnertTableId+' :checkbox:checked').each(function(i){
				providersPartner[i] = $(this).val();
			});
			if(providersPartner.length<=0){
				$("#providersErrorId").html("<font color='red'>Please Select At Least One Partner For Selected Direct Provider</font>")
				$("#providersErrorId").show();
				status = false;
			}else{
				if(priority.length<providersPartner.length){
					$("#DIRECTproviders"+test +"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#DIRECTproviders"+test +"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
	//for Direct provider in edit mode
	var providerEdit= [];
	$.each($("input[name='providersPath']:checked"), function(){            
		providerEdit.push($(this).val());
	});
	if(providerEdit.length>0){
		$.each(providerEdit, function (index, providervalue) {
			var url = providervalue.replace('#', '_');
			var providerPartnertTableId='DIRECTProvidersPartner_table'+url;
			var providersPartner= [];
			var priority=[];
			$("select[data-name='DIRECTproviders"+url+"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+providerPartnertTableId+' :checkbox:checked').each(function(i){
				providersPartner[i] = $(this).val();
			});
			if(providersPartner.length<=0){
				$("#providersErrorId").html("<font color='red'>Please Select At Least One Partner For Selected Direct Provider</font>")
				$("#providersErrorId").show();
				status = false;
			}else{
				if(priority.length<providersPartner.length){
					$("#DIRECTproviders"+url+"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#DIRECTproviders"+url+"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
	var fspproviders=[];
	$.each($("input[name='fspproviders']:checked"), function(){            
		fspproviders.push($(this).val());
	});
	if(fspproviders.length>0){
		$.each(fspproviders, function (index, fspprovidersvalue) {
			var test=fspprovidersvalue.replace(/\s/g , "_")
			var fspprovidersPartnertTableId='FSP_PROVIDERProvidersPartner_table'+test;
			var fspprovidersPartner= [];
			var priority=[];
			$("select[data-name='FSP_PROVIDERfspproviders"+test +"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+fspprovidersPartnertTableId+' :checkbox:checked').each(function(i){
				fspprovidersPartner[i] = $(this).val();
			});
			if(fspprovidersPartner.length<=0){
				$("#fspprovidersErrorId").html("<font color='red'>Please Select At Least One Partner For Selected FSP Provider</font>");   
				$("#fspprovidersErrorId").show();
				status = false;   
			}else{
				if(priority.length<fspprovidersPartner.length){
					$("#FSP_PROVIDERfspproviders"+test +"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#FSP_PROVIDERfspproviders"+test +"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
	//for FSP provider in edit mode
	var fspprovidersEdit=[];
	$.each($("input[name='fspprovidersPath']:checked"), function(){            
		fspprovidersEdit.push($(this).val());
	});
	if(fspprovidersEdit.length>0){
		$.each(fspprovidersEdit, function (index, fspprovidersvalue) {
			var url = fspprovidersvalue.replace('#', '_');
			var fspprovidersPartnertTableId='FSP_PROVIDERProvidersPartner_table'+url;
			var fspprovidersPartner= [];
			var priority=[];
			$("select[data-name='FSP_PROVIDERfspproviders"+url+"Sequence'] option:selected").each(function (i) {
				if($(this).val().trim().length>0){
				priority[i]=$(this).val();
				}
			});
			$('#'+fspprovidersPartnertTableId+' :checkbox:checked').each(function(i){
				fspprovidersPartner[i] = $(this).val();
			});
			if(fspprovidersPartner.length<=0){
				$("#fspprovidersErrorId").html("<font color='red'>Please Select At Least One Partner For Selected FSP Provider</font>");   
				$("#fspprovidersErrorId").show();
				status = false;   
			}else{
				if(priority.length<fspprovidersPartner.length){
					$("#FSP_PROVIDERfspproviders"+url+"SequenceErrorId").html("<font color='red'>Please Select Priority</font>");
					$("#FSP_PROVIDERfspproviders"+url+"SequenceErrorId").show();
					status = false;
				}
			}
		});
	}
	if(!status){
		return false;
	}
}
function makeCommissionValue(commissionDropdownName,commissionId)
{
	var sel='0';
	var selcal='<- commission ->';
	var dropdownValue=$('#'+commissionDropdownName).val();
	if(valuess==null)
		{
	$.ajax({
		type: "post",
		url: "ajax/getCommissionTemplate",
		data: '',
		dataType: "json",
		success: function(response){
			valuess=response;
			$('#'+commissionId).find('option').remove();
			$('#'+commissionId).show();
			var optionValuehtmlCommission='<option value="'+dropdownValue+'#'+sel+'">'+selcal+'</option>';
			for(var i=0;i<valuess.length;i++)
			{
				optionValuehtmlCommission=optionValuehtmlCommission+
				'<option value="'+dropdownValue+'#'+valuess[i].id+'">'+valuess[i].name+'</option>';
			}	
			$('#'+commissionId).append(optionValuehtmlCommission);
		},
		error: function(e) {
			console.log(e.message);
		}
	});
}else
{
	$('#'+commissionId).find('option').remove();
	$('#'+commissionId).show();
	var optionValuehtmlCommission='<option value="'+dropdownValue+'#'+sel+'">'+selcal+'</option>';
	for(var i=0;i<valuess.length;i++)
	{
		optionValuehtmlCommission=optionValuehtmlCommission+
		'<option value="'+dropdownValue+'#'+valuess[i].id+'">'+valuess[i].name+'</option>';
	}	
	$('#'+commissionId).append(optionValuehtmlCommission);
}
}

function removemsg(event,errorId)
{	
	$('#'+errorId).html("");
}



