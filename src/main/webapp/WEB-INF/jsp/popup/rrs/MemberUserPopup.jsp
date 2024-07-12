<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MemberUserPopup
 * @Description : 멤버 회원 정보 팝업
 */
%>
<div id="memberUserPopup">
	<div class="oms_popup_button">
		<button class='btn btn-default' id='btn_download_excel_form' type='button' onclick='downloadExcel();'>
      		엑셀샘플파일 내려받기
      	</button>
		<button class='btn btn-default' id='btn_upload_excel_popup' type='button' onclick="uploadExcelFunc()">
			엑셀 업로드
      	</button>
		<button class='btn btn-default' id='btn_memberUserAddPopup' type='button'>
      		등록
      	</button>
      	<button class='btn btn-default' id='btn_delete' type='button' onclick='deleteMemberUser()'>
      		삭제
      	</button>
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">	
			<table id="grid_MemberUser" class="user_info_table"></table>
			<div id="pager_MemberUser"></div>
		</div>	
		<!-- 그리드 끝 -->
	</div>
</div>
<style>
    td { cursor:pointer; }
</style>
<script type="text/javascript">
$(function() {
	$('#memberUserPopup').dialog({
		title:'멤버 회원 정보',
		autoOpen: false,
		height: 468,
		width: 1300,
		modal: true,
		buttons: {
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#memberUserPopup .pop_grid_wrap').height($(this).height() - $('#memberUserPopup.popup_search').outerHeight(true) - 70);
			
			grid_MemberUser_Load();
			popupSearch();

			/* 그리드 이벤트 */
			$('#grid_MemberUser').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
					// popupClose($('#memberUserPopup').data('pid'));
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
		var param = {"RET_YN" : "N"}
		memberUserPopup(param);
	});
});

function grid_MemberUser_Load() {
	var colName = [
		'순번',
		'멤버ID',
		'이름',
		'영문이름',
		'전화번호',
		'이메일',
		'배우자한글이름',
		'배우자영문이름',
		'배우자성별',
		'배우자전화번호',
		'탈퇴여부',
		'선택'
	];
	
	var colModel = [
		{ name: 'ROWNUM', width: 100, align: 'center' },
		{ name: 'MEMBER_ID', width: 100, align: 'center' },
		{ name: 'HAN_NAME', width: 100, align: 'center' },
		{ name: 'ENG_NAME', width: 100, align: 'center' },
		{ name: 'TEL_NO', width: 120, align: 'center' },
		{ name: 'EMAIL', width: 120, align: 'center' },
		{ name: 'PARTNER_HAN_NAME', width: 100, align: 'center' },
		{ name: 'PARTNER_ENG_NAME', width: 100, align: 'center' },
		{ name: 'PARTNER_GENDER', width: 70, align: 'center' },
		{ name: 'PARTNER_TEL_NO', width: 120, align: 'center' },
		{ name: 'RET_YN', width: 50, align: 'center' },
		{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false }
	];

	var gSetting = {
			height: 277,
			pgflg:true,
			exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,  // 컬럼 설정 버튼 노출여부
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

function uploadExcelFunc(param) {
	var url = "/rrs/MemberUserExcelUploadPopup.do";
	var pid = "p_MemberUserExcelUploadPopup";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid, param, function(data) {
		popupSearch();
	});
}

// popupSearch
function popupSearch() {
	var sendData = {};
	var url = '/rrs/selectMemberUserInfo.do';
	
	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData     = data.result;
		$('#grid_MemberUser').jqGrid('clearGridData');
	    $('#grid_MemberUser').jqGrid('setGridParam', {data:gridData});
	    $('#grid_MemberUser').trigger('reloadGrid');
	    
	});
	setTelNoHypen();
	setPatnerGender();
}

function setTelNoHypen() {
	var rowDataList = $("#grid_MemberUser").getRowData();
	for(var i=0; i<rowDataList.length; i++) {
		var convert_TEL_NO = rowDataList[i].TEL_NO.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
		$("#grid_MemberUser").jqGrid('setCell', i+1, 'TEL_NO', convert_TEL_NO);
		
		var convert_p_TEL_NO = rowDataList[i].PARTNER_TEL_NO.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
		$("#grid_MemberUser").jqGrid('setCell', i+1, 'PARTNER_TEL_NO', convert_p_TEL_NO);
	}
}

function setPatnerGender() {
	var url = '/rrs/selectMemCodeInfo.do';
	var sendData = {'param' : {"HEAD_CD": 500250}};
	
	fn_ajax(url, false, sendData, function(data, xhr) {
		var codeInfo = data.result;
		var rowDataList = $("#grid_MemberUser").getRowData();
		
		for(var i=0; i<rowDataList.length; i++) {			
			var patnerGender = rowDataList[i].PARTNER_GENDER;
			
			$.each(codeInfo, function(index, item){
				if (patnerGender === item.CODE) {
					$("#grid_MemberUser").jqGrid('setCell', i+1, 'PARTNER_GENDER', item.CODE_NM);
				}
			});	
		}		
	});		
}

function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid_MemberUser").getRowData(rowid);

	var param = {
		"MEMBER_ID" : gridData["MEMBER_ID"],
		"HAN_NAME"  : gridData["HAN_NAME"],
		"ENG_NAME"  : gridData["ENG_NAME"],
		"TEL_NO"    : gridData["TEL_NO"],
		"EMAIL"     : gridData["EMAIL"],
		"PARTNER_HAN_NAME" : gridData["PARTNER_HAN_NAME"],
		"PARTNER_ENG_NAME" : gridData["PARTNER_ENG_NAME"],
		"PARTNER_GENDER"   : gridData["PARTNER_GENDER"],
		"PARTNER_TEL_NO"   : gridData["PARTNER_TEL_NO"],
		"RET_YN"    : gridData["RET_YN"],
	};
	memberUserPopup(param);
}

function memberUserPopup(param){
	var url = "/rrs/MemberUserAddPopup.do";
	var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid, param, function(data) {
		popupSearch();
	});
}

function deleteMemberUser() {
	var ids = $("#grid_MemberUser").jqGrid("getDataIDs");
	var gridData = [];
	var cnt = 0;
	btGrid.gridSaveRow('grid_MemberUser');
	for(var i = 0; i < ids.length; i++){
		if($('#grid_MemberUser_' + ids[i] + '_CHK').prop('checked')){
			cnt++;
			var rowData = $("#grid_MemberUser").getRowData(ids[i]);
			rowData.TEL_NO = rowData.TEL_NO.replace(/-/g, '');
			gridData.push(rowData);
		}
	}
	
	if(cnt < 1){
		alert("삭제할 데이타를 선택하십시오.");
		return;
	}
	
	if(confirm("삭제하시겠습니까?")){
		var url = '/rrs/deleteMemberUserInfo.do';
		var param = {"gridData" : gridData};
		
		fn_ajax(url, false, param, function(data, xhr){
			if (data.isExistUserMember == 'Y') {
				alert("회원정보가 있습니다. 탈퇴로 변경 부탁드립니다");
			} else {
				alert("삭제하였습니다.");
				popupSearch();
			}
		});
	}
}

</script>
