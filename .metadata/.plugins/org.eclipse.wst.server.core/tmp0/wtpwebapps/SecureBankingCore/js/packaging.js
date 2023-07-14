function getProductss(){
	/*var pTypeName=('#productType$').show();*/
	$(".masterVersionDiv").hide();
	/*var productType = $('#'+pTypeName).val();*/
	$('#groupTableDataId').html('');
	//	$('#groupTableId').hide();
	var productType = $('#productType').val();
	$.ajax({
		url: 'ajax/get-products',
		type: 'post',
		dataType: "json",
		data: 'pTypeName='+productType,
		success:function(response){
			var productsArray =[];
			productsArray = response.responseEntityList;
			var select = $('#product');
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
			for(var i=0;i<productsArray.length;i++){
				$('<option>').val(productsArray[i].id).text(productsArray[i].name).appendTo(select);
			}
			$('#overlayId').show();
		
			/*if(productType=='OVERLAY'){
				$('#overlayId').show();
				$('#cardId').hide();
				var select = $('#product');
				select.find('option').remove();
				$('<option>').val("").text("").appendTo(select);
				$.each(productTypez, function(index, value) {
					var select = $('#product');
					$('<option>').val(index).text(value).appendTo(select);
				});
				
				var select1 = $('#groupType');
				select1.find('option').remove();
				$('<option>').val("").text("").appendTo(select1);
				$.each(groupType, function(index, value) {
					var select1 = $('#groupType');
					$('<option>').val(index).text(value).appendTo(select1);
				});
				$('#groupTableId').hide();
		}else if(productType=='MIFARE_CARD'){
			$('#groupTableId').hide();
			$('#overlayId').hide();
			$('#cardId').show();
			var select = $('#products');
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
			$.each(productTypez, function(index, value) {
				var select = $('#products');
				$('<option>').val(index).text(value).appendTo(select);
			});
			var select1 = $('#groupType');
			select1.find('option').remove();
			$('<option>').val("").text("").appendTo(select1);
			$.each(groupType, function(index, value) {
				var select1 = $('#groupType');
				$('<option>').val(index).text(value).appendTo(select1);
			});
		}
		else
		{
			$('#groupTableId').hide();
			$('#overlayId').hide();
			$('#cardId').hide();
			$('#ReaderId').show();
			var select = $('#productsreader');
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
			$.each(productTypez, function(index, value) {
				var select = $('#productsreader');
				$('<option>').val(index).text(value).appendTo(select);
			});
			var select1 = $('#groupType');
			select1.find('option').remove();
			$('<option>').val("").text("").appendTo(select1);
			$.each(groupType, function(index, value) {
				var select1 = $('#groupType');
				$('<option>').val(index).text(value).appendTo(select1);
			});
		
		
		
		}*/	
		
		}
	
	
	
	
	});
}
var packagingList= new Array();
var productSeriesFrom=0;
var productSeriesTo=0;

