
function getSelectOption(id){
	
	$('#priority'+id).empty();
	
	var count=$("#count").val();
	
	
	
	for(var i=1;i<=count;i++){
		$('#priority'+id).append('<option value='+i+'>'+i+'</option>');
		
	}
	var priorityval = document.getElementsByClassName("priority");
	
	
}
var count=0;
function chkBoxClick(a)
{
	var box=$('#count').val(); //3
	var next=count+1;
	if($('#sysAccountGroupArray'+a).is(':checked'))
		{
		if(next>box)
		{
			$('#sysAccountGroupArray'+a).attr('checked',false);
		return false;
		}
	count++;
		}
	else
		{
		count--;
		}
	return true;
}

function enableCheckBox()
{
	var val=($('#count').val()==undefined)?0:$('#count').val().trim().length;
	if(val>0)
		{
		var arr = $(".tbody").children();
		$.each(arr, function( index, value ) {
		$(arr[index]).children().children().first().attr('disabled','false');
		;
		});
		}

}
function checkEnable(a)
{
	if($('#sysAccountGroupArray'+a).is(':checked'))
		{
		$('#priority'+a).prop( "disabled", false);
		
		}
	else
		{
		$('#priority'+a).val('');
		$('#priority'+a).prop( "disabled", true);
		}
}
function getpreview(event){
	var check=true;
	var priorityList=document.getElementsByName("priority");  
	var priorityArray=[];
	for(var i=0;i<priorityList.length;i++){
		priorityArray.push(priorityList[i].value)
		
	}

	
	for(var i=0;i<priorityArray.length-1;i++)
	{	
		for(var j=i+1;j<priorityArray.length;j++)
		{

			if(priorityArray[i].length!=0 && priorityArray[i]==priorityArray[j])
			{ 
				$('#mssg').show();
				$('#mssg').html('<font color="red"> Duplicate selection of priority not allowed.</font>');
				check=false;

			}

		}
	}
	
	
	var checkedata=[];
	
	
	$(".sysAccountGroupArray:checked").each(function() 
	{
		var values = $(this).val();
		
		var arrayOfStrings = values.split('#');
		
		checkedata.push([[arrayOfStrings[0]],[$("#priority"+arrayOfStrings[1]).val()]]);
	});
	
	checkedata.sort(function(a,b){
	    return a[1] - b[1];
	});
		
	var string=""
	for (var i=0; i<checkedata.length; i++) {
		
		if(i==0)
		string=checkedata[i][0];
		else
			string=string+'+'+checkedata[i][0];
	    }
	 $("#string").val(string);
	 if(!check){
		  
		   event.preventDefault();
			return false;
		  }
	
}

function clearMssg()
{
	$('#mssg').html("");
	$('#success').html("");
}
function validation(event){
	

	var final=$('#string').val().trim();
	if(final.length <1)
		{
		$('#mssg').html("<font color='red'>fill details</font>");
		event.preventDefault();
		return false;
		}
	getpreview(event);
	/*if(((txnCount.length!=0)||(txnType.length!=0)||(txnStatus.length!=0))&&(endDate.length!=0)||(startDate.length==0)){
		$('#DIV_startDate').addClass("has-error");
		$('#DIV_endDate').addClass("has-error");
		$('#statusMessage').show();
		$('#statusMessage').html("Choose both start date and end date before submit");
		 return false;
		 event.preventDefault();
	}*/
	
	
	
	
	
	}















function validateGetToken(event){
var check=true;
var name=$("#name").val();
if(name.length==0){
	$("#div_count").addClass('has-error');
	check=false;
}
if($("input[name='sysAccountGroupArray']:checked").size()==0){
	$("#errorid").html("<font color=red>Select checkBox</font>")
	$("#errorid").show();
	check=false;
	event.preventDefault();
}



var description=$("#description").val();
if(description.length==0){
$("#div_description").addClass('has-error');
check=false;
}
if(!check){
check=false;
event.preventDefault();
}

var menuIndex=$("#menuIndex").val();
if(menuIndex.length==0){
	$("#div_menuIndex").addClass('has-error');
	check=false;
}
if(!check){
	check=false;
	event.preventDefault();
}

var placement=$("#placement").val();
if(placement.length==0){
	$("#div_placement").addClass('has-error');
	check=false;
}
if(!check){
	check=false;
	event.preventDefault();
}
	 
var action=$("#action").val();
if(action.length==0){
	$("#div_action").addClass('has-error');
	check=false;
}
if(!check){
	check=false;
	event.preventDefault();
}

var priority=$("#priority").val();
if(priority.length==0){
	$("#div_priority").addClass('has-error');
	check=false;
}
if(!check){
	check=false;
	event.preventDefault();
}
return check;
}

$( ".btn" ).load(function() {
	disableCheckBoxOnLoad();
});

function disableCheckBoxOnLoad(){
	
	var arr = $(".tbody").children();
	$.each(arr, function( index, value ) {
	$(arr[index]).children().children().first().attr('disabled','disabled');
	;
	});
}
