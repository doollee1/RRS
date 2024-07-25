<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MemberUserAddPopup
 * @Description : 멤버 회원 정보 등록 팝업
 */
%>
<div id="MemberUserAddPopup">
	<div class="ctm_sech_wrap">	
		<form id="frmMemberUserInfo" method="post" action="#">
			<table class="tab_top_search" width="100%">
				<tbody>
					<tr>
						<td class="small_td">멤버ID</td>
						<td><p><input type="text" id="MEMBER_ID" name="MEMBER_ID" maxlength="5" noSpecial></p></td>
					</tr>
					<tr>
						<td class="small_td">이름</td>
						<td><p><input type="text" id="HAN_NAME" class="onlyKor" name="HAN_NAME" maxlength="20"></p></td>
					</tr>
					<tr>
						<td class="small_td">영문이름</td>
						<td><p><input type="text" id="ENG_NAME" class="onlyEng" name="ENG_NAME" maxlength="30"></p></td>
					</tr>
					<tr>
						<td class="small_td">전화번호</td>
						<td><p><input type="text" id="TEL_NO" class="onlyNum" name="TEL_NO " maxlength="13"></p></td>
					</tr>
					<tr>
						<td class="small_td">Email</td>
						<td><p><input type="text" id="EMAIL" name="EMAIL" maxlength="50" EMAIL></p></td>
					</tr>
					
					<tr>
						<td class="small_td">배우자한글이름</td>
						<td><p><input type="text" id="PARTNER_HAN_NAME" class="onlyKor" name="PARTNER_HAN_NAME" maxlength="20"></p></td>
					</tr>
					<tr>
						<td class="small_td">배우자영문이름</td>
						<td><p><input type="text" id="PARTNER_ENG_NAME" class="onlyEng" name="PARTNER_ENG_NAME" maxlength="30"></p></td>
					</tr>
					<tr>
						<td class="small_td">배우자성별</td>
						<td>
							<select id="PARTNER_GENDER" name="PARTNER_GENDER" class="cmc_combo" style="width:165px;">
								<option value="">선택</option>
								<c:forEach var="i" items="${partner_gender}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="small_td">배우자전화번호</td>
						<td><p><input type="text" id="PARTNER_TEL_NO" class="onlyNum" name="PARTNER_TEL_NO" maxlength="13"></p></td>
					</tr>
					<tr>
						<td class="small_td">탈퇴여부</td>
						<td>
							<select id="RET_YN" name="RET_YN" class="cmc_combo" style="width:165px;">
								<c:forEach var="i" items="${ret_yn}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="Ex_MEMBER_ID"   name="Ex_MEMBER_ID" />
			<input type="hidden" id="Ex_HAN_NAME"    name="Ex_HAN_NAME" />
			<input type="hidden" id="Ex_ENG_NAME"    name="Ex_ENG_NAME" />
			<input type="hidden" id="Ex_TEL_NO"      name="Ex_TEL_NO" />
			<input type="hidden" id="Ex_USER_ID_POP" name="Ex_USER_ID_POP" />
			<input type="hidden" id="MEM_FLAG"       name="MEM_FLAG" />
		</form>
	</div>
</div>
<script type="text/javascript">
/* 정규식 */
$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^a-zA-Z0-9]/gi,"") );});
$(document).on("keyup", "input[onlyKor]",   function() {$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g,"") );});
$(document).on("keyup", "input[onlyEng]",   function() {$(this).val( $(this).val().replace(/[^A-Za-z]/ig,"") );});
$(document).on("keyup", 'input[EMAIL]',     function() {$(this).val($(this).val().replace(/[^a-zA-Z0-9@._-]/g, ''));});

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

