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
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- 	<form id = "chId" action = "<%=contextPath %>/login/findId" method = "post"> --%>
<%-- 		<input type = "hidden" name = "user_email" value = "${UserDto.user_email}"> --%>
<!-- 		아이디찾기 -->
<!-- 		<hr width = "80%"> -->
<!-- 		<br> -->
<!-- 		이메일을 입력해주세요. -->
<!-- 		<br><br> -->
<!-- 		EMail : <input type = "text" name = "user_email"> <input type = "button" value = "찾기" id = "idcheck"> -->
<!-- 	<br> -->
<%-- 	이메일 입력 후 맞다면 <a href = "<%=contextPath %>/login/findId">아이디 찾은 페이지</a> --%>
	<form action = "<%=contextPath %>/login/findId" method = "post">
	<br><br>
		EMAIL : <input type="text" name="member_email" id="member_email">
		<input type="text" name="member_email2" id="member_email2"><br>
	
	<input type = "submit" value = "아이디찾기" id="findId">
	</form>
	<br>
	<br>

	<span id="idList"></span>
	<br><br>
	<a href = "<%= contextPath %>/login/login">로그인 페이지</a>
	<!-- </form> -->
</body>
</html>