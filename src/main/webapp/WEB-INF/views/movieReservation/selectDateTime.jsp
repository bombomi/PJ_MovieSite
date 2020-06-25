<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%String contextPath= request.getContextPath(); %>
<% request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8");

%>
<%
response.setContentType("text/xml;charset=UTF-8");
%>
<% response.setContentType("text/html; charset=utf-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

$(document).ready(function(){
	
	   $("[name='timeTableDate']").click(function(){
	        if($(this).prop('checked')){
	        	$('input[type="checkbox"][name="timeTableDate"]').prop('checked',false);
	        	$(this).prop('checked', true);

	        	var theater_id = $("[name='theater_id']").val();
	        	//체크박스에 표시한 값들을 넘김.
	        	var selectedDate;
	        	$('input[name="timeTableDate"]:checked').each(function(i){
	        		selectedDate=$(this).val();
	        	});
	        	
	        	//JSON.stringify($('form[name="codeForm"]').serializeComponent()),
	        	var allData = {};
	        	allData["selectedDate"]=selectedDate;
	        	allData["theater_id"]=theater_id;
	        	$.ajax({
	        		contentType: "application/json; charset=UTF-8",
	        	    url:"<%=contextPath%>/ajaxDateSelect",
	        	    type:'GET',
	        	    dataType:"json",
	        	    data:allData,
	        	    success:function(retVal){
	        	    	var resultMovieTimes=[];
	        	    	resultMovieTimes=retVal.movieTimeList;
	        	    	var resultHTML=makeTheaterListHTML(resultMovieTimes);
	        	        $("#result").html(resultHTML);
		        	 	   $("input[type='checkbox'][name='timetable_id']").click(function(){
		        		        if($(this).prop('checked')){
		        		        	$('input[type="checkbox"][name="timetable_id"]').prop('checked',false);
		        		        	$(this).prop('checked', true);
		        		        }});

	        	    
	        	    },
	        	    error:function(request, status, error){
	        	        alert("에러 발생~~ \n" + status + " : " + error);

	        	    }
	        	});	
	        }else{
	            alert("체크박스 체크 해제!");
	        }
	    });
	   
	
});
function makeTheaterListHTML(list){
	var theaterHTML="";
	
    $.each(list, function( index, value ) {
    	theaterHTML+="<input type='checkbox' name='timetable_id' value='";
    	console.log(value.timetable_id);
    	theaterHTML+=value.timetable_id;
    	theaterHTML+="'>"+value.movie_dateTime+"&nbsp;";
     });
	return theaterHTML;
}

function goBack(){
	history.go(-1);
}
</script>
<style>
#contents{
	text-align: center;
}
</style>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
<div id="contents">
날짜, 시간 선택
<hr width="80%">
<input type="hidden" name = "user_id" value="${member.getMember_id()}">
<%if(((List<Object>)request.getAttribute("movieDateList")).size()==0){%>
	<h4>해당 상영관에 조회되는 일정이 없습니다!</h4>
	<button onclick="goBack()">상영관 다시 선택</button>
<%}
else{
%>

<c:forEach var="movieDateList" items="${movieDateList}" varStatus="status">

<input type="checkbox" name="timeTableDate" value="${movieDateList.movie_dateTime}">${movieDateList.movie_dateTime}
</c:forEach>
<br>
<hr>
<form action="<%=contextPath%>/selectSeat2" method="get">
	<div id="result"></div>
	<input type="hidden" name="theater_id" value="${theater_id}">
	<input type="hidden" name="scrHall_id" value="">
	<input type="submit" value="좌석 선택">
	
</form>
<%} %>
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