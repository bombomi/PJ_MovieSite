<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 수정 확인 페이지</title>
</head>
<body>

<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>

<h2>게시글 수정하시겠습니까?</h2>
<form action="modifyView" method="post">
	<input type="hidden" name="board_id" value="${board_id}">
	<input type="hidden" name="pageNum" value="${pageNum}">

<table>

	<tr>
		<td><input type="submit" value="예">
		<input type="button" value="아니오." onclick="window.history.back();">
	</tr>


</table>

</form>



</body>
</html>