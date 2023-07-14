function validateShortShipmentWithFilter(event)
{
	var orderNo = $('#orderNo').val();
	if(orderNo=='')
	{
		$('#lab_orderNoErrorId').html("<font color='red'><b>Kindly select Order No</b></font>");
		event.preventDefault();
		return false;
	}
}