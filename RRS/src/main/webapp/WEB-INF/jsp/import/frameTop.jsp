<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * 화면 상단 부분
 */
%>
<!DOCTYPE html>
<html lang="en-US" class="mainbody webkit chrome win js">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono" rel="stylesheet">
	<head>	
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
		<title>Resort Reservation System - RRS</title>
		<!---------- 공통 CSS/JS Import ---------->
		<c:import url="/import/import.do" />
		<script type="text/javascript">
			var auth;
			var policy;
			$(function(){
				var url = "/common/selectButtonList.do";
				
				var param = {'param' : {'PROG_CD':'${param.progcd}'}};
				
				fn_ajax(url, false, param, function(data, xhr){
					auth = data.result;
					policy = data.policy;
					var mymenu = data.mymenu;
					var lang = data.LANG;
					var btnAppend = "";
					if(auth.substr(0, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnSearch_style' id='cBtnSearch' type='button' onclick='cSearch();'>Search</button>";	
					}
					if(auth.substr(1, 1) == "Y"){
						btnAppend += "<button class='cBtnclass  cBtnAdd_style' id='cBtnAdd' type='button' onclick='cAdd();'>Add</button>";
					}
					if(auth.substr(2, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnDel_style' id='cBtnDel' type='button' onclick='cDel();'>Delete</button>";
					}
					if(auth.substr(3, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnSave_style' id='cBtnSave' type='button' onclick='cSave();'>Save</button>";
					}
					if(auth.substr(4, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnPrint_style' id='cBtnPrint' type='button' onclick='cPrint();'>Print</button>";
					}
					if(auth.substr(5, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnUpload_style' id='cBtnUpload' type='button' onclick='cUpload();'>Upload</button>";
					}
					if(auth.substr(6, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnExcel_style' id='cBtnExcel' type='button' onclick='cExcel();'>Excel Download</button>";
					}
					if(auth.substr(7, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnPdf_style' id='cBtnPdf' type='button' onclick='cPdf();'>Pdf Download</button>";
					}
					if(auth.substr(8, 1) == "Y"){
						btnAppend += "<button class='cBtnclass cBtnCancel_style' id='cBtnCancel' type='button' onclick='cCancel();'>Cancel</button>";
					}
					if(auth.substr(9, 1) == "Y"){
						btnAppend += "<button class='cBtnclass' id='cBtnUser1' type='button' onclick='cUser1();'>User</button>";
					}
					if(auth.substr(10, 1) == "Y"){
						btnAppend += "<button class='cBtnclass' id='cBtnUser2' type='button' onclick='cUser2();'>User</button>";
					}
					if(auth.substr(11, 1) == "Y"){
						btnAppend += "<button class='cBtnclass' id='cBtnUser3' type='button' onclick='cUser3();'>User</button>";
					}
					if(auth.substr(12, 1) == "Y"){
						btnAppend += "<button class='cBtnclass' id='cBtnUser4' type='button' onclick='cUser4();'>User</button>";	
					}
					if(auth.substr(13, 1) == "Y"){
						btnAppend += "<button class='cBtnclass' id='cBtnUser5' type='button' onclick='cUser5();'>User</button>";
					}		
					if(('${param.progcd}' != "") && auth.substr(14, 1) < 2){
						
						if(mymenu){
							if(lang=='DE'){
								btnAppend += "<button id='cBtnUser6' type='button' onclick='cBtnUser6(true);'><img id= 'bookmark' src='/images/bookmark_de_03.png'/></button>";
							}else{
								btnAppend += "<button id='cBtnUser6' type='button' onclick='cBtnUser6();'><img id= 'bookmark' src='/images/bookmark_03.png'/></button>";
							}
						}else{
							if(lang=='DE'){
								btnAppend += "<button id='cBtnUser6' type='button' onclick='cBtnUser6(true);'><img id= 'bookmark' src='/images/bookmark_de_01.png'/></button>";
							}else{
								btnAppend += "<button id='cBtnUser6' type='button' onclick='cBtnUser6();'><img id= 'bookmark' src='/images/bookmark_01.png'/></button>";
							}
						}
					}
					$("#divBtn").append(btnAppend);
				});				
			});
			
			function cBtnUser6(lang){

				if(lang){
					$('#bookmark').attr('src','/images/bookmark_de_03.png');
				}else{
					$('#bookmark').attr('src','/images/bookmark_03.png');					
				}

				var url = '/system/saveMyMenuData.do';
				var param = {'PROG_CD':'${param.progcd}'};

				fn_ajax(url, false, param, function(data, xhr){ 
					if(data.dup == 'Y'){
						alert('<s:message code="info.dupbook"/>');
					}else{
						alert('<s:message code="info.savebook"/>');
						if (confirm("<s:message code='info.refresh'/>")){
							top.document.location.reload();
						}
					}
				});
			}
			
			window.cExcel = function() {
				var elm = document.querySelector('.ui-pg-button.ui-corner-all[title="Save Excel"]');
				if (!!elm) {
					var event = document.createEvent("Event");
					event.initEvent("click", false, true);
					elm.dispatchEvent(event);
				}
			}
			
			window.cPdf = function() {
				var elm = document.querySelector('.ui-pg-button.ui-corner-all[title="Save PDF"]');
				if (!!elm) {
					var event = document.createEvent("Event");
					event.initEvent("click", false, true);
					elm.dispatchEvent(event);
				}
			}
		</script>
	</head>
	<body  class="mainbody" >
		<!-------- 공통버튼 --------->
		<div id="ct_wrap" >
		 <div style="width:100%;">
			<div id="divBtns">
				 <div id="divWindowpath">
					<span id="title1"></span><span id="title2"></span><span id="title3"></span>
				</div>
				 
				<div id="divBtn">				
				</div>
			</div>
		</div>
		
		<!-------- 화면 영역 --------->
		