function getCheckedServicesForAgent(agentId){
	$("#sucessMessage").html("");
	$("#errorMessage").html("");
	$('.ServiceCheck').each(function () {
	     $(this).prop('checked',false);
	  });
	$.ajax({
		async: false,
		url: 'ajax/getAgentServices',
		type:'POST',
		dataType: "json",
		data:'agentId='+agentId,
		success:function(response)
		{
			 if ( $.fn.DataTable.isDataTable( '#table_id_companyTable1' ) ) {
			        $("#table_id_companyTable1").dataTable().fnDestroy()
			      }
			 var content = '';
			 for(var i=0;i<response[0].length;i++){
				var a=response[0][i].subcategories;
			 content+='<tr><td align="left" >&nbsp;&nbsp;&nbsp;&nbsp;<input type=checkbox onclick="getsubServices(\''+response[0][i].subcategories+'\')" class="ServiceCheck" id=serviceCheck'+response[0][i].id+'  name="serviceCheck"  value="'+response[0][i].id+'"></td><td>'+response[0][i].name+'</td><td>'+response[0][i].serviceCategory+'</td>';
			 }
			 $('#table_id_companyTable1 tbody').html(''); 
			 $('#table_id_companyTable1 tbody').html(content); 
			 for(var i=0;i<response[1].length;i++){
					$("#serviceCheck"+response[1][i]).prop('checked',true);
				}
			 $('#table_id_companyTable1').DataTable( {
		         "scrollY":        "400px",
		         "scrollCollapse": true,
		         "paging":         true,
		         "pagingType": "simple_numbers",
		         "pageLength": 50
		     } );
			
			
		},
		  error: function(e) {
											
				  }
	});
}
function getCheckedServicesForAgentCompany(agentCoId){
	$("#sucessMessage").html("");
	$('.ServiceCheck').each(function () {
	     $(this).prop('checked',false);
	  });
	$.ajax({
		async: false,
		url: 'ajax/getAgentCoServices',
		type:'POST',
		dataType: "json",
		data:'agentId='+agentCoId,
		success:function(response)
		{
			 if ( $.fn.DataTable.isDataTable( '#table_id_companyTable1' ) ) {
			        $("#table_id_companyTable1").dataTable().fnDestroy()
			      }
			 var content = '';
			 for(var i=0;i<response[0].length;i++){
			 content+='<tr><td align="left" >&nbsp;&nbsp;&nbsp;&nbsp;<input type=checkbox onclick="getsubServices(\''+response[0][i].subcategories+'\')" class="ServiceCheck" id=serviceCheck'+response[0][i].id+'  name="serviceCheck"  value="'+response[0][i].id+'"></td><td>'+response[0][i].name+'</td><td>'+response[0][i].serviceCategory+'</td>';
			 }
			 $('#table_id_companyTable1 tbody').html(''); 
			 $('#table_id_companyTable1 tbody').html(content); 
			 for(var i=0;i<response[1].length;i++){
					$("#serviceCheck"+response[1][i]).prop('checked',true);
				}
			 $('#table_id_companyTable1').DataTable( {
		         "scrollY":        "400px",
		         "scrollCollapse": true,
		         "paging":         true,
		         "pagingType": "simple_numbers"
		     } );
			
		
		},
		  error: function(e) {
											
				  }
	});
}


function validateApiform()
{
	$("#sucessMessage").html("");
	var table = $('#table_id_companyTable1').DataTable();
	 
	var matches = [];
    var checkedcollection = table.$(".ServiceCheck:checked", { "page": "all" });
    checkedcollection.each(function (index, elem) {
        matches.push(parseInt($(elem).val()));
    });
  
    var AccountsJsonString = JSON.stringify(matches);
	$("#serviceArray").val(AccountsJsonString);
	
	
	var tableAgent = $('#table_id').DataTable();
	var matchesAgent = [];
    var agentcheckedcollection = tableAgent.$(".agentCheck:checked", { "page": "all" });
    agentcheckedcollection.each(function (index, elem) {
    	matchesAgent.push(parseInt($(elem).val()));
    });
  
    var matchesAgentString = JSON.stringify(matchesAgent);
	$("#agentArray").val(matchesAgentString);
	
	 //-----------------------------------------------------------------
	var tableAgentCompany = $('#table_id_companyTable').DataTable();
	var matchesAgentCompany = [];
    var agentCompanycheckedcollection = tableAgentCompany.$(".companyCheck:checked", { "page": "all" });
    agentCompanycheckedcollection.each(function (index, elem) {
    	matchesAgentCompany.push(parseInt($(elem).val()));
    });
 
    var matchesAgentCompanyString = JSON.stringify(matchesAgentCompany);
	$("#agentCompanyArray").val(matchesAgentCompanyString);
	
	 //-----------------------------------------------------------------
	
 var mappedby=$("input[name='mappedBy']:checked").val();
 if(mappedby=='agent'){
var inputs = document.getElementsByClassName("agentCheck");
 var pickedOne = false;
 for(var i = 0, l = inputs.length; i < l; ++i) {
	    if(inputs[i].checked) {
	      pickedOne = true;
	      break;
	    }
	  }
 if(pickedOne==false){
	 $('#errormsg').text("Select Agent ");
	 $('#errormsg').show();
	 return false;
 }
 }else
 if(mappedby=='company'){
	// var mappedby=$("input[name='companyCheck']:checked").val();
	 var inputs = document.getElementsByClassName("companyCheck");
	 	 var pickedOne = false;
	 	 for(var i = 0, l = inputs.length; i < l; ++i) {
	 		    if(inputs[i].checked) {
	 		      pickedOne = true;
	 		      break;
	 		    }
	 		  }
	 	 if(pickedOne==false){
	 		 $('#errormsg').text("Select Company ");
	 		 $('#errormsg').show();
	 		 return false;
	 	 }
	 	 }
 var inputss = document.getElementsByClassName("ServiceCheck");
	 var picked = false;
	 for(var i = 0, l = inputss.length; i < l; ++i) {
		    if(inputss[i].checked) {
		      picked = true;
		      break;
		    }
		  }
	 if(picked==false){
		 $('#errormsg').text("Select Service ");
		 $('#errormsg').show();
		 return false;
	 }
 



} 

