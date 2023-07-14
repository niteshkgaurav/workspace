$(document).ready( function (){
	 var afterAddmess='${sucessMessage}';
	 if(afterAddmess=='')
	 {
		 $("#after_commTempSaved_mess").hide();
     }
	 var submitFlag=true;
	 $("form").submit(function(){
		 submitFlag=true;
		
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
		 
		 var customerCommission=$("#customerCommission").val(); 
		 if(customerCommission=='-1' && templateCommType=='PORTAL'){
			 $('#errmsgCustomerCommission').show();
			 $('#errmsgCustomerCommission').html("<b><font color='red'>Kindly select Portal Commission !</font></b>");
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommission').hide();
		 }
		 var customerCommissionType=$("#customerCommissionType").val(); 
		 if(customerCommissionType=='-1'  && templateCommType=='PORTAL'){
			 $('#errmsgCustomerCommissionType').show();
			 $('#errmsgCustomerCommissionType').html("<b><font color='red'>Kindly select Portal Commission Type !</font></b>");
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
		 if(custCommFixedValue==0 && templateCommType=='PORTAL' && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionFixedValue').show();
			 $('#errmsgCustomerCommissionFixedValue').html("<b><font color='red'>Portal Commission Fixed Value should be greater than 0 !</font></b>");
			
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
		 if(custCommFixedMin==0 && custCommFixedMax>0 && templateCommType=='PORTAL' && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMinValue').show();
			 $('#errmsgCustomerCommissionMinValue').html("<b><font color='red'>Portal Commission Min Value needs to be greater than 0, If Max Value is there !</font></b>");
			
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionMinValue').hide();
		 }
		 if(custCommFixedMax==0 && custCommFixedMin>0  &&  templateCommType=='PORTAL' && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMaxValue').show();
			 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'>Portal Commission Max Value needs to be greater than 0, If Min Value is there !</font></b>");
			 
			 submitFlag=false;
		 }else{
			 $('#errmsgCustomerCommissionMaxValue').hide();
		 
		 } 
		 if(custCommFixedMin>0 && custCommFixedMax>0 && (custCommFixedMax-custCommFixedMin)<=0 &&  templateCommType=='PORTAL' && customerCommissionType=='FIXED'){
			 $('#errmsgCustomerCommissionMaxValue').show();
			 $('#errmsgCustomerCommissionMaxValue').html("<b><font color='red'>Portal Commission Max Value needs to be greater than Min Value !</font></b>");
			 
			 submitFlag=false;
		 }
		 if(templateCommType=='PORTAL' && customerCommissionType=='RANGE'){
			
			 var submitFlag1=checkRangeValues('customerRangeTable','PORTAL');
			
			 if(!submitFlag1){
				
				 submitFlag=false;
			 }
		 }else{
			 $('#errmsgCustomerRangeValue').hide();
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
	var submitFlag=true;
    try {
	    var table = document.getElementById(tableID);
	    var rowCount = table.rows.length;
	    if(rowCount==1){
	    	 submitFlag=false;
	    	
	    	if(custOrPartMsgId=='PORTAL'){
	    		$('#errmsgCustomerRangeValue').show();
				$('#errmsgCustomerRangeValue').html("<b><font color='red'> Minimum one range needs to be defined !</font></b>");
	    	}else{
	    		$('#errmsgPartnerRangeValue').show();
				$('#errmsgPartnerRangeValue').html("<b><font color='red'> Minimum one range needs to be defined !</font></b>");
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
			    		if(custOrPartMsgId=='PORTAL'){
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> From field should have some value !</font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> From field should have some value !</font></b>");
			    		}
			    	}
		    	}
		    
		    	if(typeof row.cells[1].childNodes[0].value!="undefined"){
		    		if(row.cells[1].childNodes[0].value.trim().length<=0){
		    			submitFlag=false;
			    		check=false;
			    		if(custOrPartMsgId=='PORTAL'){
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> To field should have some value !</font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> To field should have some value !</font></b>");
			    		}
			    	}
		    	}
		    	
		    	if(typeof row.cells[2].childNodes[0].value!="undefined"){ 
		    	
		    		if(row.cells[2].childNodes[0].value.trim().length<=0){
			    		 submitFlag=false;
			    		check=false;
			    		if(custOrPartMsgId=='PORTAL'){
			    			$('#errmsgCustomerRangeValue').show();
							$('#errmsgCustomerRangeValue').html("<b><font color='red'> Value field should have some value !</font></b>");
			    		}else{
			    			$('#errmsgPartnerRangeValue').show();
							$('#errmsgPartnerRangeValue').html("<b><font color='red'> Value field should have some value !</font></b>");
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
		    		if(to<=from ){
		    			 submitFlag=false;
		    			if(custOrPartMsgId=='PORTAL'){
		    					$('#errmsgCustomerRangeValue').show();
		    					$('#errmsgCustomerRangeValue').html("<b><font color='red'> To should be greater than From !</font></b>");
		    			}else{
		    					$('#errmsgPartnerRangeValue').show();
		    					$('#errmsgPartnerRangeValue').html("<b><font color='red'> To should be greater than From !</font></b>");
		    				}
			    	}
		    		if(i>1){
		    			currentFrom=from;
		    			var previosRow = table.rows[i-1];
		    			var previousTo=parseFloat(previosRow.cells[1].childNodes[0].value.trim());
		    			
		    			if(currentFrom!=previousTo+1){
		    				 submitFlag=false;
		    				if(custOrPartMsgId=='PORTAL'){
		    					$('#errmsgCustomerRangeValue').show();
								$('#errmsgCustomerRangeValue').html("<b><font color='red'> Row-"+i+" From should be " + (previousTo+1) + " !</font></b>");
			    			}else{
			    				$('#errmsgPartnerRangeValue').show();
								$('#errmsgPartnerRangeValue').html("<b><font color='red'> Row-"+i+" From should be " + (previousTo+1) + " !</font></b>");
			    			}	
		    			}
		    		}
		    		// check the current values with the previous values
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
	   	$('#customerCommissionType').change(function () {
	  	    var val = $(this).val();
	   	    if (val == 'FIXED') {
	   	    	$('#customerFixedTable').show();
	   	    	if($('#customerCommission').val()==='AMT')
	   	    	{
	   	    		$('#customerRangeMainTable').hide();
		   	    	$('#customerRangeTable').hide();
	   	    	}	   	    
	   	    	else if($('#customerCommission').val()==='PERC')
	   	    	{
	   	    		$('#customerRangeMainTable').show();
	   	    		$('#customerRangeTableId').hide();
	   	    		$('#addButtonId').hide();
	   	    		$('#custCommFixedMinId').show();
	   	    		$('#custCommFixedMaxId').show();
	   	    	}
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
	   	    		$('#customerRangeTableId').show();
	   	    		$('#addButtonId').show();
	   	    	}
	   	    }
	   });
	  });
 
 $(document).ready(function() {
	   	$('#partnerCommissionType').change(function () {
	  	    var val = $(this).val();
	   	    if (val == 'FIXED') {
	   	    	$('#partnerFixedTable').show();
	   	    	$('#partnerRangeTable').hide();
	   	    	$('#partnerRangeMainTable').hide();
	   	    } else if (val == 'RANGE'){
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
 	    	$('#customerRangeMainTable').show();
 	    	$('#customerRangeTable').show();
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
     var table = document.getElementById(tableID);
     var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);
     var cellMin = row.insertCell(0);
     var elementMin = document.createElement("input");
     elementMin.type = "text";
     elementMin.size=7;
     elementMin.maxlength=6;
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementMin.name = "sysConfigRangeCustomer["+length+"].min";
     }else{
    	 elementMin.name = "sysConfigRangePartner["+length+"].min";
     }
     cellMin.appendChild(elementMin);
     cellMin.onkeyup = function(){tableKeyUpEvent(elementMin); };
     cellMin.onkeypress = function(){tableKeyUpEvent(elementMin); };
     cellMin.onkeydown = function(){tableKeyUpEvent(elementMin); };
     cellMin.onchange = function(){tableKeyUpEvent(elementMin); };
     var cellMax = row.insertCell(1);
     var elementMax = document.createElement("input");
     elementMax.type = "text";
     elementMax.size=7;
     var length=(table.rows.length)-1;
     if(tableID=='customerRangeTable'){
    	 elementMax.name = "sysConfigRangeCustomer["+length+"].max";
     }else{
    	 elementMax.name = "sysConfigRangePartner["+length+"].max";
     }
     cellMax.appendChild(elementMax);
     cellMax.onkeyup = function(){tableKeyUpEvent(elementMax); };
     cellMax.onkeypress = function(){tableKeyUpEvent(elementMax); };
     cellMax.onkeydown = function(){tableKeyUpEvent(elementMax); };
     cellMax.onchange = function(){tableKeyUpEvent(elementMax); };
     $('#errmsgCustomerRangeValue').html(" ");
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

 function tableKeyUpEvent(elementValue){
	 elementValue.value= elementValue.value.replace(/[^\d.]/g, '');  
	 elementValue.maxLength=7;
 }
 
 function deleteRow(tableID) {
     try {
     var table = document.getElementById(tableID);
     var rowCount = table.rows.length;
     if(rowCount>1){
     	table.deleteRow(rowCount-1);
      }
     }catch(e) {
         alert(e);
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
	 	else if (val == 'PORTAL'){
	    	$('#lowerMainTable').show();
	    	$('#customerTable').Show();
	 	} 
	 	else
	 	{
	 		$('#lowerMainTable').hide();
	    	$('#partnerTable').hide();
	    	$('#customerTable').hide();
	 	}
 }
 $(document).ready(function() {
		
		if($('#templateCommType').val()=='-1')
		{
				$('#lowerMainTable').hide();
		    	$('#partnerTable').hide();
		    	$('#customerTable').hide();
		}
	   	$('#templateCommType').change(function () {
	  	    var val = $(this).val();
	  	    
	  	    if(val == '-1')
	  	    {
	  	    	$('#lowerMainTable').hide();
		    	$('#partnerTable').hide();
		    	$('#customerTable').hide();
	  	    	
	  	    }
	  	    
	  	    else if (val == 'NO') 
	   	    {
	   	    	$('#lowerMainTable').hide();
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
	   	    	$('#partnerTable').hide();
	   	    	$('#customerTable').show();
	    	}
	   	    else if(val == 'BOTH')
	   	    {
		    	$('#lowerMainTable').show();
	   	    	$('#partnerTable').show();
	   	    	$('#customerTable').show();
	    	}
	   });
	  });
 
 function checkDuplicate()
 {
	 var templateName = $('#tempName').val();
	 if(templateName.length!=0)
	 {
		$.ajax({
			url: 'ajax/checkDuplicateTemplateName',
			type:'POST',
			data:'templateName='+templateName,
			
			success:function(response)
			{
				if(response==0)
				{
					$('#errmsgTempName').html("<font color='green'><b>Template name available. </b></font>");
				}else
				{
					$('#errmsgTempName').html("<font color='red'><b>Template name already exists!!</b></font>");
					$('#tempName').val('');
				}
			}
		});
	 }else
	{
		 $('#errmsgTempName').html("<font color='red'><b>Kindly fill Template Name !!</b></font>");
	}
 }
 
 