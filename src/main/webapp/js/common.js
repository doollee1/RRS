var tabs;
var chk_event = true;
var p_rtnData = [];
$(function() {
	fn_fontchg();
	$.datepicker.regional['kr'] = {
		closeText : '닫기',
		prevText : '이전',
		nextText : '다음',
		currentText : '오늘',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
				'11', '12' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		weekHeader : 'Wk',
		dateFormat : 'yy/mm/dd',
		firstDay : 0,
		isRTL : false,
		showMonthAfterYear : true,
		buttonImage : "/images/cmmn/btn_calendar.png",
		buttonImageOnly : true,
		buttonText : "날짜선택",
		showButtonPanel : true,
		changeYear : true,
		changeMonth : true,
		showOtherMonths : true,
		selectOtherMonths : true,
		yearSuffix : ''
	};
	$.datepicker.regional['ja'] = {
		closeText : '閉じる',
		prevText : '&#x3c;前',
		nextText : '次&#x3e;',
		currentText : '今日',
		monthNames : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
				'10月', '11月', '12月' ],
		monthNamesShort : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月',
				'9月', '10月', '11月', '12月' ],
		dayNames : [ '日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日' ],
		dayNamesShort : [ '日', '月', '火', '水', '木', '金', '土' ],
		dayNamesMin : [ '日', '月', '火', '水', '木', '金', '土' ],
		weekHeader : 'Wk',
		dateFormat : 'yy/mm/dd',
		firstDay : 0,
		isRTL : false,
		showMonthAfterYear : true,
		buttonImage : "/images/cmmn/btn_calendar.png",
		buttonImageOnly : true,
		buttonText : "選択",
		showButtonPanel : true,
		changeYear : true,
		changeMonth : true,
		showOtherMonths : true,
		selectOtherMonths : true,
		yearSuffix : ''
	};
	$.datepicker.regional['cn'] = {
		closeText : '关闭',
		prevText : '&#x3c;上月',
		nextText : '下月&#x3e;',
		currentText : '今天',
		monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月',
				'十月', '十一月', '十二月' ],
		monthNamesShort : [ '一', '二', '三', '四', '五', '六', '七', '八', '九', '十',
				'十一', '十二' ],
		dayNames : [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ],
		dayNamesShort : [ '周日', '周一', '周二', '周三', '周四', '周五', '周六' ],
		dayNamesMin : [ '日', '一', '二', '三', '四', '五', '六' ],
		weekHeader : 'Wk',
		dateFormat : 'yy/mm/dd',
		firstDay : 0,
		isRTL : false,
		showMonthAfterYear : true,
		buttonImage : "/images/cmmn/btn_calendar.png",
		buttonImageOnly : true,
		buttonText : "",
		showButtonPanel : true,
		changeYear : true,
		changeMonth : true,
		showOtherMonths : true,
		selectOtherMonths : true,
		yearSuffix : ''
	};
	$.datepicker.regional['en'] = {
		closeText : 'Close',
		prevText : 'Prev',
		nextText : 'Next',
		currentText : 'Today',
		monthNames : [ 'January', 'February', 'March', 'April', 'May', 'June',
				'July', 'August', 'September', 'October', 'November',
				'December' ],
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
				'11', '12' ],
		dayNames : [ 'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa' ],
		dayNamesShort : [ 'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa' ],
		dayNamesMin : [ 'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa' ],
		weekHeader : 'Wk',
		dateFormat : 'yy.mm.dd',
		firstDay : 0,
		isRTL : false,
		showMonthAfterYear : true,
		buttonImage : "/images/cmmn/btn_calendar.png",
		buttonImageOnly : true,
		buttonText : "Choise",
		showButtonPanel : true,
		changeYear : true,
		changeMonth : true,
		showOtherMonths : true,
		selectOtherMonths : true,
		yearSuffix : ''
	};
	$.datepicker.regional['de'] = {
			closeText: 'schließen', 
			closeStatus: 'ohne Änderungen schließen' ,
			prevText: '<zurück', 
			prevStatus: 'letzten Monat zeigen',
            nextText: 'Vor>', 
            nextStatus: 'nächsten Monat zeigen',
            currentText: 'heute', 
            currentStatus: '',
			monthNames : [ 'Januar','Februar','März','April','Mai','Juni',
				           'Juli','August','September','Oktober','November','Dezember' ],
			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
					'11', '12' ],
			dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
            dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa'],
            dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'],
			weekHeader : 'Wo',
			dateFormat : 'yy.mm.dd',
			firstDay : 1,
			isRTL : false,
			showMonthAfterYear : true,
			buttonImage : "/images/cmmn/btn_calendar.png",
			buttonImageOnly : true,
			buttonText : "Choise",
			showButtonPanel : true,
			changeYear : true,
			changeMonth : true,
			showOtherMonths : true,
			selectOtherMonths : true,
			yearSuffix : '',
			clearText: 'löschen', 
			clearStatus: 'aktuelles Datum löschen',
			
			monthStatus: 'anderen Monat anzeigen',
			yearStatus: 'anderes Jahr anzeigen',
	        weekStatus: 'Woche des Monats',
	        dayStatus: 'Setze DD als ersten Wochentag', 
	        dateStatus: 'Wähle D, M d',
	        initStatus: 'Wähle ein Datum'				
		};
	$.datepicker.setDefaults($.datepicker.regional[getCookie('Language')]);
	$.datepicker._gotoToday = function(id) {
		var target = jQuery(id);
		var inst = this._getInst(target[0]);
		if (this._get(inst, 'gotoCurrent') && inst.currentDay) {
			inst.selectedDay = inst.currentDay;
			inst.drawMonth = inst.selectedMonth = inst.currentMonth;
			inst.drawYear = inst.selectedYear = inst.currentYear;
		} else {
			var date = new Date();
			inst.selectedDay = date.getDate();
			inst.drawMonth = inst.selectedMonth = date.getMonth();
			inst.drawYear = inst.selectedYear = date.getFullYear();
			this._setDateDatepicker(target, date);
			this._selectDate(id, this._getDateDatepicker(target));
		}
		this._notifyChange(inst);
		this._adjustDate(target);
		this._setDateDatepicker(target, date);
		this._selectDate(id, this._getDateDatepicker(target));
	}
	fn_init();
	
	/***** 메인 공통 JS *****/
	/* 탭 화면 적용 */
	tabs = $('#tabs').tabs();
	var tabIndex = 1;
	/* 탭 화면 제거 */
	tabs.delegate('span.ui-icon-close', 'click', function() {
		var index = parseInt(tabIndex);
//		var tabId = $(this).closest('li').attr('aria-controls');		
//		var sqTabId = tabId.substring(0,7);	
//		if ( sqTabId == 'tabs-SO' || sqTabId == 'tabs-QT' || sqTabId == 'tabs-SL' ) {	
//			if(confirm('The unsaved Contents will disappear. \n Press [OK] to go back and save, press [CANCEL] to go on without saving')) {
//				return;	
//			} else {
//				var panelId = $(this).closest('li').remove().attr('aria-controls');
//				$('#' + panelId).remove();
//				tabs.tabs('refresh');
//				tabs.tabs('option', 'active', tabIndex);
//				
//				tabIndex--;
//			}
//		} else {
			var panelId = $(this).closest('li').remove().attr('aria-controls');
			$('#' + panelId).remove();
			tabs.tabs('refresh');
			tabs.tabs('option', 'active', tabIndex);
			
			tabIndex--;
		//}
		
	});
	/* 탭 화면 모두 제거 */
	tabs.delegate('input#tabsAllClose', 'click', function() {
		if (confirm('Close all Tabs?') == true) { 
		//if (confirm('모든 탭을 닫으시겠습니까?') == true) { 
//			$('#tabs').find('.li-add').remove();
//			$('#tabs').find('.tabs-content').remove();
//			

			
			var $tabs = $("#tabs").tabs({heightStyle: "fill"});
		    var offst = 0;
		    $('#tabs > div').each(function(index, elem) {
		    	if(index != 0 && index != 1){
		    		var tabId = $( "#tabs" ).find( ".ui-tabs-nav li:eq(1)" ).attr("aria-controls");
		    		$('#' + tabId).remove();
		    		var tab = $( "#tabs" ).find( ".ui-tabs-nav li:eq(1)" ).remove();
		    		
		    	}
		    });
		    
			tabIndex = 1;
			tabs.tabs('refresh');
			tabs.tabs('option', 'active', tabIndex);
		}
	});

	tabs.bind('keyup', function(event) {
		if (event.altKey && event.keyCode === $.ui.keyCode.BACKSPACE) {
			var panelId = tabs.find('.ui-tabs-active').remove().attr('aria-controls');
			$('#' + panelId).remove();
			tabs.tabs('refresh');
		}
	});
});

