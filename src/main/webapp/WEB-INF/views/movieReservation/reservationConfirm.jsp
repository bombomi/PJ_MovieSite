<%@page import="com.movie.mymovie.dto.PrintSeatListOnPage"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
	text-align: center;
}
table{
	margin: 0 auto;
}
#confirmCategory{
	width: 150px;
	height: 30px;
}
#confirmContents{
	width: 180px;
	height: 30px;
	
}
</style>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
 	<input type="hidden" name = "member_id" value="${member.getMember_id()}">
<% Map<String, Object> confirmInfo=(Map<String,Object>)request.getAttribute("confirmInfo"); %> 	
<hr>
<h3>예약이 완료되었습니다!</h3>
<hr>
<table>
	<tr>
		<th id="confirmCategory"></th>
		<th id="confirmContents"></th>		
	</tr>
	
	<tr>
		<td>영화제목
		</td>
		<td><%=(String)confirmInfo.get("MOVIE_TITLE") %>
		</td>
	</tr>
		<tr>
		<td>결제금액
		</td>
		<td>10000원
		</td>
	</tr>
		<tr>
		<td>날짜, 시간
		</td>
		<td><%=(String)confirmInfo.get("MOVIE_DATETIME") %>
		</td>
	</tr>
		<tr>
		<td>지점, 상영관
		</td>
		<td>
		<%=(String)confirmInfo.get("THEATER_NAME") %>,
			<%=(String)confirmInfo.get("SCRHALL_ID") %>관
		</td>
	</tr>
		<tr>
		<td>좌석
		</td>
		<td><%String srchallSeat_id=(String)((Map<String, Object>)request.getAttribute("paramMap")).get("scrhallSeat_id"); %>
			<%=PrintSeatListOnPage.rowColFormat(srchallSeat_id) %>
		</td>
	</tr>
</table>
</body>
</html>