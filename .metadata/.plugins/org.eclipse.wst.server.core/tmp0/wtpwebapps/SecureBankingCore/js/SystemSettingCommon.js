$(document).ready( function ()
		{
	        // function for change status on change select box
           $('#newstatus').change(function()
		    	{
				 //setting currently changed option value to option variable 
				var option = $(this).find('option:selected').val();
				 if(option=='1'){
			    	 $("#newstatus option[value='0']").attr("selected",false);
			    	 $("#newstatus option[value="+option+"]").attr("selected", "selected");
			     }
			     else if(option=='0'){
			    	 $("#newstatus option[value='1']").attr("selected",false);
			    	 $("#newstatus option[value="+option+"]").attr("selected", "selected");
			     }
				
			});
		
		});

//function validate special character except given key words ( { } ) 
   function validateSpecialCharacter(event, errorid ,textid){
	        var textInputVal=$("#"+textid).val();
	        var keycode = (event.keyCode ? event.keyCode : event.which);
	 
	    if(keycode == 64 || keycode==33 || keycode==34 || keycode==35 || keycode==36 || keycode==37 || keycode==38){
	    	 $("#"+errorid).html("<b>Special characters are not allowed !</b>").show();
	    	 return false;
	    } 
	 else if(textInputVal.trim()=='' && event.which!=8 && event.which==32){
    		 $("#"+errorid).html("<b>Blank  not allowed !</b>").show();
             return false;
    	}
	   else{
	      
		   $("#"+errorid).html('');
	   
	   }
	
	 }
   

   function onlyNumric(event,errorid){
		
		var keycode = (event.keyCode ? event.keyCode : event.which);
		
		
		 if (event.which != 8 && event.which != 0 && (event.which < 48 || event.which > 57)) {
	         //display error message
	         $("#"+errorid).html("Digits Only").show();
	                return false;
	      }
	       else{
	            $("#"+errorid).html('');
	       }

	}