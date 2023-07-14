function validatePackingGroup()
{
	var alphaRegex=/^([a-zA-Z0-9 _-]+)$/;
	var numberRegex=/^\d+$/;
	var data=$("#quantity").val();
	var groupName=$("#groupName").val();
	var productType= $('#productType').val();
	$('.levelDiv').removeClass('has-error');
	if(productType==0)
	{
		$('#lab_productErrorId').show();
		$('#lab_productErrorId').html("<p class='text-danger'>Kindly Select product type.</p>");
		return false;
	}
	
	if($("#levelNumber").val()==""){
		
		$('.levelDiv').addClass('has-error');
		return false;
	}
	if($("#levelNumber").val()>=0){
		var productType = $("#productType").val();
		if(productType ==0){
			$('#lab_productErrorId').show();
			$('#lab_productErrorId').html("<p class='text-danger'>Kindly Select product type.</p>");
			return false;
		}
		//getGroupsByProductType(productType,$("#levelNumber").val())
	}
	
	if(groupName=="")
	{
		$("#groupName").val('')
		$("#groupNameErrorId").show();
		$("#groupNameErrorId").html("<p class='text-danger'>kindly provide valid name.</p>");
		return false;
	}
	if(!alphaRegex.test(groupName)){
		$("#groupName").val('')
		$("#groupNameErrorId").show();
		$("#groupNameErrorId").html("<p class='text-danger'>kindly provide valid name.</p>");
		return false;
	}
	if(data=="")
	{
		$("#quantity").val('')
		$("#quantityErrorId").show();
		$("#quantityErrorId").html("<p class='text-danger'>Please enter valid quantity.</p>");
		return false;
	}
	if(!numberRegex.test(data)){
		$("#quantity").val('')
		$("#quantityErrorId").show();
		$("#quantityErrorId").html("<p class='text-danger'>Please enter valid quantity.</p>");
		return false;
	}
}

function makeBoxFromQuantity()
{
	$("#quantityErrorId").html("");
	var data=$("#quantity").val();
	if(data!="")
	{
		var parentId=$("#parentId").val();
		if(parentId!="" && parentId!=0)
		{
			/*if (data%10 == 0)
			{*/
				$.ajax({
					type: "post",
					url: "ajax/getParentGroupSize",
					dataType: "json",
					data:"parentId="+parentId,
					success: function(response){
						var size=response;
						var boxQuantity=size*data;
						$("#noOfBox").val(boxQuantity);
					}
				});
			/*}
			else
			{
				$("#quantityErrorId").show();
				$("#quantityErrorId").html("<p class='text-danger'>Quantity must be in multiple of 10.</p>");
				return false;
			}*/
		}
	}
}
function removequantity()
{
	$("#quantity").val('');
	$("#noOfBox").val('');
}

function checkName()
{
	var groupName=$("#groupName").val();
	$.ajax({
		type: "post",
		url: "ajax/checkGroupName",
		data:"groupName="+groupName,
		success: function(response){
			if(response==0)
			{
				$("#groupName").val('')
				$("#groupNameErrorId").show();
				$("#groupNameErrorId").html("<p class='text-danger'>Group name already exist.</p>");
				return false;
			}
		}
	});
}



function getGroupsForSelectedProduct(){
	$('.productDiv').removeClass('has-error');
	var productType = $("#productType").val();
	if( productType!="0"){
		//getGroupsByProductType(productType,$("#levelNumber").val())
		var levelNumber = $("#levelNumber").val();
		if(levelNumber==0){
			$(".consistsOfGroup").hide()
			$("#parentId").val($("#parentId option:first").val());
		}else{
			getGroupsByProductType(productType,levelNumber);
			$(".consistsOfGroup").show()
		}
	
		
	}else{
		$('.productDiv').addClass('has-error');
		return false;
	}
}
 function getGroupsByProductType(productType,levelNumber){
	
	$.ajax({
		type: "get",
		url: "ajax/get-groups?productType="+productType+"&levelNumber="+levelNumber,
		async:false,
		dataType: "json",
		success: function(response){
			$("#parentId").empty();
			var optionString = "<option value='' ></option>";
			var arraySize =[];
			arraySize = response.responseEntityList;
			$.each(arraySize, function( index, value ) {
				optionString+=	"<option value="+arraySize[index].id+">"+arraySize[index].groupName+"</option>";
				});
			$("#parentId").append(optionString);
		},error:function(ex){
			alert(ex);
		}
	});
}

 function changeLevel(){
	var productType = $("#productType").val();
	if(productType!=""){
		 getPackageGroupsByProductType(productType);
	}
	
	 $("#levelNumber").val($("#levelNumber option:first").val());
 }

 
 function getPackageGroupsByProductType(productType){
		
		$.ajax({
			type: "get",
			url: "ajax/get-max-level?productType="+productType,
			async:false,
			dataType: "json",
			success: function(response){
				$("#levelNumber").empty();
				var optionString = "<option value='' ></option>";
				var arraySize =0;
				arraySize = response.responseEntity.levelNumber;
				var i=(arraySize>0)?1:0;
				for(;i<=arraySize;i++)
				{
					optionString+=	"<option value="+i+">"+i+"</option>";
				}
					
			
				$("#levelNumber").append(optionString);
			},error:function(ex){
				alert(ex);
			}
		});
	}

//ajax/get-groups