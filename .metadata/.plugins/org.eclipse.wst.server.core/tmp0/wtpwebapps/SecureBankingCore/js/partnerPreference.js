function validateMerchantPage()
{
	var check=true;
	
	var type=$( "#lab_account_type").val();
	var type1=$( "#lab_account_type1").val();
	var type2=$( "#lab_account_type2").val();
	//alert(type1+":"+type2)
	if(type=="."){
		
		$("#label_account_type").hide();
		$("#lab_partnerErrorId").show();
		$("#lab_partnerErrorId").html("<p class='text-danger'>Kindly select.</p>");
		check=false;
	}
	if((type1==".") && (type2==".")){
		$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
		check=false;
	}
	if((type1==".")&& ($('#seq1').is(':checked'))){
		$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
		check=false;
	}
	else if((type2!=".")&& ($('#seq1').not(':checked'))){
		//$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
		//check=true;
	}
	
	if($('#seq1').is(':checked')){
		if(type1=="."){
			$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
			check=false;
		}	
		}
	
	if($('#seq2').is(':checked')){
		if(type2=="."){
			$("#seqErrorId").html("<p class='text-danger'>Kindly select sequence.</p>");
			check=false;
		}
		
		}
	
	if(type1!="."){
		if(type1==type2){
			
			$("#label_account_type1").hide();
			$("#label_account_type2").hide();
			$("#lab_partnerPrefErrorId").show();
			$("#lab_partnerPrefErrorId").addClass("valid");
			$("#lab_partnerPrefErrorId").html("<p class='text-danger'>Duplicate sequence are not allowed.</p>");
			check=false;
		}}
	/*if($('#seq1').not(':checked')&&$('#seq2').is(':checked')){$("#seqErrorId").html('');}*/
	if(!check){
		check= false;
	}
	else{
		//check= true;
}
	return check;
}
function enableSelect()
{

	$("#seqErrorId").html("");
	$("#lab_account_type1").val('');
	$('#lab_partnerPrefErrorId').html('');
	//alert('hi')
	if($('#seq1').not(':checked')){
		$( "#lab_account_type1").val('.');
		
	}
	if($('#seq1').is(':checked')){
	//	alert('hi')
		$("#select1").load(location.href + " #select1");
		
	}
	else{
		($('#seq1').is(':checked')) ? $('#row1').show() : $("#lab_account_type1").attr("disabled", true);
			//$("#select1").load(location.href + " #select1");
			
		}
	
}

function enableSelect2()
{
	
	$("#seqErrorId").html("");
	$("#lab_account_type2").val('');
	$('#lab_partnerPrefErrorId').html('');
	//alert('hi')	
	if($('#seq2').not(':checked')){
		$( "#lab_account_type2").val('.');
		
	}
	if($('#seq2').is(':checked')){
	//	alert('hi')
		$("#select2").load(location.href + " #select2");
		
	}
	else{
		($('#seq2').is(':checked')) ? $('#row2').show() : $("#lab_account_type2").attr("disabled", true);
			//$("#select1").load(location.href + " #select1");
			
		}
	
}



function managePartnerpref(name,errorId,selectId)
{
	var values=[];	
	var el=$( "#"+selectId+" option:selected" ).text();
	//alert(el)
	values = $.map($('select[name='+name+'\]'), function (e) {
        return $('option:selected', e).text();
    });

	for(var i=0;i<values.length;i++)
		{
			values[i]=values[i].replace(/\D+/g, '');
		}
	values = values.filter(Boolean);

	
	if (values.indexOf(el) == values.lastIndexOf(el))
	{
	}	
	else
	{
		$("#"+errorId).html("<p class='text-danger'>No two partners can have same preference.</p>");
		$("#"+errorId).show();
		$( "#"+partnerSequenceId).val('');
	}
}

function checkDuplicateValue(selectId){
	$("#seqErrorId").html("");
	if(document.getElementById('seq1').checked){
		$('#row2').show();
	}
	
	//var s=$( "#lab_account_type1").val();
	//var m=$( "#"+selectId+" option:selected" ).text();
	//checkDuplicateValue=s;
		//checkDuplicateValue(m);
	//alert();
	
}




/*function checkDuplicateValue(m){
	var a;
	
	if ($.inArray(m, arr) != -1)
	{
	  
	  $('#duplicateErrorId').html("<p class='text-danger'>Duplicate selection of products not allowed.</p>"); 
		a=0;
		return a;
	}
	else{
		arr.push(m);
		a=1;
		return a;
	}
}*/