function fn_init() {
	if ($('input[data-type="datetime"]').length > 0) {
		$.datetimepicker.setLocale('de');
		$('input[data-type="datetime"]')
				.datetimepicker({
					format : 'Y/m/d H:i:s',
					validateOnBlur : false
				})
				.after(
						'<img class="ui-datetimepicker-trigger" src="/images/cmmn/btn_calendar.png" style="width:20px;height:20px;" alt="Choose date" title="Choose date" />')
				.blur(
						function(e) {
							if (fn_dateValid($(e.target).val()) == true) {
								var datetime = fn_replaceAll(fn_replaceAll(
										fn_replaceAll($(e.target).val(), '-',
												''), ' ', ''), ':', '');
								var year = datetime.substring(0, 4);
								var month = datetime.substring(4, 6);
								var day = datetime.substring(6, 8);
								if (datetime.length > 8) {
									var hour = datetime.substring(8, 10);
									var minute = datetime.substring(10, 12);
									var second = datetime.substring(12, 14);
								} else {
									var hour = '00';
									var minute = '00';
									var second = '00';
								}
								$(e.target).val(
										year + '-' + month + '-' + day + ' '
												+ hour + ':' + minute + ':'
												+ second);
							} else {
								$(e.target).val('');
							}
						});
		$('.ui-datetimepicker-trigger').click(function(e) {
			$(e.target).prev().datetimepicker('show');
		});
	}
	if ($('input[data-type="time"]').length > 0) {
		$.datetimepicker.setLocale('de');
		$('input[data-type="time"]')
				.datetimepicker({
					datepicker : false,
					format : 'H:i:s',
					validateOnBlur : false
				})
				.after(
						'<img class="ui-datetimepicker-trigger" src="/images/cmmn/btn_calendar.png" style="width:20px;height:20px;" alt="Choose time" title="Choose time" />')
				.blur(
						function(e) {
							if (fn_timeValid($(e.target).val()) == true) {
								var time = fn_replaceAll(fn_replaceAll(
										fn_replaceAll($(e.target).val(), '-',
												''), ' ', ''), ':', '');
								var hour = time.substring(0, 2);
								var minute = time.substring(2, 4);
								if (fn_empty(minute) == true) {
									minute = '00';
								}
								var second = time.substring(4, 6);
								if (fn_empty(second) == true) {
									second = '00';
								}
								$(e.target).val(
										hour + ':' + minute + ':' + second);
							} else {
								$(e.target).val('');
							}
						});
		$('.ui-datetimepicker-trigger').click(function(e) {
			$(e.target).prev().datetimepicker('show');
		});
	}
	if ($('input[data-type="date"]').length > 0) {
		$('input[data-type="date"]').datepicker({
			dateFormat : 'yy.mm.dd',
			showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
				function(e) {
					/*
					if (fn_dateValid($(e.target).val()) == true) {
						var datetime = fn_replaceAll(fn_replaceAll(
								fn_replaceAll($(e.target).val(), '-', ''),
								' ', ''), ':', '');
						var year = datetime.substring(4, 8);
						var month = datetime.substring(2, 4);
						var day = datetime.substring(0, 2);
						$(e.target).val(day + '/' + month + '/' + year);
					} else {
						$(e.target).val('');
					}
					*/
				});
	}
	if ($('[data-type="yyyymm"]').length > 0) {
		$('[data-type="yyyymm"]').datepicker({
			dateFormat : 'yy/mm',
			showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 7);
	}
	if ($('input[data-type="number"]').length > 0) {
		$('input[data-type="number"]').number(true);
	}
	if ($('input[data-type="numberType"]').length > 0) {
		$('input[data-type="numberType"]').keydown(
				function(e) {
					e = e || window.event;
					var keyID = (e.which) ? e.which : e.keyCode;
					if ((keyID >= 48 && keyID <= 57)
							|| (keyID >= 96 && keyID <= 105) || keyID == 16
							|| keyID == 8 || keyID == 9 || keyID == 46
							|| keyID == 35 || keyID == 36 || keyID == 37
							|| keyID == 39)
						return;
					else
						return false;
				}).keyup(
				function(e) {
					e = e || window.event;
					var keyID = (e.which) ? e.which : e.keyCode;
					if (keyID == 8 || keyID == 9 || keyID == 16 || keyID == 46
							|| keyID == 35 || keyID == 36 || keyID == 37
							|| keyID == 39)
						return;
					else
						e.target.value = e.target.value.replace(/[^0-9]/g, '');
				}).css('ime-mode', 'disabled');
	}
	if ($('input[data-type="decimal1"]').length > 0) {
		$('input[data-type="decimal1"]').number(true, 1);
	}
	if ($('input[data-type="decimal2"]').length > 0) {
		$('input[data-type="decimal2"]').number(true, 2);
	}
	if ($('input[data-type="decimal3"]').length > 0) {
		$('input[data-type="decimal3"]').number(true, 3);
	}
	if ($('input[data-type="decimal4"]').length > 0) {
		$('input[data-type="decimal4"]').number(true, 4);
	}
	if ($('input[data-type="multi"]').length > 0) {
		$('input[data-type="multi"]').tooltip({
			content : function() {
				var element = $(this);
				if (element.is("[title]")) {
					return element.attr("title");
				}
			},
			position : {
				at : "left bottom"
			}
		});
	}
}
function fn_ajax(url, async, sendData, fn) {
	var sendcode, sendmsg;
	$.ajax({
		url : url,
		async : async,
		type : 'post',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		traditional : true,
		data : JSON.stringify(sendData),
		beforeSend : function(request) {
			$('body').css('cursor', 'wait');
			loadingStart();
			request.setRequestHeader('METHOD_ID', 'AJAX');
		},
		success : function(data, dataType, xhr) {
			sendcode = data.CODE;
			sendmsg = data.MESSAGE;
			if (sendcode == '1') {
				fn(data, xhr);
			}
		},
		error : function(xhr, status, error) {
			sendcode = xhr.status;
			sendmsg = error;
		},
		complete : function(xhr, status) {
			$('body').css('cursor', 'default');
			loadingEnd();
			if (sendcode === 991) {
				alert('Session has expired. Will be take to the login page.');
				//alert('세션시간이 만료되었습니다. 로그인 페이지로 이동됩니다.');
				parent.location.href = '/login/login.do';
			} else if (sendcode === 600) {
				//alert('Check the SAP Data. Message: ' + sendmsg);
				alert('ERP Validation Message :\n ' + sendmsg);
			} else if (sendcode === 500) {
				alert('Internal Error. Message: ' + sendmsg);
			} else if (sendcode !== 1) {
				alert('ErrorCode : ' + sendcode + '\nErrorMsg : ' + sendmsg);
			}
		}
	});
}
function fn_sendData(sid, url, sendData) {
	var sendcode, sendmsg;
	$.ajax({
		url : url,
		async : true,
		type : 'post',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		traditional : true,
		data : JSON.stringify(sendData),
		beforeSend : function(request) {
			$('body').css('cursor', 'wait');
			loadingStart();
			request.setRequestHeader('METHOD_ID', sid);
		},
		success : function(data, status, xhr) {
			var sid = xhr.getResponseHeader('METHOD_ID');
			sendcode = data.CODE;
			sendmsg = data.MESSAGE;
			if (sendcode == '1') {
				$('body').css('cursor', 'default');
				loadingEnd();
				fn_callback(sid, data);
			}
		},
		error : function(xhr, status, error) {
			sendcode = xhr.status;
			sendmsg = error;
		},
		complete : function(xhr, status) {
			if (sendcode == '991') {
				$('body').css('cursor', 'default');
				loadingEnd();
				parent.location.href = '/comm/login.do';
			} else if (sendcode != '1') {
				$('body').css('cursor', 'default');
				loadingEnd();
				alert('ErrorCode : ' + sendcode + '\nErrorMsg : ' + sendmsg);
			}
		}
	});
}
function fn_dataBind(formid, data) {
	$.each(data, function(key, value) {
		var tag = $('#' + formid).find('[name="' + key + '"]');
		if (tag.attr('data-type') == 'datetime') {
			var val = value;
			if (value.length == 14) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' ' + value.substring(8, 10)
						+ ':' + value.substring(10, 12) + ':'
						+ value.substring(12, 14);
			} else if (value.length == 12) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' ' + value.substring(8, 10)
						+ ':' + value.substring(10, 12) + ':' + '00';
			} else if (value.length == 8) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' 00:00:00';
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'date') {
			var val = value;
			if (value.length == 8) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8);
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'time') {
			var val = value;
			if (value.length == 6) {
				val = value.substring(0, 2) + ':' + value.substring(2, 4) + ':'
						+ value.substring(4, 6);
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'yyyymm') {
			if (value.length == 6) {
				var val = value.substring(0, 4) + '-' + value.substring(4, 6);
				tag.val(val);
			}
		} else if (tag.attr('type') == 'radio') {
			$('[name="' + key + '"][value="' + value + '"]').prop('checked',
					true)
		} else if (tag.attr('type') == 'checkbox') {
			if (value == 1 || value == 'Y') {
				tag.prop('checked', true);
			}
		} else if (tag.attr('type') === 'textarea') {
			tag.val(value.replace(/\\r\\n/g, '\r\n'));
		} else if (tag.attr('data-type') == 'bizno') {
			tag.val(value.replace(/(\d{3})(\d{2})(\d{5})/g, '$1-$2-$3'));
		} else if (tag.attr('type') === 'text' || tag.attr('type') === 'hidden') {
			tag.val(value);
		} else {
			(tag.is('p')) ? tag.text(value) : tag.val(value);
		}
	});
}
function fn_formAllDisable(formIDs, gridIDs) {
	if (fn_empty(formIDs) == false) {
		for (var f = 0, len = formIDs.length; f < len; f++) {
			$('#' + formIDs[f]).find('select').not('.nodis').attr('disabled',
					'disabled').attr('tabindex', '-1').addClass('disabled');
			$('#' + formIDs[f]).find('input,textarea').not('.nodis').attr(
					'readonly', 'readonly').attr('tabindex', '-1').attr(
					'disabled', '');
			$('#' + formIDs[f]).find('input[type="button"]').not('.nodis')
					.attr('disabled', 'disabled').attr('tabindex', '-1').css(
							'cursor', 'default');
			$('#' + formIDs[f]).find('input[data-type="date"]').not('.nodis')
					.attr('tabindex', '-1').datepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="datetime"]').not(
					'.nodis').attr('tabindex', '-1').datetimepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="yyyymm"]').not(
			'.nodis').attr('tabindex', '-1').datepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="time"]').not('.nodis')
					.attr('tabindex', '-1').datetimepicker('destroy');
			$('#' + formIDs[f]).find('button').not('.nodis').attr('disabled',
			'disabled').attr('tabindex', '-1').addClass('disabled');
		}
	}
	$('.cmb_plus').hide();
	$('.cmb_minus').hide();
	if (fn_empty(gridIDs) == false) {
		for (var g = 0, len = gridIDs.length; g < len; g++) {
			var colmdl = $('#' + gridIDs[g]).jqGrid('getGridParam', 'colModel');
			for (var i = 0, len2 = colmdl.length; i < len2; i++) {
				$('#' + gridIDs[g]).jqGrid('setColProp', colmdl[i].name, {
					editable : false
				});
				var obj = $('#' + gridIDs[g]).jqGrid('getColProp',
						colmdl[i].name);
				if (fn_empty(obj.btndisflg) == false) {
					if (obj.btndisflg == true) {
						$('#' + gridIDs[g]).jqGrid('setColProp',
								colmdl[i].name, {
									formatter : gridDisBtnFormat
								});
					} else {
						$('#' + gridIDs[g]).jqGrid('setColProp',
								colmdl[i].name, {
									classes : ''
								});
					}
				}
			}
		}
	}
}
function formIdToMap(formId, valflg) {
	var serializer = $('form[id=' + formId + ']').serializeArray();
	var _string = '{';
	for ( var ix in serializer) {
		var row = serializer[ix];
		if (row.value != null && row.value != '') {
			if ($('[name="' + row.name + '"]').attr('data-type') == 'multi') {
				var dd = row.value.split(',');
				var tmp = '"';
				for (z = 0; z < dd.length; z++) {
					if (dd[z].length > 0)
						tmp = tmp + dd[z] + '","';
				}
				tmp = tmp + '"';
				if (tmp.length > 2)
					_string += '"' + row.name + '":[' + tmp.slice(0, -3) + '],';
			} else if ($('[name="' + row.name + '"]').attr('data-type') == 'yyyymm'
					|| $('[name="' + row.name + '"]').attr('data-type') == 'date'
					|| $('[name="' + row.name + '"]').attr('data-type') == 'bizno'
					|| $('[name="' + row.name + '"]').attr('data-type') == 'identy') {
				_string += '"' + row.name + '":"' + row.value.replace(/-/g, '')
						+ '",';
			} else {
				_string += '"'
						+ row.name
						+ '":"'
						+ row.value.replace(/"/g, '\\"')
								.replace(/\n/g, "\\\\n")
								.replace(/\r/g, "\\\\r") + '",';
			}
		}
	}
	$('#' + formId + ' select:disabled').each(function() {
		_string += '"' + this.name + '":"' + this.value + '",';
	});
	$('#' + formId + ' input:checkbox').each(function() {
		var searializedObj = {};
		if (fn_empty(valflg) == false && valflg == 'Y') {
			searializedObj[this.name] = this.checked ? 'Y' : 'N';
		} else {
			searializedObj[this.name] = this.checked ? 1 : 0;
		}
		_string += '"' + this.name + '":"' + searializedObj[this.name] + '",';
	});
	var g_compcd = parent.$('#G_COMP_CD').val();
	var g_deptcd = parent.$('#G_DEPT_CD').val();
	var g_usertp = parent.$('#G_USER_TP').val();
	var g_custcd = parent.$('#G_CUST_CD').val();
	if (fn_empty(g_compcd) == true) {
		g_compcd = '';
	}
	if (fn_empty(g_deptcd) == true) {
		g_deptcd = '';
	}
	if (fn_empty(g_usertp) == true) {
		g_usertp = '';
	}
	if (fn_empty(g_custcd) == true) {
		g_custcd = '';
	}
	_string += '"G_COMP_CD":"' + g_compcd + '",';
	_string += '"G_DEPT_CD":"' + g_deptcd + '",';
	_string += '"G_USER_TP":"' + g_usertp + '",';
	_string += '"G_CUST_CD":"' + g_custcd + '"';
	_string += '}';
	return JSON.parse(_string);
}
function formIdAllToMap(formId) {
	
	var disabled = $('form[id=' + formId + ']').find(':input:disabled').removeAttr('disabled');

	var serializer = $('form[id=' + formId + ']').serializeArray();
	
	disabled.attr('disabled','disabled');
	
	var _string = '{';
	for ( var ix in serializer) {
		var row = serializer[ix];
		
		var rowName = row.name;
		
		if (rowName.indexOf('-') != -1) {
			var tempArry = rowName.split('-');
			row.name = tempArry[1];
		}
		
		_string += '"'
				+ row.name
				+ '":"'
				+ row.value.replace(/"/g, '\\"').replace(/\n/g, "\\\\n")
						.replace(/\r/g, "\\\\r").trim() + '",';
	}
	$('#' + formId + ' select:disabled').each(function() {
		
		var rowName = this.name;
		
		if (rowName.indexOf('-') != -1) {
			var tempArry = rowName.split('-');
			this.name = tempArry[1];
		}
		
		_string += '"' + this.name + '":"' + this.value + '",';
	});
	$('#' + formId + ' input:checkbox').each(function() {
		var searializedObj = {};
		searializedObj[this.name] = this.checked ? 'Y' : 'N';
		
		var rowName = this.name;
		
		if (rowName.indexOf('-') != -1) {
			var tempArry = rowName.split('-');
			this.name = tempArry[1];
		}
		
		_string += '"' + this.name + '":"' + searializedObj[this.name] + '",';
	});
	var g_compcd = parent.$('#G_COMP_CD').val();
	var g_deptcd = parent.$('#G_DEPT_CD').val();
	var g_usertp = parent.$('#G_USER_TP').val();
	var g_custcd = parent.$('#G_CUST_CD').val();
	if (fn_empty(g_compcd) == true) {
		g_compcd = '';
	}
	if (fn_empty(g_deptcd) == true) {
		g_deptcd = '';
	}
	if (fn_empty(g_usertp) == true) {
		g_usertp = '';
	}
	if (fn_empty(g_custcd) == true) {
		g_custcd = '';
	}
	_string += '"G_COMP_CD":"' + g_compcd + '",';
	_string += '"G_DEPT_CD":"' + g_deptcd + '",';
	_string += '"G_USER_TP":"' + g_usertp + '",';
	_string += '"G_CUST_CD":"' + g_custcd + '"';
	_string += '}';
	
	return JSON.parse(_string);
}
function popupOpen(url, pid, params, fn) {
	if (parent.$('#pop_' + pid).length < 1) {
		parent.$('body').append(
				'<input type="hidden" id="pd_' + pid + '" /><div id="pop_'
						+ pid + '"></div>');
		parent.$('#pop_' + pid).load(
				url,
				function() {
					var popid = parent.$('#pop_' + pid).next().find(
							'.ui-dialog-content.ui-widget-content');
					popid.data('pid', pid);
					if (!!params) {
						if (Array.isArray(params)) {
							popid.data('list', params);
						} else {
							$.each(params, function(key, value) {
								popid.data(key, value);
							});
						}
					}
					popid.dialog('open');
				});
		if (fn_empty(fn) == false) {
			parent.$('#pd_' + pid).click(function(e) {
				fn(parent.p_rtnData, arguments[1]);
			});
		}
	}
}
function popupClose(pid) {
	$('#pd_' + pid).triggerHandler('click', arguments[1]);
	parent.$('#pop_' + pid).next().find('.ui-dialog-content.ui-widget-content')
			.dialog('destroy');
	parent.$('body').find('#pop_' + pid).remove();
	parent.$('body').find('#pd_' + pid).remove();
	parent.$('body').find('.ui-jqdialog').remove();
}
function framePopupOpen(url, pid, params) {
	$('body').append('<div id="div' + pid + '" class="body"></div>');
	$('#div' + pid).load(
			url,
			function() {
				if (params != null) {
					$.each(params, function(key, value) {
						$('#div' + pid).next().find(
								'.ui-dialog-content.ui-widget-content').data(
								key, value);
					});
				}
				$('#div' + pid).next().find(
						'.ui-dialog-content.ui-widget-content').dialog('open');
			});
}
function framePopupClose(dialogId) {
	$('#' + dialogId).dialog('destroy');
	$('#div' + dialogId).remove();
}
function setCookie(name, value, expires) {
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ expires.toGMTString();
}
function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
	return "";
}
function fn_inputCheck(formid) {
	var flag = true;
	var formdata = formIdAllToMap(formid);
	$.each(formdata, function(key, value) {
		if ($('[name=' + key + ']').attr('ess') === 'ess' && fn_empty(value)) {
			alert($('[name=' + key + ']').parent().prev().text().replace('*','') + ' is required input value.');
			$('[name=' + key + ']').focus();
			flag = false;
			return flag;
		}
	});
	return flag;
}
function fn_empty(val) {
	if (typeof val == 'undefined')
		return true;
	else if (val == null)
		return true;
	else if (val.length < 1)
		return true;
	return false;
}
function fn_comma(num) {
	num = String(num);
	var arrNumber = num.split('.');
	num = arrNumber[0].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	if (arrNumber.length > 1) {
		num = num + '.' + arrNumber[1];
	}
	return num;
}
function fn_uncomma(num) {
	num = String(num);
	return num.replace(/[^\d]+/g, '');
}
function fn_replaceAll(str, searchStr, replaceStr) {
	if (fn_empty(str) == false)
		str = str.split(searchStr).join(replaceStr)
	return str;
}
$(document).on('keydown', '.evEnter', function(ev) {
	var id = this.getAttribute('id');
	var val = $("#" + id).val();
	if (ev.which === 13 && val.length > 0) {
		cfn_retrieve();
	}
});
function fn_postcodeP(postID, addressID, buttonID, addressID2) {
	$('#' + buttonID).click(function(e) {
		var url = '/comm/p_postcode.do';
		var pid = 'p_postcode';
		var params = {};
		popupOpen(url, pid, params, function(data) {
			if (data.length > 0) {
				$('#' + postID).val(data[0].POSTNM);
				$('#' + addressID).val(data[0].ADDRNM);
				$('#' + addressID2).val("");
			}
			$('#' + postID).focus();
		});
	});
	$('#' + postID).keyup(function(e) {
		if ($('#' + postID).val().length === 0) {
			$('#' + addressID).val('');
		}
		if (e.keyCode === 13) {
			var url = '/comm/p_postcode.do';
			var pid = 'p_postcode';
			var params = {};
			popupOpen(url, pid, params, function(data) {
				if (data.length > 0) {
					$('#' + postID).val(data[0].POSTNM);
					$('#' + addressID).val(data[0].ADDRNM);
				}
				$('#' + postID).focus();
			});
		}
	});
	$('#' + addressID).keyup(function(e) {
		if ($('#' + addressID).val().length === 0) {
			$('#' + postID).val('');
		}
		if (e.keyCode === 13) {
			var url = '/comm/p_postcode.do';
			var pid = 'p_postcode';
			var params = {};
			popupOpen(url, pid, params, function(data) {
				if (data.length > 0) {
					$('#' + postID).val(data[0].POSTNM);
					$('#' + addressID).val(data[0].ADDRNM);
				}
				$('#' + addressID).focus();
			});
		}
	});
}
function fn_itemPevent(buttonID, cd_textID, nm_textID, itemadminID,
		itemadminnmID) {
	$('#' + buttonID).click(function() {
		fn_itemPsel(itemadminID, itemadminnmID, cd_textID, nm_textID);
	});
	$('#' + cd_textID).keyup(function(e) {
		if ($('#' + cd_textID).val().length === 0) {
			$('#' + nm_textID).val('');
		}
		if (e.keyCode === 13) {
			fn_itemPsel(itemadminID, itemadminnmID, cd_textID, nm_textID);
		}
	});
	$('#' + nm_textID).keyup(function(e) {
		if ($('#' + nm_textID).val().length === 0) {
			$('#' + cd_textID).val('');
		}
		if (e.keyCode === 13) {
			fn_itemPsel(itemadminID, itemadminnmID, cd_textID, nm_textID);
		}
	});
}
function fn_itemPsel(itemadminID, itemadminnmID, cd_textId, nm_textId) {
	var url = '/comm/retrieveItemList.do';
	var sendData = {
		'itemadmin' : $('#' + itemadminID).val(),
		'itemadminnm' : $('#' + itemadminnmID).val(),
		'ret_cd_comp' : cd_textId,
		'ret_nm_comp' : nm_textId,
		'itemcd' : $('#' + cd_textId).val(),
		'itemnm' : $('#' + nm_textId).val()
	};
	fn_ajax(url, false, sendData, function(data, xhr) {
		var resultData = data.resultItemList;
		if (resultData.length === 1) {
			$('#' + cd_textId).val(resultData[0].ITEMCD);
			$('#' + nm_textId).val(resultData[0].NAME);
		} else {
			var url = '/comm/mfItemP.do';
			var dialogID = 'mfItemP';
			popupOpen(url, dialogID, sendData);
		}
	});
}
function item_ret(itemadmin, itemadminnm, cd, nm, cd_textId, nm_textId) {
	var url = '/comm/mfItemP.do';
	var dialogID = 'mfItemP';
	var params = {
		'itemadmin' : itemadmin,
		'itemadminnm' : itemadminnm,
		'ret_cd_comp' : cd_textId,
		'ret_nm_comp' : nm_textId,
		'itemcd' : cd,
		'itemnm' : nm
	};
	popupOpen(url, dialogID, params);
}
function chk_item(itemadmin, itemadminnm, cd, nm, cd_textId, nm_textId, pop_yn,
		msg_id) {
	var sendData = {
		"itemadmin" : itemadmin,
		"itemadminnm" : itemadminnm,
		"itemcd" : cd,
		"itemnm" : nm
	};
	$.ajax({
		url : "/comm/retrieveItemList.do",
		type : "post",
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		traditional : true,
		data : JSON.stringify(sendData),
		success : function(data) {
			var mydata = data.resultItemList;
			if (mydata.length == 1) {
				$("#" + cd_textId).val(mydata[0].ITEMCD);
				$("#" + nm_textId).val(mydata[0].NAME);
				$("#" + msg_id).text('');
			} else {
				if (pop_yn === 'y') {
					$("#" + msg_id).text('');
					item_ret(itemadmin, itemadminnm, cd, nm, cd_textId,
							nm_textId);
				} else {
					$("#" + msg_id).text(
							fn_getMsg('msg.fail.unmatched',
									fn_getMsg('1110.lb.itemcd')));
				}
			}
		}
	});
}
function fn_getMsg(code, args) {
	var sendData = {
		'code' : code,
		'args' : args
	};
	var msg = '';
	$.ajax({
		url : '/alex/getMsg.do',
		async : false,
		type : 'post',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		traditional : true,
		data : JSON.stringify(sendData),
		beforeSend : function(request) {
			request.setRequestHeader('METHOD_ID', 'AJAX');
		},
		success : function(data, dataType, xhr) {
			msg = data.msg;
		},
		error : function(xhr, status, error) {
			if (xhr.status == 991) {
				parent.location.href = '/comm/login.do';
			} else {
				alert('code: ' + xhr.status + '\nerror: ' + error);
			}
		}
	});
	return msg;
}
function loadingStart() {
	$('body').append('<div id="wrap-loading"><div id="wrap-loading" class="loader"></div></div>');
}
function loadingEnd() {
	$('#wrap-loading').remove();
}
function fn_formSubmit(url, data) {
	var form = '<form action="' + url + '" method="post">';
	$.each(data, function(key, value) {
		form += '<input type="hidden" name="' + key + '" value="' + value + '" />';
	});
	form += '</form>';
	$(form).appendTo('body').submit().remove();
}
function fn_getDateTime() {
	var d = new Date();
	var s = d.getFullYear() + '-' + lpad(d.getMonth() + 1, 2, '0') + '-'
			+ lpad(d.getDate(), 2, '0') + ' ' + lpad(d.getHours(), 2, '0')
			+ ':' + lpad(d.getMinutes(), 2, '0') + ':'
			+ lpad(d.getSeconds(), 2, '0');
	return s;
}
function fn_dateValid(date) {
	var rmDate = fn_replaceAll(fn_replaceAll(fn_replaceAll(date, '-', ''),
			' ', ''), ':', '');
	var dateFormat = /[0-9]{8}/;
	if (rmDate.length > 8) {
		dateFormat = /[0-9]{14}/;
	}
	if (!rmDate.match(dateFormat)) {
		return false;
	}
	var month_day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	var year = Number(rmDate.substring(4, 8));
	var month = Number(rmDate.substring(2, 4));
	var day = Number(rmDate.substring(0, 2));
	if (rmDate.length > 8) {
		var hour = Number(rmDate.substring(8, 10));
		var minute = Number(rmDate.substring(10, 12));
		var second = Number(rmDate.substring(12, 14));
	}
	if (day == 0) {
		return false;
	}
	var isValid = false;
	var leaf = false;
	if (year % 4 == 0) {
		leaf = true;
		if (year % 100 == 0) {
			leaf = false;
		}
		if (year % 400 == 0) {
			leaf = true;
		}
	}
	if (leaf) {
		if (month == 2) {
			if (day <= month_day[month - 1] + 1) {
				isValid = true;
			}
		} else {
			if (day <= month_day[month - 1]) {
				isValid = true;
			}
		}
	} else {
		if (day <= month_day[month - 1]) {
			isValid = true;
		}
	}
	if (isValid == false) {
		return false;
	}
	if (rmDate.length > 8) {
		if (hour < 0 || hour > 23) {
			return false;
		}
		if (minute < 0 || minute > 59) {
			return false;
		}
		if (second < 0 || second > 59) {
			return false;
		}
	}
	return isValid;
}
function fn_timeValid(time) {
	var rmTime = fn_replaceAll(fn_replaceAll(fn_replaceAll(time, '-', ''),
			' ', ''), ':', '');
	var timeFormat = /[0-9]{6}/;
	var flg = 0;
	if (rmTime.length == 2) {
		timeFormat = /[0-9]{2}/;
		flg = 1;
	} else if (rmTime.length == 4) {
		timeFormat = /[0-9]{4}/;
		flg = 2;
	} else if (rmTime.length == 6) {
		timeFormat = /[0-9]{6}/;
		flg = 3;
	}
	if (!rmTime.match(timeFormat)) {
		return false;
	}
	var hour, minute, second;
	if (flg > 0) {
		hour = Number(rmTime.substring(0, 2));
	}
	if (flg > 1) {
		minute = Number(rmTime.substring(2, 4));
	}
	if (flg > 2) {
		second = Number(rmTime.substring(4, 6));
	}
	if (hour < 0 || hour > 23) {
		return false;
	}
	if (minute < 0 || minute > 59) {
		return false;
	}
	if (second < 0 || second > 59) {
		return false;
	}
	return true;
}
function lpad(s, length, padstr) {
	while (s.toString().length < length)
		s = padstr + s;
	return s;
}
function rpad(s, length, padstr) {
	while (s.length < length)
		s += padstr;
	return s;
}
function fn_fontchg() {
	var font = getCookie('usefont');
	if (fn_empty(font) == false) {
		if (font == 'NanumGothic') {
			$('#fontcss').attr('href', '/css/fontnanum.css');
		} else if (font == 'OpenSans') {
			$('#fontcss').attr('href', '/css/fontopensans.css');
		} else {
			$('#fontcss').attr('href', '/css/fontdotum.css');
		}
	}
}
function fn_loginInfo() {
	var result = {};
	result['USER_NM'] = parent.$('#G_USER_NM').val();
	result['USER_ID'] = parent.$('#G_USER_ID').val();
	result['COMP_CD'] = parent.$('#G_COMP_CD').val();
	result['COMP_NM'] = parent.$('#G_COMP_NM').text();
	result['DEPT_CD'] = parent.$('#G_DEPT_CD').val();
	result['DEPT_NM'] = parent.$('#G_DEPT_NM').text();
	result['USER_TP'] = parent.$('#G_USER_TP').val();
	result['USER_TP_NM'] = parent.$('#G_USER_TP_NM').val();
	result['CUST_CD'] = parent.$('#G_CUST_CD').val();
	result['CUST_NM'] = parent.$('#G_CUST_NM').val();
	result['AUTH'] = parent.$('#G_AUTH').val();
	return result;
}
function fn_isNotCodeValFnKey(keycode) {
	var notKeyList = [ 9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39,
			40, 44, 45, 91, 93, 144, 145 ];
	if (notKeyList.indexOf(keycode) >= 0) {
		return false;
	}
	return true;
}
function fn_getDateFormat(v) {
	var rtnV = '';
	if (fn_dateValid(v) == true) {
		var datetime = fn_replaceAll(fn_replaceAll(
				fn_replaceAll(v, '-', ''), ' ', ''), ':', '');
		var day = datetime.substring(0, 2);
		var month = datetime.substring(2, 4);
		var year = datetime.substring(4, 8);
		rtnV = day + '-' + month + '-' + year;
	} else {
		rtnV = '';
	}
	return rtnV;
}
/**
 * 서버시간 가져오기
 */
function fn_getServerData() {
	var xmlHttp;
	if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
	} else {
		return null;
	}
	xmlHttp.open('HEAD', window.location.href.toString(), false);
	xmlHttp.setRequestHeader('Content-Type', 'text/html');
	xmlHttp.send('');

	return xmlHttp.getResponseHeader('Date');
}

