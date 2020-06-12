<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%-- JSTL Function --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: auto;
}
</style>
</head>
<body>

<br>
<br>
<a href="/mymovie/Myedit"> 정보수정</a>
<br>
<br>
<a href="/mymovie/Mybooklist"> 예매내역</a>
<br>
<br>
<a href="/mymovie/Mywriting"> 내가 쓴 글</a>
<br>
<br>
<br>
<br>
<br>
<a href="/mymovie/withdrawal"> 회원탈퇴</a>

<table>
	<tr>	
		<td> 아이디
		<td><input type="text" name = "name">
	</tr>
	
	<tr>
		<td>비밀번호
		<td><input type="password">
	</tr>
	
	<tr>	
		<td>닉네임
		<td><input type="text"> 
	</tr>
	
	<tr>
		<td>휴대폰
		<td>010 - <input type="text" style="width: 50px;"> - <input type="text" style="width: 50px;">
	</tr>
	
	<tr>
		<td>이메일
		<td><input type="text">@
		<select>
			<option>naver.com</option>
			<option>nate.com</option>
		</select>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</tr>
	
</table>

</body>
</html>