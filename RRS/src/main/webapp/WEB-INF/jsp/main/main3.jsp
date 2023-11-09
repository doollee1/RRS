<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : main
	 * @Description : 메인 화면
	 */
%>
<!--- 스타일 확인 ---><head>
		<link href="content.css" rel="stylesheet" type="text/css" />
	</head>
<!--- 스타일 확인 /--->


<c:import url="../import/frameTop3.jsp">
	<c:param name="appurl" value="/main/main3.do" />
</c:import>

	<!--- daliy sales data/ notice --->
	<table>
		<tr>
			<td style="padding: 10px; vertical-align: top;">
			<span style="font-size:15px; color:#ff6600; font-weight:700;">Daily Sales Data</span>
			<table class="center" border="1">
				<tbody>
					<tr style="border-top:3px solid #9f9f9f;">
						<th>&nbsp;</th>
						<th>Month</th>
						<th>Categories</th>
						<th>G0-G1</th>
						<th>G2-G3</th>
						<th>G4</th>
						<th>Total</th>
					</tr>
					<tr>
						<td rowspan="8" width="82">EU Region</td>
						<td rowspan="8" width="90">September</td>
						<td width="151">Module    Only</td>
						<td width="96">54.75</td>
						<td width="96">97.88</td>
						<td width="96">8.69</td>
						<td width="96">161.33</td>
					</tr>
					<tr>
						<td>Module-BOS</td>
						<td>3.61</td>
						<td>14.99</td>
						<td>0.06</td>
						<td>18.67</td>
					</tr>
					<tr>
						<td class="module_total">Module total</td>
						<td class="module_total">58.37</td>
						<td class="module_total">112.87</td>
						<td class="module_total">8.76</td>
						<td class="module_total">180.00</td>
					</tr>
					<tr>
						<td>　</td>
						<td>　</td>
						<td>　</td>
						<td>　</td>
						<td>　</td>
					</tr>
					<tr>
						<td>Q.Flat/Q.Mount    (MW)</td>
						<td>2.75</td>
						<td>9.88</td>
						<td>0.02</td>
						<td>12.65</td>
					</tr>
					<tr>
						<td>C&amp;I    Bundling (MW)</td>
						<td>0.54</td>
						<td>3.36</td>
						<td>0.02</td>
						<td>3.91</td>
					</tr>
					<tr>
						<td>Q.HOME+ ESS    (MW)</td>
						<td>0.32</td>
						<td>1.76</td>
						<td>0.02</td>
						<td>2.10</td>
					</tr>
					<tr>
						<td>ESS (pcs)</td>
						<td>68</td>
						<td>108</td>
						<td>0</td>
						<td>176</td>
					</tr>
					<tr>
						<td class="top_line" rowspan="8">EU Region</td>
						<td class="top_line" rowspan="8">October</td>
						<td class="top_line">Module Only</td>
						<td class="top_line">42.00</td>
						<td class="top_line">122.56</td>
						<td class="top_line">7.08</td>
						<td class="top_line">171.64</td>
					</tr>
					<tr>
						<td>Module-BOS</td>
						<td>4.00</td>
						<td>16.00</td>
						<td>10.00</td>
						<td>30.00</td>
					</tr>
					<tr>
						<td class="module_total">Module total</td>
						<td class="module_total">46.00</td>
						<td class="module_total">138.56</td>
						<td class="module_total">17.08</td>
						<td class="module_total">201.64</td>
					</tr>
					<tr>
						<td>　</td>
						<td>　</td>
						<td>　</td>
						<td>　</td>
						<td>　</td>
					</tr>
					<tr>
						<td>Q.Flat/Q.Mount    (MW)</td>
						<td>1.60</td>
						<td>24,61</td>
						<td>0,66</td>
						<td>1.60</td>
					</tr>
					<tr>
						<td>C&amp;I    Bundling (MW)</td>
						<td>2.00</td>
						<td>19.00</td>
						<td>5.00</td>
						<td>26.00</td>
					</tr>
					<tr>
						<td>Q.HOME+ ESS    (MW)</td>
						<td>2.00</td>
						<td>20.00</td>
						<td>16.00</td>
						<td>38.00</td>
					</tr>
					<tr>
						<td>ESS (pcs)</td>
						<td>15</td>
						<td>5</td>
						<td>4</td>
						<td>24</td>
					</tr>
				</tbody>
			</table>
			<span style="font-size:15px; color:#ff6600; font-weight:700;">Notice</span>
			<table class="center notice_latest" border="1" id="notice">
						<tr style="border-top:3px solid #9f9f9f;">
							<th><s:message code='sales.grd.title'/></th>
							<th><s:message code='quotation.validFrom'/></th>
							<th><s:message code='quotation.validTo'/></th>
							<th><s:message code='title.sample.regUser'/></th>
							<th>Hit</th>
						</tr>
					<tr><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>2</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>3</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>4</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>5</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>6</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>7</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>8</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>9</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
					<tr><td>10</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
			</table>
			</td>
			<td style="padding: 10px;">
					<span style="font-size:15px; color:#ff6600; font-weight:700;">Report</span>
					<table class="center" border="1" style="margin-left: 10px; float: right;">
			<tbody>
				<tr>
					<th rowspan="2" width="82">Seg.</th>
					<th rowspan="2" width="116">Region</th>
					<th rowspan="2" width="151">Product</th>
					<th width="96">6</th>
					<th width="96">7</th>
					<th width="96">Total</th>
				</tr>
				<tr>
					<th>MW</th>
					<th>MW</th>
					<th>MW</th>
				</tr>
				<tr>
					<td rowspan="24">Rooftop</td>
					<td rowspan="3">Germany</td>
					<td width="151">Q.PEAK</td>
					<td>10.90</td>
					<td>10.64</td>
					<td>21.54</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>12.82</td>
					<td>10.03</td>
					<td>22.85</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>24.74</td>
					<td>17.29</td>
					<td>42.03</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>48.46</td>
					<td>37.96</td>
					<td>86.42</td>
				</tr>
				<tr>
					<td rowspan="3">UK</td>
					<td width="151">Q.PEAK</td>
					<td>0.81</td>
					<td>1.81</td>
					<td>2.62</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>1.80</td>
					<td>1.88</td>
					<td>3.68</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>0.96</td>
					<td>0.91</td>
					<td>1.87</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>3.57</td>
					<td>4.60</td>
					<td>8.17</td>
				</tr>
				<tr>
					<td rowspan="3">France</td>
					<td width="151">Q.PEAK</td>
					<td>5.68</td>
					<td>3.46</td>
					<td>9.14</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>1.27</td>
					<td>1.26</td>
					<td>2.53</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>8.09</td>
					<td>0.44</td>
					<td>8.53</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>15.04</td>
					<td>5.16</td>
					<td>20.20</td>
				</tr>
				<tr>
					<td rowspan="3">Italy</td>
					<td width="151">Q.PEAK</td>
					<td>2.71</td>
					<td>4.45</td>
					<td>7.16</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>1.10</td>
					<td>1.86</td>
					<td>2.96</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>2.62</td>
					<td>5.87</td>
					<td>8.49</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>6.43</td>
					<td>12.18</td>
					<td>18.61</td>
				</tr>
				<tr>
					<td rowspan="3">Netherlands</td>
					<td width="151">Q.PEAK</td>
					<td>3.57</td>
					<td>5.18</td>
					<td>8.75</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>4.88</td>
					<td>9.88</td>
					<td>14.76</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>6.88</td>
					<td>12.88</td>
					<td>19.76</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>15.33</td>
					<td>27.94</td>
					<td>43.27</td>
				</tr>
				<tr>
					<td rowspan="3">ROE</td>
					<td width="151">Q.PEAK</td>
					<td>1.86</td>
					<td>1.91</td>
					<td>3.77</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>0.80</td>
					<td>1.98</td>
					<td>2.78</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>1.22</td>
					<td>5.68</td>
					<td>6.90</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>3.88</td>
					<td>9.57</td>
					<td>13.45</td>
				</tr>
				<tr>
					<td class="strong_line"  colspan="3">Rooftop 요약</td>
					<td class="strong_line" >92.71</td>
					<td class="strong_line" >97.41</td>
					<td class="strong_line" >190.12</td>
				</tr>
				<tr>
					<td rowspan="15">Utility</td>
					<td rowspan="3">Germany</td>
					<td width="151">Q.PEAK</td>
					<td width="96">0.81</td>
					<td width="96">1.35</td>
					<td width="96">2.16</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>1.74</td>
					<td>8.64</td>
					<td>10.38</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>1.18</td>
					<td>3.61</td>
					<td>4.79</td>
				</tr>
				<tr>
					<td colspan="2">Germany 요약</td>
					<td>3.73</td>
					<td>13.60</td>
					<td>17.33</td>
				</tr>
				<tr>
					<td>UK</td>
					<td>Q.PEAK</td>
					<td>0.14</td>
					<td>　</td>
					<td>0.14</td>
				</tr>
				<tr>
					<td colspan="2">UK 요약</td>
					<td>0.14</td>
					<td>　</td>
					<td>0.14</td>
				</tr>
				<tr>
					<td>France</td>
					<td>Q.PEAK</td>
					<td>　</td>
					<td>1.19</td>
					<td>1.19</td>
				</tr>
				<tr>
					<td colspan="2">France 요약</td>
					<td>　</td>
					<td>1.19</td>
					<td>1.19</td>
				</tr>
				<tr>
					<td rowspan="3">Netherlands</td>
					<td width="151">Q.PEAK</td>
					<td>1.01</td>
					<td>　</td>
					<td>1.01</td>
				</tr>
				<tr>
					<td>Q.PEAK DUO</td>
					<td>1.08</td>
					<td>　</td>
					<td>1.08</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>24.28</td>
					<td>　</td>
					<td>24.28</td>
				</tr>
				<tr>
					<td colspan="2">Netherlands 요약</td>
					<td>26.37</td>
					<td>　</td>
					<td>26.37</td>
				</tr>
				<tr>
					<td rowspan="2">ROE</td>
					<td width="151">Q.PEAK    DUO</td>
					<td>　</td>
					<td>0.75</td>
					<td>0.75</td>
				</tr>
				<tr>
					<td>Q.PLUS</td>
					<td>6.80</td>
					<td>17.91</td>
					<td>24.71</td>
				</tr>
				<tr>
					<td colspan="2">ROE 요약</td>
					<td>6.80</td>
					<td>18.66</td>
					<td>25.46</td>
				</tr>
				<tr>
					<td class="strong_line" colspan="3" width="349">Utility 요약</td>
					<td class="strong_line" >37.04</td>
					<td class="strong_line" >33.45</td>
					<td class="strong_line" >70.49</td>
				</tr>
				<tr>
					<th colspan="3">총합계</th>
					<th>129.75</th>
					<th>130.86</th>
					<th>260.61</th>
				</tr>
			</tbody>
		</table>
			</td>
		</tr>
	</table>


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
// 			var orderStatus = data.SalesOrderStatus;
// 			var quotationStatus = data.QuotationStatus;
			
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
			
