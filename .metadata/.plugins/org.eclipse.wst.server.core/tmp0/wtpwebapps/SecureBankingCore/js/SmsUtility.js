function smsCheck(event)
{
	var status = true;
	var contactNo = $('#contactNo').val().trim();
	var message = $('#message').val().trim();
	if(contacNo.length==0)
	{
		$('#lab_contactNumberErrorId').html("<font color='red'><br>Kindly fill Contact No.!!</br></font>");
		status = false;
	}
	if(message.length==0)
	{
		$('#lab_messageErrorId').html("<font color='red'><br>Kindly fill Message !!</br></font>");
		status = false;
	}
	if(!status)
	{
		event.preventDefault();
		return false;
	}
}