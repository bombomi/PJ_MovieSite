<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 폼</title>
</head>
<body>

<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>
	
	<form action="deletePro" method="post">
	<h2>게시글을 삭제하시겠습니까?</h2>
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="board_id" value="${board_id}">
	
	<table>
		<tr>
			<td>
			<input type="submit" value="예">
			<input type="button" value="아니오" onclick="window.history.back();"> 
		</tr>
	</table>
	</form>
	
</body>
</html>