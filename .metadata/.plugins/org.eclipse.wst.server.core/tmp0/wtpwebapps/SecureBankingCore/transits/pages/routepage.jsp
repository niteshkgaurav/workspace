<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jszip.min.js"></script>

<link type="text/css" rel="stylesheet"
 href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" />
<link type="text/css" rel="stylesheet"
 href="${pageContext.request.contextPath}/css/buttons.dataTables.min.css" />
<script type="text/javascript">
 $(document).ready(
   function() {
    var table = $('#route-table').dataTable(
      {
       dom : 'lBfrtip',
       buttons : [ {
        extend : 'excel',
        text : 'Export Excel'
       } ],
       "lengthMenu" : [ 5, 10, 20, 50, 100 ],
       "pagingType" : "simple_numbers",
       "processing" : true,
       "serverSide" : true,
       "ajax" : {
        url : "${pageContext.request.contextPath}/routes.html",
        type : "POST",
        data : function(data) {
         return JSON.stringify(data);
        },
        "dataType" : "json",
        "processData" : false,
        contentType : 'application/json;charset=UTF-8'
       },
       "columns" : [
        {"data" : "routeNumber"}, 
        {"data" : "routeDesc"}, 
        {"data" : "noOfBuses"}, 
        {"data" : "frequency"}, 
        {"data" : "runningTime"}, 
        {"data" : "distanceCovered"} 
        ]
      });
   });

 function refreshTable() {
  var $routeTable = $("#route-table").dataTable({
   bRetrieve : true
  });
  $routeTable.fnDraw();
 }
</script>
</head>
<body onload="refreshTable();">
 <div style="border: 1px solid #cecece; margin-top: 10px; width: 100%">
  <div style="height: 100%; padding: 10px; margin: 30px;">
    <table id="route-table" class="display" >
     <thead>
      <tr>
       <th width="15%;">Route Number</th>
       <th width="25%;">Description</th>
       <th width="15%;">No Of Buses</th>
       <th width="15%;">Frequency</th>
       <th width="15%;">Running Time</th>
       <th width="15%;">Distance Covered</th>       
      </tr>
     </thead>
     <!--  
     <tfoot>
      <tr>
       <th width="15%;">Route Number</th>
       <th width="25%;">Description</th>
       <th width="15%;">No Of Buses</th>
       <th width="15%;">Frequency</th>
       <th width="15%;">Running Time</th>
       <th width="15%;">Distance Covered</th> 
      </tr>
     </tfoot>
     -->
    </table>
  </div>
 </div>
</body>
</html>