<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/******************************************** 
 * @Subject : 미팅샌딩정보관리
 * @Content : 미팅샌딩정보 및 야간할증비용정보 조회/수정 
 * @Since   : 2024.07.22
 * @Author  : A.J.S 
 ********************************************/
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="Pr02" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>
<div id="ctm_wrap" style="width:100%; ">
	<div class="ct_grid_top_left">
		<h4>지역별 미팅샌딩 관리</h4>
	</div>
	<!-- 미팅샌딩 조회조건 시작 -->	
	<div class="tab_top_search">						
		<table style=width:100%;>
			<tbody >
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="BAS_YY" name="BAS_YY" class="cBasYY cGr1_BasYY" style=width:80px;>
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
					</td>
					<td class="small_td"><p style='width:100px;text-align:right'>미팅샌딩 지역</p></td>
					<td class="medium_td">
						<select id="MSENDING" name="MSENDING" class="" style=width:100px;>
						    <option value="9">전체</option>                               
							<c:forEach var="i" items="${mSending}">
								<option value="${i.REF_CHR1}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<td style=width:55%;></td>
					<td>		
						<button type='button' class="cBtnclass cBtnSearch_style" id='btnSearch1'  style="align:right;" onclick="searchMSending()">조회</button>
						<button type='button' class="cBtnclass cBtnSave_style" id='btnSave1' style="align:right;" onclick="updateMSending()"><s:message code='button.save'/></button>			
					</td>		
				</tr>
			</tbody>
		</table>
	</div>	
	<!-- 미팅샌딩 조회조건 끝 -->
	
	<!-- 미팅샌딩 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_right">			
				<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
				<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			</div>	
		</div>
		<table id="grid1"></table>
	    <div id="grid1_pager"></div>
	    <br/><br/>
	</div>
	<!-- 그리드 끝 -->	
	
	   
	  <div class="ct_grid_top_left">
	   <h4>야간할증비용 관리</h4>
	</div>	
	
	<!-- 야간할증 조회조건 시작 -->
	<div class="tab_top_search">
		<table style=width:100%;>
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="BAS_YY" name="BAS_YY" class="cBasYY cGr2_BasYY" style=width:80px;>								
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
					</td>
					<td class="small_td"><p style='width:100px;text-align:right'>시즌  구분 </p></td>
					<td class="medium_td">
						<select id="SSN_GBN" name="SSN_GBN" class="" style=width:100px;>							    
							<c:forEach var="i" items="${ssn_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<td style=width:55%;></td>		
					<td>
						<button type='button' class='cBtnclass cBtnSearch_style' id='btnSearch' style="align:right;" onclick="searchExtraCharge()">조회</button>
						<button type='button' class='cBtnclass cBtnSave_style' id='btnSave' style="align:right;" onClick="updateExtraCharge()"><s:message code='button.save'/></button>
					</td>			
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 야간할증 조회조건 끝 -->
	<!-- 야간할증 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
		<div class="ct_grid_top_wrap">			
			<div class="ct_grid_top_right">				
				<input type="hidden" name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
				<input type="hidden" name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
			</div>	
		</div>
		<table id="grid2"></table>
	    <div id="grid2_pager"></div>
	</div>
	<!-- 그리드 끝 -->
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
    
  $(function() {
	 	
	    var toYear =  new Date().getFullYear();	     
	     $(".cBasYY").val(toYear);                // 기준연도 설정 
	  
	     createMsendingGrid();
	     createExtraChargeGrid();
	     searchMSending();
	     searchExtraCharge();
	     
	   //미팅샌딩 그리드 onchange event
        $("#grid1").bind("change", function() {
            $('#grid1_' + $('#grid1').jqGrid('getGridParam', 'selrow') + '_CHK').prop('checked', true);
        });
      //야간할증 그리드 onchange event
        $("#grid2").bind("change", function() {
            $('#grid2_' + $('#grid2').jqGrid('getGridParam', 'selrow') + '_CHK').prop('checked', true);
        });
        
  }); 
  
  function createMsendingGrid() {
	    var colName = [
	    	    '수정',
	            '순번',
	            'HDNG_GBN',
	            'PROD_COND',
	            'PROD_SEQ',
	            '미팅샌딩구분',
	            '이용기준',
	            '이용금액',
	            ];
	    var colModel = [
	    	{name : 'CHK',index : 'CHK',width : 50 ,align : 'center',formatter : gridCboxFormat, hidden:true , sortable: false},
	        {name : 'ROWNUM'   , width : 85 , align : 'center'},
	        {name : 'HDNG_GBN' , width : 220, align : 'center' , hidden:true },
	        {name : 'PROD_COND' , width : 220, align : 'center' , hidden:true },
	        {name : 'PROD_SEQ' , width : 220, align : 'center' , hidden:true },	 
	        {name : 'CODE_NM'  , align : 'center' },
	        {name : 'COM_CNTN' , width : 220, align : 'center'},
	        {name : 'COM_AMT'  , width : 220, editable:true, width : 95 , align : 'right', formatter: 'currency', formatoptions: { thousandsSeparator: ',', decimalPlaces: 0}},
	        ];
	    var gSetting = {
	            pgflg          : true,
	            exportflg      : false, //엑셀, pdf 출력 버튼 노출여부
	            colsetting     : false, // 컬럼 설정 버튼 노출여부
	            searchInit     : false, // 데이터 검색 버튼 노출여부
	            resizeing      : true,
	            rownumbers     : false,
	            shrinkToFit    : false,
	            autowidth      : true,
	            queryPagingGrid: false, // 쿼리 페이징 처리 여부
	            height : 'auto'
	    };
	    // 그리드 생성 및 초기화
	    btGrid.createGrid('grid1', colName, colModel, gSetting);
}
  function createExtraChargeGrid() {
	        var colName = [
	        	    '수정',
	        	    'PROD_SEQ',
	                '시즌',
	                '시작일1',
	                '종료일1',
	                '시작일2',
	                '종료일2',
	                '이용기준',
	                '추가기준(4인)',
	                '할증금액'
	                ];
	        var colModel = [	          
	        	{name : 'CHK',index : 'CHK',width : 50,align : 'center',formatter : gridCboxFormat, hidden: true , sortable: false},
	        	{name : 'PROD_SEQ' , width : 100, align : 'center', hidden:true  },
	        	{name : 'SSN_NM' , width : 100, align : 'center'  },
	            {name : 'ST_DT1' , width : 100, align : 'center'  },
	            {name : 'ED_DT1' , width : 100, align : 'center'  },  
	            {name : 'ST_DT2' , width : 100, align : 'center'  },
                {name : 'ED_DT2' , width : 100, align : 'center'  },  
	            {name : 'COM_CNTN' , width : 200, align : 'center'},
	            {name : 'CODE_NM'  , width : 200, align : 'center' },
	            {name : 'COM_AMT'  , editable:true, width : 95 , align : 'right', formatter: 'integer', formatoptions : {defaultValue: '', thousandsSeparator : ','}},
	            ];
	        var gSetting = {
	                pgflg          : true,
	                exportflg      : false, //엑셀, pdf 출력 버튼 노출여부
	                colsetting     : false, // 컬럼 설정 버튼 노출여부
	                searchInit     : false, // 데이터 검색 버튼 노출여부
	                resizeing      : true,
	                rownumbers     : false,
	                shrinkToFit    : false,
	                autowidth      : true,
	                queryPagingGrid: false, // 쿼리 페이징 처리 여부
	                height : 'auto'
	        };
	        // 그리드 생성 및 초기화
	        btGrid.createGrid('grid2', colName, colModel, gSetting);
	}
  /* 지역별 미팅샌딩 비용 목록 조회 */
  function searchMSending() {
      
      $.ajax({
          type:"post",
          url:"/product/selectMSendingInfoList.do",
          data:{"BAS_YY" : $(".cGr1_BasYY").val()
              , "HDNG_GBN" : $("#MSENDING").val()
           },
          dataType:"json"
      }).done(function(data){
          if(data.dup == 'N'){
              alert("조회에 실패했습니다. e.message:"+data.message);
          }
          else{
              reloadGrid("grid1", data.result);
          }
          
      });
 }
  /*  야간할증비용 목록조회 */ 
  function searchExtraCharge() {
      
      $.ajax({
          type:"post",
          url:"/product/selectExtraChargeInfoList.do",
          data:{"BAS_YY" : $(".cGr2_BasYY").val()
              , "SSN_GBN" : $("#SSN_GBN").val()
           },
          dataType:"json"
      }).done(function(data){
          if(data.dup == 'N'){
              alert("조회에 실패했습니다. e.message:"+data.message);
          }
          else{
              reloadGrid("grid2", data.result);
          } 
      });
 }
  /*  지역별 미팅샌딩 이용금액 수정 요청 */
  function updateMSending() {
	  var ids = $("#grid1").jqGrid("getDataIDs");
      var gridData = [];
      var cnt = 0;
      btGrid.gridSaveRow('grid1');
      for(var i = 0; i < ids.length; i++){
          if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
              cnt++;
              gridData.push($("#grid1").getRowData(ids[i]));
          }
      }
      
      if(cnt < 1){
          alert('수정된 행이 없습니다.');
          return;
      }
      
      for(var i = 0; i < gridData.length; i++){
          if(fn_empty(gridData[i]["COM_AMT"]) || gridData[i]["COM_AMT"] <= 0 ){
              alert('이용금액을 입력하십시오. ');
              return;
          }
         
      }

      if(confirm("<s:message code='confirm.save'/>")){
    	  //var formData = formIdAllToMap('frmSearch1');    	  
           var formData = {"BAS_YY" : $(".cGr1_BasYY").val() } 
    	  var url = "/product/updateMSendingCost.do";
    	  var param = {"param" : formData,"gridData" : gridData};
    	  fn_ajax(url, false, param, function(data, xhr){
              if(data.dup == 'Y'){
                  alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
              }else{
                  alert('<s:message code="info.save"/>');
                  searchMSending();  
              }
          });
      }
  }
  /* 야간할증 금액 수정 요청 */
  function updateExtraCharge() {
	  var ids = $("#grid2").jqGrid("getDataIDs");
      var gridData = [];
      var cnt = 0;
      btGrid.gridSaveRow('grid2');
      for(var i = 0; i < ids.length; i++){
          if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
              cnt++;
              gridData.push($("#grid2").getRowData(ids[i]));
          }
      }
      
      if(cnt < 1){
          alert('수정된 행이 없습니다.');
          return;
      }
      
      for(var i = 0; i < gridData.length; i++){
          if(fn_empty(gridData[i]["COM_AMT"]) || gridData[i]["COM_AMT"] <= 0 ){
              alert('이용금액을 입력하십시오. ');
              return;
          }
         
      }
      
      
       if(confirm("<s:message code='confirm.save'/>")){
         // var formData = formIdAllToMap('frmSearch2');
           var formData = {"BAS_YY" : $(".cGr2_BasYY").val() } 
         var url = "/product/updateMSendingCost.do";     
          var param = {"param" : formData,"gridData" : gridData};
          fn_ajax(url, false, param, function(data, xhr){
              if(data.dup == 'Y'){
                  alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
              }else{
                  alert('<s:message code="info.save"/>');
                  searchMSending();  
              }
          });
      }  
      
  }   
  

 </script>
<c:import url="../import/frameBottom.jsp" />