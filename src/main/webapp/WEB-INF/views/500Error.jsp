<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.img {
	margin: 0px auto;
	text-align: center;	
}

</style>
</head>
<body>
	<div class = "img">
	<img src="<%=contextPath %>/images/500page.PNG">
	
	<br>
	
	<input type="button" value="메인으로" onclick="location.href='main/index'">
	</div>
</body>
</html>