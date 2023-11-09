<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : SalesOrderSoldToPopup (Address From Master Data for Sold-to party)
	 * @Description : SalesOrder
	 */
%>
<div id="OneTimeCustomerPopup">
	<form id="frmOneTimeCustomerPopupHeader" action="#">
			<h4>Name</h4>
			<table  class="onetime_customer_pop"  width="100%">
				<!-- <tr>
					<td class="small_td"><p>title</p></td>
					<td><select type="text" name="" id=""></select></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>  -->
				<tr>
					<td class="small_td"><p><s:message code="onetime.name"/></p></td>
					<td><input type="text" id="NAME_1ST" name="NAME_1ST" maxlength="35"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td">&nbsp;</td>
					<td><input type="text" id="NAME_2ND" name="NAME_2ND" maxlength="35"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
			    </tr>
			</table>
		<h4><s:message code="onetime.streetAddr"/></h4>
			<table class="onetime_customer_pop" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="onetime.street"/></p></td>
					<td><input type="text" id="STREET_NM" name="STREET_NM" maxlength="35"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.street2"/></p></td>
					<td><input type="text" id="STREET_NM2" name="STREET_NM2" maxlength="40"></td>
					<td><p style="margin-right:10px;"><s:message code="onetime.house"/></p></td>
					<td><input type="text" id="HAUS_NO" name="HAUS_NO"style="float: left;vertical-align:top; width:80px; margin-right:10px;"></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.postalCode"/></p></td>
					 <td class="medium_td"><input type="text" id="POST_CD" name="POST_CD">
						<input type="text" id="CITY_CD" name="CITY_CD"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td class="small_td"><p><s:message code="onetime.country"/></p></td>
					<td><input type="text" id="COUNTRY_CD" name="COUNTRY_CD" style="float: left; vertical-align:top; margin-right:10px; width:80px;" disabled>
						<button class="grid_popupbtn" id="cmm_pop_COUNTRY_CD" name="cmm_pop_COUNTRY_CD" type='button' style="float:left;"></button>
						<p class="data_side_text" name="COUNTRY_NM" id="COUNTRY_NM"></p></td>
					<td><p style="margin-right:10px;"><s:message code="onetime.region"/></p></td>
					
					<td><select id="REGION_CD" data-dbcolumn="REGION_CD"></select>
						<p class="data_side_text" id="REGION_CD_NM"></p>
					</td>
												
<!-- 					<td> -->
					
<!-- 					<input type="text" id="REGION_CD" name="REGION_CD" style="float: left;vertical-align:top; width:80px; margin-right:10px;"> -->
<!-- 						<button class="grid_popupbtn" id="cmm_pop_REGION_CD" name="cmm_pop_REGION_CD" type='button' style="float:left;"></button> -->
<!-- 						<p class="data_side_text" name="REGION_NM" id="REGION_NM"></p></td> -->
				</tr>
				<tr>
					<td class="small_td"><s:message code="onetime.transportationZone"/></td>
					<td><select id="TRANSP_ZONE" data-dbcolumn="TRANSP_ZONE" data-validmandatory="TRANSP_ZONE"></select>
								<p class="data_side_text" id="TRANSP_ZONE_NM"></p> </td>
					
