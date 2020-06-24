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
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
<hr>
<form action="reservationConfirm" method="post">
<input type="hidden" name = "member_id" value="${member.getMember_id()}">

<h3>결제 수단 선택</h3>
<hr>
<input type="radio" name="payPlan" value="creditCard">신용카드 <br>
<input type="radio" name="payPlan" value="kakaoPay">카카오페이<br>
<p>결제금액 : 10000원</p>
<input type="hidden" name="scrhallSeat_id" value="<%=(String)request.getAttribute("scrhallSeat_id")%>"> 
<input type="hidden" name="timetable_id" value="<%=(String)request.getAttribute("timetable_id")%>"> 

<input type="submit" value="결제하기">
</form>
결제 페이지입니다. 결제 방식 선택, 결제 금액 확인
<a href="<%=contextPath%>/reservationConfirm">결제하기</a>

</body>
</html>