// /////////////////////////////////////////////////////////////////////////
// Function Name : numberHyphen, unNumberHyphen
// Parameter Info : event
// Return Info :
// Description : 숫자와 '-' 허용
// /////////////////////////////////////////////////////////////////////////
$.fn.mkNumberHyphen = function() {
	this
			.bind(
					"keydown",
					function(event) {
						if (event.keyCode == 46
								|| event.keyCode == 8
								|| event.keyCode == 9
								|| event.keyCode == 27
								|| (event.keyCode == 65 && event.ctrlKey === true)
								|| (event.keyCode >= 35 && event.keyCode <= 39)
								|| (event.shiftKey === false && ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105)))
								|| (event.keyCode == 189 || event.keyCode == 109)) {
							return;
						} else {
							if ((event.keyCode < 48 || event.keyCode > 57)
									&& (event.keyCode < 96 || event.keyCode > 105)
									|| event.shiftKey === true) {
								event.preventDefault();
							}
						}
					});
};

$.fn.mkUnNumberHyphen = function() {
	this.unbind("keydown");
};
/**
 * 페이지 프린트 미리보기 호출 함수
 */
function pagePrintPreview(){
	var browser = navigator.userAgent.toLowerCase();
	if ( -1 != browser.indexOf('chrome') ){
		window.print();
	}else if ( -1 != browser.indexOf('trident') ){
		try{
			//참고로 IE 5.5 이상에서만 동작함
			//웹 브라우저 컨트롤 생성
			var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
			//웹 페이지에 객체 삽입
			document.body.insertAdjacentHTML('beforeEnd', webBrowser);
			//ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
			previewWeb.ExecWB(7, 1);
			//객체 해제
			previewWeb.outerHTML = "";
			}catch (e) {
				//alert("- 도구 > 인터넷 옵션 > 보안 탭 > 신뢰할 수 있는 사이트 선택\n   1. 사이트 버튼 클릭 > 사이트 추가\n   2. 사용자 지정 수준 클릭 > 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 (사용)으로 체크\n\n※ 위 설정은 프린트 기능을 사용하기 위함임");
				alert("- Tools > Internet Options > Security > Trusted Sites \n   1. click Sites button > Add site \n   2. click Custom level... button > checked Initialize and script ActiveX controls not marked as safe for scripting \n\n※ The above setting is to use the print function.");
			}         
      }         
}