<!-- 					<input type="text" id="TRANSP_ZONE" name="TRANSP_ZONE" style="float: left; vertical-align:top; margin-right:10px; width:80px;"> -->
<!-- 						<button class="grid_popupbtn" id="cmm_pop_TRANSP_ZONE" name="cmm_pop_TRANSP_ZONE" type='button' style="float:left;"></button> -->
<!-- 						<p class="data_side_text" name="TRANSP_ZONE_NM" id="TRANSP_ZONE_NM"></p></td> -->
					<td class="">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr id="trTimeZone" name="trTimeZone">
					<td class="small_td"><p><s:message code="onetime.timeZone"/></p></td>
					 <td><input type="text" id="TIME_ZONE" name="TIME_ZONE"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		<h4><s:message code="onetime.pOBoxAddress"/></h4>
			<table class="onetime_customer_pop" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="onetime.poBox"/></p></td>
					<td><input type="text" id="PO_BOX" name="PO_BOX"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.postalCode"/></p></td>
					<td><input type="text" id="PO_POST_CD" name="PO_POST_CD"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.companyPostalCode"/></p></td>
					<td><input type="text" id="COMP_POST_CD" name="COMP_POST_CD"></td>
					<td class="small_td"></td>
					<td>&nbsp;</td>
				</tr>
				</table>
		<h4><s:message code="onetime.communication"/></h4>
			<table class="onetime_customer_pop" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="onetime.language"/></p></td>
					<td><select type="text" name="LANG_CD" id="LANG_CD"></select></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.telephone"/></p></td>
					<td><input type="text" id="TEL_NO" name="TEL_NO" maxlength="30"></td>
					<td><p style="margin-right:10px;"><s:message code="onetime.extension"/></p></td>
					<td><input type="text" id="TEL_NO_EXT" name="TEL_NO_EXT" maxlength="10"></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.mobliePhone"/></p></td>
					<td><input type="text" id="MOBILE_NO" name="MOBILE_NO" maxlength="30">
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.fax"/></p></td>
				    <td><input type="text" id="FAX_NO" name="FAX_NO" maxlength="30"></td>
					<td><p style="margin-right:10px;"><s:message code="onetime.extension"/></p></td>
					<td><input type="text" id="FAX_NO_EXT" name="FAX_NO_EXT" maxlength="10"></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.eMail"/></p></td>
				    <td><input type="text" id="E_MAIL" name="E_MAIL" maxlength="100" data-validemail="E_MAIL"></td>
					<td class="">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<!-- <tr>
					<td class="small_td"><p>StandardComm_Mtd</p></td>
					<td><select type="text" name="select2" id="select2">
					</select></td>
					<td class="">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>  -->
				<tr>
					<td class="small_td"><p><s:message code="onetime.dataLine"/></p></td>
					<td><input type="text" id="DATA_LINE" name="DATA_LINE" maxlength="50"></td>
					<td class="">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.comments"/></p></td>
					<td><input type="text" id="COMMENTS" name="COMMENTS" maxlength="200"></td>
					<td class="">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		</table>
		<h4><s:message code="onetime.furtherAttrbutes"/></h4>
			<table class="onetime_customer_pop" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="onetime.unloadPoint"/></p></td>
				    <td><input type="text" id="UNLD_PT" name="UNLD_PT"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="onetime.vatRegNo"/></p></td>
					<td><input type="text" id="VAT_REG_NO" name="VAT_REG_NO"></td>
					<td class=""></td>
					<td>&nbsp;</td>
				</tr>
		</table>
		<input type="hidden"  name="SHIPEXT"  id="SHIPEXT" />
		<input type="hidden"  name="STREET"  id="STREET" />
		<!------------------->
	</form>
</div>

<script type="text/javascript">

