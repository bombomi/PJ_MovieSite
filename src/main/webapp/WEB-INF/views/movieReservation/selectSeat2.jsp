<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.movie.mymovie.dto.PrintSeatListOnPage"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%String contextPath= request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script  type="text/javascript"src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

function selectPossibleSeat(event) {
    var id=event.target.id;
    var allSeat=document.getElementsByName("scrHallSeat");
    var selectResult=document.getElementById("result");
    var selectSeat=document.getElementById(id);
    for (i = 0; i < allSeat.length; i++) {
    	allSeat[i].style.color="#000000";
    	}
    selectSeat.style.color="#FF0000";
    var selectedRow=String.fromCharCode(Number(id.substring(4, 6))+64);
    var selectedCol=Number(id.substring(6, 8));
    var html_="";
    html_+="선택된 자리는? "+selectedRow+"열"+selectedCol+"번"+"<br> 결제금액 : 10000원";
    html_+="<input type='hidden' name='scrhallSeat_id' value='";
    html_+=id;
    html_+="'>";
    selectResult.innerHTML=html_;
}
function selectImpossibleSeat(event) {
    console.log(event.target.id);
    var selectResult=document.getElementById("result");
    var allSeat=document.getElementsByName("scrHallSeat");
    for (i = 0; i < allSeat.length; i++) {
    	allSeat[i].style.color="#FFFFFF";
    	}
    var id=event.target.id;
    var html_="";
    html_+="이미 예약된 자리입니다";
    selectResult.innerHTML=html_;
}
</script>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>


<%	Map<String, String> scrHallSeatList=(Map<String, String>)request.getAttribute("scrHallSeatList");
	char maxRow=scrHallSeatList.get("SEATROW").charAt(0);//열(a~d)까지 중 최대 값인 d를 받아옴
	int maxCol=Integer.parseInt(String.valueOf(scrHallSeatList.get("SEATCOL")));//자리(1~8)까지 중 최대 값인 8을 받아옴.
%>
<br>
<%-- 예약이 있는 경우!~!! --%>
<c:if test="${reservationCnt>0}">
<table border=".3">
<%
@SuppressWarnings("unchecked")
List<String> reservationIdList=(ArrayList<String>)request.getAttribute("reservationIdList");
int reservIndex=0;//예약리스트를 관리할 인덱스
for(char j='A';j<=maxRow;j++){ %>
<tr id="scrHallRow">
<%for(int i=1;i<=maxCol;i++){
String scrHallSeat_id=PrintSeatListOnPage.printPage(Integer.parseInt((String)request.getAttribute("theater_id")),
		Integer.parseInt((String)request.getAttribute("scrhall_id")), j,i);
%>
<%if(scrHallSeat_id.equals(String.valueOf(reservationIdList.get(reservIndex)))){
	//System.out.println("equal=="+reservationIdList.get(reservIndex));
%>
<td value="<%=scrHallSeat_id%>" id="<%=scrHallSeat_id%>" name="scrHallSeatReserved" onclick="selectImpossibleSeat(event)">
■
</td>
<%		
if(reservIndex<(reservationIdList.size()-1))
	reservIndex++;

	}else{%>
<td value="<%=scrHallSeat_id%>" id="<%=scrHallSeat_id%>" name="scrHallSeat" onclick="selectPossibleSeat(event)">
□
</td>		

	<%}
}%>
</tr>
<%} %>

</table>
</c:if>

<c:if test="${reservationCnt<=0 }">
<table border=".3">
<%
@SuppressWarnings("unchecked")
List<String> reservationIdList=(ArrayList<String>)request.getAttribute("reservationIdList");
int reservIndex=0;
	for(char j='A';j<=maxRow;j++){ %>
		<tr id="scrHallRow">
			<%for(int i=1;i<=maxCol;i++){
				String scrHallSeat_id=PrintSeatListOnPage.printPage(Integer.parseInt((String)request.getAttribute("theater_id")),
				Integer.parseInt((String)request.getAttribute("scrhall_id")), j,i);
			%>
			<td value="<%=scrHallSeat_id%>" id="<%=scrHallSeat_id%>" name="scrHallSeat" onclick="selectPossibleSeat(event)">
				□
			</td>		
			<%}%>
		</tr>
	<%} %>

</table>
</c:if>
<hr>
<h5>선택된 좌석은?</h5><br>
<form action="<%=contextPath%>/pay" method="post">
	<div id="result"></div>
	<input type="hidden" name="timetable_id" value="<%=(String)request.getAttribute("timetable_id")%>">
	
	<input type="submit" value="예매하기">
</form>

</body>
</html>