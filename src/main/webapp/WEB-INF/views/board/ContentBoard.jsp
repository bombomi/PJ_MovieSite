<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부귀영화 상세 페이지</title>
</head>
<body>

<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>


<h2><center>상세 페이지</center></h2>
<input type="hidden" name="pageNum" value="${pageNum}">
<input type="hidden" name="number" value="${number}">
<table align="center">
	<tr>
		<th style="width:150px"> 글 번호 </th>
		<td style="width:150px" align="center">${dto.board_id}</td>
		
		<th style="width:150px"> 조회수 </th>
		<td style="width:150px" align="center">${dto.read_cnt }</td>
	</tr>
	
	<tr>
		<th style="width:150px"> 작성자 </th>
		<td style="width:150px">${dto.board_writer}</td>
		
		<th style="width:150px"> 작성일 </th>
		<td style="width:150px">${dto.reg_date}
		<!-- <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value=""/> -->
		</td>
	</tr>
	
	<tr>
		<th> 글제목 </th>
		<td colspan="3" align="center">${dto.board_title}</td>
	</tr>
	
	<tr>
		<th> 글내용</th>
		<td colspan="3" style="width:200px" word-break:break-all>${dto.board_content}</td>
		
		<!-- word-break: break-all 글자 단위 자동 줄바꿈 - 권장
					   : keep-all 단어기준 자동 줄바꿈
		-->
	</tr>
	
	<!-- <tr>
		<td colspan="4"><textarea cols="100" rows="8"></textarea>
	</tr> -->
	
	<tr>
		<th colspan="4">
			 <input type="button" value="글수정" onclick="window.location='modifyForm?board_id=${dto.board_id}&pageNum=${pageNum}'">
			<input type="button" value="글삭제" onclick="window.location='deleteForm?board_id=${dto.board_id}&pageNum=${pageNum}'">
			<input type="button" value="목록보기" onclick="window.location='BoardList?pageNum=${pageNum}'">
		</th>
	</tr>
</table>	
</body>
</html>