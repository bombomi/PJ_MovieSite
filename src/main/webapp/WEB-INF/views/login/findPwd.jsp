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
	비밀번호찾은페이지(찾았으니 변경가능)
	<hr width = "80%">
	
	비밀번호 입력 / 비밀번호 재입력<br>
	저 두 값이 일치하면 비밀번호변경 성공<br>
	변경성공 페이지로 <a href = "<%= contextPath %>/chPwd" method = "post">이동</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>