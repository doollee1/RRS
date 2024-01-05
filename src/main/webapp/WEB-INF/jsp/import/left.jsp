<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		var setting = {
		    view: {
		        showLine: false,
		        selectedMulti: false,
		        dblClickExpand: false
		    },
		    data: {
		        simpleData: {
		            enable: true
		        }
		    }
		};
		
		var url = "/common/selectMenuList.do";
		fn_ajax(url, false, null, function(data, xhr){
			var result = data.result;
			var zNodes = treeModel( result, 'root');
			$.fn.zTree.init($("#zMenuTreeView"), setting, result);
		});
		
		$("#zMenuTreeView").click(function(e){
			var zTree = $.fn.zTree.getZTreeObj("zMenuTreeView");
			var nodes = zTree.getSelectedNodes();
			
			if (e.target.classList.contains('switch')) {
				e.stopPropagation();
			} else {
				if (!!nodes[0]) {
					$("#" + nodes[0].tId + "_switch").trigger("click");
				}
			}
		})
	});
	
	function selectLeftMenu(sys_cd){
		expandNode(sys_cd);
		var elm = document.querySelector('.tg_menu_close.tg_menu_close_after');
		if (!!elm) {
			var event = document.createEvent("Event");
			event.initEvent("click", false, true); 
			elm.dispatchEvent(event);
		}
	}
	
	function expandNode(sys_cd) {
		var zTree = $.fn.zTree.getZTreeObj("zMenuTreeView");
		zTree.expandAll(false);
		var nodes = zTree.getNodes();

		var callbackFlag = $("#callbackTrigger").attr("checked");
		zTree.expandNode(nodes[sys_cd], true, true, null, callbackFlag);
	}
</script>

<div id="main_left_menu" class="left_wrap">
<!-- ---좌측메뉴 토글버튼 -->
<div class="left_wrap_ztree_title" style="color:#ccc; font-size:13px; font-weight:500; margin:3px 0px 5px 35px; position:absolute;">
Resort Reservation System
</div>
<div>
<button class="tg_menu_close" href="#" onclick=""><i class="fa fa-bars"></i></font></button>
</div>
<!-- - -->
	<div class="leftmenu">
		<div id="zMenuTreeView" class="ztree" style="/*border-top: 1px solid #A6C9E2;*/ padding: 5px 0 0 0;overflow:auto;height:99%;"></div>
	</div>
	<div class="quickmenu_title"></div>
	<div class="quckmenu_wrap" >
		<div id="toplogininfo">
		<!-- <select id="LANGUAGE" name="LANGUAGE" class="cmc_combo">
		</select> -->
		<!--  <input type="hidden" id="G_COMP_CD" name="G_COMP_CD" value="${loginVO.compCd }" />--->
		<!-- <img src="/images/icon_userinfo.png" width="16" alt="" /> -->
		<!-- - <span>Welcome! ${loginVO.nameFull}</span> <br> --> 
		<!-- - Company : <span id="G_COMP_NM"></span> | --> 
		<a href='#' onclick="setting();"><i class="fa fa-cog"></i>&nbsp;Change</a> | 
		<a href='#' onclick="edituser();"><i class="fa fa-edit"></i>&nbsp; Setting</a> | 
		<a href='#' onclick="logout();"><i class="fa fa-sign-out"></i>&nbsp; Log off</a>
	</div>
		<!----
		<div class="row quickmenu_left">
			<a href="#"><div>
			<i class="fa fa-smile-o"></i><p>
				<span>Customer</span>
			</div></a>

			<a href="#"><div>
			<i class="fa fa-cube"></i><p>
				<span>product</span>
			</div></a>

			<a href="#"><div>
			<i class="fa fa-search"></i><p>
				<span>Bom</span>
			</div></a>
		</div>
		<div class="row quickmenu_left">
			<a href="#"><div>
			<i class="fa fa-comment-o"></i><p>
				<span>CJK</span>
			</div></a>

			<a href="#"><div>
			<i class="fa fa-cube"></i><p>
				<span>CJK</span>
			</div></a>

			<a href="#"><div>
			<i class="fa fa-cube"></i><p>
				<span>CJK</span>
			</div></a>
		</div>
		---->
		</div>
	</div>

<script>
(function() {
	$('.tg_menu_close').click(function() {
		$('#main_contents').toggleClass('content_wrap_after');
		$('#main_left_menu').toggleClass('left_wrap_after');
		$('.tg_menu_close').toggleClass('tg_menu_close_after');
		$('.ztree').toggleClass('ztree_after');
		$('.left_wrap_ztree_title').toggleClass('left_wrap_ztree_title_after');
		$('.quickmenu_left').toggleClass('quickmenu_left_after');
		$('.quickmenu_title').toggleClass('quickmenu_title_after');
		$('.quckmenu_wrap').toggleClass('quckmenu_wrap_after');
	});
})();
</script> 

