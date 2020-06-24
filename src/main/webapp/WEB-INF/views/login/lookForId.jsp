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
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
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