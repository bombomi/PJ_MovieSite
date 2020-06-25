<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
 <%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>

<%@ page import="java.util.List" %>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Collection"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.util.JSONBuilder"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 

 <%String contextPath=request.getContextPath(); %>      

<%
 
 //파라미터 설정
 //조회일자
 String targetDt =request.getParameter("targetDt")==null?"20200622":request.getParameter("targetDt");
 //결과 row수
 String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
 //"Y" -> 다양성 영화 "N" -> 상업영화 (default : 전체)
 String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
 //"k" -> 한국영화 "F" -> 외국영화
 String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
 //"0105000000"로서 조회된 지역코드
 String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");
 
 String movieCd = request.getParameter("movieCd")==null?"20124079":request.getParameter("movieCd");
 
 
 
 //발급키
 String key = "71ef7d891cd64e00c28e4d8f88b9c00c";
 
 KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
 
 String movieResponse = service.getMovieInfo(true, movieCd);
 String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
 ObjectMapper mapper = new ObjectMapper();
 HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
 HashMap<String, String> movieResult = mapper.readValue(movieResponse, HashMap.class);
 
 request.setAttribute("movieResult", movieResult);
 
 
 request.setAttribute("dailyResult", dailyResult);
 String codeResponse = service.getComCodeList (true,"0105000000");
 HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
 request.setAttribute("codeResult", codeResult);
 
 
 %> 


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>MyPortfolio</title>
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


<form action="<%=contextPath %>/selectMovieInfo" method="get">


  <main id="main">

    <div class="site-section site-portfolio">
      <div class="container">

        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          
          
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="0" end="0">
   
          
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
              <div class="work-info">
                <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
         
         </c:forEach>
         </c:if>
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="1" end="1">
   
         
         
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
              <div class="work-info">
                    <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
            </c:forEach>
         </c:if>
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="2" end="2">
   
          
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
              <div class="work-info">
                  <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="images-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
         
              </c:forEach>
         </c:if>
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="3" end="3">
   
         
          <div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
           <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
               <div class="work-info">
                  <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
    
    
         </c:forEach>
         </c:if>
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="4" end="4">
   
    
    
    
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
          <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
                <div class="work-info">
                  <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
               </c:forEach>
         </c:if>
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="5" end="5">
   
          
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
              <div class="work-info">
                 <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
               </c:forEach>
         </c:if>
         
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="6" end="6">
   
           <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
           <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
               <div class="work-info">
                    <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
                        </c:forEach>
         </c:if>
         
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="7" end="7">
   
           <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
           <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
               <div class="work-info">
                   <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
          
          
                         </c:forEach>
         </c:if>
         
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="8" end="8">
   
           <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
              <div class="work-info">
                   <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
          
          
                         </c:forEach>
         </c:if>
         
         
<c:if test ="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }"> 
   <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="9" end="9">
   
           <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
         <a href="<%=contextPath %>/selectMovieInfo?movieCd=${boxoffice.movieCd}" class="item-wrap fancybox" name="selectMovieInfo" value="${boxoffice.movieCd}">
                 <div class="work-info">
                    <h3><c:out value="${boxoffice.movieNm}"/></h3>
                <span>영화 정보 보기</span>
              </div>
              <img class="img-fluid" src="<%=request.getContextPath() %>/images/${boxoffice.movieCd}.jpg">
            </a>
          </div>
          
          
          
                         </c:forEach>
         </c:if>
         
         
 
          
        </div>
      </div>
    </div>
    
</form>
         
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">My Clients</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-adobe.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-uber.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-apple.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-netflix.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-nike.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="<%=request.getContextPath() %>/images/logo-google.png" alt="Image" class="img-fluid"></a>
          </div>

        </div>
      </div>
    </div>


    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">My Services</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
          </div>
        </div>
        <div class="row">

          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-cube la-3x mb-4"></span>
            <h4 class="h4 mb-2">Web Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-mobile la-3x mb-4"></span>
            <h4 class="h4 mb-2">Mobile Applications</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-image la-3x mb-4"></span>
            <h4 class="h4 mb-2">Graphic Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-search la-3x mb-4"></span>
            <h4 class="h4 mb-2">SEO</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section pt-0">
      <div class="container">

        <div class="owl-carousel testimonial-carousel">

          <div class="testimonial-wrap">
            <div class="testimonial">
              <img src="<%=request.getContextPath() %>/images/person_1.jpg" alt="Image" class="img-fluid">
              <blockquote>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
                  explicabo inventore.</p>
              </blockquote>
              <p>&mdash; Jean Hicks</p>
            </div>
          </div>

          <div class="testimonial-wrap">
            <div class="testimonial">
              <img src="<%=request.getContextPath() %>/images/person_2.jpg" alt="Image" class="img-fluid">
              <blockquote>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
                  explicabo inventore.</p>
              </blockquote>
              <p>&mdash; Chris Stanworth</p>
            </div>
          </div>

        </div>

      </div>
    </div>
  </main>
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright MyPortfolio. All Rights Reserved</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-twitter"></span></a>
          <a href="#"><span class="icofont-facebook"></span></a>
          <a href="#"><span class="icofont-dribbble"></span></a>
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>

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

