var totalCount=0;
function validateToBeShipped(){
	var unitsInStock=$('#lab_Unit_Instock').val();
	var unitsToBeShipped=$('#lab_Tobe_Shipped').val();
}


function validateUnitInstock(units,id)
{
	var textval= $("#orderforlist_"+id).val();
	if(textval.length==0)
	{
		$("#shiptextboxErrorId").html("<font color='red'>Please fill Number of units</font>");
		return false;
	}
	if(Number(textval)>Number(units))
	{
		$("#shiptextboxErrorId").html("<font color='red'>Cannot ship more than available units in stock</font>");
		return false;
	}
	else
	{
		/*$("#shiptextboxErrorId").html("<font color='red'><b>Can not ship more than	 available units in stock</b></font>");
            	 return false;*/
	}
}
function getPackage(textId,mv,producttype)
{
	var textval= $("#orderforlist_"+textId).val();
	var product =producttype;
	
	$.ajax({
		url: 'ajax/getGrouping',
		type: 'post',
		dataType: "json",
		data: 'textval='+textval+'&product='+product,
		success:function(response){
			$('#overlayId').show();
			var select = $('#group');
			select.find('option').remove();
			$('<option>').val("").text("").appendTo(select);
			//$.each(JSON.parse(response), function(index, value) {
			$.each(response, function(index, value) {
				var numbers = value.match(/\d+/g).map(Number);

				$('<option>').val(index).text(value).appendTo(select);
			});
		}
	});
}
function getpackages()
{
	var idss=$('#acId').val();
	totalCount=0;
	$('#noOfBox').val("");
	var mv=$('#mv').val();
	/*var iddd=$('#orderforlist_'+id).val()*/
	var product=$('#product').val();
	var groupType=$('#group').val();
	var tableId='ckBoxIds';
	$('#ckBoxIds').html("");
	$.ajax({
		url: 'ajax/getPackages',
		type: 'post',
		dataType: "json",
		data: 'mv='+mv+'&product='+product+'&groupType='+groupType,
		success:function(response){
			var packageids="";
			var arr = [];
			if(response.length>0){
			//arr = JSON.parse(response);
				arr = response;
			}
			for(var i=0;i<arr.length;i++)
			{
				packageids=packageids+","+arr[i].id;
				var html='<tr height="30">'+
				'<td align="center"><input type="checkbox" id="chk_'+arr[i].id+'" name="packagingchk" value="'+arr[i].id+'#'+arr[i].quantity+'" onclick="return chkBox('+idss+','+arr[i].id+','+arr[i].quantity+')"/></td>'+
				'<td align="center">'+arr[i].name+'</td>'+
				'<td align="center">'+arr[i].seriesfrom+'</td>'+
				'<td align="center">'+arr[i].seriesto+'</td>'+
				'</tr';
				$(html).appendTo($("#"+tableId));
			}	
			
			
			$("#packageids").val(packageids);
		}});
}

function chkBox(id,chkId,qty)
{
	$("#shipPackageId").attr('disabled','disabled');
	var txtId=$('#orderforlist_'+id).val();
	var checkedVal = 0;
	$('input[type=checkbox]').each(function () {
      if(this.checked){
    	  var currentChk=$(this).val();
  		var res = currentChk.split("#");
  		checkedVal+=Number(res[1]);
  		$('#noOfBox').val(checkedVal);
      }
      
}
	
);
	if(txtId<checkedVal||txtId>checkedVal)
	{
		$("#quantityErrorId").show();
		$("#quantityErrorId").html("<p class='text-danger'>Shipped quantity can't be more then asked for quantity.</p>");
		//$("#chk_"+chkId).prop('checked',false);
		//return false;
	}
	else
	{
		$("#quantityErrorId").html("");
		$('#noOfBox').val(txtId);
		
		$("#shipPackageId").removeAttr('disabled');
	}

	/*
	var txtId=$('#orderforlist_'+id).val();
	var shipQuant=$('#noOfBox').val();
	if ($('#chk_'+chkId).is(":checked")) 
	{
		var currentChk=$('#chk_'+chkId).val();
		var res = currentChk.split("#");
		totalCount+=Number(res[1]);
		if(txtId>totalCount)
		{
			$("#quantityErrorId").show();
			$("#quantityErrorId").html("<p class='text-danger'>Shipped quantity can't be more then asked for quantity.</p>");
			$("#chk_"+chkId).prop('checked',false);
			return false;
		}
		else
		{
			$('#noOfBox').val(txtId);
		}}
	else
	{
		var currentUnChk=$('#chk_'+chkId).val();
		var rest = currentUnChk.split("#");
		totalCount-=Number(rest[1]);
		$('#noOfBox').val(totalCount);
	}
	*/
}


$(document).ready(function() {
	$("#shipPackageId").attr('disabled','disabled');
/*	$('#table_id').DataTable( {
		"scrollY":        "200px",
		"scrollCollapse": true,
		"paging":         false
	} );*/
	/*$('#table_id1').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false
    } );
	 $('#table_id2').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false
    } );
	  $('#table_id3').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false
    } );*/
} );

