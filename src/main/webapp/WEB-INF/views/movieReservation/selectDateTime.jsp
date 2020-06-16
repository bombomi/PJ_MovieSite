<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%String contextPath= request.getContextPath(); %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%-- JSTL Function --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
	<td>theater_id</td>
	<td>movie_id</td>
	<td>movie_dateTime</td>
	</tr>


		<c:forEach var="movieDateList" items="${movieDateList}" varStatus="status">
		<tr>
			<td>${movieDateList.theater_id}</td>
			<td>${movieDateList.movie_id}</td>
			<td>${movieDateList.movie_dateTime}</td>

		</tr>
		
		</c:forEach>
</table>		
<a href="<%=contextPath%>/selectSeat">좌석선택으로 이동</a>

</body>
</html>