function fileDownload(url){
	$.fileDownload(url, {
			failMessageHtml: "There was a problem generating your report, please try again.",
			successCallback: function (url) { 
			$preparingFileModal.dialog('close');
		}, 
		httpMethod: "POST"
	});
	return false;
}

function fileDelete(url, fileUid, fileName){
	//if(confirm("삭제하시겠습니까?")){
	if(confirm("Want to Delete?")){
		var param = { "param" : {
				"fileUid" : fileUid,
				"fileName" : fileName
			}
		};
	
		fn_ajax(url, false, param, function(data, xhr){
			//alert("삭제하였습니다.");
			alert("Deleted.");
			location.reload();
		});
	}
}

//동적 select box 생성 function
function createCodeBox(obj){
	var url = "/common/getCommonCode.do";
	
	var tempVal = "";
	
	if (obj.indexOf('-') != -1) {
		var tempArry = obj.split('-');
		tempVal = tempArry[1];
	}else{
		tempVal = obj;
	}
	
	var param = {"param":tempVal + ";" + getCookie("Language")};
	
	fn_ajax(url, false, param, function(data, xhr){
		var retVal = data.result.split(';');
		
		$("#" + obj).empty().data('options');
		
		if(obj != 'Language'){
			$("#" + obj).append('<option value=' + "" + '>All</option>');
		}
		
		for(i = 0; i < retVal.length; i++){
			var tempVal = retVal[i].split(':');
			$("#" + obj).append('<option value=' + tempVal[0] + '>' + tempVal[1] + '</option>');
		}
	});
}

//동적 select box 생성 function
function createCodeBox(obj, flag){
	var url = "/common/getCommonCode.do";
	
	var tempVal = "";
	
	if (obj.indexOf('-') != -1) {
		var tempArry = obj.split('-');
		tempVal = tempArry[1];
	}else{
		tempVal = obj;
	}
	
	var param = {"param":tempVal + ";" + getCookie("Language")};
	
	fn_ajax(url, false, param, function(data, xhr){
		var retVal = data.result.split(';');
		
		$("#" + obj).empty().data('options');
		
		if(flag){
			$("#" + obj).append('<option value=' + "" + '>All</option>');
		}
		
		for(i = 0; i < retVal.length; i++){
			var tempVal = retVal[i].split(':');
			$("#" + obj).append('<option value=' + tempVal[0] + '>' + tempVal[1] + '</option>');
		}
	});
}

