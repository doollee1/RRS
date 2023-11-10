<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%

%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="MainUpload" />
</c:import>

<div id="ctm_wrap">
	<div class="ctm_sech_wrap">
		<table class="tblForm">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4>Main - Daily Sales Excel Upload</h4>
				</div>
				<div class="ct_grid_top_right"></div>
			</div>			
			<colgroup>
				<col width="130px" />
		        <col/>
		    </colgroup>					
			<tr>
				<th>Excel Upload</th>
				<td colspan="3">
					<div id="attachfileup_wrap" style="height:auto; display:inline; line-height:25px; overflow-y:auto;">
						<div id="ATTACHFILE"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<script type="text/javascript">

var args;
//초기 로드
$(function() {	
	$("#ATTACHFILE").mkFileUpload("EXCEL", "/common/uploadMainExcel.do", "xls|xlsx");
	ajaxUpload();
});

function cUpload(){
	$("#multiform_EXCEL").submit();
}

function ajaxUpload(){
	$('#multiform_EXCEL').ajaxForm({
     	cache: false,
     	dataType:"json",
       	//보내기전 validation check가 필요할경우
       	beforeSubmit: function (data, frm, opt) {
       		var nodes = $("#fileupload_EXCEL_list").children();
       		if(1 < nodes.length){
				var msg = "1";
				alert("<s:message code='error.excelUpload' arguments='" + msg + "' javaScriptEscape='false'/>");
       			return false;
       		}else{
       			return true;
       		}
		},
		//submit이후의 처리
		success: function(data, statusText){
			//popupClose($('#excelupload').data('pid'), data);
			console.log(data);
			alert("complete");
		},
        //ajax error
       	error: function(e){
       		alert('Error');
		}
	});
}

</script>

<c:import url="../import/frameBottom.jsp" />