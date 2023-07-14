function welcome(index,type,key,obj) 
{
	var tbody = document.getElementById("CorrDetailTableTbody");
	if ( tbody == null) {
		tbody = document.createElement("tbody");
		tbody.id = "CorrDetailTableTbody";
		document.getElementById("CorrDetailTable").appendChild(tbody);		
	}
	var docFragment = document.createDocumentFragment();
	var trElem, tdElem, txtNode;
	trElem = document.createElement("tr");
	trElem.className = "table_title";
	trElem.id="CorrDetailTableDynTr";

	tdElem = makeTdElement(obj.CAPTION, tellLongType() );
	trElem.appendChild(tdElem);

	tdElem = makeTdElement( (obj.VALUE ? obj.VALUE: "") , false);
	trElem.appendChild(tdElem);

	docFragment.appendChild(trElem);
	tbody.appendChild(docFragment);	
	//
}
function makeTdElement(txt,flag) {
	tdElem = document.createElement("td");
	if ( flag ) {
		tdElem.setAttribute("nowrap","nowrap");
	}
	txtNode = document.createTextNode(txt);
	tdElem.appendChild(txtNode);	
	return tdElem;
}
