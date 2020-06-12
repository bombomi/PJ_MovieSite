<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><center>상세페이지</center></h2>
<table align="center">
	<tr>
		<th style="width:150px"> 글번호 </th>
		<td style="width:150px" align="center"></td>
		
		<th style="width:150px"> 조회수 </th>
		<td style="width:150px" align="center"></td>
	</tr>
	
	<tr>
		<th style="width:150px"> 작성자 </th>
		<td style="width:150px"></td>
		
		<th style="width:150px"> 작성일 </th>
		<td style="width:150px">
		<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value=""/>
		</td>
	</tr>
	
	<tr>
		<th> 글제목 </th>
		<td colspan="3" align="center"></td>
	</tr>
	
	<tr>
		<th> 글내용</th>
		<td colspan="3" style="width:200px" word-break:break-all> } </td>
		
		<!-- word-break: break-all 글자 단위 자동 줄바꿈 - 권장
					   : keep-all 단어기준 자동 줄바꿈
		-->
	</tr>
	
	<tr>
		<td colspan="4"><textarea cols="100" rows="8"></textarea>
	</tr>
	
	<tr>
		<th colspan="4">
			<input class="inputButton" type="button" value="글수정"
				onclick="window.location='modifyForm?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputButton" type="button" value="글삭제"
				onclick="window.location='deleteForm?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputButton" type="button" value="목록보기"
				onclick="window.location='boardList?pageNum=${pageNum}'">
		</th>
	</tr>
</table>	
</body>
</html>