function validateEditApiform()
{
	$("#sucessMessage").html("");
	
	 var mappedby=$("input[name='mappedBy']:checked").val();
	 if(mappedby=='agent'){
		 if ( $.fn.DataTable.isDataTable( '#table_id' ) ) {
		        $("#table_id").dataTable().fnDestroy();
		      }
	var inputs=$("input[name='chk']:checked").val();
	 $('#table_id').DataTable( {
         "scrollY":        "400px",
         "scrollCollapse": true,
         "paging":         true,
         "pagingType": "simple_numbers"
     } );
	 if(inputs==undefined){
		 $('#errormsg').text("Select Agent ");
		 $('#errormsg').show();
		 return false;	
	}else{
		$("#agentArray").val(inputs);
	}
	 
	 }else
	 if(mappedby=='company'){
		 
		 
		 
		 var table = $('#table_id_companyTable').DataTable();
		 
			var matches = [];
		    var checkedcollection = table.$(".companyCheck:checked", { "page": "all" });
		    checkedcollection.each(function (index, elem) {
		        matches.push(parseInt($(elem).val()));
		    });
		  
		    var AccountsJsonString = JSON.stringify(matches);
			$("#agentCompanyArray").val(AccountsJsonString); 
		 
			
		 	 }
	 
	 
	 if ( $.fn.DataTable.isDataTable( '#table_id_companyTable1' ) ) {
	        $("#table_id_companyTable1").dataTable().fnDestroy();
	      }
	 
	 var table = $('#table_id_companyTable1').DataTable();
	 
		var matches = [];
	    var checkedcollection = table.$(".ServiceCheck:checked", { "page": "all" });
	    checkedcollection.each(function (index, elem) {
	        matches.push(parseInt($(elem).val()));
	    });
	  
	    var AccountsJsonString = JSON.stringify(matches);
		$("#serviceArray").val(AccountsJsonString);
	 

} 

function getsubServices(subservices){
	$("#sucessMessage").html("");
	var subservicesArray= subservices.split(",");
	
	    if ( $.fn.DataTable.isDataTable( '#table_id_companyTable1' ) ) {
	        $("#table_id_companyTable1").dataTable().fnDestroy();
	      }
	    	for(var i=0;i<subservicesArray.length;i++){
	    		$("#serviceCheck"+subservicesArray[i]).prop('checked',true);
	    	}
	$('#table_id_companyTable1').DataTable( {
		         "scrollY":        "400px",
		         "scrollCollapse": true,
		         "paging":         true,
		         "pagingType": "simple_numbers",
		        	 "pageLength": 50
		     } );
	
	
	
	
}
function checkAll(){
	 if ( $.fn.DataTable.isDataTable( '#table_id_companyTable1' ) ) {
	        $("#table_id_companyTable1").dataTable().fnDestroy()
	      }
	 // Check or Uncheck All checkboxes
	  $("#checkall").change(function(){
	    var checked = $(this).is(':checked');
	    if(checked){
	      $(".ServiceCheck").each(function(){
	        $(this).prop("checked",true);
	      });
	    }else{
	      $(".ServiceCheck").each(function(){
	        $(this).prop("checked",false);
	      });
	    }
	  });

	 // Changing state of CheckAll checkbox 
	 $(".ServiceCheck").click(function(){

	   if($(".ServiceCheck").length == $(".ServiceCheck:checked").length) {
	     $("#checkall").prop("checked", true);
	   } else {
	     $("#checkall").removeAttr("checked");
	   }

	 });
	 
	 $('#table_id_companyTable1').DataTable( {
         "scrollY":        "400px",
         "scrollCollapse": true,
         "paging":         true,
         "pagingType": "simple_numbers",
         "pageLength": 50
     } );
	
}