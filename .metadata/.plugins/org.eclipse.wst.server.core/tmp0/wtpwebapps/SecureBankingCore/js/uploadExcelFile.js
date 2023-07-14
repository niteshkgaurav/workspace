
//Function for check excel file or not using extension
function checkExcelFile(fieldId, errorid) {
	// ***************************** Code for check file extension
	// ****************************
	var ext = $('#' + fieldId).val().split('.').pop().toLowerCase();
	if ($.inArray(ext, [ 'xlsx' ]) == -1) {

		$('#label_uploadFilePath').hide();
		$('#' + errorid)
		.html(
		"<p class='text-danger'>Kindly upload file having extension .xlsx </p>");
		$('#' + fieldId).val('');
		return false;
	}
	// ***************************** Code for check file size
	// ****************************
	var fileSize = $('#' + fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize) / 1024);
	if (fileSizeKB > 5000) {
		$('#label_uploadFilePath').hide();
		$('#' + errorid)
		.html(
		"<p class='text-danger'>Kindly upload file having size less than 5MB</p>");
		$('#' + fieldId).val('');
		return false;
	}
	$('#' + errorid).html("");
}

//Function for inventor excel file upload submit
function validateUploadExcelFilePage(event){
	var poNo=$('#poNo').val();
	var uploadFilePath=$('#uploadFilePath').val();
	var label_productssId = $('#label_productssId').val();  //Deepika
	completeCheck = true;
	if(label_productssId==0)
	{

		$('#label_productss').addClass("has-error");
		event.preventDefault();
		completeCheck=false;
	}
	
	if($("#upload").is(":visible")){
		if(uploadFilePath.length <= 0){
			$('#divID_uploadFilePath').addClass('has-error');
			completeCheck = false;
			
		}
		
	}
if($("#upload").attr("status")==undefined){
	if(uploadFilePath.length <= 0)
	{


		$('#divID_uploadFilePath').addClass('has-error');
		//$('#upload_ErrorId').show();
		$('#upload_ErrorId').html("<font color='red'>Kindly browse inventory excel file</font>");
		completeCheck = false;
	}else{
		$('#upload_ErrorId').html("");
	}
}

	if(poNo==undefined  || poNo.length <= 0)
	{
		$('#divID_poNo').addClass('has-error');
		/*$('#label_poNo').hide();
		$('#poNoErrorId').show();
		$('#poNoErrorId').html("<p class='text-danger'>Kindly select PO Number</p>");*/
		completeCheck = false;
	}
	else{
		$('#poNoErrorId').html("");
	}
	if(!completeCheck){
		event.preventDefault();
		return false;
	}

}


function getponumber()
{


	
	var producttype=$("#label_productssId").val().trim();
	
	
	if(producttype.length>0)
		{
	$.ajax({
		type: "post",
		url: "ajax/find-po-number",
		dataType: "json",
		data: 'producttype='+producttype,
		success: function(response){
			$("#divID_poNo").show();	
			var obj=[];
			obj = response.responseEntityList;
			
			var productTypeData ={};
			productTypeData = response.productType;
			var select = $('#poNo');
			if(productTypeData==null){
				select.find('option').remove();
				$("#upload").attr('status','false');
				$("#upload").hide();
				return;
			}
			
			if(productTypeData.fileUpload==false){
				
				$("#upload").attr('status','false');
				$("#upload").hide();
			}else{
				$("#upload").attr('status',undefined);
				$("#upload").show();
			}
			select.find('option').remove();
			/*$.each(obj, function( index, value ) {
				var select = $('#poNo');
				//$('<option>').val(index).text(value).appendTo(select);
				$('<option>').val(obj[index].id).text(obj[index].poNumber).appendTo(select);
			});*/
			for(var index = 0;index<obj.length;index++){
				var select = $('#poNo');
				//$('<option>').val(index).text(value).appendTo(select);
				$('<option>').val(obj[index].id).text(obj[index].poNumber).appendTo(select);
			}
			
		}
	});
		}


}




function getpath(uploadFilePath)
{
//	alert($('#'+uploadFilePath).val());
}

