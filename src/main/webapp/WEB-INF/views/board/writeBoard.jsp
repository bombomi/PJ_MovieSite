<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String contextPath = request.getContextPath();
	%>
	 <%= request.getAttribute("member_id") %>
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

	<h2 align="center">글 쓰기</h2>
	
	<form action="<%=contextPath%>/writePro" method="post">
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<table>
		<tr>
		<th>글 작성자
			<td><input type="text" name = "user_id" value="${member.getMember_id()}">
		</tr>

			<tr>
				<th>닉네임
				<td><input type="text" name="board_writer"
					value="${member.getMember_nick()}">
			</tr>

			<tr>
			
			<th>제목</th>
			<td><input type="text" name="board_title"
				maxlength="50" style="width: 270px" placeholder="제목을 입력하세요!"
				required></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="40" name="board_content"
					style="width: 270px" placeholder="글내용을 입력하세요!"
					word-break:break-all>
					</textarea></td>
		</tr>

		<tr>
			<th colspan="4">
				<input type="submit" value="작성"> 
				<input type="reset" value="작성취소"> <input class="inputButton" type="button"
				value="목록" onclick="window.location='BoardList">
			</th>
		</tr>

	</table>
	</form>
</body>
</html>