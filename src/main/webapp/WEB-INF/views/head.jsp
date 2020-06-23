<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%String contextPath=request.getContextPath(); %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="<%=contextPath %>/main/index">富貴榮華(:부귀영화)</a>
              <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>Movie reservation & community site&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
            <p class="mb-0">
            </p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="a" class="filters">
              <a href="<%=contextPath %>/main/index" data-filter="*" class="active">home</a>
              <%--
              System.out.println("session : member = " + session.getAttribute("member"));
               --%>
              <c:if test = '<%= session.getAttribute("member") != null %>'>
              	<a href = "<%=contextPath%>/login/logout">Logout</a>
              </c:if>
              
              <c:if test = '<%= session.getAttribute("member") == null %>'>
              	<a href = "<%=contextPath%>/login">Login</a>
              </c:if>
              
              <a href="<%=contextPath %>/BoardList">Community</a>
              <a href="<%=contextPath %>/myPage/myPage" >My Page</a>
            </div>
          </div>
        </div>
    </div>
  </nav>
</body>
</html>