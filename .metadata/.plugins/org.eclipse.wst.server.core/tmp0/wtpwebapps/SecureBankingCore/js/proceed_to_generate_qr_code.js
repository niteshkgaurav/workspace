$(document).ready(
function(){
	loadListener();
}

);

var loadListener = function(){
	$('#selectAll').change(selectAll);
	$(".cbx").change(changeSelected);
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


