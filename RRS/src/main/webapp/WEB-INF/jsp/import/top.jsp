<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
	

<div class="top_line_g">&nbsp;</div>
<div id="top_wrap">
	<div id="toplogo">
		
	</div>
	<div id="topmenu">
		<ul id="ulMenu"></ul>
	</div>
	<div>
	<div class="display_message">
		<s:message code="style.display_message"/>
	</div>
	<div id="toplogininfo">			
<%-- 		<select id="LANGUAGE" name="LANGUAGE" class="cmc_combo"> --%>
<%-- 		</select> --%>
		<input type="hidden" id="LANGUAGE" name="LANGUAGE"/>
		<input type="hidden" id="G_COMP_CD" name="G_COMP_CD" value="${loginVO.compCd }" />
		
		<!-- <img src="/images/icon_userinfo.png" width="16" alt="" /> --><span>Welcome! ${loginVO.nameFull}</span> | 
		<!-- - Company : <span id="G_COMP_NM"></span> | --> 
		
		<a href='#' onclick="setting();"><i class="fa fa-edit"></i>Change</a> | 
		<a href='#' onclick="edituser();"><i class="fa fa-cog"></i>Setting</a> | 
		<a href='#' onclick="logout();"><i class="fa fa-sign-out"></i>Log off</a>
	</div>
</div>	
</div>
<div class="cls"></div>
<script type="text/javascript">
	$(function(){
		var url = "/common/selectSystemMenuList.do";
		
		fn_ajax(url, false, null, function(data, xhr){
			var result = data.result;
			var cnt = 0;
			var li = "";
			for(var i = 0; i < result.length; i++){
				li += "<li onclick='javascript:selectLeftMenu(\"" + (cnt + 1) + "\")'>" + result[cnt]["PROG_NM"] + "</i>";
				cnt++;
			}
			$("#ulMenu").append(li);
		});

// 		$("#LANGUAGE").change(function(e){
// 			var url = "/main/changeLocale.do";
			
// 			var sendData = {"param" : {"lang" : $("#LANGUAGE").val()}};
			
// 			var expdate = new Date();
// 		    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
// 			setCookie("Language", $("#LANGUAGE").val(), expdate);
		    
// 			fn_ajax(url, false, sendData, function(data, xhr){
// 				location.reload();
// 			});
			
// 		});
		
		//동적 select box 생성 function
// 		createCodeBox('LANGUAGE', false);
		
		$("#LANGUAGE").val(getCookie("Language"));
	});
	
	var setting = function(){
		var url = "/common/PwChangePopup.do";
		var pid = "p_PwChange";  //팝업 페이지의 최상위 div ID
		var param= {"INIT" : "N",
					"COMP_CD" : '${loginVO.compCd}',
					"USER_ID" : '${loginVO.userId}',
					"USER_NM" : '${loginVO.nameFull}'};
		
		popupOpen(url, pid,param);
	}
	
	var edituser = function(){
		var param = {
			"COMP_CD" : '${loginVO.compCd}',
			"USER_ID" : '${loginVO.userId}'
		};
		
		var url = "/common/UserInfoPopup.do";
		var pid = "p_UserInfo";  //팝업 페이지의 최상위 div ID

		popupOpen(url, pid, param);
	}
	
	var logout = function(){
		if(confirm("Are you sure you want to Log off?")){
			location.href = "/login/logout.do";
		}
	}
</script>


<script>
(function(window) {
'use strict';

	window.report = function() {
		open('../html/report/quotation.jsp');
	}
	
	window.printReport = function() {
		var report = open('../html/report/quotation.jsp');
		report.print();
	}
	
})(window.top);

</script>