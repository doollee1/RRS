<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : chgStatusPopup
 */
%>
<div id="productPreView">
	
</div>

<script type="text/javascript">
$(function() {
	var year;
	var ssnGbn;
	
	$('#productPreView').dialog({
		title :'<s:message code='product.preview'/>',
		autoOpen : false,
		height: 1000,
		width: 1000,
		modal : true,
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			var url = "/product/selectPreView.do";
			var param = {"year"   	: $(this).data().year
					    ,"ssnGbn"   : $(this).data().ssnGbn
					    };
			fn_ajax(url, true, param, function(data, xhr){
				$("#productPreView").html(data.result);
			});
		}
	});
	
});

</script>