<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : FormSample
	 * @Description : 일반 컨트롤 샘플 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="FormSample" />
</c:import>

<div id="ctm_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="sech_list">
					<select id="S_STATUS" name="S_STATUS" class="cmc_combo">
						<option value="" selected="selected">==전체==</option>								
						<c:forEach var="i" items="${useyn}">
							<option value="${i.code}">${i.value}</option>
						</c:forEach>
					</select>
					<label style="float:right;">공통코드에서 데이터 가져와 selectbox 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtDate" name="txtDate" data-type="date" placeholder="__/__/____" />
					<label style="float:right;">날짜 선택 datepick 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtDateTime" name="txtDateTime" data-type="datetime" placeholder="__/__/____ __:__:__" />
					<label style="float:right;">날짜시간 선택 datepick 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtYearMonth" name="txtYearMonth" data-type="yyyymm" placeholder="__/____" />
					<label style="float:right;">년도 월 선택 datepick 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtTime" name="txtTime" data-type="time" placeholder="__:__:__"/>
					<label style="float:right;">시간 선택 datepick 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtNumber" name="txtNumber" data-type="number" />
					<label style="float:right;">숫자 입력 자동 , 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtDecimal1" name="txtDecimal1" data-type="decimal1" />
					<label style="float:right;">숫자 입력 자동, . 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="text" id="txtDecimal1" name="txtDecimal1" data-type="multi" title="aaa" />
					<label style="float:right;">툴팁 생성</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="button" id="btnDisabled" name="btnDisabled" value="비활성화" />
					<label style="float:right;">폼 전체 비활성화</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="button" id="btnFormData" name="btnFormData" value="데이터 읽어오기" />
					<label style="float:right;">폼 전체 데이터 읽어오기</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="button" id="btnAjax" name="btnAjax" value="Ajax" />
					<label style="float:right;">AJAX</label>
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<input type="button" id="btnEmail" name="btnEmail" value="Email" />
					<label style="float:right;">Email</label>
				</li>
			</ul>
		</div>

		<div id="ctm_sech_wrap" >
			<table>
				<tbody>
					<tr>
						<td class="small_td">External : </td>
						<td><input type="button" id="btnEx4" name="btnEx4" value="External" /></td>
					</tr>
				</tbody>
			</table>
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
		
		$('#txtDate').val($.datepicker.formatDate('dd/mm/yy', new Date()));
		$('#txtDateTime').val($.datepicker.formatDate('dd/mm/yy 00:00:00', new Date()));
		$('#txtYearMonth').val($.datepicker.formatDate('dd/mm/yy', new Date()));
		$('#txtTime').val($.datepicker.formatDate('00:00:00', new Date()));
		
		
		$("#btnDisabled").click(function(e){
			fn_formAllDisable(['frmSearch']);
		});
		
		$("#btnFormData").click(function(e){
			var data = formIdToMap("frmSearch");
			console.log(data);
		});
		
		$("#btnAjax").click(function(e){
			var url = "/sample/ajaxSample.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {"param":formData};
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.result);
			});
		})
		
		$("#btnEmail").click(function(e) {
			sendEmail();
		})
		
		$("#btnEx4").click(function(){
	      window.open("http://localhost:8080/api/sales/orders.do");
		});
	});	
	
</script>

<c:import url="../import/frameBottom.jsp" />