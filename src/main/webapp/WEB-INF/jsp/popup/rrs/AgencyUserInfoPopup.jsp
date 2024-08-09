<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
/**
 * @Name : rrs/AgencyUserInfoPopup
 * @Description : 에이전시 담당자 
 */
%>

<div id="p_AgencyUserInfoPopup">
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<!---<caption></caption> --->
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="100px" />
					<col width="200px" />
				</colgroup>
				<tr>
					<input type="hidden" name="PASSWD" id="PASSWD" />
					<th>에이전시 구분</th>
					<td>
						<select id="AGENCY_GB" name="AGENCY_GB" class="cmc_combo" style="width:125px;">
							<c:forEach var="i" items="${agency_gbn}">
								<option value="${i.CODE}"<c:if test="${i.CODE eq '02'}">selected</c:if>>${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="hidden" name="MEM_GBN" id="MEM_GBN" />
					</td>
					<th>에이전시명</th>
					<td>
						<input type="text"  id="AGENCY_NAME" name="AGENCY_NAME" style="width:125px;" maxlength="20" />
					</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>
						<input type="text" id="HAN_NAME" name="HAN_NAME" class="cmc_txt" style="width:125px;" maxlength="13"/>
					</td>
					<th>영문명</th>
					<td>
						<input type="text" id="ENG_NAME" name="ENG_NAME" class="onlyEng cmc_txt" style="width:125px;" maxlength="10" />
					</td>
				</tr>
				<tr>
					<th>담당자 연락처</th>
					<td>
						<input type="text" id="TEL_NO" name="TEL_NO" class="onlyNum cmc_txt" style="width:150px;" maxlength="50" />
					</td>
					<th>담당자 ID</th>
					<td>
						<input type="text" id="USER_ID" name="USER_ID" class="cmc_txt" style="width:125px;" maxlength="50" />
						<button class='btn btn-default' id='btn_idCheck' type='button' onclick=''>중복확인</button>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="text" id="EMAIL" name="EMAIL" class="cmc_txt" style="width:125px;" maxlength="50" EMAIL/>
					</td>
					<th>탈퇴여부</th>
					<td>
						<select id="RET_YN" name="RET_YN" class="cmc_combo" style="width:130px;">
							<option value="N" selected>N</option>
							<option value="Y">Y</option>
						</select>
					</td>
				</tr>
				<p id="mem_gbn_announce" style="color:red; margin-top:4px; font-weight: bold; height:11px"></p>
			</table>
		</div>
	</form>
</div>

<script type="text/javascript">
	/* 정규식 체크 */
	$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^a-zA-Z0-9]/gi,"") );});
	$(document).on("keyup", 'input[EMAIL]',     function() {$(this).val($(this).val().replace(/[^a-zA-Z0-9@._-]/g, ''));});

	var idChkYN = false;    // 아이디 중복확인 여부

	/* 이름 정규식 체크 */
	$(document).on("focusout", '[class^=onlyKor]', function() {
		const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/gi;
		if($(this).val() != "" && !regExp.test($(this).val())){
			alert("한글로 작성해주세요.");
			$(this).val("");
		}
	});

	/* 영문이름 정규식 체크 */
	$(document).on("focusout", '[class^=onlyEng]', function() {
		const regExp =  /^[a-zA-Z\s]+$/;
		if($(this).val() != "" && !regExp.test($(this).val())){
			alert("영문으로 작성해주세요.");
			$(this).val("");
		}
	});

	/* 전화번호 정규식 체크*/
	$(document).on("focusout", '[class^=onlyNum]', function() {
		const regExp = /^[0123456789-]*$/;
		if($(this).val() != "" && !regExp.test($(this).val())){
			alert("숫자로 작성해주세요.");
			$(this).val("");
		}else{
			$(this).val($(this).val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3"));
		}
	});

	/* 아이디 정규식 체크*/
	$(document).on("focusout", '[class^=IDEA]', function() {
		const regExp =  /^[a-zA-Z0-9]+$/;
		if($(this).val() != "" && !regExp.test($(this).val())){
			alert("숫자로 작성해주세요.");
			$(this).val("");
		}
	});
	
	/* 아이디가 변하면 중복체크 다시하도록 값 초기화 */
	$('#USER_ID').on("change", function(){
		idChkYN = false;
	});

	/********************************************
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : saveUserInfo() / typeChage()
	 * @Since   : 2024.05.25
	 * @Author  : 이주형
	 ********************************************/
	$(function() {
		$('#p_AgencyUserInfoPopup').dialog({
			title    :'에이전시 담당자 등록',
			autoOpen : false,
			width    : 650,
			modal    : true,
			buttons : {
				/* 저장 버튼 */
				'<s:message code='system.save'/>' : {
					text: '<s:message code='system.save'/>',
					id  : 'save',
					click: function() {
						saveUserInfo();
					}
				},
				'<s:message code='button.close'/>' : {
					text : '<s:message code='button.close'/>',
					click: function() {
						$(this).dialog("close");
					}
				},
			},
			/* 닫기 버튼 */
			close : function() {
				p_rtnData = [];
				/* 필수로 들어가야함 */
				popupClose($(this).data('pid'));
			},
			open : function() {
				$("#mem_gbn_announce").text("※ 담당자 신규 생성 시 비밀번호 초기값 : [ fam1! ] 입니다.");
			}
		});
	});

	/********************************************
	 * @Subject : 저장 함수
	 * @Content : 입력 데이터 확인 후 저장
	 * @Since   : 2024.05.25
	 * @Author  : 이주형
	 ********************************************/
	function saveUserInfo(){
		var formData        = formIdAllToMap('frmUserInfo');
		formData.TEL_NO = formData.TEL_NO.replace(/-/g, '');
		/* validtaion check */
		if(formData.HAN_NAME === "") {
			alert("이름을 입력해주세요.");
			return;
		}
		if(formData.ENG_NAME === "") {
			alert("영문이름을 입력해주세요.");
			return;
		}
		if(formData.TEL_NO === "") {
			alert("연락처를 입력해주세요.");
			return;
		}
		if(!idChkYN){
			alert("아이디 중복확인을 완료해주세요.");
			return;
		}
		if(!validChk_email(formData.EMAIL)) {
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}
		
		/* 에이전시 구분에 따른 MEM_GBN 값 설정 */
		/* 03 총판 / 04 일반 / 05 자체 */
		if(formData.AGENCY_GB === '1'){
			formData.MEM_GBN = '03';
		}
		else if(formData.AGENCY_GB === '2'){
			formData.MEM_GBN = '04';
		}
		else if(formData.AGENCY_GB === '3'){
			formData.MEM_GBN = '05';
		}
		
		var setData = {   "USER_ID"          : formData.USER_ID
						, "HAN_NAME"         : formData.HAN_NAME
						, "ENG_NAME"         : formData.ENG_NAME
						, "TEL_NO"           : formData.TEL_NO
						, "EMAIL"            : formData.EMAIL
						, "AGENCY_GB"        : formData.AGENCY_GB
						, "AGENCY_NAME"      : formData.AGENCY_NAME
						, "MEM_GBN"          : formData.MEM_GBN
						, "MEMBER_ID"        : ''
						, "PERINFO_AGREE_YN" : 'N'
						, "PASSWD"           : formData.PASSWD
					  };

		var param = {"param" : setData};
		var url   = "/rrs/addAgencyUser.do";

		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if((data.result == 'isExistUser')){
					alert("이미 등록된 담당자입니다.");
				} else {
					alert("<s:message code='info.save'/>");
					popupClose($('#p_AgencyUserInfoPopup').data('pid'));
				}
			});
		}
	}

	/********************************************
	 * @Subject : 전화번호 하이픈
	 * @Content : 전화번호 하이픈
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function autoHyphen(target) {
		target.value = target.value
			.replace(/[^0-9]/g, '')
			.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		return target;
	}

	/********************************************
	 * @Subject : 이메일 양식 체크
	 * @Content : 이메일 양식 체크
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function validChk_email(val){
		var pattern = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (val != '' && val != 'undefined' && pattern.test(val));
	}

	/********************************************
	 * @Subject : 아이디 중복확인 버튼 함수
	 * @Content : 입력한 ID 글자수 확인 후 중복인지 확인
	 * @See     : idCheck()
	 * @Since   : 2024.07.11
	 * @Author  : 이주형
	 ********************************************/
	$('#btn_idCheck').on('click', function(e) {
		var idCnt = $('#USER_ID').val().length;    // 입력 ID 글자수
		if (idCnt == 0) {
			alert("담당자 ID를 입력해주세요.");
		} else if (idCnt < 5) {
			alert("담당자 ID 글자수를 확인해주세요.");
		} else {
			idCheck(idCnt);
		}
	});

	/********************************************
	 * @Subject : 아이디 중복확인
	 * @Content : 아이디 중복확인
	 * @Since   : 2024.07.11
	 * @Author  : 이주형
	 ********************************************/
	function idCheck(idCnt) {
		var idCnt  = $('#USER_ID').val().length;
		var url    = "/UserIdCheck.do";
		var param  = {
			"param": {"USER_ID" : $('#USER_ID').val()}
		}

		fn_ajax(url, false, param, function(data, xhr){
			if(data.isExistUser == 'Y'){
				alert("회원가입이 가능한 ID입니다.");
				idChkYN = true;
			} else {
				alert("기존에 등록된 아이디 입니다.");
			}
		});
	}
</script>