<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
  


<script  type="text/javascript"src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	   $("[name='place']").click(function(){
	        if($(this).prop('checked')){
	        	$('input[type="checkbox"][name="place"]').prop('checked',false);
	        	$(this).prop('checked', true);

	        	
	        	//체크박스에 표시한 값들을 넘김.
	        	var checkboxValue;
	        	$('input[name="place"]:checked').each(function(i){
	        		checkboxValue=$(this).val();
	        	});
	        	var allData = {"checkboxValue": checkboxValue };
	        	$.ajax({
	        		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        	    url:"<%=contextPath%>/ajaxTheaterSelect",
	        	    type:'GET',
	        	    dataType:"json",
	        	    data: allData,
	        	    success:function(retVal){
	        	    	var resultTeaters =[];
	        	    	resultTheaters=retVal.theaterList;
	        	    	var resultHTML=makeTheaterListHTML(resultTheaters);
	        	        $("#result").html(resultHTML);

	        	        
	        	 	   $("input[type='checkbox'][name='theater_id']").click(function(){
	        		        if($(this).prop('checked')){
	        		        	$('input[type="checkbox"][name="theater_id"]').prop('checked',false);
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
    	theaterHTML+="<input type='checkbox' name='theater_id' value='";
    	console.log(value.theater_id);
    	theaterHTML+=value.theater_id;
    	theaterHTML+="'>"+value.theater_name+"&nbsp;";
     });
	return theaterHTML;
}
</script>
<style>
	#contents{
		text-align:center;
	}
</style>
</head>

<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>


<div id="contents">
영화관 선택하기
<hr width="80%">
<input type="checkbox" name="place" value="seoul">서울 &nbsp;
<input type="checkbox" name="place" value="gyeong-gi">경기&nbsp;
<input type="checkbox" name="place" value="busan">부산&nbsp;
<input type="checkbox" name="place" value="incheon">인천&nbsp;
<input type="checkbox" name="place" value="gangwon">강원

<br>

<hr width="80%">

<form action="<%=contextPath%>/selectDateTime" method="get">

<div id="result"></div>
<br>
<input type="hidden" name="member_id" value="${member.getMember_id()}">
<input type="hidden" name="movie_id" value="20183813">
<input type="submit" value="날짜, 시간 선택">

</form>

<hr width="80%">
<a href="<%=contextPath%>/test?test=12">링크이동 테스트</a>
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