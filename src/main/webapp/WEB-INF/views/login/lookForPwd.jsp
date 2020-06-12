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
	비밀번호 찾는 페이지
	<hr width = "80%">
	아이디, 이메일 입력값이 조건과 다르다면 경고창<br>
	맞다면 비밀번호찾기(변경)페이지로<a href = "<%= contextPath %>/findPwd" method = "post">이동</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>