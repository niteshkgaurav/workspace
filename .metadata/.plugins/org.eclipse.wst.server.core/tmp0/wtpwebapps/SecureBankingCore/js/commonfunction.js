function onlyNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}



function noBack() { window.history.forward() }
noBack();
window.onload = noBack;
window.onpageshow = function(evt) { if (evt.persisted) noBack() };
window.onunload = function() { void (0) };


 $( document ).ready(function() {
                $( ".txtOnly" ).keypress(function(e) {
                    var key = e.keyCode;
                    if (key >= 48 && key <= 57) {
                        e.preventDefault();
                    }
                });
            });
//************************* Function For trimming *******************************************
function trimMe(content)
{
	while(content.charAt(0)==" " || content.charCodeAt(0) == 13 || content.charCodeAt(0) == 10)
		content = content.substring(1)
       while(content.charAt(content.length-1)==" " || content.charCodeAt(content.length-1) == 13 || content.charCodeAt(content.length-1) == 10)
         	content = content.substring(0,(content.length-1))
	return content
}
//******************* Function for accepting only numeric value ******************************
function onlyNumric(event,errorid,labelid,value,msg)
{ 
	$('#'+errorid).html("");
	$('#'+labelid).show();
	if(!event.ctrlKey){
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
		if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			$('#'+labelid).hide();
			$('#'+errorid).show();
			$('#'+errorid).html("<font color='red'>Only Numeric are allowed </font>");
			$('#'+value).val('');
			event.preventDefault();
			return false;
		}
	}
    emptyerror(errorid,msg);
}

function onlyNumricNoEnter(event,errorid, textId, labelId)
{ 
	msg = "";
	$('#'+errorid).html("");
	$('#'+errorid).show();
	if(!event.ctrlKey){
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
		if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			$('#'+labelId).hide();
			$('#'+textId).val('');
			$('#'+errorid).addClass("valid");
			$('#'+errorid).show();
			$('#'+errorid).html("<font color='red'>Only Numeric are allowed </font>");
			
			msg = "Only Numeric are allowed";
//			$('#'+value).val('');
			event.preventDefault();
			return false;
		} else {
			$('#'+errorid).hide();
			$('#'+labelId).show();
		}
		if(asciiValue == 13) {
			$('#'+errorid).hide();
			$('#'+labelId).show();
			event.preventDefault();
			return false;
		}
		if(asciiValue == 8) {
			$('#'+errorid).hide();
			$('#'+labelId).show();
		}
		
	}
    emptyerror(errorid,msg);
}

function onlyNumric1(event,errorid,label)
{ 
	
	if(!event.ctrlKey){
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
		if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
			$('#'+errorid).html('');
			$('#'+label).hide();
			$('#'+errorid).show();
			$('#'+errorid).html("<font color='red'>Only Numeric are allowed </font>");
			event.preventDefault();
			return false;
		}
	}
    emptyerror(errorid,msg);
}
// ===========function to block the space in case of keypress ==============
function blockSpace(e,errorid,msg){
	 var evtobj=window.event? event : e;
	 var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
	 var key=String.fromCharCode(code);
	 if(code==32){
		 $('#'+errorid).html("<p class='text-danger'>Space not allowed</p>");
			e.preventDefault();
			return false;
	 }
	 emptyerror(errorid,msg);
}

function blockPaste(event,errorid){
	$('#'+errorid).show();
	 $('#'+errorid).addClass("has-error");
	 $('#'+errorid).addClass("valid");
		event.preventDefault();
		return false;
}
//===========function to block the space in case of keypress ==============
function validateEmailOnKepress(e,errorid){
	 var evtobj=window.event? event : e;
	 var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
	 var key=String.fromCharCode(code);
	 if(code==32){
		 $('#'+errorid).html("<p class='text-danger'>Space not allowed</p>");
			e.preventDefault();
			return false;
	 }
	 else{
		 $('#'+errorid).html("");
	 }
}

function checkSpaceOnPaste(e,errorid){
	var v=e.clipboardData.getData('Text');
	if(v.indexOf(' ') >= 0){
		$('#'+errorid).html("<p class='text-danger'>Space not allowed in text</p>");
		e.preventDefault();
		return false;
	}
}

function getAgent(currentId,rtid){
	
	var value=$("#"+currentId.id).val();
	if(value.length>0){
		$.ajax({
			type:"POST",
			dataType:"json",
			url :'/securebanking/AdminUI/miscontroller/ajax/getAgent',
			data :'accntId='+value,
			success:function(response)
			{
				if(response!=null){
					var select = $('#'+rtid);
					select.find('option').remove();
					 $('<option>').val('').text('').appendTo($('#'+rtid));
						$.each(response, function( index, value ) {
						    $('<option>').val(index).text(value).appendTo($('#'+rtid));
						   });
				}
			},
			error: function(){
				return false;
				}
		});
	}else{
		var select3 = $('#'+rtid);
		select3.find('option').remove();
	}
	}


function validateReport(event){
	var check  = true;
	var startDate =$('#startDate').val().trim();
	var endDate =$('#endDate').val().trim();
	if(startDate.length == 0){
		$('#startdatediv').addClass('has-error');
		return false;
	}
	
	if(endDate.length == 0 && startDate.length > 0){
		$('#enddatediv').addClass('has-error');
		return false;
	}
	
	if(Date.parse(endDate)<Date.parse(startDate)){
		$('#endDateId').hide();
		$('#endDateErrorId').show();
		$('#endDateErrorId').html('<font color="red" size="2">To Date should be greater than start date</font>');
		$('#endDate').val('');
		return false;
	}
	if(!check){
		event.preventDefault();
		return false;
	}
	return check;
}

function removeError(){
	$('#startdatediv').removeClass('has-error');
	$('#enddatediv').removeClass('has-error');
}
//============= validate numeric value on paste ===========
function validateNumeric(e,errorid,msg){
	var numberRegex=/^\d+$/;
	var v=e.clipboardData.getData('Text');
	if(!numberRegex.test(v)){
		$('#'+errorid).html("<p class='text-danger'>Only Numeric are allowed</p>");
		e.preventDefault();
		return false;
	}
	emptyerror(errorid,msg);
}

//=========== validate float value on paste ==============
function validateFloatValue(e,errorid){
	//var decimal=  /^[-+]?[0-9]+\.[0-9]+$/;   
	var dec= /^[+-]?\d+(\.\d+)?$/;
	//var d=/^[0-9.]*$/;
	var v=e.clipboardData.getData('Text');
	if(!dec.test(v)){
		$('#'+errorid).html("<p class='text-danger'>Only float value allowed</p>");
		e.preventDefault();
		return false;
	}
	else{
		$('#'+errorid).html("");
		return true;
	}
}

//=============== validate alphanumeric in case of on paste ==========
function validateAlphaNumericOnPaste(e,errorid,msg){
	//var alphaNumericRegex=/^\w+$/;
	var alphaNumericRegex=/^[a-zA-Z0-9]+$/;
	var val=e.clipboardData.getData('Text');
	//val = val.replace(/\s+/g, '');
	if(!alphaNumericRegex.test(val)){
		$('#'+errorid).html("<p class='text-danger'>Only alphanumeric is allowed</p>");
		return false;
	}
	emptyerror(errorid,msg);
}



function validateAlphaNumeric(e,errorid){
	var evtobj=window.event? event : e;
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
    var key=String.fromCharCode(code);
    var regex="^[a-zA-Z0-9]{24}$"; 
    if(!regex.test(key)){
    		$('#'+errorid).html("<b><p class='text-danger'>Only alphanumeric is allowed</p>");
    		return false;
    }
    else{
    	return true;
    }
}
// =========== IP Address validation in case of paste ================
function validateIpAddress(e,errorid){
	var iPAddressRegex= /\b(?:\d{1,3}\.){3}\d{1,3}\b/;
	var v=e.clipboardData.getData('Text');
	if(!iPAddressRegex.test(v)){
		$('#'+errorid).show();
		$('#'+errorid).html("<p class='text-danger'>Only Numeric and dot allowed</p>");
		return false;
	}
	else{
		$('#'+errorid).html("");
		return true;
	}
}

