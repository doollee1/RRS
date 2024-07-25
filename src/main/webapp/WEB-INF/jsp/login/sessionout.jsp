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
<c:if test="${sessionOut eq '1'}">
	alert('Session has expired. You have been taken to the login page.');
	parent.location.href = '/login/login.do';
</c:if>
</script>