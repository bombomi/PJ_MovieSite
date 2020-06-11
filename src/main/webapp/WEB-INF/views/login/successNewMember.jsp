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
	회원가입 성공시 보이는 페이지
	<hr width = "80%">
	
	회원가입에 성공하셨습니다 or 회원이 되신 것을 환영합니다
	<br>
	로그인 페이지로 이동
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>