// =========== validate IP Address on keypress ==================
function validateIpOnKeyPress(e,errorid){
	var evtobj=window.event? event : e;
	
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
    var key=String.fromCharCode(code);
    var flag=true;
    if((code>=48 && code<=57) || code==46 || code==8){
    	flag=true;
    }
    else{
    	flag=false;
    }
    if(!flag){
    	$('#'+errorid).html("<p class='text-danger'>Only Numeric and dot allowed</p>");
    	e.preventDefault();
    	return flag;
    }
    else{
    	$('#'+errorid).html("");
    	return flag;
    }
}

//=============== validate IFSC CODE IN CASE OF KEYPRESS
 function validateIFSConKeyPress(e,errorid){
	 var evtobj=window.event? event : e;
	    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
	    var key=String.fromCharCode(code);
	    var flag=true;
	    //alert(code);
	    if((code>=97 && code<=122) || (code>=48 && code<=57) || code==8){
	    	flag=true;
	    }
	    else if(code==32 || code==46){
	    	flag=false;
	    }
	    if(!flag){
	    	$('#'+errorid).html("<p class='text-danger'>Only alphanumeric is allowed</p>");
	    	e.preventDefault();
	    	return flag;
	    }
	    else{
	    	$('#'+errorid).html("");
	    	return flag;
	    }
 }

//******************* Function for accepting only Float value ******************************
function onlyFloat(event,errorid,msg)
{
	if(!event.ctrlKey){
		var asciiValue = event.which || event.keycode;
		asciiValue = eval(asciiValue);
	//	alert(asciiValue);
		if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 45) || asciiValue == 47 || asciiValue == 58 ||asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 ||  asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue == 96 || (asciiValue >=123 && asciiValue<=126)){			
			$('#'+errorid).html("<b><font color='red'>Only Float values are allowed</font></b>");
			event.preventDefault();
			return false;
		}
	}
	emptyerror(errorid,msg);
}
//**********************Function for block special character ***********************************
function blockSpecialChar(event,errorid,labelId,msg)
{
	$('#'+errorid).html("");
	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 34 && asciiValue <= 44) || asciiValue == 46 || asciiValue == 47 || asciiValue == 58 || asciiValue == 59  ||  asciiValue == 61 || asciiValue == 60 ||asciiValue == 62 || asciiValue == 63 || asciiValue == 33 || asciiValue == 64 || ( asciiValue >= 91 && asciiValue <= 94 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) )
	{
    	$('#'+labelId).hide();
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	event.preventDefault();
    	return false;
	}
    emptyerror(errorid,msg);
}
function blockSpecialChar(event,errorid,labelId,id)
{
	
	$('#'+errorid).html("");
	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 34 && asciiValue <= 44) || asciiValue == 46 || asciiValue == 47 || asciiValue == 58 || asciiValue == 59  ||  asciiValue == 61 || asciiValue == 60 ||asciiValue == 62 || asciiValue == 63 || asciiValue == 33 || asciiValue == 64 || ( asciiValue >= 91 && asciiValue <= 94 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) )
	{
    	$('#'+labelId).hide();
    	$('#'+id).val('');
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	event.preventDefault();
    	return false;
	}
    emptyerror(errorid);
}
function blockSpecialCharIdNumber(event,errorid)
{
	$('#'+errorid).html("");
	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 34 && asciiValue <= 44) || asciiValue == 46 || asciiValue == 58 || asciiValue == 59  ||  asciiValue == 61 || asciiValue == 60 ||asciiValue == 62 || asciiValue == 63 || asciiValue == 33 || asciiValue == 64 || ( asciiValue >= 91 && asciiValue <= 94 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) )
	{
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	event.preventDefault();
    	return false;
	}
    emptyerror(errorid);
}
//***********  Validation for special characters. ****************

function disableSomeSpecialCharacterSpaceAllowed(e,errorid,msg){
    var evtobj=window.event? event : e;
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
    var key=String.fromCharCode(code);
    //alert(code);
    if(code===63 || code===126 || code===96 || code===33 || code===64 || code===35 || code===36  || code===94  || code===42  || code===41 || code===95 || code===43 || code===61 || code===91 || code===123 || code===93 || code===125 || code===92 || code===124 || code===59 || code===58 ||  code===34 || code===44 || code===60 || code===46 || code===62){
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	e.preventDefault();
    	return false;
    } 
    emptyerror(errorid,msg);
}

function disableSpecialCharacterWithSpace(e,errorid,msg){
    var evtobj=window.event? event : e;
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
    var key=String.fromCharCode(code);
    //alert(code);
    if(code===63 || code===47 || code===126 || code===96 || code===32 || code===33 || code===64 || code===35 || code===36  || code===94  || code===42  || code===41 || code===95 || code===45 || code===43 || code===61 || code===91 || code===123 || code===93 || code===125 || code===92 || code===124 || code===59 || code===58 ||  code===34 || code===44 || code===60 || code===46 || code===62){
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	e.preventDefault();
    	return false;
    } 
    emptyerror(errorid,msg);
}

function disableSpecialCharacter(e,errorid,msg){
    var evtobj=window.event? event : e;
    var code=evtobj.charCode? evtobj.charCode : evtobj.keyCode;
    var key=String.fromCharCode(code);
    if(code===63 || code===47 || code===126 || code===96  || code===33 || code===64 || code===35 || code===36 || code===37 || code===94 || code===38 || code===42 || code===40 || code===41 || code===95 || code===45 || code===43 || code===61 || code===91 || code===123 || code===93 || code===125 || code===92 || code===124 || code===59 || code===58 || code===39 || code===34 || code===44 || code===60 || code===46 || code===62){
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	e.preventDefault();
    	return false;
    } 
    emptyerror(errorid,msg);
}



function validateLoginUser(event,tagId){
	//alert("tagid : "+tagId);
	var loginUser=$("#loginUser").val();
	var v=tagId.split("_");
	var errorid=loginUser+"_"+v[2];
	//alert("errorid : "+errorid);
	blockSpecialChar(event,errorid);
}

//********************************************  forreadonly  function  by Abhishek Mehra***************************************************
function forReadOnly(id,id1)	
{ 
 //alert('${fieldsByRole}');
 var str=$("#"+id).val();
 var accountTypeId=$("#"+id1).val();
 var role_wise_fields = str.split(':');
 for (var i = 0; i <role_wise_fields.length; i++) {
	var accountTypeId_byProp =role_wise_fields[i].substr(0,role_wise_fields[i].indexOf('#'));
	 if(accountTypeId_byProp==accountTypeId){
		 var elementList =role_wise_fields[i].substr(role_wise_fields[i].indexOf('#')+1).split(',');
		 for(var j=0;j<elementList.length;j++){
    		 var elementId=elementList[j];
             $('#'+elementId).prop("readonly",true);
    	  }
    	 break;
      }
 }
}
//**********************Function for block special character including space ***********************************
function blockSpecialCharSpace(event,errorid,msg)
{
	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 34 && asciiValue <= 44) || asciiValue == 46 || asciiValue == 32 || asciiValue == 47 || asciiValue == 58 || asciiValue == 59  ||  asciiValue == 61 ||  asciiValue == 63 ||  asciiValue == 64 || ( asciiValue >= 91 && asciiValue <= 94 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) )
	{
    	$('#'+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>");
    	event.preventDefault();
    	return false;
	}
    emptyerror(errorid,msg);
}
 
function validateLoginName(event,tagId){
	var loginName=$("#loginName").val();
	var v=tagId.split("_");
	var errorid=loginName+"_"+v[2];
	blockSpecialCharSpace(event,errorid);
}
//block alphabet and special character excluding dot(.)
function blockAlphabetandSpecialChar(event,errorid,msg)
{
	//alert("jgjh");
	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 34 && asciiValue <= 43)|| (asciiValue >= 65 && asciiValue <= 122)|| asciiValue == 32 || asciiValue == 47 || asciiValue == 58 || asciiValue == 59  ||  asciiValue == 61 ||  asciiValue == 63 ||  asciiValue == 64 || ( asciiValue >= 91 && asciiValue <= 94 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) )
	{
    	$('#'+errorid).html("<b><font color='red'>Only Digits and dot(.) are allowed</font></b>");
    	event.preventDefault();
    	return false;
	}
    emptyerror(errorid,msg);
}

