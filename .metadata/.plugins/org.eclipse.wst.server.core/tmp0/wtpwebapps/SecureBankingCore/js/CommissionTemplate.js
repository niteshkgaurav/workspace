var temp=0;
$(document).ready( function (){
	 var afterAddmess='${sucessMessage}';
	 if(afterAddmess=='')
	 {
		 $("#after_commTempSaved_mess").hide();
     }
	 var submitFlag=true;
	 $("form").submit(function(){
		 submitFlag=true;
		
		/* var hostName=$("#hostName").val(); 
		 if(hostName=='-1'){
			 $('#errmsgHostName').html("<b><font color='red'>Kindly select Host Name !</font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgHostName').hide();
		 }*/
		 
		 
		 var tempName=$("#tempName").val().trim();
		 if(tempName.length<=0){
			 $('#errmsgTempName').html("<b><font color='red'>Template Name can not be blank </font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgTempName').hide();
		 }
		
		 var templateCommType=$("#templateCommType").val(); 
		 if(templateCommType=='-1'){
			 $('#errmsgTemplateCommType').html("<b><font color='red'>Kindly select Commission Type </font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgTemplateCommType').hide();
		 }
		 var customerCommission=$("#customerCommission").val(); 
		 if(customerCommission=='-1' && (templateCommType=='BOTH' || templateCommType=='CUST')){
			 $('#errmsgCustomerCommission').show();
			 $('#errmsgCustomerCommission').html("<b><font color='red'>Kindly select Customer Commission </font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommission').hide();
		 }
		 var customerCommissionType=$("#customerCommissionType").val(); 
		 if(customerCommissionType=='-1'  && (templateCommType=='BOTH' || templateCommType=='CUST')){
			 $('#errmsgCustomerCommissionType').show();
			 $('#errmsgCustomerCommissionType').html("<b><font color='red'>Kindly select Customer Commission Type </font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionType').hide();
		 }
		 var custCommFixedValue;
		 if($("#custCommFixedValue").val().trim().length<=0){
			 custCommFixedValue=parseFloat('0.0');
		 }else{
			 custCommFixedValue=parseFloat($("#custCommFixedValue").val().trim());
		 }
		 if(custCommFixedValue==0 && (templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionFixedValue').show();
			 $('#errmsgCustomerCommissionFixedValue').html("<b><font color='red'>Customer Commission Fixed Value should be greater than 0 </font></b>");
			
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionFixedValue').hide();
		 }
		 var custCommFixedMin;
		 var custCommFixedMax;
		 if($("#custCommFixedMin").val().trim().length<=0){
			 custCommFixedMin=parseFloat('0.0');
		 }else{
			 custCommFixedMin=parseFloat($("#custCommFixedMin").val().trim());
		 }
		 if($("#custCommFixedMax").val().trim().length<=0){
			 custCommFixedMax=parseFloat('0.0');
		 }else{
			 custCommFixedMax=parseFloat($("#custCommFixedMax").val().trim());
		 }
		 if(custCommFixedMin==0 && custCommFixedMax>0 && (templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMinValue').show();
			 $('#errmsgCustomerCommissionMinValue').html("<b><font color='red'> Min Value needs to be greater than 0, If Max Value is there </font></b>");
			
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionMinValue').hide();
		 }
		 if(custCommFixedMax==0 && custCommFixedMin>0  && (templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMaxValue').show();
			 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'> Max Value needs to be greater than 0, If Min Value is there </font></b>");
			 
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionMaxValue').hide();
		 
		 } 
		 if(custCommFixedMin>0 && custCommFixedMax>0 && (custCommFixedMax-custCommFixedMin)<=0 && (templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMaxValue').show();
			 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'> Max Value needs to be greater than Min Value </font></b>");
			 
			 submitFlag=false;
		 }
		 if((templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='RANGE'){
			
			 var submitFlag1=checkRangeValues('customerRangeTable','CUST');
			
			 if(!submitFlag1){
				
				 submitFlag=false;
			 }
		 }else{
			 $('#errmsgCustomerRangeValue').hide();
		 } 
		 // Partner Validation
		 var partnerCommission=$("#partnerCommission").val(); 
		 if(partnerCommission=='-1' && (templateCommType=='BOTH' || templateCommType=='PART')){
			 $('#errmsgPartnerCommission').show();
			 $('#errmsgPartnerCommission').html("<b><font color='red'>Kindly select Partner Commission </font></b>");
		
			 submitFlag=false;
		 }else{
			 $('#errmsgPartnerCommission').hide();
		 }
		 var partnerCommissionType=$("#partnerCommissionType").val(); 
		 if(partnerCommissionType=='-1'  && (templateCommType=='BOTH' || templateCommType=='PART')){
			 $('#errmsgPartnerCommissionType').show();
			 $('#errmsgPartnerCommissionType').html("<b><font color='red'>Kindly select Partner Commission Type </font></b>");
			
			 submitFlag=false;
		 }else{
			 $('#errmsgPartnerCommissionType').hide();
		 }
		 var partnerCommFixedValue;
		 if($("#partnerCommFixedValue").val().trim().length<=0){
			 partnerCommFixedValue=parseFloat('0.0');
		 }else{
			 partnerCommFixedValue=parseFloat($("#partnerCommFixedValue").val().trim());
		 }
		 if(partnerCommFixedValue==0 && (templateCommType=='BOTH' || templateCommType=='PART') && partnerCommissionType=='FIXED'){
			 $('#errmsgPartnerCommissionFixedValue').show();
			 $('#errmsgPartnerCommissionFixedValue').html("<b><font color='red'>Partner Commission Fixed Value should be greater than 0 !</font></b>");
			 submitFlag=false;
			 
		 }else{
			 $('#errmsgPartnerCommissionFixedValue').hide();
		 }
		 var partnerCommFixedMin;
		 var partnerCommFixedMax;
		 if($("#partnerCommFixedMin").val().trim().length<=0){
			 partnerCommFixedMin=parseFloat('0.0');
		 }else{
			 partnerCommFixedMin=parseFloat($("#partnerCommFixedMin").val().trim());
		 }
		 if($("#partnerCommFixedMax").val().trim().length<=0){
			 partnerCommFixedMax=parseFloat('0.0');
		 }else{
			 partnerCommFixedMax=parseFloat($("#partnerCommFixedMax").val().trim());
		 }
		 if(partnerCommFixedMin==0 && partnerCommFixedMax>0 && (templateCommType=='BOTH' || templateCommType=='PART') && partnerCommissionType=='FIXED'){
			 $('#errmsgPartnerCommissionMinValue').show();
			 $('#errmsgPartnerCommissionMinValue').html("<b><font color='red'>Partner Commission Min Value needs to be greater than 0, If Max Value is there !</font></b>");
		
			 submitFlag=false;
		 }else{
			 $('#errmsgPartnerCommissionMinValue').hide();
		 }
		 if(partnerCommFixedMax==0 && partnerCommFixedMin>0  && (templateCommType=='BOTH' || templateCommType=='PART') && partnerCommissionType=='FIXED'){
			 $('#errmsgPartnerCommissionMaxValue').show();
			 $('#errmsgPartnerCommissionMaxValue').html("<b><font color='red'>Partner Commission Max Value needs to be greater than 0, If Min Value is there !</font></b>");
			
			 submitFlag=false;
		 }else{
			 $('#errmsgPartnerCommissionMaxValue').hide();
		 } 
		 if(partnerCommFixedMin>0 && partnerCommFixedMax>0 && (partnerCommFixedMax-partnerCommFixedMin)<=0 && (templateCommType=='BOTH' || templateCommType=='PART') && partnerCommissionType=='FIXED'){
			 $('#errmsgPartnerCommissionMaxValue').show();
			 $('#errmsgPartnerCommissionMaxValue').html("<b><font color='red'>Partner Commission Max Value needs to be greater than Min Value !</font></b>");
			
			 submitFlag=false;
		 }
		 if((templateCommType=='BOTH' || templateCommType=='PART') && partnerCommissionType=='RANGE'){
			 //alert("partner range")
	              
			 var submitFlag1=checkRangeValues('partnerRangeTable','PART');
			 if(!submitFlag1){
				 submitFlag=false;
				 
			 }
		 }else{
			 $('#errmsgPartnerRangeValue').hide();
		 }
		 if(submitFlag)
		 {
			 
			 
		 }
		 else
		 {
			 /*alert('prevent')
			 event.preventDefault();*/
			 return submitFlag
		 }
	  });
		    	
    }); 


function checkRangeValues(tableID,custOrPartMsgId) {
	var count=0;
	var count1=0;
	var submitFlag=true;
    try {
	    var table = document.getElementById(tableID);
	    var rowCount = table.rows.length;
	   // alert(rowCount);
	    if(rowCount==1){
	    	 submitFlag=false;
	    	if(custOrPartMsgId=='CUST'){
				$('#errmsgCustomerRangeValue').html("<b><font color='red'> Minimum one range needs to be defined </font></b>");
	    		$('#errmsgCustomerRangeValue').show();
	    	}else{
	    		$('#errmsgPartnerRangeValue').show();
				$('#errmsgPartnerRangeValue').html("<b><font color='red'> Minimum one range needs to be defined </font></b>");
	    	}
	    }else{
	    	if(custOrPartMsgId=='PORTAL'){
	    		$('#errmsgCustomerRangeValue').hide();
	    	}else{
	    		$('#errmsgPartnerRangeValue').hide();
	    	}
	    }
	    if(rowCount>1){
		    for(var i=1;i<rowCount;i++){
		    	var row = table.rows[i];
		    	var from,to,value; 
		    	var check=true;
		    	if(typeof row.cells[0].childNodes[0].value!="undefined"){
		    		if(row.cells[0].childNodes[0].value.trim().length<=0){
		    			submitFlag=false;
			    		check=false;
			    		count++;
    					
				    	if(count<=1){
			    		if(custOrPartMsgId=='CUST'){
			    			
	    					
					 
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> From field should have some value </font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> From field should have some value </font></b>");
			    		}
				    	}
			    	}
		    	}
		    
		    	if(typeof row.cells[1].childNodes[0].value!="undefined"){
		    		if(row.cells[1].childNodes[0].value.trim().length<=0){
		    			submitFlag=false;
			    		check=false;
			    		count++;
			    		if(count<=1){
			    		if(custOrPartMsgId=='CUST'){
			    			
			    			
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> To field should have some value </font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> To field should have some value !</font></b>");
			    		}
			    		}
			    	}
		    	}
		    	
		    	if(typeof row.cells[2].childNodes[0].value!="undefined"){ 
		    	
		    		if(row.cells[2].childNodes[0].value.trim().length<=0){
			    		 submitFlag=false;
			    		check=false;
			    		count++;
			    		if(count<=1){
			    		if(custOrPartMsgId=='CUST'){
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> Value field should have some value </font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> Value field should have some value </font></b>");
			    		}
			    		}
			    	}
		    	}
		    	
		    	if(check){
			    	var from;
		    	
			    	
		    		if(typeof row.cells[0].childNodes[0].value!="undefined"){
			    		from=parseFloat(row.cells[0].childNodes[0].value.trim());
			    		
			    	}
		    		var to;
		    		if(typeof row.cells[1].childNodes[0].value!="undefined"){
		    			to=parseFloat(row.cells[1].childNodes[0].value.trim());
		    		}
		    		var value;
		    		if(typeof row.cells[2].childNodes[0].value!="undefined"){
		    			value=parseFloat(row.cells[2].childNodes[0].value.trim());
		    		}
		    		if(i>1){
		    			currentFrom=from;
		    			var previosRow = table.rows[i-1];
		    			var previousTo=parseFloat(previosRow.cells[1].childNodes[0].value.trim());
		    			
		    			if(currentFrom!=previousTo+1){
		    				 submitFlag=false;
		    				if(custOrPartMsgId=='CUST'){
		    					count++;
		    					 
		    					    	if(count<=1){	
		    					    		
		    					    	
		    					$('#errmsgCustomerRangeValue').show();
								$('#errmsgCustomerRangeValue').html("<b><font color='red'> Row No. : "+i+" From should be " + (previousTo+1) + " !</font></b>");
								try{
									 
								                  
	    					      document.getElementById("sysConfigRangeCustomer["+i+"].min").style.borderColor="#FF0000";
								                  }
								catch(e)
								{
								}
		    					    	}
		    				}
		    				if(custOrPartMsgId=='PART'){
		    					count++;
		    					if(count<=1){
		    					
			    				$('#errmsgPartnerRangeValue').show();
								$('#errmsgPartnerRangeValue').html("<b><font color='red'> Row No. : "+i+" From should be " + (previousTo+1) + " !</font></b>");
								document.getElementById("sysConfigRangePartner["+i+"].min").style.borderColor="#FF0000";
		    					}	
		    				}
		    			}
		    		}
		    		if(to<=from ){
		    			 submitFlag=false;
		    			if(custOrPartMsgId=='CUST'){
		    				try{
		    				count++
		    				if(count<=1)
		    					{
		    				  
		    					$('#errmsgCustomerRangeValue').show();
		    					$('#errmsgCustomerRangeValue').html("<b><font color='red'> To Field should be greater than From Field</font></b>");
		    					 document.getElementById("sysConfigRangeCustomer["+i+"].max").style.borderColor="#FF0000";
		    					}
		    				}
		    				catch(e)
		    				{
		    				}
		    			}else{
		    					$('#errmsgPartnerRangeValue').show();
		    					$('#errmsgPartnerRangeValue').html("<b><font color='red'> To Field should be greater than From Field</font></b>");
		    				}
			    	}
		    	}
		    }
	    }
    }catch(e) {
     
    }
    if(submitFlag){
    	return submitFlag;	
    }else{
    	
    }
    
}

$(document).ready(function() {
	
	$('#customerCommission').change(function() {
		
		$('#customerFixedTable').hide();
		$('#custCommFixedValue').val('');
		$('#customerCommissionType').val("-1");
		$('#customerRangeTable').hide();
		$('#addremoveID').hide();
		
	});
	
});
$(document).ready(function() {
	
	$('#partnerCommission').change(function() {
		
		$('#partnerRangeTable').hide();
		$('#partnerCommFixedValue').val('');
		$('#partnerCommissionType').val("-1");
		//$('#customerRangeTable').hide();
	//	$('#addremoveID').hide();
		$("#partrowId").hide();
		$("#partnerFixedTable").hide();
		
	});
	
});
 
 $(document).ready(function() {
	   	$('#customerCommissionType').change(function () {
	   		$('#custCommFixedValue').val('');
	   		$('#customerRangeTable tr').filter(function() {
	                 $(this).find(':text').val('');
	   		});
	   		
	   	$('#errmsgCustomerCommissionFixedValue').html("");
	  	    var val = $(this).val();
	   	    if (val == 'FIXED') {
	   	 	$('#customerFixedTable').show();
	   	 	$('#customerRangeTable').hide();
	   	 	$('#addremoveID').hide();
	   	 	$('#custCommFixedMinrow').hide();
	   	 	$('#custCommFixedMaxrow').hide();
   	    	if($('#customerCommission').val()==='AMT')
   	    	{
   	    		$('#customerRangeMainTable').hide();
	   	    	$('#customerRangeTable').hide();
   	    	}	   	    
   	    	else if($('#customerCommission').val()==='PERC')
   	    	{
   	    		$('#customerRangeMainTable').show();
   	    		$('#customerRangeTable').show();
   	    		$('#custCommFixedMinId').show();
   	    		$('#custCommFixedMaxId').show();
   	    		$('#customerRangeTable').hide();
   	    	}
   	    	} else if (val == 'RANGE'){
	   	 	$('#customerFixedTable').hide();
	   	 $('#addremoveID').show();
   	    	if($('#customerCommission').val()==='AMT')
   	    	{
   	    		$('#customerRangeMainTable').show();
   	    		$('#customerRangeTable').show();
   	    		$('#custCommFixedMinId').hide();
   	    		$('#custCommFixedMaxId').hide();
   	    	}
   	    	else if($('#customerCommission').val()==='PERC')
   	    	{
   	    		$('#customerRangeMainTable').show();
   	    		$('#customerRangeTable').show();
   	    		$('#custCommFixedMinId').show();
   	    		$('#custCommFixedMaxId').show();
   	    	}
	   	    }
	   });
	  });
	 
 
 $(document).ready(function() {
	   	$('#partnerCommissionType').change(function () {
	  	    var val = $(this).val();
	   	    if (val == 'FIXED') {
	   	    	$('#partnerFixedTable').show();
	   	    	$('#partnerCommFixedValue').val('');
	   	    	$('#partnerRangeTable').hide();
	   	    	$('#partnerRangeMainTable').hide();
	   	    	//$('#customerRangeTable').hide();
	   	    	$("#partnerCommFixedMinrow").hide();
	   	    	$("#partnerCommFixedMaxrow").hide();
	   	    } else if (val == 'RANGE'){
	   	    	$('#customerRangeTable tr').filter(function() {
	                 $(this).find(':text').val('');
	   		});
	   	    	$("#partnerFixedTable").show();
	   	    	$('#partrowId').show();
	   	    	$('#partnerFixedTable').hide();
	   	    	$('#partnerRangeMainTable').show();
	   	    	$('#partnerRangeTable').show();
	   	    }
	   });
	  });
 
 $(document).ready(function() { 
	 $('#lowerMainTable').hide();
	 $('#partnerRangeMainTable').hide();
	 $('#customerRangeMainTable').hide();
	 $('#customerFixedTable').hide();
	 $('#partnerFixedTable').hide();
	 
	 showCommissionType('templateCommType');
	 showCustomerRangeOrFixed('customerCommissionType');
	 showPartnerRangeOrFixed('partnerCommissionType');
	 
	 
 });
 
 function showCustomerRangeOrFixed(id){
	 var val = $("#"+id).val();
	  if (val == 'FIXED') {
 	    	$('#customerFixedTable').show();
 	    	$('#customerRangeMainTable').hide();
 	    	$('#customerRangeTable').hide();
 	    } else if (val == 'RANGE'){
 	    	$('#customerFixedTable').hide();
   	    	if($('#customerCommission').val()==='AMT')
   	    	{
   	    		$('#customerRangeMainTable').show();
   	    		$('#customerRangeTable').show();
   	    		$('#custCommFixedMinId').hide();
   	    		$('#custCommFixedMaxId').hide();
   	    	}
   	    	else if($('#customerCommission').val()==='PERC')
   	    	{
   	    		$('#customerRangeMainTable').show();
   	    		$('#customerRangeTable').show();
   	    		$('#custCommFixedMinId').show();
   	    		$('#custCommFixedMaxId').show();
   	    	}
 	    }
 }
 
 function showPartnerRangeOrFixed(id){
	 var val = $("#"+id).val();
	  if (val == 'FIXED') {
 	    	$('#partnerFixedTable').show();
 	    	$('#partnerRangeTable').hide();
 	    	$('#partnerRangeMainTable').hide();
 	    } else if (val == 'RANGE'){
 	    	$('#partnerFixedTable').hide();
 	    	$('#partnerRangeMainTable').show();
 	    	$('#partnerRangeTable').show();
 	    	
 	    
 	    }
 }
 

 function addRow(tableID,passedType) {
	
	 $('#errmsgCustomerRangeValue').html("");
	 $('#errmsgPartnerRangeValue').html("");
     var table = document.getElementById(tableID);
     var   rowCount = table.rows.length;
     
     
    // temp=rowCount;
     var row = table.insertRow(rowCount);
     
    /*var cellMin = row.insertCell(0);
     cellMin.innerHTML=rowCount;
      var row1 = table.insertRow(rowCount+1);
      var cellMin1 =   row1.insertCell(0);
       var elementrow = document.createElement('div');
       elementrow.id=  "rowid["+rowCount+1+"]";
       elementrow.style.visibility="hidden";
     //alert(rowCount);
   //  elementrow.id=sysConfigRangeCustomer["+rowCount+"].row;
             //  alert();   
     cellMin1.setAttribute('id',rowCount);
       elementrow.innerHTML="<b><font color='red' > To should be greater than From </font></b>";
       cellMin1.appendChild(elementrow);*/
    
     var cellMin = row.insertCell(0);
     var elementMin = document.createElement("input");
     elementMin.type = "text";
     elementMin.size=7;
     elementMin.maxlength=6;
     elementMin.onfocus=function(){
    	$('#errmsgCustomerRangeValue').html('');
    	$('#errmsgPartnerRangeValue').html('');
    	
    	document.getElementById("sysConfigRangeCustomer["+rowCount-temp+"].min").style.borderColor="";
    	document.getElementById("sysConfigRangePartner["+rowCount+"].min").style.borderColor="";
    	
    	
    	     
     }
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementMin.name = "sysConfigRangeCustomer["+length+"].min";
    	 try{
    		 elementMin.id="sysConfigRangeCustomer["+length+"].min";
    	      
    	 }
    	 catch(e)
    	 {
    		 //alert(e);
    	 }
    	                             
     }else{
    	 elementMin.name = "sysConfigRangePartner["+length+"].min";
    	 elementMin.id="sysConfigRangePartner["+length+"].min";
     }
     cellMin.appendChild(elementMin);
     cellMin.onkeyup = function(){tableKeyUpEvent(elementMin); };
     cellMin.onkeypress = function(){tableKeyUpEvent(elementMin); };
     cellMin.onkeydown = function(){tableKeyUpEvent(elementMin); };
     cellMin.onchange = function(){tableKeyUpEvent(elementMin); 
     
     };
     
     
     var cellMax = row.insertCell(1);
     var elementMax = document.createElement("input");
     elementMax.type = "text";
     elementMax.size=7;
     elementMax.onfocus=function(){
     	$('#errmsgCustomerRangeValue').html('');
     	$('#errmsgPartnerRangeValue').html('');
     	document.getElementById("sysConfigRangeCustomer["+rowCount+"].max").style.borderColor="";
     	document.getElementById("sysConfigRangePartner["+rowCount+"].max").style.borderColor="";
     	
      }
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementMax.name = "sysConfigRangeCustomer["+length+"].max";
    	 elementMax.id = "sysConfigRangeCustomer["+length+"].max";
     }else{
    	 elementMax.name = "sysConfigRangePartner["+length+"].max";
    	 elementMax.id = "sysConfigRangePartner["+length+"].max";
     }
     cellMax.appendChild(elementMax);
     cellMax.onkeyup = function(){tableKeyUpEvent(elementMax); };
     cellMax.onkeypress = function(){tableKeyUpEvent(elementMax); };
     cellMax.onkeydown = function(){tableKeyUpEvent(elementMax); };
     cellMax.onchange = function(){tableKeyUpEvent(elementMax); };
     
     var cellValue = row.insertCell(2);
     var elementValue = document.createElement("input");
     elementValue.type = "text";
     elementValue.size=7;
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementValue.name = "sysConfigRangeCustomer["+length+"].value";
     }else{
    	 elementValue.name = "sysConfigRangePartner["+length+"].value";
     }
     cellValue.appendChild(elementValue);
     cellValue.onkeyup = function(){tableKeyUpEvent(elementValue); };
     cellValue.onkeypress = function(){tableKeyUpEvent(elementValue); };
     cellValue.onkeydown = function(){tableKeyUpEvent(elementValue); };
     cellValue.onchange = function(){tableKeyUpEvent(elementValue); };
     
    
     
   /*  var cellType = row.insertCell(3);
     cellType.innerHTML = rowCount + 1;
     cellType.name = "sysConfigRanges["+length+"].type";*/
     var cellType = row.insertCell(3);
     var del = document.createElement('input');
     del.setAttribute('type', 'button');
	    del.setAttribute('name', 'del');
	    del.setAttribute('value', 'Remove');
	    cellType.appendChild(del);
	    del.onclick=function(){
	    	try {
	    	   temp++;
	    	//   alert(temp);
	       	 $('#errmsgCustomerRangeValue').hide();
	       	$(this).closest( 'tr').remove();
	    	}
	    	
	    	catch(e)
	    	{
	    		//alert(e);
	    	}
	    	
     
     var cellType = row.insertCell(4);
     var elementType = document.createElement("input");
     elementType.type = "text";
     elementType.size=1;
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementType.name = "sysConfigRangeCustomer["+length+"].type";
     }else{
    	 elementType.name = "sysConfigRangePartner["+length+"].type";
     }
    
     
     elementType.value=passedType;
    
     cellType.appendChild(elementType);
     cellType.style.visibility = "hidden";
    

	    	
	    	
	    }
	  /*  try{
	    	var row1 = table.insertRow(rowCount+1);
	        var cellMin1 =   row1.insertCell(0);
	    var elementrow = document.createElement('tr');
	    alert(elementrow);
	     elementrow.id="errorrow["+rowCount+"]";
	     alert(elementrow.id);
	     elementrow.innerHTML="hi";
	   //  elementrow.innerHTML.visibility=""
	     
	     cellMin1.appendChild(elementrow);
	     
	    }
	    catch(e)
	    {
	    	alert(e);
	    }
*/ }
 
 
 

 function tableKeyUpEvent(elementValue){
	 elementValue.value= elementValue.value.replace(/[^\d.]/g, '');  
	 elementValue.maxLength=7;
 }
 
 function deleteRow(tableID) {
     try {
    	 $('#errmsgCustomerRangeValue').html("");
     var table = document.getElementById(tableID);
     var rowCount = table.rows.length;
     if(rowCount>1){
     	table.deleteRow(rowCount-1);
      }
     }catch(e) {
       //  alert(e);
     }
 }
 $(document).ready(function() {
	 $("#inputTax").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 
 $(document).ready(function() {
	 $("#inputSurcharge").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 
 $(document).ready(function() {
	 $("#custCommFixedValue").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 $(document).ready(function() {
	 $("#custCommFixedMin").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 $(document).ready(function() {
	 $("#custCommFixedMax").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 $(document).ready(function() {
	 $("#partnerCommFixedValue").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 $(document).ready(function() {
	 $("#partnerCommFixedMin").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });
 $(document).ready(function() {
	 $("#partnerCommFixedMax").keyup(function() {
		    var $this = $(this);
		    $this.val($this.val().replace(/[^\d.]/g, ''));        
	 });
	 });

 //============== functiont to show commission type ==================
 function showCommissionType(id){
	 	var val=$("#"+id).val();
	
	 	if(val == '-1')
		{
	 		
	 		$('#lowerMainTable').hide();
	    	$('#partnerTable').hide();
	    	$('#customerTable').hide();
		}
	 	else if (val == 'NO') {
	    	$('#lowerMainTable').hide();
	    } 
	 	else if (val == 'PART'){
	    	$('#lowerMainTable').show();
	    	$('#partnerTable').show();
	 	}
	 	else
	 	{
	 		$('#lowerMainTable').hide();
	    	$('#customerTable').hide();
	 	}
 }
 $(document).ready(function() {
		
		if($('#templateCommType').val()=='-1')
		{
				$('#lowerMainTable').hide();
		    	$('#customerTable').hide();
		}
	 if($('#templateCommType').val() == 'PART')
		 {
	    	$('#lowerMainTable').show();
	    	$('#partnerTable').show();
	 	    $('#customerTable').hide();
		 
		 }
	   	$('#templateCommType').change(function () {
	  	    var val = $(this).val();
	  	    $('#customerRangeMainTable').hide();
	  	    $('#partnerRangeTable').hide();
	  	    $('#partrowId').hide();
	  	    $('#partnerFixedTable').hide();
	  	   // 
	  	    $('#customerFixedTable').hide();
	  	    
	  	        
	  	    $('#errmsgCustomerCommission').hide();
	  	       $('#errmsgCustomerCommissionType').hide();
	  	       $('#customerCommission').val("-1");
	  	       $('#customerCommissionType').val("-1");
	  	       $('#partnerCommission').val("-1");
	  	       $('#partnerCommissionType').val("-1");
	  	       
	  	       
	  	    
	  	    
	  	    if(val == '-1')
	  	    {
	  	    	$('#lowerMainTable').hide();
		    	$('#customerTable').hide();
	  	    	
	  	    }
	  	    
	  	   
	   	    else if (val == 'PART')
	   	    {
		    	$('#lowerMainTable').show();
	   	    	$('#partnerTable').show();
	   	 	    $('#customerTable').hide();
	   	 	   
	    	}
	   	  else if (val == 'CUST')
	   	    {
		    	$('#lowerMainTable').show();
	   	    	$('#customerTable').show();
	   	    	$('#customerTable').show();
	   	    	$('#partnerTable').hide();
	   	    	
	   	    	
	   	    	$('#partnerTable').hide();
	    	}
	   	  else
	   		  {
	   		$('#lowerMainTable').show();
   	    	$('#customerTable').show();
   	    	$('#partnerTable').show();
   	    	
	   		  }
	   	    
	   });
	  });
 function getBack()
 {
	 window.history.back();
 }
 
 function checkActiveCommission()
 {
	 var portalName=$( "#accountStatus option:selected" ).val();
	 var portalId=$("#sysCommConfigId").val();
	 
	 if(portalName==1)
		 {
		$.ajax({
				url: 'ajax/checkActivePortal',
				type:'POST',
				data:'portalId='+portalId,
				
				success:function(response)
				{
					if(response=="ok")
					{
					}else
					{
						$('#errmsgActiveType').html("<font color='red'><b>This template is associated with "+response+" portals. Kindly dissociate them first. </b></font>");
						$('#accountStatus').val('0');
					}
				}
			});
		 }
	 else
		 {
		 $('#errmsgActiveType').html("");
		 }
	 } 

 function submitForm(formName,event)
 {
		 var afterAddmess='${sucessMessage}';
		 if(afterAddmess=='')
		 {
			 $("#after_commTempSaved_mess").hide();
	     }
		 var submitFlag=true;
		 
			
			/* var hostName=$("#hostName").val(); 
			 if(hostName=='-1'){
				 $('#errmsgHostName').html("<b><font color='red'>Kindly select Host Name !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgHostName').hide();
			 }*/
			 
			 var tempName=$("#tempName").val().trim();
			 if(tempName.length<=0){
				 $('#errmsgTempName').html("<b><font color='red'>Template Name can not be blank !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgTempName').hide();
			 }
			 var templateCommType=$("#templateCommType").val(); 
			 if(templateCommType=='-1'){
				 $('#errmsgTemplateCommType').html("<b><font color='red'>Kindly select Commission Type !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgTemplateCommType').hide();
			 }
			/* var customerCommission=$("#templateCommType").val(); 
			 if(customerCommission=='-1' &&  templateCommType=='PORTAL'){
				 $('#errmsgCustomerCommission').show();
				 $('#errmsgCustomerCommission').html("<b><font color='red'>Kindly select Customer Commission !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgCustomerCommission').hide();
			 }*/
			/* var customerCommissionType=$("#customerCommissionType").val(); 
			 if(customerCommissionType=='-1'  && (templateCommType=='BOTH' || templateCommType=='CUST')){
				 $('#errmsgCustomerCommissionType').show();
				 $('#errmsgCustomerCommissionType').html("<b><font color='red'>Kindly select Customer Commission Type !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgCustomerCommissionType').hide();
			 }*/
			 var custCommFixedValue;
			 if($("#custCommFixedValue").val().trim().length<=0){
				 custCommFixedValue=parseFloat('0.0');
			 }else{
				 custCommFixedValue=parseFloat($("#custCommFixedValue").val().trim());
			 }
			 if(custCommFixedValue==0 && (templateCommType=='BOTH' || templateCommType=='CUST') && customerCommissionType=='FIXED'){
				 $('#errmsgCustomerCommissionFixedValue').show();
				 $('#errmsgCustomerCommissionFixedValue').html("<b><font color='red'>Customer Commission Fixed Value should be greater than 0 !</font></b>");
				 submitFlag=false;
			 }else{
				 $('#errmsgCustomerCommissionFixedValue').hide();
			 }
			 var custCommFixedMin;
			 var custCommFixedMax;
			 if($("#custCommFixedMin").val().trim().length<=0){
				 custCommFixedMin=parseFloat('0.0');
			 }else{
				 custCommFixedMin=parseFloat($("#custCommFixedMin").val().trim());
			 }
			 if($("#custCommFixedMax").val().trim().length<=0){
				 custCommFixedMax=parseFloat('0.0');
			 }else{
				 custCommFixedMax=parseFloat($("#custCommFixedMax").val().trim());
			 }
			 /*if(custCommFixedMin==0 && custCommFixedMax>0 && (templateCommType=='BOTH' || templateCommType=='PORTAL') && customerCommissionType=='FIXED'){
				 $('#errmsgCustomerCommissionMinValue').show();
				 $('#errmsgCustomerCommissionMinValue').html("<b><font color='red'>Customer Commission Min Value needs to be greater than 0, If Max Value is there !</font></b>");
				
				 submitFlag=false;
			 }else{
				 $('#errmsgCustomerCommissionMinValue').hide();
			 }*/
			/* if(custCommFixedMax==0 && custCommFixedMin>0  && (templateCommType=='BOTH' || templateCommType=='PORTAL') && customerCommissionType=='FIXED'){
				 $('#errmsgCustomerCommissionMaxValue').show();
				 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'>Customer Commission Max Value needs to be greater than 0, If Min Value is there !</font></b>");
				 
				 submitFlag=false;
			 }else{
				 $('#errmsgCustomerCommissionMaxValue').hide();
			 
			 } */
			 if(custCommFixedMin>0 && custCommFixedMax>0 && (custCommFixedMax-custCommFixedMin)<=0 && (templateCommType=='BOTH' || templateCommType=='PORTAL') && customerCommissionType=='FIXED'){
				 $('#errmsgCustomerCommissionMaxValue').show();
				 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'>Customer Commission Max Value needs to be greater than Min Value !</font></b>");
				 
				 submitFlag=false;
			 }
			 if((templateCommType=='BOTH' || templateCommType=='PORTAL') && customerCommissionType=='RANGE'){
				
				 var submitFlag1=checkRangeValues('customerRangeTable','PORTAL');
				
				 if(!submitFlag1){
					
					 submitFlag=false;
				 }
			 }else{
				 $('#errmsgCustomerRangeValue').hide();
			 } 
			
			 if(submitFlag)
			 {
				 $('#'+formName).submit();
			 }
			 else
			 {
				 event.preventDefault();
			 }
		  }
 
 function checkTemplate()
 {
	 
	 var tempname=$("#tempName").val()

	 $.ajax({
			url: 'ajax/checkTemplateName',
			type:'POST',
			data:'tempname='+tempname,
			success:function(response)
			{
				var data=response;
				//alert(response);
				if(data==true)
				{
					$('#errmsgTempName').val('');
					$('#errmsgTempName').html("<font color='red'><b>Template Name Already Exist</b></font>");
				}else
				{
					$('#errmsgTempName').html("<font color='green'><b>Template Name Available</b></font>");
					
				}
			},
			  error: function(e) {
						//alert("error: "+e);
												
					  }
		});
	 
 }
 
 
 
 
 
 
 