//동적 select box 생성 function(일괄처리)
function createCodeBoxByArr(codeArray){
	
	var url = "/common/getCommonCode.do";
	
	for(i = 0; i < codeArray.length; i++){
		var tempVal = "";
		
		if (codeArray[i].indexOf('-') != -1) {
			var tempArry = codeArray[i].split('-');
			tempVal = tempArry[1];
		}else{
			tempVal = codeArray[i];
		}
		
		var param = {"param":tempVal + ";" + getCookie("Language")};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#" + codeArray[i]).empty().data('options');
			$("#" + codeArray[i]).append('<option value=' + "" + '>All</option>');
			
			for(j = 0; j < retVal.length; j++){
				var tempVal = retVal[j].split(':');
				$("#" + codeArray[i]).append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
			}
		});
	}
}

//동적 select box 생성 function(일괄처리)
function createCodeBoxByArr(codeArray, flag){
	
	var url = "/common/getCommonCode.do";
	
	for(i = 0; i < codeArray.length; i++){
		var tempVal = "";
		
		if (codeArray[i].indexOf('-') != -1) {
			var tempArry = codeArray[i].split('-');
			tempVal = tempArry[1];
		}else{
			tempVal = codeArray[i];
		}
		
		var param = {"param":tempVal + ";" + getCookie("Language")};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#" + codeArray[i]).empty().data('options');
			
			if(flag){
				$("#" + codeArray[i]).append('<option value=' + "" + '>All</option>');
			}
			
			for(j = 0; j < retVal.length; j++){
				var tempVal = retVal[j].split(':');
				$("#" + codeArray[i]).append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
			}
		});
	}
}

//동적 select box 생성 function(일괄처리)
function createCodeBoxByEdit(codeArray, flag){
	
	var url = "/common/getCommonCode.do";
	
	for(i = 0; i < codeArray.length; i++){
		var tempVal = "";
		
		if (codeArray[i].indexOf('-') != -1) {
			var tempArry = codeArray[i].split('-');
			tempVal = tempArry[1];
		}else{
			tempVal = codeArray[i];
		}
		
		var param = {"param":tempVal + ";" + getCookie("Language")};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#" + codeArray[i]).empty().data('options');
			
			if(flag){
				$("#" + codeArray[i]).append('<option value=' + "" + '></option>');
			}
			
			for(j = 0; j < retVal.length; j++){
				var tempVal = retVal[j].split(':');
				$("#" + codeArray[i]).append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
			}
		});
	}
}


function fn_onlyNum(obj){
	$(obj).keypress(function (event) {
		if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { 
			event.preventDefault();
		}
	});
}

(function(window) {
'use strict';

	var component = function() {
		var commonCodePool = {};
		var comboboxPool = {};
		
		function makePopup(elm, code) {
			var div = document.createElement('div');
			var input = document.createElement('input');
			input.setAttribute('disabled', '');
			input.classList.add('side_front_Sinput');
			$.each(elm.dataset, function(k, v) {
				input.dataset[k] = v;
			});
			div.appendChild(input);
			
			var button = document.createElement('button');
			button.classList.add('grid_popupbtn');
			div.appendChild(button);
			
			var p = document.createElement('p');
			p.classList.add('data_side_text');
			div.appendChild(p);
			
			$(elm).replaceWith(div);
			var codeV = code[0];
			comboboxPool[code.HEAD_ID] = input;
			button.addEventListener('click', function(e) {
				fn_popComm(codeV.HEAD_ID, codeV.CODE_NM, '', function(data) {
					if (!!data && !!data[0]) {
						input.value = data[0].CODE;
						p.textContent = data[0].NAME;
						$(input).trigger('change');
					}
				});
			});
			
			$(input).on('setinput', function(e) {
				var that = this;
				if (!that.value) {
					p.textContent = '';
				} else {
					Array.prototype.some.call(code, function(v) {
						if (v.CODE === that.value) {
							p.textContent = v.CODE_NM;
							return true;
						}
						return false;
					});
				}
			});
			
			// save
			var refObj = code[0];
			if (!!refObj) {
				comboboxPool[refObj.HEAD_ID] = elm;
			}
		}
		
		function makeCombo(elm, code, style) {
			var context = '';
			if (!style) {
				context = '<option value=""></option>';
			} else if (style === 'default') {
			} else {
				context = '<option value="">ALL</option>';
			}
			
			code.forEach(function(o) {
				if (!style) {
					context += '<option value="' + o.CODE + '">' + o.CODE + ' - ' +  o.CODE_NM + '</option>';
				} else {
					context += '<option value="' + o.CODE + '">' + o.CODE + ' - ' +  o.CODE_NM + '</option>';
				}
			});
			elm.innerHTML = context;
			
			if (!!elm.dataset.searchcolumn) {
				return;
			}
			
			// save
			var refObj = code[0];
			if (!refObj) {
				return;
			}
			
			return;
			comboboxPool[refObj.HEAD_ID] = elm;
			if (!!refObj.CNT) {
				var refObj = code[0];
				// save
				comboboxPool[refObj.HEAD_ID] = elm;
				$(elm).on('setinput', function(e) {
					if (refObj.CNT === '1') {
						var refCombo = comboboxPool[refObj.REF1];
						if (elm.dataset.codestatus !== refCombo.value) {
							elm.dataset.codestatus = refCombo.value;
							var refCodeLength = refCombo.value.length;
							var options = elm.querySelectorAll('option');
							var value = elm.value
							$(options).remove();
							
							var codes = commonCodePool[elm.dataset.dbcolumn];
							var context = '<option value=""></option>';
							Array.prototype.forEach.call(codes, function(code) {
								if (code.REFVALUE.substr(0, refCodeLength) === refCombo.value) {
									context += '<option value="' + code.CODE + '">' + code.CODE + ' - ' +  code.CODE_NM + '</option>';
								}
							});
							elm.innerHTML = context;
							if (!!value) {
								elm.value = value
							} else {
								elm.value = elm.getAttribute('ref');
							}
						}
					} if (refObj.CNT === '2') {
						var refCombo1 = comboboxPool[refObj.REF1];
						var refCombo2 = comboboxPool[refObj.REF2];
						if (elm.dataset.codestatus !== (refCombo1.value + refCombo2.value)) {
							elm.dataset.codestatus = (refCombo1.value + refCombo2.value)
							var refCode = refCombo1.value + refCombo2.value;
							var refCodeLength = refCode.length;
							
							var options = elm.querySelectorAll('option');
							var value = elm.value
							$(options).remove();
							
							var codes = commonCodePool[elm.dataset.dbcolumn];
							var context = '<option value=""></option>';
							Array.prototype.forEach.call(codes, function(code) {
								if (code.REFVALUE.substr(0, refCodeLength) === refCode) {
									context += '<option value="' + code.CODE + '">' + code.CODE + ' - ' +  code.CODE_NM + '</option>';
								}
							});
							elm.innerHTML = context;
							if (!!value) {
								elm.value = value
							} else {
								elm.value = elm.getAttribute('ref');
							}
						}
					} if (refObj.CNT === '3') {
						var refCombo1 = comboboxPool[refObj.REF1];
						var refCombo2 = comboboxPool[refObj.REF2];
						var refCombo3 = comboboxPool[refObj.REF3];
						if (elm.dataset.codestatus !== (refCombo1.value + refCombo2.value + refCombo3.value)) {
							elm.dataset.codestatus = (refCombo1.value + refCombo2.value + refCombo3.value)
							var refCode = refCombo1.value + refCombo2.value + refCombo3.value;
							var refCodeLength = refCode.length;
							
							var options = elm.querySelectorAll('option');
							var value = elm.value
							$(options).remove();
							
							var codes = commonCodePool[elm.dataset.dbcolumn];
							var context = '<option value=""></option>';
							Array.prototype.forEach.call(codes, function(code) {
								if (code.REFVALUE.substr(0, refCodeLength) === refCode) {
									context += '<option value="' + code.CODE + '">' + code.CODE + ' - ' +  code.CODE_NM + '</option>';
								}
							});
							elm.innerHTML = context;
							if (!!value) {
								elm.value = value
							} else {
								elm.value = elm.getAttribute('ref');
							}
						}
					}
				});
			}
		}
		
		return {
			getCommomCode: function(code) {
				return commonCodePool[code];
			},
			createCombobox: function(elms, style) {
				function _make(element) {
					if (!!element.type && element.tagName.toLowerCase() === 'select') {
						var dbcolumn = element.dataset.dbcolumn || element.dataset.searchcolumn || element.dataset.sales;
						
						var code = commonCodePool[dbcolumn];
						if (!code) {
							reqList[dbcolumn] = element;
						} else {
							if (!element.dataset.searchcolumn && code.length > 50 && !code[0].CNT) {
								makePopup(element, code);
							} else {
								makeCombo(element, code, style);
							}
						}
					}
				}
				
				var reqList = {};
				if (elms.length === 0) {
					_make(elms);
				} else {
					Array.prototype.forEach.call(elms, function(elm) {
						_make(elm);
					});
				}
				
				var deferred = $.Deferred();
				var keys = Object.keys(reqList);
				fn_ajax('/common/retrieveCommonCodeList.do', true, { code: keys }, function(data) {
					if (!data.RESULT) {
						console.error('Can not found common code!');
						return;
					}
					
					function getCodeList(array, code) {
						return Array.prototype.filter.call(array, function(v) {
							return v.HEAD_ID === code;
						});
					}
					
					$.each(reqList, function(k, v) {
						var code = getCodeList(data.RESULT, k);
						commonCodePool[k] = code;
						if (!v.dataset.searchcolumn && code.length > 50 && !code[0].CNT) {
							makePopup(v, code);
						} else {
							makeCombo(v, code, style);
						}
					});
					
					return deferred.resolve();
				});
				
				return deferred.promise();
			}
		}
	};
	
	var converter = function() {
		return {
			dateFormat1: function(yyyymmdd) {
				var yyyy = yyyymmdd.substr(0, 4);
				var mm = yyyymmdd.substr(4, 2);
				var dd = yyyymmdd.substr(6, 2);
				return (yyyy + '.' + mm + '.' + dd);
			},
			dateFormat2: function(ddmmyyyy) {
				return ddmmyyyy.split('-').reverse().join('.');
			},
			dateFormat3: function(ddmmyyyy) {
				return ddmmyyyy.split('.').reverse().join('');
			},
			currencyFormat: function(currency) {
				return currency.replace(/\./g, ',').replace(/\B(?=(\d{3})+(?!\d))/g, ".");
			},
			currencyFormat2: function(currency) {
				return currency.replace(/\./g, '').replace(/\,/g, '.');
			}
		}
	}
	
	var validator = function() {
		var REG_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		return {
			applyNumber: function(elms) {
				Array.prototype.forEach.call(elms, function(elm) {
					if (!!elm.type && elm.type.toLowerCase() === 'text') {
						elm.addEventListener('input', function(e) {
							elm.value = elm.value.replace(/[^0-9]/g, '');
						});
					}
				});
			},
			applyCurrency: function(elms) {
				Array.prototype.forEach.call(elms, function(elm) {
					if (!!elm.type && elm.type.toLowerCase() === 'text') {
						elm.addEventListener('input', function(e) {
							var list = elm.value.replace(/[^0-9,]/g, '').split(',');
							var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, "."); 
							if (list.length > 1) {
								value += (',' + list[1].substr(0, 2));
							}
							elm.value = value;
						});
						$(elm).on('setinput', function(e) {
							var list = elm.value.split('.');
							var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, "."); 
							if (list.length > 1) {
								value += (',' + list[1]);
							}
							elm.value = value;
						});
					}
				});
			},
			applyExchg: function(elms) {
				Array.prototype.forEach.call(elms, function(elm) {
					if (!!elm.type && elm.type.toLowerCase() === 'text') {
						elm.addEventListener('input', function(e) {
							var list = elm.value.replace(/[^0-9,]/g, '').split(',');
							var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");   
							if (list.length > 1) {
								value += (',' + list[1].substr(0, 5));
							}
							elm.value = value;
						});
						$(elm).on('setinput', function(e) {
							var list = elm.value.split('.');
							var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, "."); 
							if (list.length > 1) {
								value += (',' + list[1]);
							}
							elm.value = value;
						});
					}
				});
			},
			applyEmail: function(elms) {
				Array.prototype.forEach.call(elms, function(elm) {
					if (!!elm.type && elm.type.toLowerCase() === 'text') {
						elm.addEventListener('change', function(e) {
							if (!REG_EMAIL.test(elm.value)) {
								elm.value = '';
								alert('Invalid email format!')
							}
						});
					}
				});
			},
			applyGridEmail: function(value, name) {
				if (!REG_EMAIL.test(value)) {
					return [false, 'Invalid email format!'];
				}
				return [true];
			},
			applyGridMandatory: function(value, name) {
				if (!value) {
					return [false, 'Input a "' + name + '" data'];
				}
				return [true];
			}
		}
	};
	
	window.Util = {
		validator: validator(),
		component: component(),
		converter: converter()
	};
})(window);

