<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"     prefix="tiles" %>
<%
	/**
	 * @Name : main
	 * @Description : 메인 화면
	 */
%>
<tiles:insertAttribute name="header"  />
<p>&nbsp;</p>
	<!--  -->
	 <div  id="content" class="dashboard">
		 <div class="row"> 
		
		<div class="col-md-6" style="margin-top:20px;">
			<!-- Panel -->
			<div id="panel-misc-portlet-color-r1">
				<div>
					<span class="elipsis" >
						<!-- panel title -->
						<span style="font-size:15px; color:#ff6600; font-weight:700;">Notice</span>
					</span>
					<!-- right options 
					<ul class="options pull-right list-inline">
						<li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"><i class="fa fa-minus"></i></a></li>
					</ul>
					 /right options -->
					<table class="main_grouping_table notice_latest" border="1" id="notice">
					<tr style="border-top:3px solid #9f9f9f;">
						<th><s:message code='sales.grd.title'/></th>
						<th><s:message code='quotation.validFrom'/></th>
						<th><s:message code='quotation.validTo'/></th>
						<th><s:message code='title.sample.regUser'/></th>
						<th>Hit</th>
					</tr>
					</table>
				</div>
			</div>
			<!-- /Panel  -->
		</div>
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
	//초기 로드
	$(function() {
		
		selectMainInfo();
	});
	

	function selectMainInfo(){
		var url = "/main/selectMainInfo.do";

		fn_ajax(url, true, null, function(data, xhr){
			var noticeData = data.MainNotice;
			var orderStatus = data.SalesOrderStatus;
			var quotationStatus = data.QuotationStatus;
			
			for(var i=0; i<noticeData.length; i++){
					var eachrow = '<tr>'
								+ '<td onClick=test(' + '"' + noticeData[i].NOTICE_NO + '"' +  ')>' + noticeData[i].TITLE;
							if(noticeData.NEW_YN == 'Y'){
								eachrow	+= '<img src="/images/board_new_icon.gif" class="new_iconM"></td>'
							}else{
								eachrow += '</td>'
							}
								eachrow += '<td onClick=test(' + '"' + noticeData[i].NOTICE_NO + '"' +  ')>' + noticeData[i].FROMDATE + '</td>'
				                    + '<td onClick=test(' + '"' + noticeData[i].NOTICE_NO + '"' +  ')>' + noticeData[i].TODATE + '</td>'
				                    + '<td onClick=test(' + '"' + noticeData[i].NOTICE_NO + '"' +  ')>' + noticeData[i].REG_ID + '</td>'
				                    + '<td onClick=test(' + '"' + noticeData[i].NOTICE_NO + '"' +  ')>' + noticeData[i].CNT + '</td>'
				                    + '</tr>';
					$('#notice').append(eachrow);
			}
			for(var i=0; i< 10 - noticeData.length; i++){
				var eachrow = '<tr>'
	                     + '<td>'+'</td>'
	                     + '<td>'+'</td>'
	                     + '<td>'+'</td>'
	                     + '<td>'+'</td>'
	                     + '<td>'+'</td>'
	                     + '</tr>';
				$('#notice').append(eachrow);
			}
		});
	}
	
	function test(noticecd){
		var url = "/popup/NoticePopup.do";
		var pid = "noticePopup"
		var param = {"noticecd" : noticecd };
		
		popupOpen(url, pid, param, function(data){
			
		});
	}
</script>
<tiles:insertAttribute name="footer"  />