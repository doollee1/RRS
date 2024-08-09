<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/******************************************** 
 * @Subject : 에이전시 관리
 * @Content : 에이전시 컴퍼니 및 담당자 조회/수정/등록
 * @Since   : 2024.08.01
 * @Author  : A.J.S 
 ********************************************/
%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="Pr02" />
</c:import>


<style>
	.AgencyManagerBox input , .AgencyCompanyBox input {cursor:pointer !important}
</style>

<!-- dummy -->
<div class="top_button_h_margin"></div>
<div id="ctm_wrap" style="width:100%; ">
	<!--  사용자 로그인정보 설정 -->
	<input type="hidden" name="LOGIN_USER_ID" id="LOGIN_USER_ID" value="${loginVO.userId}" />
	<input type="hidden" name="AGENCY_YN" id="AGENCY_YN" value="${loginVO.name1st}" />
	<!--  에이전시 담당자 시작 -->
	<div class="AgencyManagerBox">
		<div class="ct_grid_top_left">
			<h4> 에이전시 담당자 관리</h4>
		</div>	
		
		<!--  에이전시 담당자  조회조건 시작 -->
		<div class="tab_top_search">
			<table style=width:100%;>
				<tbody>
					<tr>
						<td class="small_td"><p>에이전시 구분</p></td>
						<td>
							<select id="AGENCY_GBN2" name="AGENCY_GBN2" onchange="changeAgencyGbn()" class="cAgencyGbn" class="cmc_combo text-center" style="width:170px; margin: 0 5px">
								<option value="9">전체</option> 
								<c:forEach var="i" items="${agency_gbn}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
							</select>
						</td>
						<td class="small_td"><p style='width:80px;text-align:right'>담당자명</p></td>
						<td class="medium_td">
							<input type="text" id="AGENCY_USER" name="AGENCY_USER" class="cmc_txt" maxlength="20" noSpecial />
						</td>		
						
						<td class="small_td"><p style='width:80px;text-align:right'>담당자 ID</p></td>
						<td class="medium_td">
							<input type="text" id="AGENCY_ID" name="AGENCY_ID" class="cmc_txt" maxlength="20" noSpecial />
						</td>
						<td width="13%"></td> 		
						<td  align="right">
							<button type='button' class="cBtnclass cBtnSearch_style" id='btnSearch1'  style="align:right;" onclick="findAgencyUser()">조회</button>
							<button type='button' class="cBtnclass cBtnAdd_style" id='btnAdd1' style="align:right;" onclick="addAgencyUser()">추가</button>   
							<button type='button' class="cBtnclass cBtnEdit_style" id='btnModify1' style="align:right;" onclick="modifyAgencyUser()">수정</button>
							<button type='button' class="cBtnclass cBtnDel_style" id='btnDel1' style="align:right;" onclick="delAgencyUser()">삭제</button>           
						</td>			
					</tr>
				</tbody>
			</table>
		</div>	
		<!-- 에이전시 담당자 조회조건 끝 -->
		<!-- 에이전시 담당자 그리드 시작 -->
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
			<div class="ct_grid_top_wrap">			
				<div class="ct_grid_top_right">				
					<input type="hidden" name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
					<input type="hidden" name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
				</div>	
			</div>
			<table id="grid2"></table>
			<div id="grid2_pager"></div>
		</div>
		<!-- 그리드 끝 -->
	</div>
	
	<!-- 에이전시 컴퍼니 시작 -->	
	<div class="AgencyCompanyBox">
		<div class="ct_grid_top_left">
			<h4>에이전시 컴퍼니 관리</h4>
		</div>
		<!-- 에이전시 컴퍼니  조회조건 시작 -->	
		<div class="tab_top_search">						
			<table style=width:100%;>
				<tbody >
					<tr>
						<td class="small_td"><p>에이전시 구분</p></td>
						<td>
							<select id="AGENCY_GBN1" name="AGENCY_GBN1" onchange="findAgencyComp()" class="cAgencyGbn" class="cmc_combo text-center" style="width:170px; margin: 0 5px">
							  <option value="9">전체</option> 
								<c:forEach var="i" items="${agency_gbn}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
							</select>
						</td>
						<td width="50%"></td>  							
						<td  align="right">		
							<button type='button' class="cBtnclass cBtnSearch_style" id='btnSearch1'  style="align:right;" onclick="findAgencyComp()">조회</button>
							<button type='button' class="cBtnclass cBtnAdd_style" id='btnAdd1' style="align:right;" onclick="addAgencyComp()">추가</button>	
							<button type='button' class="cBtnclass cBtnDel_style" id='btnDel1' style="align:right;" onclick="delAgencyComp()">삭제</button>   		
						</td>		
					</tr>
				</tbody>
			</table>
		</div>	
		<!-- 에이전시 컴퍼니 조회조건 끝 -->
		
		<!-- 에이전시 컴퍼니 그리드 시작 -->
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_right">			
					<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
					<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
				</div>	
			</div>
			<table id="grid1"></table>
			<div id="grid1_pager"></div>
			<br/><br/>
		</div>
		<!-- 그리드 끝 -->	
	</div>
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
	var eng_pattern = /^[a-zA-Z\s]+$/;			// 영문 정규식
	var kor_pattern = /[ㄱ-ㅎㅏ-ㅣ가-힣]/gi;		// 한글 정규식
	var email_pattern = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	const tel_pattern = /^[0123456789-]*$/;
	
	$(function() {
		createAgencyCompGrid();        // 에이전시 컴퍼니 그리드 생성
		createAgencyUserGrid();        // 에이전시 담당자 그리드 생성
		findAgencyComp();              // 에이전시 컴퍼니 목록조회
		AgencyCompHide();              // 에이전시 컴퍼니 그리드 숨김처리 (에이전시 로그인시)
		findAgencyUser();              // 에이전시 담당자 목록조회
	
		/* 에이전시 담당자 그리드 onchange event */
		$("#grid2").bind("change", function() {
			$('#grid2_' + $('#grid2').jqGrid('getGridParam', 'selrow') + '_CHK').prop('checked', true);
		}); 
		
		/* 담당자명 항목에서 Enter키에 의한 조회 */
		$("#AGENCY_USER").on("keyup",function(key){
			if(key.keyCode==13) {
				findAgencyUser();
			}
		});
		
		/* 담당자ID 항목에서 Enter키에 의한 조회 */
		$("#AGENCY_ID").on("keyup",function(key){
			if(key.keyCode==13) {
				findAgencyUser();
			}
		});
		
	});
	
	/******************************************** 
	 * @Subject : 에이전시컴퍼니 그리드 생성 함수
	 * @Content : 그리드 생성
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	********************************************/
	function createAgencyCompGrid() {
		var colName = [
			'선택',
			'에이전시구분코드',
			'에이전시 구분',
			'에이전시컴퍼니코드',
			'컴퍼니',
			'등록일'	            
		];
		var colModel = [
			{name : 'CHK'            ,index : 'CHK',width : 50 ,align : 'center',formatter : gridCboxFormat, sortable: false},	        
			{name : 'AGENCY_GBN_CD'  , hidden:true },
			{name : 'AGENCY_GBN'     , width : 300, align : 'center' },
			{name : 'AGENCY_COMP_CD' , hidden:true },
			{name : 'AGENCY_COMP'    , width : 300, align : 'center' },	       
			{name : 'REG_DATE'       , width : 400, align : 'center' }	      
		];
		var gSetting = {
			pgflg          : true,
			exportflg      : false,    // 엑셀, pdf 출력 버튼 노출여부
			colsetting     : false,    // 컬럼 설정 버튼 노출여부
			searchInit     : false,    // 데이터 검색 버튼 노출여부
			resizeing      : true,
			rownumbers     : false,
			shrinkToFit    : true,
			autowidth      : true,
			queryPagingGrid: true ,     // 쿼리 페이징 처리 여부	          
			height         : 200
		};
		/* 그리드 생성 및 초기화 */
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}
 
	/******************************************** 
	 * @Subject : 에이전시 담당자  그리드 생성  함수
	 * @Content : 그리드 생성
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	********************************************/
	function createAgencyUserGrid() {
		var colName = [
			'선택',
			'에이전시 구분',
			'에이전시명',
			'담당자',
			'영문명',
			'담당자연락처',
			'담당자 ID',
			'Email'
			];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 50,align : 'center',formatter : gridCboxFormat, sortable: false},
			{name : 'AGENCY_GB_CD' , width : 100, align : 'center' , editable:true , edittype:"select", formatter : "select", editoptions:{value:'${agency_gbn_grid}'}},
			{name : 'AGENCY_NAME' , width : 100, align : 'center', editable:true },
			{name : 'HAN_NAME' , width : 100, align : 'center' , editable:true }, 
			{name : 'ENG_NAME' , width : 100, align : 'center' , editable:true },
			{name : 'TEL_NO' , width : 100, align : 'center' , editable:true}, 
			{name : 'USER_ID' , width : 100, align : 'center'},
			{name : 'EMAIL'  , width : 300, align : 'center', editable:true }
			];
		 
		var gSetting = {
				pgflg          : true,
				exportflg      : false, //엑셀, pdf 출력 버튼 노출여부
				colsetting     : false, // 컬럼 설정 버튼 노출여부
				searchInit     : false, // 데이터 검색 버튼 노출여부
				resizeing      : true,
				rownumbers     : false,
				shrinkToFit    : true,
				autowidth      : true,
				queryPagingGrid: true, // 쿼리 페이징 처리 여부
				height         : 200
		}
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('grid2', colName, colModel, gSetting);
		
	}
	
	
	/******************************************** 
	 * @Subject : 전화번호 하이픈 셋팅 함수
	 * @Content : 전화번호 하이픈 추가
	 * @Since   : 2024.05.22
	 * @Author  :
	 ********************************************/
	function setTelNoHypen() {
		var rowDataList = $("#grid2").getRowData();
		for(var i=0; i<rowDataList.length; i++) {
			/* 전화번호 하이픈 삭제 */
			var convert_TEL_NO = rowDataList[i].TEL_NO.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			$("#grid2").jqGrid('setCell', i+1, 'TEL_NO', convert_TEL_NO);
		}
	}

	/******************************************** 
	 * @Subject : 에이전시컴퍼니 [조회]버튼 클릭 함수
	 * @Content : 목록조회
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	 ********************************************/
	function findAgencyComp() {
		$.ajax({
			type:"post",
			url:"/rrs/selectAgencyComp.do",
			data:{"AGENCY_GBN_CD" : $("#AGENCY_GBN1").val() },
			dataType:"json"
		}).done(function(data){
			reloadGrid("grid1", data.result);
		});
	}
 
	/******************************************** 
	 * @Subject : 에이지전시 담당자  [조회]버튼 클릭 함수
	 * @Content : 목록조회
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	 ********************************************/
	function findAgencyUser() {
		$.ajax({
			type:"post",
			url:"/rrs/selectAgencyUser.do",
			data:{"AGENCY_GBN_CD" : $("#AGENCY_GBN2").val()
				 , "HAN_NAME" : $("#AGENCY_USER").val()
				 , "AGENCY_ID"  : $("#AGENCY_ID").val()
			},
			dataType:"json"
		
		}).done(function(data){
			 reloadGrid("grid2", data.result);
			 setTelNoHypen();
		});
	}

	/******************************************** 
	 * @Subject : 에이지전시 컴퍼니  [추가]버튼 클릭 함수
	 * @Content : 에이전시 등록화면 팝업  
	 * @Since   : 2024.08.01
	 * @Author  :
	 ********************************************/
	function addAgencyComp(param) {
		var url = "/rrs/AgencyCompAddPopup.do";
		var pid = "p_addAgencyComp";    //팝업 페이지의 취상위 div ID
		
		popupOpen(url, pid, param, function(data) {
			findAgencyComp();
		});
	}

	/******************************************** 
	 * @Subject : 에이지전시 컴퍼니  [삭제]버튼 클릭 함수
	 * @Content : 조회목록 중 선택행 삭제
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	********************************************/
	function delAgencyComp() {
		var ids = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid1');
		for(var i = 0; i < ids.length; i++){
			if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid1").getRowData(ids[i]));
			}
		}
		if(cnt < 1){
			alert('삭제할 컴퍼니를 선택하십시오.');
			return;
		}
		 
		if(confirm("삭제하시겠습니까?")){
			var url = "/rrs/deleteAgencyComp.do";
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				findAgencyComp();
			});
		}
	}

	/******************************************** 
	 * @Subject : 에이지전시 담당자  [추가]버튼 클릭 함수
	 * @Content : 에이전시 담당자 등록화면 팝업
	 * @Since   : 2024.08.01
	 * @Author  :
	********************************************/
	function addAgencyUser(param) {
		var url = "/rrs/AgencyUserInfoPopup.do";
		var pid = "p_AgencyUserInfoPopup";    //팝업 페이지의 취상위 div ID
	
		popupOpen(url, pid, param, function(data) {
			findAgencyUser();
		});
	
	}
	
	/******************************************** 
	 * @Subject : 에이지전시 담당자  [수정]버튼 클릭 함수
	 * @Content : 에이전시 담당자 목록중 변경내용 저장
	 * @Since   : 2024.08.01
	 * @Author  : A.J.S
	 ********************************************/
	function modifyAgencyUser() {
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				
				if( !isValidCells(ids[i]) ) {		/* 입력항목의 유효성 검사 */
					$('#grid2').jqGrid('setSelection',ids[i]);  /* 유효성실패행 선택 */
					return;
				} 
				cnt++;
				gridData.push($("#grid2").getRowData(ids[i]));	
			}
		}
		if(cnt < 1){
			alert('담당자 정보를 입력후 [수정]버튼을 클릭하십시오.');
			return;
		}
		
		if(confirm("수정하시겠습니까?")){
			var url = "/rrs/updateAgencyUser.do";
			var param = {"gridData" : gridData};
			
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'N'){
					alert("수정되지 않았습니다 . 관리자에게 문의해주세요.\n");
				}
				else{
					alert("수정하였습니다");
					findAgencyUser();
				}
			});
		}
	}
	/******************************************** 
	 * @Subject : 에이전시 담당자 입력정보의 유효성 검사 함수
	 * @Content : 필수입력 및 입력형식 검사
	 * @Since   : 2024.08.07
	 * @Author  : A.J.S
	 ********************************************/
	function isValidCells(id) {
		var isValid = true
		
		/* 전화번호 */  
		if($("#grid2").getCell( id, "TEL_NO") == ''){
			alert("전화번호를 입력하십시오.");
			isValid = false;
		}
		else if(!tel_pattern.test($("#grid2").getCell( id, "TEL_NO"))) {
			alert("전화번호는 숫자로 입력하십시오.");
			isValid = false;
		}
		
		/* 에이전시명 */
		if($("#grid2").getCell( id, "AGENCY_NAME") == '') {
			alert("에이전시명을 입력하십시오.");
			isValid = false;
		}
		
		/*  담당자명 (한글입력) */
		if($("#grid2").getCell( id, "HAN_NAME") == '') {
			alert("담당자명을 입력하십시오.");
			isValid = false;
		}
		else if(!kor_pattern.test($("#grid2").getCell( id, "HAN_NAME"))) {
			alert("담당자명은 한글로 입력하십시오.");
			isValid = false;
		}
		
		/* 영문명(영문입력) */
		if($("#grid2").getCell(id, "ENG_NAME") == '') {
			alert("담당자 영문명을 입력하십시오.");
			isValid = false;
		}
		else if(!eng_pattern.test($("#grid2").getCell( id, "ENG_NAME"))) {
			alert("담당자 영문명은 영문으로 입력하십시오.");
			isValid = false;
		}
		
		/*  이메일(주소형식) */
		if($("#grid2").getCell( id, "EMAIL") == '') {
			alert("이메일주소를 입력하십시오.");
			isValid = false;
		}
		else if(!email_pattern.test($("#grid2").getCell( id, "EMAIL"))) {
			alert("이메일주소 형식이 아닙니다.");
			isValid = false;
		}
		return isValid ;
	}
	
	/******************************************** 
	 * @Subject : 에이지전시 담당자  [삭제]버튼 클릭 함수
	 * @Content : 조회목록 중 선택행 삭제
	 * @Since   : 2024.08.01
	 * @Author  :
	 ********************************************/
	function delAgencyUser() {
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid2").getRowData(ids[i]));
			}
		}
		if(cnt < 1){
			alert('삭제할 담당자를 선택하십시오.');
			return;
		}
		
		if(confirm("삭제하시겠습니까?")){
			var url = "/rrs/deleteUserInfo.do";     // 회원 및 사용자정보 삭제
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				findAgencyUser()
			});
		}
	}

	/******************************************** 
	 * @Subject : 에이전시 ID로 접속 시 
	 * @Content : 에어전시 컴퍼니 관리 hide / 담당자 관리 조회조건 ID 셋팅
	 * @Since   : 2024.08.02
	 * @Author  : 장소현
	********************************************/
	function AgencyCompHide() {
		if ($("#AGENCY_YN").val() == "에이전시") {
			$(".AgencyCompanyBox").hide();
			$("#AGENCY_ID").val($("#LOGIN_USER_ID").val());
			$("#AGENCY_ID").attr("disabled",true);
		}
	}
	
	/********************************************
	 * @Subject : 에이전시구분 변경시 호출되는 함수
	 * @Content : 담당자명 및 ID 검색어 초기화후 재조회
	 * @Since   : 2024.08.08
	 * @Author  : A.J.S
	 ********************************************/
	function changeAgencyGbn(){
		$("#AGENCY_USER").val("");
		$("#AGENCY_ID").val("");
		findAgencyUser();
	}
</script>
<c:import url="../import/frameBottom.jsp" />