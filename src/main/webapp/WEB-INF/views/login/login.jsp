<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%String contextPath=request.getContextPath(); %>      
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

<style>
	body {
		font-family: "맑은 고딕";
		font-size: 12px;
		/* margin-top : 50px; */
	}
	
	input, button{
		display: block;
		height: 30px;
		width: 300px;
		margin-top:10px;
	}
	
	.userInput, .jo_seBtn{
		width: 420px;
		margin: 0 auto;
	}

	.userInput, .jo_seBtn{
		overflow: hidden;
	}
	
	.user, .loginBtn{
		float:left;
	}
	
	.loginBtn{
		margin-left: 20px; 
	}
	
	.userInput:after, .jo_seBtn:after{
		display: block;
		clear: both;
	}
	
	.jo_seBtn{
		margin-bottom: 40px;
	}
	
	#login{
		height: 90px;
		width: 90px;
		background-color:white;
		border-radius: 5px;
		border: none;
		text-align: center;
	}
	a{
		text-decoration: none;
	}
	#login:hover{
		text-decoration: none;
	}
	.sns_sign_in{
		text-align: center;
		margin-right:150px;
		/*padding : 50px;*/
		margin-bottom : 5px;
	}
	 #my-signin2{
		text-align: center;
		/*display:inline-block;
		float:left;*/
		margin-left:383px;
		margin-bottom : 5px;
	} 
	
	form {
		display : inline-block;
	}
	
	#naverIdLogin{
		margin-bottom: 5px;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		var errorMsg = "${errorMsg}";
		
		if(errorMsg !="")
		{
			alert(errorMsg);
			return false;
		}
		
		var errorMsg2 = "${errorMsg2}";
		
		if(errorMsg2 !="")
		{
			alert(errorMsg2);
			return false;
		}
		
	});
</script>
<body>

	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>


  <main id="main">
<div class="content">
		<!-- 로그인 -->
		<div class="userInput">
				<form name="loginform" id = 'logininfo' method="post" action = '<%=contextPath%>/login/islogin'>
				<c:if test = "${member == null }">
					<div>
					<label for = "member_id"></label>
					<input type="text" id="member_id" name = member_id placeholder="ID">
					</div>
					<div>
					<label for = "member_pwd"></label>
					<input type="password" id="member_pwd" name = "member_pwd" placeholder="PASSWORD" >
					</div>
					<div>
				<!-- 로그인 후 갈 메인페이지 value -->
					<button class="moveBT" id = "loginBtn" type = "submit">Login</button>
					</div>
					<a href = "<%= contextPath %>/login/lookForId">아이디 찾기</a>| 
 					<a href = "<%= contextPath %>/login/lookForPwd">비밀번호 찾기</a>| 
 					<a href = "<%= contextPath %>/login/agreement">회원가입</a> 
				</c:if>
				<c:if test = "${member != null or member_id != null }">
					<div>
						<p>${member.getMember_id()}님 환영합니다.</p>
						<button id = "logoutBtn" type = "button">Logout</button>
					</div>
				</c:if>
				<c:if test = "${msg == false }">
					<p style = "color:red;">아이디와 비밀번호를 확인해주세요.</p>
				</c:if>
				</form>
			</div>
			</div>
  </main>
  
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