//*****************************  code to check csv file extension by Abhishek Mehra **********
function checkCSVFile(fieldId, errorid) {
	// ***************************** Code for check file extension
	// ****************************
	var ext = $('#' + fieldId).val().split('.').pop().toLowerCase();
	if ($.inArray(ext, [ 'csv', 'txt' ]) == -1) {
		$('#' + errorid)
				.html(
						"<b><font color='red'>Kindly upload file having extension .csv or .txt !</font></b>");
		$('#' + fieldId).val('');
		return false;
	}
	// ***************************** Code for check file size
	// ****************************
	var fileSize = $('#' + fieldId)[0].files[0].size;
	var fileSizeKB = Math.round(parseInt(fileSize) / 1024);
	if (fileSizeKB > 2000) {
		$('#' + errorid)
				.html(
						"<b><font color='red'>Kindly upload file having size less than 2 MB !</font></b>");
		$('#' + fieldId).val('');
		return false;
	}
	$('#' + errorid).html("");
}
// ********************** to fetch simFormat ****************************
function simFormat(id) {
	$.ajax({
		type : 'POST',
		url : 'simFormats',
		dataType: "json",
		success : function(response) {
			var valuess = response;
			var num = 1;
			var select = $('#sim_format');
			select.find('option').remove();
			$('<option>').val('').text('<-----Select----->').appendTo(select);
			$.each(valuess, function(key, value) {
				if ((id == '2' && num < 3) || (id == '1' && num < 4)) {
					$('<option>').val(key).text(value).appendTo(select);
					num++;
				}
			});
		}
	});
}
// *************************** Function for check radio buttons
// *****************************************

