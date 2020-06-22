<%@page import="java.util.Map"%>
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
<%	Map<String, String> scrHallSeatList=(Map<String, String>)request.getAttribute("scrHallSeatList");
	char maxRow=scrHallSeatList.get("SEATROW").charAt(0);//열(a~d)까지 중 최대 값인 d를 받아옴
	int maxCol=Integer.parseInt(String.valueOf(scrHallSeatList.get("SEATCOL")));//자리(1~8)까지 중 최대 값인 8을 받아옴.
 	System.out.println(maxRow+"<-row and col->"+maxCol);
%>
한 열 당 최대 자리수 : <input type="text" value="<%=maxCol%>"><br>
한 관의 최대 열 수  : <input type="text" value="<%=maxRow%>">
<br>

<table>
<%for(char j='A';j<=maxRow;j++){ %>
<tr>
<td>
<%for(int i=1;i<=maxCol;i++){%>
출력
<%}%></td></tr>
<%} %>

</table>


</body>
</html>