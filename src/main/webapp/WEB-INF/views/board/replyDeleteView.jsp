<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
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
<script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery.min.js'/>"/></script>
<script type="text/javascript" src="<c:url value ='/js/jquery-3.3.1.min.js'/>"/></script>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		window.history.back();
	})
	
})

</script>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>


	<form name="updateForm" role="form" method="post"
		action="<%=contextPath %>/board/replyDelete">
		<input type="hidden" name="board_id" value="${replyDelete.board_id}"
			readonly="readonly" /> <input type="hidden" id="reply_id"
			name="reply_id" value="${replyDelete.reply_id}" /> <input
			type="hidden" name="pageNum" value="${pageNum}"> <input
			type="hidden" name="number" value="${number}">
		<div>
			<p>삭제 하시겠습니까?</p>
			<button type="submit">예 삭제합니다.</button>
			<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
		</div>
	</form>
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