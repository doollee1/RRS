﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en-US" class="webkit chrome win js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>Resort Reservation System - RRS</title>

	<link href="https://oms.q-cells.com/css/jquery/jquery.datetimepicker.css" rel="stylesheet" />
	<link href="https://oms.q-cells.com/css/jquery/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://oms.q-cells.com/js/jquery/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="https://oms.q-cells.com/js/jquery/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://oms.q-cells.com/js/common.js" ></script>  	
	
<style>
	
		::selection {background:#b3d4fc; text-shadow:none;}
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
		
	/* 	@font-face{
			font-family:'TradeGothic';
			src:url('../assets/fonts/lte50537.ttf');
		} */
		
		/*** jq js ?? shim-ext.css !important Style  ***/
		
		.ws-popover-opener {color:#0099e3 !important;}
		.ws-popover-opener {background:#fff !important; margin:0px !important;}
		.ws-range, .ws-range-rail, .ws-range span > span, .input-buttons, .step-controls, .ws-popover-opener, .step-control {background-color:#fff !importatnt;}
		
		/******/
		
		#ct_wrap_external {width:980px; marign:0 auto;}
		#ctu_wrap_external {font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; width:1030px; padding-left:50%; margin-left:-500px; height:100%;overflow-y:auto;overflow-x:hidden;}
		.popbt {font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; padding:10px; margin:5px; border-radius:4px; background-color:#009ee3; color:#fff; border:0px;}
		.mypage {font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-size:16px; padding:10px; margin:5px; border-radius:4px; background-color:#fff; color:#009ee3; border:0px;}
		.order_table tr td {padding:2px 2px 2px 0px; font-size:14px; font-family:verdana; color:#333;}
		.order_table tr {}
		.thankyou_pop_css {z-index:1000;width:100%; height:100%; padding-left:50%; margin-left:-250px; position:fixed; background-color:rgba(0, 0, 0, 0.5);}
		.thankyou_box {z-index:1001; margin-top:7%; width:502px; height:304px; background-color:#009ee3; border:0px solid #ccc; padding:15px; position:absolute;}
		.thankyou_box .title {text-align:center; padding-top:50px; color:#fff; margin-top:-10px; font-size:40px; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:'TradeGothic',Arial,sans-serif !important;}
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
		.date_pik input {width:154px; background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAAAlCAIAAAC/Lv6hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoxODc5ZWQ4Mi03ZDliLTRlNDAtODZiMS01OWViZjA1NzEyZDUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RERERjI2NTE0OUZDMTFFODhCQkFCRDRGNkQ1RjM4Q0UiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RERERjI2NTA0OUZDMTFFODhCQkFCRDRGNkQ1RjM4Q0UiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTggKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NmJlYzY4YWItMGJiZi0xOTRmLTg2MzEtZjRlYTE1Mzg3MDIyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjE4NzllZDgyLTdkOWItNGU0MC04NmIxLTU5ZWJmMDU3MTJkNSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuCFlVoAAACrSURBVHja7NrBCYAwEERRI5ZhfRZlfbYhUchFCIb1ur5/inuMn5kEUmqtE37PbAvAA/AAPAAPwAPwADwAD8ADBFlsQQ7KfrRF3da3iTz4Bf3/jhggD7IlQfe5PCdjJ+RB5oBwThQMN2c34UH2k0GL/cGCBwhkifdI6eogepuQB3qBB9ALekEe6AW9AL2gFyK9wAPoBfAAPAAPwAPwADwAD8AD8AA8wFcuAQYASJJQUf2wS7gAAAAASUVORK5CYII=) 0px 0px no-repeat; /*background-size:16px auto; padding-left:23px;*/}
		input[type=date] {width:154px; background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAAAlCAIAAAC/Lv6hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoxODc5ZWQ4Mi03ZDliLTRlNDAtODZiMS01OWViZjA1NzEyZDUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RERERjI2NTE0OUZDMTFFODhCQkFCRDRGNkQ1RjM4Q0UiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RERERjI2NTA0OUZDMTFFODhCQkFCRDRGNkQ1RjM4Q0UiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTggKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NmJlYzY4YWItMGJiZi0xOTRmLTg2MzEtZjRlYTE1Mzg3MDIyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjE4NzllZDgyLTdkOWItNGU0MC04NmIxLTU5ZWJmMDU3MTJkNSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuCFlVoAAACrSURBVHja7NrBCYAwEERRI5ZhfRZlfbYhUchFCIb1ur5/inuMn5kEUmqtE37PbAvAA/AAPAAPwAPwADwAD8ADBFlsQQ7KfrRF3da3iTz4Bf3/jhggD7IlQfe5PCdjJ+RB5oBwThQMN2c34UH2k0GL/cGCBwhkifdI6eogepuQB3qBB9ALekEe6AW9AL2gFyK9wAPoBfAAPAAPwAPwADwAD8AD8AA8wFcuAQYASJJQUf2wS7gAAAAASUVORK5CYII=) 0px 0px no-repeat;}
		input[type=date] {margin:0px !important; font-family:verdana; width:154px; font-size:15px; color: #777; padding: .56em; border: 0; margin: 0;position: relative; display: inline-block; vertical-align: middle; border:1px solid #ccc; border-radius:3px;}
		input[type=button] {cursor:pointer;}
		input[type=button]:hover {cursor:pointer; background-color:#00729f;}
		
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
		
		@font-face
		{
			font-family:"TradeGothic";
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/413d9688-00d4-47c4-bb55-656a0cd396e9.eot');
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/413d9688-00d4-47c4-bb55-656a0cd396e9.eot?#iefix') format("embedded-opentype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/c4aef0d4-bfcf-4790-acf5-909881f411e8.woff') format("woff"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/e741f29c-bc18-4343-bff3-db2465a0be3e.ttf') format("truetype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/853e2a9b-4057-42a5-ad7e-0762cda0b13c.svg#TradeGothic') format("svg");
			font-weight:400;
			font-style:normal
		}
		@font-face
		{
			font-family:"TradeGothic";
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/2e9af08f-0faf-45e3-9767-78a700434af3.eot');
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/2e9af08f-0faf-45e3-9767-78a700434af3.eot?#iefix') format("embedded-opentype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/f51d24dd-8256-43c6-ba1a-6aeae9d3f262.woff') format("woff"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/955ee494-66b2-4eb2-8f19-bc3a088df16d.ttf') format("truetype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/d5153ad4-7c93-4757-9147-640e69ec4801.svg#TradeGothic') format("svg");
			font-weight:700;
			font-style:normal
		}
		@font-face
		{
			font-family:"Icon";src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons.eot');
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons.eot?#iefix') format("embedded-opentype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons.woff') format("woff"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons.ttf') format("truetype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons.svg#Icons') format("svg");
			font-weight:normal;
			font-style:normal
		}
		@font-face
		{
			font-family:"Icon-new";
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons-new.eot');
			src:url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons-new.eot?#iefix') format("embedded-opentype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons-new.woff') format("woff"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons-new.ttf') format("truetype"),
			url('../../typo3conf/ext/mmpackageqcellsbase/Resources/Public/Fonts/qcells-icons-new.svg#Icons') format("svg");
			font-weight:normal;
			font-style:normal
		}
		
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
		h1 {font-family:"TradeGothic","TradeGothic LT bold";-webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;}
		h4 {letter-spacing:normal; margin:0 0 0px 0;}
		#top_wrap2 {width:980px; min-width:980px; height:80px; margin:0 auto;}	
		h4 {color:#009ee3; margin-top:35px; font-size:16px; font-weight:700; -moz-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important; -webkit-font-family:"TradeGothic","TradeGothic LT bold" !important; -mo-font-family:"TradeGothic","TradeGothic LT bold" !important; -o-font-family:"TradeGothic","TradeGothic LT bold" !important; -ms-font-family:"TradeGothic","TradeGothic LT bold" !important; text-transform:uppercase;}
		/*tab 1*/
			.data_wrap {width:700px;}
			.tab2_left {float:left; width:30%;}
			.left {float:left; width:40%;}
			.left ul {margin-left:15px; margin-top:5px;}		
			.right{float:right; width:40%;}
			.right ul {margin-left:15px; margin-top:5px;}
			.normal {font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; font-size:15px;}
			ul li {font-family:"TradeGothic","TradeGothic LT bold";-webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;  font-size:16px; color:#002d51; height:22px; list-style:none; margin-left:-15px;}
			ul li p {float:right; margin-left:-30%; font-size:16px; color:#333;}
			.vatno {font-size:15px; margin-right:40%;} 
			.grid li {float:left; margin:4px 4px 4px 0px;}
			.grid input[type=text] {margin:0px 0px 0px 0px;}
			.grid input {margin:7px 7px 7px 0px;}
			.input_grid ul li {float:left;}
			.clear {clear:both;}
			.grid_button {float:left;}
		/*******/
		/*tab 2*/
		dt {width:100%; font-family:"TradeGothic","TradeGothic LT bold"; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-size:16px; color:#000; height:25px; /*margin-left:-15px;*/}
		dd {float:left; width:50% !important;}
		dd input[type=text] {width:100% !important;}
		.dd_left {float:left;}
		dl {clear:both; width:90%;}
		.td_title {font-family:"TradeGothic","TradeGothic LT bold"; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-size:16px; color:#000; height:25px; margin-left:-15px;}
		label {font-family:"TradeGothic","TradeGothic LT bold"; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-size:16px; color:#002d51; height:25px; /*margin-left:-15px;*/}
		div label {padding-right:10px;}
		table {width:100%;}
		table tr td .title {font-family:"TradeGothic","TradeGothic LT bold"; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-size:16px; color:#002d51; height:25px; /*margin-left:-15px;*/}
		.red {color:red; font-size:16px; font-family:"TradeGothic","TradeGothic LT bold";}
		select {width:150px;}
		.external_shop_button {padding:13px; font-size:16px; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; border-radius:3px; margin-bottom:10px; background-color:#009ee3; color:#fff; border:0px; float:right;}
		.external_shop_button2 {padding:10px; font-size:14px; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; border-radius:3px; margin-bottom:10px; background-color:#009ee3; color:#fff; border:0px; float:right;}		
		.external_list_button {padding:5px 15px 5px 15px; font-size:14px; border:0px; border-radius:4px; background-color:#009ee3; color:#fff; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;}
		.external_list_button_red {padding:5px 15px 5px 15px; font-size:14px; border:0px; border-radius:4px; background-color:red; color:#fff; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;}
		.add_button {padding:0px 0px 3px 1px; font-size:16px; background-color:#00aeed; color:#fff; width:22px !important; border:0px; border-radius:50px; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;  font-family:"TradeGothic","TradeGothic LT bold";}
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
		.table_line_external tr th:nth-child(1n) {-webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold"; font-size:16px; color:#000;}
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

/* 2018-05-17 */		
		.external_table_d tr:hover {border-bottom:2px solid #009ee3; background-color: #eee; cursor: pointer;}
		.external_table_d tr:active {border-bottom:2px solid #009ee3; background-color: #eee;}
		.external_table_d_active {border-bottom:2px solid #009ee3; background-color: #eee;}

/* CSS Document */
		.external_table_d_title {border-bottom: none !important; background-color:#fff !important; }
		.external_table_d_title {/*width:968px;*/  border-top:1px solid #ccc; border-collapse:collapse;border-spacing:0;}
		.external_table_d_title tr {border-bottom:1px solid #ccc;}
		.external_table_d_title tr td{padding:10px 20px 10px 0px ; font-size:14px !important; height:25px;}
		.external_table_d_title th {padding:5px 15px 5px 0px; text-align:left; color:#002d51; text-transform:uppercase; font-size:14px; font-weight:700; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important; height:25px;} 
		.external_table_d_title td:nth-child(n) {font-size:12px; font-weight:500; color:#555;}
		.external_table_d_title td:first-of-type {color:#009ee3; font-size:14px !important; font-weight:700; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important;}
		
				 
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
					content: "?";
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
		.ex_tab_top_search .small_td p {margin-left:22px;/*18px;*/ font-size:16px; color:#002d51; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important;}
		.external_loginfo {float:left; font-weight:700; margin-left:60%; margin-top:35px; font-size:14px; color:#002d51; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif !important;}
		.external_loginfo_id {margin-top:37px; margin-left:10px; float:left;}
		.external_loginfo i {color:#009ee3; margin-right:5px;}
/* 		.external_table_d {width:968px; margin-top:15px; border-top:1px solid #ccc; border-collapse:collapse;border-spacing:0;} */
		.external_table_d {width:100%;  max-height: 250px;  border-top:1px solid #ccc; border-collapse:collapse;border-spacing:0;}
		.external_table_d tr {border-bottom:1px solid #ccc;}
	/*	.external_table_d tr:nth-child(2n):hover {cursor:pointer; background-color:#bdd6ee; border-bottom:1px solid #ccc;}*/
		.external_table_d tr td{padding:5px 5px 5px 0px ; font-size:14px !important; height:25px; /*border-right:1px solid #ddd;*/}
		.external_table_d th {padding:5px 20px 5px 0px; text-align:left; color:#002d51; text-transform:uppercase; font-size:14px; font-weight:700; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important; /*background-color:#e8f2fe;*/   /*border-right:1px solid #ddd;*/ height:25px; /*border-top:1px solid #ccc;*/} 
		.external_table_d td:nth-child(n) {font-size:12px; font-weight:500; color:#555;}
		.external_table_d td:first-of-type {color:#009ee3; font-size:14px !important; font-weight:700; -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important; font-family:"TradeGothic","TradeGothic LT bold" !important;}
		
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
		    padding: 8px 41px 17px 41px;
		    transition: 0.3s;
		    font-size: 15px;
		    color:#009ee3;/*#009ee3*/
		    font-weight:700;
		    font-family:"TradeGothic","TradeGothic LT bold" !important;
		    -webkit-font-family:"TradeGothic","TradeGothic LT bold",Arial,sans-serif !important;
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
		font-size:14px;
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
			<div class="text"><center>Please refer to the button below for more details.</center></div>
			<div style="margin:0 auto;"><center><input class="mypage" type="button" value="Current Sales Order"></input></center></div>
		</div>
	</div>	
<!-- -- -->

<!-- popup reject / check your order -->
	<div id="reject_popup" class="check_pop_css" style="display:none;">
		<div class="check_pop_box">
			<div class="title"><h1><span>Reject your Order</span></h1></div>
			<div class="text"><h4>Reason of reject</h4></div>
			<div>
				<textarea id="reason_reject" rows="" cols="" style="width: 95%"></textarea>
			</div>
			<div style="float:right;">
			<input id="rejectback" class="popbt" type="button" value="Back"></input>
			<input id="btn_reject" class="popbt" type="button" value="Reject"></input>
			</div>
		</div>
	</div>
	
<!-- popup design / check your order -->
	<div id="check_popup" class="check_pop_css" style="display:none;">
		<div class="check_pop_box">
			<div class="title"><h1><span>Check your Order</span></h1></div>
			<div class="text"><h4>Product</h4></div>
			<div>
				<table class="order_table product">
				</table>
			</div>
			<div class="text"><h4>Address</h4></div>
			<div>
				<table class="order_table">
					<tr>
						<td id="chk_addr">asd</td>
					</tr>
				</table>
				
			</div>
			<div style="float:right;"><input id="orderback" class="popbt" type="button" value="Back"></input><input id="ordersubmit" class="popbt" type="button" value="Submit"></input></div>
		</div>
	</div>
	<!-- ---- -->
	<div style="position:fixed; background-color:#fff; margin:0 auto; z-index:1001; width:100%;">
		<div id="top_wrap2">
			<div style="float:left;">
				<!--<img src="/images/external_logo.png">-->
				<img src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAKUAAABNCAIAAABIXjNiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowYzM2YzE0Ni0wMTA2LWU3NGQtOGUxZS02YTdlNzcxN2Y3Y2IiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OUEwNTEyODEyQjcwMTFFOEJGMkZFNjA0RDVDQ0I4MjQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OUEwNTEyODAyQjcwMTFFOEJGMkZFNjA0RDVDQ0I4MjQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmIzNGYwMTUzLTJhYjItNjY0NS1hOGM3LTYyOTFmNWE2OTFjNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowYzM2YzE0Ni0wMTA2LWU3NGQtOGUxZS02YTdlNzcxN2Y3Y2IiLz4gPC9y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">
			</div>
			<div>
				<div class="external_loginfo"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAIAAABL1vtsAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTggKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBGM0I1RTNFNTM2QzExRThBNEJCQTAzMUYxMTZEMjNEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBGM0I1RTNGNTM2QzExRThBNEJCQTAzMUYxMTZEMjNEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MEYzQjVFM0M1MzZDMTFFOEE0QkJBMDMxRjExNkQyM0QiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MEYzQjVFM0Q1MzZDMTFFOEE0QkJBMDMxRjExNkQyM0QiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4Q6PXSAAABBUlEQVR42mL8//8/A2WAiYFiMGyMYMEjt+7BFwgjSIGHZCPu/2OI3vrm+JsfEK6lyI+l3iKKTKR4pPfiV7h+IACygSK4XMGINV0w7nzP8AxVjxT3f3dBElwhwUxYhIARJSq8aM7CEMHnkT+QMAZGR/D+D2BbGNfa83uJMv1gZRNgYyEqLBjnP2FgYlprz2fIwyDIwfD+B8P5LwzZ+z+8YGJssRSuVuPAZ8TxXwxBS5+8wJMGWFmOhUlYsuEOi30P/rzAnxJ//wGqwRec5959J5icMdVQO5txsDAS1ICpBsWIEm0eRR5WPPqBskA1hCL1388P3/5iN4CZVYCTldg8Qu8iByDAAMhkXs8fiF/IAAAAAElFTkSuQmCC" style="vertical-align:middle; margin-top:-6px;">Partner ID</div><div class="external_loginfo_id" id="external_loginfo_id">0</div>				
			</div>		
			</div>
		<!--  tab start -->
		<div style="height:10px; background-image: linear-gradient(to bottom, #f5f5f5 0%, #fff 100%);"></div>
		<div class="external_menutab">
		<div class="tab2">
		  <!-- <div style="width:980px; margin:0 auto;"> //-->
		   <div style="width:1150px; margin:0 auto;">
		  	<button class="tab2links" onclick="openTab(event, 'generaldata_tab')"><s:message code="ext.qc.top.menu.title.GeneralInformation"/></button>
		  	<button class="tab2links" onclick="openTab(event, 'shop_tab')"><s:message code="ext.qc.top.menu.title.NewOrder"/></button>
		  	<button class="tab2links" onclick="openTab(event, 'orders_tab')"><s:message code="ext.qc.top.menu.title.YourOrders"/></button>
		  	<button class="tab2links" onclick="openTab(event, 'quotations_tab')"><s:message code="ext.qc.top.menu.title.Quotations"/></button>
		  	<button class="tab2links" onclick="openTab(event, 'invoices_tab')"><s:message code="ext.qc.top.menu.title.Invoices"/></button>
		  </div>
		</div>
		</div>
	</div>	
	<div id="ctu_wrap_external"  style="z-index:1000; padding-top:150px;">
		<div id="generaldata_tab" class="tab2content">
	  	<!----- tab 1 ----->
			<div id="general_information_tab" style="margin-left:100px;">
				<div class="data_wrap">
					<div class="left">
						<div>
							<div style="float:left;">
								<h4><s:message code="ext.qc.GeneralInfo.Account"/></h4></div>
							<div><span style="float:right; margin-top:38px;font-family:'TradeGothic',Arial,sans-serif !important;">this year ></span></div>
							<p class="clear">
							<ul>
								<li><s:message code="ext.qc.GeneralInfo.Account.CustomerID"/><p id="CUST_CD">0</p></li>
								<li><s:message code="ext.qc.GeneralInfo.Account.Revenue"/><p id="EV_NETWR" /> EUR</li>
								<li><s:message code="ext.qc.GeneralInfo.Account.Volume"/><p id="EV_VOLUM_QPARTNER_YEAR" /> KW</li>
								<li></li>
								<li><s:message code="ext.qc.GeneralInfo.Account.Targetvolume"/><p id="EV_VOLUM" /> KW</li>
								<li><s:message code="ext.qc.GeneralInfo.Account.TargetAchivement"/><p id="EV_RATIO" />%</li>
								<li><s:message code="ext.qc.GeneralInfo.Account.TargetBonus"/><p id="EV_RATIO_BONUS" />%</li>
								<li></li>
							</ul>
						</div>
						<div>
							<h4><s:message code="ext.qc.GeneralInfo.Payment"/></h4>
							<ul>
								<li><s:message code="ext.qc.GeneralInfo.Payment.Open"/><p id="EV_OPEN" /> EUR</li>
								<li><s:message code="ext.qc.GeneralInfo.Payment.PaymentOverdue"/><p id="EV_OVER" /> EUR</li>
								<li><s:message code="ext.qc.GeneralInfo.Payment.FreeLimit"/><p id="EV_AVAIL" /> EUR</li>
								<li></li>
							</ul>
						</div>
						<div>
							<div style="float:left;">
								<h4><span onclick="openTab(event, 'quotations_tab')" style="cursor:pointer;"> <s:message code="ext.qc.GeneralInfo.Quotations"/> </span></h4>
							</div>
							<div><span style="float:right; margin-top:38px;font-family:'TradeGothic',Arial,sans-serif !important;">this year ></span></div>
							<p class="clear">								
							<ul>
								<li><s:message code="ext.qc.GeneralInfo.Quotations.Completed"/><p id='QT_COMPLETED'>0</p></li>
								<li><s:message code="ext.qc.GeneralInfo.Quotations.Open"/><p id='QT_OPEN'>0</p></li>
								<li><s:message code="ext.qc.GeneralInfo.Quotations.Canceled"/><p id='QT_CANCELED'>0</p></li>
							</ul>
						</div>
						<div>
							<div style="float:left;">
								<h4><span onclick="openTab(event, 'orders_tab')" style="cursor:pointer;"> <s:message code="ext.qc.GeneralInfo.Orders"/> </span></h4>
							</div>
							<div><span style="float:right; margin-top:38px;font-family:'TradeGothic',Arial,sans-serif !important;">this year ></span></div>
							<p class="clear">
							<ul>
								<li><s:message code="ext.qc.GeneralInfo.Orders.Completed"/><p id='SD_COMPLETED'>0</p></li>
								<li><s:message code="ext.qc.GeneralInfo.Orders.Open"/><p id ='SD_OPEN'>0</p></li>
								<li><s:message code="ext.qc.GeneralInfo.Orders.Canceled"/><p id ='SD_CANCELED'>0</p></li>
							</ul>
						</div>							
					</div>
					
					<div class="right">
					<div>
						<h4><s:message code="ext.qc.GeneralInfo.InvoiceAddress"/></h4>
						<ul>
							<li id='CUST_NM'></li>
							<li id='HAUS_NO' class="normal"></li>
							<li id='STREET_NM' class="normal"></li>
							<li id='CITY_NM' class="normal"></li>
							<li id='REGION' class="normal"></li>
							<li id='COUNTRY' class="normal"></li>
							<li class="normal"></li>
							<li class="normal">VAT No.:<p class="vatno" id='VAT_REG_NO'></p></li> 
						</ul>
					</div>						
					<div>
						<h4><s:message code="ext.qc.GeneralInfo.ContactPerson"/></h4>
						<ul>
							<li id='P_DEPT_NM'></li>
							<li id='P_FULL_NM' class="normal"></li>
							<li class="normal">Tel : <p id='P_TELL'></p></li>
							<li class="normal">E-Mail :<p id='P_EMAIL'></p></li>
							<li></li>
						</ul>
					</div>
					<div>
						<ul>
							<li id='S_DEPT_NM'></li>
							<li id='S_FULL_NM' class="normal"></li>
							<li class="normal">Tel : <p id='S_TELL'></p></li>
							<li class="normal">E-Mail :<p id='S_EMAIL'></p></li>
							<li></li>
						</ul>
					</div>							
					</div>
				</div>				
		</div>
	</div>		
	<div id="shop_tab" class="tab2content">
		<!----- tab 2 ----->
				<div id="shop_tab"  style="margin-left:100px; width:773px;">

				  	<div class="grid main" style="margin:35px 0px 0px 0px;">
				  		<ul class="line">
			  						<li style="width:282px;"><s:message code="ext.qc.NewOrder.projectName"/></li>
									<li style="width:282px;"><s:message code="ext.qc.NewOrder.Country"/></li>				  					
									<li><s:message code="ext.qc.NewOrder.DeliveryDate"/></li>
								</ul>
						<div class="item">
								<p class="clear">
							<!-- - -->
			  					<ul class="line">
									<li>
										<input type="text" data-submit="PROJECT_AND_PON" style="width:268px !important;"></input>
				  					</li>				  					
									<li class="powerclass custom-dropdown">
							  			<select style="width:273px !important;" data-selectbox="COUNTRY_CD" data-submit="COUNTRY_CD">
							  			</select>
									</li>									
									<li class="date_pik"><input type="text" id="REQ_DELI_DT" data-type="date" data-submit="REQ_DELI_DT"></input></li>
								</ul>
						</div>		
					</div>
					<p class="clear">
					
					
					<!-- Module -->
					<h4 class="external_h4"  style="margin-top:10px !important;"><s:message code="ext.qc.NewOrder.Module"/></h4>
					<div class="grid module">
						<ul class="line" style="margin-top:5px;">
							<li style="width:182px;"><s:message code="ext.qc.NewOrder.Product"/></li>
							<li style="width:103px;"><s:message code="ext.qc.NewOrder.PowerClass"/></li>
							<li style="width:68px;"><s:message code="ext.qc.NewOrder.PCS"/></li>
							<li style="width:97px;"><s:message code="ext.qc.NewOrder.Watt"/></li>
							<li style="width:100px;"><s:message code="ext.qc.NewOrder.price"/></li>	
							<li style="width:180px;"><s:message code="ext.qc.NewOrder.ReqDelivDate"/></li>
						</ul>
						<div class="plus">
							<!--  <p class="clear"><span><input type="button" class="add_button modul_add" value="+"></span> -->
							<ul class="line">
								<li></li>
							</ul>
						</div>
					</div>
					<!-- Module end -->
					
					
					<!-- BOS -->
					<h4 class="external_h4"><s:message code="ext.qc.NewOrder.BOS"/></h4>
					<div class="grid bos" >
						<ul class="line" style="margin-top:5px;">
							<li style="width:133px;"><s:message code="ext.qc.NewOrder.Type"/></li>
							<li style="width:100px;"><s:message code="ext.qc.NewOrder.Country"/></li>
							<li style="width:253px;"><s:message code="ext.qc.NewOrder.Product"/></li>
							<li style="width:68px;"><s:message code="ext.qc.NewOrder.PCS"/></li>
							<li style="width:180px"><s:message code="ext.qc.NewOrder.ReqDelivDate"/></li>
						</ul>
							<div class="plus">
							<p class="clear"><span><input type="button" class="add_button modul_add" value="+"></span>
							<ul class="line">
								<li></li>
							</ul>
						</div>
						
					<div>
					<!-- BOS end -->
										
						<!-- Delivery Information -->
						<h4 class="external_h4"><s:message code="ext.qc.NewOrder.DeliveryInformation"/></h4>
						<div style="margin-top:10px; margin-bottom:20px;">
						<div class="left" style="width:30%;">
							<label><input type="radio" name="DELIV_DIV" id="RadioGroup1_0" value="CIP" data-submit="DELIV_DIV" checked><s:message code="ext.qc.NewOrder.Delivery"/></label>
							<label><input type="radio" name="DELIV_DIV" id="RadioGroup1_1" value="EXW" data-submit="DELIV_DIV"><s:message code="ext.qc.NewOrder.Pickup"/></label>
						</div>
						<div class="right" style="width:55%;">
							&nbsp;&nbsp;&nbsp;&nbsp;<label><s:message code="ext.qc.NewOrder.PaymentTerm"/></label>
							<div class="custom-dropdown">
								<select data-selectbox="TERM_PAY_CD" data-submit="TERM_PAY_CD" style="width:275px;">
						  		</select>
				  			</div>
						</div>
						</div>
						<div id="DELI_INFO" > <!-- pickup ??? hideen -->
							<div class="left" style="width:100%;">
								<div>
									<input type="checkbox" data-submit="IS_UNLOAD_EQUIP" ><label><s:message code="ext.qc.NewOrder.UnloadEquip"/></label>
								</div>
								<!-- checkbox ???? textarea ??? -->
								<div  id="" class="textarea"  style="width:100%;">
									<textarea velue="Shipping Remarks" disabled="disabled" data-submit="UNLOAD_EQUIP_COMMENT" style="width:94%;"></textarea>
								</div>
							</div>	
							<!-- Delivery ??? -->
								
							<p class="clear">
								<div style="margin-left: 2px; margin-top:10px;">
									<label><s:message code="ext.qc.NewOrder.ShipTo"/></label><br>
									<div class="custom-dropdown" style="margin-top:5px; width:96%;">
										<select style="width:100%;" data-submit="SHIP_TO" id="SHIP_TO">
						  				</select>
					  				</div>
								</div>
								<table class="delivery_table">
									<tr>
										<td>
											<input type="hidden" id="NEW-SHIP_CUST_CD">
											<input type="hidden" id="NEW-SALES_ORG_CD">
											<input type="hidden" id="NEW-DISTRB_CH">
											<div style="margin-top:15px;">
											<label><s:message code="ext.qc.NewOrder.CompanyName"/></label><br><input type="text" data-submit="DELIV_COMP_NM" id="NEW-COMPANY_NM" style="width:240px; margin-top:7px;"></input>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="title"><s:message code="ext.qc.NewOrder.FirstName"/></span><span class="red"> *</span><br><input type="text" id="NEW-FIRST_NAME" data-submit="FIRST_NM"/></td>
										<td><span class="title"><s:message code="ext.qc.NewOrder.SubName"/></span><span class="red"> *</span><br><input type="text" id="NEW-SUB_NAME" data-submit="SUB_NM"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title"><s:message code="ext.qc.NewOrder.Street"/></span><span class="red"> *</span><br><input type="text" id="NEW-STREET_NM" data-submit="ST_HOUSE_NUMBER" data-mandantory="ST_HOUSE_NUMBER" style="width:94% !important;"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title"><s:message code="ext.qc.NewOrder.Address"/></span><br><input type="text" id="NEW-ADDR" data-submit="ADDR_COMP_CO" style="width:94% !important;"/></td>
									</tr>
									<tr>
										<td><span class="title"><s:message code="ext.qc.NewOrder.Postcode"/></span><span class="red"> *</span><br><input type="text" id="NEW-POST_CD" data-submit="POSTCODE" data-mandantory="POSTCODE"/></td>
										<td><span class="title"><s:message code="ext.qc.NewOrder.place"/></span><span class="red"> *</span><br><input type="text" id="NEW-CITY_NM" data-submit="PLACE" data-mandantory="PLACE"/></td>
									</tr>
									<tr>
										<td colspan="2"><span class="title"><s:message code="ext.qc.NewOrder.Country"/></span><span class="red"> *</span><br>
										<div class="custom-dropdown" style="margin-top:5px; width:96%;">
										<select style="width:100%;" id="NEW-COUNTRY_NM"  data-selectbox="COUNTRY_CD" data-submit="COUNTRY" data-mandantory="COUNTRY">
							  			</select>
							  			</div>
									</tr>
								</table>
							</div>	
							<div class="left" style="margin-top:15px; width:100%;">
								<label><span class="title"><s:message code="ext.qc.NewOrder.Remarks"/></span></label><input type="text" data-submit="REMARKS" style="width:94%; margin-top:5px;"></input>
							</div>
							<div class="right" style="margin:30px;">
								<input type="button" class="external_shop_button" value="Apply">
							</div>							
						<!-- ?? deliver. pick-up ?? -->						
						<!-- /// -->						  					
				</div>
			</div>	
		</div>
	</div>	
	<div id="orders_tab" class="tab2content">
	<!----- tab 3 ----->
				<div id="order_tab">
				<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2" style="height: 80px;">
							<ul>
								<li style="float: left; width: 40%;"><h4 class="external_h4"><s:message code="ext.qc.SO.Title"/></h4></li>
								<li style="float: right;">								
									<div class="custom-dropdown">
									<select id="key" style="width:170px;">
											<option value="">== select ==</option>
											<option value="DOC_NO">Document Number</option>
							  		</select>
					  				</div>
									<input type ="text" id="keyword" value="" placeholder="keyword" style="width: 200px; font-size: 14px;"/>&nbsp;
									<input class ="external_shop_button2" type ="button" onclick="searchSOMaster();" value="search"/>  
								</li>
							</ul>							
						</div>
					</div>
					<div style="overflow-x:auto;">
						<table class="external_table_d_title salesMst_table" width="100%">
							<colgroup>
								<col style="width:9%;">
								<col style="width:10%;">
								<col style="width:11%;">
								<col style="width:10%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:11%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:9%;">
								<col style="width:10%;">
							</colgroup>
				  		</table>
				  	</div>
				  	<div style="height: 250px; overflow-x:auto;">
						<table class="external_table_d salesMst_table" width="100%">
							<colgroup>
								<col style="width:9%;">
								<col style="width:10%;">
								<col style="width:11%;">
								<col style="width:10%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:11%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:9%;">
								<col style="width:10%;">
							</colgroup>
				  		</table>
				  	</div>
					<!-- - -->				
					<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2">	
							 <h4 class="external_h4"><s:message code="ext.qc.SOITEM.Title"/></h4>
						</div>
					</div>
					<div style="overflow-x:auto;">
						<table class="external_table_d_title salesDet_table" >
				  		</table>
				  	</div>	
					<div style="height: 300px; overflow-x:auto;">
						<table class="external_table_d salesDet_table" >
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
						<div class="ct_grid_top_left2">	
							 <h4 class="external_h4"><s:message code="ext.qc.QT.Title"/></h4>
						</div>
						<div style="overflow-x:auto;">
							<table class="external_table_d_title quotaionMst_table" width="100%" >
				  			</table>
						</div>
						<div style="height: 250px; overflow-x:auto;">
							<table class="external_table_d quotaionMst_table" width="100%" >
				  			</table>
						</div>	
						<!-- -- -->
						<div class="ct_grid_top_wrap2">
							<div class="ct_grid_top_left2"> <h4 class="external_h4"><s:message code="ext.qc.QTITEM.Title"/></h4></div>
							<div class="ct_grid_top_right2"></div>
						</div>
						<div style="overflow-x:auto;">
							<table class="external_table_d_title quotaionDet_table" width="100%">
					  		</table>
						</div>	
						<div style="height: 300px; overflow-x:auto;">
							<table class="external_table_d quotaionDet_table" width="100%">
					  		</table>
						</div>						
						<div class="ct_grid_top_wrap2">
							<div class="ct_grid_top_left2">
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
						<div class="ct_grid_top_left2"> <h4 class="external_h4"><s:message code="ext.qc.Invoice.Title"/></h4></div>
						<div class="ct_grid_top_right2"></div>
					</div>        	
					<div style="overflow-x:auto;">
							<table class="external_table_d_title invoice_table" width="100%">
				  			<tr>
				  				<th><s:message code="ext.qc.Invoice.InvoiceNo"/></th>
				  				<th><s:message code="ext.qc.Invoice.Item"/></th>
				  				<th><s:message code="ext.qc.Invoice.Quantity"/></th>
				  				<th><s:message code="ext.qc.Invoice.Unit"/></th>
				  				<th><s:message code="ext.qc.Invoice.NetPrice"/></th>
				  				<th><s:message code="ext.qc.Invoice.NetValue"/></th>
				  				<th><s:message code="ext.qc.Invoice.GrossValue"/></th>
				  				<th><s:message code="ext.qc.Invoice.Currency"/></th>
				  				<th><s:message code="ext.qc.Invoice.OverallStatus"/></th>
				  				<th><s:message code="ext.qc.Invoice.SalesOrderNo"/></th>		  				 				
				  			</tr>
				  		</table>
				  	</div>
				  	<div style="overflow-x:auto; height:350px;">
							<table class="external_table_d invoice_table" width="100%">
				  		</table>
				  	</div>
				</div>	
				<div class="ct_grid_top_wrap2">
						<div class="ct_grid_top_left2"></div>
						<div class="ct_grid_top_right2"></div>
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
	
	
	setTimeout(function() {
		var elm = document.querySelector('.tab2 .tab2links');
		var event = document.createEvent('Event');
		event.initEvent('click', false, true);
		elm.dispatchEvent(event);
	}, 500);
	
	var EXTERNAL_OMS = {
		
		OMS_SERVER_URI : 'http://localhost:8080',
		 //OMS_SERVER_URI : 'https://omsdev.q-cells.com',
		//OMS_SERVER_URI : 'https://oms.q-cells.com',	
		externalMap : JSON.parse('${externalMap}'),		
		token : "${token}",
		
		init : function () {},	
		
		initializeNewOrder : function () {
			var submitElms = document.querySelectorAll('[data-submit]');
			Array.prototype.forEach.call(submitElms, function(elm) {					
				if ((elm || {}).type === 'checkbox') {
					elm.checked = false;
				} else if ((elm || {}).type === 'radio') {
				 	;
				} else {
					elm.value = "";
				}
			});
			
			// initialize module
			var gridModeulElm = document.querySelector('.grid.module');
			var moduleElms = document.querySelectorAll('.modul_del');
			Array.prototype.forEach.call(moduleElms, function(elm) {	
				var id = elm.dataset.id;
				var deleteItem = gridModeulElm.querySelector('.item[data-id="' + id + '"]');
				gridModeulElm.removeChild(deleteItem);
			});
						
			// initialize BOS
			var gridBosElm = document.querySelector('.grid.bos');
			var bosElms = document.querySelectorAll('.bos_del');
			Array.prototype.forEach.call(bosElms, function(elm) {	
				var id = elm.dataset.id;
				var deleteItem = gridBosElm.querySelector('.item[data-id="' + id + '"]');
				gridBosElm.removeChild(deleteItem);
			});
		},
		createItemRejectPopup : function (DOCNO, ITEMSEQ, SCHEDLINE, REQDLVBL, DIV, custCd) {
			
			$("#rejectback").bind('click', function(e) {
				$("#reason_reject").val("");
				$("#rejectback").unbind("click");
				$("#btn_reject").unbind("click");
				$("#reject_popup").hide();
			});
			
			$("#btn_reject").bind('click', function() {
				var reason = $("#reason_reject").val();
				
				var xhr = new XMLHttpRequest();
				xhr.open('POST', EXTERNAL_OMS.OMS_SERVER_URI + '/api/sales/confirm');
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader('Authorization', 'Bearer '+ EXTERNAL_OMS.token);
	
				var param = {
						  DOC_NO: DOCNO			// SO Number
						, ITM_NUMBER: ITEMSEQ	// item no
						, SCHED_LINE: SCHEDLINE	// schedule line no
						, REQ_DLV_BL: REQDLVBL	// reject ? G5? ???.
						, DIV: DIV				// head, item ??
						, custCd: custCd		// test?
						, REASON_REJECT: reason	// reason of reject
				};
				
				xhr.send(JSON.stringify(param));
				xhr.onreadystatechange = function() {
					if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
						var resData = JSON.parse(this.responseText);
						if (resData.CODE == '1') {// OK
							var docElms = document.querySelectorAll('[data-Item]');
							Array.prototype.forEach.call(docElms, function(elm) {	
								
								// data-Item="' + v.DOC_NO + ';' + v.ITEM_SEQ 
								if(elm.getAttribute('data-Item') == DOCNO + ';' + ITEMSEQ){													
									elm.setAttribute('hidden', true); 
								}
							});
							$("#reason_reject").val("");
							$("#reject_popup").hide();
							$("#rejectback").unbind("click");
							$("#btn_reject").unbind("click");
							alert('<s:message code="success.sendemail"/>');
						} else {
							alert('<s:message code="error.fail"/>');
						}
					}else if(xhr.status != 200){
						alert('<s:message code="error.fail"/>');
					}
				};
			});
		},
		createHeadRejectPopup : function (DOCNO, DLVBLOCK, DIV, CUSTCD) {
			
			$("#rejectback").bind('click', function(e) {
				$("#reason_reject").val("");
				$("#rejectback").unbind("click");
				$("#btn_reject").unbind("click");
				$("#reject_popup").hide();
			});

			$("#btn_reject").bind('click', function() {
				var reason = $("#reason_reject").val();
				
				var xhr = new XMLHttpRequest();
				xhr.open('POST', EXTERNAL_OMS.OMS_SERVER_URI + '/api/sales/confirm');
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader('Authorization', 'Bearer '+ EXTERNAL_OMS.token);
				var param = {
					  DOC_NO: DOCNO			// SO Number
					, DLV_BLOCK: DLVBLOCK	// reject ? G5? ???.									
					, DIV: DIV				// head, item ??
					, custCd: CUSTCD		// test?
					, REASON_REJECT: reason	// reason of reject
				};
				
				xhr.send(JSON.stringify(param));
				xhr.onreadystatechange = function() {
					if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
						var resData = JSON.parse(this.responseText);
						if (resData.CODE == '1') {// OK
							var docElms = document.querySelectorAll('[data-docNo]');
							Array.prototype.forEach.call(docElms, function(elm) {	
								if(elm.getAttribute('data-docno') == DOCNO){												
									elm.setAttribute('hidden', true); 
								}
							});
							$("#reason_reject").val("");
							$("#reject_popup").hide();
							$("#rejectback").unbind("click");
							$("#btn_reject").unbind("click");
							alert('<s:message code="success.sendemail"/>');
						} else {							
							alert('<s:message code="error.fail"/>');
						}
					}else if(xhr.status != 200){						
						alert('<s:message code="error.fail"/>');
					}
				};
			});
		},
		createChkPopup : function () {
			var orderData = {};
			var submitElms = document.querySelectorAll('[data-submit]');
			Array.prototype.forEach.call(submitElms, function(elm) {					
				if ((elm || {}).type === 'checkbox') {
					orderData[elm.dataset.submit] = ((elm.checked)?"Y": "N");
				} else if ((elm || {}).type === 'radio') {
					if (elm.checked) {
						orderData[elm.dataset.submit] = elm.value;	
					}
				} else {
					orderData[elm.dataset.submit] = elm.value;	
				}
			});			
						
			var moduleElms = document.querySelectorAll('.module .item');
			var moduleList = [];
			Array.prototype.forEach.call(moduleElms, function(elm) {
				var item = {};
				var itemElms = elm.querySelectorAll('[data-itemsubmit]');
				Array.prototype.forEach.call(itemElms, function(itemElm) {
					if(itemElm.dataset.itemsubmit == 'MATL_GR'){
						item[itemElm.dataset.itemsubmit] =  itemElm[itemElm.selectedIndex].innerHTML;
					}else{
						item[itemElm.dataset.itemsubmit] = itemElm.value;	
					}
				});
				moduleList.push(item);
			});
			orderData.moduleList = moduleList;
			
			var bosElms = document.querySelectorAll('.bos .item');
			var bosList = [];
			Array.prototype.forEach.call(bosElms, function(elm) {
				var item = {};
				var itemElms = elm.querySelectorAll('[data-itemsubmit]');
				Array.prototype.forEach.call(itemElms, function(itemElm) {
					item[itemElm.dataset.itemsubmit] = itemElm.value;
				});
				bosList.push(item);
			});
			orderData.bosList = bosList;
			
			var productTable = document.querySelector('.order_table');
			
			var context = '';
			productTable.innerHTML = '';
  			if(orderData.moduleList.length  > 0){
				Array.prototype.forEach.call(orderData.moduleList, function(v) {
					
					var wpout = createNormalFm(v.WATT);				
					var price = createNormalFm(v.PRICE);
					var sum = (Number(wpout) * Number(price));
					sum = sum.toFixed(2);
					var ssum = createGridNumFm(sum.toString(), true);
					// console.log(v);
					var tr = document.createElement('tr');
						context = '<td>' + v.MATL_GR + '</td>';
						context += '<td>' + v.WP_OUT + '</td>';
						context += '<td>' + v.PCS + ' PCS' + '</td>';
						context += '<td>' + v.WATT + ' W'+ '</td>';
						context += '<td align="right">' + v.PRICE + ' ' + '</td>';
						context += '<td align="right">' + ssum + ' ' + '</td>';
						tr.innerHTML = context;
						
						productTable.appendChild(tr);
				});
  			}
  			if(orderData.bosList.length  > 0){
				Array.prototype.forEach.call(orderData.bosList, function(v) {
					var tr = document.createElement('tr');
						context = '<td>' + v.KIND_CD + '</td>';
						context += '<td></td>';
						context += '<td>' + v.PCS + ' PCS'+ '</td>';
						context += '<td></td>';
						context += '<td></td>';
						tr.innerHTML = context;
							
						productTable.appendChild(tr);
				});
  			}
			  			
  			if (orderData.DELIV_DIV != "EXW") {
  				document.getElementById('chk_addr').innerHTML = document.querySelector('[data-submit="ST_HOUSE_NUMBER" ]').value + ' ' + document.querySelector('[data-submit="ADDR_COMP_CO" ]').value + ' ' + document.querySelector('[data-submit="POSTCODE" ]').value + ' ' + document.querySelector('[data-submit="PLACE" ]').value;
  			} else {
  				document.getElementById('chk_addr').innerHTML = "";
  			}	
		}, 
		
		drawCombobox : function (targetElement) {			
			if (EXTERNAL_OMS.externalMap.codeList == undefined) {
				return;
			}
			
			var comboElms = document.querySelectorAll('[data-selectbox]');
			var codeList = EXTERNAL_OMS.externalMap.codeList;
			var codeMap = {};
			Array.prototype.forEach.call(codeList, function(v) {
				if (!codeMap[v.HEAD_ID]) {
					codeMap[v.HEAD_ID] = [];
				}
				codeMap[v.HEAD_ID].push(v);
			});
			
			if (targetElement != null && targetElement != undefined && (typeof targetElement === "object"))
			{
				var options = codeMap[targetElement.dataset.itemsubmit];
				var context = '';
				if (targetElement.dataset.itemsubmit == "COUNTRY_CD" || targetElement.dataset.itemsubmit == "RSN_RJT_CD") {
					context += '<option value="" ></option>';
				}		
				options.forEach(function(v) {
					if (v != undefined) {
						context += '<option value="' + v.CODE + '" >' + v.CODE_NM + '</option>';	
					}
				});
				targetElement.innerHTML = context;
			}
			else
			{		
				Array.prototype.forEach.call(comboElms, function(elm) {
					var options = codeMap[elm.dataset.selectbox];
					var context = '';
					
					if (elm.dataset.selectbox == "COUNTRY_CD" || elm.dataset.selectbox == "RSN_RJT_CD") {
						context += '<option value="" ></option>';
					}					
					options.forEach(function(v) {
						if (v != undefined) {
							context += '<option value="' + v.CODE + '" >' + v.CODE_NM + '</option>';
						}
					});
					if (elm.dataset.selectbox == "TERM_PAY_CD") {
						context += '<option value="" >Other(<s:message code="ext.qc.NewOrder.payment.remark"/>).</option>';
					}
					elm.innerHTML = context;
				});
			}	
		}, 
		
		drawShipInfo : function () {
			var shipToElm = document.getElementById('SHIP_TO');
			var shiptoList = EXTERNAL_OMS.externalMap.shiptoList;
			// draw
			content = '';
			for (var i in shiptoList) {
				content += '<option value="' + shiptoList[i].CUST_CD + ':' + shiptoList[i].SALES_ORG_CD + ':' + shiptoList[i].DISTRB_CH + '">' + shiptoList[i].COMPANY_NM + '</option>';
			}
			content += '<option value="' + '1100001::' + '">' + 'Other.' + '</option>';
			shipToElm.innerHTML = content;
			
			shipToElm.addEventListener('change', function(e) {
				var content = '';
				Array.prototype.forEach.call(shiptoList, function(v) {
					if((v.CUST_CD + ':' + v.SALES_ORG_CD + ':' + v.DISTRB_CH)== e.currentTarget.value){
						document.getElementById('NEW-COMPANY_NM').value = v.COMPANY_NM;
						document.getElementById('NEW-FIRST_NAME').value = v.COMPANY_NM;
						document.getElementById('NEW-SUB_NAME').value = v.CUST_ABNM;
						
						document.getElementById('NEW-STREET_NM').value = v.STREET_NM;
						document.getElementById('NEW-ADDR').value = v.ADDR;
						document.getElementById('NEW-POST_CD').value = v.POST_CD;
						document.getElementById('NEW-CITY_NM').value = v.CITY_NM;
						document.getElementById('NEW-COUNTRY_NM').value = v.COUNTRY_CD
						document.getElementById('NEW-SHIP_CUST_CD').value = v.CUST_CD;
						document.getElementById('NEW-SALES_ORG_CD').value = v.SALES_ORG_CD;
						document.getElementById('NEW-DISTRB_CH').value = v.DISTRB_CH;
						
						document.getElementById('NEW-COMPANY_NM').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-FIRST_NAME').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-SUB_NAME').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-STREET_NM').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-ADDR').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-POST_CD').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-CITY_NM').setAttribute('disabled', 'disabled');
						document.getElementById('NEW-COUNTRY_NM').setAttribute('disabled', 'disabled');
					}
					if('1100001::' == e.currentTarget.value){
						document.getElementById('NEW-COMPANY_NM').value = '';
						document.getElementById('NEW-STREET_NM').value = '';
						document.getElementById('NEW-ADDR').value = '';
						document.getElementById('NEW-POST_CD').value = '';
						document.getElementById('NEW-CITY_NM').value = '';
						document.getElementById('NEW-COUNTRY_NM').value = '';
						document.getElementById('NEW-SHIP_CUST_CD').value = '1100001';// ship to ??? ?? ?? ?? ?? one time customer ? ??
						document.getElementById('NEW-SALES_ORG_CD').value = '';
						document.getElementById('NEW-DISTRB_CH').value = '';
						document.getElementById('NEW-FIRST_NAME').value = '';
						document.getElementById('NEW-SUB_NAME').value = '';
						
						document.getElementById('NEW-COMPANY_NM').removeAttribute('disabled');
						document.getElementById('NEW-FIRST_NAME').removeAttribute('disabled');
						document.getElementById('NEW-SUB_NAME').removeAttribute('disabled');
						document.getElementById('NEW-STREET_NM').removeAttribute('disabled');
						document.getElementById('NEW-ADDR').removeAttribute('disabled');
						document.getElementById('NEW-POST_CD').removeAttribute('disabled');
						document.getElementById('NEW-CITY_NM').removeAttribute('disabled');
						document.getElementById('NEW-COUNTRY_NM').removeAttribute('disabled');
					}
				});
			});
			
			var event = document.createEvent('Event');
			event.initEvent('change', false, true); 
			shipToElm.dispatchEvent(event);
		},
		
		drawGerenalInfo : function () {
			/* Customer info */
			document.getElementById('CUST_CD').textContent = EXTERNAL_OMS.externalMap.custinfo.CUST_CD;			
			document.getElementById('external_loginfo_id').textContent = EXTERNAL_OMS.externalMap.custinfo.CUST_CD;
			
			/* OrderProcess */
			document.getElementById('QT_COMPLETED').textContent = EXTERNAL_OMS.externalMap.orderProcess.QT_COMPLETED;
			document.getElementById('QT_OPEN').textContent = EXTERNAL_OMS.externalMap.orderProcess.QT_OPEN;
			document.getElementById('QT_CANCELED').textContent = EXTERNAL_OMS.externalMap.orderProcess.QT_CANCELED;
						
			// document.getElementById('SD_OPEN').textContent = EXTERNAL_OMS.externalMap.orderProcess.SD_OPEN;
			// document.getElementById('SD_COMPLETED').textContent = EXTERNAL_OMS.externalMap.orderProcess.SD_COMPLETED;
			document.getElementById('SD_CANCELED').textContent = EXTERNAL_OMS.externalMap.orderProcess.SD_CANCELED;
			
			/* InvoiceAddr */
			if (null != EXTERNAL_OMS.externalMap.invoceAddr) {
				document.getElementById('CUST_NM').textContent = EXTERNAL_OMS.externalMap.invoceAddr.CUST_NM;
				document.getElementById('HAUS_NO').textContent = EXTERNAL_OMS.externalMap.invoceAddr.HAUS_NO;
				document.getElementById('STREET_NM').textContent = EXTERNAL_OMS.externalMap.invoceAddr.STREET_NM;
				document.getElementById('CITY_NM').textContent = EXTERNAL_OMS.externalMap.invoceAddr.CITY_NM;
				document.getElementById('REGION').textContent = EXTERNAL_OMS.externalMap.invoceAddr.REGION;
				document.getElementById('COUNTRY').textContent = EXTERNAL_OMS.externalMap.invoceAddr.COUNTRY;
				document.getElementById('VAT_REG_NO').textContent = EXTERNAL_OMS.externalMap.invoceAddr.VAT_REG_NO;	
			}
			
			/* ContactPerson */
			if (null != EXTERNAL_OMS.externalMap.contactPerson) {
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.contactPerson, function(v) {
					if (v.TYPE_CD == 'ZK') {
						document.getElementById('P_DEPT_NM').textContent = v.TYPE_NM;
						document.getElementById('P_FULL_NM').textContent = v.PF_PS_NM;
						document.getElementById('P_TELL').textContent = v.TEL;
						document.getElementById('P_EMAIL').textContent = v.E_MAIL;
					} else if(v.TYPE_CD == 'ZI') {
						document.getElementById('S_DEPT_NM').textContent = v.TYPE_NM;
						document.getElementById('S_FULL_NM').textContent = v.PF_PS_NM;
						document.getElementById('S_TELL').textContent = v.TEL;
						document.getElementById('S_EMAIL').textContent = v.E_MAIL;
					}
				});
			}
			
			
			/* ContactPerson */
			// externalMap.invoiceInfo
			if (null != EXTERNAL_OMS.externalMap.invoiceInfo) {
				var evnetwr = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_NETWR != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_NETWR:"0") + " EUR";				
				var evvolumyear = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_VOLUM_QPARTNER_YEAR != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_VOLUM_QPARTNER_YEAR:"0") + " KW";				
				var evvolum = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_VOLUM != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_VOLUM:"0") + " KW";				
				var evratio = createGridNumFm((EXTERNAL_OMS. externalMap.invoiceInfo.EV_RATIO != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_RATIO:"0") + "%";
				var evratiobonus = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_RATIO_BONUS != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_RATIO_BONUS:"0") + "%";				
				var evopen = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_OPEN != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_OPEN:"0") + " EUR";
				var evover = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_OVER != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_OVER:"0") + " EUR";
				var evavail = createGridNumFm((EXTERNAL_OMS.externalMap.invoiceInfo.EV_AVAIL != undefined)? EXTERNAL_OMS.externalMap.invoiceInfo.EV_AVAIL:"0") + " EUR";
				
				document.getElementById('EV_NETWR').textContent = evnetwr;				
				document.getElementById('EV_VOLUM_QPARTNER_YEAR').textContent = evvolumyear;
				document.getElementById('EV_VOLUM').textContent = evvolum;				
				document.getElementById('EV_RATIO').textContent = evratio;
				document.getElementById('EV_RATIO_BONUS').textContent = evratiobonus;
				document.getElementById('EV_OPEN').textContent = evopen;
				document.getElementById('EV_OVER').textContent = evover;
				document.getElementById('EV_AVAIL').textContent = evavail;
			}
		},
		
		drawQuotationMstList : function () {
			var quotationTable = document.querySelector('.external_table_d_title.quotaionMst_table');
			var context ='<tr><th width="95px"><s:message code="quotation.quotationNo"/></th>';
				context += '<th width="100px"><s:message code="ext.qc.NewOrder.projectName"/></th>';
				context += '<th width="80px"><s:message code="customer.Incoterms"/></th>';
				context += '<th width="160px"><s:message code="quotation.paymentTerms"/></th>';
				context += '<th width="100px"><s:message code="quotation.Weight"/></th>';
				context += '<th width="65px"><s:message code="quotation.amount"/></th>';
				context += '<th><s:message code="quotation.grd.curr"/></th>';
				context += '<th><s:message code="quotation.validTerm"/></th>';
				context += '<th width="70px"><s:message code="ext.qc.Invoice.OverallStatus"/></th></tr>';
				quotationTable.innerHTML = context;
				
			quotationTable = document.querySelector('.external_table_d.quotaionMst_table');
			if(EXTERNAL_OMS.externalMap.qutationMster.length > 0){
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.qutationMster, function(v) {
					var tr = document.createElement('tr');
					tr.dataset.docNo = v.DOC_NO;
					context = '<td width="110px">' + v.DOC_NO + '</td>';
					context += '<td width="105px">' + v.PO_NO + '</td>';
					context += '<td width="90px">' + v.INCOTERMS_CD + '</td>';
					context += '<td>' + v.PAY_TERM + '</td>';
					context += '<td>' + v.T_WT + '</td>';
					context += '<td align="right">' + v.T_AMT + '</td>';
					context += '<td width="40px">' + v.CURR_CD + '</td>';
					context += '<td width="165px">' + v.VALID_TERM + '</td>';
					context += '<td>' + v.OVL_STS + '</td>';
					tr.innerHTML = context;
					
					tr.addEventListener('click', function(e) {
						var docNo = e.currentTarget.dataset.docNo;
						Array.prototype.forEach.call(quotationTable.getElementsByTagName("tr"), function(v) {	
							$('[data-doc-no="' + v.dataset.docNo + '"]').removeClass('external_table_d_active');
						});
						
						$(this).addClass('external_table_d_active');
						EXTERNAL_OMS.drawQuotationDetList(docNo);
					});
					quotationTable.appendChild(tr);
				});
				EXTERNAL_OMS.drawQuotationDetList(EXTERNAL_OMS.externalMap.qutationMster[0].DOC_NO);
			}
		},		
		
		drawQuotationDetList : function(docNo) {
			var quotationTable = document.querySelector('.external_table_d_title.quotaionDet_table');
			
			var context = '<tr><th width="60px"><s:message code="quotation.grd.seq"/></th>';
				context += '<th width="375px"><s:message code="sales.grd.Item"/></th>';
			    context +='<th width="100px"><s:message code="lead.Quantity"/></th>';
			    context += '<th width="95px"><s:message code="sales.grd.Unit"/></th>';
			    context += '<th><s:message code="sales.grd.Netprice"/></th>';
  				context +='<th><s:message code="sales.grd.Netvalue"/></th>';
  				quotationTable.innerHTML = context;
  				
  			quotationTable = document.querySelector('.external_table_d.quotaionDet_table');
			quotationTable.innerHTML = '';
  			if(EXTERNAL_OMS.externalMap.qutationDetail.length  > 0){
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.qutationDetail, function(v) {
					if(v.DOC_NO == docNo){
						var tr = document.createElement('tr');
						tr.dataset.docNo = v.DOC_NO;
						context = '<td width="70px">' + v.ITEM_SEQ + '</td>';
						context += '<td width="385px">' + v.MATL_DESC + '</td>';
						context += '<td align="right" width="110px">' + v.ORD_QTY + '</td>';
						context += '<td width="105px">' + v.ORD_UNIT_CD + '</td>';
						context += '<td width="140px">' + ((v.NET_PRICE == undefined)?'0,00':v.NET_PRICE) + '</td>';
						context += '<td align="right">' + ((v.NET_VAL == undefined)?'0,00':v.NET_VAL) + '</td>';
						tr.innerHTML = context;
							
						quotationTable.appendChild(tr);
					}
				});
  			}
		},
		
		drawSalesMstList : function (key, keyword) {
			var salesOrderTable = document.querySelector('.external_table_d_title.salesMst_table');
			var context = '<tr><th width="15%" align="center"><s:message code="common.status"/></th>';
			context += '<th width="10%" align="center"><s:message code="customer.DocumentNumber"/></th>';
			context += '<th width="20%" align="center"><s:message code="ext.qc.NewOrder.projectName"/></th>';
			context += '<th width="15%" align="center"><s:message code="ext.qc.NewOrder.DeliveryDate"/></th>';
			context += '<th width="10%" align="center"><s:message code="customer.Incoterms"/></th>';
			context += '<th width="10%" align="center"><s:message code="quotation.paymentTerms"/></th>';
			context += '<th width="25%" align="center"><s:message code="quotation.Weight"/></th>';
			context += '<th width="10%" align="center"><s:message code="quotation.amount"/></th>';
			context += '<th width="5%" align="center"><s:message code="quotation.grd.curr"/></th>';
			context += '<th width="10%" align="center"><s:message code="ext.qc.Invoice.OverallStatus"/></th>';
			context += '<th width="10%" align="center"><s:message code="quotation.confirm"/></th></tr>';
			salesOrderTable.innerHTML = context;
			
			var firstDocNo="";
			salesOrderTable = document.querySelector('.external_table_d.salesMst_table');
			if(EXTERNAL_OMS.externalMap.salesOrderMaster.length  > 0) {
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.salesOrderMaster, function(v) {
					
					if (key != "" && keyword != "") {
						var val = v[key];
						if (val.indexOf(keyword) > -1) {
							;
						}
						else {
							return false;
						}
					}	
													
					var tr = document.createElement('tr');
					if (firstDocNo == "") firstDocNo = v.DOC_NO;
					tr.dataset.docNo = v.DOC_NO;
					context = '<td align="left">' + v.DELI_BLOCK_NM + '</td>';
					context += '<td align="left">' + v.DOC_NO + '</td>';
					context += '<td align="left">' + v.PO_NO + '</td>';
					context += '<td align="left" style="width:10% !important;">' + v.REQ_DELI_DT + '</td>';
					context += '<td align="cetner" style="width:10%  !important; text-align:center;">' + v.INCOTERMS_CD + '</td>';
					context += '<td align="right">' + v.PAY_TERM + '</td>';
					context += '<td align="right">' + v.T_WT + '</td>';
					context += '<td align="right">' + v.T_AMT + '</td>';
					context += '<td align="right">' + v.CURR_CD + '</td>';
					context += '<td align="right">' + v.OVL_STS + '</td>';
					if(v.DELI_BLOCK_CD == 'Z3'){
											
						var confirmEle = '<input class="external_list_button" data-docNo="' + v.DOC_NO + '" type="button" value="Confirm" style="width:73px">';
						var rejectEle = '<input class="external_list_button_red" data-docNo="' + v.DOC_NO + '" type="button" value="Reject" style="width:73px">';
						
						context += '<td width="95px" align="right">' + confirmEle + rejectEle +  '</td>';
						tr.innerHTML = context;
						
						// add confirm event listener
						tr.querySelector('.external_list_button').addEventListener('click', function(e) {
							var docNo = e.currentTarget.dataset.docno;
							var xhr = new XMLHttpRequest();
							xhr.open('POST', EXTERNAL_OMS.OMS_SERVER_URI + '/api/sales/confirm');
							xhr.setRequestHeader('Content-Type', 'application/json');
							xhr.setRequestHeader('Authorization', 'Bearer '+ EXTERNAL_OMS.token);
							
							// test ?
							/////////////////////////////////////////////////////////////////////////
							var custcd = document.getElementById("external_loginfo_id").textContent;
							/////////////////////////////////////////////////////////////////////////							
							var param = {
									  DOC_NO: v.DOC_NO			// SO Number
									, DLV_BLOCK: v.DLV_BLOCK	// delivery block
									, DIV: "HEAD"				// head, item ??
									, custCd: custcd			// test?
							};
							
							xhr.send(JSON.stringify(param));
							xhr.onreadystatechange = function() {
								if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
									var resData = JSON.parse(this.responseText);
									if (resData.CODE == '1') {// OK
										var docElms = document.querySelectorAll('[data-docNo]');									
										Array.prototype.forEach.call(docElms, function(elm) {	
											if(elm.getAttribute('data-docno') == docNo){
												elm.setAttribute('hidden', true); 
											}
										});
										alert('success.');
									} else {
										alert('<s:message code="error.fail"/>');
									}
								}else if(xhr.status != 200){
									alert('<s:message code="error.fail"/>');
								}
							};
						});

						
						// add reject event listener
						tr.querySelector('.external_list_button_red').addEventListener('click', function(e) {							
							
							var docNo = e.currentTarget.dataset.docno;
							/////////////////////////////////////////////////////////////////////////
							var custcd = document.getElementById("external_loginfo_id").textContent;
							/////////////////////////////////////////////////////////////////////////
							
							// var checkPopup = document.getElementById('reject_popup');							
							EXTERNAL_OMS.createHeadRejectPopup(docNo, "G5", "HEAD", custcd);
							$("#reject_popup").show();
							// checkPopup.style.display = 'block';
						});
						
					}else{
						context += '<td>' + '</td>';
						// add click event listener
						tr.innerHTML = context;
					}
					tr.addEventListener('click', function(e) {
						Array.prototype.forEach.call(salesOrderTable.getElementsByTagName("tr"), function(v) {	
							$('[data-doc-no="' + v.dataset.docNo + '"]').removeClass('external_table_d_active');
						});
						var docNo = e.currentTarget.dataset.docNo;
						$(this).addClass('external_table_d_active');
						EXTERNAL_OMS.drawSalesDetList(docNo);
					});
					
					salesOrderTable.appendChild(tr);
					
				});
				EXTERNAL_OMS.drawSalesDetList(firstDocNo);
			}
		},
		
		drawSalesDetList : function (docNo) {
			var salesOrderTable = document.querySelector('.external_table_d_title.salesDet_table');
			
			var context = '<tr><th width="120px"><s:message code="lead.status"/></th>';
				context += '<th width="50px"><s:message code="mail.grd.Seq"/></th>';
				context += '<th width="170px"><s:message code="ext.qc.Invoice.Item"/></th>';
			    context += '<th width="80px"><s:message code="ext.qc.Invoice.Quantity"/></th>';
			    context += '<th><s:message code="ext.qc.Invoice.Unit"/></th>';
			    context += '<th><s:message code="ext.qc.Invoice.NetPrice"/></th>';
  				context += '<th><s:message code="ext.qc.Invoice.NetValue"/></th>';
  				context += '<th><s:message code="quotation.grd.deliDate"/></th>';
  				context += '<th><s:message code="quotation.Allocatedqty"/></th>';
  				context += '<th><s:message code="quotation.confirm"/></th></tr>';
  				salesOrderTable.innerHTML = context;
  				
  			salesOrderTable = document.querySelector('.external_table_d.salesDet_table');	
  			salesOrderTable.innerHTML = '';
  			if(EXTERNAL_OMS.externalMap.salesOrderDetail.length  > 0){
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.salesOrderDetail, function(v) {
					if(v.DOC_NO == docNo){
						var tr = document.createElement('tr');
						tr.dataset.docNo = v.DOC_NO + ';' + v.ITEM_SEQ;
						context = '<td width="130px">' + v.OVL_DVL_STS + '</td>';
						context += '<td width="60px">' + v.ITEM_SEQ + '</td>';
						context += '<td width="180px">' + v.MATL_DESC + '</td>';
						context += '<td width="80px" style="padding-right:15px;">' + v.ORD_QTY + '</td>';
						context += '<td width="40px">' + v.ORD_UNIT_CD + '</td>';
						context += '<td width="80px">' + ((v.NET_PRICE == undefined)?'0,00':v.NET_PRICE) + '</td>';
						context += '<td width="80px">' + ((v.NET_VAL == undefined)?'0,00':v.NET_VAL) + '</td>';
						context += '<td width="110px">' + v.DELI_DT + '</td>';
						context += '<td width="110px">' + ''+ '</td>';
						if(v.H_DELI_BLOCK_CD != 'Z3' && v.L_DELI_BLOCK_CD == 'Z3' ){
						// if(1){
						
							var confirmEle = '<input class="external_list_button" data-Item="' + v.DOC_NO + ';' + v.ITEM_SEQ + '" type="button" value="Confirm" style="width:73px">';
							var rejectEle = '<input class="external_list_button_red" data-Item="' + v.DOC_NO + ';' + v.ITEM_SEQ + '" type="button" value="Reject" style="width:73px">';
							
							context += '<td>' + confirmEle + rejectEle +  '</td>';
							tr.innerHTML = context;
							
							// add confirm event listener
							tr.querySelector('.external_list_button').addEventListener('click', function(e) {
								var docNo = e.currentTarget.dataset.item;
								var xhr = new XMLHttpRequest();
								xhr.open('POST', EXTERNAL_OMS.OMS_SERVER_URI + '/api/sales/confirm');
								xhr.setRequestHeader('Content-Type', 'application/json');
								xhr.setRequestHeader('Authorization', 'Bearer '+ EXTERNAL_OMS.token);
								
								// test ?
								/////////////////////////////////////////////////////////////////////////
								var custcd = document.getElementById("external_loginfo_id").textContent;
								/////////////////////////////////////////////////////////////////////////
								var param = {
										  DOC_NO: v.DOC_NO			// SO Number
										, ITM_NUMBER: v.ITEM_SEQ	// item no
										, SCHED_LINE: "1"			// schedule line no
										, REQ_DLV_BL: v.DLV_BLOCK	// delivery block
										, DIV: "ITEM"				// head, item ??
										, custCd: custcd			// test?
								};
								
								xhr.send(JSON.stringify(param));
								xhr.onreadystatechange = function() {
									if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
										var resData = JSON.parse(this.responseText);
										if (resData.CODE == '1') {// OK
											var docElms = document.querySelectorAll('[data-Item]');
											Array.prototype.forEach.call(docElms, function(elm) {												
												if(elm.getAttribute('data-Item') == v.DOCNO + ';' + v.ITEMSEQ){
													elm.setAttribute('hidden', true); 
												}
											});
											alert('success.');
										} else {
											alert('<s:message code="error.fail"/>');
										}
									}else if(xhr.status != 200){
										alert('<s:message code="error.fail"/>');
									}
								};
							});
							
							// add confirm event listener
							tr.querySelector('.external_list_button_red').addEventListener('click', function(e) {
								
								var docNo = e.currentTarget.dataset.item;
								/////////////////////////////////////////////////////////////////////////
								var custcd = document.getElementById("external_loginfo_id").textContent;
								/////////////////////////////////////////////////////////////////////////
								
								// var checkPopup = document.getElementById('reject_popup');							
								EXTERNAL_OMS.createItemRejectPopup(v.DOC_NO, v.ITEM_SEQ, "1", "G5", "ITEM", custcd);
								$("#reject_popup").show();
								// checkPopup.style.display = 'block';
							});							
							
							
						}else{
							context += '<td>' + '</td>';
							// add click event listener
							tr.innerHTML = context;
						}
						salesOrderTable.appendChild(tr);
					}
				});
  			}			
		}, 
		
		isExsistInvoiceNo : function (arr, invono) {
			var bExsist = false;
			for (var i=0; i<arr.length; i ++) {
				if (arr[i].VBELN === invono) {
					bExsist = true;
					break;
				}
			}
			return bExsist;
		},
		
		drawInvoiceList : function () {
			var invoiceTable = document.querySelector('.invoice_table');
			var arr = [];
			if(EXTERNAL_OMS.externalMap.invoiceInfo.invoicelist.length > 0){
				Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.invoiceInfo.invoicelist, function(v) {
					var tr = document.createElement('tr');					
					context =  '<td>' + v.VBELN + '</td>';
					context += '<td>' + v.ARKTX + '</td>';
					context += '<td>' + v.FKIMG + '</td>';
					context += '<td>' + v.VRKME + '</td>';
					context += '<td>' + v.KBETR + '</td>';
					context += '<td>' + v.KWERT + '</td>';
					context += '<td>' + v.NETWR + '</td>';
					context += '<td>' + v.WAERK + '</td>';
					context += '<td>' + v.DDTEXT + '</td>';
					context += '<td>' + v.AUBEL + '</td>';
					tr.innerHTML = context;
					invoiceTable.appendChild(tr);
					
					if (arr.length>0) {
						if(! EXTERNAL_OMS.isExsistInvoiceNo (arr, v.VBELN) ) {
							arr.push({VBELN: v.VBELN});
						}
					} else {
						arr.push({VBELN: v.VBELN});	
					}					
				});
			}
			
			var itotalorder = EXTERNAL_OMS.externalMap.salesOrderMaster.length;
			var icompleted = arr.length;
			// Orders Completed Count
			document.getElementById('SD_COMPLETED').textContent = icompleted;
			var icnaceled = Number(document.getElementById('SD_CANCELED').textContent);
			
			document.getElementById('SD_OPEN').textContent = itotalorder - (icompleted + icnaceled);
		},
		
		drawNewOrder : function () {
			var gridModeulElm = document.querySelector('.grid.module');
			var gridBosElm = document.querySelector('.grid.bos');
						
			// add event listener for add module
			gridModeulElm.querySelector('.add_button.modul_add').addEventListener('click', function() {
				EXTERNAL_OMS.addModule();
			});
			
			// add event listener for add module
			gridBosElm.querySelector('.add_button.modul_add').addEventListener('click', function() {
				EXTERNAL_OMS.addBos();
			});
		},
		
		id : 1, // module, bos row id
		addModule : function () {
			
			var gridModeulElm = document.querySelector('.grid.module');
			
			// for data
			var moduleMap = {};
			Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.moduleList, function(v) {
				if (!moduleMap[v.MATL_GR_CD]) {
					var obj = {};
					obj.MATL_GR = v.MATL_GR;
					obj.ITEMS = [];
					moduleMap[v.MATL_GR_CD] = obj;
				}
				moduleMap[v.MATL_GR_CD].ITEMS.push({ WP_OUT: v.WP_OUT });
			});
			
			
			var item = document.createElement('div');
			item.classList.add('item');
			item.dataset.id = EXTERNAL_OMS.id;
			
			var content = '<p class="clear"><span class="grid_button"><input type="button" class="add_button modul_del" value="-" data-id="' + EXTERNAL_OMS.id++ + '">';
			content += '</span><ul class="line">';
			content += '<li class="custom-dropdown"><select data-itemsubmit="MATL_GR" ></select></li>';
			content += '<li class="powerclass custom-dropdown"><select data-itemsubmit="WP_OUT"></select></li>';
			content += '<li class="pcs"><input type="text" data-itemsubmit="PCS" style="ime-mode:disabled;" onkeyPress="return checkKeysInt(event);" onkeyUp="priceCalculation(this);" /></li>';
			content += '<li class="Watt"><input type="text" disabled data-itemsubmit="WATT" /></li>';				
			content += '<li class="price"><input type="text" placeholder="0,00" data-itemsubmit="PRICE" style="ime-mode:disabled;" onkeyPress="return checkKeysInt(event)" /></li>';
			content += '<li class="date_pik"><input type="text" data-type="date" data-itemsubmit="REQ_DELI_DT" moduledate-id="' + EXTERNAL_OMS.id + '"/></li></ul>';
			item.innerHTML = content;
						
			// for MATL_GR select
			var matlGrElm = item.querySelector('select[data-itemsubmit="MATL_GR"]');
			
			// draw
			content = '';
			content += '<option value="' + '' + '">' + '== Select ==' + '</option>';
			for (var code in moduleMap) {
				content += '<option value="' + code + '">' + moduleMap[code].MATL_GR + '</option>';
			}
			matlGrElm.innerHTML = content;
			
			// change event
			var wpOutElm = item.querySelector('select[data-itemsubmit="WP_OUT"]');
			matlGrElm.addEventListener('change', function(e) {
				var content = '';
				if (e.currentTarget.value != null && e.currentTarget.value != "") {
					Array.prototype.forEach.call(moduleMap[e.currentTarget.value].ITEMS, function(v) {
						content += '<option>' + v.WP_OUT + '</option>'
					});
				}
				wpOutElm.innerHTML = content;
			});
			
			// WP_OUT change event
			wpOutElm.addEventListener('change', function(e) {
				priceCalculation(this);
			});
			
			item.querySelector('.modul_del').addEventListener('click', function(e) {
				var id = e.currentTarget.dataset.id;
				var deleteItem = gridModeulElm.querySelector('.item[data-id="' + id + '"]');
				gridModeulElm.removeChild(deleteItem);
			});
			
			var plusElm = gridModeulElm.querySelector('.plus');
			gridModeulElm.insertBefore(item, plusElm);
			
			$("input[moduledate-id=" + EXTERNAL_OMS.id + "]").removeClass('hasDatepicker').datepicker({dateFormat:'dd.mm.yy'}).val($('#REQ_DELI_DT').val()); 
			
			var event = document.createEvent('Event');
			event.initEvent('change', false, true); 
			matlGrElm.dispatchEvent(event);	
		},
		
		addBos : function () {
			
			var gridBosElm = document.querySelector('.grid.bos');
			
			var item = document.createElement('div');
			item.classList.add('item');
			item.dataset.id = EXTERNAL_OMS.id;
			
			var content = '<p class="clear"><span class="grid_button"><input type="button" class="add_button bos_del" value="-" data-id="' + EXTERNAL_OMS.id +'"></span>';
			content += '<ul class="line">';
			content += '<li class="bos_type custom-dropdown"><select data-itemsubmit="KIND_CD" id="KIND_CD' + EXTERNAL_OMS.id + '"></select></li>';			
			content += '<li class="bos_type custom-dropdown"><select data-itemsubmit="COUNTRY_CD" id="COUNTRY_CD' + EXTERNAL_OMS.id + '"></select></li>';
			content += '<li class="custom-dropdown"><select data-itemsubmit="MATL_CD" style="width:250px;" data-matlid="' + EXTERNAL_OMS.id + '"></select></li>';
			content += '<li class="pcs"><input type="text" data-itemsubmit="PCS" style="ime-mode:disabled;" onkeyPress="return checkKeysInt(event)" /></li>';
			content += '<li class="date_pik"><input type="text" data-type="date"  data-itemsubmit="REQ_DELI_DT" bosdate-id="' + EXTERNAL_OMS.id + '" /></li></ul>';
			item.innerHTML = content;
							
			// for kind select
			var kindEle = item.querySelector('select[data-itemsubmit="KIND_CD"]');
			var countryEle = item.querySelector('select[data-itemsubmit="COUNTRY_CD"]');
			var selectId = item.getAttribute('data-id');
			EXTERNAL_OMS.drawCombobox(kindEle);	
			kindEle.addEventListener('change', function(e) {
				 changeProduct(e.currentTarget.value + '|' + document.querySelector('select[id="COUNTRY_CD' + selectId + '"]').value, selectId);
			});
			
			// for kind select
			countryEle.addEventListener('change', function(e) {
				changeProduct(document.querySelector('select[id="KIND_CD' + selectId + '"]').value + '|' + e.currentTarget.value, selectId);
			});
			EXTERNAL_OMS.drawCombobox(countryEle);
			// console.log($(countryEle).val());
			$(countryEle).val($('select[data-selectbox="COUNTRY_CD"]').val());
			
			item.querySelector('.bos_del').addEventListener('click', function(e) {
				var id = e.currentTarget.dataset.id;
				var deleteItem = gridBosElm.querySelector('.item[data-id="' + id + '"]');
				gridBosElm.removeChild(deleteItem);
			});
							
			var plusElm = gridBosElm.querySelector('.plus');
			gridBosElm.insertBefore(item, plusElm);
			
			$("input[bosdate-id=" + EXTERNAL_OMS.id++ + "]").removeClass('hasDatepicker').datepicker({dateFormat:'dd.mm.yy'}).val($('#REQ_DELI_DT').val());
			
			changeProduct(document.querySelector('select[id="KIND_CD' + selectId + '"]').value + '|' + document.querySelector('select[id="COUNTRY_CD' + selectId + '"]').value, selectId);
		}		
	};
	
	function searchSOMaster () {
		var key = document.getElementById("key").value;
		var keyword = document.getElementById("keyword").value;
		
		removeSOMaster();
		EXTERNAL_OMS.drawSalesMstList(key, keyword);
	}
		
	function removeSOMaster () {
		var soitem = document.querySelector('.external_table_d.salesMst_table');
		while (soitem.firstChild) soitem.removeChild(soitem.firstChild);
		
		var soitemdetail = document.querySelector('.external_table_d.salesDet_table');
		while (soitemdetail.firstChild) soitemdetail.removeChild(soitemdetail.firstChild);
	}
	
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
	
	setTimeout(function() {
		var elm = document.querySelector('.tab2 .tab2links');
		var event = document.createEvent('Event');
		event.initEvent('click', false, true);
		elm.dispatchEvent(event);
	}, 500);
	
	function bindEvent() {
		
		var deliElm = document.querySelectorAll('[name="DELIV_DIV"]');
		Array.prototype.forEach.call(deliElm, function(elm) {					
			elm.addEventListener('change', function(e) {
				if(e.currentTarget.id == 'RadioGroup1_0'){
					document.querySelector('[id="DELI_INFO"]').removeAttribute('hidden'); 
				}else{
					document.querySelector('[id="DELI_INFO"]').setAttribute('hidden', true);					
				}
			});
		});
		
		var chkEquipElm =  document.querySelector('[data-submit="IS_UNLOAD_EQUIP" ]'); 
		chkEquipElm.addEventListener('click', function(e) {
			if(chkEquipElm.checked){
				document.querySelector('[data-submit="UNLOAD_EQUIP_COMMENT"]').removeAttribute('disabled');		
			}else{
				document.querySelector('[data-submit="UNLOAD_EQUIP_COMMENT"]').value ='';
				document.querySelector('[data-submit="UNLOAD_EQUIP_COMMENT"]').setAttribute('disabled', true);
			}
		});
		
		
		// check popup open event
		var  checkPopup = document.getElementById('check_popup');
		var applyBtn = document.querySelector('.external_shop_button');
		applyBtn.addEventListener('click', function(e) {
			//??? ??
			
			var flag = false;
			var inValidElm = '';
			
			var pono = document.querySelector('input[data-submit=PROJECT_AND_PON]').value;
			if (pono == "") {
				inValidElm = "<s:message code="ext.qc.NewOrder.projectName"/>";
				alert("<s:message code='errors.required' arguments='" + inValidElm + "' javaScriptEscape='false'/>");
				checkPopup.style.display = 'none';
				return false;
			}
			
			// pick up ? ??? ship to ?? ??
			var bdelivcd = document.getElementById("RadioGroup1_1").checked;
			if (!bdelivcd) {				
				var mandantoryElm = document.querySelectorAll('[data-mandantory]');
				Array.prototype.forEach.call(mandantoryElm, function(elm) {
					if((null == elm.value) || ("" == elm.value)){
						inValidElm = 'Ship-to';
						flag = true;
					}
				});
			}
			
			var bosElms = document.querySelectorAll('.bos .item');
			Array.prototype.forEach.call(bosElms, function(elm) {
				var itemElms = elm.querySelectorAll('[data-itemsubmit]');
				Array.prototype.forEach.call(itemElms, function(itemElm) {
					if((null == itemElm.value) || ("" == itemElm.value)){
						inValidElm = 'Bos';
						flag = true;
					}
				});
			});
			var moduleElms = document.querySelectorAll('.module .item');
			Array.prototype.forEach.call(moduleElms, function(elm) {
				var item = {};
				var itemElms = elm.querySelectorAll('[data-itemsubmit]');
				Array.prototype.forEach.call(itemElms, function(itemElm) {
					if((null == itemElm.value) || ("" == itemElm.value)){
						inValidElm = 'Module';
						flag = true;
					}
				});
			});
			
			if (bosElms.length == 0 && moduleElms.length == 0 ) {
				inValidElm = 'Bos or Module';
				flag = true;
			}
			
			if(flag){
				alert("<s:message code='errors.required' arguments='" + inValidElm + "' javaScriptEscape='false'/>");
				checkPopup.style.display = 'none';
				return false;
			}else{
				EXTERNAL_OMS.createChkPopup();
				checkPopup.style.display = 'block';
			}
		});
		
		// check popup close event
		var orderbackBtn = document.getElementById('orderback');
		orderbackBtn.addEventListener('click', function(e) {
			checkPopup.style.display = 'none';
		});
		
		// submit event
		document.getElementById('ordersubmit').addEventListener('click', function(e) {
			
			var xhr = new XMLHttpRequest();
			xhr.open('POST', EXTERNAL_OMS.OMS_SERVER_URI + '/api/sales/quotations');
		
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.setRequestHeader('Authorization', 'Bearer '+ EXTERNAL_OMS.token);
			
			var orderData = {};
			var submitElms = document.querySelectorAll('[data-submit]');
			Array.prototype.forEach.call(submitElms, function(elm) {					
				if ((elm || {}).type === 'checkbox') {
					orderData[elm.dataset.submit] = ((elm.checked)?"Y": "N");
				} else if ((elm || {}).type === 'radio') {
					if (elm.checked) {
						orderData[elm.dataset.submit] = elm.value;	
					}
				} else {
					orderData[elm.dataset.submit] = elm.value;	
				}
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
			
			var bosElms = document.querySelectorAll('.bos .item');
			var bosList = [];
			Array.prototype.forEach.call(bosElms, function(elm) {
				var item = {};
				var itemElms = elm.querySelectorAll('[data-itemsubmit]');
				Array.prototype.forEach.call(itemElms, function(itemElm) {
					item[itemElm.dataset.itemsubmit] = itemElm.value;
				});
				bosList.push(item);
			});
			orderData.bosList = bosList;
			orderData['ORDER_H_NUM'] = Math.round(new Date().getTime()/1000.0);
			
			// test ?
			/////////////////////////////////////////////////////////////////////////
			var custcd = document.getElementById("external_loginfo_id").textContent;
			orderData['custCd'] = custcd;
			/////////////////////////////////////////////////////////////////////////
			
			xhr.send(JSON.stringify(orderData));
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
					
					var resData = JSON.parse(this.responseText);
					if (resData.CODE == '1') {// OK	
						EXTERNAL_OMS.initializeNewOrder();					
						alert('success.');
						checkPopup.style.display = 'none';
					} else {
						alert('<s:message code="error.fail"/>');
						checkPopup.style.display = 'none';
					}
				}else if(xhr.status != 200){
					alert('<s:message code="error.fail"/>');
					checkPopup.style.display = 'none';
				}
			};
		});
	}
	
	function changeProduct(data, id) {
		var gridBosElm = document.querySelector('.grid.bos');
		
		// console.log(">>>>" + data);
		var matlCdElm = gridBosElm.querySelectorAll('select[data-itemsubmit="MATL_CD"]');
		var content = '';
		content += '<option value="' + '' + '">' + '== Select ==' + '</option>';				
		Array.prototype.forEach.call(EXTERNAL_OMS.externalMap.bomList, function(v) {
			if ((data.indexOf("INV")>-1) && (v.KIND_CD.indexOf("*")>-1)) {
				var countryArr = data.split("|");
				// console.log(">>" + countryArr.length);
				// console.log(">>" + countryArr[1]);
				if (countryArr[1] != "") {// exception empty country code
					content += '<option value="' + v.MATL_CD + '">' + v.MATL_DESC + '</option>';
				}
			} else {
				if (data == v.KIND_CD) {
					content += '<option value="' + v.MATL_CD + '">' + v.MATL_DESC + '</option>';						
				}	
			}
		});
		Array.prototype.forEach.call(matlCdElm, function(v) {
			if(v.getAttribute('data-matlid') == id){
				v.innerHTML = content;
			}
		});
	}
	
	
	function checkKeysInt(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || keyID == 44){
			return;
		}
		else{
			return false;
		}
	}
	
	function priceCalculation(ele) {
		
		var ppNode = ele.parentNode.parentNode;
		
		var pcs = ppNode.querySelector('input[data-itemsubmit="PCS"]').value;	
		var wpout = ppNode.querySelector('select[data-itemsubmit="WP_OUT"]').value;		
		wpout = createNormalFm(wpout);
		var watt = (Number(wpout) * Number(pcs));
		var iWatt = parseInt(watt);
		// console.log(iWatt);
		var sWatt = createGridNumFm(watt.toString(), true);
		ppNode.querySelector('input[data-itemsubmit="WATT"]').value = sWatt;
	}
	
	
	function createGridNumFm(num, bPoint){
		var rtnVal = "";
		
//		var num = text.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
		var tempArr = num.split(".");
		
		if(!fn_empty(num)){
			if(1 < tempArr.length){
				// console.log(tempArr);
				rtnVal = tempArr[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ',' + tempArr[1];
			}else{
				if (bPoint != null && bPoint != undefined) {
					rtnVal = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
				} else {
					rtnVal = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")+ ',00';
				}
			}
		}else{
			rtnVal = '';
		}
		
		return rtnVal;
	}
	
	
	function createNormalFm(text) {
		var rtnVal = "";
		var tempArr;
		var tempVal = text.toString();  
		
		if(!fn_empty(tempVal)){
			if (-1 < tempVal.indexOf(',')) {
				tempArr = tempVal.split(",");
				rtnVal = fn_replaceAll(tempArr[0], '.', '') + '.' + tempArr[1];
			}else{
				rtnVal = fn_replaceAll(tempVal, '.', '');
			}
		}
		
		return rtnVal;
	}
	
	function fn_empty(val) {
		if (typeof val == 'undefined')
			return true;
		else if (val == null)
			return true;
		else if (val.length < 1)
			return true;
		return false;
	}
	
	function fn_replaceAll(str, searchStr, replaceStr) {
		if (fn_empty(str) == false)
			str = str.split(searchStr).join(replaceStr)
		return str;
	}
	
	if (EXTERNAL_OMS.externalMap != null && EXTERNAL_OMS.externalMap != undefined) {
		// console.log(EXTERNAL_OMS.externalMap);
		if (EXTERNAL_OMS.externalMap.custinfo.SALE_YN == "N") {				
			alert('<s:message code="error.cannotso"/>');
		}
		
		//////////////////////////////////////////////////////////////	
		EXTERNAL_OMS.drawCombobox();// ok
		EXTERNAL_OMS.drawGerenalInfo();// ok
		EXTERNAL_OMS.drawShipInfo();// ok	
		EXTERNAL_OMS.drawQuotationMstList();// ok	
		EXTERNAL_OMS.drawSalesMstList("", "");// ok
		EXTERNAL_OMS.drawInvoiceList();// ok	
		EXTERNAL_OMS.drawNewOrder();// ok
		EXTERNAL_OMS.init();// ok
		
		$('#REQ_DELI_DT').removeClass('hasDatepicker').datepicker({dateFormat:'dd.mm.yy'});
		bindEvent();
		searchSOMaster();
	}
	
</script>
</body>
</html>
