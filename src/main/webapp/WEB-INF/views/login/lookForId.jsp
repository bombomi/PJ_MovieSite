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
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#idcheck").click(function() {
			var url = "<%=contextPath%>"+"/idcheck";
			$("#chId").attr("action", url);
			$("#chId").submit();
		});
	});
</script>
	<form id = "chId" method = "post">
		<input type = "hidden" name = "user_email" value = "${UserDto.user_email}">
		아이디찾기
		<hr width = "80%">
		<br>
		이메일을 입력해주세요.
		<br><br>
		EMail : <input type = "text" name = "user_email"> <input type = "button" value = "다음" id = "idcheck">
	<br>
	이메일 입력 후 맞다면 <a href = "<%=contextPath %>/findId">아이디 찾은 페이지</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login">로그인 페이지</a>
	</form>
</body>
</html>