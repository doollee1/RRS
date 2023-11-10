<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : samplePopup
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="samplePopup" />
</c:import>

<div id="ctm_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<div id="ctm_sech_wrap" >
		<table>
		<tbody>
			<tr><td><h4>1. 공통코드</h4></td>
				<td class="small_td">HEAD_ID :
				<input type="text" name="S_HEAD_ID" id="S_HEAD_ID" value="MATL_GR" readonly=true>
				</td>
				<td class="small_td">CODE / NAME : </td>
				<td width="100"> <input type="text" id="S_COM_CODE" name="S_COM_CODE" />
				</td>
				<td class="small_td"><input type="button" id="btnPopup" name="btnPopup" value="팝업" />
				<td width="20"> <p name="S_COM_NAME" id="S_COM_NAME"></p>
				</tr>
			<tr>
			<td><h4>2. 부서 :  </h4></td>
			<td><input type="text" id="S_DEPT_CD" name="S_DEPT_CD" />
			<input type="button" id="btnPopup2" name="btnAjax" value="팝업" /></td>
			<td><p name="S_DEPT_NM" id="S_DEPT_NM"></p></td>
			</tr>
			<tr>
			<td><h4>3. 사용자 :  </h4></td>
			<td><input type="text" id="S_USER_ID" name="S_USER_ID" />
			<input type="button" id="btnPopup3" name="btnAjax" value="팝업" /></td>
			<td><p name="S_USER_NM" id="S_USER_NM"></p></td>
		</tr>
		</table>
		</tbody>
		</div>
	</form>
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
		initLayout();

		fn_codeval({type:'COMM',btn_id:'btnPopup',head_id:'MATL_GR',code:'S_COM_CODE', name:'S_COM_NAME'});

		fn_codeval({type:'DEPT',btn_id:'btnPopup2',code:'S_DEPT_CD', name:'S_DEPT_NM'});
		
		fn_codeval({type:'USER',btn_id:'btnPopup3',code:'S_USER_ID', name:'S_USER_NM'});

	});
	
</script>

<c:import url="../import/frameBottom.jsp" />