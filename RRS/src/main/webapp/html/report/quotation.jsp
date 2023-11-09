<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body {font-size:11px;}
	p {font-size:8px;}
	body table {font-family:verdana; font-size:10px;}
	@media print
		{
    		#footer {
         	display: block; 
         	position: fixed; 
         	bottom: 0;
         	padding-top:100px;
    		} 
		}
	.orange_color {color:#ff6600;}
	.report_table_line {width:100%;}
	.report_table_line tr {border-bottom:1px solid #ccc;}
	.report_table_line tr td {height: 15px;}
	.report_table_subtotal { width:100%; border-bottom: 1px solid #ccc; background-color: #DFEAFF;}
	.report_totalprice { width:100%; border-bottom:2px solid #333;}
	.report_footer_table {width: 100%;}
	.report_footer_table tr td {vertical-align: top; vertical-align: text-top;font-size: 7px; font-family:verdana;}
</style>
</head>

<table border="0" width="100%"> 
   <thead> 
    <tr> 
     <th style="width:100%"><img style="page-break-before:always;" src="/images/HWQC_logo.png" width="50%"></th> 
   </tr> 
   <tr> 
    <th style="height:30px;"></th> 
   </tr> 
  </thead> 
  
  <tfoot>
   <tr> 
    <td width="100%" height="150px"> 
     <table width="100%" border="0"> 
       <tr> 
         <td colspan="4"><br>&nbsp;</td> 
      </tr> 
    </table> 
  </tfoot>
  
  <tbody> 
    <tr> 
      <td width="100%"> 
         
        <!-- ---- -->
        <div class="">		
			<p><font color="#ff6600">Hanwha Q CELLS GmbH</font><data>Sonnenallee 17-21, 06766 Bitterfeld-Wolfen (OT Thalheim), Germany</data></p>
			
		<table>
				<tr>
					<td><data>address<br>
						2<br>
						3<br>
						4<br>
						5<br>
						6
					</data></td>
				</tr>
	</table>
			
		<h2><font color="#ff6600"><s:message code="report.quotation.title"/> <data>610009466</data></font></h2>
			
		<table width="100%" widtd="100%">
				<tr>
					<td width="20%"><s:message code="report.quotation.nodate"/></td>
					<td>data</td>
					<td width="20%"><s:message code="report.quotation.title"/></td>
					<td>data</td><br>
				</tr>
				<tr>
					<td><s:message code="report.quotation.title"/></td>
					<td>&nbsp;</td>
					<td><s:message code="report.quotation.title"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.yourref"/></td>
					<td>&nbsp;</td>
					<td><s:message code="report.quotation.incoterms"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.yourdoc"/></td>
					<td>&nbsp;</td>
					<td><s:message code="report.quotation.paymenterms"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.contract"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.tel"/></td>
					<td>&nbsp;</td>
					<td><s:message code="report.quotation.createdfor"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.email"/></td>
					<td>&nbsp;</td>
					<td><s:message code="report.quotation.pricevaliduntil"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><s:message code="report.quotation.byorderof"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
	</table>
		<br>
	<table width="100%" style="border-bottom: 1px solid #333; border-top:1px solid #ff6600;" widtd="100%">
				<tr>
					<td width="5%"><font color="#ff6600"><s:message code="report.quotation.pos"/></font></td>
					<td width="15%"><font color="#ff6600"><s:message code="report.quotation.material"/></font></td>
					<td width="20%"><font color="#ff6600"><s:message code="report.quotation.materialdec"/></font></td>
					<td width="15%"><font color="#ff6600"><s:message code="report.quotation.estimated"/></font></td>
					<td width="10%"><font color="#ff6600"><s:message code="report.quotation.quantity"/></font></td>
					<td width="5%"><font color="#ff6600"><s:message code="report.quotation.unit"/></font></td>
					<td width="10%"><font color="#ff6600"><s:message code="report.quotation.unitprice"/></font></td>
					<td width="5%"><font color="#ff6600"><s:message code="report.quotation.per"/></font></td>
					<td width="15%" align="right"><font color="#ff6600"><s:message code="report.quotation.totalprice"/></font></td>
				</tr>
			</table>
	<table class="report_table_line">
		<tr>
			<td width="5%" height="15">000</td>
			<td width="15%">000</td>
			<td width="20%">000</td>
			<td width="15%">000</td>
			<td width="10%">000</td>
			<td width="5%">PCS</td>
			<td width="10%">0 EUR</td>
			<td width="5%">1WP</td>
			<td width="15%" align="right">0000</td>
		</tr>
		<tr>
			<td>000</td>
			<td>000</td>
			<td>000</td>
			<td>000</td>
			<td>000</td>
			<td><s:message code="report.quotation.pcs"/></td>
			<td>0 EUR</td>
			<td>1WP</td>
			<td align="right">00000</td>
		</tr>
		</table>
	<table width="100%" style="border-bottom: 1px solid #ccc; background-color: #DFEAFF">
		<tr>
					<td width="5%"><p><s:message code="report.quotation.totalpower"/><br>
						Total quantity </p></td>
					<td width="53%">10101010101010 WP<br>
						5555555</td>
					<td width="2%">&nbsp;</td>
					<td width="15%">Sub total</td>
					<td width="2%">&nbsp;</td>
					<td width="13%">&nbsp;</td>
					<td width="10%" align="right">5000000000</td>
		</tr>
</table>
			<table width="100%" style="border-top:1px solid #333; border-bottom:1px solid #333;">
				<tr>
					<td width="90%" align="center"><s:message code="report.quotation.totalpower"/></td>
					<td width="10%" align="right" style="color:red">5000000000</td>
			</tr>
		</table>
		<p><data><s:message code="report.quotation.description"/></data></data>
		</p>
			
			<hr>
</div>
        <!-- ---- -->
      </td> 
   </tr>
 </tbody> 
</table>

<table id="footer"  class="report_footer_table" width="100%">
		<tr>
			<td width="27%"><font color="#ff6600">Hanwha Q CELLS GmbH</font><br>
				OT Thalheim <br>
				Sonnenallee 17-21<br>
				06766 Bitterfeld-Wolfen, Germany<br>
				TEL +49 (0) 3494 66 99-0<br>
				FAX +49 (0) 3494 66 99-199<br>
				MAIL q-cells@q-cells.com<br>
				WEB www.hanwha-qcells.com</td>
			<td width="18%"><font color="#ff6600">Board of directors</font><br>
				Ji-Weon Jeong<br>
				Maeng Yoon Kim<br>
				Jun	Tae	Ko <br></td>
			<td width="35%"><p><font color="#ff6600">Back account</font><br>
				Commerzbank AG,Berlin, Germany<br>
				Account : 199999400 (EUR, USD, AUD, JPY, GBP)<br>
				Code : 100 400 00<br>
				IBAN : DE68 1004 0000 0199 9994 00<br>
				BIC (SWIFT): COBADEBB</p></td>
			<td width="20%"><font color="#ff6600">Registered office : </font>Bitterfeld-Wolfen<br>
				<font color="#ff6600">Tax office : </font>Bitterfeld<br>
				<font color="#ff6600">Tax number : </font>116/107/06438<br>
				<font color="#ff6600">Registered number : </font>18663<br>
				<font color="#ff6600">District court : </font>Stendal<br>
				<font color="#ff6600">VAT-ID : </font>DE284757331<br>
				<font color="#ff6600">WEEE-Registration-No : </font>DE 927 15097 </td>
		</tr>
	</table>
</html>