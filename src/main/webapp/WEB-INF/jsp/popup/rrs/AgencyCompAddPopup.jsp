<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
/**
 * @Name : rrs/addAgencyComp_popup
 * @Description : 에이전시 컴퍼니 추가 등록 팝업창
 */
%>

<div id="p_addAgencyComp">
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<!---<caption></caption> --->
				<colgroup>
					<col width="100px" />
					<col width="200px" />
				</colgroup>
				<tr>
					<th>에이전시 구분</th>
					<td>
						<select id="AGENCY_GB" name="AGENCY_GB" class="cmc_combo" style="width:125px;">
							<c:forEach var="i" items="${agency_gbn}">
								<option value="${i.CODE}"<c:if test="${i.CODE eq '02'}">selected</c:if>>${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>추가 컴퍼니</th>
					<td>
						<input type="text"  id="COMP_NM" name="COMP_NM" style="width:150px;" maxlength="20" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>

<script type="text/javascript">
	/********************************************
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : saveUserInfo() / typeChage()
	 * @Since   : 2024.05.25
	 * @Author  : 이주형
	 ********************************************/
	$(function() {
		$('#p_addAgencyComp').dialog({
			title    :'에이전시 컴퍼니 추가 등록',
			autoOpen : false,
			width    : 450,
			modal    : true,
			buttons : {
				/* 저장 버튼 */
				'<s:message code='system.add'/>' : {
					text: '<s:message code='system.add'/>',
					id  : 'save',
					click: function() {
						addAgencyComp();
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
				
			}
		});
	});

	/********************************************
	 * @Subject : 저장 함수 (추가 버튼)
	 * @Content : 입력 데이터 확인 후 저장
	 * @Since   : 2024.05.25
	 * @Author  : 이주형
	 ********************************************/
	 function addAgencyComp() {
		 if(confirm("<s:message code='confirm.save'/>")){
			 var formData        = formIdAllToMap('frmUserInfo');
			$.ajax({
				type : "post",
				url  : "/rrs/addAgencyComp.do",
				data:{ "HEAD_CD"  : "500120"
					 , "REF_CHR1" : formData.AGENCY_GB
					 , "CODE_NM"  : formData.COMP_NM
				},
				dataType:"json"
			}).done(function(data){
				if(data.result == 'success'){
					alert("저장에 성공했습니다.");
					popupClose($('#p_addAgencyComp').data('pid'));
				}
				else if(data.result == 'isExistAgencyComp'){
					alert("이미 등록된 컴퍼니 입니다.");
				}
				else if(data.result == 'false'){
					alert("저장에 실패했습니다. 관리자에게 문의해주세요.\n" + data.message);
				}
			});
		}
	 }
</script>