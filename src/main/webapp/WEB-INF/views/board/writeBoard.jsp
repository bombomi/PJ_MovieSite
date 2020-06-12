<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<table>
		<tr>
			<th>작성자</th>
			<td><input class="input" type="text" name="writer"
				maxlength="20" placeholder="작성자를 입력하세요!" autofocus required>
			</td>
		</tr>

		<tr>
			<th>제목</th>
			<td><input class="input" type="text" name="subject"
				maxlength="50" style="width: 270px" placeholder="제목을 입력하세요!"
				required></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea class="input" rows="10" cols="40" name="content"
					style="width: 270px" placeholder="글내용을 입력하세요!"
					word-break:break-all>
					</textarea></td>
		</tr>

		<tr>
			<th colspan="2"><input class="inputButton" type="submit"
				value="작성"> <input class="inputButton" type="reset"
				value="작성취소"> <input class="inputButton" type="button"
				value="목록" onclick="window.location='boardList?pageNum=${pageNum}'">
			</th>
		</tr>

	</table>
</body>
</html>