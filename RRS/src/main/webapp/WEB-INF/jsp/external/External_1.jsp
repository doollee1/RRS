<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : External_1
	 */
%>

<c:import url="../import/frameTop2.jsp">
	<c:param name="progcd" value="Customer" />
</c:import>

<div id="top_wrap2">
	<div style="float:left;">
		<img src="/images/external_logo.png">
	</div>
	<div>
		<div class="external_loginfo"><i class="fa fa-user" style="float:left;"></i>Partner ID</div><div class="external_loginfo_id">10018960</div>				
		<div class="externalSearch"><i class="fa fa-search" style="margin-right:5px;">&nbsp;</i>Search</div>
	</div>	
	</div>
	<div class="ex_tab_top_search">
		<table width="1140px" style="margin:0 auto;">
			<tbody>		
	      		<tr>
	      			<td class="small_td" width="15%"><p>Quotation or S/O No.</p></td>
	      			<td><input type="text" id="" data-dbcolumn="" maxlength="" value="600019786" style="border:0px; float:left;"></td>
					<td class="small_td"><p>Created From</p></td>
					<td><input type="text" id="" data-dbcolumn="" maxlength="" value="26.12.2017" style="border:0px; float:left;"><!-- <i class="fa fa-calendar"></i> -->
					</td>
					<td class="small_td"><p>Created to</p></td>
					<td><input type="text" id="" data-dbcolumn="" maxlength="" value="26.01.2018" style="border:0px; float:left;"><!-- <i class="fa fa-calendar"></i> -->
					</td>
				</tr>
				<tr>
					<td class="small_td"><p>Overall Status</td>
					<td><input type="text" id="" data-dbcolumn="" maxlength="" value="C Completed" style="border:0px; float:left;"><p></p></td>
					<td class="small_td"><p>Delivery Status</td>
					<td><input type="text" id="" data-dbcolumn="" maxlength="" value="Not Delivered" style="border:0px; float:left;"><p></p></td>
					<td class="small_td"><p>Rejection Status</p></td>
					<td><input type="text" id="" data-dbcolumn="" maxlength="" value="Not Relevant" style="border:0px; float:left;"></td>
				</tr>
	      	</tbody>
	      </table>
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
  function openTab(evt, TabName) {
	    var i, tab2content, tab2links;
	    tab2content = document.getElementsByClassName("tab2content");
	    for (i = 0; i < tab2content.length; i++) {
	        tab2content[i].style.display = "none";
	    }
	    tab2links = document.getElementsByClassName("tab2links");
	    for (i = 0; i < tab2links.length; i++) {
	        tab2links[i].className = tab2links[i].className.replace(" active", "");
	    }
	    document.getElementById(TabName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
  
  (function() {
	  
	  setTimeout(function() {
		  var elm = document.querySelector('.tab2 .tab2links');
		  var event = document.createEvent("Event");
		  event.initEvent('click', false, true);
		  elm.dispatchEvent(event);
	  }, 500);
  }());  
  </script>  

<!--  tab start -->
<div style="height:10px; background-image: linear-gradient(to bottom, #f5f5f5 0%, #fff 100%);"></div>
<div class="external_menutab">
<div class="tab2">
  <div style="width:1140px; margin:0 auto;">
  	<button class="tab2links" onclick="openTab(event, 'generaldata_tab')">General Information</button>
  	<button class="tab2links" onclick="openTab(event, 'quotation_tab')">Quotation</button>
  	<button class="tab2links" onclick="openTab(event, 'salesorder_tab')">Sales Order</button>
  	<button class="tab2links" onclick="openTab(event, 'payment_tab')">Remain Payment S/O</button>
  	<button class="tab2links" onclick="openTab(event, 'invoices_tab')">Billing/Invoicing</button>
  </div>  
</div>
</div>
<div id="ctu_wrap_external">
<div id="generaldata_tab" class="tab2content">
  <!----- tab 1 ----->
			<div id="general_information_tab">							
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">
						 <h4 class="external_h4">Basic & Default Information</h4>
					</div>
				</div>	
				<div>	
					<table class="table_line_external" width="100%">
						<tbody>
							<tr>
								<th width="163">Terms of Payment</th>
								<td width="555"><input type="text" id="input6" data-dbcolumn="" maxlength="" value="CA00"><p>T/T Payment in Advance</p></td>
								<th>From Date</th>
								<td><input type="text" id="input3" data-dbcolumn="" maxlength="" value="17.01.2016"></td>
								<th>&nbsp;</th>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>Incoterms</th>
								<td><input type="text" id="input4" data-dbcolumn="" maxlength="" value="CIP"><p>Pederobba</p></td>
								<th>VAT Reg. No.</th>
								<td><input type="text" id="input7" data-dbcolumn="" maxlength="" value="IT4131820260"></td>
								<th>&nbsp;</th>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">
						 <h4 class="external_h4">Quotation & Sales Order Summary</h4>
					</div>
				</div>
				<div>		
				<table class="table_line_external" width="100%">
					<tbody>
						<tr>
							<th>Open Quotation</th>
							<td><input type="text" id="input8" data-dbcolumn="" maxlength="" value="7"><p>EA</p>
								<button type='button' onclick="openTab(event, 'salesorder_tab')" class='external_btn tab2links' id='pfGrdAdd'><i class='fa fa-chevron-right'></i></button>
							</td>
							<th>Total Amount(Quotation)</th>
							<td><input type="text" id="input9" data-dbcolumn="" maxlength="" value="72.100"><p>EUR</p></td>
							<th>First ~ End Date</th>
							<td><input type="text" id="input10" data-dbcolumn="" maxlength="" style="float: left;" value="11.07.2016">
							<p style="float:left; margin-left:-2px; padding-left:2px; padding-right:1px;" >~</p>
								<input type="text" id="input11" data-dbcolumn="" maxlength="" value="18.12.2017"></td>
						</tr>
						<tr>
							<th>Open Sales Order</th>
							<td><input type="text" id="input12" data-dbcolumn="" maxlength="" value="3"><p>EA</p>
								<button type='button' onclick="openTab(event, 'salesorder_tab')" class='external_btn' id='pfGrdAdd'><i class='fa fa-chevron-right'></i></button>
							</td>
							<th>Total Amount(Sales Order)</th>
							<td><input type="text" id="input13" data-dbcolumn="" maxlength="" value="85.070"><p>EUR</p></td>
							<th>First ~ End Date</th>
							<td><input type="text" id="input14" data-dbcolumn="" maxlength="" style="float: left;" value="20.09.2016">
								<p style="float:left; margin-left:-2px; padding-left:2px; padding-right:1px;" >~</p>
								<input type="text" id="input15" data-dbcolumn="" maxlength="" value="12.10.2017"></td>
						</tr>
						<tr>
							<th>Remain Payment S/O</th>
							<td><input type="text" id="input16" data-dbcolumn="" maxlength="" value="4"><p>EA</p>
								<button type='button' onclick="openTab(event, 'salesorder_tab')" class='external_btn' id='pfGrdAdd'><i class='fa fa-chevron-right'></i></button>
							</td>
							<th>Remain Payment Amount</th>
							<td><input type="text" id="input17" data-dbcolumn="" maxlength="" value="153.400"><p>EUR</p></td>
							<th>First ~ End Date</th>
							<td><input type="text" id="input18" data-dbcolumn="" maxlength="" style="float: left;" value="30.05.2017">
								<p style="float:left; margin-left:-2px; padding-left:2px; padding-right:1px;" >~</p>
								<input type="text" id="input19" data-dbcolumn="" maxlength="" value="08.07.2017"></td>
						</tr>
						<tr>
							<th>Open Invoices</th>
							<td><input type="text" id="input20" data-dbcolumn="" maxlength="" value="4"><p>EA</p>
								<button type='button' onclick="openTab(event, 'salesorder_tab')" class='external_btn' id='pfGrdAdd'><i class='fa fa-chevron-right'></i></button>
							</td>
							<th>Amount of Open Invoices</th>
							<td><input type="text" id="input21" data-dbcolumn="" maxlength="" value="153.400"><p>EUR</p></td>
							<th>Overdue Amounts</th>
							<td><input type="text" id="input18" data-dbcolumn="" maxlength="" style="float: left;" value="30.05.2017">
								<p style="float:left; margin-left:-2px; padding-left:2px; padding-right:1px;" >~</p>
								<input type="text" id="input19" data-dbcolumn="" maxlength="" value="08.07.2017"></td>
						</tr>
					</tbody>
				</table>
				</div>
		    	<p>&nbsp;</p>
		    </div>	
</div>

<div id="quotation_tab" class="tab2content">
	<!----- tab 2 ----->
			<div id="#sales_order_tab">
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">
		  				 <h4 class="external_h4">Quotation List</h4>
		  			</div>
		  		</div>
		  		<table class="external_table_d">
		  			<tr>
		  				<th>Quotation No</th>
		  				<th>Item</th>
		  				<th>Material</th>
		  				<th>Description</th>
		  				<th>Quantity</th>
		  				<th>Order Unit</th>
		  				<th>Day Type</th>
		  				<th>Delivery Date</th>
		  				<th>Net Price</th>
		  				<th>Net Value</th>
		  				<th>Currency</th>
		  				<th>Over all Status</th>
		  				<th>Sales Order No</th>
		  				<th>S/O Item</th>
		  				<th>FIX Date & QTY</th>		  				
		  			</tr>
		  			<tr>
		  				<td>600019786</td>
		  				<td>100</td>
		  				<td>10019157</td>
		  				<td>Q.PEAK 4.1.0 300</td>
		  				<td>354</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>0.45</td>
		  				<td>159.30 </td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td>v</td>		  			  				
		  			</tr>
		  			<tr>
		  				<td>2</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  			<tr>
		  				<td>3</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  			<tr>
		  				<td>4</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  		</table>
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">
          				 <h4 class="external_h4">Selected Quotation Follow-on Documents</h4>
          			</div>
          		</div>
			</div>
	</div>

<div id="salesorder_tab" class="tab2content">
<!----- tab 3 ----->
			<div id="quotation_tab">				
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">	
						 <h4 class="external_h4">Sales Order List</h4>
					</div>
				</div>
				<table class="external_table_d">
		  			<tr>
		  				<th>Sales Order No</th>
		  				<th>Item</th>
		  				<th>Material</th>
		  				<th>Description</th>
		  				<th>Quantity</th>
		  				<th>Order Unit</th>
		  				<th>Day Type</th>
		  				<th>Delivery Date</th>
		  				<th>Net Price</th>
		  				<th>Net Value</th>
		  				<th>Currency</th>
		  				<th>Over all Status</th>
		  				<th>Quotation No</th>
		  				<th>Quotation Item</th>
		  				<th>FIX Date & QTY</th>
		  				<th>Allocated Qty</th>
		  				<th>External Reference</th>		  				
		  			</tr>
		  			<tr>
		  				<td>600019786</td>
		  				<td>100</td>
		  				<td>10019157</td>
		  				<td>Q.FLAT-G4 Middle Column</td>
		  				<td>354</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>0.45</td>
		  				<td>159.30</td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td>v</td>
		  				<td></td>
		  				<td></td>		  			  				
		  			</tr>
		  			<tr>
		  				<td>2</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  			<tr>
		  				<td>3</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  			<tr>
		  				<td>4</td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>
		  				<td></td>		  				
		  			</tr>
		  		</table>
				<div class="ct_grid_top_wrap2">
					<div class="ct_grid_top_left2">
          				 <h4 class="external_h4">Selected Quotation Follow-on Documents</h4>
          			</div>
          		</div>
				<!-- 그리드 시작 -->

				<!-- 그리드 끝 -->		    
		    <p>&nbsp;</p>				          		
          	</div>	
	</div>
	
		<div id="payment_tab" class="tab2content">
			<!----- tab 4 ----->
			<div id="billing_tab">	          	
		        <!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"> <h4 class="external_h4">Remain Payment List</h4></div>
						<div class="ct_grid_top_right2">  
							
						</div>
					</div>
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"> <h4 class="external_h4">Selected Quotation Follow-on Documents</h4></div>
						<div class="ct_grid_top_right2">  
							
						</div>
					</div>
				</div>
				<!-- 그리드 끝 -->	
			</div>     
		</div>
	<!--  tab end -->
	
	<div id="invoices_tab" class="tab2content">
			<!----- tab 5 ----->
			<div id="billing_tab">	          	
		        <!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"> <h4 class="external_h4">Invoice List</h4></div>
						<div class="ct_grid_top_right2"></div>
					</div>
					<table class="external_table_d" width="100%">
		  			<tr>
		  				<th>Invoice No</th>
		  				<th>Item</th>
		  				<th>Material</th>
		  				<th>Description</th>
		  				<th>Quantity</th>
		  				<th>Order Unit</th>
		  				<th>Due Date</th>
		  				<th>Net Price</th>
		  				<th>Net Value</th>
		  				<th>Gross Value</th>
		  				<th>Currency</th>
		  				<th>Over all Status</th>
		  				<th>Sales Order No</th>		  				 				
		  			</tr>
		  			<tr>
		  				<td>600019786</td>
		  				<td>100</td>
		  				<td>10019157</td>
		  				<td>Q.PEAK 4.1.0 300</td>
		  				<td>354</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>0,45</td>
		  				<td>159.30</td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td>		  				  			  				
		  			</tr>
		  			<tr>
		  				<td>600019786</td>
		  				<td>200</td>
		  				<td>20004610</td>
		  				<td>Q.FLAT-G4 Middle Colum</td>
		  				<td>192</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>491,52</td>
		  				<td>94,371.84</td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td>		  								
		  			</tr>
		  			<tr>
		  				<td>600019789</td>
		  				<td>100</td>
		  				<td>20004613</td>
		  				<td>Q.FLAT-G4 Spacer</td>
		  				<td>384</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>113,66</td>
		  				<td>43,645.44</td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td>		  					  				
		  			</tr>
		  			<tr>
		  				<td>600019790</td>
		  				<td>100</td>
		  				<td>20004614</td>
		  				<td>Q.FLAT-G4 Ballast Clamp</td>
		  				<td>354</td>
		  				<td>PCS</td>
		  				<td>W</td>
		  				<td>50.2017</td>
		  				<td>195,40</td>
		  				<td>69,171.60</td>
		  				<td>EUR</td>
		  				<td></td>
		  				<td></td> 					  				
		  			</tr>
		  		</table>
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"> <h4 class="external_h4">Selected Quotation Follow-on Documents</h4></div>
						<div class="ct_grid_top_right2">  
							
						</div>
					</div>
				</div>
				<!-- 그리드 끝 -->	
			</div>     
		</div>
	<!--  tab end -->
	</div>
</div>
