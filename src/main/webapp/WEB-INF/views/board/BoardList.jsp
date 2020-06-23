<%@page import="com.movie.mymovie.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부귀영화 커뮤니티</title>
<style type="text/css">
table {
	margin: auto;
	width: 1000px;
}

.select {
	width: 100px;
	margin: auto;	
}
</style>
</head>
<body>
<body>

	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>

	<h2 align="center">게시판</h2>
	
	<form action="<%=contextPath %>/searchWord" method="post">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table>
		<tr>
			<th colspan="6" align="center" style="height: 25px">글 목록
			(글 갯수:${cnt}) &nbsp;&nbsp;&nbsp; 
			<!-- 로그인 안 되어 있으면 글 쓰기 못 누름 -->
			<c:if test = "${member != null }">
			<a href="writeBoard?pageNum=${pageNum}"> 글 쓰기 </a>
			</c:if>
			</th>
		</tr>

		<tr>
			<th style="width: 15%">글 번호</th>
			<th style="width: 25%">글 제목</th>
			<th style="width: 10%">작성자</th>
			<th style="width: 15%">작성일</th>
			<th style="width: 5%">조회수</th>
		</tr>

		<!-- 게시글이 있으면  -->
		<c:if test="${cnt > 0 }">
			<c:forEach var="dto" items="${dtos}" varStatus="status">
				<tr>
					<td align="center">${board_id} 
					<c:set var="number" value="${number-1}" /> (${dto.board_id})
					</td>

					<td align="left">
						<!-- 상세페이지 --> <a
						href="ContentBoard?board_id=${dto.board_id}&pageNum=${pageNum}&number=${number+1}">${dto.board_title}</a>
					</td>

					<td align="center">${dto.user_id}</td>

					<td align="center">${dto.reg_date} <%-- <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}"/> --%>
					</td>

					<td align="center">${dto.read_cnt}</td>
				</tr>
			</c:forEach>
		</c:if>

		<!-- 게시글 없으면 -->
		<c:if test="${cnt < 0}">
			<tr>
				<td colspan="5" align="center">게시된 게시글이 없습니다.</td>
			</tr>
		</c:if>
	</table>
	
	<!-- 페이지 컨트롤  -->
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					<!-- 특수문자: ㅁ+한자키 -->
					<!-- 처음[◀◀]  / 이전블록[◀]  -->
					<c:if test="${startPage > pageBlock}">
						<a href="BoardList">[◀◀] </a>
						<a href="BoardList?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<span><b><a href="BoardList?pageNum=${i}">[${i}]</a></b></span>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶]  / 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="BoardList?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="BoardList?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	
	<table class="select">
		<tr>
			<td><input type="text" name = "board_title">
			<td><input type="submit" value="검색">
		</tr>
	</table>
</form>
</body>
</body>
</html>