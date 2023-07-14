function clearScreen()
{
	$('#serialNo').val('');
	$('#pinStatus').val('');
	$('#denomination').val('');
	$('#portal').val('');
	$('#ip').val('');
	$('#usedDate').val('');
	$('#creationDate').val('');
	$('#expiryDate').val('');
	$('#portalTxnStatus').val('');
}

function validateSerialNo(event)
{
	var serialNo = $('#serialNo').val();
	var status = true;
	if(serialNo.trim().length==0)
	{
		$('#lab_serialNoErrorId').html("<font color='red'><b>Kindly fill Serial No.</b></font>");
		status = false;
	}
	if(!status)
	{
		event.preventDefault();
	}
}