//********************** Function for Checking only alphabet value *******************************
function onlyAlphabet(event,errorid,msg)
{

	var asciiValue = event.which || event.keycode;
    asciiValue = eval(asciiValue);
    if( (asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122)||(asciiValue==8)||(asciiValue==32)||(asciiValue==9) ||(asciiValue == "undefined"))
	{
    	
    } else   {
    	$('#'+errorid).html('');
    	$('#'+errorid).html("<font color='red'>Only Alphabets are allowed</font>");
    	//$('#'+errmsgProCatName).html("<font color='red'>Only Alphabets are allowed</font>");
    	$('#'+errorid).show();
    	event.preventDefault();
    	return false;
    }
	emptyerror(errorid,msg);
}

function onlyAlphabetlatest(event,errorid,labelId)
{
	var msg;
	$('#'+errorid).html("");
	$('#'+labelId).show();
	if(!event.ctrlKey){
	var asciiValue = event.which || event.keyCode;
    asciiValue = eval(asciiValue);
    if((asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122)||(asciiValue==8)||(asciiValue==32)||(asciiValue==9))
	{
	}
    else
    {
    	
    	$('#'+labelId).hide();
    	$('#'+errorid).html("<font color='red'>Only Alphabets are allowed</font>");
    	$('#'+errorid).show();
    	event.preventDefault();
    	return false;
    }
	}
	emptyerror(errorid,msg);
}
//********************************* Function for empty error code ********************************************
function emptyerror(errorid,msg)
{
	//alert("empty error")
	$("#"+errorid).css({
        "color": "#eaa722",
    });
	$('#'+errorid).html(msg);
	return false;
}

function showlabel(label,errorid,id)
{
	$("#"+id).val('');
	$("#"+label).show();

	$("#"+errorid).html("");
	}

function removeHasError(divId)
{
	
	$("#"+divId).removeClass("has-error");
	
	}

function selecttag(label,id)
{	var idd=$("#"+id).val();
			if(idd!=undefined && idd.length!=0)
			{	$("#"+label).addClass("valid");}
		
		
}

function onlyNumric11(event,errorid,label)
{ 
 
 if(!event.ctrlKey){
  var asciiValue = event.which || event.keycode;
  asciiValue = eval(asciiValue);
  if((asciiValue >= 97 && asciiValue <= 122)||(asciiValue >= 65 && asciiValue <= 90) ||(asciiValue >= 34 && asciiValue <= 38) || (asciiValue >= 40 && asciiValue <= 46) || asciiValue == 47 || asciiValue == 58 || asciiValue == 32 || asciiValue == 59  ||  asciiValue == 60 ||  asciiValue == 61 || asciiValue == 63 || asciiValue == 39 || asciiValue == 62 ||asciiValue == 64 ||asciiValue == 33 || ( asciiValue >= 91 && asciiValue <= 95 ) || asciiValue==96 || (asciiValue >=123 && asciiValue<=126) ){
  
   event.preventDefault();
   return false;
  }
 }
   /* emptyerror(event,errorid,msg);*/
}

function selecttag1(label)
{
		$("#"+label).addClass("valid");
		
		
}
function removeValid(label,id)
{ 
	var id=$("#"+id).val();
 if(id.length<=0)
	 	{$("#"+label).removeClass("valid");}
	}

function emptyErrorLoginName(event,tagId){
	var loginName=$("#loginName").val();
	var v=tagId.split("_");
	var errorid=loginName+"_"+v[2];
	//emptyerror(event,errorid);
	$('#'+errorid).html("");
	return false;
}

function emptyErrorLoginUser(event,tagId){
	var loginUser=$("#loginUser").val();
	var v=tagId.split("_");
	var errorid=loginUser+"_"+v[2];
	//emptyerror(event,errorid);
	$('#'+errorid).html("");
	return false;
}

function emptyErrorLoginPass(event,tagId){
	var loginPass=$("#loginPass").val();
	var v=tagId.split("_");
	var errorid=loginPass+"_"+v[2];
	//emptyerror(event,errorid);
	$('#'+errorid).html("");
	return false;
}

//***************************** Function for set state ***************************************
function setState()
{
	
	var countryName=$('#lab_Country :selected').text();
	var lab_Country=$.trim($('#lab_Country').val());
	var lab_State=$('#lab_State').val();
	if(lab_Country.length == 0)
	{
		$("#lab_State option:selected").text("<-----Select----->");
		$('#mobileNumberPrefix').val("");
		$('#LandLineNumberPrefix').val("");
		$('#lab_OtherCountry_row_id').hide();
		$('#lab_otherCountryErrorId').html("");
		$('#lab_otherstateErrorId').html("");
		$('#lab_State').attr("disabled", false);
	}
	else if(countryName == 'Others' && lab_Country.length > 0)
	{
		$('#mobileNumberPrefix').attr("readonly", false);
		$('#LandLineNumberPrefix').attr("readonly", false);
		$('#lab_State').attr("disabled", true);
		$('#lab_stateErrorId').html("");
		$('#lab_CountryErrorId').html("");
		$('#lab_OtherCountry_row_id').show();
		$('#lab_otherCountryErrorId').html("<b><font color='red'>Other Country name can not be blank</font></b>");
		$('#lab_otherstateErrorId').html("<b><font color='red'>Other State name can not be blank</font></b>");
	}
	else if(lab_Country.length > 0 && countryName != 'Others')
	{
		$('#lab_State').attr("disabled", false);
		$('#lab_otherState').val("");
		$('#lab_OtherCountry').val("");
		$('#lab_stateErrorId').html("");
		$('#lab_CountryErrorId').html("");
		$('#lab_otherstateErrorId').html("");
		$('#lab_otherCountryErrorId').html("");
		$('#lab_OtherCountry_row_id').hide();
		
		$('#lab_OtherState_row_id').hide();
		$('#lab_otherstateErrorId2').html("");
	}
}

//show only state on others state 
function showOthersStatefield(){
	
	var lab_State=$('#lab_State').val();
	if(lab_State=='Others'){
		
		//$('#lab_State').attr("disabled", true);
		$("#lab_OtherState_row_id").show();
		
	}
	if(lab_State!='Others'){
		$("#lab_OtherState_row_id").hide();
		$('#lab_otherstateErrorId2').html("");
	}
	
	
}

