hello

<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
		                        <div id="divID_start_date"  class="styled-input" >
		                        	<div class="input-group date datetimepicker1">
									<form:input
										id="lab_start_date" path="fromDate" class=" selecttag"
										autocomplete="off" onchange="selecttag('label_fromDate','lab_start_date');" 
										onfocus="emptyerror(event,'lab_start_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('divID_start_date');showlabel('label_fromDate','lab_start_date_ErrorId')"  />
										<label id="label_fromDate" class="valid"><spring:message code="lab_start_date" /></label>
										<label id="lab_start_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon" > <i class="glyphicon glyphicon-calendar"
										 onclick="selecttag1('label_fromDate');showlabel('label_fromDate','lab_start_date_ErrorId');removeHasError('divID_start_date');"></i> </i>
					    			</div>
					    		</div>
					    	</div>
					    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">	
					    		<div id="toDate_divID" class="styled-input" >
					    			<div class="input-group date datetimepicker1">
									<form:input id="lab_end_date" autocomplete="off"
										path="toDate" class="selecttag" type="text" 
										onchange="selecttag('label_toDate','lab_end_date');" 
										onfocus="emptyerror(event,'lab_end_date_ErrorId');emptyerror(event,'errorId');
										removeHasError('toDate_divID');showlabel('label_toDate','lab_end_date_ErrorId')"/>
											<label id="label_toDate" class="valid"><spring:message code="lab_end_date" /></label>
											<label id="lab_end_date_ErrorId" class="collapse"></label>
										<i class="input-group-addon"> <i class="glyphicon glyphicon-calendar" 
										onclick="selecttag1('label_toDate');showlabel('label_toDate','lab_end_date_ErrorId');removeHasError('toDate_divID');"></i> </i>
					    		</div>
                      		</div>
                      	</div>