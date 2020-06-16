<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>

<h2>글 수정</h2>

<c:if test="${selectCnt == 0}">
	<script type="text/javascript">
		alert("글 수정 실패하였습니다.");
	</script>
</c:if>

	<c:if test="${selectCnt != 0}">
		<form action="modifyPro" method="post">
			
			<!-- hidden은 form 태그 내에 있어야 한다.  -->
			<input type="hidden" name="board_id" value="${board_id}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			
			<table align="center">

				<tr>
					<th> 글 제목 </th>
					<td>
						<input class="input" type="text" name="board_title" maxlength="50"
							value="${dto.board_title}" style="width:270px">
					</td>
				</tr>
				
				<tr>
					<th> 글 내용 </th>
					<td>
						<textarea class="input" rows="10" cols="40" name="board_content" word-break:word-all>${dto.board_content}</textarea>
						
						<!-- word-break: break-all 글자 단위 자동 줄바꿈 - 권장
									   : keep-all 단어기준 자동 줄바꿈
						  -->
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="submit" value="글 수정">
						<input type="button" value="글 수정 취소" onclick="window.location='BoardList?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
			
		</form>
	</c:if>

</body>
</html>