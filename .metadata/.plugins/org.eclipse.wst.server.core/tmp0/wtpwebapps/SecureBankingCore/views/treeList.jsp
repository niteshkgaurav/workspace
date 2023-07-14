<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/css/bootstrap-treeview.css />
<script type="text/javascript"src="${pageContext.request.contextPath}/js/bootstrap-treeview.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	debugger;
	  var treeData='${treeData}';
        var $searchableTree = $('#treeview-searchable').treeview({
        	 data: treeData, 
   		  showTags: true,
   		  color: "#428bca",
      		expandIcon: "glyphicon glyphicon-stop",
            collapseIcon: "glyphicon glyphicon-unchecked",
            nodeIcon: "glyphicon glyphicon-user", 
            onhoverColor: "#e3a122",
            borderColor: "red",
            selectedColor: "#428bca",
            selectedBackColor: "#fcdb9a",
          });
          var search = function(e) {
            var pattern = $('#input-search').val();
            var options = {
              ignoreCase: true,
              exactMatch: false,
              revealResults: true
            };
            var results = $searchableTree.treeview('search', [ pattern, options ]);
            var output = '<p>' + results.length + ' matches found</p>';
            $.each(results, function (index, result) {
              output += '<p>- ' + result.text + '</p>';
            });
            $('#search-output').html(output);
          }
          $('#btn-search').on('click', search);
          $('#input-search').on('keyup', search);
          $('#btn-clear-search').on('click', function (e) {
            $searchableTree.treeview('clearSearch');
            $('#input-search').val('');
            $('#search-output').html('');
          });
});
</script>
<title>Insert title here</title>
</head>
<body>

<div class="heading-inner">
	     <!-- ****************************************** Form Heading  ******************************* -->
	                      <h1 class="pull-left">Tree View</h1>
	                      <div class="clearfix"></div>
	                          <hr>
	                      </div>
	                      

			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mt"></div>
         <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 mt ">
          <!-- <form> -->
            <div class="form-group " align="right">
            
            <table>
            <tr>
            <td>
              <label for="input-search" class="sr-only">Search Tree:</label>
              <input type="input" class="form-control" id="input-search" placeholder="Type to search..." value=""></td>
              <td>&nbsp;&nbsp; <button type="button" class="btn btn-info" id="btn-clear-search">Clear</button></td>
               </tr>
               </table>
            </div>
 <!--            <div class="checkbox">
              <label>
                <input type="checkbox" class="checkbox" id="chk-ignore-case" value="false">
                Ignore Case
              </label>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" class="checkbox" id="chk-exact-match" value="false">
                Exact Match
              </label>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" class="checkbox" id="chk-reveal-results" value="false">
                Reveal Results
              </label>
            </div> -->
           
          <!-- </form> -->
        </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt ">
        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
          <h1>Tree</h1>
          <div id="treeview-searchable"></div>
        </div>
        <div class="col-sm-4">
          <h1>Results</h1>
          <div id="search-output"></div>
        </div>
      </div>
</body>
</html>