//********************** Function for check uploaded file extension ( 'gif','png','jpg','jpeg' ) and size **************************************
function checkExtSize(fieldId,errorid)
{
	//***************************** Code for check file extension ****************************
	var ext = $('#'+fieldId).val().split('.').pop().toLowerCase();
	if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1)
	{
		$('#'+errorid).html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kindly upload file having extension .gif or .png or .jpg or jpeg !</font></b>");
		$('#'+fieldId).val('');
		return false;
	}
	//***************************** Code for check file size ****************************
	var fileSize = $('#'+fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize)/1024);
    if(fileSizeKB > 200)
    {
    	$('#'+errorid).html("<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kindly upload file having size less than or equal to 200 KB !</font></b>");
    	$('#'+fieldId).val('');
    	return false;
    }
    $('#'+errorid).html("");
}
//********************** Function for check uploaded file extension(PDF, DOC, DOCX) and size **************************************
function checkUploadedFile(fieldId,errorid)
{
	//***************************** Code for check file extension ****************************
	var ext = $('#'+fieldId).val().split('.').pop().toLowerCase();
	if($.inArray(ext, ['pdf','doc','docx']) == -1)
	{
		$('#'+errorid).html("<b><font color='red'>Kindly upload file having extension .pdf or .docx or .doc</font></b>");
		$('#'+fieldId).val('');
		return false;
	}
	//***************************** Code for check file size ****************************
	var fileSize = $('#'+fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize)/1024);
	if(fileSizeKB > 2000)
    {
    	$('#'+errorid).html("<b><font color='red'>Kindly upload file having size less than 2 MB</font></b>");
    	$('#'+fieldId).val('');
    	return false;
    }
    $('#'+errorid).html("");
}
//***************************** code to add multiple logins ******************************
function addRowbilling()
{
	document.getElementById("login_error").innerHTML="";
	// $("#account_type_error_id").html("");
	var counter =  $('#checkCounter').val();
	counter++;
	var selectedArr=getIdOfSelectedCheckBox();                 
	var html =
            '<tr>' +
            '<td align = "left"><input id="lab_loginUser_'+counter+'" size="12" path="loginUser" name="loginUser" onkeypress=\"javascript:validateLoginUser(event,this.id)\" onfocus=\"javascript:emptyErrorLoginUser(event,this.id)\" type="text" placeholder="Login User"></td>&nbsp;' +
            '<td align = "left"><input id="lab_loginName_'+counter+'" size="12" path="loginName" name="loginName" onpaste="return checkSpaceOnPaste(event,loginNameErrorId_'+counter+'.id)" onkeypress=\"javascript:validateLoginName(event,this.id)\" onfocus=\"javascript:emptyErrorLoginName(event,this.id)\"  type="text" placeholder="Login Name"></td>&nbsp;' +
            '<td align = "left"><input id="lab_password_'+counter+'" size="12" path="Password" name="Password" type="password" placeholder="Password" onpaste="return blockPaste(event,loginPasswordErrorId_'+counter+'.id)" onkeypress="return blockSpace(event,loginPasswordErrorId_'+counter+'.id)" onfocus=\"javascript:emptyErrorLoginPass(event,this.id)\"></td>&nbsp;' +
            '<td  align="left"><SELECT id="lab_Status_'+counter+'" path="loginStatus" name="loginStatus"><OPTION value="1">Blocked</OPTION><OPTION value="0">Unblocked</OPTION></SELECT></td>&nbsp;' +
            
            
            '<td  align="left"><SELECT id="account_type_for_login_'+counter+'" path="accountType" name="accountType"></SELECT></td>&nbsp;' +
            '<td align = "left">&nbsp;&nbsp;<input type="button" id="chk_btn_'+counter+'" name="chk_availability" value="Check Availability" style="width:110" class="formField" onclick=\"javascript:checkLoginDB2(this.id)\"></td>'+
            '<td align = "left"><input type="button" id="btn_'+counter+'" name="remove" style="width:60" value="Remove" class="formField" onclick=\"javascript:removeRow(this)\"></td>' +
            '</tr>' + 
            '<tr>' + 
 			'<td align="left" width="15%"><div id="loginUserErrorId_'+counter+'"></div></td>' + 
 			'<td align="left" width="15%"><div id="loginNameErrorId_'+counter+'"></div></td>' + 
 			'<td align="left" width"15%"><div id="loginPasswordErrorId_'+counter+'"></div></td>' + 
 			'<td align="left" width="15%"><div id="statusErrorId_'+counter+'"></div></td>' + 
 			'<td colspan="2" width="40%"></td>' + 
 		'</tr>'
 			
 			
	
    $(html).appendTo($("#addmoreInfo_pkgage"));
	
	for(var i=0;i<selectedArr.length;i++){
    	var id=selectedArr[i];
    	var accountType=$("#"+id).val();
    	var divId="account_type_for_login_"+counter;
    	var currentId = $('#'+divId).attr('id');
    	$("#"+currentId).attr("name","loginAccountType");
    	//alert("id : "+id+" accountType: "+accountType+" divId : "+divId);
    	getAccountTypeForLogin(id,accountType,divId);
    }
    $('#checkCounter').val(counter);
}
//***************************** Function For Remove Row ************************************************
function removeRow(obj){
	decreaseValueOfLoginFieldId(obj);
	var counter=$('#checkCounter').val();
	
    var par = $(obj).parent().parent();
    var next = par.next(); 
    par.remove();
    next.remove();
    
    counter--;
    $('#checkCounter').val(counter);
    
    
}

//========== This function will decrease value of ID for login fields in case of removing the row =================
function decreaseValueOfLoginFieldId(obj){
	var buttonId=obj.id;
	var arr=buttonId.split("_");
	var rowNum=parseInt(arr[1]);
	var counter=$('#checkCounter').val();
	for(var i=0;i<=counter;i++){
		if(i>rowNum){                                               
			var temp=i;
			$('#lab_loginUser_'+i).attr('id', 'lab_loginUser_'+(temp-1));
						
			$('#lab_loginName_'+i).attr('id', 'lab_loginName_'+(temp-1));
			$('#lab_password_'+i).attr('id', 'lab_password_'+(temp-1));
			
			
			$('#lab_Status_'+i).attr('id', 'lab_Status_'+(temp-1));
			$('#account_type_for_login_'+i).attr('id', 'account_type_for_login_'+(temp-1));
			
			$('#chk_btn_'+i).attr('id', 'chk_btn_'+(temp-1));
			
			$('#btn_'+i).attr('id', 'btn_'+(temp-1));
			$('#loginUserErrorId_'+i).attr('id', 'loginUserErrorId_'+(temp-1));
			$('#loginNameErrorId_'+i).attr('id', 'loginNameErrorId_'+(temp-1));
			$('#loginPasswordErrorId_'+i).attr('id', 'loginPasswordErrorId_'+(temp-1));
			$('#statusErrorId_'+i).attr('id', 'statusErrorId_'+(temp-1));
			
		}
	}
}



//***************************** Function For Checking Multiple login values From DB  ************************************************
function checkLoginDB(dynamicId)
{
	var loginName=$('#lab_loginName_'+dynamicId).val();
	if(loginName.length==0)
	{
		$('#loginNameErrorId_'+dynamicId).html("<b><font color='red'> Enter login name</font></b>");
		event.preventDefault();
		return false;
	}
	if(loginName.length > 0){
		
	
	$.ajax
	(
		{
			type: "Post",  
			url: "ajax/checkDuplicateLogin",  
			dataType: "json",
			data: "loginName_unique="+loginName,  
			success: function(response)
			{
				var getResponse =JSON.parse(response); 
				if(getResponse)
				{
					var morenewloginname =document.getElementsByName("loginName");
					var morelogin_user = document.getElementsByName("loginUser");
					 var boolean =true;
					for(var i=0 ; i< morelogin_user.length; i++)
					{
						
							var count=0;
							for(var j=0;j < morenewloginname.length ; j++)
							{
								if(morenewloginname[j].value.length!=0 && morenewloginname[i].value.length!=0){
									if((morenewloginname[j].value).toLowerCase() == (morenewloginname[i].value).toLowerCase() && i != j){
										count =1;
										break;
									}
								}
							}
							if(count == 1)
							{
								boolean=false;
								$('#loginNameErrorId_'+j).html("<b><font color='red'> Duplicate login name</font></b>");
								morenewloginname[j].value = "";
								completeCheck = false;
								event.preventDefault();
								return false;
							}
							
						
					}
					if(boolean){
						
					$('#loginNameErrorId_'+dynamicId).html("<b><font color='red'> Login Name Available</font></b>");
					
					}
				}
				else
				{
					$('#loginNameErrorId_'+dynamicId).html("<b><font color='red'> Login Name already exists</font></b>");
					$('#lab_loginName_'+dynamicId).val('');
					event.preventDefault();
					return false;
				}
			}
		}
	); 
	}
}

function checkLoginDB2(tagId){
	var v=tagId.split("_");
	var counter=v[2];
	checkLoginDB(counter);
}

function generateAccountTypeField(val){
	var id=val;
	if($('#'+id).attr('checked')){
		dispalyAccountField(id);
	}
	else{
		removeAccountField("row_"+id);
	}
}

