<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : rrs/UserInfoPopup
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
						<select id="MEM_GBN" name="MEM_GBN" class="cmc_combo" style="width:125px;">
							<c:forEach var="i" items="${mem_gbn}">
							    <option value="${i.CODE}">${i.CODE_NM}</option>
						    </c:forEach>
						</select>
						<button class='btn btn-default' id='btn_userSearchPopup' type='button' onclick=''>맴버찾기</button>
					</td>
					<th>이름</th>
					<td>
						<input type="text"  id="HAN_NAME" name="HAN_NAME" class="onlyKor" style="width:125px;" maxlength="20" />
					</td>
					<th>영문이름</th>
					<td>
						<input type="text"  id="ENG_NAME" name="ENG_NAME" class="onlyEng cmc_txt" style="width:125px;" maxlength="30" />
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="TEL_NO" name="TEL_NO" class="onlyNum cmc_txt" style="width:125px;" maxlength="13"/>
					</td>
					<th>회원 ID</th>
					<td>
						<input type="text" id="USER_ID" name="USER_ID" class="cmc_txt" style="width:125px;" maxlength="10" noSpecial />
						<button class='btn btn-default' id='btn_idCheck' type='button' onclick=''>중복확인</button>
					</td>
					<th>멤버 ID</th>
					<td>
						<input type="text" id="MEMBER_ID" name="MEMBER_ID" class="cmc_txt" style="width:125px;" maxlength="20" readonly/>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="text" id="EMAIL" name="EMAIL" class="cmc_txt" style="width:150px;" maxlength="50" EMAIL/>
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
				<p id="mem_gbn_announce" style="color:#ff7f00; margin-top:4px;"></p>
			</table>
			<input type="hidden" id="Ex_MEMBER_ID" name="Ex_MEMBER_ID" />
		</div>
	</form>	
</div>

<script type="text/javascript">
$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^a-zA-Z0-9]/gi,"") );});
$(document).on("keyup", "input[onlyNum]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
$(document).on("keyup", "input[onlyKor]", function() {$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g,"") );});
$(document).on("keyup", "input[onlyEng]", function() {$(this).val( $(this).val().replace(/[^A-Za-z]/ig,"") );});
$(document).on("keyup", 'input[EMAIL]', function() {$(this).val($(this).val().replace(/[^a-zA-Z0-9@._-]/g, ''));});
	
var idChkYN = false; //아이디 중복확인 여부

$(document).on("focusout", '[class^=onlyKor]', function() {
	const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/gi; 
	if($(this).val() != "" && !regExp.test($(this).val())){
    	alert("한글로 작성해주세요.");
    	$(this).val("");
    }
});

$(document).on("focusout", '[class^=onlyEng]', function() {
	const regExp =  /^[a-zA-Z]*$/; 
	if($(this).val() != "" && !regExp.test($(this).val())){
    	alert("영문으로 작성해주세요.");
    	$(this).val("");
    }
});

$(document).on("focusout", '[class^=onlyNum]', function() {
	const regExp = /^[0123456789-]*$/;
	if($(this).val() != "" && !regExp.test($(this).val())){
    	alert("숫자로 작성해주세요.");
    	$(this).val("");
    }else{
    	$(this).val($(this).val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3"));
    }
});

//아이디가 변하면 중복체크 다시하도록 값 초기화
$('#USER_ID').on("change", function(){
	idChkYN = false;
});

$(function() {
	$('#p_UserInfo').dialog({
		title :'회원 정보',
		autoOpen : false,
		//height: 400,
		width: 940,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					saveUserInfo();
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},

		},
		close : function() {
			popupClose($(this).data('pid')); /* 필수로 들어가야함 */
		},
		open : function() {
			if(!fn_empty($(this).data("USER_ID"))) {
				// 회원 수정 팝업인 경우
				selectUserInfo($(this).data("USER_ID"));	// USER_ID로 조회
				$("#USER_ID").attr("readonly", true);		// USER_ID readonly
				$("#btn_idCheck").hide();
				// 회원 구분 disabled
				$("#MEM_GBN").attr("disabled", true);
				$("#btn_userSearchPopup").hide();
				// 멤버 회원이면 이름, 영문이름, 전화번호 readonly
				var MEM_GUBUN = $("#MEM_GBN").val();
				if(MEM_GUBUN == "01") {
					$("#HAN_NAME").attr("readonly", true);
					$("#ENG_NAME").attr("readonly", true);
					$("#TEL_NO").attr("readonly", true);
					$("#EMAIL").attr("readonly", true);
					$("#mem_gbn_announce").text("※ 멤버의 이름, 전화번호, 이메일 변경은 멤버정보등록 팝업에서 가능합니다.");
				}
				
				typeChage();
				idChkYN = true;
				
				// 신규 등록 or 수정
				$("#isNew").val("N");
			}
		}
	});
});

