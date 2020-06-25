<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="com.movie.mymovie.dto.MovieInfoDto"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String contextPath= request.getContextPath(); %>


<!DOCTYPE html>
<html>


<head>

<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
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

</head>
<body>
<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>

<div align="center">
<% List<MovieInfoDto> selectMovieInfo = (List<MovieInfoDto>)request.getAttribute("selectMovieInfo"); %> 
<%-- <%
String movie_id = MovieInfoDto.printPage(Integer.parseInt((String)request.getAttribute("movieCd")),
		Integer.parseInt((String)request.getAttribute("scrhall_id"));


%> --%>

 <img src="<%=request.getContextPath() %>/images/<%=(String)selectMovieInfo.get(0).getMovie_id() %>.jpg" width="300" height="300">

<br>
<br>
<br>


영화 코드:
<%=(String)selectMovieInfo.get(0).getMovie_id() %>

<br>
영화 이름:
<%=(String)selectMovieInfo.get(0).getMovie_title() %>

<br>
영화 런타임:
<%= selectMovieInfo.get(0).getRuntime() %> 분
<br>
영화 장르:
<%=(String)selectMovieInfo.get(0).getGenre() %>
<br>
박스오피스 순위:
<%= selectMovieInfo.get(0).getRank()%> 위
<br>
출연 배우:
<%=(String)selectMovieInfo.get(0).getActors() %>  등등
<br>
제작 국가:
<%=(String)selectMovieInfo.get(0).getNation() %>
<br>
<a href="<%=contextPath%>/selectPlace">예매하기</a>

</div>

<%-- 
<% Map<String, Object> selectMovieInfo=(Map<String,Object>)request.getAttribute("selectMovieInfo"); %> 


<%=(String)selectMovieInfo.get("MOVIE_DATETIME") %>

 --%>
 
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