<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%-- JSTL Function --%>
<%
	String contextPath = request.getContextPath();
%>
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
<form action="<%=contextPath%>/updateUserList" method="get">
      <input type="hidden" name="id" value="${USerDto.member_id}">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td>비밀번호</td>
			<td><input type="password"></td>
		</tr>

		<tr>
			<td>닉네임</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td>이메일</td>
			<td><input type="text">@ <select>
					<option>naver.com</option>
					<option>nate.com</option>
					<option>gmail.com</option>
					<option>hotmail.com</option>
					<option>hanmail.net</option>

			</select></td>
		</tr>
		<tr>
		<th rowspan="2"><input type="submit" value="수정"></th>
		</tr>

	</table>
	</form>

</body>
</html>