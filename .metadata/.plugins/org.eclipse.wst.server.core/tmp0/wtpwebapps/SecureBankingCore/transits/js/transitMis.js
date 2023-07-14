
function getDetail(ids)
{
	$('#tabb').show();
	 var option=$("#selectBox option:selected").val().trim();
	 var dateTo=$("#dateTo").val().trim();
	 var dateFrom=$("#dateFrom").val().trim();	
	 var id=ids.trim();
	// alert(option+" "+dateTo+" "+dateFrom);
	 $("#datas").empty();
	 $.ajax({
			url: "ajax/getDetails",
			type: "POST",
			async:false,
			dataType: "json",
			data: "id="+id+"&option="+option+"&dateTo="+dateTo+"&dateFrom="+dateFrom,
			success:function(response){
				if(response.length!=0)
					{
					var data=response;
			$.each(data,function(key,value)
					{
					var row=value;
					$("#datas").append("<tr><td>"+row.txnnType+"</td><td>"+row.txnDate+"</td><td>"+row.customerCardId+"</td><td>"+row.routeId+"</td><td>"+row.tripAmount+"</td><td>"+row.txnAmount+"</td><td>"+row.busId+"</td><td>"+row.userId+"</td></tr>");
						
					});
			$("#idd").val(id);
			$("#downloadId").show();
			}
				else
					{
					$("#datas").append("<tr><td colspan='8' align='çenter'> No Data Found</td></tr>");
					$("#downloadId").hide();
					}
				
			},
	  error: function(e) {
		   alert("error: "+e);
		    }
	
	 });

}