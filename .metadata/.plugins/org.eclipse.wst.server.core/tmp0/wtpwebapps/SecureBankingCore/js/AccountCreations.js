	$(document).ready(function()
				
				{ /* $("#SearchByTable").hide();
				$("#SearchByAutoSearch").hide(); 
				 */
			var type=$("#Select_type").val();
			if(type=='HOST'){
			$("#hostRowId").show();
			$("#host").show();
			$("#host1").show();
			$("#host2").show();
			$("#hostId").show();
			}
			if(type=='VENDOR'){
				$("#hostRowId").show();
				$("#vendor1").show();
				$("#vendor").show();
				$("#vendor2").show();
				//$("#table_id").hide();
				$("#header1").hide();
				$("#vendorId").show();
			}
			});  