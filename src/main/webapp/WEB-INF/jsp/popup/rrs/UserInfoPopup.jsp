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
	$('#USER_ID_POP').on("change", function(){
		idChkYN = false;
	});
	
	// 회원 타입 변경 이벤트
	$("#MEM_GBN_POP").on("change", function() {
		idChkYN = false;
		$("#USER_ID_POP").val("");
		$("#HAN_NAME_POP").val("");
		$("#ENG_NAME_POP").val("");
		$("#TEL_NO_POP").val("");
		$("#EMAIL").val("");
		$("#PERINFO_AGREE_YN").val("N");
		$("#RET_YN").val("N");
		if($("#MEM_GBN_POP").val() == '01') {
			$("#btn_userSearchPopup").show();
			$("#HAN_NAME_POP").addClass("onlyKor");
			return;
		} else if($("#MEM_GBN_POP").val() == '02') {
			$("#btn_userSearchPopup").hide();
			$("#HAN_NAME_POP").addClass("onlyKor");
		} else if($("#MEM_GBN_POP").val() == '04') {
			$("#btn_userSearchPopup").hide();
			$("#HAN_NAME_POP").removeClass("onlyKor");
		}
		$("#MEMBER_ID").val("");
		$("#REG_ID"   ).val("");
		$("#REG_DTM"  ).val("");
		$("#UPD_ID"   ).val("");
		$("#UPD_DTM"  ).val("");
	});

	$(function() {
		$('#p_UserInfo').dialog({
			title :'회원가입',
			autoOpen : false,
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
				p_rtnData = [];
				popupClose($(this).data('pid')); /* 필수로 들어가야함 */
			},
			open : function() {
				if(!fn_empty($(this).data("USER_ID"))) {
					$(".ui-dialog-title").text("회원정보수정");
					// 회원 수정 팝업인 경우
					selectUserInfo($(this).data("USER_ID"));	// USER_ID로 조회
					$("#USER_ID_POP").attr("readonly", true);		// USER_ID_POP readonly
					$("#btn_idCheck").hide();
					// 회원 구분 disabled
					$("#MEM_GBN_POP").attr("disabled", true);
					$("#btn_userSearchPopup").attr("disabled", true);
					$("#btn_userSearchPopup").hide();
					// 멤버 회원이면 이름, 영문이름, 전화번호 readonly
					var MEM_GUBUN = $("#MEM_GBN_POP").val();
					if(MEM_GUBUN == "01") {
						$("#HAN_NAME_POP").attr("readonly", true);
						$("#ENG_NAME_POP").attr("readonly", true);
						$("#TEL_NO_POP").attr("readonly", true);
						$("#EMAIL").attr("readonly", true);
						$("#mem_gbn_announce").text("※ 멤버의 이름, 전화번호, 이메일 변경은 멤버정보등록 팝업에서 가능합니다.");
					}
					
					typeChage();
					idChkYN = true;
					
					// 신규 등록 or 수정
					$("#isNew").val("N");
				}
				$("#btn_userSearchPopup").hide();
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
			$('#USER_ID_POP' ).val(data.result[0].USER_ID);
			$('#HAN_NAME_POP').val(data.result[0].HAN_NAME);
			$('#ENG_NAME_POP').val(data.result[0].ENG_NAME);
			$('#TEL_NO_POP'  ).val(data.result[0].TEL_NO);
			$('#MEM_GBN_POP' ).val(data.result[0].MEM_GBN);
		});
		
		$('#Ex_MEMBER_ID').val($(this).data('USER_ID'));
	}

	function saveUserInfo(){
		var formData = formIdAllToMap('frmUserInfo');
		formData.TEL_NO_POP = formData.TEL_NO_POP.replace(/-/g, '');
		// validtaion check
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
		if(!validChk_email(formData.EMAIL)) {
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}
		
		var setData = {	  "USER_ID"  		 : formData.USER_ID_POP
						, "HAN_NAME" 		 : formData.HAN_NAME_POP
						, "ENG_NAME" 		 : formData.ENG_NAME_POP
						, "TEL_NO"  		 : formData.TEL_NO_POP
						, "EMAIL" 			 : formData.EMAIL
						, "MEM_GBN"			 : formData.MEM_GBN_POP
						, "MEMBER_ID" 		 : formData.MEMBER_ID
						, "PERINFO_AGREE_YN" : formData.PERINFO_AGREE_YN
						, "RET_YN" 			 : formData.RET_YN
						, "REG_ID" 			 : formData.REG_ID
						, "REG_DTM" 		 : formData.REG_DTM
						, "UPD_ID" 			 : formData.UPD_ID
						, "UPD_DTM" 		 : formData.UPD_DTM
						, "isNew" 			 : formData.isNew
						, "PASSWD" 			 : formData.PASSWD
					  };
		
		var param = {"param" : setData};
		var url = "/rrs/saveUserInfo.do";
		
		if(confirm("<s:message code='confirm.save'/>")){
				fn_ajax(url, false, param, function(data, xhr){
					if((data.isExistMemberID == 'Y') && !(formData.MEMBER_ID == formData.Ex_MEMBER_ID)){
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

	// 멤버 찾기 클릭 
	$('#btn_userSearchPopup').on('click', function(e) {
		var url = "/rrs/UserInfoSearchPopup.do";
		var pid = "UserInfoSearchPopup";
		var param = {};
		
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				$("#HAN_NAME_POP").val(data.HAN_NAME);
				$("#ENG_NAME_POP").val(data.ENG_NAME);
				$("#TEL_NO_POP").val(data.TEL_NO);
				$("#USER_ID_POP").val(data.MEMBER_ID);
				$("#MEMBER_ID").val(data.MEMBER_ID);
				$("#EMAIL").val(data.EMAIL);
				$("#REG_ID").val(data.REG_ID);
				$("#REG_DTM").val(data.REG_DTM);
				$("#UPD_ID").val(data.UPD_ID);
				$("#UPD_DTM").val(data.UPD_DTM);
				
				typeChage();
				
				idChkYN   = false;
			}
		});
	});

	//아이디 중복체크
	$('#btn_idCheck').on('click', function(e) {
		var idCnt = $('#USER_ID_POP').val().length;
		if (idCnt == 0) {
			alert("회원 ID를 입력해주세요.");
		} else if (($('#MEM_GBN_POP').val() != "01") && (idCnt<6)) {
			alert("회원 ID 글자수를 확인해주세요.");
		} else {
			idCheck(idCnt);
		}
		
	});

	function idCheck(idCnt) {
		var idCnt = $('#USER_ID_POP').val().length;
		var url   = "/UserIdCheck.do";
		var param = {
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


	function typeChage() {
		// 연락처 하이픈 처리
		var tel_no = $("#TEL_NO_POP").val();
		var convert_tel_no = tel_no.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		$("#TEL_NO_POP").val(convert_tel_no);
		
		var reg_dtm = $("#REG_DTM").val();
		var upd_dtm = $("#UPD_DTM").val();
		$("#REG_DTM").val(new Date(Number(reg_dtm)).toLocaleDateString());	// 등록일시 readonly
		$("#UPD_DTM").val(new Date(Number(upd_dtm)).toLocaleDateString());	// 수정일시 readonly
	}
</script>