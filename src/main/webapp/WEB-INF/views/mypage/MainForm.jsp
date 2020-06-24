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
<style>
table {
	margin: auto;
}

div.button {
	margin: auto;
	
	width: 20%;
}

div.button input {
	padding: 5px;
	width: 100%;
	font-size: 14px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#memberUpdateBtn").on("click", function() {
			$("#myFrom").submit();
		})

	})
</script>
</head>
<body>
	<form action="<%=contextPath%>/updateUserList" method="get" id="myFrom">
		<input type="hidden" name="id" value="${USerDto.member_id}">
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="member_id" value="${UserInfo.member_id}"
					readonly="readonly"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input name="member_pwd" value="${UserInfo.member_pwd}"
					></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td><input name="member_nick" value="${UserInfo.member_nick}"
					></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input name="member_email" value="${UserInfo.member_email}"
					></td>

			</tr>
			<tr>
				<th rowspan="2"><input type="submit" value="수정"></th>
			</tr>

		</table>
	</form>
	<br>
	<br>

	<form method="post" action="update." id="member">
		<div class="button">
			<input id="checkValue" type="button" class="btn btn-primary"
				onclick="location.href='<%=contextPath%>/mypage/ModifyForm'"
				value="회원정보수정"> <input type="button" class="btn btn-danger"
				onclick="history.go(-1)" value="뒤로가기">
		</div>
	</form>



</body>
</html>