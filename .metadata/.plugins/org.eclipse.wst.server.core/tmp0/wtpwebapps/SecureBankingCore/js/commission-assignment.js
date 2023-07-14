/**
 *  Author : Ram Kumar
 */
$(document).ready(function(){
	 $("#btnId").click(function() {
		 var serviceName=$("#serviceId").val();
		 var partnerId=$("#partnerId").val();
		 if(partnerId!=''){
			 getData(serviceName,partnerId);
			 
			 $('#partnerErrorId').html("");
		 }
		 else{
			$('#partnerErrorId').html("<b><font color='red'>Select partner</font></b>");
			return false;
		 }
		 
	 });
	 
	 
	 $("#partnerId").change(function() {
		 $('#partnerErrorId').html("");
	 });
	 
	
});



function getData(serviceName,partnerId){
	//========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getData',
		  type: 'POST',
		  dataType: "json",
		  data: 'serviceName='+serviceName+'&partnerId='+partnerId,
		  success: function(data) {
			 // alert(JSON.stringify(data));
			  displayData(data);
		  }
	});

}

function displayData(data){
	$("#dataTable").show();
	$("#headId").html(data.serviceName);
	var table=document.getElementById("dataTable");
	var numrows=table.rows.length;
	while(numrows>2)
	table.deleteRow(--numrows);
	$.each(data.dataMap, function(key, value) {
		var tr=table.insertRow();
		var td=tr.insertCell();
		td.innerHTML=value;
		
		var td=tr.insertCell();
		var select =document.createElement("select");
		select.options[select.options.length] = new Option("Commission Template","0");
		select.setAttribute("name","dataList");
		select.setAttribute("id","data"+key);
		
		$.each(data.templateMap, function(key1, value) {
			select.options[select.options.length] = new Option(value,key+"#"+key1);
		});
		td.appendChild(select);
		
		
		
		$("#assignBtn").show();
		
	});
}