$(function() {
	$('#OneTimeCustomerPopup').dialog({
		title: 'Customer Data Popup', //'<s:message code="onetime.onetimeCust"/>',
		autoOpen: false,
		height:780,
		width:700,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					if( $('#NAME_1ST').val().trim() =='') {
						alert('Name is required input value.');
						$('#NAME_1ST').focus();
						return false;
					}

					if( $('#STREET_NM').val().trim() =='') {
						alert('Street is required input value.');
						$('#STREET_NM').focus();
						return false;
					}

					if( $('#CITY_CD').val().trim() =='') {
						alert('City is required input value.');
						$('#CITY_CD').focus();
						return false;
					}

					if( $('#COUNTRY_CD').val().trim() =='') {
						alert('Country is required input value.');
						$('#COUNTRY_CD').focus();
						return false;
					}
					
					if( $('#POST_CD').val().trim() =='') {
						alert('Postal code is required input value.');
						$('#POST_CD').focus();
						return false;
					}

					if( $('#LANG_CD').val().trim() =='') {
						alert('Language is required input value.');
						$('#LANG_CD').focus();
						return false;
					}
					
// 					if (!checkPostal($('#POST_CD').val().trim(), $('#COUNTRY_CD').val().trim())) {
// 						alert('<s:message code="info.checkpost"/>');
// 						return false;
// 					}
					
					var gridData = [];

					var str2 = ($('#STREET_NM2').val() == '') ? '' : ' ' + $('#STREET_NM2').val();
					var haus = ($('#HAUS_NO').val() == '') ? '' : ' ' + $('#HAUS_NO').val();
					
					$('#STREET').val($('#STREET_NM').val() + str2 + haus);
					
					gridData.push($('#NAME_1ST').val());	//0
					gridData.push($('#NAME_2ND').val());	//1
					gridData.push($('#STREET_NM').val());	//2
					gridData.push($('#HAUS_NO').val());		//3
					gridData.push($('#POST_CD').val());		//4
					gridData.push($('#CITY_CD').val());		//5
					gridData.push($('#COUNTRY_CD').val());	//6
					gridData.push($('#REGION_CD').val());	//7
					gridData.push($('#TIME_ZONE').val());	//8
					gridData.push($('#TRANSP_ZONE').val());	//9
					gridData.push($('#PO_BOX').val());		//10
					gridData.push($('#PO_POST_CD').val());	//11
					gridData.push($('#COMP_POST_CD').val());//12
					gridData.push($('#LANG_CD').val());		//13
					gridData.push($('#TEL_NO').val());		//14
					gridData.push($('#TEL_NO_EXT').val());	//15
					gridData.push($('#MOBILE_NO').val());	//16
					gridData.push($('#FAX_NO').val());		//17
					gridData.push($('#FAX_NO_EXT').val());	//18
					gridData.push($('#E_MAIL').val());		//19
					gridData.push($('#DATA_LINE').val());	//20
					gridData.push($('#COMMENTS').val());	//21
					gridData.push($('#UNLD_PT').val());		//22
					gridData.push($('#VAT_REG_NO').val());	//23
					gridData.push($('#STREET_NM2').val());	//24					
					gridData.push($('#STREET').val());	    //25				
					gridData.push($('#ROW_STATUS').val('U'));	//25
					
					p_rtnData = gridData;
					
					popupClose($(this).data('pid'));
				}
			},
			'Close': {
				
				text: '<s:message code="button.close"/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			
			var newId = $(this).data("NEW");
			
			var elm1 = document.getElementById('TRANSP_ZONE');
			var elm2 = document.getElementById('REGION_CD');

			fn_codeval({type:'COMM',btn_id:'cmm_pop_COUNTRY_CD',head_id:'COUNTRY_CD',code:'COUNTRY_CD', name:'COUNTRY_NM'});
// 			fn_codeval({type:'COMM',btn_id:'cmm_pop_REGION_CD',head_id:'REGION_CD',code:'REGION_CD', name:'REGION_NM'});
// 			fn_codeval({type:'COMM',btn_id:'cmm_pop_TRANSP_ZONE',head_id:'TRANSP_ZONE',code:'TRANSP_ZONE', name:'TRANSP_ZONE_NM'});
			
		
			$('#COUNTRY_CD').on('change', function (e) {
				$("#TRANSP_ZONE").empty();
				
				if('' == $(this).val()){
					$('#TRANSP_ZONE').val('');
					$('#TRANSP_ZONE').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				}else{
					$('#TRANSP_ZONE').removeAttr('disabled');
			
					var param = {
							HEAD_ID: 'TRANSP_ZONE',
							CODE: $(this).val()
						};					
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var value = elm1.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm1.innerHTML = context;
						setTimeout(function() {
							elm1.value = value;
						}, 100);
					});
				}
				
				$("#REGION_CD").empty();
				
				if('' == $(this).val()){
					$('#REGION_CD').val('');
					$('#REGION_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				}else{
					$('#REGION_CD').removeAttr('disabled');
					
					var param = {
							HEAD_ID: 'REGION_CD',
							CODE: $(this).val()
						};	
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var value = elm2.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm2.innerHTML = context;
						setTimeout(function() {
							elm2.value = value;
						}, 100);
					});
				}
							
			});
		
			
			$('#trTimeZone').hide();
			
			var codeBoxArray = ['LANG_CD'];
				
			createCodeBoxByEdit(codeBoxArray, true);
			
			if('Y' == $(this).data("SHIPEXT")){
				clearForm($('#frmOneTimeCustomerPopupHeader'));
				$('#SHIPEXT').val($(this).data("SHIPEXT"));
			}
			console.log('newid == ' + newId);			
			if ( newId == 'NEW' ) {
				// clearForm($('#frmOneTimeCustomerPopupHeader'));				
				$('#frmOneTimeCustomerPopupHeader').reset();
			} else {
				$('#NAME_1ST').val($(this).data("NAME_1ST"));
				$('#NAME_2ND').val($(this).data("NAME_2ND"));
				$('#HAUS_NO').val($(this).data("HAUS_NO"));
				$('#STREET_NM').val($(this).data("STREET_NM"));
				$('#POST_CD').val($(this).data("POST_CD"));
				$('#CITY_CD').val($(this).data("CITY_CD"));
				$('#COUNTRY_CD').val($(this).data("COUNTRY_CD"));
				$('#REGION_CD').val($(this).data("REGION_CD"));
				$('#TIME_ZONE').val($(this).data("TIME_ZONE"));
				$('#TRANSP_ZONE').val($(this).data("TRANSP_ZONE"));
				$('#PO_BOX').val($(this).data("PO_BOX"));
				$('#PO_POST_CD').val($(this).data("PO_POST_CD"));
				$('#COMP_POST_CD').val($(this).data("COMP_POST_CD"));
				$('#LANG_CD').val($(this).data("LANG_CD"));
				$('#TEL_NO').val($(this).data("TEL_NO"));
				$('#TEL_NO_EXT').val($(this).data("TEL_NO_EXT"));
				$('#MOBILE_NO').val($(this).data("MOBILE_NO"));
				$('#FAX_NO').val($(this).data("FAX_NO"));
				$('#FAX_NO_EXT').val($(this).data("FAX_NO_EXT"));
				$('#E_MAIL').val($(this).data("E_MAIL"));
				$('#DATA_LINE').val($(this).data("DATA_LINE"));
				$('#COMMENTS').val($(this).data("COMMENTS"));
				$('#UNLD_PT').val($(this).data("UNLD_PT"));
				$('#VAT_REG_NO').val($(this).data("VAT_REG_NO"));
				$('#STREET_NM2').val($(this).data("STREET_NM2"));
			}
			
			
			
			var emailElms = document.querySelectorAll('[data-validemail]');
			
			Util.validator.applyEmail(emailElms);
			
			$('#COUNTRY_NM').text(getCodeNm('COUNTRY_CD', $('#COUNTRY_CD').val()));
			//$('#TRANSP_ZONE_NM').text(getCodeNm('TRANSP_ZONE', $('#TRANSP_ZONE').val()));\
			if ( newId == 'NEW' ) {
				setRegion($(this).data("COUNTRY_CD"), "");
				setTransZone($(this).data("COUNTRY_CD"), "");
			} else {
				setRegion($(this).data("COUNTRY_CD"), $(this).data("REGION_CD"));
				setTransZone($(this).data("COUNTRY_CD"), $(this).data("TRANSP_ZONE"))
			}			
			// setRegion($(this).data("COUNTRY_CD"), $(this).data("REGION_CD"));
			// setTransZone($(this).data("COUNTRY_CD"), $(this).data("TRANSP_ZONE"));
					
			setTimeout(function() { 
				if('Y' == $('#SHIPEXT').val()){
					var buttons = $('#OneTimeCustomerPopup').dialog('option', 'buttons');
					buttons.Confirm.click.apply($('#OneTimeCustomerPopup'));
				}
			}, 300);
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($('#OneTimeCustomerPopup').data('pid'));
		}	
	});
});

