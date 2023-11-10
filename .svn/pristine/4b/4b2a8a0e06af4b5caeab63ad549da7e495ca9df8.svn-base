<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : CommonCodeManager
	 * @Description : 공통코드 관리 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="CommonCodeManager" />
</c:import>

<div id="ctu_wrap">
	<div id="ctu_no_resize">
	<!-- 검색조건 영역 시작 -->
		<form id="frmSearch" action="#">
			<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
			<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			<div id="ctm_sech_wrap" >
				<ul class="sech_ul">
					<li class="sech_list">
						<div>코드</div>
						<input type="text" id="S_HEAD_CD" name="S_HEAD_CD" class="cmc_txt" />
					</li>
					<li class="sech_list">
						<div>코드명</div>
						<input type="text" id="S_HEAD_NM" name="S_HEAD_NM" class="cmc_txt" />
					</li>
				</ul>
			</div>
		</form>
	</div>
	<!-- 검색조건 영역 끝 -->
	
	




	<!--  tab start -->
	<div id="tabs">
		<ul>
			<li><a href="#general_tab">General data</a></li>
			<li><a href="#company_tab">Company data</a></li>
			<li><a href="#sales_tab">Sales Area data</a></li>
			<li><a href="#partner_tab">Partner data</a></li>
		</ul>
		<div id="general_tab">
			<div>
				<span>Customer</span>
				<select>
					<option>11111111</option>
					<option>22222222</option>
					<option>33333333</option>
				</select>
			</div>
			<div>
				<div style="border-bottom: 2px solid black"><span>address</span></div>
				<div>
					<span>* Street/House Number</span>
						<input type="text" id="UstId_1" name="UstId_1" value="DE284757331"/>
						<input type="text" id="UstId_2" name="UstId_2" value="NL001798650B01"/>
					<span>* Street/House Number</span><input type=text></input><input type=text></input>
				</div>
			</div>
		</div>
		<div id="company_tab">
		</div>
		<div id="sales_tab">
		</div>
		<div id="partner_tab">
		</div>
	</div>
	<!--  tab end -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">공통코드 마스터</div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:8px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">공통코드 디테일</div>
			<div class="ct_grid_top_right">
				<input type="button" id="btnAdd" value="추가"/>
				<input type="button" id="btnDel" value="삭제"/>
				<input type="hidden"  name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
				<input type="hidden"  name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
			</div>
		</div>
		<table id="grid2"></table>
		<div id="grid2_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script type="text/javascript">
<%-- 
  * ========= 공통버튼 클릭함수 =========
  * 검색 : cSearch()
  * 추가 : cAdd()
  * 삭제 : cDel()
  * 저장 : cSave()
  * 인쇄 : cPrint()
  * 업로드 : cUpload()
  * 엑셀다운 : cExcel()
  * PDF다운 : cPdf()
  * 취소 : cCancel()
  * 사용자버튼 : cUser1() ~ cUser5()
  * -------------------------------
  * 버튼 순서 : setCommBtnSeq(['ret','list']) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * 버튼 표시/숨김 : setCommBtn('ret', true) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * ===============================
