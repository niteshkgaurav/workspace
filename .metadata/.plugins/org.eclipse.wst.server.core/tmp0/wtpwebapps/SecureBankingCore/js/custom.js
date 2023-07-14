$("#menu-toggle").click(function(e) {
	"use strict";
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
	$(this).toggleClass("menu-active");
});
//$(document).ready(function() {
//	"use strict";
//    $('#example').DataTable();
//} );


var accountadd = new Array();
var accountdel = new Array();
function addAccountIdForMenu(obj) {
	if(obj.checked) {
		var str = obj.value;
		var pos = accountadd.indexOf(str);
		if(pos < 0) {
			accountadd.push(str);
		} else {
			delete accountadd[pos];
		}
	} else {
		var str = obj.value;
		var pos = accountdel.indexOf(str);
		if(pos < 0) {
			accountdel.push(str);
		} else {
			delete accountdel[pos];
		}
		
	}
	
}

function convertArraytoString() {
	var add="";
	var del="";
//	console.log("Add length = "+accountadd.length);
//	console.log("Del length = "+accountdel.length);
//	console.log(JSON.stringify(accountdel));
	for(var i=0; i<accountadd.length; i++) {
		if(accountadd[i] != null) {
			if(add == "")
				add = accountadd[i];
			else 
				add = add+"$"+accountadd[i];
		}
	}
	
	for(var i=0; i<accountdel.length; i++) {
		if(accountdel[i] != null) {
			if(del == "")
				del = accountdel[i];
			else 
				del = del+"$"+accountdel[i];
		}
	}
//	console.log(JSON.stringify(add));
//	console.log(JSON.stringify(del));
	
	
	document.getElementById("accountadd").value = add;
	document.getElementById("accountdel").value = del;
	
	return true;
}
