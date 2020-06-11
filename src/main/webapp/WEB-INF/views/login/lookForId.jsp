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
	아이디 찾는 페이지
	<hr width = "80%">
	아이디 입력 후 틀리면 경고창 뜸
	<br>
	아이디 입력 후 맞다면 <a href = "<%=contextPath %>/findId" method = "post">아이디 찾은 페이지</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>