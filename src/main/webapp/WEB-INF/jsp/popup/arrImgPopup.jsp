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
		<div class="a"><h1>header</h1></div>
	    <div class="b">
	      <!-- <img src="" alt="" id="arr_img"> -->
	      <img src="/upload/2023/12/17025372603693448068290852139953.jpg">
	    </div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	var req_dt;
	var seq;
	
	$('#p_arrImgPopup').dialog({
		title :'<s:message code='reservation.stateTitle'/>',
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
				$("#arr_img").attr("src", data.ADD_FILE_PATH + data.ADD_FILE_PATH2 + data.ADD_FILE_NM);
				console.log(data);
			}
		});
	}
	
	function fn_init (receivedData){
		req_dt     = receivedData.REQ_DT;
		seq        = receivedData.SEQ;
	}
	
});

</script>