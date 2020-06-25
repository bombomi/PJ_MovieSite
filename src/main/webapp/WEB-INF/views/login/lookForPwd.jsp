<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
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
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	body {
		text-align: center;
	}
	#member_id, #member_email{
		height: 30px;
		width: 300px;
		margin-top:10px;
	}
	#member_email2 {
		height: 30px;
		width : 200px;
		margin-top: 10px;
	}
	table {
		margin: auto;
	}
</style>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
 	<br><br><br><br>
	비밀번호 찾기
	<hr width = "40%">
	<form action = "<%=contextPath %>/login/findPwd" method = "post">
	<br><br><br><br>
	<table>
		<tr>
			<td><input type = "text" name = "member_id" id = "member_id" placeholder="ID"></td>
		<tr>
		<tr>
			<td><input type="text" name="member_email" id="member_email" placeholder="EMAIL"></td>
			<td><select name="member_email2" id="member_email2">
					<option value="@naver.com" id="eg_f_size_s">@naver.com</option>
					<option value="@gmail.com" id="eg_f_size_s">@gmail.com</option>
					<option value="@daum.net" id="eg_f_size_s">@hanmail.net</option>
					<option value="@nate.com" id="eg_f_size_s">@nate.com</option>
				</select></td>
		</tr>
		<tr>
			<td colspan="2"><input type = "submit" value = "비밀번호찾기" id="findPwd"></td>
		</tr>
		</table>
		<br><br>
	</form>
	<br>
	<br>
	<span id="userPwdList"></span>
	<br><br><br><br>
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