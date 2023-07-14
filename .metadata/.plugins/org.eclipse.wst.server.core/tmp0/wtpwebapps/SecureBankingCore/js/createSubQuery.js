var count=1;

function addMoreRow(tableId){
	if(count<1)
	{
		$("#tabb").show();
		$('#removeB').show();
		count++;
	}
	else{
	var prev=$('#uploadFilePath'+count-1).val();
	if($("#tabb").children().last().children().val().length>0)
		{
	var  id = 'uploadFilePath'+count;
	var more=$('#divId').clone(false);
	$("#tabb").append(more);
	$("#tabb").children().last().children().val("");;
	$("#tabb").children().last().children().attr('id',id);
//	$('#uploadFilePath'+count).val('');
	count++;
		}
	}
}


function deleteRow()
{
	if(count>1)
		{
	$("#tabb").children().last().remove();
		}
	else
		{
		$("#tabb").children().last().children().val("");
		/*$('#removeB').hide();
		$("#tabb").hide();*/
		}
	count--;
}