function checkPostal(postal, country) {
	var postalReq = {
		"GB": /GIR[ ]?0AA|((AB|AL|B|BA|BB|BD|BH|BL|BN|BR|BS|BT|CA|CB|CF|CH|CM|CO|CR|CT|CV|CW|DA|DD|DE|DG|DH|DL|DN|DT|DY|E|EC|EH|EN|EX|FK|FY|G|GL|GY|GU|HA|HD|HG|HP|HR|HS|HU|HX|IG|IM|IP|IV|JE|KA|KT|KW|KY|L|LA|LD|LE|LL|LN|LS|LU|M|ME|MK|ML|N|NE|NG|NN|NP|NR|NW|OL|OX|PA|PE|PH|PL|PO|PR|RG|RH|RM|S|SA|SE|SG|SK|SL|SM|SN|SO|SP|SR|SS|ST|SW|SY|TA|TD|TF|TN|TQ|TR|TS|TW|UB|W|WA|WC|WD|WF|WN|WR|WS|WV|YO|ZE)(\d[\dA-Z]?[ ]?\d[ABD-HJLN-UW-Z]{2}))|BFPO[ ]?\d{1:4}$/,
		"JE": /JE\d[\dA-Z]?[ ]?\d[ABD-HJLN-UW-Z]{2}$/,
		"GG": /GY\d[\dA-Z]?[ ]?\d[ABD-HJLN-UW-Z]{2}$/,
		"IM": /IM\d[\dA-Z]?[ ]?\d[ABD-HJLN-UW-Z]{2}$/,
		"US": /^\d{5}([ \-]\d{4})?$/,
		"IE": /([AC-FHKNPRTV-Y]\d{2}|D6W)[0-9AC-FHKNPRTV-Y]{4}/,
		"CA": /[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d$/,
		"DE": /^\d{5}$/,
		"JP": /^\d{3}-\d{4}$/,
		"FR": /^\d{2}[ ]?\d{3}$/,
		"AU": /^\d{4}$/,
		"AL": /^\d{4}$/,
		"IT": /^\d{5}$/,
		"CH": /^\d{4}$/,
		"AT": /^\d{4}$/,
		"ES": /^\d{5}$/,
		"NL": /^\d{4}[ ]?[A-Z]{2}$/,
		"BE": /^\d{4}$/,
		"DK": /^\d{4}$/,
		"SE": /^\d{3}[ ]?\d{2}$/,
		"NO": /^\d{4}$/,
		"BR": /^\d{5}[\-]?\d{3}$/,
		"PT": /^\d{4}([\-]\d{3})?$/,
		"FI": /^\d{5}$/,
		"AX": /22\d{3}$/,
		"KR": /^\d{3}[\-]\d{3}$/,
		"CN": /^\d{6}$/,
		"TW": /^\d{3}(\d{2})?$/,
		"SG": /^\d{6}$/,
		"DZ": /^\d{5}$/,
		"AD": /AD\d{3}$/,
		"AR": /([A-HJ-NP-Z])?\d{4}([A-Z]{3})?$/,
		"AM": /(37)?\d{4}$/,
		"AZ": /^\d{4}$/,
		"BH": /((1[0-2]|[2-9])\d{2})?$/,
		"BD": /^\d{4}$/,
		"BB": /(BB\d{5})?$/,
		"BY": /^\d{6}$/,
		"BM": /[A-Z]{2}[ ]?[A-Z0-9]{2}$/,
		"BA": /^\d{5}$/,
		"IO": /BBND 1ZZ$/,
		"BN": /[A-Z]{2}[ ]?\d{4}$/,
		"BG": /^\d{4}$/,
		"KH": /^\d{5}$/,
		"CV": /^\d{4}$/,
		"CL": /^\d{7}$/,
		"CR": /^\d{4:5}|\d{3}-\d{4}$/,
		"HR": /^\d{5}$/,
		"CY": /^\d{4}$/,
		"CZ": /^\d{3}[ ]?\d{2}$/,
		"DO": /^\d{5}$/,
		"EC": /([A-Z]\d{4}[A-Z]|(?:[A-Z]{2})?\d{6})?$/,
		"EG": /^\d{5}$/,
		"EE": /^\d{5}$/,
		"FO": /^\d{3}$/,
		"GE": /^\d{4}$/,
		"GR": /^\d{3}[ ]?\d{2}$/,
		"GL": /39\d{2}$/,
		"GT": /^\d{5}$/,
		"HT": /^\d{4}$/,
		"HN": /(?:\d{5})?$/,
		"HU": /^\d{4}$/,
		"IS": /^\d{3}$/,
		"IN": /^\d{6}$/,
		"ID": /^\d{5}$/,
		"IL": /^\d{5}$/,
		"JO": /^\d{5}$/,
		"KZ": /^\d{6}$/,
		"KE": /^\d{5}$/,
		"KW": /^\d{5}$/,
		"LA": /^\d{5}$/,
		"LV": /^\d{4}$/,
		"LB": /(\d{4}([ ]?\d{4})?)?$/,
		"LI": /(948[5-9])|(949[0-7])$/,
		"LT": /^\d{5}$/,
		"LU": /^\d{4}$/,
		"MK": /^\d{4}$/,
		"MY": /^\d{5}$/,
		"MV": /^\d{5}$/,
		"MT": /[A-Z]{3}[ ]?\d{2:4}$/,
		"MU": /(\d{3}[A-Z]{2}\d{3})?$/,
		"MX": /^\d{5}$/,
		"MD": /^\d{4}$/,
		"MC": /980\d{2}$/,
		"MA": /^\d{5}$/,
		"NP": /^\d{5}$/,
		"NZ": /^\d{4}$/,
		"NI": /((\d{4}-)?\d{3}-\d{3}(-\d{1})?)?$/,
		"NG": /(\d{6})?$/,
		"OM": /(PC )?\d{3}$/,
		"PK": /^\d{5}$/,
		"PY": /^\d{4}$/,
		"PH": /^\d{4}$/,
		"PL": /^\d{2}-\d{3}$/,
		"PR": /00[679]\d{2}([ \-]\d{4})?$/,
		"RO": /^\d{6}$/,
		"RU": /^\d{6}$/,
		"SM": /4789\d$/,
		"SA": /^\d{5}$/,
		"SN": /^\d{5}$/,
		"SK": /^\d{3}[ ]?\d{2}$/,
		"SI": /^\d{4}$/,
		"ZA": /^\d{4}$/,
		"LK": /^\d{5}$/,
		"TJ": /^\d{6}$/,
		"TH": /^\d{5}$/,
		"TN": /^\d{4}$/,
		"TR": /^\d{5}$/,
		"TM": /^\d{6}$/,
		"UA": /^\d{5}$/,
		"UY": /^\d{5}$/,
		"UZ": /^\d{6}$/,
		"VA": /00120$/,
		"VE": /^\d{4}$/,
		"ZM": /^\d{5}$/,
		"AS": /96799$/,
		"CC": /6799$/,
		"CK": /^\d{4}$/,
		"RS": /^\d{5}$/,
		"ME": /8\d{4}$/,
		"CS": /^\d{5}$/,
		"YU": /^\d{5}$/,
		"CX": /6798$/,
		"ET": /^\d{4}$/,
		"FK": /FIQQ 1ZZ$/,
		"NF": /2899$/,
		"FM": /(9694[1-4])([ \-]\d{4})?$/,
		"GF": /9[78]3\d{2}$/,
		"GN": /^\d{3}$/,
		"GP": /9[78][01]\d{2}$/,
		"GS": /SIQQ 1ZZ$/,
		"GU": /969[123]\d([ \-]\d{4})?$/,
		"GW": /^\d{4}$/,
		"HM": /^\d{4}$/,
		"IQ": /^\d{5}$/,
		"KG": /^\d{6}$/,
		"LR": /^\d{4}$/,
		"LS": /^\d{3}$/,
		"MG": /^\d{3}$/,
		"MH": /969[67]\d([ \-]\d{4})?$/,
		"MN": /^\d{6}$/,
		"MP": /9695[012]([ \-]\d{4})?$/,
		"MQ": /9[78]2\d{2}$/,
		"NC": /988\d{2}$/,
		"NE": /^\d{4}$/,
		"VI": /008(([0-4]\d)|(5[01]))([ \-]\d{4})?$/,
		"PF": /987\d{2}$/,
		"PG": /^\d{3}$/,
		"PM": /9[78]5\d{2}$/,
		"PN": /PCRN 1ZZ$/,
		"PW": /96940$/,
		"RE": /9[78]4\d{2}$/,
		"SH": /(ASCN|STHL) 1ZZ$/,
		"SJ": /^\d{4}$/,
		"SO": /^\d{5}$/,
		"SZ": /[HLMS]\d{3}$/,
		"TC": /TKCA 1ZZ$/,
		"WF": /986\d{2}$/,
		"XK": /^\d{5}$/,
		"YT": /976\d{2}$/
	};
	
	var valid;
	$.each(postalReq, function(k, v) {
		if (k === country) {
			if (country === 'KR') {
				valid = v.test(postal) || /^\d{5}$/.test(postal);
			} else {
				valid = v.test(postal);
			}
		}
	});
	
	return valid;
}

//url에서 parameter 가져오는 fnc
(function($){
		$.QueryString = (function(key){
			if(key == "") return {};
			var rtnVal = {};
			
			for (var i = 0; i < key.length; i++){
				var p=key[i].split('='); 
				if (p.length != 2) continue;
				rtnVal[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
			}
			return rtnVal;
		})(window.location.search.substr(1).split('&'))
})(jQuery);

/**
 * POPUP EVENT
 * @param {Object} obj :
 *   속성목록 
 *   {string} type : 코드 종류
 *   {string} btn_id : 버튼 아이디
 *   {string} head_id : 해더 ID (공통코드에서만 사용)
 * 	 {string} code : CODE (입력안받아도됨, 코드명으로 받아도됨)
 * 	 {string} name : NAME
 */
function fn_codeval(obj) {
	var type, btn_id, head_id, code, name;
	
	$.each(obj, function (k, v) {
		if (k == 'type') {
			type = v;
		} else if (k == 'btn_id') {
			btn_id = v;
		} else if (k == 'code') {
			code = v;
		} else if (k == 'name') {
			name = v;
		} else if (k == 'head_id') { 
			head_id = v;
		} 
	})
	$('#' + btn_id).click(function(e) {
			if (type == 'COMM') { /* COMMON CODE */
				fn_popComm(head_id, code, name);
			} 
			else if (type == 'DEPT') { /* DEPARTMENT */
				fn_popDept(code, name);
			}
			else if (type == 'USER') { /* CUST */
				fn_popUser(code, name);
			}
	});
}

function fn_popComm(head_id, code, name, cb, refCode) {
	var gridData, resultData = [];
	var popflg = true;
	var compCdVal = parent.$('#G_COMP_CD').val();
	var tag = $('[name="' + name + '"]');
	var sendData = {'S_HEAD_ID': head_id ,
			'S_CODE':$('[name="' + code + '"]').val(),
			'S_COMP_CD':compCdVal};
	
	if (!!refCode) {
		sendData.RefCode = refCode;
	}
	
	var url = '/popup/CommPopup.do';
	var pid = 'commPopup';
	
	var args = Array.prototype.slice.call(arguments, 5);
	popupOpen(url, pid, sendData, function(data) {
		if (typeof cb === 'function') {
			args.push(data);
			cb.apply(this, args);
			return;
		}
		
		if (data.length == 1) {
			$('[name="' + code + '"]').val(data[0].CODE);
			(tag.is('p')) ? tag.text(data[0].NAME) : tag.val(data[0].NAME);
			
			resultData = data[0];
			$('[name="' + code + '"]').focus();
		} else {
			$('[name="' + code + '"]').focus();
		}
		$('#' + code).trigger('change');
	});
}

function fn_popUser(code, name) {
	var gridData, resultData = [];
	var popflg = true;
	var compCdVal = parent.$('#G_COMP_CD').val();

	var sendData = {'S_CODE':$('[name="' + code + '"]').val(),
			'S_COMP_CD':compCdVal};
	
	var url = '/popup/UserPopup2.do';
	var pid = 'UserPopup2';
	
	popupOpen(url, pid, sendData, function(data) {
		if (data.length == 1) {
			$('[name="' + code + '"]').val(data[0].USER_ID);
			$('[name="' + name + '"]').text(data[0].NAME_FULL);
			resultData = data[0];
			$('[name="' + name + '"]').focus();
		} else {
			$('[name="' + name + '"]').focus();
		}
	});
}
function fn_popDept(code, name) {
	var gridData, resultData = [];
	var popflg = true;
	var compCdVal = parent.$('#G_COMP_CD').val();

	var sendData = {'S_CODE':$('[name="' + code + '"]').val(),
			'S_COMP_CD':compCdVal};
	
	var url = '/common/DeptPopup.do';
	var pid = 'deptPopup';
	
	popupOpen(url, pid, sendData, function(data) {
		console.log("DATA: " + data + ' CODE: ' + code + ' NAME: '+ name);
		if (data.length == 1) {
			$('[name="' + code + '"]').val(data[0].DEPT_CD);
			$('[name="' + name + '"]').text(data[0].DEPT_NM);
			resultData = data[0];
			$('[name="' + name + '"]').focus();
		} else {
			$('[name="' + name + '"]').focus();
		}
	});
}
function getToday(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();

	if(dd < 10) {
		dd='0'+dd
	}
	
	if(mm < 10) {
		mm='0'+mm
	}
	
	return dd + '.' + mm + '.'+yyyy;
}

function getYearFirst(){
	var today = new Date();
	var yyyy = today.getFullYear();
		
	return  '01.01.'+yyyy;
}

function getlastMonth(){
	var today = new Date();
	var lastMonth = today.getMonth() - 1;
	today.setMonth(lastMonth);
	
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();

	if(dd < 10) {
		dd='0'+dd
	}
	
	if(mm < 10) {
		mm='0'+mm
	}
	
	return dd + '.' + mm + '.'+yyyy;
}

function getDayAfterToday(addDay){
	
	var today = new Date();
	
	var loadDt = new Date();
	loadDt = loadDt.getTime() + (addDay * 24 * 60 * 60 * 1000);
	today.setTime(loadDt);
		
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();

	if(dd < 10) { dd='0'+dd }
	
	if(mm < 10) { mm='0'+mm }
	
	return dd + '.' + mm + '.'+yyyy;
}

function getWeekNo(day) {
	
	var startYearDay;
	var today;
	var setYear;
	
	if(null != day){
		var tempVal = day.split('\.');
		startYearDay = '1/1/'+tempVal[2];
		today = tempVal[1] + '/' + tempVal[0] + '/' + tempVal[2];
		setYear = tempVal[2];
	}else{
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();

		if(dd < 10) {
			dd='0'+dd
		}
		
		if(mm < 10) {
			mm='0'+mm
		}
		
		startYearDay = '1/1/' + yyyy;
		today = mm + '/' + dd + '/' + yyyy;
		setYear = yyyy;
	}
	
	var dt = new Date(startYearDay);
	var tDt = new Date(today);

	var diffDay = (tDt-dt) / 86400000;
	
	var weekDay = parseInt(diffDay / 7) + 1;

	if( tDt.getDay() < dt.getDay() ){
		weekDay += 1;
	}
	
	return weekDay + '.' + setYear; 
}


function getWeekDay(obj) {
    var year = obj.substring(6, 10);
    var month = obj.substring(3, 5);
    var day = obj.substring(0, 2);
    var vn_day1 = new Date(year, month - 1, day);

    var i = vn_day1.getDay(); 

    if ((i > 0) && (i < 7)) { 
        intDayCnt1 = 1 - i;
    }
    else if (i == 0) {  
        intDayCnt1 = -6;
    }

    var Cal_st = new Date(vn_day1.getFullYear(), vn_day1.getMonth(), vn_day1.getDate() + intDayCnt1);

	var dd = Cal_st.getDate();
	var mm = Cal_st.getMonth()+1;
	var yyyy = Cal_st.getFullYear();
	
	if(dd < 10) {
		dd='0'+dd
	}
	
	if(mm < 10) {
		mm='0'+mm
	}
	
	var returnDay = dd + '.' + mm + '.' + yyyy;
	
    return returnDay;
}

function fn_setModify(formid, prefix) {
	var formdata = formIdAllToMap(formid);
	
	if('N' == $('#' + prefix + 'isStatus').val() || '' == $('#' + prefix + 'isStatus').val()){
		flag = false;
	}else{
		flag = true;
	}
	
	$.each(formdata, function(key, value) {
		if ($('[name=' + prefix + key + ']').attr('data-modify') === 'Y') {
			$('[name=' + prefix + key + ']').attr('disabled', flag);
			$('[name=' + prefix + key + ']').attr('readonly', flag);
		}
	});
}

//open product pop up
function openProductPop(matlCd, sOrg, dChl, div, batchFlg){
	var url = "/popup/productPopUp.do";
	var pid = "productPopUp";  //팝업 페이지의 취상위 div ID
	var disFlag = 'Y';
	
	if(fn_empty(sOrg) || fn_empty(dChl)){
		disFlag = 'N';
	}
	
	var param = { 'MATL_CD':matlCd
				, 'SALES_ORG_CD' : sOrg
				, 'DISTRB_CH' : dChl
				, 'DIV_CD' : div
				, 'DISFLAG' : disFlag
				, 'BATCH_FLG' : batchFlg
	};
	
	popupOpen(url, pid, param, function(data){
		if(!fn_empty(data)){
			rtnProPopArr = [];
			for(var i = 0; i < data.length; i++){
				rtnProPopArr.push(data[i]["MATL_CD"]);		//0
				rtnProPopArr.push(data[i]["MATL_DESC"]);	//1
				rtnProPopArr.push(data[i]["LONG_TEXT"]);	//2
				rtnProPopArr.push(data[i]["SALES_ORG_CD"]);	//3
				rtnProPopArr.push(data[i]["DISTRB_CH"]);	//4
				rtnProPopArr.push(data[i]["DIV_CD"]);		//5
				rtnProPopArr.push(data[i]["PLANT_CD"]);		//6
				rtnProPopArr.push(data[i]["X_P_STATUS"]);	//7
				rtnProPopArr.push(data[i]["BUM"]);			//8
				rtnProPopArr.push(data[i]["WP_OUT"]);		//9
				rtnProPopArr.push(data[i]["MATL_GR"]);		//10
				rtnProPopArr.push(data[i]["BASIC_UNIT"]);	//11
				rtnProPopArr.push(data[i]["GROSS_WT"]);		//12
				rtnProPopArr.push(data[i]["NET_WT"]);		//13
				rtnProPopArr.push(data[i]["WT_UNIT"]);		//14
				rtnProPopArr.push(data[i]["VOL_QTY"]);		//15
				rtnProPopArr.push(data[i]["VOL_UNIT"]);		//16
				rtnProPopArr.push(data[i]["LONG_TEXT"]);	//17
				rtnProPopArr.push(data[i]["BATCH_NO"]);		//18
				rtnProPopArr.push(data[i]["UOM_CNT"]);		//19
				
				//각 호출하는 화면에서 구현 해야함.
				setProductToGrid();
			}
		}
	});
}	


//open product pop up
function itemProductPop(matlCd, sOrg, dChl, div, batchFlg, plantCd){
	var url = "/popup/itemPopUp.do";
	var pid = "itemPopUp";  //팝업 페이지의 취상위 div ID
	var disFlag = 'Y';
	
	if(fn_empty(sOrg) || fn_empty(dChl)){
		disFlag = 'N';
	}
	
	var param = { 'MATL_CD':matlCd
				, 'SALES_ORG_CD' : sOrg
				, 'DISTRB_CH' : dChl
				, 'DIV_CD' : div
				, 'DISFLAG' : disFlag
				, 'BATCH_FLG' : batchFlg
				, 'PLANT_CD' : plantCd
	};
	
	popupOpen(url, pid, param, function(data){
		if(!fn_empty(data)){
			rtnProPopArr = [];
			for(var i = 0; i < data.length; i++){
				rtnProPopArr.push(data[i]["MATL_CD"]);		//0
				rtnProPopArr.push(data[i]["MATL_DESC"]);	//1
				rtnProPopArr.push(data[i]["LONG_TEXT"]);	//2
				rtnProPopArr.push(data[i]["SALES_ORG_CD"]);	//3
				rtnProPopArr.push(data[i]["DISTRB_CH"]);	//4
				rtnProPopArr.push(data[i]["DIV_CD"]);		//5
				rtnProPopArr.push(data[i]["PLANT_CD"]);		//6
				rtnProPopArr.push(data[i]["X_P_STATUS"]);	//7
				rtnProPopArr.push(data[i]["BUM"]);			//8
				rtnProPopArr.push(data[i]["WP_OUT"]);		//9
				rtnProPopArr.push(data[i]["MATL_GR"]);		//10
				rtnProPopArr.push(data[i]["BASIC_UNIT"]);	//11
				rtnProPopArr.push(data[i]["GROSS_WT"]);		//12
				rtnProPopArr.push(data[i]["NET_WT"]);		//13
				rtnProPopArr.push(data[i]["WT_UNIT"]);		//14
				rtnProPopArr.push(data[i]["VOL_QTY"]);		//15
				rtnProPopArr.push(data[i]["VOL_UNIT"]);		//16
				rtnProPopArr.push(data[i]["LONG_TEXT"]);	//17
				rtnProPopArr.push(data[i]["BATCH_NO"]);		//18
				rtnProPopArr.push(data[i]["UOM_CNT"]);		//19
				
				//각 호출하는 화면에서 구현 해야함.
				setProductToGrid();
			}
		}
	});
}	

function createGridDateFm(text){
	(text.length == 2) ? text += '.' : '';
	(text.length == 5) ? text += '.' : '';
	return text;
}

function createGridNumFm(num){
	var rtnVal = "";
	
//	var num = text.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	var tempArr = num.split(".");
	
	if(!fn_empty(num)){
		if(1 < tempArr.length){
			rtnVal = tempArr[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ',' + tempArr[1];
		}else{
			rtnVal = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")+ ',00';
		}
	}else{
		rtnVal = '';
	}
	
	return rtnVal;
}

function createNormalFm(text){
	var rtnVal = "";
	var tempArr;
	var tempVal = text.toString();  
	
	if(!fn_empty(tempVal)){
		if (-1 < tempVal.indexOf(',')) {
			tempArr = tempVal.split(",");
			rtnVal = fn_replaceAll(tempArr[0], '.', '') + '.' + tempArr[1];
		}else{
			rtnVal = fn_replaceAll(tempVal, '.', '');
		}
	}
	
	return rtnVal;
}

function fn_dataBindByPrefix(formid, prefix, data) {
	$.each(data, function(key, value) {
		var tag = $('#' + formid).find('[name="' + prefix + key + '"]');
		if (tag.attr('data-type') == 'datetime') {
			var val = value;
			if (value.length == 14) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' ' + value.substring(8, 10)
						+ ':' + value.substring(10, 12) + ':'
						+ value.substring(12, 14);
			} else if (value.length == 12) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' ' + value.substring(8, 10)
						+ ':' + value.substring(10, 12) + ':' + '00';
			} else if (value.length == 8) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8) + ' 00:00:00';
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'date') {
			var val = value;
			if (value.length == 8) {
				val = value.substring(0, 4) + '-' + value.substring(4, 6) + '-'
						+ value.substring(6, 8);
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'time') {
			var val = value;
			if (value.length == 6) {
				val = value.substring(0, 2) + ':' + value.substring(2, 4) + ':'
						+ value.substring(4, 6);
			}
			tag.val(val);
		} else if (tag.attr('data-type') == 'yyyymm') {
			if (value.length == 6) {
				var val = value.substring(0, 4) + '-' + value.substring(4, 6);
				tag.val(val);
			}
		} else if (tag.attr('type') == 'radio') {
			$('[name="' + key + '"][value="' + value + '"]').prop('checked',
					true)
		} else if (tag.attr('type') == 'checkbox') {
			if (value == 1 || value == 'Y') {
				tag.prop('checked', true);
			}
		} else if (tag.attr('type') === 'textarea') {
			tag.val(value.replace(/\\r\\n/g, '\r\n'));
		} else if (tag.attr('data-type') == 'bizno') {
			tag.val(value.replace(/(\d{3})(\d{2})(\d{5})/g, '$1-$2-$3'));
		} else if (tag.attr('type') === 'text' || tag.attr('type') === 'hidden') {
			tag.val(value);
		} else {
			(tag.is('p')) ? tag.text(value) : tag.val(value);
		}
	});
}

function setRowStatus(grid){
	
//	btGrid.gridSaveRow(grid);
	
	var selRow = $('#' + grid).jqGrid('getGridParam', 'selrow');
	
	var rowSts = "";
	('I' != $('#' + grid).jqGrid('getCell', selRow, 'ROW_STATUS')) ? rowSts = 'U' : rowSts = 'I';
	$('#' + grid).jqGrid('setCell', selRow, 'ROW_STATUS', rowSts);
}



//뒤로가기 버튼 방지 
var killBackSpace = function(e) { 
	e = e ? e : window.event; 
	var t = e.target ? e.target : e.srcElement ? e.srcElement : null;
	if(t && t.tagName && (t.type && /(password)|(text)|(file)/.test(t.type.toLowerCase())) || t.tagName.toLowerCase() == 'textarea') { return true; } 
	var k = e.keyCode ? e.keyCode : e.which ? e.which : null; 
	if(k == 8) { 
		if(e.preventDefault) { e.preventDefault(); } 
		return false; 
	} 
	return true; 
};

if(typeof document.addEventListener != 'undefined') { 
	document.addEventListener('keydown', killBackSpace, false); 
}else if(typeof document.attachEvent != 'undefined') { 
	document.attachEvent('onkeydown', killBackSpace); 
}else { 
	if(document.onkeydown != null) { 
		var oldOnkeydown = document.onkeydown; 
		document.onkeydown = function(e) { 
			oldOnkeydown(e); killBackSpace(e); 
			}; 
	}else { 
		document.onkeydown = killBackSpace; 
	}
}

history.pushState(null, document.title, location.href); 

window.addEventListener('popstate', function(event) { 
	history.pushState(null, document.title, location.href); 
});

function fn_inputCheckByPrefix(formid, prefix) {
	var flag = true;
	var formdata = formIdAllToMap(formid);
	$.each(formdata, function(key, value) {
		if ($('[name=' + prefix + key + ']').attr('ess') === 'ess' && fn_empty(value)) {
			alert($('[name=' + prefix + key + ']').parent().prev().text().replace('*','') + ' is required input value.');
			$('[name=' + prefix + key + ']').focus();
			flag = false;
			return flag;
		}
	});
	return flag;
}

function changeDateFormat(dateVal){
	var tempDate = dateVal.split('\.');
	return tempDate[2] + tempDate[1] + tempDate[0];
}

function fn_formDisable(formIDs, gridIDs) {
	if (fn_empty(formIDs) == false) {
		for (var f = 0, len = formIDs.length; f < len; f++) {
			$('#' + formIDs[f]).find('select').not('.nodis').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			$('#' + formIDs[f]).find('input,textarea').not('.nodis').attr('disabled', 'disabled').attr('tabindex', '-1').addClass('disabled');
			$('#' + formIDs[f]).find('input[type="button"]').not('.nodis').attr('disabled', 'disabled').attr('tabindex', '-1').css('cursor', 'default');
			$('#' + formIDs[f]).find('input[data-type="date"]').not('.nodis').attr('tabindex', '-1').datepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="datetime"]').not('.nodis').attr('tabindex', '-1').datepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="yyyymm"]').not('.nodis').attr('tabindex', '-1').datepicker('destroy');
			$('#' + formIDs[f]).find('input[data-type="time"]').not('.nodis').attr('tabindex', '-1').datepicker('destroy');
		}
	}
}
function fn_formEnable(formIDs, gridIDs) {
	if (fn_empty(formIDs) == false) {
		for (var f = 0, len = formIDs.length; f < len; f++) {
			$('#' + formIDs[f]).find('select').removeAttr('disabled');
			$('#' + formIDs[f]).find('input,textarea').removeAttr('disabled');
			$('#' + formIDs[f]).find('input[type="button"]').css('cursor', 'default').removeAttr('disabled');
			$('#' + formIDs[f]).find('input[data-type="date"]').not('.nodis').attr('tabindex', '-1').datepicker({
				dateFormat : 'yy.mm.dd',
				showOn : 'both'
			}).css('ime-mode', 'disabled').attr('readonly', 'readonly').attr('maxlength', 10);
			$('#' + formIDs[f]).find('input[data-type="datetime"]').not('.nodis').attr('tabindex', '-1').datepicker({
				dateFormat : 'yy.mm.dd',
				showOn : 'both'
			}).css('ime-mode', 'disabled').attr('readonly', 'readonly').attr('maxlength', 10);
			$('#' + formIDs[f]).find('input[data-type="yyyymm"]').not('.nodis').attr('tabindex', '-1').datepicker({
				dateFormat : 'yy.mm.dd',
				showOn : 'both'
			}).css('ime-mode', 'disabled').attr('readonly', 'readonly').attr('maxlength', 10);
			$('#' + formIDs[f]).find('input[data-type="time"]').not('.nodis').attr('tabindex', '-1').datepicker({
				dateFormat : 'yy.mm.dd',
				showOn : 'both'
			}).css('ime-mode', 'disabled').attr('readonly', 'readonly').attr('maxlength', 10);
		}
	}
}

