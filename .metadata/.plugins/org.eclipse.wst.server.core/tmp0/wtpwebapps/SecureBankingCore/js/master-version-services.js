var services = new Array();
var categories = new Array();
var mWallet=[];
function addMasterServices(obj,count) {
	var	finalStr;
	var serviceId = obj.value;
	var catId=serviceId.substring(serviceId.indexOf("#")+1);
	var str=serviceId.substring(0,serviceId.indexOf("#"));
	str = str.replace('{','').replace('}','');
	str = str.split("-");
	var str2 = str[0].split("=");
	var dd = "Test"+Number(str[1]);
	if(dd != "TestNaN")
		finalStr = str2[0]+"-"+str[1];
	else 
		finalStr = str2[0]+"-"+str[2];
	var pos = services.indexOf(finalStr);
	if(pos < 0) {
		services.push(finalStr);
	} else {
		delete services[pos];
	}
	if(parseInt(count)==0){
		if(serviceId.includes("M-Wallet")){
			mWallet.push(finalStr);
		}	
	}
	document.getElementById("services").value = services;
	if(parseInt(catId)!=0){
	var catPos=categories.indexOf(catId);
	if(parseInt(count)==0){
		categories.push(catId);
	}else{
	if($(obj).prop("checked") == true) {
		categories.push(catId);
		$('#cat'+catId).show();
	} else if($(obj).prop("checked") == false){
		categories.splice(catPos, 1);
		var catPosNew=categories.indexOf(catId);
		if(catPosNew < 0) {
		$('#cat'+catId).hide();
		}
	}
	if(categories.length==0){
		$('#categoriesId').hide();
	}else{
		$('#categoriesId').show();
	
	}
	}
	}
	var mvCount=0;
	for(var k=0;k<mWallet.length;k++){
		if(services.includes(mWallet[k])){
			mvCount++;
		}		
	}
	if(mvCount>0){
		$('#walletTable').show();
		$('#walletRows').show();
	}else{
		$('#walletTable').hide();
		$('#walletRows').hide();
	}
}
