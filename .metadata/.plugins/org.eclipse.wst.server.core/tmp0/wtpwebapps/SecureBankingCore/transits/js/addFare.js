
var minArray=new Array();
var maxArray=new Array();
/*function ShowHideDistanceLine(){
	var fareType=$('#fareType').val();
	
	if(fareType=="By Distance"){
		$('#data_tableaddfare').show();
	
		$('#addRowId').show();
		$('#fareAmountId').hide();
		
	}else{
		$('#data_tableaddfare').hide();
		$('#addRowId').hide();
		$('#fareAmountId').show();
	}
}*/


function delete_row(no)
{
 document.getElementById("row"+no+"").outerHTML="";
}

function add_row()
{
	$('#headingId').show();
	
 var new_name=document.getElementById("new_name").value;
 var new_country=document.getElementById("new_country").value;
 var new_age=document.getElementById("new_age").value;
 var table=document.getElementById("data_table");
 var table_len=(table.rows.length)-1;
 $('#headingId').show();
 //alert(table_len)
 //var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='name_row"+table_len+"'>"+new_name+"</td><td id='country_row"+table_len+"'>"+new_country+"</td><td id='age_row"+table_len+"'>"+new_age+"</td><td><input type='button' id='edit_button"+table_len+"' value='Edit' class='edit' onclick='edit_row("+table_len+")'> <input type='button' id='save_button"+table_len+"' value='Save' class='save' onclick='save_row("+table_len+")'> <input type='button' value='Delete' class='delete' onclick='delete_row("+table_len+")'></td></tr>";
table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='name_row"+table_len+"'>"+new_name+"</td><td id='country_row"+table_len+"'>"+new_country+"</td><td id='age_row"+table_len+"'>"+new_age+"</td><td><input type='button' value='Delete' class='delete' onclick='delete_row("+table_len+")'></td></tr>";
$('#new_name').show();
 document.getElementById("new_name").value="";
 document.getElementById("new_country").value="";
 document.getElementById("new_age").value="";
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


function add_row1(tableID) {
	
	$('#headingId').show();
    var table = document.getElementById(tableID);
    var   rowCount = table.rows.length-1;
    var row = table.insertRow(rowCount);
    var cellMin = row.insertCell(0);
    var elementMin = document.createElement("input");
    elementMin.type = "text";
    elementMin.onfocus=function(){
   
    }
    var length=(table.rows.length);
    if(tableID=='data_tableaddfare'){
   	 elementMin.name = "distance["+rowCount+"].min"; 
   	elementMin.className='min';
   	 try{
   		 elementMin.id="distance["+rowCount+"].min";
   	 }
   	 catch(e)
   	 {
   		 //alert(e);
   	 }
   	                             
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
    elementMax.onfocus=function(){
    	/*$('#errmsgCustomerRangeValue').html('');
    	$('#errmsgPartnerRangeValue').html('');
*/    /*	document.getElementById("sysConfigRangeCustomer["+rowCount+"].max").style.borderColor="";
    	document.getElementById("sysConfigRangePartner["+rowCount+"].max").style.borderColor="";*/
    	
     }
    var length=(table.rows.length);
    if(tableID=='data_tableaddfare'){
   	 elementMax.name = "distance["+rowCount+"].max";
  	//elementMin.className='max';
   	 elementMax.id = "distance["+rowCount+"].max";
   //	alert("elementMax.id" + elementMax.id);
    }
    cellMax.appendChild(elementMax);
    cellMax.onkeyup = function(){tableKeyUpEvent(elementMax); };
    cellMax.onkeypress = function(){tableKeyUpEvent(elementMax); };
    cellMax.onkeydown = function(){tableKeyUpEvent(elementMax); };
    cellMax.onchange = function(){tableKeyUpEvent(elementMax); };
    
    var cellValue = row.insertCell(2);
    var elementValue = document.createElement("input");
    elementValue.type = "text";
    var length=(table.rows.length); 	
    if(tableID=='data_tableaddfare'){
   	 elementValue.name = "distance["+rowCount+"].value";
    	//alert("elementValue.name" + elementValue.name);
    }
    cellValue.appendChild(elementValue);
    cellValue.onkeyup = function(){tableKeyUpEvent(elementValue); };
    cellValue.onkeypress = function(){tableKeyUpEvent(elementValue); };
    cellValue.onkeydown = function(){tableKeyUpEvent(elementValue); };
    cellValue.onchange = function(){tableKeyUpEvent(elementValue); };
    
  
    var cellType = row.insertCell(3);
    var del = document.createElement('input');
    del.setAttribute('type', 'button');
	    del.setAttribute('name', 'del');
	    del.setAttribute('value', 'Remove');
	    cellType.appendChild(del);
	    del.onclick=function(){
	    	 var   rowCount1 = table.rows.length-2;
	    	//alert(rowCount1)
	    	if(rowCount1<=1)
	    		{
	    		$('#headingId').hide();
	    			    		
	    		}else{
	    			$('#headingId').show();

	    		}
	    	
	    	
	       	$(this).closest( 'tr').remove();
	    	
	    }	    	
    
    var cellType = row.insertCell(4);
    var elementType = document.createElement("input");
    elementType.type = "text";
    elementType.size=1;
    var length=(table.rows.length)-1;
    if(tableID=='data_tableaddfare'){
   /*	 elementType.name = "sysConfigRangeCustomer["+length+"].type";*/
    }
   
    
    elementType.value=passedType;
   
    cellType.appendChild(elementType);
    cellType.style.visibility = "hidden";
   

	    	
	    }


/*function deleteRow(tableID) {
	alert("remove")
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
*/
//=====================================================================================
/*function formValidate(event){
	var check=true;
	
	var fareType=$('#fareType').val();
	if(fareType=='By Distance'){
	
		var checkVal=checkValues(event);
	}
	
	if($('#busServiceType').val()==''){
		$('#div_busServiceType').addClass('has-error');
		
		check=false;

	}
	
	
	if($('#fareType').val()==''){
		$('#div_fareType').addClass('has-error');
		
		check=false;

	}
	
	if($('#passengerType').val()==''){
		$('#div_passengerType').addClass('has-error');
		
		check=false;

	}
	
	if($('#fareStatus').val()==''){
		$('#div_fareStatus').addClass('has-error');
		
		check=false;

	}
	if(fareType!='By Distance' && $('#fareAmount').val().length==0){
		$('#div_fareAmount').addClass('has-error');
		
		check=false;

	}
	
	if(check==false){
		event.preventDefault();
		return false;
	}
}*/
//=====================================================================================

function checkValues(event){
	var submitFlag=true;
	var table = document.getElementById('data_tableaddfare');
	 var rowCount = table.rows.length-2;     
	//alert(rowCount)
	var minVal = document.getElementsByClassName("min");
	//alert(minVal+"length of min val")
		for(var i=1; i<minVal.length; i++) {
			//alert("in 1st loop"+minVal)
			minArray.push(minVal[i].value);
		}
		
		//alert(minArray.length)
		for(var i=0;i<minArray.length;i++){
			//alert(minArray.length+"after loop")
			//alert(minArray[i].length)
			 if(minArray[i].length<=0){
				 
				 submitFlag=false;
				// alert("min dis")
				    $('#rangeError').show();
					$('#rangeError').html('<p class="text-danger">Minimum distance field should have some value</p>');
		    			
		    		
		    		submitFlag=false;
			}}
		//alert("alert after function"+submitFlag)
		/*for(var i=1;i<=rowCount;i++){
			alert();
	    	finalArray.push($("#distance["+i+"].min").val());
	    	
	  
var maxVal = document.getElementsByClassName("max");
for(var i=0; i<maxVal.length; i++) {
	maxArray.push(maxVal[i].value);
}  }*/
	//alert(maxArray)
		
		return submitFlag;
		
}

function fillVal(){
	
}

/*function rowCountHeader(){
	
	var table = document.getElementById('data_tableaddfare');
	 var rowCount = table.rows.length-2;     
	alert(rowCount)
}
*/

//=========================================================================================================


function conditions(){
	 var v1=$('#fareType').val().trim();
	 if(v1=="By Distance"){
		 $('#minDistance_DivId').show(); 
			$('#maxDistance_DivId').show();
			$('#div_fareAmount').hide();
		 
	 }
	 
	 else if(v1=="Fixed"){
		 $('#minDistance_DivId').hide(); 
			$('#maxDistance_DivId').hide();
			$('#div_fareAmount').show();

		 
	 }
	 else{
		 
		 $('#minDistance_DivId').hide(); 
			$('#maxDistance_DivId').hide();
			$('#div_fareAmount').hide();

		 
	 }
}




function myValidations(event){
	check=true;
	var v4=$('#busServiceType').val().trim();
	
	var v5=$('#passengerType').val().trim();
	var v6=$('#fareStatus').val().trim();

	
	
	var fareType=$('#fareType').val().trim();
	if(fareType=='By Distance'){
	
		if($("#minDistance").parent().is(":visible")|| $("#maxDistance").parent().is(":visible")){
			 var v1=$('#minDistance').val().trim();
				var v2=$('#maxDistance').val().trim();
			 if(v1.length==0){
					$('#minDistance_DivId').addClass('has-error');
					check=false;
				}
				
				if(v2.length==0){
					$('#maxDistance_DivId').addClass('has-error');
					check=false;
				}
			 }
	}
	if(fareType=='Fixed'){
		
		if($("#fareAmount").parent().is(":visible")){
			 var v3=$('#fareAmount').val().trim();
				
			 if(v3.length==0){
					$('#div_fareAmount').addClass('has-error');
					check=false;
				}
	}
}
	if(v4.length==0){
		$('#div_busServiceType').addClass('has-error');
		check=false;
	}
	if(v5.length==0){
		$('#div_fareStatus').addClass('has-error');
		check=false;
	}
	if(check==false){
		event.preventDefault();
		return false;
	}

}