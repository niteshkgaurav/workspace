function populateForEdit(idProofId,idProofName,idProofDesc)
{
	$('#idProofId').val(idProofId);
	$('#idProofName').val(idProofName);
	$('#idProofDescription').val(idProofDesc);
	$('#submitBtn').attr('value','Edit');
}

function checkIdProof(event)
{
	var idProofName = $('#idProofName').val();
	var idProofDesc = $('#idProofDescription').val();
	var check = true;
	if(idProofName.trim().length==0)
	{
		$('#lab_IdProofNameErrorid').html("<b><font color='red'>Id-Proof Name Cannot be Blank !</font></b>");
		$('#idProofName').val('');
		check = false;
	}
	if(idProofDesc.trim().length==0)
	{
		$('#lab_IdProofDescriptionErrorId').html("<b><font color='red'>Id-Proof Description Cannot be Blank !</font></b>");
		$('#idProofDescription').val('');
		check = false;
	}
	if(!(check))
	{
		event.preventDefault();
		return check;
	}
	else
	{
		$('#idProofsForm').submit();
	}
}