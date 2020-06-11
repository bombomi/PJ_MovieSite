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
	회원가입 폼
	<hr width = "80%">
	아이디(중복확인)
	<br>
	비밀번호
	<br>
	비밀번호확인
	<br>
	닉네임(중복확인)
	<br>
	이메일 (@뒷주소(select))(중복확인)
	<br>
	중복확인시 중복된 값이 존재한다면 경고창 띄움/ 중복된 값이 없으면 없다고 알림창 띄움<br>
	중복확인을 하지 않고 가입버튼 누를 시 중복확인 하라는 경고창 띄움<br>
	비밀번호와 비밀번호확인의 값이 같지않을시 경고창<br>
	같을 시 가입성공<br>
	<a href = "<%= contextPath %>/successNewMember" method = "post">가입</a>
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>