--%>
	//초기 로드
	$(function() {
		setCommBtn("User1", true, "독일");
		initLayout();
		createGrid1();
		createGrid2();
		
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});
		
		$("#btnAdd").click(function(){
			addCommonCodeDetail();
		});
		
		$("#btnDel").click(function(){
			delCommonCodeDetail();
		});
	});


	function cUser1(){
		
		var UstId_1 = $("#UstId_1").val(); 
		var UstId_2 = $("#UstId_2").val();
		
		var params = {
				'UstId_1' : UstId_1,
				'UstId_2' : UstId_2,
				'Firmenname' : '',
				'Ort' : '',
				'PLZ' : '',
				'Strasse' : '',
				'Druck' : ''
			};
		
		$.ajax({
			url :"https://evatr.bff-online.de/evatrRPC",
			data : params,
			type :'GET',
			dataType :'xml',
			async:false,
			success: function(data){
				alert('Test Success');
			},
			error: function( jqXHR, textStatus, errorThrown ) {
				console.log( textStatus + ", " + errorThrown + ", " +jqXHR );
				alert( textStatus + ", " + errorThrown );
			}
		}); 
	}
	
	function createGrid1(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid1\')" /> ',
						'헤더코드','헤더명','관계코드1','관계코드2','관계코드3','관계코드4','관계코드5',
						'관계수치1','관계수치2','관계수치3','관계수치4','관계수치5','비고','상태'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat},
			{ name: 'HEAD_CD', width: 80, align: 'center' },
			{ name: 'HEAD_NM', width: 120, align: 'left', editable:true },
			{ name: 'REF_CHR1', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR2', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR3', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR4', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR5', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM1', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM2', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM3', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM4', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM5', width: 100, align: 'left', editable:true },
			{ name: 'REMARKS', width: 180, editable:true },
			{ name: 'STATUS', width: 70, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${status}'}}
	  	];
		
		var gSetting = {
		        pgflg:true,
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}
	
	function createGrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
						'헤더코드','상세코드','실사용코드','코드명','관계코드1','관계코드2','관계코드3','관계코드4','관계코드5',
						'관계수치1','관계수치2','관계수치3','관계수치4','관계수치5','정렬순서','상태'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat},
			{ name: 'HEAD_CD', width: 100, align: 'center' },
			{ name: 'CODE', width: 120, align: 'left', editable:true },
			{ name: 'READ_CD', width: 120, align: 'left', editable:true },
			{ name: 'CODE_NM', width: 120, align: 'left', editable:true },
			{ name: 'REF_CHR1', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR2', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR3', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR4', width: 100, align: 'left', editable:true },
			{ name: 'REF_CHR5', width: 100, align: 'left', editable:true },
			{ name: 'REF_NUM1', width: 100, align: 'right', editable:true,formatter: 'integer' },
			{ name: 'REF_NUM2', width: 100, align: 'right', editable:true,formatter: 'integer' },
			{ name: 'REF_NUM3', width: 100, align: 'right', editable:true,formatter: 'integer' },
			{ name: 'REF_NUM4', width: 100, align: 'right', editable:true,formatter: 'integer' },
			{ name: 'REF_NUM5', width: 100, align: 'right', editable:true,formatter: 'integer'},
			{ name: 'PRIORITY', width: 90, align: 'right', editable:true,formatter: 'integer' },
			{ name: 'STATUS', width: 70, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${status}'}}
	  	];
		
		var gSetting = {
		        pgflg:true,
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		
		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}
	
	function cAdd(){
		btGrid.gridAddRow("grid1", "last");
	}
	
	function cSearch(currentPage){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE').val())) {
			vCurrentPage = $('#CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('grid1_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/common/selectCommonCodeMasterInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
			clearGrid("grid2");
			if(data.result.length > 0){
				$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
			}
		});
	}
	
	function cSave(){
		btGrid.gridSaveRow('grid1');
		btGrid.gridSaveRow('grid2');
		var selr = $('#grid1').jqGrid('getGridParam', 'selrow');
		var gridData1 = $("#grid1").getRowData(selr);
		
		if(fn_empty(gridData1["HEAD_NM"])){
			alert("헤더이름을 입력하세요.");
			return;
		}
		
		var gridData2 = $('#grid2').getRowData();

		if(confirm("저장하시겠습니까?")){
			var formData = formIdAllToMap('frmSearch');
			
			var url = '/common/saveCommonCodeMasterInfo.do';
			var param = {"master" : gridData1,"detail" : gridData2};
			fn_ajax(url, false, param, function(data, xhr){
				alert("저장하였습니다.");
				cSearch();
			});
		}
	}
	
	function cDel(){
		var ids = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid1');
		for(var i = 0; i < ids.length; i++){
			if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
				var data = $("#grid1").getRowData(ids[i]);
				if(fn_empty(data["HEAD_CD"])){
					btGrid.gridDelRow("grid1", ids[i]);
				}else{
					cnt++;
					gridData.push($("#grid1").getRowData(ids[i]));
				}
			}
		}
		
		if(cnt < 1){
			alert("삭제할 공통코드를 선택하십시오.");
			return;
		}

		if(confirm("삭제하시겠습니까?")){
			var url = '/common/deleteCommonCodeMasterInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				cSearch();
			});
		}
	}
	
	function grid1_onCilckRow(e, rowid, status){
		commonDetailSearch(null, rowid);
	}
	
	function commonDetailSearch(currentPage, rowid){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE2').val())) {
			vCurrentPage = $('#CURRENT_PAGE2').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('grid2_pager');
		$('#CURRENT_PAGE2').val(vCurrentPage);
		$('#ROWS_PER_PAGE2').val(vRowsPerPage);
		
		if(fn_empty(rowid)){
			rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		}

		var rowData = $("#grid1").getRowData(rowid);
		var url = "/common/selectCommonCodeDetailInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["HEAD_CD"] = rowData["HEAD_CD"];
		formData["CURRENT_PAGE"] = $('#CURRENT_PAGE2').val();
		formData["ROWS_PER_PAGE"] = $('#ROWS_PER_PAGE2').val();
		
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'commonDetailSearch', data.result);
		});
	}
	
	function addCommonCodeDetail(){
		btGrid.gridSaveRow('grid1');
		var rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowid);
		$('#grid2').jqGrid('setSelection', rowid);
		var data = {"HEAD_CD" : rowData["HEAD_CD"]};
		btGrid.gridAddRow("grid2", "last", data);
	}
	
	function delCommonCodeDetail(){
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				var data = $("#grid2").getRowData(ids[i]);
				if(fn_empty(data["HEAD_CD"])){
					btGrid.gridDelRow("grid2", ids[i]);
				}else{
					cnt++;
					gridData.push($("#grid2").getRowData(ids[i]));
				}
			}
		}
		
		if(cnt < 1){
			alert("삭제할 공통코드를 선택하십시오.");
			return;
		}

		if(confirm("삭제하시겠습니까?")){
			var url = '/common/deleteCommonCodeDetailInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				cSearch();
			});
		}
	}
	
	/* 그리드 헤더 체크박스 선택 */
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;

		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}

	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {
		
	}
</script>

<c:import url="../import/frameBottom.jsp" />