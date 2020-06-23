<%@page import="com.movie.mymovie.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%-- JSTL Function --%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
<%      List<UserDto> userList=
	(List<UserDto>)request.getAttribute("userList"); 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
</style>
</head>
<body>
	아이디 찾은 페이지
	<hr width = "80%">
	ID : <c:forEach var = "UserDto" items = "${userList }">
			${UserDto.member_id}
	 	</c:forEach>
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>