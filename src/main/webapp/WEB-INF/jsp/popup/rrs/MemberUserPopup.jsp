<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MemberUserPopup
 */
%>
<div id="memberUserPopup">
	<div class="oms_popup_button">
		<button class='btn btn-default' id='btn_download_excel_form' type='button' onclick='downloadExcel();'>
      		엑셀샘플파일 내려받기
      	</button>
		<button class='btn btn-default' id='btn_memberUserAddPopup' type='button'>
      		등록
      	</button>
      	<button class='btn btn-default' id='btn_delete' type='button' onclick=''>
      		삭제
      	</button>
      	<button class='btn btn-default' id='btn_upload_excel' type='button' onclick='uploadExcel();'>
			엑셀 업로드
      	</button>
	
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">	
			<table id="grid_MemberUser"></table>
			<div id="pager_deptMG"></div>
		</div>	
		<!-- 그리드 끝 -->
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#memberUserPopup').dialog({
		title:'멤버 회원 정보',
		autoOpen: false,
		height: 468,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {		
					var selRows = $('#grid_MemberUser').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#grid_MemberUser').getRowData(selRows)];
					
					p_rtnData = gridData;

					parent.$('#DEPT_CD').val(p_rtnData[0].DEPT_CD);
					parent.$('#DEPT_NM').val(p_rtnData[0].DEPT_NM);						

					popupClose($('#memberUserPopup').data('pid'));
					
				}
			},
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#memberUserPopup .pop_grid_wrap').height($(this).height() - $('#memberUserPopup.popup_search').outerHeight(true) - 70);
			
			$('#S_DEPT_CD').val($(this).data('S_DEPT_CD'));
			
			grid_MemberUser_Load();
			popupSearch();

			$('[name="S_DEPT_CD"]').focus();
			
			/* 그리드 이벤트 */
			$('#grid_MemberUser').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
					// popupClose($('#memberUserPopup').data('pid'));
		    	}
			});
			
			$("#S_DEPT_CD").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			$("#S_DEPT_NM").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			gridData = $(this).data('gridData');
			if (fn_empty(gridData) == false) {
				$('#grid1').jqGrid('clearGridData');
			    $('#grid1').jqGrid('setGridParam', {data:gridData});
			    $('#grid1').trigger('reloadGrid');
			}
		},
		close: function(e, ui) {
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
	
	$("#btn_memberUserAddPopup").click(function(e) {
		console.log("memberUserAddPopup button");
		var url = "/rrs/MemberUserAddPopup.do";
		var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid);
	});
});

function grid_MemberUser_Load() {
	var colName = [
		'순번',
		'이름',
		'영문이름',
		'전화번호',
		''
	];
	
	var colModel = [
		{ name: 'ROWNUM', width: 100, align: 'center' },
		{ name: 'HAN_NAME', width: 100, align: 'center' },
		{ name: 'ENG_NAME', width: 100, align: 'center' },
		{ name: 'TEL_NO', width: 100, align: 'center' },
		{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false }
	];

	var gSetting = {
			height: 277,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
	btGrid.createGrid('grid_MemberUser', colName, colModel, gSetting);
}

function downloadExcel(){
	// Get grid column info
	var title = "MemberSampleExcel";
	var excelColModel = [];
	var colModel = $("#grid_MemberUser").jqGrid('getGridParam','colModel');
	var colName=$("#grid_MemberUser").jqGrid('getGridParam','colNames');
	for(var i=0; i<colModel.length; i++) {
		if(colModel[i].hidden===true){continue;}
		if(colModel[i].colmenu===false){continue;}
		if(colModel[i].name==='ROWNUM' || colName[i]===''){continue;}
		var rowdata={};
		rowdata['label']=colName[i];
		rowdata['name']=colModel[i].name;
		rowdata['width']=colModel[i].width;
		rowdata['align']=fn_empty(colModel[i].align)?'left':colModel[i].align;
		rowdata['formatter']=fn_empty(colModel[i].formatter)?'':colModel[i].formatter;
		excelColModel.push(rowdata);
		if(colModel[i].formatter=='select'){
			$('#' + gid).jqGrid('setColProp',colModel[i].name,{unformat:gridUnfmt});
		}
	}
	
 	var param = { 
 		'COL_NM': excelColModel,
 		'TITLE': title,
	};
 	
 	// ajax
 	fn_ajax('/rrs/downloadExcelSample.do', true, param, function(data, xhr) {
        var exceldata = base64DecToArr(data.exceldata);
        var filename = title + '.xlsx';
        var blob = new Blob([exceldata], {
            type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        });
        if (typeof window.navigator.msSaveBlob !== 'undefined') {
            window.navigator.msSaveBlob(blob, filename);
        } else {
            var URL = window.URL || window.webkitURL;
            var downloadUrl = URL.createObjectURL(blob);
            if (filename) {
                var a = document.createElement('a');
                if (typeof a.download === 'undefined') {
                    window.location = downloadUrl;
                } else {
                    a.href = downloadUrl;
                    a.download = filename;
                    document.body.appendChild(a);
                    a.click();
                }
            } else {
                window.location = downloadUrl;
            }
            setTimeout(function() {
                URL.revokeObjectURL(downloadUrl);
            }, 100);
        }
    });
 	
}

function uploadExcel() {
	var url = "/rrs/MemberUserExcelUploadPopup.do";
	var pid = "p_MemberUserExcelUploadPopup";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid);
}

// popupSearch
function popupSearch() {
	var sendData = {};
	var url = '/rrs/selectMemberUserInfo.do';
	
	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#grid_MemberUser').jqGrid('clearGridData');
	    $('#grid_MemberUser').jqGrid('setGridParam', {data:gridData});
	    $('#grid_MemberUser').trigger('reloadGrid');
	});
}

function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid_MemberUser").getRowData(rowid);
	var param = {
		"HAN_NAME" : gridData["HAN_NAME"],
		"ENG_NAME" : gridData["ENG_NAME"],
		"TEL_NO" : gridData["TEL_NO"],
	};
	memberUserPopup(param);
}

function memberUserPopup(param){
	var url = "/rrs/MemberUserAddPopup.do";
	var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid, param);
}

</script>