function setTransZone(countryCd, transZoneCd) {
	var elm1 = document.getElementById('TRANSP_ZONE');
	$("#TRANSP_ZONE").empty();
	
	if('' == countryCd){
		$('#TRANSP_ZONE').val('');
		$('#TRANSP_ZONE').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
	}else{
		$('#TRANSP_ZONE').removeAttr('disabled');

		var param = {
				HEAD_ID: 'TRANSP_ZONE',
				CODE: countryCd
			};					
		
		fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
			var value = elm1.value;
			var context = '<option value=""></option>';
			Array.prototype.forEach.call(data.RESULT, function(v) {
				context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
			});
			elm1.innerHTML = context;
			setTimeout(function() {
				elm1.value = transZoneCd;
			}, 100);
		});
	}	
}

function setRegion(countryCd, regionCd) {
	var elm2 = document.getElementById('REGION_CD');
	$("#REGION_CD").empty();
	
	if('' == countryCd){
		$('#REGION_CD').val('');
		$('#REGION_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
	}else{
		$('#REGION_CD').removeAttr('disabled');
		
		var param = {
				HEAD_ID: 'REGION_CD',
				CODE: countryCd
			};	
		
		fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
			var value = elm2.value;
			var context = '<option value=""></option>';
			Array.prototype.forEach.call(data.RESULT, function(v) {
				context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
			});
			elm2.innerHTML = context;
			setTimeout(function() {
				elm2.value = regionCd;
			}, 100);
		});
	}		
}
</script>