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
<meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%=request.getContextPath() %>/images/favicon.png" rel="icon">
  <link href="<%=request.getContextPath() %>/images/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
    rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<c:url value ='/css/bootstrap.min.css'/>" rel="stylesheet">



  <!-- Vendor CSS Files -->
  <link href="<c:url value ='/vendor/icofont/icofont.min.css'/>" rel="stylesheet">
  <link  href="<c:url value ='/vendor/line-awesome/css/line-awesome.min.css'/>" rel="stylesheet">
  <link  href="<c:url value ='/vendor/aos/aos.css'/>" rel="stylesheet">
  <link href="<c:url value ='/vendor/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<c:url value ='/css/style.css'/>" rel="stylesheet">
  

  <!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script  type="text/javascript"src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

function selectPossibleSeat(event) {
    var id=event.target.id;
    var allSeat=document.getElementsByName("scrHallSeat");
    var selectResult=document.getElementById("result");
    var selectSeat=document.getElementById(id);
    for (i = 0; i < allSeat.length; i++) {
    	allSeat[i].style.backgroundColor="#FFFFFF";
    	}
    selectSeat.style.backgroundColor="#FF0000";
    var selectedRow=String.fromCharCode(Number(id.substring(4, 6))+64);
    var selectedCol=Number(id.substring(6, 8));
    var html_="";
    html_+=selectedRow+"열"+selectedCol+"번"+"<br> 결제금액 : 10000원";
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
    	allSeat[i].style.backgroundColor="#FFFFFF";
    	}
    var id=event.target.id;
    var html_="";
    html_+="이미 예약된 자리입니다";
    selectResult.innerHTML=html_;
}
</script>
<style>
#contents{
	text-align: center;
}
table{
	margin:0 auto;
}
#screen tr td{
	width:300px;
	height:20px;
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>

<div id="contents">
<%	Map<String, String> scrHallSeatList=(Map<String, String>)request.getAttribute("scrHallSeatList");
	char maxRow=scrHallSeatList.get("SEATROW").charAt(0);//열(a~d)까지 중 최대 값인 d를 받아옴
	int maxCol=Integer.parseInt(String.valueOf(scrHallSeatList.get("SEATCOL")));//자리(1~8)까지 중 최대 값인 8을 받아옴.
%>
<br>

<table id="screen">
	<tr><td>Screen</td></tr>
</table>
<br><br>
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
<td value="<%=scrHallSeat_id%>" id="<%=scrHallSeat_id%>" name="scrHallSeatReserved" onclick="selectImpossibleSeat(event)" style="background-color: black;">
&nbsp;&nbsp;&nbsp;
</td>
<%		
if(reservIndex<(reservationIdList.size()-1))
	reservIndex++;

	}else{%>
<td value="<%=scrHallSeat_id%>" id="<%=scrHallSeat_id%>" name="scrHallSeat" onclick="selectPossibleSeat(event)">
&nbsp;&nbsp;&nbsp;
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
				&nbsp;&nbsp;&nbsp;
			</td>		
			<%}%>
		</tr>
	<%} %>

</table>
</c:if>
<hr>
<h5>자리 선택</h5><br>
<form action="<%=contextPath%>/pay" method="post">
	<div id="result"></div>
	<input type="hidden" name="timetable_id" value="<%=(String)request.getAttribute("timetable_id")%>">
	
	<input type="submit" value="예매하기">
</form>
</div>
 <!-- Vendor JS Files -->
  <script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery.min.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery-migrate.min.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/bootstrap/js/bootstrap.min.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/easing/easing.min.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/php-email-form/validate.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/isotope/isotope.pkgd.min.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/aos/aos.js'/>"/></script>
  <script type="text/javascript" src="<c:url value ='/vendor/owlcarousel/owl.carousel.min.js'/>"/></script>
  

  <!-- Template Main JS File -->
  <script type="text/javascript" src="<c:url value ='/js/main.js'/>"/></script>
  
</body>
</html>