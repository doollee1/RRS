<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : arrImgUploadPopup
 * @Description : 항공권이미지 업로드팝업
 */
%>
<style>
  h1 { margin: 30px 0px; text-align: center; }
  img { max-width: 100%; display: block; margin: 0px 0px 0px 0px; }
</style>
<div id="p_arrImgPopup">
	<div id="pop_ct_form_wrap">
		<div><h1 style="font-size: 20px; font-weight: bold; margin: 0">항공권 이미지 업로드</h1></div>
	    <div>
	        <input id="fligthImage" name="fligthImage" type="file" accept="image/*" class="form-control" style="width:70%;"/>
	    </div>	   
	</div>
</div>

<script type="text/javascript">
$(function() {
	var req_dt;
	var seq;
	var dseq;
	var formData = new FormData();   //이미지, json 파라미터
	
	$('#p_arrImgPopup').dialog({
		title :'<s:message code='reservation.arrImg'/>',
		autoOpen : false,
		height: 'auto',
		width: 400,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					uploadArrImage();  	//항공이미지업로드
				}
			},
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
		}
	});
			
	function fn_init (receivedData){
		req_dt          = receivedData.REQ_DT;
		seq             = receivedData.SEQ;
		dseq    		= receivedData.DSEQ;
		
		//항공권이미지 업로드
		$("#fligthImage").on("change", handleImgInput);
	}
	
	//이미지 업로드
	function uploadArrImage(){
		var flightImage = $("#fligthImage").val();
		
		if(!flightImage){
			alert("항공권을 등록 해주세요.");
			return false;
		}
		
		var data = {
				  req_dt  : req_dt	//요청일자
				, seq     : seq		//예약일련번호
				, dseq 	  : dseq 	//예약상세일련번호
		};
		formData.append("param", new Blob([JSON.stringify(data)], {type:"application/json;charset=UTF-8"}));
		
		$.ajax({
			type : "POST",
			url : "/reserve/adminImageReservationAjax.do",
			data : formData,
			dataType : "json",
			processData: false,
			contentType: false,
			success : function(data) {				
				if(data.result == "SUCCESS") {					
					alert("항공권 등록이 완료되었습니다."); 
					popupClose($('#p_arrImgPopup').data('pid'));  //팝업닫기
					
				} else {
					alert("항공권 등록이 실패하였습니다. 관리자에게 문의 하세요.");
					popupClose($('#p_arrImgPopup').data('pid'));  //팝업닫기
				}
		 	}
		});
	}
	
	<%-- 이미지 변경  --%>
	function handleImgInput() {
		var file = this.files[0];
		$("#preview").attr("src", "");
		if (!file.type.match(/image.*/)) {
			alert("지원되는 이미지가 아닙니다.");
			this.value = "";
			return;
		}

		if(file.size >= (1024 * 1024 * 5)) {
			alert("사진 사이즈는 5MB 보다 작아야 됩니다.");
			this.value = "";
			return;
		}

		var reader = new FileReader();
		reader.onload = function(e) {
		};
		reader.readAsDataURL(file);
		if(file.size >= (1024 * 512)) {
			resizeImage({
				file: file,
				maxSize: 600
			}).then(function (resizedImage) {
				var imageFile = new File([resizedImage], file.name, {type: file.type});
				formData.append("file", imageFile);
			});
		} else {
			formData.append("file", file);
		}
	}

	<%-- 이미지 rezise --%>
	function resizeImage(settings) {
		var file = settings.file;
		var maxSize = settings.maxSize;
		var reader = new FileReader();
		var image = new Image();
		var canvas = document.createElement('canvas');
		var dataURItoBlob = function (dataURI) {
			var bytes = dataURI.split(',')[0].indexOf('base64') >= 0 ?
				atob(dataURI.split(',')[1]) :
				unescape(dataURI.split(',')[1]);
			var mime = dataURI.split(',')[0].split(':')[1].split(';')[0];
			var max = bytes.length;
			var ia = new Uint8Array(max);
			for (var i = 0; i < max; i++)
				ia[i] = bytes.charCodeAt(i);
			return new Blob([ia], { type: 'image/jpeg'});
		};
		var resize = function () {
			var width = image.width;
			var height = image.height;
			if (width > height) {
				if (width > maxSize) {
					height *= maxSize / width;
					width = maxSize;
				}
			} else {
				if (height > maxSize) {
					width *= maxSize / height;
					height = maxSize;
				}
			}
			canvas.width = width;
			canvas.height = height;
			canvas.getContext('2d').drawImage(image, 0, 0, width, height);
			var dataUrl = canvas.toDataURL('image/jpeg');
			return dataURItoBlob(dataUrl);
		};
		return new Promise(function (ok, no) {
			reader.onload = function (readerEvent) {
				image.onload = function () { return ok(resize()); };
				image.src = readerEvent.target.result;
			};
			reader.readAsDataURL(file);
		});
	}
	
});

</script>