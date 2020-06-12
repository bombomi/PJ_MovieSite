<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%String contextPath= request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장소와 영화에 맞는 시간과 날짜가 담긴 상영시간표를 출력합니다.
<a href="<%=contextPath%>/selectSeat">좌석선택으로 이동</a>
</body>
</html>