function fetchInventory(){
	if($("#groupType").val()==""){
		$(".groupTypeDivError").addClass("has-error");
		$('#groupTableDataId').empty();
		return false;
	}
	$("#errorMessage").empty();
	$('#groupTableDataId').empty();
	//$('#groupTableDataId').html('');
	//$('#groupTableId').hide();
	var groupType = $('#groupType').val();
	var productType = $('#productType').val();
	if(productType == 'OVERLAY'){
		var product = $('#product').val();
		var masterVersion = $('#masterVersion').val();
		$.ajax({
			type : 'POST',
			url : 'ajax/fetchOverlay',
			dataType: "json",
			data : 'groupType='+groupType+'&product='+product+'&masterVersion='+masterVersion,
			success:function(response){
				var tableDataList = [];
				tableDataList = JSON.parse(JSON.stringify(response));
				if($.isEmptyObject(tableDataList)){
					$("#errorMessage").append("<p>Create small packaging first.</p>");
					$("#submitButtonId").attr('disabled','disabled');
				}else{
					$("#submitButtonId").removeAttr('disabled');
				}
				if(tableDataList.length>0){
					$('#groupTableId').show();
				}
				for(var k =0;k<tableDataList.length;k++){
					if(k==0){
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesFrom=tableDataList[k].seriesFrom;
						}
						else
						{
							productSeriesFrom = tableDataList[k].externalNo;	
						}
					}
					if(k==tableDataList.length-1)
					{
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesTo=tableDataList[k].seriesTo;
						}
						else
						{
							productSeriesTo = tableDataList[k].externalNo;	
						}
					}
					packagingList[k] = tableDataList[k].id;
					$('#groupTableDataId').append("<tr><td align='center'>"+tableDataList[k].productType+"</td><td>"+tableDataList[k].masterVersion+"</td><td align='center'>"+tableDataList[k].externalNo+"</td><td>"+tableDataList[k].cardName+"</td><td>"+tableDataList[k].seriesFrom+"</td><td>"+tableDataList[k].seriesTo+"</td></tr>");	
				}
				$('#productSeriesFrom').val(productSeriesFrom);
				$('#productSeriesTo').val(productSeriesTo);
				$("#listIds").val(packagingList);
			}
		});
	}else if(productType =='MIFARE_CARD'){ 
		var products = $('#product').val();
		var cardType = $('#cardType').val();
		$.ajax({
			type : 'POST',
			url : 'ajax/fetchCards',
			dataType: "json",
			data : 'groupType='+groupType+'&product='+products+'&cardType='+cardType,
			success:function(response){
				var tableDataList =[];
				tableDataList = JSON.parse(JSON.stringify(response));
				
				if($.isEmptyObject(tableDataList)){
					$("#errorMessage").append("<p>Create small packaging first.</p>");
					$("#submitButtonId").attr('disabled','disabled');
				}else{
					$("#submitButtonId").removeAttr('disabled');
				}
				
				
				if(tableDataList.length>0){
					$('#groupTableId').show();
				}
				for(var k =0;k<tableDataList.length;k++){
					if(k==0){
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesFrom=tableDataList[k].seriesFrom;
						}
						else
						{
							productSeriesFrom = tableDataList[k].externalNo;	
						}
						
					}
					if(k==tableDataList.length-1)
					{
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesTo=tableDataList[k].seriesTo;
						}
						else
						{
							productSeriesTo = tableDataList[k].externalNo;	
						}
						
					}
					packagingList[k] = tableDataList[k].id;
					$('#groupTableDataId').append("<tr><td align='center'>"+tableDataList[k].productType+"</td><td>"+tableDataList[k].masterVersion+"</td><td align='center'>"+tableDataList[k].externalNo+"</td><td>"+tableDataList[k].cardName+"</td><td>"+tableDataList[k].seriesFrom+"</td><td>"+tableDataList[k].seriesTo+"</td></tr>");	
				}
				$('#productSeriesFrom').val(productSeriesFrom);
				$('#productSeriesTo').val(productSeriesTo);
				$("#listIds").val(packagingList);
			
			}
		});
	}
	
	else
		{
		var products = $('#productsreader').val();
		$.ajax({
			type : 'POST',
			url : 'ajax/fetchReader',
			data : 'groupType='+groupType+'&product='+products,
			dataType: "json",
			success:function(response){
				var tableDataList =[];
				tableDataList = JSON.parse(JSON.stringify(response));
				
				
				if($.isEmptyObject(tableDataList)){
					
					$("#errorMessage").append("<p>Create small packaging first.</p>");
					$("#submitButtonId").attr('disabled','disabled');
				}else{
					$("#submitButtonId").removeAttr('disabled');
				}
				if(tableDataList.length>0){
					$('#groupTableId').show();
				}
				for(var k =0;k<tableDataList.length;k++){
					if(k==0){
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesFrom=tableDataList[k].seriesFrom;
						}
						else
						{
							productSeriesFrom = tableDataList[k].externalNo;	
						}
						
					}
					if(k==tableDataList.length-1)
					{
						if(tableDataList[k].externalNo=="NA")
						{
							productSeriesTo=tableDataList[k].seriesTo;
						}
						else
						{
							productSeriesTo = tableDataList[k].externalNo;	
						}
						
					}
					packagingList[k] = tableDataList[k].id;
					$('#groupTableDataId').append("<tr><td align='center'>"+tableDataList[k].productType+"</td><td>"+tableDataList[k].masterVersion+"</td><td align='center'>"+tableDataList[k].externalNo+"</td><td>"+tableDataList[k].cardName+"</td><td>"+tableDataList[k].seriesFrom+"</td><td>"+tableDataList[k].seriesTo+"</td></tr>");	
				}
				$('#productSeriesFrom').val(productSeriesFrom);
				$('#productSeriesTo').val(productSeriesTo);
				$("#listIds").val(packagingList);
			
			}
		});
		
		
		}
	
	
	
}
function getCards(cardType,products){
	$('#groupTableDataId').html('');
	//$('#groupTableId').hide();
	var productVal = $('#'+products).val();
	$.ajax({
		url:'ajax/getCardsByProductId',
		type:'POST',
		dataType: "json",
		data:'productVal='+productVal,
		success:function(response){
			var select = $('#'+cardType);
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
			$.each(response, function(index, value) {
				var select = $('#'+cardType);
				$('<option>').val(index).text(value).appendTo(select);
			});
		}
	});
}
function hideTable()
{
	$('#groupTableDataId').html('');
	//$('#groupTableId').hide();
}

function getGroupTypeByProductType(){
	
	
	$.ajax({
		url:'ajax/get-package-group?productType='+$("#productType").val(),
		type:'GET',
		dataType: "json",
		success:function(response){
			var select = $('#groupType');
			var responseArray = [];
			responseArray = response.responseEntityList;
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
		for (var i = 0; i < responseArray.length; i++) {
			$('<option>').val(responseArray[i].id).text(responseArray[i].groupName).appendTo(select);
			}
		if(response.productType!=null&&response.productType.masterVirsion===true){
			$(".masterVersionDiv").show();
		}			
		}
	});
	
	
}

 function  validatePartner(event){
	 $('.packagingNameDivError').removeClass('has-error');
	 $('.productTypeDivError').removeClass('has-error');
	 $('.productDivError').removeClass('has-error');
	 $('.groupTypeDivError').removeClass('has-error');
	 $('.masterVersionDivError').removeClass('has-error');
	 
	if($("#packagingName").val()==""){
		$('.packagingNameDivError').addClass('has-error');
		return false;
	}
	if($("#productType").val()==""){
		$('.productTypeDivError').addClass('has-error');
		return false;
	}
	if($("#product").val()==""){
		$('.productDivError').addClass('has-error');
		return false;
	}
	if($(".masterVersionDiv").is(':hidden')==false && $("#masterVersion").val()==""){
		$('.masterVersionDivError').addClass('has-error');
		return false;
	}
	if($("#groupType").val()==""){
		$('.groupTypeDivError').addClass('has-error');
		return false;
	}

	return true;
	
}
$(document).ready(function(){
	$(".masterVersionDiv").hide();
	$('#groupTableId').show();
	$("#submitButtonId").attr('disabled','disabled');
});