/* 전화번호 정규식 체크 */
$(document).on("focusout", '[class^=onlyNum]', function() {
	const regExp = /^[0123456789-]*$/;
	if($(this).val() != "" && !regExp.test($(this).val())){
		alert("숫자로 작성해주세요.");
		$(this).val("");
	}else{
		$(this).val($(this).val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3"));
	}
});

$(function() {
	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : saveMemberUserInfo()
	 * @Since   : 2024.05.23
	 * @Author  : 장소현
	 ********************************************/
	$('#MemberUserAddPopup').dialog({
		title:'멤버 회원 정보',
		autoOpen: false,
		height: 350,
		width: 450,
		modal: true,
		buttons: {
			'save': {
				text: '저장',
				click: function() {
					saveMemberUserInfo();
				}
			},
			/* 닫기 버튼 */
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function() {
			$('#MEMBER_ID').val($(this).data('MEMBER_ID'));
			$('#HAN_NAME' ).val($(this).data('HAN_NAME'));
			$('#ENG_NAME' ).val($(this).data('ENG_NAME'));
			$('#TEL_NO'   ).val($(this).data('TEL_NO'));
			$('#EMAIL'    ).val($(this).data('EMAIL'));
			$('#PARTNER_HAN_NAME').val($(this).data('PARTNER_HAN_NAME'));
			$('#PARTNER_ENG_NAME').val($(this).data('PARTNER_ENG_NAME'));
			$('#PARTNER_GENDER'  ).val($(this).data('PARTNER_GENDER'));
			$('#PARTNER_TEL_NO'  ).val($(this).data('PARTNER_TEL_NO'));
			$('#RET_YN'        ).val($(this).data('RET_YN'));
			$('#Ex_MEMBER_ID'  ).val($(this).data('MEMBER_ID'));
			$('#Ex_HAN_NAME'   ).val($(this).data('HAN_NAME'));
			$('#Ex_ENG_NAME'   ).val($(this).data('ENG_NAME'));
			$('#Ex_TEL_NO'     ).val($(this).data('TEL_NO'));
			$('#MEM_FLAG'      ).val($(this).data('MEM_FLAG'));
			$('#Ex_USER_ID_POP').val($(this).data('USER_ID'));
			
			var gender   = $(this).data('PARTNER_GENDER');
			var url      = '/rrs/selectMemCodeInfo.do';
			var sendData = {'param' : {"HEAD_CD": 500250}};
			
			fn_ajax(url, false, sendData, function(data, xhr) {
				var codeInfo = data.result;
				$.each(codeInfo, function(index, item){
					var codeNm = item.CODE_NM;
					
					if (item.CODE_NM === gender) {
						$('#PARTNER_GENDER').val(item.CODE).prop("selected",true);
					}
				});
				
			});

			// 연락처 하이픈 처리
			/*var tel_no = $("#TEL_NO").val();
			var convert_tel_no = tel_no.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
			$("#TEL_NO").val(convert_tel_no);
			
			var p_tel_no = $("#PARTNER_TEL_NO").val();
			var convert_p_tel_no = p_tel_no.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
			
		
			$("#PARTNER_TEL_NO").val(convert_p_tel_no);*/
		},
		close: function() {
			popupClose($(this).data('pid'));
		}
	});
});

/******************************************** 
 * @Subject : 저장 버튼 클릭 함수
 * @Content : 입력 내용 체크 , 중복 체크 후 저장
 * @Since   : 2024.05.23
 * @Author  : 장소현
 ********************************************/
function saveMemberUserInfo(){
	var formData = formIdAllToMap('frmMemberUserInfo');
	
	/* validation check */
	if($('#MEMBER_ID').val() === "") {
		alert("멤버ID를 입력해주세요.");
		return;
	}
	if(!(/^[a-zA-Z]+[0-9]{4}$/).test($('#MEMBER_ID').val())) {
		alert("멤버번호는 알파벳 1자리+숫자 4자리로 입력해주세요.");
		return;
	}
	if($('#HAN_NAME').val() === "") {
		alert("이름을 입력해주세요.");
		return;
	}
	if($('#ENG_NAME').val() === "") {
		alert("영문이름을 입력해주세요.");
		return;
	}
	if($('#TEL_NO').val() === "") {
		alert("전화번호를 입력해주세요.");
		return;
	}
	if($('#RET_YN').val() == "") {
		alert("탈퇴여부를 선택해주세요.");
		return;
	}
	
	/* delete hypen */
	formData.TEL_NO         = $('#TEL_NO').val().replace(/-/g, '');
	formData.Ex_TEL_NO      = $('#Ex_TEL_NO').val().replace(/-/g, '');
	formData.PARTNER_TEL_NO = $('#PARTNER_TEL_NO').val().replace(/-/g, '');

	var param = {"param" : formData};
	var url   = "/rrs/saveMemberUserInfo.do"

	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			/* 중복 체크 */
			if(data.isExistMember == 'Y'){
				alert("이미 등록된 멤버회원이 존재합니다."); 
			} else if((data.isExistMemberID == 'Y')){
				alert("중복되는 멤버ID입니다."); 
			} else {
				alert("<s:message code='info.save'/>");
				if($('#MEM_FLAG').val() == 'Y') {
					p_rtnData = { "USER_ID" : $('#MEMBER_ID').val()
								, "CHG_YN"  : "Y"
								}
				}
				popupClose($('#MemberUserAddPopup').data('pid'));			
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
		.replace(/[^0-9]/gi,"").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g,"");
	return target
}

</script>
