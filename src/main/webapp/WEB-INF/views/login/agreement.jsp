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
	회원가입 전 약관동의하는 페이지
	<hr width = "80%">
	약관 동의를 해야 회원가입 페이지로 <a href = "<%= contextPath %>/newMemberForm" method = "post">이동</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>