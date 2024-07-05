<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	/**
	 * @Name : ProductDelPopup
	 * @Description : 상품가격정보관리-일괄삭제 팝업
	 */
%>
<style>
	.ct_grid_top_left { height:20px; vertical-align: middle;}
</style>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY" id="BAS_YY" />
		<input type="hidden" name="BAS_YY_SEQ" id="BAS_YY_SEQ" />
		<input type="hidden" name="PROD_SEQ" id="PROD_SEQ" />
	</form>
</div>

<div id="productDelPopup">
	<!---------->
	<div class="ct_grid_top_left">
		<h4>일괄 삭제조건</h4>
	</div>   
	<div class="tab_top_search">
		<table>
			<colgroup>
				<col width="100px" />
				<col width="200px" />
			</colgroup>
			 
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="BAS_YY_PP" name="BAS_YY_PP" class="cmc_combo" style=width:80%;>
						<c:forEach var="i" items="${basyy}">
	     					<option value="${i.BAS_YY}">${i.BAS_YY}</option>
						</c:forEach>
			         </select>
			      </td>
			      <td>
			      	<button class="btn btn-default" id="btn_del"><s:message code='button.delete'/></button>
			      </td>
			      <td>
			      	<button class='btn btn-default ' id='cBtnCancel' type='button'>닫기</button>
			      </td>
			   </tr>
			</tbody>
		</table>
		
	</div> 
	<br>
</div>

<script type="text/javascript">
$(function(){
	$('#productDelPopup').dialog({
		title: '상품정보 일괄삭제',
		autoOpen: false,
		height: 120,
		width: 400,
		modal: true,
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		},
		open: function() {
		},
	});
   
	//삭제 버튼
	$("#btn_del").on("click" , function(){
		if(confirm($("#BAS_YY_PP").val()+"년도의 상품정보를 일괄 삭제하시겠습니까?") == true){
			var url = "/product/deleteProductInfo.do";
			var param = { "BAS_YY" : $("#BAS_YY_PP").val()
					};

			fn_ajax(url, true, param, function(data, xhr){
				if(data.result == 'N'){
					alert("삭제에 실패했습니다.");
				}
				else{
					alert("삭제했습니다.");
					$('#productDelPopup').dialog('close');
				}
			});
		}
	});
	
	//닫기 버튼
	$("#cBtnCancel").on("click", function(){
		$('#productDelPopup').dialog('close');
	});
	
});

function periodGrid_onSelRow(rowid, iRow, iCol, e){
}


</script>