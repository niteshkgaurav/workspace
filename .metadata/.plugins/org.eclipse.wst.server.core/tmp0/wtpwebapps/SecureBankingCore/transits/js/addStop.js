function checkExtention(event){
	if(document.getElementById("xlsFileId").value != "") {
		var fileName=$("#xlsFileId").val();
		 var allowed_extensions =["xls","xlsx"];
		    var file_extension = fileName.split('.').pop(); 
		    
		    // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.
		    for(var i = 0; i <= allowed_extensions.length; i++)
		    {
		        if(allowed_extensions[i]==file_extension.toLowerCase())
		        {
		        	$('#uploadErrorId').html("");
		        	 check=true;
		        	 
		        	 break;
		        }
		        else{
		        	
		        	 check=false;
		 		    $('#uploadErrorId').show();
		 			$('#uploadErrorId').html('<font color="red" size="2"> Upload valid file</font>');
		        	
		        }
		    }

		   
		}
	else{
		$('#divID_uploadFilePath').addClass('has-error');
		check=false;
	}
	
	if(check==false){
		event.preventDefault();
		return false;
	}
	return check;
	
}