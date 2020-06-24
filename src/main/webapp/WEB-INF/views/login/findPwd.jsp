<%@page import="com.movie.mymovie.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%-- JSTL Function --%>
<%
	String contextPath = request.getContextPath();
%>
<%      List<UserDto> userPwdList=
	(List<UserDto>)request.getAttribute("userPwdList"); 
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
	비밀번호찾은페이지
	<hr width = "80%">
	PASSWORD : <c:forEach var = "UserDto" items = "${userPwdList}">
			${UserDto.member_pwd}
	 	</c:forEach>
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>