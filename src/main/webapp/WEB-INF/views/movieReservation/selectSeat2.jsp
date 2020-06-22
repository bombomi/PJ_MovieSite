<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자리 선택입니다@@</h1>

한 열 당 최대 자리수 : <input type="text" value="${scrHallSeatList.SEATCOL}"><br>
한 관의 최대 열 수  : <input type="text" value="${scrHallSeatList.SEATROW}">



</body>
</html>