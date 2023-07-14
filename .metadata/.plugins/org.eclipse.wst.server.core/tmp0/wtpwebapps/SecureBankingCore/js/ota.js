/**
 * 
 */
function validateForm(){
	//
	if($("#hostSubVersionId").val()==''){
		$('#hsvError').html("<b><font color='red'>Select Host Sub-Version.</font></b>");
		return false;
	}
}