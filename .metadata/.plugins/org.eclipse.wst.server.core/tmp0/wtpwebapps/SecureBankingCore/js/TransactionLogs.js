function removemsg(errorId) {	
	$('#'+errorId).html("");
}

var transactionLogsDTO;
function raiseQuery(evt) {
	var $row = evt.closest("tr"); 
	var isRai = $row.find("td:nth-child(15)").text();
    if(isRai == "Query Raised") {
    	var queryDescription = $row.find("td:nth-child(11)").text();
        var queryRaiseDate = $row.find("td:nth-child(12)").text();
        var queryStatus = $row.find("td:nth-child(13)").text();
    	$('#descQ').text(queryDescription);
    	$('#dateQ').text(queryRaiseDate);
    	$('#statusQ').text(queryStatus);
    	var modal = document.getElementById("queryDetails");
    	modal.style.display = "block";    	
    	
    } else {
        var txnId = $row.find("td:nth-child(1)").text();
        var msisdn = $row.find("td:nth-child(5)").text();
        var svc = $row.find("td:nth-child(6)").text();
        var status = $row.find("td:nth-child(7)").text();
        
    	transactionLogsDTO = {
    		"txnId":txnId,
    		"serviceDefnition":svc,
    		"responseStatus":status,
    		"msisdn": msisdn
    	};

    	var modal = document.getElementById("myModal");
    	modal.style.display = "block";
    }
}

function closemodal() {
	var modal = document.getElementById("myModal");
	$("#queryDescription").val('');
	modal.style.display = "none";
}

function closeQueryDetails() {
	var modal = document.getElementById("queryDetails");
	modal.style.display = "none";
}

function viewDetails(evt) {
	var $row = evt.closest("tr"); 
    var amount = $row.find("td:nth-child(8)").text();
    var payee = $row.find("td:nth-child(9)").text();
    var payer = $row.find("td:nth-child(10)").text();

	$('#amount').text(amount);
	$('#payee').text(payee);
	$('#payer').text(payer);
	var modal = document.getElementById("myModalDetails");
	modal.style.display = "block";
}

function closemodalDetails() {
	var modal = document.getElementById("myModalDetails");
	modal.style.display = "none";
}

function raiseQueryB(evt) {
	var desc = $("#queryDescription").val();
	transactionLogsDTO.queryDescription = desc;
	
	$.ajax({
		url: 'ajax/transactionRaiseQuery',
		contentType: "application/json",
		type:'POST',
		data: JSON.stringify(transactionLogsDTO),
		success:function(response) {
			if(response.success=="true"){
				var modal = document.getElementById("myModal");
				$("#queryDescription").val('');
				modal.style.display = "none";
				document.getElementById('transactionLogForm').submit();
			}else {
				$('#msgErrorP').text(response.msg);
				setTimeout(function(){
					$('#msgErrorP').text("");
				}, 3000);
			}
		}
	});
}

function closeCustModal() {
	var modal = document.getElementById("custDetails");
	modal.style.display = "none";
}

function custDetails(evt) {
	var $row = evt.closest("tr"); 
    var name = $row.find("td:nth-child(16)").text();
    var overlayN = $row.find("td:nth-child(17)").text();
    var email = $row.find("td:nth-child(19)").text();
    var dob = $row.find("td:nth-child(20)").text();
    var status = $row.find("td:nth-child(21)").text();
    var address = $row.find("td:nth-child(22)").text();

	$('#custName').text(name);
	$('#overlayN').text(overlayN);
	$('#emailid').text(email);
	$('#dob').text(dob);
	$('#status').text(status);
	$('#kyc').text(address);
	var modal = document.getElementById("custDetails");
	modal.style.display = "block";
}
