<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : chgStatusPopup
 */
%>
<style>
  h1 { margin: 30px 0px; text-align: center; }
  img { max-width: 100%; display: block; margin: 0px 0px 500px 0px; }
</style>
<div id="p_arrImgPopup">
	<div id="pop_ct_form_wrap">
		<div><h1>항공권 이미지</h1></div>
	    <div>
	        <img src="" alt="이미지" id="arr_img">
	    </div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	var req_dt;
	var seq;
	
	$('#p_arrImgPopup').dialog({
		title :'<s:message code='reservation.arrImg'/>',
		autoOpen : false,
		height: 'auto',
		width: 1076.4,
		modal : true,
		buttons : {
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			fn_init($(this).data());
			cSearch();
		}
	});
	
	function cSearch(receivcedData){
		var url = "/reserve/selectAirlineImg.do";
		var param = {"REQ_DT"   : req_dt
				    ,"SEQ"      : seq
				    };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
				if(!fn_empty(data.result)){
				    $("#arr_img").attr("src", "/upload/" + data.result.ADD_FILE_PATH2 + data.result.ADD_FILE_NM);
				}
			}
		});
	}
	
	function fn_init (receivedData){
		req_dt     = receivedData.REQ_DT;
		seq        = receivedData.SEQ;
	}
	
});

</script>