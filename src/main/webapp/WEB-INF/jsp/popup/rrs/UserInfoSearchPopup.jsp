<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : UserInfoSearchPopup
 * @Description : 멤버 찾기 팝업
 */
%>
<div id="UserInfoSearchPopup">
	<!-- Search condition start -->
	<form id="frmSearch">
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td>
							<select id="SELECT_INFO" name="SELECT_INFO" class="cmc_combo" style="width:100px;">
								<option value="haName" selected>이름</option>
								<option value="tNo">전화번호</option>
							</select>
						</td>
						<td class="medium_td"><input type="hidden"/><input type="text" id="MEMBER_SEARCH_TEXT" name="MEMBER_SEARCH_TEXT" class="cmc_txt"  style="width:300px;" maxlength="30" autofocus/></td>
						<td><button class='btn btn-default' id='btn_searck' type='button'>조회</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<!-- Search condition end -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<!-- 그리드 start -->
		<div class="pop_grid_wrap">	
			<table id="grid_MemberUser"></table>
			<div id="pager_MemberUser"></div>
		</div>	
		<!-- 그리드 end -->
	</div>
</div>
<script type="text/javascript">
$(function() {
	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : grid_MemberUser_Load() / UserInfoSearch()
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	$('#UserInfoSearchPopup').dialog({
		title   :'멤버 찾기',
		autoOpen: false,
		height  : 400,
		width   : 700,
		modal   : true,
		buttons: {
			/* 닫기 버튼 */
			'<s:message code='button.close'/>': {
				text :'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function() {
			grid_MemberUser_Load();
			UserInfoSearch();
			
			/* grid1 Event */
			$('#grid_MemberUser').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
		},
		close: function() {
			popupClose($(this).data('pid'));
		}
	});
});

/******************************************** 
 * @Subject : 조회 함수
 * @Content : 멤버 데이터 조회 후 화면 셋팅
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
function grid_MemberUser_Load() {
	var colName = [
		'멤버ID',
		'이름',
		'영문이름',
		'전화번호',
		'이메일',
		'등록자 ID',
		'등록일시',
		'수정자 ID',
		'수정일시'
	];
	
	var colModel = [
		{ name: 'MEMBER_ID', width: "20%", align: 'center' },
		{ name: 'HAN_NAME' , width: "25%", align: 'center' },
		{ name: 'ENG_NAME' , width: "25%", align: 'center' },
		{ name: 'TEL_NO'   , width: "30%", align: 'center' },
		{ name: 'EMAIL'    , width : 0  , align : 'center', hidden:true },
		{ name: 'REG_ID'   , width : 0  , align : 'center', hidden:true },
		{ name: 'REG_DTM'  , width : 0  , align : 'center', hidden:true },
		{ name: 'UPD_ID'   , width : 0  , align : 'center', hidden:true },
		{ name: 'UPD_DTM'  , width : 0  , align : 'center', hidden:true }
	];

	var gSetting = {
			height: 220,
			pgflg :true,
			exportflg  : false,       // 엑셀, pdf 출력 버튼 노출여부
			colsetting : false,      // 컬럼 설정 버튼 노출여부
			searchInit : false,      // 데이터 검색 버튼 노출여부
			resizeing  : true,
			rownumbers :false,
			shrinkToFit: true,
			autowidth  : true,
			queryPagingGrid:false    // 쿼리 페이징 처리 여부
		};
	btGrid.createGrid('grid_MemberUser', colName, colModel, gSetting);
}

/******************************************** 
 * @Subject : 조회 버튼 클릭
 * @Content : 조회 버튼 클릭
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
$(function() {
	$("#btn_searck").on("click",function() {
		UserInfoSearch();
	});
});

/******************************************** 
 * @Subject : 엔터 Event 함수
 * @Content : 조회 조건 입력 칸에서 엔터 클릭 시 Event
 * @See     : UserInfoSearch()
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
$("input").on("keyup",function(key){         
	if(key.keyCode==13) {             
		UserInfoSearch();   
	}     
});

/******************************************** 
 * @Subject : 조회 조건 입력 칸 내용 변경 Event
 * @Content : 조회 조건 입력 칸 내용이 변경될 경우 재조회하는 Event
 * @See     : UserInfoSearch()
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
$(function() {
	$("#MEMBER_SEARCH_TEXT").on("input",function(e) {
		UserInfoSearch();
	});
});

/******************************************** 
 * @Subject : 조건 조회 함수
 * @Content : 조건으로 조회 후 데이터 화면에 셋팅
 * @See     : setTelNoHypen()
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
function UserInfoSearch() {
	var formData = formIdAllToMap('frmSearch');
	var param    = {"param":formData};
	var url      = "/rrs/selectSearchUserInfo.do";
	
	fn_ajax(url, false, param, function(data, xhr) {
		var gridData     = data.result;
		$('#grid_MemberUser').jqGrid('clearGridData');
		$('#grid_MemberUser').jqGrid('setGridParam', {data:gridData});
		$('#grid_MemberUser').trigger('reloadGrid');
	});
	setTelNoHypen();
}

/******************************************** 
 * @Subject : 전화번호 하이픈 처리 함수
 * @Content : 전화번호 하이픈 처리
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
function setTelNoHypen() {
	var rowDataList = $("#grid_MemberUser").getRowData();
	for(var i=0; i<rowDataList.length; i++) {
		var convert_TEL_NO = rowDataList[i].TEL_NO.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
		$("#grid_MemberUser").jqGrid('setCell', i+1, 'TEL_NO', convert_TEL_NO);
	}
}

/******************************************** 
 * @Subject : 그리드 클릭 Evnet 함수
 * @Content : 팝업 close 후 ㅣ해당 그리드의 내용을 상위 팝업에 셋팅
 * @Since   : 2024.07.11
 * @Author  : 장소현
 ********************************************/
function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid_MemberUser").getRowData(rowid);
	p_rtnData = {
		"MEMBER_ID" : gridData["MEMBER_ID"],
		"HAN_NAME"  : gridData["HAN_NAME"],
		"ENG_NAME"  : gridData["ENG_NAME"],
		"TEL_NO"    : gridData["TEL_NO"],
		"EMAIL"     : gridData["EMAIL"],
		"REG_ID"    : gridData["REG_ID"],
		"REG_DTM"   : gridData["REG_DTM"],
		"UPD_ID"    : gridData["UPD_ID"],
		"UPD_DTM"   : gridData["UPD_DTM"],
	};
	popupClose($('#UserInfoSearchPopup').data('pid'));
}
</script>
