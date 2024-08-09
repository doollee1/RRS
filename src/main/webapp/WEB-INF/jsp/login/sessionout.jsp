<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : sessionout
 * @Description : 로그인정보 세션 만료시 로그인 이동처리
 */
%>
<script type="text/javascript">
	alert('세션이 종료되어 로그인 화면으로 이동합니다.');
	top.location.href = '/';
</script>