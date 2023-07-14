function getMisData()
{
$("#txnDataId").dataTable( {
		"language": {
		      "emptyTable": "No record available."
		    },
        "bProcessing": true,
        "bServerSide": true,
       // "sort": "position",
        "aaSorting": [],
        "order": [],
        "scrollY":        "220px",
        "scrollCollapse": true,
        //bStateSave variable you can use to save state on client cookies: set value "true" 
       // "bStateSave": true,
        //Default: Page display length
        "iDisplayLength": 10,
        //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
        "iDisplayStart": 0,
        "fnDrawCallback": function () {
            //Get page numer on client. Please note: number start from 0 So
            //for the first page you will see 0 second page 1 third page 2...
            //Un-comment below alert to see page number
        	//alert("Current page number: "+this.fnPagingInfo().iPage);    
        },  
        destroy: true,
        "sAjaxSource": "txnMisDetails",
        "fnServerParams": function ( aoData ) {
          /* aoData.push( { "name": "productId", "value": productId },
                    { "name": "versionId", "value": versionId},
                    { "name": "hostId", "value": hostId},
                    { "name": "distId", "value": distId},
					{ "name": "subDistId", "value": subDistId},
					 { "name": "retailerId", "value": retailerId},
					 { "name": "acntTypId", "value": acntTypId},
					 { "name": "inventoryStatusTypes", "value": inventoryStatusTypes}
            
            );*/
       }, 
        "aoColumns": [
            { "mData": "sno" },
            { "mData": "txnType" },
            { "mData": "status" },
            { "mData": "ip" },
            { "mData": "clientStoreId" },
            { "mData": "clientBusinessDate" },
            { "mData": "clientCounterNo" },
            { "mData": "clientOperatorId" },
            { "mData": "clientTxnId" },
            { "mData": "txnId" },
            { "mData": "txnAmount" },
            { "mData": "custPhnNo" },
            { "mData": "custName" },
            { "mData": "walletName"},
            { "mData": "initiator"},
            { "mData": "userType"},
            { "mData": "parentName"},
            { "mData": "storeName"},
        ]
    } );

}