function checkBetweenDate(fmDt, toDt){
	
	var rtnFlg = true;
	
	var tempFmDt = fmDt.split('\.');
	var tempToDt = toDt.split('\.');
	
	var fDay = new Date(tempFmDt[2], tempFmDt[1], tempFmDt[0]);
	var eDay = new Date(tempToDt[2], tempToDt[1], tempToDt[0]);
	
	if(eDay < fDay){
		alert('Check Date Field');
		rtnFlg = false;
	}
	
	return rtnFlg;
}

function clearForm(oForm) {
	var elements = oForm.elements; 
	oForm.reset();
	oForm.find('.data_side_text').text('');
	oForm.find('.data_under_text').text('');
}

function getCodeNm(codeH, codeV){
	var rtnCodeN = '';
	
	var url = "/common/getCodeNm.do";
	var param = { "param" : { "S_HEAD_ID" : codeH, "S_CODE" : codeV }};
	
	fn_ajax(url, false, param, function(data, xhr){
		rtnCodeN = data.codeNm;
	});
	
	return rtnCodeN;
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();
	if (!fn_empty(n) && digits > n.length) {
        for (var i = 0; digits - n.length > i; i++) {
            zero += '0';
        }
    }
    return zero + n;
}

function addNewTab(url, name){
	window.top.addTab(String(parseInt(Math.random() * 100000, 10)), url, name);
}

function rmNum(text){
	var rtnVal = "";
	var tempArr;
	var tempVal = text.toString();  
	
	if(!fn_empty(tempVal)){
		if (-1 < tempVal.indexOf('.')) {
			tempArr = tempVal.split(".");
			rtnVal = fn_replaceAll(tempArr[0], ',', '') + ',' + tempArr[1];
		}else{
			rtnVal = fn_replaceAll(tempVal, ',', '');
		}
	}

	return rtnVal;
}