// 			for(var i=0; i<orderStatus.length; i++){
// 				var eachrow = '<tr>'
// 					eachrow += '<td>' + orderStatus[i].STATUS_NM + '</td>'
// 		                    + '<td>' + orderStatus[i].PRE_COUNT + '</td>'
// 		                    + '<td>' + orderStatus[i].PRE_VOL_QTY + '</td>'
// 		                    + '<td>' + orderStatus[i].PRE_T_WT + '</td>'
// 		                    + '<td>' + orderStatus[i].NEXT_COUNT + '</td>'
// 		                    + '<td>' + orderStatus[i].NEXT_VOL_QTY + '</td>'
// 		                    + '<td>' + orderStatus[i].NEXT_T_WT + '</td>'
// 		                    + '</tr>';
// 				$('#sales').append(eachrow);
// 			}
			
// 			for(var i=0; i<quotationStatus.length; i++){
// 				var eachrow = '<tr>'
// 					eachrow += '<td>' + quotationStatus[i].STATUS_NM + '</td>'
// 		                    + '<td>' + quotationStatus[i].PRE_COUNT + '</td>'
// 		                    + '<td>' + quotationStatus[i].PRE_VOL_QTY + '</td>'
// 		                    + '<td>' + quotationStatus[i].PRE_T_WT + '</td>'
// 		                    + '<td>' + quotationStatus[i].NEXT_COUNT + '</td>'
// 		                    + '<td>' + quotationStatus[i].NEXT_VOL_QTY + '</td>'
// 		                    + '<td>' + quotationStatus[i].NEXT_T_WT + '</td>'
// 		                    + '</tr>';
// 				$('#quotation').append(eachrow);
// 			}
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
<c:import url="../import/frameBottom.jsp" />