function selectUserInfo(userId){
	var param = {
		"param": {
			"USER_ID" : userId
		}
	};
	var url = "/rrs/selectUserInfo.do";
	
	fn_ajax(url, false, param, function(data, xhr){
		fn_dataBind('frmUserInfo', data.result[0]);
	});
	
	$('#Ex_MEMBER_ID').val($(this).data('MEMBER_ID'));
}

function saveUserInfo(){
	var formData = formIdAllToMap('frmUserInfo');
	formData.TEL_NO = formData.TEL_NO.replace(/-/g, '');
	
	
	//alert(formData.MEM_GBN);
	// validtaion check
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
	
	
	
	var param = {"param" : formData};
	var url = "/rrs/saveUserInfo.do";
	
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if((data.isExistMemberID == 'Y') && !(formData.MEMBER_ID == formData.Ex_MEMBER_ID)){
				alert("중복되는 맴버ID입니다."); 
			} else {
				alert("<s:message code='info.save'/>");
				popupClose($('#p_UserInfo').data('pid'));
			}
		});
	}
}

function autoHyphen(target) {
	target.value = target.value
		.replace(/[^0-9]/g, '')
	  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	return target;
}

function validChk_email(val){
	var pattern = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return (val != '' && val != 'undefined' && pattern.test(val));
}


// 회원 타입 변경 이벤트
$(function() {
	$("#MEM_GBN").on("change",function() {
		idChkYN = false;
		$("#HAN_NAME").val("");
		
		if($("#MEM_GBN").val() == '01') {
			$("#btn_userSearchPopup").show();
			$("#HAN_NAME").addClass("onlyKor");
			return;
		} else if($("#MEM_GBN").val() == '02') {
			$("#HAN_NAME").addClass("onlyKor");
		} else if($("#MEM_GBN").val() == '04') {
			$("#HAN_NAME").removeClass("onlyKor");
		}
		
		$("#btn_userSearchPopup").hide();
		$("#MEMBER_ID").val("");
		$("#REG_ID"   ).val("");
		$("#REG_DTM"  ).val("");
		$("#UPD_ID"   ).val("");
		$("#UPD_DTM"  ).val("");
		
	});
});

// 맴버 찾기 클릭 
$('#btn_userSearchPopup').on('click', function(e) {
	var url = "/rrs/UserInfoSearchPopup.do";
	var pid = "UserInfoSearchPopup";
	var param = {};
	
	popupOpen(url, pid, param, function(data) {
		if(!fn_empty(data)){
			$("#HAN_NAME").val(data.HAN_NAME);
			$("#ENG_NAME").val(data.ENG_NAME);
			$("#TEL_NO").val(data.TEL_NO);
			$("#USER_ID").val(data.MEMBER_ID);
			$("#MEMBER_ID").val(data.MEMBER_ID);
			$("#EMAIL").val(data.EMAIL);
			$("#REG_ID").val(data.REG_ID);
			$("#REG_DTM").val(data.REG_DTM);
			$("#UPD_ID").val(data.UPD_ID);
			$("#UPD_DTM").val(data.UPD_DTM);
			
			typeChage();
		}
	});
});

//아이디 중복체크
$('#btn_idCheck').on('click', function(e) {
	var idCnt = $('#USER_ID').val().length;
	if (idCnt == 0) {
		alert("회원 ID를 입력해주세요.");
	} else if (($('#MEM_GBN').val() != "01") && (idCnt<6)) {
		alert("회원 ID 글자수를 확인해주세요.");
	} else {
		idCheck(idCnt);
	}
	
});

function idCheck(idCnt) {
	var idCnt = $('#USER_ID').val().length;
	var url   = "/UserIdCheck.do";
	var param = {
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


function typeChage() {
	// 연락처 하이픈 처리
	var tel_no = $("#TEL_NO").val();
	var convert_tel_no = tel_no.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	$("#TEL_NO").val(convert_tel_no);
	
	var reg_dtm = $("#REG_DTM").val();
	var upd_dtm = $("#UPD_DTM").val();
	$("#REG_DTM").val(new Date(Number(reg_dtm)).toLocaleDateString());	// 등록일시 readonly
	$("#UPD_DTM").val(new Date(Number(upd_dtm)).toLocaleDateString());	// 수정일시 readonly
}
</script>