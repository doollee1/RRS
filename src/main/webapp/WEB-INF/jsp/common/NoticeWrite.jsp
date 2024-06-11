<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : NoticeWrite
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="NoticeWrite" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin" style="border-bottom:1px solid #ddd; padding-bottom:4px;"></div>

<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>
<!---------->

<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<div id="ctm_wrap">
	<div class="ctm_sech_wrap">
		<input type="hidden" name="ISNEW" value="1" />
		<input type="hidden" name="ORASCN" />
		<table class="tblForm">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='notice.write'/></h4>
			</div>
			<div class="ct_grid_top_right"></div>
		</div>			
			<colgroup>
				<col width="130px" />
		        <col/>
		    </colgroup>
			<tr>
				<th><span>*</span><s:message code='notice.title'/></th>
				<td colspan="3">
					<input type="hidden" id="hNoticeNo" name="hNoticeNo" />
					<input type="hidden" id="hFileUid" name="hFileUid" />
					<input type="text" id="TITLE" name="TITLE" class="cmc_txt" style="width:99%;" ess="ess" />
				</td>
			</tr>
			<tr>
				<th><span>*</span><s:message code='notice.notictype'/></th>
				<td>
					<select id="NOTICE_TP" name="NOTICE_TP" class="cmc_combo" ess="ess" style="width:calc(100% - 50px);">
				</td>
				<th width="8%"><s:message code='notice.noticdate'/></th>
				<td>
					<input type="text" id="FROMDATE" name="FROMDATE" data-type="date" style="background-color:#fff; width: 90px; text-align: center; float:left;"  disabled="" readonly /> <p style="float:left;">&nbsp;~&nbsp;</p> 
					<input type="text" id="TODATE" name="TODATE" data-type="date" style="background-color:#fff; width: 90px; text-align: center; float:left;" disabled="" readonly />
				</td>
			</tr>					
			<tr>
				<th><s:message code='notice.file'/></th>
				<td colspan="3">
					<div id="attachfileup_wrap" style="height:auto; display:inline; line-height:25px; overflow-y:auto;">
						<div id="ATTACHFILE"></div>
						<div id="noticeAttach" style="height:auto; overflow-y:auto;"></div>
					</div>
				</td>
			</tr>
			<tr>
				<th><span>*</span><s:message code='notice.content'/></th>
				<td colspan="3">
					<div id="divEditor" class="ctm_mg_wrap" style="float:left;width:100%; height:auto;">
						<textarea id="htmlEditor" style="overflow-y:auto;"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
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
  var args;
	//초기 로드
	$(function() {
		
		$(window).off('beforeunload');
		initLayout();

		$("#TITLE").focus();
		$('#cBtnSearch').text("<s:message code='button.list'/>");
		$('#cBtnSearch').addClass("cls");
		$('#cBtnSearch').addClass("cBtnList_style");
		
		var today = new Date();
		today.setDate(today.getDate() + 30);
		createCodeBox('NOTICE_TP',false);
		$('[name="FROMDATE"]').val($.datepicker.formatDate('yy.mm.dd', new Date()));
		$('[name="TODATE"]').val($.datepicker.formatDate('yy.mm.dd', today));
		var startArray;
		var endArray;
		var start_date;
		var end_date;
		
		jQuery('#FROMDATE').on('change', function () { 				
			startArray = $("#FROMDATE").val().split('.');
			endArray = $("#TODATE").val().split('.');
			start_date = new Date(startArray[0], startArray[1], startArray[2]);
			end_date = new Date(endArray[0], endArray[1], endArray[2]);
			if(start_date.getTime() > end_date.getTime()){	
				$('[name="FROMDATE"]').val($('[name="TODATE"]').val());
				alert("<s:message code='errors.fromdt'/>");
			} 
		});
		
		jQuery('#TODATE').on('change', function () { 				  
			startArray = $("#FROMDATE").val().split('.');
			endArray = $("#TODATE").val().split('.');
			start_date = new Date(startArray[0], startArray[1], startArray[2]);
			end_date = new Date(endArray[0], endArray[1], endArray[2]);
			if(start_date.getTime() > end_date.getTime()){	
				$('[name="TODATE"]').val($('[name="FROMDATE"]').val());
				alert("<s:message code='errors.todt'/>");
			} 
		});
		
		tinymce.init({
            selector: "#htmlEditor",            
            theme: "modern",
            language: "de",
            menubar:false,
            plugins: [
                      "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                      "searchreplace wordcount visualblocks visualchars code fullscreen",
                      "insertdatetime media nonbreaking save table contextmenu directionality",
                      "emoticons template textcolor paste"
                  ],
            height: ($(document).height() - 450),
            forced_root_block : false,
            force_br_newlines : true,
            force_p_newlines : false,
            toolbar: "undo redo | styleselect | forecolor bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link media custom_image code ",
            setup: function(editor) {
            editor.addButton('custom_image', {
                    title: '<s:message code='notice.image'/>',
                    icon: 'image',
                    onclick: function() {
                    	imageUploadPopup();
                    }
                });
            },
            extended_valid_elements:"a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],table[style|class|border=2|width|cellspacing|cellpadding|bgcolor],colgroup,col[style|width],tbody,tr[style|class],td[style|class|colspan|rowspan|width|height],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
            statusbar: false,
            verify_html: true,
            theme_advanced_resizing: false,
            verify_html: true,
            forced_root_block: 'div',
            force_br_newlines: true,
            force_p_newlines: false,
            remove_linebreaks: false,
            remove_trailing_nbsp: false,
            paste_auto_cleanup_on_paste: false,        
            paste_data_images: true,
            paste_retain_style_properties : "all",
            paste_strip_class_attributes : "none",          
            setup : function (ed) {    
                /*Here give the id of above textarea component to load default text inside*/
                  $('#content').val('Test Content');                              
            }          
        });
		
		$("#ATTACHFILE").mkFileUpload("FILE", "/common/noticeFileUpload.do","exe|txt|doc|hwp|xls|xlsx|ppt|xml|dbf|html|htm|png|css|jpg|gif|psd|zip|pdf");
		
		//alert("${param.NOTICE_NO}");
		if(!fn_empty("${param.NOTICE_NO}")){
			$("#hNoticeNo").val("${param.NOTICE_NO}");
			selectNoticeInfo();
		}
		ajaxUpload();
	});
	
	function imageUploadPopup(){
		var url = "/common/noticeImageUploadPopup.do";
		var pid = "p_NoticeImageUpload";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid, null, function(data) {
			
			if(!fn_empty(data)){
				for(var i = 0; i < data.length; i++){
					var tempImg = "<p><img src='" + data[i]["REAL_FILE_PATH"] + "' /></p>";
					tinymce.activeEditor.execCommand("mceInsertContent",'false',tempImg);
				}
			}
		});
	}
	
	function cSearch(){
		fn_pageMove("/common/NoticeList.do");
	}
	
	function cSave(){
		if($("#ATTACHFILE input[type=file]").val() == null || $("#ATTACHFILE input[type=file]").val() == ""){
			insertNoticeInfo();
		}else{
			$("#multiform_FILE").submit();
		}
		
	}
	
	function ajaxUpload(){
		$('#multiform_FILE').ajaxForm({
	     	cache: false,
	     	dataType:"json",
	     	data:{
	     		"fileuid" : $("#hFileUid").val()
	     	},
	       	//보내기전 validation check가 필요할경우
	       	beforeSubmit: function (data, frm, opt) {
				return true;
			},
			//submit이후의 처리
			success: function(data, statusText){
				insertNoticeInfo(data.result);
			},
	        //ajax error
	       	error: function(e){
				alert("<s:message code='fail.common.msg'/>");
			}                               
		});
	}
	
	function insertNoticeInfo(result){
		if(fn_empty($("#TITLE").val())){
			args = '<s:message code='notice.title'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			$("#TITLE").focus();
			return;
		}
		
		if(fn_empty($("#NOTICE_TP").val())){
			args = '<s:message code='notice.notictype'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			$("#NOTICE_TP").focus();
			return;
		}
		
		if(fn_empty(tinymce.get('htmlEditor').getContent().replace("&nbsp;","").replace("<div>","").replace("</div>",""))){
			
			args = '<s:message code='notice.content'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			tinymce.get('htmlEditor').focus();
			return;
		}
		
		var file_uid = $("#hFileUid").val();
		if(!fn_empty(result)){
			file_uid = result[0]["FILE_UID"];
		}
		

		if(confirm("<s:message code='confirm.save'/>")){
			var param = {
				"NOTICE_NO" : $("#hNoticeNo").val(),
				"TITLE" : $("#TITLE").val(),
				"CONTENTS" : tinymce.get('htmlEditor').getContent(),
				"NOTICE_TP" : $("#NOTICE_TP").val(),
				"FROMDATE" : $("#FROMDATE").val(),
				"TODATE" : $("#TODATE").val(),
				"FILE_UID" : file_uid
			};
			chk_event= false;
			var url = '/common/insertNoticeInfo.do';
			var param = {"param" : param};
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='info.save'/>");
				fn_pageMove("/common/NoticeList.do");
			});
		}
	}
	
	function selectNoticeInfo(){
		var url = "/common/selectNoticeInfo.do";
		var param = { "param" : {
				"S_NOTICE_NO" : $("#hNoticeNo").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			var result = data.result;
			$("#TITLE").val(result.TITLE);
			$("#NOTICE_TP").val(result.NOTICE_TP);
			$("#FROMDATE").val(result.FROMDATE);
			$("#TODATE").val(result.TODATE);
			$("#htmlEditor").val(result.CONTENTS);
			$("#hFileUid").val(result.FILE_UID);
			var file = data.fileResult;
			output(file);
		});
	}
	
	function output(data){
		$.each(data, function(index, item){
			var link = "/common/downloadNoticeAttach.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			var deleteLink = "/common/deleteNoticeAttach.do";
			$("#noticeAttach").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>"); 
			$("#noticeAttach").append("<span class='clipdel'><a href='#' onclick=\"fileDelete('" + deleteLink + "', '" + item.FILE_UID + "', '" + item.NEW_FILE_NM + "');\"><span class='notice_file_del'>Delete</span></a></span>");
			$("#noticeAttach").append("<br/>");
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />