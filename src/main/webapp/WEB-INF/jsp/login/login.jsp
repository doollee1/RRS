<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>Resort Reservation System - RRS</title>
<link href="<c:url value='/css/jquery/jquery-ui.css' />" rel="stylesheet">
<link href="/css/jquery/jquery.datetimepicker.css" rel="stylesheet" />
<link href="<c:url value='/css/login.css' />" rel="stylesheet">
<script src="<c:url value='/js/jquery/jquery-1.11.3.min.js' />" type="text/javascript"></script>
<script src="<c:url value='/js/jquery/jquery-ui.min.js' />" type="text/javascript"></script>
<script src="/js/jquery/jquery.datetimepicker.full.min.js"></script>
<script src="<c:url value='/js/common.js' />" type="text/javascript"></script>


<!-- 순서에 유의 -->
<script type="text/javascript" src="/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/js/rsa/rng.js"></script>

<script type="text/javascript">
$(function() {
	getid();
	getLanguage();
	$("#USER_ID").focus();
	
	$("#btnLogin").click(function(){
		login();
		//test();
	});
	
	$("#Language").change(function(){
		changeLanguage();
	});
	changeLanguage();
});

function test() {
	saveid();
	location.href = '/home/home.do';
}

function login() {
	if(!$("#USER_ID").val()){
		alert('Input ID');
		$("#USER_ID").focus();
		return;
	}
	if(!$("#PASSWORD").val()){
		alert('Input Password');
		$("#PASSWORD").focus();
		return;
	}
	
	//아이디,비번 쿠키저장
	saveid();
	
	var v_searchFormInfo = formIdToMap('loginForm');
	
	var url = '/login/actionLogin.do';
	var sendData = {'searchData':v_searchFormInfo};

	var rsa = new RSAKey();
    rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());

	sendData["searchData"]["PASSWORD"] = rsa.encrypt($("#PASSWORD").val());
	fn_ajax(url, false, sendData, function(data, xhr) {
		if(data.success) {
    		localStorage.clear();
    		
    		/*
    		if(data.INIT){
    			chk_initialpw();
    			return;
    		}
    		*/
    		
			/* 그리드 정보 로컬스토리지에 담기  */
			var list = data.resultGridInfoAll;
			var key, old_key;
			var arr = [];
			
			for (var i=0; i<list.length; i++) {
				key = list[i].WINDOWNAME + list[i].GRIDID;
				
				if (i == 0) {
					old_key = key;
				}
				
				if (key != old_key) {
					localStorage.setItem(old_key, JSON.stringify(arr));
					arr = [];
				}
				
				arr.push(list[i]);
				old_key = list[i].WINDOWNAME + list[i].GRIDID;
			}
			
			localStorage.setItem(key, JSON.stringify(arr));
			
    		if(!data.OVERLAP) {
    			saveid();
    			location.href = '/home/home.do';
    			return;
    		} else {
    			if(confirm('User is already logged on. Want to log on?')) { //현재 로그인되어 있는 사용자 입니다. 로그인하시겠습니까?
    				saveid();
    				location.href = '/home/home.do';
    			}
    		}
    	} else {
    		alert(data.message);
    	}
	});
}

function setCookie(name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

// 아이디 쿠기 저장
function saveid() {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨

    if($("#checkIdPw").is(":checked")) {
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    }
    else {
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    }
    setCookie("saveid", $("#USER_ID").val(), expdate);
//     setCookie("savepw", $("#PASSWORD").val(), expdate);
}

// 쿠키에 저장된 아이디 가져오기
function getid() {
	$("#USER_ID").val(getCookie("saveid"));
// 	$("#PASSWORD").val(getCookie("savepw"));
	
	$("input:checkbox[id='checkIdPw']").prop("checked", ($("#USER_ID").val() != ""));
}

//로그인페이지 이동
function goLogin() {
	location.href = '/';
}

//언어 쿠키 저장
function saveLanguage() {
	var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    
    setCookie("Language", $("#Language").val(), expdate);
}

// 쿠키에 저장된 언어 가져오기
function getLanguage() {
	if (getCookie("Language") != null && getCookie("Language") != "") {
		$("#Language").val(getCookie("Language"));
	} else {
		$("#Language").val("KO");
	}
}

// 언어 변경 이벤트
function changeLanguage() {
	saveLanguage();
}

function chk_initialpw(){
	
	var url ="";
	var pid ="";
	var param = "";

	url = "/common/selectUserInfo.do";
	param = {"param":  {"S_USER_ID" : $("#USER_ID").val()}};
	
	fn_ajax(url, false, param, function(data, xhr){
		if(!fn_empty(data)){
			url = "/common/PwInitChangePopup.do";
			pid = "p_PwChange";  //팝업 페이지의 취상위 div ID
			param= {"INIT" : "Y",
					"COMP_CD" : data.result[0].COMP_CD,
					"USER_ID" : $("#USER_ID").val(),
					"USER_NM" : data.result[0].NAME_FULL};
			
			popupOpen(url, pid, param);
		}
	});
	

}
</script>
</head>
<body>
<div id="login_wrap">
	<div class="top_line_g">&nbsp;</div>

	<!-- <div id="login_top_wrap" style="width:100%; height:60px;">
     <div class="toplogo">
          <img src="/images/logo_alex.png" width="140" alt="" onclick="goLogin()" style="cursor:pointer;" />
        </div>   
	</div>
	 -->
    
	<div id="login_content_wrap">	
        <div id="login_content">
			
    
                   <form id="loginForm" name="loginForm" action="<c:url value='/home/home.do'/>" method="post">              
                           <table>                      
                                <tr>
                                    <td align="center"><input type="text" id="USER_ID" name="USER_ID" class="idpwInput" style="width:340px;" placeholder="ID" tabindex="1" onKeyPress="if(event.keyCode == 13) javascript:document.loginForm.passwd.focus();" onBlur="document.loginForm.USER_ID.value = document.loginForm.USER_ID.value.trim();" />
                                    </td>
                                </tr>                                
                                <tr>
                                    <td align="center"><input type="password" id="PASSWORD" name="PASSWORD" class="idpwInput" style="width:340px;" placeholder="Password" tabindex="2" onKeyPress="if(event.keyCode == 13) javascript:login();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
	                                    <input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
	        							<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
	        							<input type="hidden" id="Language" name="Language" value="KO"/>
                                    </td> 
                                </tr>
                                 <tr>
                                    <td>
	                                    <input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
	        							<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
                                    	<select id="Language" name="Language">
                                    		<option value="KO">KOREAN</option>
                                    		<option value="EN">ENGLISH</option>
										</select>
                                    </td> 
                                </tr>
                                <tr>
                                    <td style="height:24px;vertical-align:top;">
                                        <label for="checkIdPw"><input type="checkbox" name="checkIdPw" id="checkIdPw" onclick="javascript:saveid(document.loginForm);" /> Save ID</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="button" id="btnLogin" class="btn_login" value="Login" tabindex="3" />
                                    </td>
                                </tr>
                            </table>                            
                   </form>
		</div>
	</div>
</div>
</body>
</html>
