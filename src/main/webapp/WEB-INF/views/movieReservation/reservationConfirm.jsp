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
<style>
h3{
	text-align: center;
}
table{
	margin: 0 auto;
}
#confirmCategory{
	width: 150px;
	height: 30px;
}
#confirmContents{
	width: 180px;
	height: 30px;
	
}
#contents {
	text-align: center;
}
</style>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
 	<input type="hidden" name = "member_id" value="${member.getMember_id()}">
<% Map<String, Object> confirmInfo=(Map<String,Object>)request.getAttribute("confirmInfo"); %> 	
<hr>
<h3>예약이 완료되었습니다!</h3>
<hr>
<table>
	<tr>
		<th id="confirmCategory"></th>
		<th id="confirmContents"></th>		
	</tr>
	
	<tr>
		<td>영화제목
		</td>
		<td><%=(String)confirmInfo.get("MOVIE_TITLE") %>
		</td>
	</tr>
		<tr>
		<td>결제금액
		</td>
		<td>10000원
		</td>
	</tr>
		<tr>
		<td>날짜, 시간
		</td>
		<td><%=(String)confirmInfo.get("MOVIE_DATETIME") %>
		</td>
	</tr>
		<tr>
		<td>지점, 상영관
		</td>
		<td>
		<%=(String)confirmInfo.get("THEATER_NAME") %>,
			<%=(String)confirmInfo.get("SCRHALL_ID") %>관
		</td>
	</tr>
		<tr>
		<td>좌석
		</td>
		<td><%String srchallSeat_id=(String)((Map<String, Object>)request.getAttribute("paramMap")).get("scrhallSeat_id"); %>
			<%=PrintSeatListOnPage.rowColFormat(srchallSeat_id) %>
		</td>
	</tr>
</table>
	<div id="contents">
		<input type="button" onclick="location.href='<%=contextPath%>/main/index'" value="메인으로 이동">
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