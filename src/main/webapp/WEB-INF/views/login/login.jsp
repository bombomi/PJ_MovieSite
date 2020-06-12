<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
</style>
</head>
<body>
	로그인페이지
	<hr width = "80%">
	<br>
	<a href = "<%= contextPath %>/lookForId">아이디 찾기</a>|
	<a href = "<%= contextPath %>/lookForPwd">비밀번호 찾기</a>|
	<a href = "<%= contextPath %>/agreement">회원가입</a>
</body>
</html>