// ============= function to add the account fields =============
function dispalyAccountField(id){
	 //alert("checked : "+id);
	 var accountType=$("#"+id).val();
	 //alert("account type : "+accountType);
	var country=$("#lab_Country").val();
	 var html='<tr id="row_'+id+'"><td colspan="2" align="center"><table width="100%" border ="0" class="thickBorder" cellspacing="5" cellpadding="1">'+ 
		 	   '<tr>'+
		 	   '<td colspan="4" align="center"><u>'+accountType+' Contact Details</u></td>'+
	 			'</tr>'+
	 			// =========== first completed ==========
	 			'<tr>'+
	 			'<td><font color="red">*&nbsp;</font>Name:</td>'+
	 			'<td>'+  
	 			'<input type="hidden" path="hiddenAccountTypeId" name="hiddenAccountTypeId" value="'+id+'"/>'+
           	'<select  id="personNamePrefix_'+id+'" path="contactSalutaion" name="contactSalutaion">'+	                        
           	'<option value="Mr.">Mr.</otpion>'+
           	'<option value="Ms.">Ms.</option>'+
           	'<option value="Dr.">Dr.</option>'+
           	'<option value="Mrs.">Mrs.</option>'+
           	'</select>&nbsp;&nbsp;'+
          
          
          '<input  id="lab_contactPersonName_'+id+'" path="contactName"  name="contactName"  type="text" onkeypress="blockSpecialChar(event,contactPersonNamErrorId_'+id+'.id);"  onfocus="emptyerror(contactPersonNamErrorId_'+id+'.id);" size="20" placeholder="Contact Person Name" maxlength="50" style="width: 180px"/></td>'+
          
           
           //=====
           '<td><font color=red>*&nbsp;</font>Email:</td>'+
	        '<td ><input id="lab_Email_Id_'+id+'" path="contactEmailId" name="contactEmailId" type="mail" onpaste="return checkSpaceOnPaste(event,lab_Email_IdErrorId_'+id+'.id)" onkeypress="return blockSpace(event,lab_Email_IdErrorId_'+id+'.id)" onfocus="emptyerror(lab_Email_IdErrorId_'+id+'.id);" placeholder="Email Id" maxlength="50" size="21" style="width: 180px"/></td>'+ 
	        //=======
	 		'</tr>'+
	 		
	 		//============= second row completed ================
	 		
	 		'<tr>'+
	 		'<td colspan="2"><div id="contactPersonNamErrorId_'+id+'" align="center"></div></td>'+
	 		'<td colspan="2"><div id="lab_Email_IdErrorId_'+id+'" align="center"></div></td>'+
	 		'</tr>'+
	 		
	 		
	 		//============= third row completed ================
	 		'<tr>'+
	 		
	 		'<td><font color="red">*&nbsp;</font>Mobile :</td>'+
	 		'<td>'+
	        '<input id="mobileNumberPrefix_'+id+'" path="contactMobilePrefix" name="contactMobilePrefix" value="" size="2" type="text" onkeypress="onlyNumric(event,lab_MobilePrefixErrorId_'+id+'.id);" onfocus="emptyerror(lab_MobilePrefixErrorId_'+id+'.id);" onpaste="return validateNumeric(event,lab_MobilePrefixErrorId_'+id+'.id);" placeholder="ISD Code" maxlength="5"/>&nbsp;&nbsp;&nbsp;'+
		    '<input id="lab_MobileNumber_'+id+'" path="contactMobile" name="contactMobile" type="text" onkeypress="onlyNumric(event,lab_MobileNumberErrorId_'+id+'.id);" onfocus="emptyerror(lab_MobileNumberErrorId_'+id+'.id);" onpaste="return validateNumeric(event,lab_MobileNumberErrorId_'+id+'.id);" placeholder="MobileNumber" size="14" maxlength="10" style="width: 180px"/>'+	        
	        '</td>'+
	        '<td>Landline :</td>'+
	        '<td>'+
		    '<input id="LandLineNumberPrefix_'+id+'" path="contactLandLinePrefix" name="contactLandLinePrefix" value="" size="2" type="text" onkeypress="onlyNumric(event,lab_LandLinePrefixErrorId_'+id+'.id);" onfocus="emptyerror(lab_LandLinePrefixErrorId_'+id+'.id);" onpaste="return validateNumeric(event,lab_LandLinePrefixErrorId_'+id+'.id);" placeholder="ISD Code" maxlength="5"/>&nbsp;&nbsp;&nbsp;'+
		    '<input id="lab_LandLineNumber_'+id+'" path="contactLandLine" name="contactLandLine"  type="text" onkeypress="onlyNumric(event,lab_LandLineNumberErrorId_'+id+'.id);" onfocus="emptyerror(lab_LandLineNumberErrorId_'+id+'.id);" onpaste="return validateNumeric(event,lab_LandLineNumberErrorId_'+id+'.id);" placeholder="Land Line Number" size="13" maxlength="10"/>'+
	        '</td>'+
	 		'</tr>'+
	 		
	 		
	 		'<tr>'+
	 		'<td colspan="2"><div id="lab_MobileNumberErrorId_'+id+'" align="center"></div><br><div id="lab_MobilePrefixErrorId_'+id+'" align="center"></div></td>'+
	 		'<td colspan="2"><div id="lab_LandLineNumberErrorId_'+id+'" align="center"></div><br><div id="lab_LandLinePrefixErrorId_'+id+'" align="center"></div></td>'+
	 		'</tr>'+
	 		 '</table></td></tr>';	
	 
	 $(html).appendTo($("#account_type_field"));
	 if(country=='Others'){
		 $("#mobileNumberPrefix_"+id).val("");
		 $("#LandLineNumberPrefix_"+id).val("");
		 
		 $("#mobileNumberPrefix_"+id).attr("readonly",false);
		 $("#LandLineNumberPrefix_"+id).attr("readonly",false);
		 
		 $("#mobileNumberPrefix_"+id).attr("size",'3');
		 $("#LandLineNumberPrefix_"+id).attr("size",'3');
		
	 }
	 else{
		 var prefixMobile=$("#prefix_mobile").val();
		 var prefixLandline=$("#prefix_landline").val();
		 $("#mobileNumberPrefix_"+id).val(prefixMobile);
		 $("#LandLineNumberPrefix_"+id).val(prefixLandline);
		 
		 $("#mobileNumberPrefix_"+id).attr("readonly",true);
		 $("#LandLineNumberPrefix_"+id).attr("readonly",true);
	 }
	 
	 
	 
	 var counter=$('#checkCounter').val();
	 //alert("counter : "+counter);
	 for(var i=0;i<=counter;i++){
		 var divId="account_type_for_login_"+i;
		 getAccountTypeForLogin(id,accountType,divId);
	 }
	 
	
}
 
 //============= function to remove the account fields =================
 function removeAccountField(id){
	// alert("unchecked : "+id);
	 var row = document.getElementById(id);
	 row.parentNode.removeChild(row);
	 
	 var counter=$('#checkCounter').val();
	 //alert("counter : "+counter);
	 for(var i=0;i<=counter;i++){
		 var divId="account_type_for_login_"+i;
		 removeAccountTypeFromLogin(id,divId);
	 }
	 
 }
 
 // ============ function to add field on load ================
 function firstAccountTypeField(){
	 //var id=document.getElementById("first_account_type_id").value;
	 //var defaultNumber=$("#default_number").val();
	
	 var arr=getIdOfSelectedCheckBox();
	 for(var i=0;i<arr.length;i++){
		 var id=arr[i];
		 dispalyAccountField(id);
	 }
	 //$('#account_type_for_login_0').prop("readonly", true); 
	// $('#account_type_for_login_0').attr('readOnly', true);
 }
 
 function getAccountTypeForLogin(id,accountType,divId){
	 $("#"+divId).append("<option value='"+id+"'>"+accountType+"</option>");
 }
 
 function removeAccountTypeFromLogin(val,divId){
	 var row_id=val.split("_");
	 var id=row_id[1];
	 //alert("id : "+id+" div Id : "+divId );
	 $('#'+divId+' option[value='+id+']').remove();
 }
 
 
 function getIdOfSelectedCheckBox(){
	 var checkBoxes = document.getElementsByTagName('input');
	 var arr =[];
     for (var counter=0; counter<checkBoxes.length; counter++) {
          if (checkBoxes[counter].type.toUpperCase()=='CHECKBOX' || checkBoxes[counter].type.toLowerCase()=='checkbox') {
        	  if(checkBoxes[counter].checked == true){
        		  arr.push(checkBoxes[counter].id);  
        	  }
         }
     }
     return arr;
 }

 function getStateList()
 {
	 
 	var Country=$('#lab_Country').val();
 	//if(Country.length > 0)
 	//alert(Country);
 	
 	var arr=getIdOfSelectedCheckBox();
 	 for(var i=0;i<arr.length;i++){
 		 var id=arr[i];
 		 $("#lab_MobilePrefixErrorId_"+id).html("");
 		 $("#lab_MobileNumberErrorId_"+id).html("");
 		 $("#lab_LandLinePrefixErrorId_"+id).html("");
 		 $("#lab_LandLineNumberErrorId_"+id).html("");
 	 }
 	
 	
 	
 	if(Country!='Others' && Country!=''){
 		$('#lab_OtherCountry_row_id').hide();
 		$.ajax
 		(
 			{
 				type: "post",
 				url: 'ajax/getStateList',
 				cache: false,
				 dataType: "json",
 				data:'Country=' + Country,
 				success: function(response)
 				{
 					var obj1 = JSON.parse(response);
 					var stateMap = obj1.stateCountryMap;
 					var countryCode = obj1.countryCode;
 					//alert(countryCode);
 					var select = $('#lab_State');
 					select.find('option').remove();
 					$.each(stateMap, function( key, value )
 					{
 						$('<option>').val(key).text(value).appendTo(select);
 					});
 					$.each(countryCode, function( key, value ) 
 					{
 						// =====comment made my Ram Kumar  [ 1-5-2015] =========
 						/*var MobileNumberselect = $('#mobileNumberPrefix');
 						var landLineselect = $('#LandLineNumberPrefix');
 						if(value == 0)
 						{
 							MobileNumberselect.val("");
 							landLineselect.val("");
 						}
 						else
 						{
 							MobileNumberselect.val(value);
 							landLineselect.val(value);
 						
 						}*/
 						if(value==0){
 							$("#prefix_mobile").val("");
 							$("#prefix_landline").val("");
 							
 							//var id=$("#first_account_type_id").val();
 							var arr=getIdOfSelectedCheckBox();
 							 for(var i=0;i<arr.length;i++){
 								 var id=arr[i];
 								 $("#mobileNumberPrefix_"+id).val(value);
 								 $("#LandLineNumberPrefix_"+id).val(value);
 								 
 								 $("#mobileNumberPrefix_"+id).attr("readonly",true);
 								 $("#LandLineNumberPrefix_"+id).attr("readonly",true);
 								 
 								 $("#mobileNumberPrefix_"+id).attr("size",'1');
 								 $("#LandLineNumberPrefix_"+id).attr("size",'1');
 							 }

 						}
 						else{
 							//alert("prefix : "+value);
 							$("#prefix_mobile").val(value);
 							$("#prefix_landline").val(value);
 							//alert($("#prefix_mobile").val());
 							
 							//var id=$("#first_account_type_id").val();
 							var arr=getIdOfSelectedCheckBox();
 							 for(var i=0;i<arr.length;i++){
 								 var id=arr[i];
 								 $("#mobileNumberPrefix_"+id).val(value);
 								 $("#LandLineNumberPrefix_"+id).val(value);
 								 
 								 $("#mobileNumberPrefix_"+id).attr("readonly",true);
 								 $("#LandLineNumberPrefix_"+id).attr("readonly",true);
 								 
 								 $("#mobileNumberPrefix_"+id).attr("size",'1');
 								 $("#LandLineNumberPrefix_"+id).attr("size",'1');
 							 }
 							
 							
 							
 							
 						}
 						
 					});
 				},
 				error: function()
 				{						
 					$('#lab_CountryErrorId').html("<b><font color='red'>Request could not be completed at this moment. Please try again </font></b>");
 					
 				}
 		});
 	}
 	else if(Country=='Others')
 	{   
 		$('#lab_OtherCountry_row_id').show();
 		$("#lab_OtherState_row_id").hide();
 		var labState = $('#lab_State');		          
 	    $('<option>').val("Other").text("Other").appendTo(labState);
 	    
 	    var arr=getIdOfSelectedCheckBox();
 		 for(var i=0;i<arr.length;i++){
 			 var id=arr[i];
 			 $("#mobileNumberPrefix_"+id).val("");
 			 $("#LandLineNumberPrefix_"+id).val("");
 			 $("#mobileNumberPrefix_"+id).attr("readonly",false);
 			 $("#LandLineNumberPrefix_"+id).attr("readonly",false);
 			 
 			 $("#mobileNumberPrefix_"+id).attr("size",'3');
 			 $("#LandLineNumberPrefix_"+id).attr("size",'3');
 		 }
 		
 	}
 }






