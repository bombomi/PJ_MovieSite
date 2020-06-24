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
<script type="text/javascript"
	src="<c:url value ='/vendor/jquery/jquery.min.js'/>" /></script>
<script type="text/javascript"
	src="<c:url value ='/js/jquery-3.3.1.min.js'/>" /></script>
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
		var flag = "${flag}";
		if(flag =="U")
		{
			alert("회원정보가 수정되었습니다.");
			return false;
		}
		
		$("#memberUpdateBtn").on("click", function() {
			$("#myFrom").submit();
// 			alert("회원정보가 수정되었습니다.");
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
				<td><input name="member_pwd" value="${UserInfo.member_pwd}"></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td><input name="member_nick" value="${UserInfo.member_nick}"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input name="member_email" value="${UserInfo.member_email}"></td>

			</tr>

			<tr>
				<th rowspan="4"><input type="submit" value="정보수정"></th>
			</tr>
			<tr>
				<th rowspan="2"><input type="button" class="btn btn-danger"
					onclick="history.go(-1)" value="뒤로가기">
			</tr>
		</table>
	</form>
	<br>
	<br>



</body>
</html>