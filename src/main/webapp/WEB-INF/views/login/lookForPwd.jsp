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
	<form action = "<%=contextPath %>/login/findPwd" method = "post">
	<br><br>
		ID : <input type = "text" name = "member_id" id = "member_id"><br>
		EMAIL : <input type="text" name="member_email" id="member_email">
		<input type="text" name="member_email2" id="member_email2"><br>
	
	<input type = "submit" value = "비밀번호찾기" id="findPwd">
	</form>
	<br>
	<br>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>