//validate special character except to { } validation in system setting module 
function validateSpecialCharacter(event, errorid ,textid,msg){
	           var textInputVal=$("#"+textid).val();
	           var keycode = (event.keyCode ? event.keyCode : event.which);
	        if(keycode == 64 || keycode==33 || keycode==34 || keycode==35 || keycode==36 || keycode==37 || keycode==38){
	    	       $("#"+errorid).html("<b><font color='red'>Special characters are not allowed</font></b>").show();
	    	       return false;
	    } 
    	else if(textInputVal.trim()=='' && event.which!=8 && event.which==32){
    		 $("#"+errorid).html("<b><font color='red'>Blank  not allowed</font></b>").show();
             return false;
    	}
	        emptyerror(errorid,msg);
	
}


//***************** this function for go back on click back buttoun on page ******************

function goback() {
    history.go(-1);
    
}


//Function for concatenation of address for map
function addressForMap(mapDivID, mapCanvasErrorID, lab_companyName, lab_HouseNoStreet , lab_City, lab_State, otherState1, otherState2, lab_Country, otherCountry)
{
//	alert("starts..........."+lab_companyName);
	//var companyName=$.trim($('#'+lab_companyName).val());
	var companyName=$('#'+lab_companyName).val();
	//alert(companyName);
	var houseNoStreet=$.trim($('#'+lab_HouseNoStreet).val());
	var city=$.trim($('#'+lab_City).val());
	var state=$.trim($('#'+lab_State).val());
	var stateName=$('#'+lab_State +' :selected').text();
	var country=$.trim($('#'+lab_Country).val());
	var countryName=$('#'+lab_Country +' :selected').text();
	var OtherCountryName=$('#'+otherCountry).val();
	var otherState1Name=$('#'+otherState1).val();
	var otherState2Name=$('#'+otherState2).val();
	//alert("company : "+companyName+" city : "+city+" country: "+country+" state : "+stateName);
	var countryNameVal="",stateNameVal="";
	var errorMsg="";
	var checkFlag=true;
	if(companyName.length <= 0){
		errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;Company Name can not be blank</font></b>";
		checkFlag=false;
	}
	
	if(houseNoStreet.length <= 0){
		errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;HouseNo. & Street can not be blank</font></b>";
		checkFlag=false;
	}
	
	if(city.length <= 0){
		errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;City Name can not be blank</font></b>";
		checkFlag=false;
	}
	
	if(countryName != 'Others')
	{
		if(state.length <= 0){
			errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;State name can not be blank</font></b>";
			checkFlag=false;
		}
		else{
			stateNameVal=state;
		}
		
		if(stateName=='Others'){
			if(otherState2Name.length<=0){
				errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;Other State name can not be blank</font></b>";
				checkFlag=false;
			}
			else{
				stateNameVal=otherState2Name;
			}
		}
	}
	else{
		countryNameVal=countryName
	}
	
	if(country.length <= 0){
		errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;Country name can not be blank</font></b>";
		checkFlag=false;
	}
	
	if(countryName == "Others")
	{
		if(otherState1Name.length <= 0)
		{
			errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;Other State name can not be blank</font></b>";
			checkFlag=false;
		}
		else{
			stateNameVal=otherState1Name;
		}
	}
	
	if(countryName == "Others")
	{
		if(OtherCountryName.length <= 0)
		{
			errorMsg=errorMsg+"<br><b><font color='red'>&nbsp;Other Country name can not be blank</font></b>";
			checkFlag=false;
		}
		else{
			countryName=OtherCountryName;
		}
	}
	
	if(!(checkFlag))
	{	
		$("#"+mapCanvasErrorID).html(errorMsg);
		$("#"+mapDivID).empty();
		return false;
	}
	else
	{
		$("#"+mapCanvasErrorID).empty();
		completeAddress=houseNoStreet+", "+city+", "+stateNameVal+", "+countryName;
		addressInFail=city+", "+stateNameVal+", "+countryName;
		addressOnMAP(companyName,completeAddress,addressInFail,mapDivID,'0');
	}
}
//================================= End of function ================================

