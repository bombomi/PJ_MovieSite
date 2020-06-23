<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movie.mymovie.dto.UserDto"%>

<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	margin: auto;
}
</style>
<script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery.min.js'/>"/></script>
<script type="text/javascript" src="<c:url value ='/js/jquery-3.3.1.min.js'/>"/></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".replyWritnBtn").on("click", function(){
		var formObj = $("form[name='replyForm']");
		formObj.attr("action", "<%=contextPath%>/board/replyWrite");
		formObj.submit();
	});
	
	$(".replyWritnBtn").click(function() {
		if(document.getElementById("sessionUserId").value == "test" ) {
			  alert('비회원은 댓글 작성이 불가능합니다.');
			  return;
		}
	});
});

</script>
<title>부귀영화 상세 페이지</title>
</head>
<body>

	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>

	<h2>
		<center>상세 페이지</center>
	</h2>
	
	
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="number" value="${number}">
	<table>
		<tr>
			<th style="width: 150px">글 번호</th>
			<td style="width: 150px" align="center">${dto.board_id}</td>

			<th style="width: 150px">조회수</th>
			<td style="width: 150px" align="center">${dto.read_cnt }</td>
		</tr>

		<tr>
			<th style="width: 150px">작성자</th>
			<td style="width: 150px">${dto.user_id}</td>

			<th style="width: 150px">작성일</th>
			<td style="width: 150px">${dto.reg_date}<!-- <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value=""/> -->
			</td>
		</tr>

			<tr>
				<th>글제목</th>
				<td colspan="3" align="center">${dto.board_title}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td colspan="3" style="width: 200px" word-break:break-all>${dto.board_content}</td>
	
				<!-- word-break: break-all 글자 단위 자동 줄바꿈 - 권장
						   : keep-all 단어기준 자동 줄바꿈
			-->
			</tr>
		
		
			<tr>
				<td>
				<br>
				<br>
				<br>
				<br>
				<br>
			</tr>
			<tr>
			<th colspan="4">
			<c:if test='${dto.user_id == sessionUserId}'>
				<input type="button" value="글 수정" onclick="window.location='modifyForm?board_id=${dto.board_id}&pageNum=${pageNum}'">
				<input type="button" value="글 삭제" onclick="window.location='deleteForm?board_id=${dto.board_id}&pageNum=${pageNum}'">
			</c:if> 
			<input type="button" value="목록보기" onclick="window.location='BoardList?pageNum=${pageNum}'"></th>
		</tr>
	</table>
		
		<form name = "replyForm" method="post">
		 <input type="hidden" id="board_id" name="board_id" value="${dto.board_id}" />
		 	<input type="hidden" name="pageNum" value="${pageNum}">
		    <input type="hidden" name="number" value="${number}">
		    <input type="hidden" id="user_id" name="user_id" value="${sessionUserId}"/>
		<table>
			<tr>
				<td colspan="3">
				<textarea cols="100" rows="5" id = "comment_contents" name = "comment_contents"></textarea>
				<td colspan="1"><button type="button" class="replyWritnBtn">등록</button>
			</tr>
			<hr>
			
			<c:forEach items="${replyList}" var="replyList">
			<tr>	
				<td> ${replyList.user_id } 
				<td width="50%"> ${replyList.comment_contents }
				<td> ${replyList.reg_date }
			</tr>
			</c:forEach>
		</table>
		</form>
</body>
</html>