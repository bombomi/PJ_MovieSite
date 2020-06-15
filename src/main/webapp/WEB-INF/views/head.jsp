<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%String contextPath=request.getContextPath(); %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">富貴榮華(:부귀영화)</a>
              <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>Movie reservation & community site&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
            <p class="mb-0">
            </p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="a" class="filters">
              <a href="<%=contextPath %>/main/index" data-filter="*" class="active">home</a>
              <a href="<%=contextPath %>/login" >Login</a>
              <a href="<%=contextPath %>/board/BoardList">Community</a>
              <a href="<%=contextPath %>/myPage/myPage" >My Page</a>
            </div>
          </div>
        </div>
    </div>
  </nav>
</body>
</html>