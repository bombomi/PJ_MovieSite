<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/script/jquery-3.1.1.js"></script >
<script type="text/javascript" src="resources/script/move.js"></script>	
<title>Insert title here</title>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="head_z"></div>
	<div class="section">
		<div class="loginmain">
			<div class="title">
			<c:choose>
				<c:when test="${islogin eq 'false' }">
				</c:when>
				<c:when test="${sign eq 'T'}">
				</c:when>
				<c:when test="${login eq '1'}">
				</c:when>
				<c:when test="${login eq '2'}">
				</c:when>
			</c:choose>
			</div>	
			<div class="login">
				<jsp:include page="login.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>