//Map initialization 
var geocoder;
var map;
var marker;
function mapInitialize(mapDivID) {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(28.63508, 77.22496);
  var mapOptions = {
    zoom: 8,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById(mapDivID), mapOptions);
}


function addressOnMAP(cName,cAddress,addressInFail,mapDivID,flagVal) {
	var geocoder;
	var map;
	var marker;
	var contentString;
	mapInitialize(mapDivID);
	geocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(28.63508, 77.22496);
	var mapOptions = {
		zoom: 8,
	    center: latlng
	}
	map = new google.maps.Map(document.getElementById(mapDivID), mapOptions);
	geocoder.geocode( { 'address': cAddress}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
    
		contentString = '<div id="content" align="left"><b>'+cName+'</b><div id="siteNotice"  align="left">'+cAddress+'</div></div>';
		
		var infowindow = new google.maps.InfoWindow({
			content: contentString
		});
	
		map.setCenter(results[0].geometry.location);
		marker = new google.maps.Marker({
			map: map,
			position: results[0].geometry.location,
			title: cName
		});
	
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map,marker);
		});
    } else {
    	if(flagVal==0){
    		addressOnMAP(cName,addressInFail,cAddress,mapDivID,'1')
    	}
    	else{
    		alert("System could not found the following address on MAP.\n"+cName+", "+addressInFail );
    	}
    }
  });
} //Done Map Script

//============= function to check blank fields =================
function isBlank(inputArr){
	var blankArr=[];
	for(var i=0;i<inputArr.length;i++){
		var id=inputArr[i].id;
		var message=inputArr[i].message;
		var errorid=inputArr[i].errorid;
		var inputValue=$("#"+id).val();
		if(inputValue.length==0 || inputValue=='' || typeof(inputValue)=='undefined' || inputValue==null || inputValue < 1){
			blankArr.push({message:''+message+'',errorid:''+errorid+''});
		}
	}
	return blankArr;
}
//************************* tab colour change  by Abhishek Mehra*************************
function onTabChange(event,link)
{
	if(link=='link1'|| $('#listValues').val() =='link1')
	{
		var val1 = document.getElementById("link1");
		val1.style.backgroundColor = '#5AC0F6';
		$('#listValues').val('link1');		
	}
	if(link=='link2'|| $('#listValues').val() =='link2')
	{
		var val2 = document.getElementById("link2");
		val2.style.backgroundColor = '#5AC0F6';
		$('#listValues').val('link2');
	}
	else if(link=='link3'|| $('#listValues').val() =='link3')
	{
		var val3 = document.getElementById("link3");
		val3.style.backgroundColor="#5AC0F6";
		$('#listValues.val').val('link3');
	}
}

// ============= Written by Ram Kumar [ 11-Aug-2015] ===============
// ============= function to show the logo image name ==============
function showLogoName(){
	for(var i=1;i<=3;i++){
		var src=$('#logoImage'+1).attr('src');
		if(src!=''){
			var lastIndex=src.lastIndexOf("/");
			var imageName=src.substring(lastIndex+1);
			$("#logoName"+i).html(imageName);
		}
	}
}


function deleteElementFromArray(arr,value){
	Array.prototype.remove = function(val) {
	    var index = this.indexOf(val); 
	    if (index >= 0) this.splice(index, 1);
	    return this;
	}; 
	arr.remove(value);
	return arr;
}

//=========== function to sort the map ==============
//=========== Written by Ram[16-JAN-16] =============
function getSortedArray(data){
	var arr=[];
	var obj=JSON.parse(data);
	 $.each(obj, function(key, value) {
		 arr.push({key:key,value:value});
	 });
	 //========== sort the array by balue ===========
	 arr = arr.sort(function (a, b) {
		 return a.value.localeCompare( b.value );
	});
	return arr;
}

//========== function to make dropdown readonly ===============
function makeDropdownReadonly(id){
	$('#'+id+' option:not(:selected)').attr('disabled', true);
}

function makeFieldsReadOnly(hiddenAccountTypeId){
	var accountType=$("#"+hiddenAccountTypeId).val();
	if(accountType=='15'){ // host
		makeDropdownReadonly('hostId');
	}
	else if(accountType=='10'){ // distributor
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
	}
	else if(accountType=='6'){ // sub-distributor
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
		makeDropdownReadonly('subDistributorId');
	}
	else if(accountType=='25'){ // retailer
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
		makeDropdownReadonly('subDistributorId');
		makeDropdownReadonly('retailerId');
	}
	else if(accountType=='16'){ // bc
		makeDropdownReadonly('hostId');
		makeDropdownReadonly('distributorId');
		makeDropdownReadonly('subDistributorId');
		makeDropdownReadonly('retailerId');
		makeDropdownReadonly('bcId');
	}
	
}


//========== function to get distributors ===============
function getDistributor(){
	var hostId=$("#hostId").val();
	if(hostId.length==0){
		return false;
	}
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getDistributor',
		  type: 'POST',
		  data: 'hostId='+hostId,
		  dataType: "json",
		  success: function(data) {
			 //alert("response: "+data);
			  var obj=JSON.parse(data);
			  var arr=getSortedArray(data);
			  $('#distributorId').find('option:not(:first)').remove();
			  for(var i=0;i<arr.length;i++){
				  var key=arr[i].key;
				  var value=arr[i].value;
				  $("#distributorId").append(new Option(value,key));
			  }
		  },
		  error: function(e) {
			//alert("error: "+e);
			//console.log(e.message);
		  }
		});
}

//================== function to get sub-distributors  =============
function getSubDistributor(){
	var distributorId=$("#distributorId").val();
	if(distributorId.length==0){
		return false;
	}
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getSubDistributor',
		  type: 'POST',
		  data: 'distributorId='+distributorId,
		  dataType: "json",
		  success: function(data) {
			 //alert("response: "+data);
			  var obj=JSON.parse(data);
			  var arr=getSortedArray(data);
			  $('#subDistributorId').find('option:not(:first)').remove();
			  for(var i=0;i<arr.length;i++){
				  var key=arr[i].key;
				  var value=arr[i].value;
				  $("#subDistributorId").append(new Option(value,key));
			  }
		  },
		  error: function(e) {
			//alert("error: "+e);
			//console.log(e.message);
		  }
		});
}

//============ function to retailers  ================
function getRetailer(){
	var subDistributorId=$("#subDistributorId").val();
	if(distributorId.length==0){
		return false;
	}
	 //========== ajax call ==============
	 $.ajax({
		  url: 'ajax/getRetailer',
		  type: 'POST',
		  dataType: "json",
		  data: 'subDistributorId='+subDistributorId,
		  success: function(data) {
			 //alert("response: "+data);
			  var obj=JSON.parse(data);
			  var arr=getSortedArray(data);
			  $('#lab_ownerName').find('option:not(:first)').remove();
			  for(var i=0;i<arr.length;i++){
				  var key=arr[i].key;
				  var value=arr[i].value;
				  $("#lab_ownerName").append(new Option(value,key));
			  }
		  },
		  error: function(e) {
			//alert("error: "+e);
			//console.log(e.message);
		  }
		});
}

//=============== method to get bc ==================
function getBC(){
	var retailerId=$("#retailerId").val();
	if(retailerId!='none'){
		var arr=[];
		if(retailerId=='all'){
			arr=getAllId('retailerId');
		}
		else{
			arr.push(retailerId);
		}
		 //========== ajax call ==============
		 $.ajax({
			  url: 'ajax/getBC',
			  type: 'POST',
			  dataType: "json",
			  data: 'retailerId='+retailerId+'&retailerArr='+arr,
			  success: function(data) {
				 // alert("response: "+data);
				  var obj=JSON.parse(data);
				  $("#bcId").find("option:gt(0)").remove();
				  $("#bcId").append(new Option('Select All','all'));
				  
				  var flag=false;
				  var arr=getSortedArray(data);
				  for(var i=0;i<arr.length;i++){
					  var key=arr[i].key;
					  var value=arr[i].value;
					  flag=true;
					  $("#bcId").append(new Option(value,key));
				  }
				    
				  if(flag==false){
					  $('#bcId option[value="all"]').remove();
				  }
				  
			  },
			  error: function(e) {
				  //alert("error: "+e);
				console.log(e.message);
			  }
			});
	}
}

