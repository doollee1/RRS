<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
/**
 * @Name : rrs/UserInfoPopup
 * @Description : 회원가입 팝업
 */
%>
<div id="p_UserInfo">
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<!---<caption></caption> --->
				<colgroup>
					<col width="100px" />
			        <col width="200px" />
			        <col width="100px" />
			        <col width="200px" />
			        <col width="100px" />
			        <col width="200px" />
			    </colgroup>
		   		<tr>
		   			<input type="hidden" name="isNew" id="isNew" value="Y" />
		   			<input type="hidden" name="PASSWD" id="PASSWD" />
					<th>회원타입</th>
					<td>
						<select id="MEM_GBN_POP" name="MEM_GBN_POP" class="cmc_combo" style="width:125px;">
							<c:forEach var="i" items="${mem_gbn}">
							    <option value="${i.CODE}"<c:if test="${i.CODE eq '02'}">selected</c:if>>${i.CODE_NM}</option>
						    </c:forEach>
						</select>
						<button type="button" class="btn btn-success" id="btn_userSearchPopup">멤버찾기</button>	
						<button type="button" class="btn btn-success" id="btn_userChgMemPopup">멤버변경</button>	
					</td>
					<th>이름</th>
					<td>
						<input type="text"  id="HAN_NAME_POP" name="HAN_NAME_POP" class="onlyKor" style="width:125px;" maxlength="20" />
					</td>
					<th>영문이름</th>
					<td>
						<input type="text"  id="ENG_NAME_POP" name="ENG_NAME_POP" class="onlyEng cmc_txt" style="width:125px;" maxlength="30" />
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="TEL_NO_POP" name="TEL_NO_POP" class="onlyNum cmc_txt" style="width:125px;" maxlength="13"/>
					</td>
					<th>회원 ID</th>
					<td>
						<input type="text" id="USER_ID_POP" name="USER_ID_POP" class="cmc_txt" style="width:125px;" maxlength="10" noSpecial />
						<button class='btn btn-default' id='btn_idCheck' type='button' onclick=''>중복확인</button>
					</td>
					<th>멤버 ID</th>
					<td>
						<input type="text" id="MEMBER_ID_POP" name="MEMBER_ID_POP" class="cmc_txt" style="width:125px;" maxlength="20" readonly/>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="text" id="EMAIL_POP" name="EMAIL_POP" class="cmc_txt" style="width:150px;" maxlength="50" EMAIL/>
					</td>
					<th>개인정보 동의</th>
					<td>
						<select id="PERINFO_AGREE_YN" name="PERINFO_AGREE_YN" class="cmc_combo" style="width:130px;">
							<option value="N" selected>N</option>
							<option value="Y">Y</option>
						</select>
					</td>
					<th>탈퇴여부</th>
					<td>
						<select id="RET_YN" name="RET_YN" class="cmc_combo" style="width:130px;">
							<c:forEach var="i" items="${ret_yn}">
							    <option value="${i.CODE}">${i.CODE_NM}</option>
						    </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>등록자 ID</th>
					<td>
						<input type="text" id="REG_ID" name="REG_ID" class="cmc_txt" style="width:125px;" readonly />
					</td>
					<th>등록일시</th>
					<td>
						<input type="text" id="REG_DTM" name="REG_DTM" class="cmc_txt" style="width:125px;" readonly />
					</td>
					<th></th>
				</tr>
				<tr>
					<th>수정자 ID</th>
					<td>
						<input type="text" id="UPD_ID" name="UPD_ID" class="cmc_txt" style="width:125px;" readonly />
					</td>
					<th>수정일시</th>
					<td>
						<input type="text" id="UPD_DTM" name="UPD_DTM" class="cmc_txt" style="width:125px;" readonly />
					</td>
					<th></th>
				</tr>
				<p id="mem_gbn_announce" style="color:red; margin-top:4px; font-weight: bold; height:11px"></p>
			</table>
			<input type="hidden" id="Ex_MEMBER_ID_POP" name="Ex_MEMBER_ID_POP" />
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
		const regExp =  /^[a-zA-Z]*$/; 
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

	/* 아이디가 변하면 중복체크 다시하도록 값 초기화 */
	$('#USER_ID_POP').on("change", function(){
		idChkYN = false;
	});
	
	/* 회원 타입 변경 이벤트 */
	$("#MEM_GBN_POP").on("change", function() {
		idChkYN = false;
		$("#USER_ID_POP" ).val("");
		$("#HAN_NAME_POP").val("");
		$("#ENG_NAME_POP").val("");
		$("#TEL_NO_POP"  ).val("");
		$("#EMAIL_POP"   ).val("");
		$("#PERINFO_AGREE_YN").val("N");
		$("#RET_YN"          ).val("N");
		if($("#MEM_GBN_POP").val() == '01') {
			$("#btn_userSearchPopup").show();
			$("#HAN_NAME_POP"       ).addClass("onlyKor");
			return;
		} else if($("#MEM_GBN_POP").val() == '02') {
			$("#btn_userSearchPopup").hide();
			$("#HAN_NAME_POP"       ).addClass("onlyKor");
		} else if($("#MEM_GBN_POP"  ).val() == '03' || $("#MEM_GBN_POP"  ).val() == '04' || $("#MEM_GBN_POP"  ).val() == '05') {
			$("#btn_userSearchPopup").hide();
			$("#HAN_NAME_POP"       ).removeClass("onlyKor");
		}
		$("#MEMBER_ID_POP").val("");
		$("#REG_ID"   ).val("");
		$("#REG_DTM"  ).val("");
		$("#UPD_ID"   ).val("");
		$("#UPD_DTM"  ).val("");
	});

	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트 
	 * @See     : saveUserInfo() / typeChage()
	 * @Since   : 2024.05.25
	 * @Author  : 장소현
	 ********************************************/
	$(function() {
		$('#p_UserInfo').dialog({
			title    :'회원가입',
			autoOpen : false,
			width    : 940,
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
				$("#mem_gbn_announce"   ).text("");
				$("#btn_userChgMemPopup").hide();
				if(!fn_empty($(this).data("USER_ID"))) {
					$(".ui-dialog-title").text("회원 정보 수정");
					/* 회원 수정 팝업인 경우 */
					selectUserInfo($(this).data("USER_ID"));     // USER_ID로 조회
					$("#USER_ID_POP").attr("readonly", true);    // USER_ID_POP readonly
					$("#btn_idCheck").hide();
					/* 회원 구분 disabled */
					$("#MEM_GBN_POP"        ).attr("disabled", true);
					$("#btn_userSearchPopup").attr("disabled", true);
					$("#btn_userSearchPopup").hide();
					/* 멤버 회원이면 이름, 영문이름, 전화번호 readonly */
					var MEM_GUBUN = $("#MEM_GBN_POP").val();
					if(MEM_GUBUN == "01") {
						$("#HAN_NAME_POP").attr("readonly", true);
						$("#ENG_NAME_POP").attr("readonly", true);
						$("#TEL_NO_POP"  ).attr("readonly", true);
						$("#EMAIL_POP"   ).attr("readonly", true);
						$("#mem_gbn_announce").text("※ 멤버의 이름, 전화번호, 이메일 변경은 멤버정보등록 팝업에서 가능합니다.");
					}
					/* 회원 타입 일반일 경우 멤버 변경 버튼 활성화 */
					if (MEM_GUBUN == "02") {
						$("#btn_userChgMemPopup").show();
					}
					
					typeChage();
					idChkYN = true;
					
					/* 신규 등록 or 수정 */
					$("#isNew").val("N");
				}else{
					$("#isNew").val("Y");
					$("#mem_gbn_announce").text("※ 회원 신규 생성 시 비밀번호 초기값 : [ fam1! ] 입니다.");
				}
				$("#btn_userSearchPopup").hide();
			}
		});
	});

	/******************************************** 
	 * @Subject : 조회 함수
	 * @Content : 데이터 조회 후 화면에 셋팅
	 * @Since   : 2024.05.25
	 * @Author  : 장소현
	 ********************************************/
	function selectUserInfo(userId){
		var param = {
			"param": {
				"USER_ID" : userId
			}
		};
		var url = "/rrs/selectUserInfo.do";
		
		fn_ajax(url, false, param, function(data, xhr){
			fn_dataBind('frmUserInfo', data.result[0]);
			$('#MEMBER_ID_POP'   ).val(data.result[0].MEMBER_ID);
			$('#EMAIL_POP'       ).val(data.result[0].EMAIL);
			$('#USER_ID_POP'     ).val(data.result[0].USER_ID);
			$('#HAN_NAME_POP'    ).val(data.result[0].HAN_NAME);
			$('#ENG_NAME_POP'    ).val(data.result[0].ENG_NAME);
			$('#TEL_NO_POP'      ).val(data.result[0].TEL_NO);
			$('#MEM_GBN_POP'     ).val(data.result[0].MEM_GBN);
			$('#Ex_MEMBER_ID_POP').val(data.result[0].MEMBER_ID);
		});
	}

	/******************************************** 
	 * @Subject : 저장 함수
	 * @Content : 입력 데이터 확인 후 저장
	 * @Since   : 2024.05.25
	 * @Author  : 장소현
	 ********************************************/
	function saveUserInfo(){
		var formData        = formIdAllToMap('frmUserInfo');
		formData.TEL_NO_POP = formData.TEL_NO_POP.replace(/-/g, '');
		/* validtaion check */
		if(formData.HAN_NAME_POP === "") {
			alert("이름을 입력해주세요.");
			return;
		}
		if(formData.ENG_NAME_POP === "") {
			alert("영문이름을 입력해주세요.");
			return;
		}
		if(formData.TEL_NO_POP === "") {
			alert("연락처를 입력해주세요.");
			return;
		}
		if(!idChkYN){
			alert("아이디 중복확인을 완료해주세요.");
			return;
		}
		if(!validChk_email(formData.EMAIL_POP)) {
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}
		
		var setData = {	  "USER_ID"          : formData.USER_ID_POP
						, "HAN_NAME"         : formData.HAN_NAME_POP
						, "ENG_NAME"         : formData.ENG_NAME_POP
						, "TEL_NO"           : formData.TEL_NO_POP
						, "EMAIL"            : formData.EMAIL_POP
						, "MEM_GBN"          : formData.MEM_GBN_POP
						, "MEMBER_ID"        : formData.MEMBER_ID_POP
						, "PERINFO_AGREE_YN" : formData.PERINFO_AGREE_YN
						, "RET_YN"           : formData.RET_YN
						, "REG_ID"           : formData.REG_ID
						, "REG_DTM"          : formData.REG_DTM
						, "UPD_ID"           : formData.UPD_ID
						, "UPD_DTM"          : formData.UPD_DTM
						, "isNew"            : formData.isNew
						, "PASSWD"           : formData.PASSWD
					  };
		
		var param = {"param" : setData};
		var url   = "/rrs/saveUserInfo.do";
		
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				/* 맴버 ID 중복 확인 */
				if((data.isExistMemberID == 'Y') && !(formData.MEMBER_ID_POP == formData.Ex_MEMBER_ID_POP)){
					alert("중복되는 멤버ID입니다."); 
				} else {
					alert("<s:message code='info.save'/>");
					p_rtnData = {   "USER_ID"    : $('#USER_ID_POP'  ).val()
								  , "MEM_GBN"    : $('#MEM_GBN_POP'  ).val()
								  , "REQ_HAN_NM" : $('#HAN_NAME_POP' ).val()
								  , "REQ_ENG_NM" : $('#ENG_NAME_POP' ).val()
								  , "REQ_TEL_NO" : $('#TEL_NO_POP'   ).val()
							};
					popupClose($('#p_UserInfo').data('pid'));
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
	 * @Subject : 멤버 찾기 버튼 함수
	 * @Content : 멤버 찾기 팝업 Open
	 * @See     : typeChage()
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	$('#btn_userSearchPopup').on('click', function(e) {
		var url   = "/rrs/UserInfoSearchPopup.do";
		var pid   = "UserInfoSearchPopup";
		var param = {};
		
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				$("#HAN_NAME_POP" ).val(data.HAN_NAME);
				$("#ENG_NAME_POP" ).val(data.ENG_NAME);
				$("#TEL_NO_POP"   ).val(data.TEL_NO);
				$("#USER_ID_POP"  ).val(data.MEMBER_ID);
				$("#MEMBER_ID_POP").val(data.MEMBER_ID);
				$("#EMAIL_POP"    ).val(data.EMAIL);
				$("#REG_ID"       ).val(data.REG_ID);
				$("#REG_DTM"      ).val(data.REG_DTM);
				$("#UPD_ID"       ).val(data.UPD_ID);
				$("#UPD_DTM"      ).val(data.UPD_DTM);
				
				typeChage();
				
				idChkYN   = false;
			}
		});
		p_rtnData = {};
	});
	
	/******************************************** 
	 * @Subject : 멤버 변경 버튼 함수
	 * @Content : 일반 회원 멤버로 변경하는 팝업 Open
	 * @See     : typeChage()
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	$('#btn_userChgMemPopup').on('click', function(e) {
		var url = "/rrs/MemberUserAddPopup.do";
		var pid = "p_MemberUserAdd";
		var param = { "HAN_NAME" : $("#HAN_NAME_POP").val()
					, "ENG_NAME" : $("#ENG_NAME_POP").val()
					, "TEL_NO"   : $("#TEL_NO_POP").val()
					, "EMAIL"    : $("#EMAIL_POP").val()
					, "MEM_FLAG" : "Y"
					, "USER_ID"  : $("#USER_ID_POP").val()
					};
		popupOpen(url, pid, param, function(data) {
			/* 저장했는지 체크 */
			if (data.CHG_YN == "Y") {
				selectUserInfo(data.USER_ID);    // 변경 내용으로 Search
				
				$("#HAN_NAME_POP").attr("readonly", true);
				$("#ENG_NAME_POP").attr("readonly", true);
				$("#TEL_NO_POP"  ).attr("readonly", true);
				$("#EMAIL_POP"   ).attr("readonly", true);
				$("#mem_gbn_announce"   ).text("※ 멤버의 이름, 전화번호, 이메일 변경은 멤버정보등록 팝업에서 가능합니다.");
				$("#btn_userChgMemPopup").hide();   // 멤버 변경 버튼 숨김
				typeChage();						// 타입변경
			}
		});
		p_rtnData = {};
	});

	/******************************************** 
	 * @Subject : 아이디 중복확인 버튼 함수
	 * @Content : 입력한 ID 글자수 확인 후 중복인지 확인
	 * @See     : idCheck()
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	$('#btn_idCheck').on('click', function(e) {
		var idCnt = $('#USER_ID_POP').val().length;    // 입력 ID 글자수
		if (idCnt == 0) {
			alert("회원 ID를 입력해주세요.");
		} else if (($('#MEM_GBN_POP').val() != "01") && (idCnt<6)) {
			alert("회원 ID 글자수를 확인해주세요.");
		} else {
			idCheck(idCnt);
		}
	});

	/******************************************** 
	 * @Subject : 아이디 중복확인
	 * @Content : 아이디 중복확인
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	function idCheck(idCnt) {
		var idCnt  = $('#USER_ID_POP').val().length;
		var url    = "/UserIdCheck.do";
		var param  = {
			"param": {"USER_ID" : $('#USER_ID_POP').val()}
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

	/******************************************** 
	 * @Subject : 회원 타입 변경 함수
	 * @Content : 연락처 하이픈 처리, 등록 일시, 업데이트 일시 타입 셋팅
	 * @Since   : 2024.07.11
	 * @Author  : 장소현
	 ********************************************/
	function typeChage() {
		var tel_no         = $("#TEL_NO_POP").val();
		var convert_tel_no = tel_no.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		$("#TEL_NO_POP").val(convert_tel_no);
		
		var reg_dtm = $("#REG_DTM").val();
		var upd_dtm = $("#UPD_DTM").val();
		$("#REG_DTM").val(new Date(Number(reg_dtm)).toLocaleDateString());    // 등록일시 readonly
		$("#UPD_DTM").val(new Date(Number(upd_dtm)).toLocaleDateString());    // 수정일시 readonly
	}
</script>