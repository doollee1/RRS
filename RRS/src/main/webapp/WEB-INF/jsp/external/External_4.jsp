<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en-US" class="webkit chrome win js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>Resort Reservation System - RRS</title>
	
	<style>
		::-webkit-input-placeholder { /* Chrome */
		  color:#eee;
		}
		:-ms-input-placeholder { /* IE 10+ */
		  color:#eee;
		}
		::-moz-placeholder { /* Firefox 19+ */
		  color:#eee;
		  opacity: 0.5;
		}
		:-moz-placeholder { /* Firefox 4 - 18 */
		  color:#eee;
		  opacity: 0.5;
		}
		#ct_wrap_external {width:980px; marign:0 auto;}
		#ctu_wrap_external {font-family:"TradeGothic LT Bold",Arial,sans-serif !important; width:780px; padding-left:50%; margin-left:-360px; height:100%;overflow-y:auto;overflow-x:hidden;}
		.popbt {font-family:"TradeGothic LT Bold",Arial,sans-serif !important; padding:10px; margin:5px; border-radius:4px; background-color:#009ee3; color:#fff; border:0px;}
		.mypage {font-family:"TradeGothic LT Bold",Arial,sans-serif !important; font-size:16px; padding:10px; margin:5px; border-radius:4px; background-color:#fff; color:#009ee3; border:0px;}
		.order_table tr td {padding:2px 2px 2px 0px; font-size:14px; font-family:verdana; color:#333;}
		.order_table tr {}
		.thankyou_pop_css {z-index:1000;width:100%; height:100%; padding-left:50%; margin-left:-250px; position:fixed; background-color:rgba(0, 0, 0, 0.5);}
		.thankyou_box {z-index:1001; margin-top:7%; width:502px; height:304px; background-color:#009ee3; border:0px solid #ccc; padding:15px; position:absolute;}
		.thankyou_box .title {text-align:center; padding-top:50px; color:#fff; margin-top:-10px; font-size:40px; font-family:'TradeGothic LT Bold',Arial,sans-serif !important;}
		.thankyou_box .text {height:70px; padding-top:50px; color:#fff; font-size:16px;}
		
		.check_pop_css {z-index:1000; width:100%; height:100%; padding-left:50%; margin-left:-250px; position:fixed; background-color:rgba(0, 0, 0, 0.5);}
		.check_pop_box {z-index:1001; margin-top:7%; width:500px; height:auto; background-color:#fff; border:1px solid #ccc; padding:15px; position:absolute;}
		.check_pop_box .title {text-align:center; color:#009ee3; margin-top:-10px;}
		.check_pop_box .text {height:20px; margin-top:-20px; color:#002d51;}
		.check_pop_box .text h4 {color:#002d51;}
		.bos_type select {width:100px;}
		.powerclass select {width:100px;}
		.pcs input[type=text] {font-family:verdana; width:50px; font-size:15px; color: #777; padding: .56em; border: 0; margin: 0;position: relative; display: inline-block; vertical-align: middle; /*margin: 5px;*/ border:1px solid #ccc; border-radius:3px;}
		input[type=text] {font-family:verdana; width:80px; font-size:15px; color: #777; padding: .56em; border: 0; margin: 0;position: relative; display: inline-block; vertical-align: middle; /*margin: 5px;*/ border:1px solid #ccc; border-radius:3px;}
		.date_pik input {width:154px; background: url("/images/calendar_date_bg.png") 0px 0px no-repeat; /*background-size:16px auto; padding-left:23px;*/}
		/*
		@font-face{
			font-family:'FontAwesome';
			src:url('../assets/fonts/fontawesome-webfont.eot?v=4.4.0');
			src:url('../assets/fonts/fontawesome-webfont.eot?#iefix&v=4.4.0') format('embedded-opentype'),
				url('../assets/fonts/fontawesome-webfont.woff2?v=4.4.0') format('woff2'),
				url('../assets/fonts/fontawesome-webfont.woff?v=4.4.0') format('woff'),
				url('../assets/fonts/fontawesome-webfont.ttf?v=4.4.0') format('truetype'),
				url('../assets/fonts/fontawesome-webfont.svg?v=4.4.0#fontawesomeregular') format('svg');
			font-weight:normal;
			font-style:normal;
		}
		*/
		i.fa {text-decoration:none !important;}
		.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;/*font-size:inherit;*/text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}
		.fa-chevron-right:before{content:"\f054"}
		.fa-user:before{content:"\f007"}
		.fa-search:before{content:"\f002"}	
		body{overflow-y:scroll;}
		body, div, dl, dt, dd, ul, ol, li, form, p, button {font-size:9pt; margin:0; padding:0; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
		th {text-align:left; padding:0px;}
		td {padding:0px;}
		textarea {width:87%; line-height:1.6; height:150px; border:1px solid #ccc; border-radius:4px; margin:5px; font-size:14px; font-family:arial; padding:5px;}
		button {border:0px; cursor:pointer;}
		h1 {font-family:"TradeGothic LT Bold";}
		h4 {letter-spacing:normal; margin:0 0 0px 0;}
		#top_wrap2 {width:980px; min-width:980px; height:80px; margin:0 auto;}	
		h4 {color:#009ee3; margin-top:35px; font-size:16px; font-weight:700; font-family:"TradeGothic LT Bold" !important; -webkit-font-family:"TradeGothic LT Bold" !important; -mo-font-family:"TradeGothic LT Bold" !important; -o-font-family:"TradeGothic LT Bold" !important; -ms-font-family:"TradeGothic LT Bold" !important; text-transform:uppercase;}
		/*tab 1*/
			.data_wrap {width:700px;}
			.tab2_left {float:left; width:30%;}
			.left {float:left; width:40%;}
			.left ul {margin-left:15px; margin-top:5px;}		
			.right{float:right; width:40%;}
			.right ul {margin-left:15px; margin-top:5px;}
			.normal {font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; font-size:15px;}
			ul li {font-family:"TradeGothic LT Bold"; font-size:16px; color:#002d51; height:22px; list-style:none; margin-left:-15px;}
			ul li p {float:right; margin-left:-30%; font-size:16px; color:#333;}
			.grid li {float:left; margin:4px 4px 4px 0px;}
			.grid input[type=text] {margin:0px 0px 0px 0px;}
			.grid input {margin:7px 7px 7px 0px;}
			.input_grid ul li {float:left;}
			.clear {clear:both;}
			.grid_button {float:left;}
		/*******/
		/*tab 2*/
		dt {width:100%; font-family:"TradeGothic LT Bold"; font-size:16px; color:#000; height:25px; /*margin-left:-15px;*/}
		dd {float:left; width:50% !important;}
		dd input[type=text] {width:100% !important;}
		.dd_left {float:left;}
		dl {clear:both; width:90%;}
		.td_title {font-family:"TradeGothic LT Bold"; font-size:16px; color:#000; height:25px; margin-left:-15px;}
		label {font-family:"TradeGothic LT Bold"; font-size:16px; color:#002d51; height:25px; /*margin-left:-15px;*/}
		div label {padding-right:10px;}
		table {width:100%;}
		table tr td .title {font-family:"TradeGothic LT Bold"; font-size:16px; color:#002d51; height:25px; /*margin-left:-15px;*/}
		.red {color:red; font-size:16px; font-family:"TradeGothic LT Bold";}
		select {width:150px;}
		.external_shop_button {padding:13px; font-size:16px; font-family:"TradeGothic LT Bold",Arial,sans-serif !important; border-radius:3px; margin-bottom:10px; background-color:#009ee3; color:#fff; border:0px; float:right;}
		.add_button {padding:0px 0px 3px 1px; font-size:16px; background-color:#009ee3; color:#fff; width:22px !important; border:0px; border-radius:50px; font-family:"TradeGothic LT Bold";}
		/*hr.style_two { border: 0;  height: 1px;  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2));}*/
		.delivery_table {/*margin:15px;*/}
		.delivery_table tr td {padding-top:10px !important; padding-bottom:10px;}
		.delivery_table tr td input[type=text] {width:88% !important; margin-top:5px;}	
		/*******/
		
		#tabs2 .matrix_tab2 {transform: matrix(1,0,-0.229,1,0,0); border-radius:15px 0px 0px 0px;}
		#tabs2 ul {padding-bottom:1px; border-bottom:1px solid #ccc; border-top:1px solid #fff; border-left:1px solid #fff; border-right:1px solid #fff; border-radius:3px 3px 0 0 !important; background-color:#fff;}
		#tabs2 li {height:23px !important; margin-top:7px !important;}
		#tabs2 li .ui-icon-close { float:left; margin:4px 3px 0 0; background:transparent url("/images/btn_midclose.png") no-repeat !important; cursor:pointer;}
		
		.external_menutab {width:100%;}
		.table_line_external {}
		.table_line_external tr th:nth-child(1n) {font-family:"TradeGothic LT Bold"; font-size:16px; color:#000;}
		.table_line_external input:read-only {background:#efefef;background-color:#efefef; cursor: not-allowed; -moz-background-color:#efefef; -moz-cursor: not-allowed; -webkit-background-color:#efefef; -webkit-cursor: not-allowed; -ms-background-color:#efefef; -ms-cursor: not-allowed; -o-background-color:#efefef; -o-cursor: not-allowed; border:1px solid #ccc;}
		.table_line_external input:disabled {width:197px; height:17px; margin-right:2px; /*pointer-events:none;*/background:#efefef; background-color:#efefef; cursor: not-allowed; -moz-background-color:#efefef; -moz-cursor: not-allowed; -webkit-background-color:#efefef; -webkit-cursor: not-allowed; -ms-background-color:#efefef; -ms-cursor: not-allowed; -o-background-color:#efefef; -o-cursor: not-allowed; border:1px solid #d4d1be;}
		.table_line_external input[type=checkbox]:disabled{width:15px;}
		.table_line_external input[type=text] {}
		.table_line_external input[type=text]:focus {}
		.table_line_external tr td input[type=checkbox]{height:15px; width:15px;}
		.table_line_external {}
		.table_line_external tr {border-bottom: 1px solid #ddd;}
		.table_line_external .td_text_right{text-align:right;}
		.table_line_external select {width:200px;-webkit-font-family: 'Roboto Mono', monospace;font-family: 'Roboto Mono', monospace;font-size:1.1em;}
		.table_line_external input[type=text]{color:#555; font-family:verdana; font-size:15px;text-align:center; float:left; border:0px; width:90px; height:23px; border-radius:3px; padding-left:5px; margin-right:5px; margin-left:5px;}
		.table_line_external th {}
		.table_line_external tr td .p_clear {clear:both; float:none;}
		.table_line_external tr td p {float:left; margin-top:5px; margin-left:18px; color:darkgray; vertical-align:middle;}
		.table_line_external tr td .box_pb_sign {margin-left:-1px !important;}  
		.table_line_external tr td .grid_input_eur {width:59px !important;}
		.table_line_external tr td {padding:2px;}
		.table_line_external tbody tr td span {color:#ff0000 !important; margin-left:-12px;}
		.external_wave_bl{float:left; margin-left:-2px; padding-left:2px; padding-right:1px;}
		 
		/*.external_btn {float:left;padding:5px 10px; margin-left:5px; background-color:#009ee3; border-radius:4px; color:#fff;}
		.external_btn:hover {float:left;background-color:#007e9f;}
		.externalSearch {cursor:pointer;float:right; margin-top:15px; padding:15px; border:0px solid #ccc; border-radius:5px; background-color:#009ee3; font-failmy:verdana; font-size:1.2em; font-weight:700; color:#fff;}
		.externalSearch:hover {background-color:#007e9f;}
		*/
		.ex_tab_top_search tr td i {color:#009ee3;}
		.ex_tab_top_search {width:100%; padding:5px 7px 5px 7px; margin-top:4px; border-top:1px solid #ddd; border-bottom:1px solid #ddd;}
		.ex_tab_top_search .small_td {font-weight: 700; height:30px;}
		.ex_tab_top_search .medium_td {width:260px;}
		.ex_tab_top_search .2coll_wide_td {max-width:650px;}
		.ex_tab_top_search tbody tr td input {width:127px; height:20px; margin:6px; margin-right:1px; border-radius:3px; -webkit-border-radius:3px; -moz-border-radius:3px; border:1px solid #ccc;}
		.ex_tab_top_search select {width:130px; height:30px; margin:5px; color:#555;}
		.ex_tab_top_search select::before {
					content: "";
					position: absolute;
					top: 50%;
					right: 0;
					transform: translate(-50%, -50%) rotate(90deg) scaleY(1.75);
					color: #3e3e3e;
					background-color:#fff;
					font-size: 28px;
					pointer-events: none;
					z-index: 2;
					transition: all 250ms cubic-bezier(.4,.25,.3,1);
					opacity: .6;
				}
		.ex_tab_top_search select:focus {border:1px solid #009ee3;}
		.ex_tab_top_search .small_td span {color:red; margin-left:-12px;}
		.ex_tab_top_search .small_td p {margin-left:22px;/*18px;*/ font-size:16px; color:#002d51;font-family:"TradeGothic LT Bold" !important;}
		.external_loginfo {float:left; font-weight:700; margin-left:60%; margin-top:35px; font-size:14px; color:#002d51;font-family:"TradeGothic", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif !important;}
		.external_loginfo_id {margin-top:35px; margin-left:10px; float:left;}
		.external_loginfo i {color:#009ee3; margin-right:5px;}
		.external_table_d {width:1600px; margin-top:15px; border-top:1px solid #ccc; border-collapse:collapse;border-spacing:0;}
		.external_table_d tr {border-bottom:1px solid #ccc;}
		.external_table_d tr td{padding:15px 20px 15px 0px ; font-size:14px !important; height:25px; /*border-right:1px solid #ddd;*/}
		.external_table_d th {padding:10px 20px 10px 0px; text-align:left; font-size:16px; font-weight:700; font-family:"TradeGothic LT Bold" !important; /*background-color:#e8f2fe;*/   /*border-right:1px solid #ddd;*/ height:25px; /*border-top:1px solid #ccc;*/} 
		.external_table_d td:nth-child(n) {font-size:12px; font-weight:500; color:#555;}
		.external_table_d td:first-of-type {color:#009ee3; font-size:16px !important; font-weight:700; font-family:"TradeGothic LT Bold" !important;}
		
		/* external Style the tab */
		.tab2 {
		    overflow: hidden;
		    border-bottom: 1px solid #ddd;
		    border-top:1px solid #fff;
		    border-right:1px solid #fff;
		    border-left:1px solid #fff;
		    background-color: #fff;
		}
		
		.tab2 button {
		    background-color: #fff; /*inherit;*/
		    float: left;
		    border: none;
		    outline: none;
		    cursor: pointer;
		    padding: 8px 30px 17px 30px;
		    transition: 0.3s;
		    font-size: 15px;
		    color:#009ee3;/*#009ee3*/
		    font-weight:700;
		    font-family:"TradeGothic LT Bold" !important;
		    text-transform:uppercase;
		}
		
		.tab2 button:hover {
		   color:#002d51;
		}
		
		.tab2 button.active {
		    background-color: #fff;
		    color:#002d51;
		}
		
		/* Style the tab content */
		.tab2content {
		    display: none;
		    padding: 0px 7px;
		    border: 0px solid #ccc;
		    border-top: none;
		}
		
	/*	.big {
		  font-size: 1.2em;
		}
		
		.square {
		  width: .7em;
		  height: .7em;
		  margin: .5em;
		  display: inline-block;
		}
	*/	
	
		/* Custom date image */
		.custom-date {
		position: relative;
		display: inline-block;
		vertical-align: middle;
		margin: 0px;
		border:1px solid #ccc;
		border-radius:3px;
		height:35px !important;	 
		}
		
	
		/* Custom dropdown */
		.custom-dropdown {
		position: relative;
		display: inline-block;
		vertical-align: middle;
		margin: 0px;
		border:1px solid #ccc;
		border-radius:3px;
		height:35px !important;	 
		}
		
		.custom-dropdown select {
		color: #777;
		padding: .5em;
		border: 0;
		margin: 0;
		border-radius: 3px;
		text-indent: 0.01px;
		text-overflow: '';
		-webkit-appearance: button;
		font-size:15px;
		}
		
		.custom-dropdown::before,
		.custom-dropdown::after {
		content: "";
		position: absolute;
		pointer-events: none;
		}
		
		.custom-dropdown::after {
		content: "\25BC";
		height: 1em;
		/*font-size: .625em;*/
		line-height: 1;
		right: 1.2em;
		top: 50%;
		margin-top: -.5em;
		color:#009ee3;
		 
		}
		
		.custom-dropdown::before {
		width: 3em;
		right: 0;
		top: 0;
		bottom: 0;
		border-radius: 0 3px 3px 0;
		}
		
		.custom-dropdown select[disabled] {
		color: rgba(0,0,0,.3);
		}
		
		.custom-dropdown select[disabled]::after {
		color: rgba(0,0,0,.1);
		}
		
		.custom-dropdown::before {
		background-color: #fff;
		}
		
		.custom-dropdown::after {
		}	
	</style>
</head>
<body>

<!-- popup design / thank you -->
	<div id="thankyou_popup" class="thankyou_pop_css" style="display:none;">
		<div class="thankyou_box">
			<div class="title"><span>Thank you</span></div>
			<div class="text"><span><center>Please refer to the button below for more details.</center></div>
			<div style="margin:0 auto;"><center><input class="mypage" type="button" value="Current Sales Order"></input></center></div>
		</div>
	</div>	
<!-- -- -->

<!-- popup design / check your order -->
	<div id="check_popup" class="check_pop_css" style="display:none;">
		<div class="check_pop_box">
			<div class="title"><h1><span>Check your Order</span></h1></div>
			<div class="text"><h4>Product</h4></div>
			<div>
				<table class="order_table">
					<tr>
						<td>Q.PEAK DUO</td>
						<td>320</td>
						<td>960 PCS</td>
						<td>0.307 MW</td>
						<td>000 €</td>						
					</tr>
					<tr>
						<td>ESS</td>
						<td></td>
						<td>5PCS</td>
						<td></td>
						<td>000 €</td>						
					</tr>
					<tr>
						<td>Inverter</td>
						<td></td>
						<td>10PCS</td>
						<td></td>
						<td>000 €</td>						
					</tr>
					<tr>
						<td>Q.Flat</td>
						<td></td>
						<td></td>
						<td>500 KW</td>
						<td>000 €</td>						
					</tr>
					<tr>
						<td>Total</td>
						<td></td>
						<td></td>
						<td>00,000 €</td>
					</tr>
				</table>
			</div>
			<div class="text"><h4>Address</h4></div>
			<div>
				<table class="order_table">
					<tr>
						<td>address address city country number street</td>
					</tr>
				</table>
				
			</div>
			<div style="float:right;"><input id="orderback" class="popbt" type="button" value="back"></input><input id="ordersummit" class="popbt" type="button" value="Submit"></input></div>
		</div>
	</div>
<!-- ---- -->

	<div id="top_wrap2">
		<div style="float:left;">
			<!--<img src="/images/external_logo.png">-->
			<img src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAKUAAABNCAIAAABIXjNiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowYzM2YzE0Ni0wMTA2LWU3NGQtOGUxZS02YTdlNzcxN2Y3Y2IiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OUEwNTEyODEyQjcwMTFFOEJGMkZFNjA0RDVDQ0I4MjQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OUEwNTEyODAyQjcwMTFFOEJGMkZFNjA0RDVDQ0I4MjQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmIzNGYwMTUzLTJhYjItNjY0NS1hOGM3LTYyOTFmNWE2OTFjNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowYzM2YzE0Ni0wMTA2LWU3NGQtOGUxZS02YTdlNzcxN2Y3Y2IiLz4gPC9y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">
		</div>
		<div>
			<div class="external_loginfo"><i class="fa fa-user" style="float:left;"></i>Partner ID</div><div class="external_loginfo_id">10018960</div>				
		</div>
		</div>
	<!--  tab start -->
	<div style="height:10px; background-image: linear-gradient(to bottom, #f5f5f5 0%, #fff 100%);"></div>
	<div class="external_menutab">
	<div class="tab2">
	  <div style="width:768px; margin:0 auto;">
	  	<button class="tab2links" onclick="openTab(event, 'generaldata_tab')">General Information</button>
	  	<button class="tab2links" onclick="openTab(event, 'shop_tab')">New Order</button>
	  	<button class="tab2links" onclick="openTab(event, 'orders_tab')">Your Orders</button>
	  	<button class="tab2links" onclick="openTab(event, 'quotations_tab')">Quotations</button>
	  	<button class="tab2links" onclick="openTab(event, 'invoices_tab')">Invoices</button>
	  </div>
	</div>
	</div>
	<div id="ctu_wrap_external">
	<div id="generaldata_tab" class="tab2content">
	  <!----- tab 1 ----->
				<div id="general_information_tab">
					<div class="data_wrap">
						<div class="left">
							<div>
								<div style="float:left;">
									<h4>Account</h4></div>
								<div><span style="float:right; margin-top:38px;">this year ></span></div>
								<p class="clear">
								<ul>
									<li>Customer ID<p>17456</p></li>
									<li>Revenue<p>125.201,02 EUR</p></li>
									<li>Volume<p>345.301 KW</p></li>
									<li></li>
									<li>Target volume<p>1.000.000 KW</p></li>
									<li>Target achivement<p>138%</p></li>
									<li>Target bonus<p>1,5%</p></li>
									<li></li>
								</ul>
							</div>
							<div>
								<h4>Payment</h4>
								<ul>
									<li>Open<p>25.201,00 EUR</p></li>
									<li>Payment overdue<p>0.00 EUR</p></li>
									<li>Free Limit<p>0.00 EUR</p></li>
									<li></li>
								</ul>
							</div>
							<div>
								<div style="float:left;">
									<h4><span onclick="openTab(event, 'quotations_tab')" style="cursor:pointer;"> Quotations </span> ></h4>
								</div>
								<div><span style="float:right; margin-top:38px;">this year ></span></div>
								<p class="clear">								
								<ul>
									<li>Completed<p id='QT_COMPLETED'>12</p></li>
									<li>Open<p id='QT_OPEN'>01</p></li>
									<li>Canceled<p>0</p></li>
								</ul>
							</div>
							<div>
								<div style="float:left;">
									<h4><span onclick="openTab(event, 'orders_tab')" style="cursor:pointer;"> Orders </span> ></h4>
								</div>
								<div><span style="float:right; margin-top:38px;">this year ></span></div>
								<p class="clear">
								<ul>
									<li>Completed<p id='SD_COMPLETED'>12</p></li>
									<li>Open<p id ='SD_OPEN'>01</p></li>
									<li>Canceled<p>0</p></li>
								</ul>
							</div>
							<!-- -  <div>
								<h4><span onclick="openTab(event, 'invoices_tab')" style="cursor:pointer;"> Invoices </span> ></h4>
								<ul>
									<li>Completed<p>12</p></li>
									<li>Open<p>0</p></li>
									<li>Canceled<p>0</p></li>									
								</ul>
							</div>
							-->
						</div>
						
						<div class="right">
							<div>
								<h4>Invoice Address</h4>
								<ul>
									<li id='CUST_NM'>Solar Company</li>
									<li id='HAUS_NO' class="normal">John Doe</li>
									<li id='STREET_NM' class="normal">Sunroad 1</li>
									<li id='CITY_NM' class="normal">01234 Suncity</li>
									<li id='REGION' class="normal">Suncountry</li>
									<li id='COUNTRY' class="normal">Suncountry</li>
									<li class="normal"></li>
									<li class="normal">VAT No.<p id='VAT_REG_NO'>DE12345</p></li>
								</ul>
							</div>
							<!-- -<div>
								<h4>Bank Account</h4>
								<ul>
									<li>XY BANK</li>
									<li class="normal">IBAN<p>DE90 9000000000</p></li>
									<li class="normal">BIC<p>INGDEFFXX</p></li>
									<li></li>
								</ul>
							</div>
						 	-->	
							<div>
								<h4>Contact Person</h4>
								<ul>
									<li id='P_DEPT_NM'>Purchasing</li>
									<li id='P_FULL_NM' class="normal"></li>
									<li class="normal">Tel.:<p id='P_TELL'></p></li>
									<li class="normal">E-Mail:<p id='P_EMAIL'></p></li>
									<li></li>
								</ul>
							</div>
							<div>
								<ul>
									<li id='S_DEPT_NM'>Sales</li>
									<li id='S_FULL_NM' class="normal"></li>
									<li class="normal">Tel.:<p id='S_TELL'></p></li>
									<li class="normal">E-Mail:<p id='S_EMAIL'></p></li>
									<li></li>
								</ul>
							</div>
							<!-- <div>
								<ul>
									<li id='F_DEPT_NM'>Financial</li>
									<li id='F_FULL_NM' class="normal"></li>
									<li class="normal">Tel.:<p id='F_TELL'></p></li>
									<li class="normal">E-Mail:<p id='F_EMAIL'></p></li>
									<li></li>
								</ul>
							</div>
						 -->	
						</div>
					</div>				
				</div>
			</div>		
	<div id="shop_tab" class="tab2content">
		<!----- tab 2 ----->
				<div id="shop_tab">

				  	<div class="grid module" style="margin:35px 0px 0px 0px;">
				  		<ul class="line">
			  						<li style="width:282px;">Project name (P/O No.)</li>
									<li style="width:282px;">Country</li>				  					
									<li>Delivery Date</li>
								</ul>
						<div class="item">
								<p class="clear">
							<!-- - -->
			  					<ul class="line">
									<li>
										<input type="text" data-submit="PRO_NM" style="width:268px !important;"></input>
				  					</li>				  					
									<li class="powerclass custom-dropdown">
							  			<select style="width:273px !important;">
								  			<option>Q.PEAK DUO BLK</option>
								  			<option>Q.PEAK</option>
							  			</select>
									</li>									
									<li class="date_pik"><input type="text"></input></li>									
								</ul>
						</div>		
				  	</div>
				  	
				  	
				  	
				  	<p class="clear">
<!-- 				  	<hr class="style_two"> -->
			  		<!-- Module -->
			  		<h4 class="external_h4"  style="margin-top:10px !important;">Module</h4>
					<!-- module line title -->
			  		<div class="grid module">
			  					<ul class="line" style="margin-top:5px;">
			  						<li style="width:182px;">Product</li>
									<li style="width:103px;">Power Class</li>				  					
									<li style="width:68px;">PCS</li>
									<li style="width:97px">MW</li>
									<li style="width:100px">Price</li>	
									<li style="width:150px">Request Delivery Date</li>									
								</ul>
						<div class="item">
								<p class="clear">
							<!-- - -->
								<span class="grid_button"><input type="button" class="add_button" value="-"></span>
			  					<ul class="line">
									<li class="custom-dropdown">
										<select data-itemsubmit="PROUCT">
					  						<option>Q.PEAK DUO BLK</option>
					  						<option>Q.PEAK</option>
				  						</select>
				  					</li>				  					
									<li class="powerclass custom-dropdown">
										<select>
					  						<option>310</option>
					  						<option>320</option>
				  						</select>
									</li>
									<li class="pcs"><input type="text"></input></li>
									<li><input type="text"></input></li>
									<li><input type="text" placeholder="0,00"></input></li>
									<li class="date_pik"><input type="text"></input></li>									
								</ul>
						</div>
								<p class="clear">
							<!-- - -->
								<span class="grid_button"><input type="button" class="add_button" value="-"></span>
								<ul class="line">
									<li class="custom-dropdown">
										<select>
					  						<option>Q.PEAK DUO BLK</option>
					  						<option>Q.PEAK</option>
				  						</select>
				  					</li>				  					
									<li class="powerclass custom-dropdown">
										<select>
					  						<option>310</option>
					  						<option>320</option>
				  						</select>
									</li>
									<li class="pcs"><input type="text"></input></li>
									<li><input type="text"></input></li>
									<li><input type="text" placeholder="0,00"></input></li>
									<li class="date_pik"><input type="text"></input></li>									
								</ul>
								<p class="clear">
							<!-- - -->
								<span class="grid_button"><input type="button" class="add_button" value="-"></span>
								<ul class="line">
									<li class="custom-dropdown">
										<select>
					  						<option>Q.PEAK DUO BLK</option>
					  						<option>Q.PEAK</option>
				  						</select>
				  					</li>				  					
									<li class="powerclass custom-dropdown">
										<select>
											<option>310</option>
					  						<option>320</option>
				  						</select>
									</li>
									<li class="pcs"><input type="text"></input></li>
									<li><input type="text"></input></li>
									<li><input type="text" placeholder="0,00"></input></li>
									<li class="date_pik"><input type="text"></input></li>									
								</ul>
								<p class="clear">
							<!-- - -->
								<span><input type="button" class="add_button" value="+"></span>
								<ul>
									<li></li>
								</ul>
			  		</div>		  		
			  		<!-- /// -->
			  		<!-- Module end -->
			  		<!-- BOS -->
			  		<h4 class="external_h4">BOS</h4>
			  			<div class="grid" >
			  					<ul class="line" style="margin-top:5px;">
			  						<li style="width:133px;">Type</li>				  					
			  						<li style="width:282px;">Product</li>
									<li style="width:68px;">PCS</li>
									<li style="width:150px">Requset Delivery Date</li>								
								</ul>
								<p class="clear">
							<!-- - -->
								<span class="grid_button"><input type="button" class="add_button" value="-"></span>
								<ul class="line">
			  					<li class="bos_type custom-dropdown">
										<select>
					  						<option>310</option>
					  						<option>320</option>
				  						</select>
									</li>
									<li class="custom-dropdown">
										<select style="width:280px;">
					  						<option>Q.PEAK DUO BLK</option>
					  						<option>Q.PEAK</option>
				  						</select>
				  					</li>
									<li class="pcs"><input type="text"></input></li>
									<li class="date_pik"><input type="text"></input></li>
								</ul>
								<p class="clear">
							<!-- - -->
								<span class="grid_button"><input type="button" class="add_button" value="-"></span>
								<ul class="line">
								<li class="bos_type custom-dropdown">
										<select>
					  						<option>310</option>
					  						<option>320</option>
				  						</select>
									</li>
									<li class="custom-dropdown">
										<select style="width:280px;">
					  						<option>Q.PEAK DUO BLK</option>
					  						<option>Q.PEAK</option>
				  						</select>
				  					</li>
									<li class="pcs"><input type="text"></input></li>
									<li class="date_pik"><input type="text"></input></li>								
								</ul>
								<p class="clear">
								<!-- --->	
								<span><input type="button" class="add_button" value="+"></span>
								<ul>
									<li></li>
								</ul>										
			  		</div>		  			
			  			<!-- BOS end -->			  			
						<!-- Delivery Information -->
						<h4 class="external_h4">Delivery Information</h4>
						<div style="margin-top:10px; margin-bottom:20px;">
							<label><input type="radio" name="RadioGroup1" value="radio" id="RadioGroup1_0" checked>Delivery</label>
							<label><input type="radio" name="RadioGroup1" value="radio" id="RadioGroup1_1">Pick-up</label>
						</div>
						<div id="" > <!-- pickup 선택시 hideen -->
							<div class="left" style="width:50%;">
								<div>
									<input type="checkbox"><label>Unload equip</label>
								</div>
								<!-- checkbox 선택시에 textarea 보이게 -->
								<div  id="" class="textarea"  style="float:left; width:100%;">
									<textarea velue="Shipping Remarks" disabled="disabled"></textarea>
								</div>
							</div>	
							<!-- --- -->
							<div>
								<label>Payment Term</label><br>
								<div class="custom-dropdown" style="margin-top:5px;">
									<select data-selectbox="TERM_PAY_CD" style="width:355px;">
					  				</select>
				  				</div>
							</div>
							<!-- Delivery 선택시 -->
								
							<p class="clear">
								<div>
									<label>ship-to</label><br>
									<div class="custom-dropdown" style="margin-top:5px; width:96%;">
										<select style="width:100%;">
						  				</select>
					  				</div>
								</div>
								<table class="delivery_table">
									<tr>
										<td>
											<div style="margin-top:15px;">
											<label>Company Name</label><br><input type="text" style="width:240px; margin-top:7px;"></input>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="title">First Name</span><span class="red"> *</span><br><input type="text"/></td>
										<td><span class="title">Sub Name</span><span class="red"> *</span><br><input type="text"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title">Street / House Number</span><span class="red"> *</span><br><input type="text" style="width:94% !important;"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title">Address / Company / c/o</span><br><input type="text" style="width:94% !important;"/></td>
									</tr>
									<tr>
										<td><span class="title">Postcode</span><span class="red"> *</span><br><input type="text"/></td>
										<td><span class="title">place</span><span class="red"> *</span><br><input type="text"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title">Country</span><span class="red"> *</span><br><input type="text" style="width:94% !important;"/></td>
									</tr>
								</table>
							</div>	
							<div style="margin-top:15px;">
								<label>Remarks</label><input type="text" style="width:94%; margin-top:5px;"></input>
							</div>
							<div style="margin:30px;">
								<input type="button" class="external_shop_button" value="Apply">
							</div>							
						<!-- 공통 deliver. pick-up 모두 -->						
						<!-- /// -->						  					
				</div>
		</div>	
	<div id="orders_tab" class="tab2content">
	<!----- tab 3 ----->
				<div id="order_tab">				
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2">	
							 <h4 class="external_h4">Sales Order List</h4>
						</div>
					</div>
					<div style="overflow-x:auto;">
						<table class="external_table_d salesOrder_table" >
				  		</table>
				  	</div>	
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2">
	          			</div>
	          			
	          		</div>	
			    <p>&nbsp;</p>				          		
	          	</div>	
		</div>		
			<div id="quotations_tab" class="tab2content">
				<!----- tab 4 ----->
				<div id="quotations_tab">	          	
					<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
						<div class="ct_grid_top_wrap2">
							<div class="ct_grid_top_left2"> <h4 class="external_h4">Quotation List</h4></div>
							<div class="ct_grid_top_right2"></div>
						</div>
						<div style="overflow-x:auto;">
							<table class="external_table_d quotaion_table" width="100%">
					  		</table>
						</div>						
						<div class="ct_grid_top_wrap2">
							<div class="ct_grid_top_left2"> </div>
							<div class="ct_grid_top_right2">
							 								
							</div>
						</div>
					</div>
				</div>     
			</div>
		<!--  tab end -->		
		<div id="invoices_tab" class="tab2content">
				<!----- tab 5 ----->
				<div id="invoices_tab">
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"> <h4 class="external_h4">Invoice List</h4></div>
						<div class="ct_grid_top_right2"></div>
					</div>        	
					<div style="overflow-x:auto;">
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
				  	</div>
				</div>	
				<div class="ct_grid_top_wrap2">
						 <div class="ct_grid_top_left2"></div>
							<div class="ct_grid_top_right2">
							 								
						</div>
					</div>
				</div>
			</div>     
		</div>
		<!--  tab end -->
	</div>
</div>

<script>
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
			var event = document.createEvent('Event');
			event.initEvent('click', false, true);
			elm.dispatchEvent(event);
		}, 500);
		
		var externalMap = ${externalMap};
		var token = "${token}";
		
		function init() {
			
		}
		
		function bindEvent() {
			// check popup open event
			var checkPopup = document.getElementById('check_popup');
			var applyBtn = document.querySelector('.external_shop_button');
			applyBtn.addEventListener('click', function(e) {
				checkPopup.style.display = 'block';
			});
			
			// check popup close event
			var orderbackBtn = document.getElementById('orderback');
			orderbackBtn.addEventListener('click', function(e) {
				checkPopup.style.display = 'none';
			});
			
			// submit event
			document.getElementById('ordersummit').addEventListener('click', function(e) {
				var xhr = new XMLHttpRequest();
				//xhr.open('POST', 'https://oms.q-cells.com/api/sales/quotations');
				//xhr.open('POST', 'https://omsdev.q-cells.com/api/sales/quotations');
				xhr.open('POST', 'http://localhost:8080/api/sales/quotations');
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader('Authorization', 'Bearer ' + token);
				
				
				var orderData = {};
				var submitElms = document.querySelectorAll('[data-submit]');
				Array.prototype.forEach.call(submitElms, function(elm) {
					orderData[elm.dataset.submit] = elm.value;
				});
				
				
				var moduleElms = document.querySelectorAll('.module .item');
				var moduleList = [];
				Array.prototype.forEach.call(moduleElms, function(elm) {
					var item = {};
					var itemElms = elm.querySelectorAll('[data-itemsubmit]');
					Array.prototype.forEach.call(itemElms, function(itemElm) {
						item[itemElm.dataset.itemsubmit] = itemElm.value;
					});
					moduleList.push(item);
				});
				orderData.moduleList = moduleList;
				
				
				xhr.send(JSON.stringify(orderData));
				xhr.onreadystatechange = function() {
					if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
						alert('hello world');
					}
				};
			});
		}
		
		function drawCombobox() {
			var comboElms = document.querySelectorAll('[data-selectbox]');
			var codeList = externalMap.codeList;
			
			var codeMap = {};
			Array.prototype.forEach.call(codeList, function(v) {
				if (!codeMap[v.HEAD_ID]) {
					codeMap[v.HEAD_ID] = [];
				}
				codeMap[v.HEAD_ID].push(v);
			});
			
			Array.prototype.forEach.call(comboElms, function(elm) {
				var options = codeMap[elm.dataset.selectbox];
				var context = '';
				options.forEach(function(v) {
					context += '<option value="' + v.CODE + '" >' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
			});
		}
		
		function drawGerenalInfo() {
			/* OrderProcess */
			document.getElementById('QT_OPEN').textContent = externalMap.orderProcess.QT_OPEN;
			document.getElementById('QT_COMPLETED').textContent = externalMap.orderProcess.QT_COMPLETED;
			document.getElementById('SD_OPEN').textContent = externalMap.orderProcess.SD_OPEN;
			document.getElementById('SD_COMPLETED').textContent = externalMap.orderProcess.SD_COMPLETED;
			
			/* InvoiceAddr */
			document.getElementById('CUST_NM').textContent = externalMap.invoceAddr.CUST_NM;
			document.getElementById('HAUS_NO').textContent = externalMap.invoceAddr.HAUS_NO;
			document.getElementById('STREET_NM').textContent = externalMap.invoceAddr.STREET_NM;
			document.getElementById('CITY_NM').textContent = externalMap.invoceAddr.CITY_NM;
			document.getElementById('REGION').textContent = externalMap.invoceAddr.REGION;
			document.getElementById('COUNTRY').textContent = externalMap.invoceAddr.COUNTRY;
			document.getElementById('VAT_REG_NO').textContent = externalMap.invoceAddr.VAT_REG_NO;
			
			/* ContactPerson */
			console.log(externalMap.ContactPerson);
			Array.prototype.forEach.call(externalMap.ContactPerson, function(v) {
				if(v.DEPT_CD == '0002'){
					document.getElementById('P_DEPT_NM').textContent = v.DEPT_NM;
					document.getElementById('P_FULL_NM').textContent = v.FULL_NM;
					document.getElementById('P_TELL').textContent = v.TEL;
					document.getElementById('P_EMAIL').textContent = v.E_MAIL;
				}else if(v.DEPT_CD == '0003'){
					document.getElementById('S_DEPT_NM').textContent = v.DEPT_NM;
					document.getElementById('S_FULL_NM').textContent = v.FULL_NM;
					document.getElementById('S_TELL').textContent = v.TEL;
					document.getElementById('S_EMAIL').textContent = v.E_MAIL;
				}else if(v.DEPT_CD == '0009'){
					document.getElementById('F_DEPT_NM').textContent = v.DEPT_NM;
					document.getElementById('F_FULL_NM').textContent = v.FULL_NM;
					document.getElementById('F_TELL').textContent = v.TEL;
					document.getElementById('F_EMAIL').textContent = v.E_MAIL;
				}
			});
		}

		function drawQuotationList() {
			var quotaionTable = document.querySelector('.quotaion_table');
			
			var context = '<tr><th>Quotation No</th><th>Item</th><th>Material</th><th>Description</th><th>Quantity</th><th>Order Unit</th><th>Day Type</th><th>Delivery Date</th><th>Net Price</th><th>Net Value</th><th>Currency</th><th>Over all Status</th><th>Sales Order No</th><th>S/O Item</th><th>FIX Date & QTY</th></tr>';
			Array.prototype.forEach.call(externalMap.qutationList, function(v) {
				context += '<tr>';
				context += '<td>' + v.DOC_NO + '</td>';
				context += '<td>' + v.ITEM_SEQ + '</td>';
				context += '<td>' + v.MATL_CD + '</td>';
				context += '<td>' + v.MATL_DESC + '</td>';
				context += '<td>' + v.ORD_QTY + '</td>';
				context += '<td>' + v.ORD_UNIT_CD + '</td>';
				context += '<td>' + v.DELI_TP + '</td>';
				context += '<td>' + v.DELI_DT + '</td>';
				context += '<td>' + v.NET_PRICE + '</td>';
				context += '<td>' + v.NET_VAL + '</td>';				
				context += '<td>' + v.NET_CURR_CD + '</td>';
				context += '<td>' + v.OVL_STS + '</td>';
				context += '<td>' + v.QT_NO + '</td>';
				context += '<td>' + ''+ '</td>';
				context += '<td>' + v.FIX_DT_QTY_YN + '</td>';
				context += '</tr>';
			});
			
			quotaionTable.innerHTML = context;
		}
		
		function drawSalesOrderList() {
			var salesOrderTable = document.querySelector('.salesOrder_table');
			
			var context = '<tr><th>Status</th><th>Sales Order No</th><th>Item</th><th>Material</th><th>Description</th>';
			    context +='<th>Quantity</th><th>Order Unit</th><th>Day Type</th><th>Delivery Date</th><th>Net Price</th>';
  				context +='<th>Net Value</th><th>Currency</th><th>Over all Status</th><th>Quotation No</th><th>Quotation Item</th>';
  				context +='<th>FIX Date & QTY</th><th>Allocated Qty</th><th>External Reference</th></tr>';
			Array.prototype.forEach.call(externalMap.salesOrderList, function(v) {
				
				context += '<tr>';
				context += '<td>' + v.OVL_DVL_STS + '</td>';
				context += '<td>' + v.DOC_NO + '</td>';
				context += '<td>' + v.ITEM_SEQ + '</td>';
				context += '<td>' + v.MATL_CD + '</td>';
				context += '<td>' + v.MATL_DESC + '</td>';
				context += '<td>' + v.ORD_QTY + '</td>';
				context += '<td>' + v.ORD_UNIT_CD + '</td>';
				context += '<td>' + v.DELI_TP + '</td>';
				context += '<td>' + v.DELI_DT + '</td>';
				context += '<td>' + v.NET_PRICE + '</td>';
				context += '<td>' + v.NET_VAL + '</td>';				
				context += '<td>' + v.NET_CURR_CD + '</td>';
				context += '<td>' + v.OVL_STS + '</td>';
				context += '<td>' + v.SO_NO + '</td>';
				context += '<td>' + ''+ '</td>';
				context += '<td>' + v.FIX_DT_QTY_YN + '</td>';
				context += '<td>' + ''+ '</td>';
				context += '<td>' + ''+ '</td>';
				context += '</tr>';
			});
			
			salesOrderTable.innerHTML = context;
		}
		
		//////////////////////////////////////////////////////////////
		init();
		bindEvent();
		drawCombobox();
		drawGerenalInfo();
		drawQuotationList();
		drawSalesOrderList();
		
	}());
</script> 
	
</body>
</html>