function showDetails(id, id1) {
	if (id == '1') {
		$('#simInventory').attr('checked', true);
		$('#simWithRFIDInventory').attr('checked', false);
		$('#simVersionNumId').show();
		$('#simFormatNum').show();
		$('#description').show();
		$('#radioSingleBulk').show();
		$('#simSerialNum').hide();
		if (id1 == '1') {
			if ($('#simVersionNum').val() == "") {
				$('#sim_version_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			} else if ($('#sim_format').val() == "") {
				$('#sim_format_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Format !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			}
			$('#singleRecord').attr('checked', true);
			$('#bulkUpload').attr('checked', false);
			$('#simSerialNum').show();
			$('#encryptKey').show();
			$('#upload').hide();
			$('#label_upload').val("");
			$('#downsamplfile').hide();
			$('#simExternalNum').show();
			$('#simPukCode').show();
			$('#pukCounter').show();
			$('#sim_version_num_ErrorId').html("");
			$('#sim_format_ErrorId').html("");
		}
		if (id1 == '2') {
			if ($('#simVersionNum').val() == "") {
				$('#sim_version_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			} else if ($('#sim_format').val() == "") {
				$('#sim_format_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Format !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			}
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', true);
			$('#simSerialNum').hide();
			$('#upload').show();
			$('#downsamplfile').show();
			$('#simExternalSerialNum').val("");
			$('#sim_puk_code').val("");
			$('#puk_counter').val("");
			$('#simExternalNum').hide();
			$('#simPukCode').hide();
			$('#simOrientations').hide();
			$('#encryptKey').hide();
			$('#pukCounter').hide();
		}
		$('#rfidVersionNum').hide();
		$('#rfidExternalSerialNum').hide();
		$('#rfidSerialNum').hide();
		$('#rfidStartRangeRowid').hide();
		$('#radioErrorId').html("");
		$('#sim_version_num_ErrorId').html("");
		$('#singleBulkRadioErrorId').html("");
		$('#sim_format_ErrorId').html("");
		$('#rfidVersionNumberErrorId').html("");
		// $('#start_range_ErrorId').html("");
		$('#rfidStartRange_ErrorId').html("");
		// $('#num_of_sim_ErrorId').html("");
		$('#num_of_sim_with_rfid_ErrorId').html("");
		$('#numOfSIMwithRFID').hide();
		$('#radioSingleBulkRFID').hide();
		$('#sim_internal_serial_num_ErrorId').html("");
		$('#sim_external_serial_num_ErrorId').html("");
		$('#sim_puk_code_ErrorId').html("");
		$('#puk_counter_ErrorId').html("");
		$('#label_sim_orientation_ErrorID').html("");
		$("#simOrientation").attr('checked', false);
		$('#label_encryption_key_ErrorId').html("");
		$('#upload_ErrorId').html("");
		$('#singleBulkRFIDRadioErrorId').html("");
		$('#rfid_external_serial_num_ErrorId').html("");
		if (id1 == '0') {
			$('#simExternalNum').hide();
			$('#simPukCode').hide();
			$('#upload').hide();
			$('#pukCounter').hide();
			$('#sim_format').val("");
			$('#simVersionNum').val("");
			$('#downsamplfile').hide();
			$('#encryptKey').hide();
			$('#simOrientations').hide();
			$('#downsamplfileRfid').hide();
			$('#bulkUpload').attr('checked', false);
			$('#singleRecord').attr('checked', false);
			$('#label_Description').val("");
			$('#label_encryption_key_ErrorId').html("");
		}
	} else if (id == '2') {
		$('#simWithRFIDInventory').attr('checked', true);
		$('#simInventory').attr('checked', false);
		$('#radioSingleBulkRFID').show();
		$('#description').show();
		$('#simVersionNumId').hide();
		$('#radioSingleBulk').hide();
		if (id1 == '1') {
			if ($('#rfidVersionNumber').val() == "") {
				$('#rfidVersionNumberErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			} else if ($('#sim_format').val() == "") {
				$('#sim_format_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Format !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			}
			// $('#singleRecord').prop('checked', true);
			$('#singleRecord').attr('checked', true);
			// $('#bulkUpload').prop('checked', false);
			$('#bulkUpload').attr('checked', false);
			$('#upload').hide();
			$('#label_upload').val("");
			$('#downsamplfileRfid').hide();
			$('#simOrientations').show();
			$('#simSerialNum').show();
			$('#simExternalNum').show();
			$('#simPukCode').show();
			$('#pukCounter').show();
			$('#encryptKey').show();
			$('#rfidSerialNum').show();
			$('#rfidExternalSerialNum').show();
			$('#sim_version_num_ErrorId').html("");
			$('#singleBulkRFIDRadioErrorId').html("");
			$('#sim_format_ErrorId').html("");
		} else if (id1 == '2') {
			if ($('#rfidVersionNumber').val() == "") {
				$('#rfidVersionNumberErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			} else if ($('#sim_format').val() == "") {
				$('#sim_format_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Format !</font></b>");
				$('#singleRecord').attr('checked', false);
				$('#bulkUpload').attr('checked', false);
				return false;
			}
			$('#bulkUpload').attr('checked', true);
			// $('#bulkUpload').prop('checked', true);
			$('#singleRecord').attr('checked', false);
			// $('#singleRecord').prop('checked', false);
			$('#upload').show();
			$('#downsamplfileRfid').show();
			$('#simOrientations').hide();
			$('#simSerialNum').hide();
			$('#simExternalNum').hide();
			$('#encryptKey').hide();
			$('#simExternalSerialNum').val("");
			$('#simPukCode').hide();
			$('#sim_puk_code').val("");
			$('#pukCounter').hide();
			$('#puk_counter').val("");
			$('#label_sim_orientation_ErrorID').html("");
			$('#rfidSerialNum').hide();
			$('#rfidExternalSerialNum').hide();
			$('#singleBulkRFIDRadioErrorId').html("");
			$('#rfid_external_serial_num_ErrorId').html("");
			$('#rfid_external_serial_num').val("");
			$("#simOrientation").attr('checked', false);
		} else if (id1 == '0') {
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			$('#rfidSerialNum').hide();
			$('#rfidExternalSerialNum').hide();
			$('#rfid_external_serial_num').val("");
			$('#simSerialNum').hide();
			$('#simExternalNum').hide();
			$('#simExternalSerialNum').val("");
			$('#simPukCode').hide();
			$('#sim_puk_code').val("");
			$('#pukCounter').hide();
			$('#puk_counter').val("");
			$('#singleRecord').val("");
			$('#upload').hide();
			$('#label_upload').val("");
			$('#downsamplfileRfid').hide();
			$('#label_sim_orientation_ErrorID').html("");
			$('#encryptKey').hide();
			$('#simOrientations').hide();
			$('#downsamplfile').hide();
			$('#sim_format').val("");
			$('#rfidVersionNumber').val("");
			$('#label_Description').val("");
			$('#label_encryption_key_ErrorId').html("");
		}
		$('#simVersionNumId').hide();
		$('#simFormatNum').show();
		// $('#simStartRange').show();
		$('#rfidVersionNum').show();
		// $('#rfidStartRangeRowid').show();
		// $('#numOfSIMwithRFID').show();
		$('#sim_version_num_ErrorId').html("");
		$('#sim_format_ErrorId').html("");
		$('#rfidVersionNumberErrorId').html("");
		$('#label_encryption_key_ErrorId').html("");
		$('#sim_internal_serial_num_ErrorId').html("");
		// $('#start_range_ErrorId').html("");
		$('#rfidStartRange_ErrorId').html("");
		$('#num_of_sim_with_rfid_ErrorId').html("");
		$('#sim_external_serial_num_ErrorId').html("");
		$('#sim_puk_code_ErrorId').html("");
		$('#puk_counter_ErrorId').html("");
		$('#upload_ErrorId').html("");
		$('#radioErrorId').html("");
		$('#singleBulkRadioErrorId').html("");
		$('#singleBulkRFIDRadioErrorId').html("");
		$('#rfid_external_serial_num_ErrorId').html("");
		// $('#num_of_sim_ErrorId').html("");
		// $('#numOfSIM').hide();
	}
}
function getVersionDetails(id, id1) {
	var description = $("#" + id).find('option:selected').attr('title');
	$("#" + id1).val("" + description);
}
// *************************** Function for Customer & Retailer SIM inventory
// form submit *******************************
function inventoryValidate(formID, event) {
	var completeCheck = true;
	// ********************************* Check Radio Button
	// ************************************************
	if (!($('#simInventory').is(":checked"))
			&& (!($('#simWithRFIDInventory').is(":checked")))) {
		$('#radioErrorId')
				.html(
						"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
		completeCheck = false;
	} else if ($('#simInventory').is(":checked")
			|| $('#simWithRFIDInventory').is(":checked")) {
		// ********************************* SIM Version Number
		// ************************************************
		if ($('#simInventory').is(":checked")) {
			var simVersionNum = $("#simVersionNum").val();
			if (simVersionNum.length <= 0) {
				$('#sim_version_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Version Number !</font></b>");
				completeCheck = false;
			}
			if (!($('#singleRecord').is(":checked"))
					&& (!($('#bulkUpload').is(":checked")))) {
				$('#singleBulkRadioErrorId')
						.html(
								"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
				completeCheck = false;
			}
		}
		// ********************************* SIM Format
		// *******************************************************
		var simFormat = $("#sim_format").val();
		if (simFormat.length <= 0) {
			$('#sim_format_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Format !</font></b>");
			completeCheck = false;
		}

		if ($('#simWithRFIDInventory').is(":checked")) {
			// ********************************* RFID Version Number
			// ************************************************
			var rfidVN = $("#rfidVersionNumber").val();
			if (rfidVN.length <= 0) {
				$('#rfidVersionNumberErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
				completeCheck = false;
			}
			if (!($('#singleRecord').is(":checked"))
					&& (!($('#bulkUpload').is(":checked")))) {
				$('#singleBulkRFIDRadioErrorId')
						.html(
								"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
				completeCheck = false;
			}
			// ********************************* Start Range For RFID
			// ************************************************
			/*
			 * var rfidstatrtrange=$("#rfidStartRange").val(); var
			 * hid_rfid_serial_num=$("#hidRFIDSerialNum").val();
			 * if(rfidstatrtrange.length <= 0) {
			 * $('#rfidStartRange_ErrorId').html("<b><font color='red'>Kindly
			 * enter RFID Internal Serial Number !</font></b>"); completeCheck =
			 * false; } else if(rfidstatrtrange.length != 16) {
			 * $('#rfidStartRange_ErrorId').html("<b><font color='red'>RFID
			 * Internal Serial Number must be 16 digit number !</font></b>");
			 * completeCheck = false; }
			 */
			/*
			 * if($('#singleRecord').is(":checked")) { var
			 * simRfidExternal=$("#rfid_external_serial_num").val();
			 * if(simRfidExternal.length <= 0) {
			 * $('#rfid_external_serial_num_ErrorId').html("<b><font
			 * color='red'>Kindly enter RFID External Serial Number !</font></b>");
			 * completeCheck = false; } else if(simRfidExternal.length != 12) {
			 * $('#rfid_external_serial_num_ErrorId').html("<b><font
			 * color='red'>RFID External Serial Number must be 16 digit number !</font></b>");
			 * completeCheck = false; } }
			 */
			// ****************** checking of sim orientation radio buttons
			// ************************
			if ($('#sim_orientation_1').length > 0) {
				if ($('#sim_orientation_2').length > 0) {
					if ($('#sim_orientation_3').length > 0) {
						if ($('#sim_orientation_4').length > 0) {
							if (document.getElementById('sim_orientation_1').checked == false
									&& document
											.getElementById('sim_orientation_2').checked == false
									&& document
											.getElementById('sim_orientation_3').checked == false
									&& document
											.getElementById('sim_orientation_4').checked == false) {
								$('#label_sim_orientation_ErrorID')
										.html(
												"<b><font color='red'>Kindly select SE Orientation !</font></b>");
								completeCheck = false;
							}
						} else {
							if (document.getElementById('sim_orientation_1').checked == false
									&& document
											.getElementById('sim_orientation_2').checked == false
									&& document
											.getElementById('sim_orientation_3').checked == false) {
								$('#label_sim_orientation_ErrorID')
										.html(
												"<b><font color='red'>Kindly select SE Orientation !</font></b>");
								completeCheck = false;
							}
						}
					} else {
						if (document.getElementById('sim_orientation_1').checked == false
								&& document.getElementById('sim_orientation_2').checked == false) {
							$('#label_sim_orientation_ErrorID')
									.html(
											"<b><font color='red'>Kindly select SE Orientation !</font></b>");
							completeCheck = false;
						}
					}
				} else {
					if (document.getElementById('sim_orientation_1').checked == false) {
						$('#label_sim_orientation_ErrorID')
								.html(
										"<b><font color='red'>Kindly select SE Orientation !</font></b>");
						completeCheck = false;
					}
				}
			}
			/*
			 * if(document.getElementById('sim_orientation_1').exists)
			 * if(document.getElementById('sim_orientation_1').checked==false) {
			 * $('#label_sim_orientation_ErrorID').html("<b><font
			 * color='red'>Kindly select SE Orientation !</font></b>");
			 * completeCheck=false; }
			 */
		}

		if ($('#singleRecord').is(":checked")) {
			// ********************************* Internal Serial Number for SIM
			// ************************************************
			var InternalSerialNumber = $("#simInternalSerialNum").val();

			if (InternalSerialNumber.length <= 0) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter Internal Serial Number !</font></b>");
				completeCheck = false;
			} else if (InternalSerialNumber.length != 16) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE Internal Serial Number must be 16 digit number !</font></b>");
				completeCheck = false;
			} else if (InternalSerialNumber == 0) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE Internal Serial Number cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* External Serial Number For SIM
			// ************************************************
			var ExternalSerialNumber = $("#simExternalSerialNum").val();

			if (ExternalSerialNumber.length <= 0) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter External Serial Number !</font></b>");
				completeCheck = false;
			} else if (ExternalSerialNumber.length != 12) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE External Serial Number must be 12 digit number !</font></b>");
				completeCheck = false;
			} else if (ExternalSerialNumber == 0) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE External Serial Number cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* encryption key
			// **************************************************
			var EncryptionKey = $("#label_encryption_key").val();
			if (EncryptionKey.length <= 0) {
				$('#label_encryption_key_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter Encryption Key !</font></b>");
				completeCheck = false;
			} else if (EncryptionKey.length < 24 || EncryptionKey.length > 48) {
				$('#label_encryption_key_ErrorId')
						.html(
								"<b><font color='red'>Encryption Key must between 24 to 48 digit only !</font></b>");
				completeCheck = false;
			} else if (EncryptionKey == 0) {
				$('#label_encryption_key_ErrorId')
						.html(
								"<b><font color='red'>Encryption Key cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* Puk Code For SIM
			// ************************************************
			var SimPukCode = $("#sim_puk_code").val();

			if (SimPukCode.length <= 0) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter SE PUK Code !</font></b>");
				completeCheck = false;
			} else if (SimPukCode.length != 6) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>SE PUK Code must be 6 digit number !</font></b>");
				completeCheck = false;
			} else if (SimPukCode == 0) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>SE PUK Code cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* Puk Counter For SIM
			// ************************************************
			var PukCounter = $("#puk_counter").val();

			if (PukCounter.length <= 0) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter PUK Counter !</font></b>");
				completeCheck = false;
			} else if (PukCounter.length != 1) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>PUK Counter must be 1 digit number !</font></b>");
				completeCheck = false;
			} else if (PukCounter > 3 || PukCounter <= 0) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>PUK Counter must be either 1 or 2 or 3 !</font></b>");
				completeCheck = false;
			}
		}
		// ********************************* bulk upload is selected
		// *************************************
		else if ($('#bulkUpload').is(":checked")) {
			var dataupload = $('#label_upload').val();
			if (dataupload.length <= 0) {
				$('#upload_ErrorId')
						.html(
								"<b><font color='red'>Kindly Upload the file !</font></b>");
				completeCheck = false;
			}
		}
	}
	// ********************************* Final Submit
	// ************************************************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
// ******************************* to show sim orientation with rfid****

function showOrientaion(simOrientationId) {
	$
			.ajax({
				type : 'POST',
				url : 'showOrientation',
				success : function(response) {
					var valuess = response;
					var seorientation;
					for (var i = 0; i < valuess.simOrientationss.length; i++) {
						if (i == 0)
							seorientation = '<input type=radio path=simOrientation id=sim_orientation_'
									+ (i + 1)
									+ ' value='
									+ (i + 1)
									+ ' name=simOrientation onclick=emptyerror(event,\"label_sim_orientation_ErrorID\");></input>'
									+ valuess.simOrientationss[i];
						else
							seorientation = seorientation
									+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio path=simOrientation name=simOrientation id=sim_orientation_'
									+ (i + 1)
									+ ' value='
									+ (i + 1)
									+ '  onclick=emptyerror(event,\"label_sim_orientation_ErrorID\");></input>'
									+ valuess.simOrientationss[i];
					}
					$('#simOrientationId').html(seorientation);
				},
				error : function(response) {
					var values = response;
				}
			});
}
// *************************** Function for Retailer SIM inventory form submit
// *******************************
// ********************************* by Himanshu Gusain(on 30.05.15)
// ************************************************
function retailerSIMValidate(formID, event) {
	var completeCheck = true;
	// ********************************* SIM Version Number
	// ************************************************
	var simVersionNum = $("#label_sim_version_num").val();
	if (simVersionNum.length <= 0) {
		$('#sim_version_num_ErrorId')
				.html(
						"<b><font color='red'>Kindly select SE Version Number !</font></b>");
		completeCheck = false;
	}
	// ********************************* SIM Format
	// ************************************************
	var simFormat = $("#sim_format").val();
	if (simFormat.length <= 0) {
		$('#sim_format_ErrorId').html(
				"<b><font color='red'>Kindly select SE Format !</font></b>");
		completeCheck = false;
	}
	// ********************************* If radio button's are not checked
	// ************************************************
	if (!($('#singleRecord').is(":checked"))
			&& (!($('#bulkUpload').is(":checked")))) {
		$('#radio_check_ErrorId')
				.html(
						"<b><font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kindly check atleast one radio button !</font></b>");
		completeCheck = false;
	}
	// ********************************* If single record radio button is
	// checked ************************************************
	if ($('#singleRecord').is(":checked")) {
		$('#lab_bulk_uploadErrorId').html("");
		var label_sim_internal_serial_num = $("#label_sim_internal_serial_num")
				.val();
		if (label_sim_internal_serial_num.length <= 0) {
			$('#start_range_ErrorId')
					.html(
							"<b><font color='red'>Kindly Enter SE Internal Number !</font></b>");
			completeCheck = false;
		} else if (label_sim_internal_serial_num.length < 16) {
			$('#start_range_ErrorId')
					.html(
							"<b><font color='red'>SE Internal number must be 16 digit long!!!</font></b>");
			completeCheck = false;
		}
		var sim_external_serial_num = $("#simExternalSerialNum").val();
		if (sim_external_serial_num.length <= 0) {
			$('#sim_external_ErrorId')
					.html(
							"<b><font color='red'>Kindly Enter SE External Number !</font></b>");
			completeCheck = false;
		} else if (sim_external_serial_num.length < 12) {
			$('#sim_external_ErrorId')
					.html(
							"<b><font color='red'>SE External number must be 12 digit long!!!</font></b>");
			completeCheck = false;
		}
		// ********************************* encryption key
		// **************************************************
		var EncryptionKey = $("#label_encryption_key").val();
		if (EncryptionKey.length <= 0) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter Encryption Key !</font></b>");
			completeCheck = false;
		} else if (EncryptionKey.length < 24 || EncryptionKey.length > 48) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Encryption Key must between 24 to 48 digit only !</font></b>");
			completeCheck = false;
		} else if (EncryptionKey == 0) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Encryption Key cannot be ZERO !</font></b>");
			completeCheck = false;
		}
		var sim_puk_code = $("#sim_puk_code").val();
		if (sim_puk_code.length <= 0) {
			$('#sim_puk_code_ErrorId')
					.html(
							"<b><font color='red'>Kindly Enter SE Puk Code !</font></b>");
			completeCheck = false;
		} else if (sim_puk_code.length < 6) {
			$('#sim_puk_code_ErrorId')
					.html(
							"<b><font color='red'>SE Puk Code must be 6 digit long!!!</font></b>");
			completeCheck = false;
		}
		var puk_counter = $("#puk_counter").val();
		if (puk_counter.length <= 0) {
			$('#puk_code_ErrorId')
					.html(
							"<b><font color='red'>Kindly Enter SE Puk Counter !</font></b>");
			completeCheck = false;
		} else if (puk_counter > 3 || puk_counter <= 0) {
			$('#puk_code_ErrorId')
					.html(
							"<b><font color='red'>Puk Counter Must be only 1 or 2 or 3!</font></b>");
			completeCheck = false;
		}
	}
	// ********************************* If bulk record radio button is checked
	// ************************************************
	if ($('#bulkUpload').is(":checked")) {
		$('#start_range_ErrorId').html("");
		$('#sim_external_ErrorId').html("");
		$('#sim_puk_code_ErrorId').html("");
		$('#puk_code_ErrorId').html("");
		$('#label_encryption_key_ErrorId').html("");
		var lab_bulk_upload = $("#lab_bulk_upload").val();
		if (lab_bulk_upload.length <= 0) {
			$('#lab_bulk_uploadErrorId')
					.html(
							"<b><font color='red'>Kindly Select a .csv or .txt file !</font></b>");
			completeCheck = false;
		}
	}
	// ********************************* on the click of submit button
	// ************************************************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
// ***************************** start of functions for customer RFID Inventory
// Module******************************************
// ***************************** function for show hide on radio of customer
// rfid inventory*******************************
function rfidShowDetails(id) {
	if (id == '1') {
		if ($('#rfidVersionNumber').val() == "") {
			$('#rfidVersionNumberErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		$('#downsamplfileRfid').hide();
		$('#upload').hide();
		$('#rfidInternalNum').show();
		$('#rfidExternalNum').show();
	} else if (id == '2') {
		if ($('#rfidVersionNumber').val() == "") {
			$('#rfidVersionNumberErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		$('#downsamplfileRfid').show();
		$('#upload').show();
		$('#rfidInternalNum').hide();
		$('#rfidExternalNum').hide();
	}
}
// ****************************** function for show hide on radio of retailer
// rfid inventory *********************
function rfidRetailerShowDetails(id) {
	if (id == '1') {
		if ($('#rfidVersionNumber').val() == "") {
			$('#rfidVersionNumberErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		$('#singleRecord').attr('checked', true);
		$('#bulkUpload').attr('checked', false);
		$('#downsamplfileRfid').hide();
		$('#upload').hide();
		$('#rfidInternalNum').show();
		$('#rfidExternalNum').show();
	} else if (id == '2') {
		if ($('#rfidVersionNumber').val() == "") {
			$('#rfidVersionNumberErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		$('#singleRecord').attr('checked', false);
		$('#bulkUpload').attr('checked', true);
		$('#downsamplfileRfid').show();
		$('#upload').show();
		$('#rfidInternalNum').hide();
		$('#rfidExternalNum').hide();
	}
}
// *************************** Function for Customer & Retailer RFID inventory
// form submit *******************************
function custrfidInventoryValidate(formID, event) {
	var completeCheck = true;
	// ********************************* RFID Version Number
	// ************************************************
	var rfidVN = $("#rfidVersionNumber").val();
	if (rfidVN.length <= 0) {
		$('#rfidVersionNumberErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
		completeCheck = false;
	}
	if (!($('#singleRecord').is(":checked"))
			&& (!($('#bulkUpload').is(":checked")))) {
		$('#singleBulkRadioErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
		completeCheck = false;
	}
	if ($('#singleRecord').is(":checked")) {
		// ********************************* Start Range For RFID
		// ************************************************
		var rfidInternalNum = $("#rfid_internal_serial_num").val();
		// var hid_rfid_serial_num=$("#hidRFIDSerialNum").val();
		if (rfidInternalNum.length <= 0) {
			$('#rfid_internal_serial_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Internal Number !</font></b>");
			completeCheck = false;
		} else if (rfidInternalNum.length != 16) {
			$('#rfid_internal_serial_num_ErrorId')
					.html(
							"<b><font color='red'>RFID Internal Number must be 16 digit number !</font></b>");
			completeCheck = false;
		}
		// ********************************* RFID External
		// Number************************************************
		var rfidExternalNum = $("#rfid_external_serial_num").val();
		// var hid_rfid_serial_num=$("#hidRFIDSerialNum").val();
		if (rfidExternalNum.length <= 0) {
			$('#rfid_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID External Number !</font></b>");
			completeCheck = false;
		} else if (rfidExternalNum.length != 12) {
			$('#rfid_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>RFID External Number must be 12 digit number !</font></b>");
			completeCheck = false;
		}
	} else if ($('#bulkUpload').is(":checked")) {
		var rfidbulkUpload = $('#label_upload').val();
		if (rfidbulkUpload.length <= 0) {
			$('#upload_ErrorId').html(
					"<b><font color='red'>Kindly Upload the file !</font></b>");
			completeCheck = false;
		}
	}
	// ********************************* Final Submit
	// ************************************************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
// ***************************** End of functions for customer RFID Inventory
// Module******************************************
// ***************************** Abhishek Mehra(15.6.2015)
// *********************************************

function rfidReaderShowDetail(id) {
	$('#singleBulkRadioErrorId').html("");
	if (id == '1') {
		/*
		 * var rfidTagType=$("#rfidReaderTagType").val(); if(rfidTagType.length <=
		 * 0) { $('#rfidReaderTagTypeErrorId').html("<b><font
		 * color='red'>Kindly select RFID Tag Type !</font></b>");
		 * $('#rfidReaderVerErrorId').html("<b><font color='red'>Kindly select
		 * RFID Reader Version Number !</font></b>");
		 * $('#singleRecord').attr('checked',false);
		 * $('#bulkUpload').attr('checked',false); return false; }
		 */
		// ********************************* RFID Reader Version Number
		// ************************************************
		/*
		 * if(rfidTagType == 4) {
		 */
		var rfidBigVN = $("#rfidBigReaderVer").val();
		if (rfidBigVN.length <= 0) {
			$('#rfidBigReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		/*
		 * } else if(rfidTagType == 5) { var
		 * rfidSmallVN=$("#rfidSmallReaderVer").val(); if(rfidSmallVN.length <=
		 * 0) { $('#rfidSmallReaderVerErrorId').html("<b><font
		 * color='red'>Kindly select RFID Reader Version Number !</font></b>");
		 * $('#singleRecord').attr('checked',false);
		 * $('#bulkUpload').attr('checked',false); return false; } }
		 */
		$('#downsamplfileRfid').hide();
		$('#upload').hide();
		$('#rfidReaderInterNum').show();
		$('#rfidReaderExterNum').show();
		$('#upload_ErrorId').html("");
	} else if (id == '2') {
		/*
		 * var rfidTagType=$("#rfidReaderTagType").val(); if(rfidTagType.length <=
		 * 0) { $('#rfidReaderTagTypeErrorId').html("<b><font
		 * color='red'>Kindly select RFID Tag Type !</font></b>");
		 * $('#rfidReaderVerErrorId').html("<b><font color='red'>Kindly select
		 * RFID Reader Version Number !</font></b>");
		 * $('#singleRecord').attr('checked',false);
		 * $('#bulkUpload').attr('checked',false); return false; }
		 * //********************************* RFID Reader Version Number
		 * ************************************************ if(rfidTagType == 4) {
		 */
		var rfidBigVN = $("#rfidBigReaderVer").val();
		if (rfidBigVN.length <= 0) {
			$('#rfidBigReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		/*
		 * } else if(rfidTagType == 5) { var
		 * rfidSmallVN=$("#rfidSmallReaderVer").val(); if(rfidSmallVN.length <=
		 * 0) { $('#rfidSmallReaderVerErrorId').html("<b><font
		 * color='red'>Kindly select RFID Reader Version Number !</font></b>");
		 * $('#singleRecord').attr('checked',false);
		 * $('#bulkUpload').attr('checked',false); return false; } }
		 */
		$('#downsamplfileRfid').show();
		$('#upload').show();
		$('#rfidReaderInterNum').hide();
		$('#rfidReaderExterNum').hide();
		$('#rfidReaderStartRange_ErrorId').html("");
		$('#rfid_reader_external_serial_num_ErrorId').html("");
	}
}
// *************************** Function for Retailer RFID Reader inventory form
// submit *******************************
function rfidReaderInventoryValidate(formID, event) {
	var completeCheck = true;
	// ********************************* RFID Tag Type
	// ************************************************
	/*
	 * var rfidTagType=$("#rfidReaderTagType").val(); if(rfidTagType.length <=
	 * 0) { $('#rfidReaderTagTypeErrorId').html("<b><font color='red'>Kindly
	 * select RFID Tag Type !</font></b>"); $('#rfidReaderVerErrorId').html("<b><font
	 * color='red'>Kindly select RFID Reader Version Number !</font></b>");
	 * completeCheck = false; }
	 */
	// ********************************* RFID Reader Version Number
	// ************************************************
	/*
	 * if(rfidTagType == 4) {
	 */
	var rfidBigVN = $("#rfidBigReaderVer").val();
	if (rfidBigVN.length <= 0) {
		$('#rfidBigReaderVerErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
		completeCheck = false;
	}
	/*
	 * } else if(rfidTagType == 5) { var
	 * rfidSmallVN=$("#rfidSmallReaderVer").val(); if(rfidSmallVN.length <= 0) {
	 * $('#rfidSmallReaderVerErrorId').html("<b><font color='red'>Kindly
	 * select RFID Reader Version Number !</font></b>"); completeCheck =
	 * false; } }
	 */
	if (!($("#singleRecord").is(":checked"))
			&& !($("#bulkUpload").is(":checked"))) {
		$('#singleBulkRadioErrorId')
				.html(
						"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
		completeCheck = false;
	}
	if ($("#singleRecord").is(":checked")) {
		// ********************************* Internal Number For RFID Reader
		// ************************************************
		var rfidreaderstatrtrange = $("#rfidReaderStartRange").val();
		var hid_rfid_reader_serial_num = $("#hidRFIDReaderSerialNum").val();
		if (rfidreaderstatrtrange.length <= 0) {
			$('#rfidReaderStartRange_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Reader Internal Number !</font></b>");
			completeCheck = false;
		} else if (rfidreaderstatrtrange.length != 16) {
			$('#rfidReaderStartRange_ErrorId')
					.html(
							"<b><font color='red'>RFID Reader Internal Number must be 16 digit number !</font></b>");
			completeCheck = false;
		}

		// ********************************* External Number For RFID Reader
		// ************************************************
		var rfidreaderInternalNum = $("#rfid_reader_external_serial_num").val();
		// var hid_rfid_reader_serial_num=$("#hidRFIDReaderSerialNum").val();
		if (rfidreaderInternalNum.length <= 0) {
			$('#rfid_reader_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Reader External Number !</font></b>");
			completeCheck = false;
		} else if (rfidreaderInternalNum.length != 12) {
			$('#rfid_reader_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>RFID Reader External Number must be 12 digit number !</font></b>");
			completeCheck = false;
		}
	} else if ($("#bulkUpload").is(":checked")) {
		var uploadVal = $("#label_upload").val();
		if (uploadVal.length <= 0) {
			$('#upload_ErrorId').html(
					"<b><font color='red'>Kindly Upload a file !</font></b>");
			completeCheck = false;
		}
	}
	// ********************************* Final Submit
	// ************************************************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
// **************************************** Function For Show RFID Reader
// Version *********************************************
function showReaderVersion() {
	var rfidTagType = $("#rfidReaderTagType").val();
	// ********************************* RFID Reader Version Number
	// ************************************************
	if (rfidTagType.length <= 0) {
		$('#tempTag').show();
		$('#smallTag').hide();
		$('#smallTagError').hide();
		$('#bigTag').hide();
		$('#bigTagError').hide();
	} else {
		if (rfidTagType == '4') {
			$('#bigTag').show();
			$('#bigTagError').show();
			$('#smallTag').hide();
			$('#tempTag').hide();
			$('#smallTagError').hide();
			$('#tempTagError').hide();
		} else if (rfidTagType == '5') {
			$('#smallTag').show();
			$('#smallTagError').show();
			$('#bigTag').hide();
			$('#tempTag').hide();
			$('#bigTagError').hide();
			$('#tempTagError').hide();
		}
	}
}
/*******************************************************************************
 * //**************************************** Function For Get RFID Reader
 * Version function getReaderVersion() { var
 * tagType=$('#rfidReaderTagType').val(); var simFormat=$('#sim_format').val();
 * if(trimMe(tagType).length > 0 && trimMe(simFormat).length > 0) { $.ajax ( {
 * type: 'POST', url: 'retailersimwithreaderversion', cache: false, data:
 * 'tagType_simFormat='+tagType+'_'+simFormat, success: function(response) { var
 * resObj = response; var tagTypeMap = resObj.rfidReaderMap; var select =
 * $('#rfidReaderVersionNumber'); select.find('option').remove(); $('<option>').val('').text('<--------Select-------->').appendTo(select);
 * $.each(tagTypeMap, function( key, value ) { $('<option>').val(key).text(value).appendTo(select);
 * }); }, error: function() { $('#rfidReaderTagTypeErrorId').html("<b><font
 * color='red'>Request could not be completed at this moment. Please try again..
 * </font></b>");
 *  } } ); } }
 */
// *************************************** Function For Onchange event of SIM
// Format ********************************************************
function doEmpty() {
	$('#rfidReaderTagType').val('');
	$('#rfidReaderVersionNumber').val('');
}
// *************************************** Function For submit and validate
// Retailer SIM With Reader Form
// *****************************************************************

// *************************************************************************************************************
function showDetailsDistributer(id) {
	if (id == '1') {
		$('#radio_check_ErrorId').html("");
		if ($('#label_sim_version_num').val() == "") {
			$('#sim_version_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Version NUmber</font></b>");
			$('#singleRecord').attr('checked', false);
			return false;
		} else if ($('#sim_format').val() == "") {
			$('#sim_format_ErrorId').html(
					"<b><font color='red'>Kindly select SE Format</font></b>");
			$('#singleRecord').attr('checked', false);
			return false;
		} else {
			$('#singleRecord').attr('checked', true);
			$('#bulkUpload').attr('checked', false);
			$('#encryptKey').show();
			$('#simInternalNum').show();
			$('#simExternalNum').show();
			$('#simPukNum').show();
			$('#PukNum').show();
			$('#downsamplfileRfidReader').hide();
			$('#fileUpload1').hide();
			$("#lab_bulk_upload").val('');
			$('#radio_check_ErrorId').html("");
			$('#lab_bulk_uploadErrorId').html("");
		}
	} else if (id == '2') {
		$('#radio_check_ErrorId').html("");
		if ($('#label_sim_version_num').val() == "") {
			$('#sim_version_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Version Number</font></b>");
			$('#bulkUpload').attr('checked', false);
			return false;
		} else if ($('#sim_format').val() == "") {
			$('#sim_format_ErrorId').html(
					"<b><font color='red'>Kindly select SE Format</font></b>");
			$('#bulkUpload').attr('checked', false);
			return false;
		} else {
			$('#bulkUpload').attr('checked', true);
			$('#singleRecord').attr('checked', false);
			$('#simInternalNum').hide();
			$('#simExternalNum').val("");
			$('#simExternalSerialNum').val("");
			$('#sim_puk_code').val("");
			$('#puk_counter').val("");
			$('#simExternalNum').hide();
			$('#simPukNum').hide();
			$('#downsamplfileRfidReader').show();
			$('#PukNum').hide();
			$('#encryptKey').hide();
			$('#fileUpload1').show();
			$('#label_encryption_key_ErrorId').html("");
			$('#start_range_ErrorId').html("");
			$('#sim_external_ErrorId').html("");
			$('#sim_puk_code_ErrorId').html("");
			$('#radio_check_ErrorId').html("");
			$('#puk_code_ErrorId').html("");
		}
	}
}
// *****************************For Retailor with reader
// ******************************************************
function showDetailsDistributerReader(id) {
	if (id == '1') {
		$('#radio_check_ErrorId').html("");
		if ($('#simFormatNumber').val() == "") {
			$('#sim_format_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Format Number</font></b>");
			$('#singleRecord').attr('checked', false);
			return false;
		}
		var rfidTagType = $("#rfidReaderTagType").val();
		if (rfidTagType.length <= 0) {
			$('#rfidReaderTagTypeErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Tag Type !</font></b>");
			$('#rfidReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			$('#singleRecord').attr('checked', false);
			return false;
		}
		// RFID Reader Version Number ***************
		if (rfidTagType == 4) {
			var bigReaderTag = $("#bigReaderTag").val();
			if (bigReaderTag.length <= 0) {
				$('#rfidBigReaderVerErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				return false;
			}
		} else if (rfidTagType == 5) {
			var rfidSmallVN = $("#rfidSmallReaderVer").val();
			if (rfidSmallVN.length <= 0) {
				$('#rfidSmallReaderVerErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
				$('#singleRecord').attr('checked', false);
				return false;
			}
		}

		$('#singleRecord').attr('checked', true);
		$('#bulkUpload').attr('checked', false);
		$('#readerInternalNum').show();
		$('#readerExternalNum').show();
		$('#simInternalNum').show();
		$('#simExternalNum').show();
		$('#encryptKey').show();
		$('#simPukCode').show();
		$('#simPukCounter').show();
		$('#fileUpload1').hide();
		$('#downsamplfileRfidReader').hide();
		$("#lab_bulk_upload").val('');
		$('#radio_check_ErrorId').html("");
		$('#lab_bulk_uploadErrorId').html("");

	} else if (id == '2') {
		$('#radio_check_ErrorId').html("");
		if ($('#simFormatNumber').val() == "") {
			$('#sim_format_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Version Number</font></b>");
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		var rfidTagType = $("#rfidReaderTagType").val();
		if (rfidTagType.length <= 0) {
			$('#rfidReaderTagTypeErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Tag Type !</font></b>");
			$('#rfidReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			$('#bulkUpload').attr('checked', false);
			return false;
		}
		// RFID Reader Version Number ***************
		if (rfidTagType == 4) {
			var bigReaderTag = $("#bigReaderTag").val();
			if (bigReaderTag.length <= 0) {
				$('#rfidBigReaderVerErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
				$('#bulkUpload').attr('checked', false);
				return false;
			}
		} else if (rfidTagType == 5) {
			var rfidSmallVN = $("#rfidSmallReaderVer").val();
			if (rfidSmallVN.length <= 0) {
				$('#rfidSmallReaderVerErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
				$('#bulkUpload').attr('checked', false);
				return false;
			}
		}
		$('#bulkUpload').attr('checked', true);
		$('#singleRecord').attr('checked', false);
		$('#simInternalNum').hide();
		$('#simExternalNum').val("");
		$('#simExternalSerialNum').val("");
		$('#sim_puk_code').val("");
		$('#puk_counter').val("");
		$('#readerInternalNum').hide();
		$('#downsamplfileRfidReader').show();
		$('#readerExternalNum').hide();
		$('#simInternalNum').hide();
		$('#encryptKey').hide();
		$('#simExternalNum').hide();
		$('#simPukCode').hide();
		$('#label_encryption_key_ErrorId').html("");
		$('#simPukCounter').hide();
		$('#fileUpload1').show();
		$('#rfidReaderInternal_ErrorId').html("");
		$('#rfidReader_external_ErrorId').html("");
		$('#label_sim_internal_serial_num_error').html("");
		$('#label_sim_external_serial_num_error').html("");
		$('#label_sim_puk_error').html("");
		$('#label_sim_puk_counter_error').html("");
		$('#radio_check_ErrorId').html("");
		$('#puk_code_ErrorId').html("");
	}
}

function inventoryValidateRetailer(formID, event) {
	var completeCheck = true;
	// ********************************* Check Radio Button
	// ************************************************
	if (!($('#simInventory').is(":checked"))
			&& (!($('#simWithRFIDInventory').is(":checked")))) {
		$('#radioErrorId')
				.html(
						"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
		completeCheck = false;
	} else if ($('#simInventory').is(":checked")
			|| $('#simWithRFIDInventory').is(":checked")) {
		// ********************************* SIM Version Number
		// ************************************************
		if ($('#simInventory').is(":checked")) {
			var simVersionNum = $("#simVersionNum").val();
			if (simVersionNum.length <= 0) {
				$('#sim_version_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly select SE Version Number !</font></b>");
				completeCheck = false;
			}
			if (!($('#singleRecord').is(":checked"))
					&& (!($('#bulkUpload').is(":checked")))) {
				$('#singleBulkRadioErrorId')
						.html(
								"<b><font color='red'>Kindly check atleast one of the radio button !</font></b>");
				completeCheck = false;
			}
		}
		// ********************************* SIM Format
		// *******************************************************
		var simFormat = $("#sim_format").val();
		if (simFormat.length <= 0) {
			$('#sim_format_ErrorId')
					.html(
							"<b><font color='red'>Kindly select SE Format !</font></b>");
			completeCheck = false;
		}

		if ($('#simWithRFIDInventory').is(":checked")) {
			// ********************************* RFID Version Number
			// ************************************************
			var rfidVN = $("#rfidVersionNumber").val();
			if (rfidVN.length <= 0) {
				$('#rfidVersionNumberErrorId')
						.html(
								"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
				completeCheck = false;
			}
			if (!($('#singleRecord').is(":checked"))
					&& (!($('#bulkUpload').is(":checked")))) {
				$('#singleBulkRFIDRadioErrorId')
						.html(
								"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
				completeCheck = false;
			}
			// ********************************* Start Range For RFID
			// ************************************************
			/*
			 * var rfidstatrtrange=$("#rfidStartRange").val(); var
			 * hid_rfid_serial_num=$("#hidRFIDSerialNum").val();
			 * if(rfidstatrtrange.length <= 0) {
			 * $('#rfidStartRange_ErrorId').html("<b><font color='red'>Kindly
			 * enter RFID Internal Serial Number !</font></b>"); completeCheck =
			 * false; } else if(rfidstatrtrange.length != 16) {
			 * $('#rfidStartRange_ErrorId').html("<b><font color='red'>RFID
			 * Internal Serial Number must be 16 digit number !</font></b>");
			 * completeCheck = false; }
			 */
			if ($('#singleRecord').is(":checked")) {
				var simRfidExternal = $("#rfid_external_serial_num").val();
				if (simRfidExternal.length <= 0) {
					$('#rfid_external_serial_num_ErrorId')
							.html(
									"<b><font color='red'>Kindly enter RFID External Serial Number !</font></b>");
					completeCheck = false;
				} else if (simRfidExternal.length != 12) {
					$('#rfid_external_serial_num_ErrorId')
							.html(
									"<b><font color='red'>RFID External Serial Number must be 16 digit number !</font></b>");
					completeCheck = false;
				}
			}
		}

		if ($('#singleRecord').is(":checked")) {
			// ********************************* Internal Serial Number for SIM
			// ************************************************
			var InternalSerialNumber = $("#simInternalSerialNum").val();

			if (InternalSerialNumber.length <= 0) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter Internal Serial Number !</font></b>");
				completeCheck = false;
			} else if (InternalSerialNumber.length != 16) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE Internal Serial Number must be 16 digit number !</font></b>");
				completeCheck = false;
			} else if (InternalSerialNumber == 0) {
				$('#sim_internal_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE Internal Serial Number cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* External Serial Number For SIM
			// ************************************************
			var ExternalSerialNumber = $("#simExternalSerialNum").val();

			if (ExternalSerialNumber.length <= 0) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter External Serial Number !</font></b>");
				completeCheck = false;
			} else if (ExternalSerialNumber.length != 12) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE External Serial Number must be 12 digit number !</font></b>");
				completeCheck = false;
			} else if (ExternalSerialNumber == 0) {
				$('#sim_external_serial_num_ErrorId')
						.html(
								"<b><font color='red'>SE External Serial Number cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* Puk Code For SIM
			// ************************************************
			var SimPukCode = $("#sim_puk_code").val();

			if (SimPukCode.length <= 0) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter SE PUK Code !</font></b>");
				completeCheck = false;
			} else if (SimPukCode.length != 6) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>SE PUK Code must be 6 digit number !</font></b>");
				completeCheck = false;
			} else if (SimPukCode == 0) {
				$('#sim_puk_code_ErrorId')
						.html(
								"<b><font color='red'>SE PUK Code cannot be ZERO !</font></b>");
				completeCheck = false;
			}
			// ********************************* Puk Counter For SIM
			// ************************************************
			var PukCounter = $("#puk_counter").val();

			if (PukCounter.length <= 0) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>Kindly enter PUK Counter !</font></b>");
				completeCheck = false;
			} else if (PukCounter.length != 1) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>PUK Counter must be 1 digit number !</font></b>");
				completeCheck = false;
			} else if (PukCounter > 3 || PukCounter <= 0) {
				$('#puk_counter_ErrorId')
						.html(
								"<b><font color='red'>PUK Counter must be either 1 or 2 or 3 !</font></b>");
				completeCheck = false;
			}
		}
		// ********************************* bulk upload is selected
		// *************************************
		else if ($('#bulkUpload').is(":checked")) {
			var dataupload = $('#label_upload').val();
			if (dataupload.length <= 0) {
				$('#upload_ErrorId')
						.html(
								"<b><font color='red'>Kindly Upload the file !</font></b>");
				completeCheck = false;
			}
		}
		// ********************************* Number OF SIM
		// ************************************************
		/*
		 * if($('#simInventory').is(":checked")) { var
		 * numberOfSIM=$("#num_of_sim").val(); if(numberOfSIM.length <= 0) {
		 * $('#num_of_sim_ErrorId').html("<b><font color='red'>Kindly enter
		 * Number Of SIM !</font></b>"); completeCheck = false; } } else
		 * if($('#simWithRFIDInventory').is(":checked")) { var
		 * numberOfSIMWithRFID=$("#num_of_sim_with_rfid").val();
		 * if(numberOfSIMWithRFID.length <= 0) {
		 * $('#num_of_sim_with_rfid_ErrorId').html("<b><font
		 * color='red'>Kindly enter Number Of SIM With RFID !</font></b>");
		 * completeCheck = false; } }
		 */
	}
	// ********************************* Final Submit
	// ************************************************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
/*
 * function simWithReaderformValidate(formID,event) { var completeCheck = true;
 * //Reader Sim Format*************** var
 * simFormatNumber=$("#simFormatNumber").val(); if(simFormatNumber.length <= 0) {
 * $('#sim_format_ErrorId').html("<b><font color='red'>Kindly select Sim
 * Format !</font></b>"); completeCheck = false; } // RFID Tag Type
 * *************** var rfidTagType=$("#rfidReaderTagType").val();
 * if(rfidTagType.length <= 0) { $('#rfidReaderTagTypeErrorId').html("<b><font
 * color='red'>Kindly select RFID Tag Type !</font></b>");
 * $('#rfidReaderVerErrorId').html("<b><font color='red'>Kindly select RFID
 * Reader Version Number !</font></b>"); completeCheck = false; } // RFID
 * Reader Version Number *************** if(rfidTagType == 4) { var
 * bigReaderTag=$("#bigReaderTag").val(); if(bigReaderTag.length <= 0) {
 * $('#rfidBigReaderVerErrorId').html("<b><font color='red'>Kindly select RFID
 * Reader Version Number !</font></b>"); completeCheck = false; } } else
 * if(rfidTagType == 5) { var rfidSmallVN=$("#rfidSmallReaderVer").val();
 * if(rfidSmallVN.length <= 0) { $('#rfidSmallReaderVerErrorId').html("<b><font
 * color='red'>Kindly select RFID Reader Version Number !</font></b>");
 * completeCheck = false; } } if(!($("#singleRecord").is(":checked")) &&
 * !($("#bulkUpload").is(":checked"))) { $('#radio_check_ErrorId').html("<b><font
 * color='red'>Kindly check atleast one radio button !</font></b>");
 * completeCheck = false; } if($("#singleRecord").is(":checked")) { // Internal
 * Number For RFID Reader *************** var
 * rfidreaderstatrtrange=$("#rfidReaderStartRange").val(); var
 * reader_external_serial_num=$("#reader_external_serial_num").val(); var
 * sim_internal_serial_num=$("#sim_internal_serial_num").val(); var
 * sim_external_serial_num=$("#sim_external_serial_num").val(); var
 * sim_puk_code=$("#sim_puk_code").val(); var
 * puk_counter=$("#puk_counter").val(); if(rfidreaderstatrtrange.length <= 0) {
 * $('#rfidReaderInternal_ErrorId').html("<b><font color='red'>Kindly enter
 * RFID Reader Internal Number !</font></b>"); completeCheck = false; } else
 * if(rfidreaderstatrtrange.length != 16) {
 * $('#rfidReaderInternal_ErrorId').html("<b><font color='red'>RFID Reader
 * Internal Number must be 16 digit number !</font></b>"); completeCheck =
 * false; } if(reader_external_serial_num.length <= 0) {
 * $('#rfidReader_external_ErrorId').html("<b><font color='red'>Kindly enter
 * RFID Reader Internal Number !</font></b>"); completeCheck = false; } else
 * if(reader_external_serial_num.length != 12) {
 * $('#rfidReader_external_ErrorId').html("<b><font color='red'>Sim Internal
 * Number must be 12 digit number !</font></b>"); completeCheck = false; }
 * if(sim_internal_serial_num.length <= 0) {
 * $('#label_sim_internal_serial_num_error').html("<b><font color='red'>Kindly
 * enter Sim Internal Number !</font></b>"); completeCheck = false; } else
 * if(sim_internal_serial_num.length != 16) {
 * $('#label_sim_internal_serial_num_error').html("<b><font color='red'>Sim
 * Internal Number must be 16 digit number !</font></b>"); completeCheck =
 * false; } if(sim_external_serial_num.length <= 0) {
 * $('#label_sim_external_serial_num_error').html("<b><font color='red'>Kindly
 * enter Sim External Number !</font></b>"); completeCheck = false; } else
 * if(sim_external_serial_num.length != 12) {
 * $('#label_sim_external_serial_num_error').html("<b><font color='red'>Sim
 * External Number must be 12 digit number !</font></b>"); completeCheck =
 * false; }
 * 
 * if(sim_puk_code.length <= 0) { $('#label_sim_puk_error').html("<b><font
 * color='red'>Kindly enter PUK Code !</font></b>"); completeCheck = false; }
 * else if(sim_puk_code.length != 6) { $('#label_sim_puk_error').html("<b><font
 * color='red'>Puk Code must be 6 digit number !</font></b>"); completeCheck =
 * false; } if(puk_counter.length <= 0) {
 * $('#label_sim_puk_counter_error').html("<b><font color='red'>Kindly enter
 * PUK Counter !</font></b>"); completeCheck = false; } else
 * if(puk_counter.length != 1) { $('#label_sim_puk_counter_error').html("<b><font
 * color='red'>PUK Counter must be 1 digit number !</font></b>");
 * completeCheck = false; } else if(puk_counter > 3 || puk_counter <= 0) {
 * $('#label_sim_puk_counter_error').html("<b><font color='red'>PUK Counter
 * must be either 1 or 2 or 3 !</font></b>"); completeCheck = false; } } else
 * if($("#bulkUpload").is(":checked")) { var lab_bulk_upload =
 * $("#lab_bulk_upload").val(); if(lab_bulk_upload.length <= 0) {
 * $('#lab_bulk_uploadErrorId').html("<b><font color='red'>Kindly Upload a
 * file !</font></b>"); completeCheck = false; } }
 *  // Final Submit *************** if(!(completeCheck)) {
 * event.preventDefault(); return false; } else { $('#'+formID).submit(); } }
 */

function simWithReaderformValidate(formID, event) {
	var completeCheck = true;
	// Reader Sim Format***************
	var simFormatNumber = $("#simFormatNumber").val();
	if (simFormatNumber.length <= 0) {
		$('#sim_format_ErrorId').html(
				"<b><font color='red'>Kindly select SE Format !</font></b>");
		completeCheck = false;
	}
	// RFID Tag Type ***************
	var rfidTagType = $("#rfidReaderTagType").val();
	if (rfidTagType.length <= 0) {
		$('#rfidReaderTagTypeErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Tag Type !</font></b>");
		$('#rfidReaderVerErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
		completeCheck = false;
	}
	// RFID Reader Version Number ***************
	if (rfidTagType == 4) {
		var bigReaderTag = $("#bigReaderTag").val();
		if (bigReaderTag.length <= 0) {
			$('#rfidBigReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			completeCheck = false;
		}
	} else if (rfidTagType == 5) {
		var rfidSmallVN = $("#rfidSmallReaderVer").val();
		if (rfidSmallVN.length <= 0) {
			$('#rfidSmallReaderVerErrorId')
					.html(
							"<b><font color='red'>Kindly select RFID Reader Version Number !</font></b>");
			completeCheck = false;
		}
	}
	if (!($("#singleRecord").is(":checked"))
			&& !($("#bulkUpload").is(":checked"))) {
		$('#radio_check_ErrorId')
				.html(
						"<b><font color='red'>Kindly check atleast one radio button !</font></b>");
		completeCheck = false;
	}
	if ($("#singleRecord").is(":checked")) {
		// Internal Number For RFID Reader ***************
		var rfidreaderstatrtrange = $("#rfidReaderStartRange").val();
		var reader_external_serial_num = $("#reader_external_serial_num").val();
		var sim_internal_serial_num = $("#simInternalSerialNum").val();
		var sim_external_serial_num = $("#simExternalSerialNum").val();
		var sim_puk_code = $("#sim_puk_code").val();
		var puk_counter = $("#puk_counter").val();
		var EncryptionKey = $("#label_encryption_key").val();
		if (EncryptionKey.length <= 0) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter Encryption Key !</font></b>");
			completeCheck = false;
		} else if (EncryptionKey.length < 24 || EncryptionKey.length > 48) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Encryption Key must between 24 to 48 digit only !</font></b>");
			completeCheck = false;
		} else if (EncryptionKey == 0) {
			$('#label_encryption_key_ErrorId')
					.html(
							"<b><font color='red'>Encryption Key cannot be ZERO !</font></b>");
			completeCheck = false;
		}
		if (rfidreaderstatrtrange.length <= 0) {
			$('#rfidReaderInternal_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Reader Internal Number !</font></b>");
			completeCheck = false;
		} else if (rfidreaderstatrtrange.length != 16) {
			$('#rfidReaderInternal_ErrorId')
					.html(
							"<b><font color='red'>RFID Reader Internal Number must be 16 digit number !</font></b>");
			completeCheck = false;
		}
		if (reader_external_serial_num.length <= 0) {
			$('#rfidReader_external_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Reader External Number !</font></b>");
			completeCheck = false;
		} else if (reader_external_serial_num.length != 12) {
			$('#rfidReader_external_ErrorId')
					.html(
							"<b><font color='red'>RFID External Number must be 12 digit number !</font></b>");
			completeCheck = false;
		}
		if (sim_internal_serial_num.length <= 0) {
			$('#label_sim_internal_serial_num_error')
					.html(
							"<b><font color='red'>Kindly enter SE Internal Number !</font></b>");
			completeCheck = false;
		} else if (sim_internal_serial_num.length != 16) {
			$('#label_sim_internal_serial_num_error')
					.html(
							"<b><font color='red'>SE Internal Number must be 16 digit number !</font></b>");
			completeCheck = false;
		}
		if (sim_external_serial_num.length <= 0) {
			$('#label_sim_external_serial_num_error')
					.html(
							"<b><font color='red'>Kindly enter SE External Number !</font></b>");
			completeCheck = false;
		} else if (sim_external_serial_num.length != 12) {
			$('#label_sim_external_serial_num_error')
					.html(
							"<b><font color='red'>SE External Number must be 12 digit number !</font></b>");
			completeCheck = false;
		}

		if (sim_puk_code.length <= 0) {
			$('#label_sim_puk_error').html(
					"<b><font color='red'>Kindly enter PUK Code !</font></b>");
			completeCheck = false;
		} else if (sim_puk_code.length != 6) {
			$('#label_sim_puk_error')
					.html(
							"<b><font color='red'>Puk Code must be 6 digit number !</font></b>");
			completeCheck = false;
		}
		if (puk_counter.length <= 0) {
			$('#label_sim_puk_counter_error')
					.html(
							"<b><font color='red'>Kindly enter PUK Counter !</font></b>");
			completeCheck = false;
		} else if (puk_counter.length != 1) {
			$('#label_sim_puk_counter_error')
					.html(
							"<b><font color='red'>PUK Counter must be 1 digit number !</font></b>");
			completeCheck = false;
		} else if (puk_counter > 3 || puk_counter <= 0) {
			$('#label_sim_puk_counter_error')
					.html(
							"<b><font color='red'>PUK Counter must be either 1 or 2 or 3 !</font></b>");
			completeCheck = false;
		}
	} else if ($("#bulkUpload").is(":checked")) {
		var lab_bulk_upload = $("#lab_bulk_upload").val();
		if (lab_bulk_upload.length <= 0) {
			$('#lab_bulk_uploadErrorId').html(
					"<b><font color='red'>Kindly Upload a file !</font></b>");
			completeCheck = false;
		}
	}

	// Final Submit ***************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}

function rfidInventoryValidate(formID, event) {
	var completeCheck = true;
	// RFID Version Number ***************
	var rfidVN = $("#rfidVersionNumber").val();
	if (rfidVN.length <= 0) {
		$('#rfidVersionNumberErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
		completeCheck = false;
	}
	if (!($('#singleRecord').is(":checked"))
			&& (!($('#bulkUpload').is(":checked")))) {
		$('#singleBulkRadioErrorId')
				.html(
						"<b><font color='red'>Kindly select RFID Version Number !</font></b>");
		completeCheck = false;
	}
	if ($('#singleRecord').is(":checked")) {
		// Start Range For RFID ***************
		var rfidInternalNum = $("#rfid_internal_serial_num").val();
		var hid_rfid_serial_num = $("#hidRFIDSerialNum").val();
		if (rfidInternalNum.length <= 0) {
			$('#rfid_internal_serial_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID Internal Number !</font></b>");
			completeCheck = false;
		} else if (rfidInternalNum.length != 16) {
			$('#rfid_internal_serial_num_ErrorId')
					.html(
							"<b><font color='red'>RFID Internal Number must be 16 digit number !</font></b>");
			completeCheck = false;
		} else if (rfidInternalNum < hid_rfid_serial_num) {
			$('#rfid_internal_serial_num_ErrorId').html(
					"<b><font color='red'>RFID Internal Number can not be less than "
							+ hid_rfid_serial_num + " !</font></b>");
			completeCheck = false;
		}
		// RFID External Number***************
		var rfidExternalNum = $("#rfid_external_serial_num").val();
		var hid_rfid_serial_num = $("#hidRFIDSerialNum").val();
		if (rfidExternalNum.length <= 0) {
			$('#rfid_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>Kindly enter RFID External Number !</font></b>");
			completeCheck = false;
		} else if (rfidExternalNum.length != 12) {
			$('#rfid_external_serial_num_ErrorId')
					.html(
							"<b><font color='red'>RFID External Number must be 12 digit number !</font></b>");
			completeCheck = false;
		} else if (rfidExternalNum < hid_rfid_serial_num) {
			$('#rfid_external_serial_num_ErrorId').html(
					"<b><font color='red'>RFID External Number can not be less than "
							+ hid_rfid_serial_num + " !</font></b>");
			completeCheck = false;
		}

	} else if ($('#bulkUpload').is(":checked")) {
		var rfidbulkUpload = $('#label_upload').val();
		if (rfidbulkUpload.length <= 0) {
			$('#upload_ErrorId').html(
					"<b><font color='red'>Kindly Upload the file !</font></b>");
			completeCheck = false;
		}
	}
	// Final Submit ***************
	if (!(completeCheck)) {
		event.preventDefault();
		return false;
	} else {
		$('#' + formID).submit();
	}
}
// **************************** Ajax call for Internal Serial Number Duplicacy
// Check ***********************
function checkInternalDuplicacy(id, id1) {
	var internal = $('#' + id).val();
	if (id == "simInternalSerialNum" || id == "label_sim_internal_serial_num")
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					data : 'intern=' + internal + '&idd=' + 1,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate Internal Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});
	else if (id == "rfidStartRange" || id == "rfid_internal_serial_num")
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					async : false,
					data : 'intern=' + internal + '&idd=' + 2,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate Internal Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});

	else if (id == "rfidReaderStartRange")
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					async : false,
					data : 'intern=' + internal + '&idd=' + 3,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate Internal Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});
}
// **************************** Ajax call for External Serial Number Duplicacy
// Check ***********************
function checkExternalDuplicacy(id, id1) {
	var external = $('#' + id).val();
	if (id == "simExternalSerialNum") {
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					data : 'extern=' + external + '&idd=' + 1,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate External Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});
	} else if (id == "rfid_external_serial_num") {
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					data : 'extern=' + external + '&idd=' + 2,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate External Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});
	} else if (id == "reader_external_serial_num"
			|| id == "rfid_reader_external_serial_num") {
		$
				.ajax({
					type : 'POST',
					url : 'duplicacyCheckInternExternNum',
					data : 'extern=' + external + '&idd=' + 3,
					success : function(response) {
						if (response == "false") {
							$('#' + id).val('');
							$('#' + id).focus();
							$('#' + id1)
									.html(
											"<font color='red'>Duplicate External Number !</font>");
							return false;
						} else if (response == "true") {
							return true;
						}
					}
				});
	}
}

function getDistributor(id) {
	var acountTypeId = $('#acountTypeId').val();
	var hostID = $('#' + id).val();
	if (acountTypeId == 15 || acountTypeId == 1)
		$.ajax({
			type : 'POST',
			url : 'hostdistributormapping',
			data : 'hostID=' + hostID,
			dataType: "json",
			success : function(response) {
				var valuess = response;
				var select = $('#label_Distributor');
				var numOfDistributor = 0, distributorVal = -1;
				select.find('option').remove();
				$('<option>').val('').text('<-----Select----->').appendTo(
						select);
				$.each(valuess, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
					if (distributorVal == -1)
						distributorVal = key;
					else
						distributorVal = distributorVal + "," + key;
					numOfDistributor++;
				});
				/*
				 * if(numOfDistributor>1) $('<option>').val(distributorVal).text('All').appendTo(select);
				 */
			}
		});
}
function getSubDistributor(id) {
	var acountTypeId = $('#acountTypeId').val();
	var distributorId = $('#' + id).val();
	if (acountTypeId == 15 || acountTypeId == 10 || acountTypeId == 1) {
		$.ajax({
			type : 'POST',
			url : 'ajax/distributorsubdistributormapping',
			data : 'distributorId=' + distributorId,
			dataType: "json",
			success : function(response) {
				var valuess = response;
				var select = $('#label_Sub_Distributor');
				var subDistVal = -1, numOfsubDistributor = 0;
				select.find('option').remove();
				$('<option>').val('').text('<-----Select----->').appendTo(
						select);
				$.each(valuess, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
					if (subDistVal == -1)
						subDistVal = key;
					else
						subDistVal = subDistVal + "," + key;
					numOfsubDistributor++;
				});
				/*
				 * if(numOfsubDistributor>1) $('<option>').val(subDistVal).text('All').appendTo(select);
				 */
			}
		});
	}
}
function getRetailer(id) {
	var subdistId = $('#' + id).val();
	var acountTypeId = $('#acountTypeId').val();
	if (acountTypeId == 15 || acountTypeId == 10 || acountTypeId == 6
			|| acountTypeId == 1)
		$.ajax({
			type : 'POST',
			url : 'subdistributorretailermapping',
			data : 'subdistId=' + subdistId,
			dataType: "json",
			success : function(response) {
				var valuess = response;
				var select = $('#label_Retailer');
				var retailerVal = -1, numOfRetailer = 0;
				select.find('option').remove();
				$('<option>').val('').text('<-----Select----->').appendTo(
						select);
				$.each(valuess, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
					if (retailerVal == -1)
						retailerVal = key;
					else
						retailerVal = retailerVal + "," + key;
					numOfRetailer++;
				});
				/*
				 * if(numOfRetailer>1) $('<option>').val(retailerVal).text('All').appendTo(select);
				 */
			}
		});
}
function getBC(id) {
	var retailerId = $('#' + id).val();
	var acountTypeId = $('#acountTypeId').val();
	if (acountTypeId == 15 || acountTypeId == 10 || acountTypeId == 6
			|| acountTypeId == 25 || acountTypeId == 1)
		$.ajax({
			type : 'POST',
			url : 'retailerBCmapping',
			data : 'retailerId=' + retailerId,
			dataType: "json",
			success : function(response) {
				var valuess = response;
				var select = $('#label_BC');
				var bcVal = -1, numOfBc = 0;
				select.find('option').remove();
				$('<option>').val('').text('<-----Select----->').appendTo(
						select);
				$.each(valuess, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
					if (bcVal == -1)
						bcVal = key;
					else
						bcVal = bcVal + "," + key;
					numOfBc++;
				});
				/*
				 * if(numOfBc>1) $('<option>').val(bcVal).text('All').appendTo(select);
				 */
			}
		});
}

function fetchVersion(id) {
	var productId = $('#' + id).val();
	var hostId = $('#label_host').val();
	var distId = $('#label_Distributor').val();
	$.ajax({
		type : 'POST',
		url : 'versionNum',
		dataType: "json",
		data : 'productId=' + productId + '&hostId=' + hostId + '&distId='
				+ distId,
		success : function(response) {
			var valuess = response;
			var select = $('#label_version_num');
			var versionNum = 0, versionVal = -1;
			select.find('option').remove();
			$('<option>').val('').text('<Select>').appendTo(select);
			$.each(valuess, function(key, value) {
				$('<option>').val(key).text(value).appendTo(select);
				if (versionVal == -1)
					versionVal = key;
				else
					versionVal = versionVal + "," + key;
				versionNum++;
			});
			/*
			 * if(versionNum>1) $('<option>').val(versionVal).text('All').appendTo(select);
			 */
		}
	});
}
function getVersionDescription(id, id1) {
	var verIdVal = $('#' + id).val();
	$.ajax({
		type : 'POST',
		url : 'versionDescription',
		data : 'verIdVal=' + verIdVal,
		dataType: "json",
		success : function(response) {
			$('#' + id1).val(response);
		}
	});
}
// *********************** Function for tabs show hide
// ************************************************
jQuery(document).ready(
		function() {
			jQuery('.tab-links a').bind(
					'click',
					function(e) {
						var currentAttrValue = jQuery(this).attr('href');
						// Show/Hide Tabs
						jQuery('.tabs ' + currentAttrValue).show().siblings()
								.hide();
						// Change/remove current tab to active
						jQuery(this).parent('li').addClass('active').siblings()
								.removeClass('active');
						e.preventDefault();
					});
		});
// ********************** Function for inventtoryTrackLoad
// ********************************************
function inventoryTrackOnLoad() {

	var loginas = $('#label_login_as').val();
	var hostId = $('#label_host');
	var distId = $('#label_Distributor');
	var subDistId = $('#label_Sub_Distributor');
	var retailerId = $('#label_Retailer');
	var bcId = $('#label_BC');
	var acountTypeId = $('#acountTypeId').val();
	$
			.ajax({
				type : 'POST',
				url : 'inventoryTrackOnLoad',
				data : 'loginas=' + loginas,
				success : function(response) {
					// alert("excelGenerate method"+response);
					var valuess = response;
					var host = 0, dist = 0, subDist = 0, retailer = 0, bc = 0;
					var hostVal = -1, distVal = -1, subDistVal = -1, retailerVal = -1, bcVal = -1;
					hostId.find('option').remove();
					$('<option>').val('').text('<Select>').appendTo(hostId);
					distId.find('option').remove();
					$('<option>').val('').text('<Select>').appendTo(distId);
					subDistId.find('option').remove();
					$('<option>').val('').text('<Select>').appendTo(subDistId);
					retailerId.find('option').remove();
					$('<option>').val('').text('<Select>').appendTo(retailerId);
					bcId.find('option').remove();
					$('<option>').val('').text('<Select>').appendTo(bcId);
					for (var i = 0; i < valuess.length; i++) {
						// alert("excelGenerate
						// method"+valuess[i].accountGroupId);
						if (valuess[i].accountGroupId == 3) {
							$('<option>').val(valuess[i].id).text(
									valuess[i].company).appendTo(hostId);
							if (hostVal == -1)
								hostVal = valuess[i].id;
							else
								hostVal = hostVal + "," + valuess[i].id;
							host++;
						} else if (valuess[i].accountGroupId == 10) {
							if (acountTypeId == 10 || acountTypeId == 6
									|| acountTypeId == 25 || acountTypeId == 16) {
								distId.find('option').remove();
								$('<option>').val(valuess[i].id).text(
										valuess[i].company).appendTo(distId);
							} else {
								$('<option>').val(valuess[i].id).text(
										valuess[i].company).appendTo(distId);
								if (distVal == -1)
									distVal = valuess[i].id;
								else
									distVal = distVal + "," + valuess[i].id;
								dist++;
							}
						} else if (valuess[i].accountGroupId == 6) {
							if (acountTypeId == 6 || acountTypeId == 25
									|| acountTypeId == 16) {
								subDistId.find('option').remove();
								$('<option>').val(valuess[i].id).text(
										valuess[i].company).appendTo(subDistId);
							} else {
								$('<option>').val(valuess[i].id).text(
										valuess[i].company).appendTo(subDistId);
								if (subDistVal == -1)
									subDistVal = valuess[i].id;
								else
									subDistVal = subDistVal + ","
											+ valuess[i].id;
								subDist++;
							}
						} else if (valuess[i].accountGroupId == 25) {
							if (acountTypeId == 25 || acountTypeId == 16) {
								retailerId.find('option').remove();
								$('<option>').val(valuess[i].id).text(
										valuess[i].company)
										.appendTo(retailerId);
							} else {
								$('<option>').val(valuess[i].id).text(
										valuess[i].company)
										.appendTo(retailerId);
								if (retailerVal == -1)
									retailerVal = valuess[i].id;
								else
									retailerVal = retailerVal + ","
											+ valuess[i].id;
								retailer++;
							}
						} else if (valuess[i].accountGroupId == 16) {
							if (acountTypeId == 16) {
								bcId.find('option').remove();
								$('<option>').val('').text('<Select>')
										.appendTo(bcId);
							} else {
								$('<option>').val(valuess[i].id).text(
										valuess[i].company).appendTo(bcId);
								if (bcVal == -1)
									bcVal = valuess[i].id;
								else
									bcVal = bcVal + "," + valuess[i].id;
								bc++;
							}
						}
					}
					/*
					 * if(host>1) $('<option>').val(hostVal).text('All').appendTo(hostId);
					 * if(dist>1) $('<option>').val(distVal).text('All').appendTo(distId);
					 * if(subDist>1) $('<option>').val(subDistVal).text('All').appendTo(subDistId);
					 * if(retailer>1) $('<option>').val(retailerVal).text('All').appendTo(retailerId);
					 * if(bc>1) $('<option>').val(bcVal).text('All').appendTo(bcId);
					 */
				}
			});
}
// **************************************************************************************************
// **************************************************************************************************
function excelGenerate() {
	alert("excelGenerate method");
	var productId = $('#productId').val();
	var versionId = $('#label_version_num').val();
	var hostId = $('#label_host').val();
	var distId = $('#label_Distributor').val();
	var subDistId = $('#label_Sub_Distributor').val();
	var retailerId = $('#label_Retailer').val();
	var bcId = $('#label_BC').val();

	var acntTypId = $('#acountTypeId').val();
	var inventoryStatusTypes = $('#inventoryStatusTypes').val();
	alert(inventoryStatus);
	var context = $("#hiddenContext").val();
	var inventoryArray=[productId,versionId,hostId,distId,subDistId,retailerId,acntTypId,inventoryStatusTypes];
	
	window.location.href = context
			+ "/AdminUI/inventory/InventoryDetails?inventoryArray=" + inventoryArray;
			
	// alert(context);
	// return false;
	/*
	 * $.ajax ( { type: 'POST', url: 'exceldownload', data:
	 * 'productId='+productId+'&versionId='+versionId+'&hostId='+hostId+'&distId='+distId+'&subDistId='+subDistId+'&retailerId='+retailerId+'&bcId='+bcId+'&acntTypId='+acntTypId,
	 * success:function() { alert("excelGenerate method"); } } );
	 */
}

// ********************** Function for retrieving Inventory Data
// **************************************
/*
 * function inventoryRetrieve() { var productId = $('#productId').val(); var
 * versionId = $('#label_version_num').val(); var hostId =
 * $('#label_host').val(); var distId = $('#label_Distributor').val(); var
 * subDistId=$('#label_Sub_Distributor').val(); var retailerId =
 * $('#label_Retailer').val(); var bcId = $('#label_BC').val(); var acntTypId =
 * $('#acountTypeId').val(); var inventoryStatusTypes =
 * $('#inventoryStatusTypes').val(); if(hostId.length==0) {
 * $('#label_host_ErrorId').html("<b><font color='red'>Kindly Select Host</font></b>");
 * return false; } if(productId.length==0) { $('#label_sim_type_ErrorId').html("<b><font
 * color='red'>Kindly Select SE type</font></b>"); return false; }
 * if(versionId.length==0) { $('#label_version_num_ErrorId').html("<b><font
 * color='red'>Kindly Select Version Id</font></b>"); return false; }
 * 
 * $.blockUI({ overlayCSS: { backgroundColor: '#000099' } }); $.ajax ( { type:
 * 'POST', url: 'inventoryDetails', data:
 * 'productId='+productId+'&versionId='+versionId+'&hostId='+hostId+'&distId='+distId+'&subDistId='+subDistId+'&retailerId='+retailerId+'&bcId='+bcId+'&acntTypId='+acntTypId+'&inventoryStatusTypes='+inventoryStatusTypes,
 * success:function(response) { setTimeout($.unblockUI, 100);
 * 
 * var j=0,k=0,l=0,m=0,len=0; var valuess =response;
 * $('#label_total_units').val(valuess.length); if(valuess.length==0) {
 * 
 * $('#label_sold_units').val(0); $('#resultid').hide(); $('#erorid').show();
 * $('#errorid').html("<b><font color='red' size='5pt'>No Records Availlable
 * For Your Request!!</font></b>"); } else { $('#resultid').show();
 * $('#erorid').hide(); } $('#stock_in_inventory_table').empty();
 * $('#sold_out_units_table').empty(); $('#damaged_units_table').empty();
 * $('#returned_units_table').empty(); $('#stock_in_inventory_table').html('<thead><tr><th>SerialNo</th><th>External
 * No.</th><th>Version No.</th><th>Account Type</th><th>Host</th><th>Seller
 * Name</th><th>Current Status</th><th>Selling Date</th></tr></thead><tbody>');
 * $('#sold_out_units_table').html('<thead><tr><th>SerialNo</th><th>External
 * No.</th><th>Version No.</th><th>Account Type</th><th>Host</th><th>Seller
 * Name</th><th>Current Status</th><th>Selling Date</th></tr></thead><tbody>');
 * $('#damaged_units_table').html('<thead><tr><th>SerialNo</th><th>External
 * No.</th><th>Version No.</th><th>Account Type</th><th>Host</th><th>Seller
 * Name</th><th>Current Status</th><th>Selling Date</th></tr></thead><tbody>');
 * $('#returned_units_table').html('<thead><tr><th>SerialNo</th><th>External
 * No.</th><th>Version No.</th><th>Account Type</th><th>Host</th><th>Seller
 * Name</th><th>Current Status</th><th>Selling Date</th></tr></thead><tbody>');
 * for(var i=0;i<valuess.length;i++) { if(valuess[i].status==='OK' ||
 * (valuess[i].status=='2' && distId=="") ||(valuess[i].status=='3' &&
 * subDistId=="" && distId!="")||(valuess[i].status=='4' && retailerId=="" &&
 * subDistId!="")||(valuess[i].status=='5' && bcId=="" &&
 * retailerId!="")||(valuess[i].status=='6'&&bcId!="")) { j=j+1;
 * if(productId=='1') $('#stock_in_inventory_table').append('<tr><td>'+j+'</td><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='3') $('#stock_in_inventory_table').append('<tr><td>'+j+'</td><td><table><tr><td>('+valuess[i].simExternalSerialNum+')</td><td>('+valuess[i].rfid_external_serial_num+')</td></tr></table></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='6'||productId=='7') $('#stock_in_inventory_table').append('<tr><td>'+j+'</td><td><table><tr><td>('+valuess[i].simExternalSerialNum+')</td><td>('+valuess[i].reader_external_serial_num+')</td></tr></table></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='2') $('#stock_in_inventory_table').append('<tr><td>'+j+'</td><td>'+valuess[i].rfid_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='4'||productId=='5') $('#stock_in_inventory_table').append('<tr><td>'+j+'</td><td>'+valuess[i].reader_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>'); }
 * if( (valuess[i].status=='3' && distId=="") || (valuess[i].status=='4' &&
 * subDistId=="") || (valuess[i].status=='5' && retailerId=="") ||
 * (valuess[i].status=='6' && bcId=="") || valuess[i].status=='7')
 * //if(valuess[i].status>1 && valuess[i].status<8) { k=k+1; if(productId=='1')
 * $('#sold_out_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='3') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><table><tr><td>('+valuess[i].simExternalSerialNum+')</td><td>('+valuess[i].rfid_external_serial_num+')</td></tr></table></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='6'||productId=='7') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><table><tr><td>('+valuess[i].simExternalSerialNum+')</td><td>('+valuess[i].reader_external_serial_num+')</td></tr></table></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='2') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].rfid_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='4'||productId=='5') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].reader_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>'); }
 * if(valuess[i].status>7 && valuess[i].status<14) { l=l+1; if(productId=='1')
 * $('#damaged_units_table').append('<tr><td>'+l+'</td><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='3') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><div><tr><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].rfid_external_serial_num+'</td></tr></div></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='6'||productId=='7') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><div><tr><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].reader_external_serial_num+'</td></tr></div></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='2') $('#damaged_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].rfid_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='4'||productId=='5') $('#damaged_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].reader_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>'); }
 * if(valuess[i].status>13 && valuess[i].status<19) { m=m+1; if(productId=='1')
 * $('#returned_units_table').append('<tr><td>'+l+'</td><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='3') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><div><tr><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].rfid_external_serial_num+'</td></tr></div></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='6'||productId=='7') $('#sold_out_units_table').append('<tr><td>'+k+'</td><td><div><tr><td>'+valuess[i].simExternalSerialNum+'</td><td>'+valuess[i].reader_external_serial_num+'</td></tr></div></td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='2') $('#returned_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].rfid_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>');
 * if(productId=='4'||productId=='5') $('#returned_units_table').append('<tr><td>'+k+'</td><td>'+valuess[i].reader_external_serial_num+'</td><td>'+valuess[i].simVersionNum+'</td><td>'+valuess[i].acountType+'</td><td>'+valuess[i].hostName+'</td><td>'+valuess[i].sellerName+'</td><td>'+valuess[i].currentStatus+'</td><td>'+valuess[i].selling_date+'</td></tr>'); }
 * if(i==valuess.length-1) { $('#label_sold_units').val(valuess[i].soldCount);
 * $('#label_sold_units').val(k); } }
 * 
 * $('#stock_in_inventory_table').append('</tbody>');
 * $('#sold_out_units_table').append('</tbody>');
 * $('#damaged_units_table').append('</tbody>');
 * $('#returned_units_table').append('</tbody>');
 * 
 * 
 * 
 * dataTableView("stock_in_inventory_table");
 * dataTableView("sold_out_units_table"); dataTableView("damaged_units_table");
 * dataTableView("returned_units_table");
 * 
 * 
 *  }, error:function(response) { alert("from error response--->>> "+response);
 * setTimeout($.unblockUI, 100); }, } ); //setTimeout($.unblockUI, 100); }
 */

function dataTableView(tableId) {
	var table = $('#' + tableId).dataTable({

		"bPaginate" : false,
		"bLengthChange" : false,
		// "bFilter": true,
		"bInfo" : false,
		"bAutoWidth" : false,

		"scrollY" : 200,
		"scrollX" : true,
		// "bPaginate": true,
		"bFilter" : false,
		"bInfo" : false,
		"bSort" : true,
		"bDestroy" : true,
		"bJQueryUI" : true
	});
	table.fnDraw();
	$('.dataTables_scrollBody').height('250px');
}

/*
 * //**************************************** Function For Get RFID Reader
 * Version ********************************************* function
 * getReaderVersion() { var tagType=$('#rfidReaderTagType').val(); var
 * simFormat=$('#sim_format').val(); if(trimMe(tagType).length > 0 &&
 * trimMe(simFormat).length > 0) { $.ajax ( { type: 'POST', url:
 * 'retailersimwithreaderversion', cache: false, data:
 * 'tagType_simFormat='+tagType+'_'+simFormat, success: function(response) { var
 * resObj = response; var tagTypeMap = resObj.rfidReaderMap; var select =
 * $('#rfidReaderVersionNumber'); select.find('option').remove(); $('<option>').val('').text('<--------Select-------->').appendTo(select);
 * $.each(tagTypeMap, function( key, value ) { $('<option>').val(key).text(value).appendTo(select);
 * }); }, error: function() { $('#rfidReaderTagTypeErrorId').html("<b><font
 * color='red'>Request could not be completed at this moment. Please try again..
 * </font></b>");
 *  } } ); } }
 */

/*
 * function getImageforTracking(getId) { var getId = $("#productId").val();
 * $.ajax ( { type: "post", url: 'getVersionListByProductTypeId', cache: false,
 * data:'productTypeId=' + getId, success: function(response) { var mapObj =
 * response; var imageLocation=mapObj.imageLocation; $("#sim_image").show();
 * $("#img123").attr("src",imageLocation); }, error: function() {
 * $('#label_product_type_ErrorId').html("<b><font color='red'>Request could
 * not be completed at this moment. Please try again.. </font></b>");
 *  } }); }
 */
function getImage(fileId, img) {
	$
			.ajax({
				type : "post",
				url : 'getVersionListByProductTypeId',
				cache : false,
				data : 'productTypeId=' + fileId,
				success : function(response) {
					var mapObj = response;
					var versionMap = mapObj.sysMasterVersionDatas;
					var imageLocation = mapObj.imageLocation;
					if (fileId == 1) {
						$("#img1").show();
						$("#img2").hide();
						$("#sim_image").show();
						$("#img123").attr("src", imageLocation);
					} else {
						$("#img2").show();
						$("#img1").hide();
						$("#sim_image1").show();
						$("#img1234").attr("src", imageLocation);
					}
				},
				error : function() {
					$('#label_product_type_ErrorId')
							.html(
									"<b><font color='red'>Request could not be completed at this moment. Please try again.. </font></b>");

				}
			});

}

function inventoryRetrieve() {
	$("#example").show();
	var productId = $('#productId').val();
	var versionId = $('#label_version_num').val();
	var hostId = $('#label_host').val();
	var distId = $('#label_Distributor').val();
	var subDistId = $('#label_Sub_Distributor').val();
	var retailerId = $('#label_Retailer').val();
	var bcId = $('#label_BC').val();
	var acntTypId = $('#acountTypeId').val();
	var inventoryStatusTypes = $('#inventoryStatusTypes').val();
	if (hostId.length == 0) {
		$('#label_host_ErrorId').html(
				"<b><font color='red'>Kindly Select Host</font></b>");
		return false;
	}
	if (productId.length == 0) {
		$('#label_sim_type_ErrorId').html(
				"<b><font color='red'>Kindly Select SE type</font></b>");
		return false;
	}
	if (versionId.length == 0) {
		$('#label_version_num_ErrorId').html(
				"<b><font color='red'>Kindly Select Version Id</font></b>");
		return false;
	}

	if (inventoryStatusTypes.length == 0) {
		$('#inventoryStatusTypes_ErrorId')
				.html(
						"<b><font color='red'>Kindly Select inventory Status Types</font></b>");
		return false;
	}

	$("#example").dataTable({
		"language" : {
			"emptyTable" : "No record available."
		},
		"bProcessing" : true,
		"bServerSide" : true,
		// "sort": "position",
		"aaSorting" : [],
		"order" : [],
		"scrollY" : "220px",
		"scrollCollapse" : true,
		// bStateSave variable you can use to save state on client cookies: set
		// value "true"
		// "bStateSave": true,
		// Default: Page display length
		"iDisplayLength" : 10,
		// We will use below variable to track page number on server side(For
		// more information visit:
		// http://legacy.datatables.net/usage/options#iDisplayStart)
		"iDisplayStart" : 0,
		"fnDrawCallback" : function() {
			// Get page numer on client. Please note: number start from 0 So
			// for the first page you will see 0 second page 1 third page 2...
			// Un-comment below alert to see page number
			// alert("Current page number: "+this.fnPagingInfo().iPage);
		},
		destroy : true,

		"sAjaxSource" : "inventoryDetails",
		"fnServerParams" : function(aoData) {
			aoData.push({
				"name" : "myarray[]",
				"value" : productId
			}, {
				"name" : "myarray[]",
				"value" : versionId
			}, {
				"name" : "myarray[]",
				"value" : hostId
			}, {
				"name" : "myarray[]",
				"value" : distId
			}, {
				"name" : "myarray[]",
				"value" : subDistId
			}, {
				"name" : "retailerId",
				"value" : retailerId
			}, {
				"name" : "myarray[]",
				"value" : acntTypId
			}, {
				"name" : "myarray[]",
				"value" : inventoryStatusTypes
			}

			);
		},
		"aoColumns" : [ {
			"mData" : "externalSerialNumber"
		}, {
			"mData" : "versionNumber"
		}, {
			"mData" : "sellingdate"
		}, {
			"mData" : "currentStatus"
		}, {
			"mData" : "hostName"
		},

		]
	});

}