//========== function to show alert ===============
//========== Written by Ram Kumar [30-DEC-15]  ================
function showAlert(title,message){
	try{
		$("<div></div>").dialog({
	        title:title,
			modal: true,
			open: function () {
	            var markup = message;
	            $(this).html(markup);
	        },
	        buttons: {
	            "OK": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	}
	catch(e){
		//alert(e);
	}
}

//========== check whether the checkbox is checked or not ==============
//========== Written by Ram Kumar [30-DEC-15] ======================================
function isChecked(id){
	var flag=false;
	try{
		if($('#'+id).prop('checked')){
			flag= true;
		}
	}
	catch(e){
		//alert(e);
	}
	return flag;
}

//=========== get id of all checkbox on the page =================
//=========== written by Ram Kumar [30-DEC-15] ===================
function getIdOfAllCheckBox(){
	 var checkBoxes = document.getElementsByTagName('input');
	 var arr =[];
  for (var counter=0; counter<checkBoxes.length; counter++) {
       if (checkBoxes[counter].type.toUpperCase()=='CHECKBOX' || checkBoxes[counter].type.toLowerCase()=='checkbox') {
     	  arr.push(checkBoxes[counter].id);  
      }
  }
  return arr;
}

function getDataFromJson(data){
	 var obj=JSON.parse(data);
	 var value=""; 
	 for(var i=0;i<obj.length;i++){
		  var json=obj[i];
		  for (var key in json) {
			 if (json.hasOwnProperty(key)) {
				 var item = json[key];
				 value+=item+"&&";
			 }
		 }
		  value+="||";
	  }
	  return value;
}


//common function regarding to partner and HSV 
function openBankPopup(id,finInsName,divId)
{
	if(finInsName=='BANK' ||finInsName=='1')
	{
	$('#bankTableId').html("<tr><td width='50%' align='right'>Banks List</td><td align='left' width='50%'></td></tr>");
	$.ajax({
		type:"POST",
		url : "ajax/bankList",
		dataType: "json",
		success:function(response)
		{
			for(var i=0;i<response.length;i++)
			{
				$('#bankTableId').append("<tr><td width='50%' align='right'>"+response[i].name+"</td><td width='50%' align='left'><input type='checkbox' id='bank"+response[i].id+"' value="+response[i].id+"</td>");
			}
		}
	});
	
		if($("#"+id).prop('checked'))
		{
			//$('#'+divId).attr('title', 'Banks List');
			$('#'+divId).dialog({
				width: 375,
				height: 225,
				buttons : {
					"submit" : function ()
					{
						$(this).dialog("close");
					}
			},
			title: "Set the title To Edit"
			});	
		}
	}
}

function showFsp(fsp,fspId)
{
	//alert("alert inside fsp :"+$('#'+fsp).prop('checked'));
	if($('#'+fsp).prop('checked'))
	{
		$('#'+fspId).show();
	}
	else
	{
		$('#'+fspId).hide();
	}
}

function showRiFsp(rifspfinancialInstrument,riFspProviderId)
{
	if($('#'+rifspfinancialInstrument).prop('checked'))
	{
		$('#'+riFspProviderId).show();
	}
	else
	{
		$('#'+riFspProviderId).hide();
	}
}

function validateEmail(sEmail,errorId,label) {
	var sEmailVal=$.trim($("#"+sEmail).val());
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmailVal)) {
        return true;
    }
    else {
    	$("#"+sEmail).val('');
    	$('#'+errorId).show();
    	$('#'+errorId).html("<font color='red'> Invalid email</font>");
    	$('#'+label).hide();
        
    }
}

/*function emailValidation(sEmail,errorId,msg)
{
	alert("common fn called")
	var sEmailVal=$.trim($("#"+sEmail).val());
	alert(sEmailVal);
	//var asciiValue = event.which || event.keycode;
    //asciiValue = eval(asciiValue);
	 var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if (reg.test(sEmailVal)){
		 emptyerror(event,errorId,msg);
	 return true; 
	}
	 else{
		 $('#'+errorId).show();
		 $('#'+errorId).html("<font color='red'> Not a valid Email-id</font>");
		 $('#'+sEmail).val('');
		 event.preventDefault();
	 return false;
	 } 

}*/
function emptyerrormsg(errorid){	
	$("#"+errorid).hide();
	
}





function  passwordLength(labelId,errorId,value){
	var userPassword=	$('#'+value).val().trim();
	if((userPassword.length!=0)&&(userPassword.length<6)){
		$('#'+labelId).hide();
		$('#'+errorId).show();
		$('#'+errorId).html("<font color='red'>Password length should not be less than 6 </font>");
		$('#'+value).val('');
	}
	}

function mobLength(event,mobileId,mobileNumberErrorId){
	

	 var mobLength=$('#'+mobileId).val().trim();
	 if(mobLength!=0){
	 if(mobLength.length<10){
	  $('#'+mobileNumberErrorId).show();
	  $('#'+mobileId).val('');
	  $('#'+mobileNumberErrorId).html("<font color='red'>Mobile Number should be 10 digit long</font>")
	  return false;
	 }
	 } 
}

function checkField(value,tablename,field,errorId,lableid)
{
	  var table=tablename;
	  var field=field;
	  var val= $('#'+value).val().trim();
	if(val.length>0 && val.length>2){
	$.ajax({
		   url: "/securebanking/AdminUI/common/ajax/checkfieled",
		   type: "GET",
		   dataType:"json",
		   data: "val="+val+'&table='+table+'&field='+field,
		   success:function(response){
			   
			   if(response==1)
				{
					  $('#'+errorId).show();
				      $('#'+lableid).hide();
				     $('#'+errorId).html("<font color='red'>Name Already Exist</font>");

				     $("#"+value).val('');
					
				}
				if(response==0)
				{
					
					 $('#'+errorId).addClass("valid");
					  $('#'+errorId).show();
				     
					  $('#'+lableid).hide();
				     $('#'+errorId).html("<font color='green'>Name available</font>");
				}
			   
		   },
		   error:function(e)
		   {
			//   alert(e);
		   }
		   });
	}else{
		  $('#'+errorId).show();
	      $('#'+lableid).hide();
	     $('#'+errorId).html("<font color='red'>Length should be greater than or equal to 3</font>");

	     $("#"+value).val('');
	}


}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}


function refresh1(errorId,labelid)
{
	
	$("#"+errorId).html("");
	$("#"+labelid).show();
	
}

/*function validateEmail(emailField){
	console.log("Email Validation");
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test($('#'+emailField).val()) == false) 
    {
    	$('#label_emailId').hide();
		$('#lab_Email_IdErrorId').show();
		$('#lab_Email_IdErrorId').html("<font color='red'>Enter valid Email</font>");
		$('#'+emailField).val('');
        return false;
    }

    return true;

}*/


function validatePort(PortField){
    var reg = /^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$/;

    if (reg.test(PortField.value) == false) 
    {
    	$('#portId1').hide();
		$('#portErrorId').show();
		$('#portErrorId').html("<font color='red'>Enter valid Port</font>");
		$(portId).val('');
        return false;
        
    }

    return true;

}

function onlyNum(mobileNumber) {
    var $this = $('#'+mobileNumber);
    $this.val($this.val().replace(/\D/g, ''));

  }



function onlyAlphabetNew(event,errorid)
{
	
	//Sonu//

	var asciiValue = event.which || event.keyCode;
	
    asciiValue = eval(asciiValue);

    if((asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122)||(asciiValue==8)||(asciiValue==32)||(asciiValue==9) ||(asciiValue==11))
	{
    	
    	$('#'+errorid).hide();
    	
	}
    else
    {
    	
    	$('#'+errorid).html("<font color='red'>Only Alphabets are allowed</font>");
    	$('#'+errorid).show();
    	event.preventDefault();
    	return false;
    }
	emptyerror(errorid,msg);
}


function emptyCheck(id,divId){
	var value=$("#"+id).val();
	if(value.length==0){
	 $('#'+divId).addClass("has-error");
	return false;
	}else{
		return true;
	}
}



function resetValue(event){
	$('#startDate').val('');
	$('#endDate').val('');
	$('#rtid').val('');
	$('#host').val('');
}





