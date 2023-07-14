function subscriberDetail(id){
	var link=$("input[name=link]:hidden").val();
	var menuId=$("#menuId").val();
	var submenuId=$("#submenuId").val();
	link=link+"/AdminUI/kycController/approveKYCData?&subsId="+id+'&menuId='+menuId+'&submenuId='+submenuId;
		window.location.replace(link);
	
	
}