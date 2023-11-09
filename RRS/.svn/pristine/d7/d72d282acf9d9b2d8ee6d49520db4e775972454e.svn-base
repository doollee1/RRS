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
		<input type="hidden" name="BO_ID" id="BO_ID" value="<c:out value="${BO_ID}" escapeXml="true" />"/>
		<input type="hidden" id="hBBS_NO" name="hBBS_NO" />
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
					<input type="hidden" id="hFileUid" name="hFileUid" />
					<input type="text" id="BBS_TITLE" name="BBS_TITLE" class="cmc_txt" style="width:99%;" ess="ess" />
				</td>
			</tr>
			<tr>
				<th><span>*</span><s:message code='notice.notictype'/></th>
				<td colspan="3">
					<select id="BBS_CATEGORY" name="BBS_CATEGORY" class="cmc_combo" ess="ess" style="width: 250px;"></select>
				</td>
			</tr>					
			<tr>
				<th><s:message code='notice.file'/></th>
				<td colspan="3">
					<div id="attachfileup_wrap" style="height:auto; display:inline; line-height:25px; overflow-y:auto;">
						<div id="ATTACHFILE"></div>
						<div id="bbsAttach" style="height:auto; overflow-y:auto;"></div>
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

		$("#BBS_TITLE").focus();
		$('#cBtnSearch').text("<s:message code='button.list'/>");
		$('#cBtnSearch').addClass("cls");
		$('#cBtnSearch').addClass("cBtnList_style");
		
		createCodeBox('BBS_CATEGORY', false);

		var startArray;
		var endArray;
		
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
		
		var url = "<c:url value="/common/bbsFileUpload.do"/>";
		var whiteExts = "exe|txt|doc|hwp|xls|xlsx|ppt|xml|dbf|html|htm|png|css|jpg|gif|psd|zip|pdf";
		$("#ATTACHFILE").mkFileUpload("FILE", url, whiteExts);
		
		//alert("${param.NOTICE_NO}");
		if(!fn_empty("${param.BBS_NO}")){
			$("#hBBS_NO").val("${param.BBS_NO}");
			selectBBSInfo();
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
		var url ="<c:url value="/common/BBSList.do"/>";
		fn_pageMove(url);
	}
	
	function cSave(){
		if($("#ATTACHFILE input[type=file]").val() == null || $("#ATTACHFILE input[type=file]").val() == ""){
			insertBBSInfo();
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
				insertBBSInfo(data.result);
			},
	        //ajax error
	       	error: function(e){
				alert("<s:message code='fail.common.msg'/>");
			}                               
		});
	}
	
	function insertBBSInfo(result){
		if(fn_empty($("#BBS_TITLE").val())){
			args = '<s:message code='notice.title'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			$("#BBS_TITLE").focus();
			return;
		}
		
		if(fn_empty($("#BBS_CATEGORY").val())){
			args = '<s:message code='notice.notictype'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			$("#BBS_CATEGORY").focus();
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
				"BO_ID" : $("#BO_ID").val(),
				"BBS_NO" : $("#hBBS_NO").val(),
				"BBS_TITLE" : $("#BBS_TITLE").val(),
				"BBS_CONTENTS" : tinymce.get('htmlEditor').getContent(),
				"BBS_CATEGORY" : $("#BBS_CATEGORY").val(),
				"FILE_UID" : file_uid
			};
			chk_event= false;
			var url = "<c:url value='/common/insertBBSInfo.do'/>";
			var param = {"param" : param};
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='info.save'/>");
				fn_pageMove("/common/BBSList.do");
			});
		}
	}
	
	function selectBBSInfo(){
		var url = "/common/selectBBSInfo.do";
		var param = { "param" : {
				"BO_ID" : $("#BO_ID").val(),
				"S_BBS_NO" : $("#hBBS_NO").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			var result = data.result;
			$("#BBS_TITLE").val(result.BBS_TITLE);
			$("#BBS_CATEGORY").val(result.BBS_CATEGORY);
			$("#htmlEditor").val(result.BBS_CONTENTS);
			$("#hFileUid").val(result.FILE_UID);
			var file = data.fileResult;
			output(file);
		});
	}
	
	function output(data){
		$.each(data, function(index, item){
			var link = "/common/downloadBBSAttach.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			var deleteLink = "/common/deleteBBSAttach.do";
			$("#bbsAttach").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>");
			$("#bbsAttach").append("<span class='clipdel'><a href='#' onclick=\"fileDelete('" + deleteLink + "', '" + item.FILE_UID + "', '" + item.NEW_FILE_NM + "');\"><span class='notice_file_del'>Delete</span></a></span>");
			$("#bbsAttach").append("<br/>");
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />