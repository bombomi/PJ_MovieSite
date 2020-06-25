<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<script src = "//code.jquery.com/jquery-3.3.1.min.js"></script>
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
	body {
		font-family: "맑은 고딕";
		font-size: 12px;
		/* margin-top : 50px; */
	}
	input{
		display: block;
		height: 30px;
		width: 300px;
		margin-top:10px;
	}
	#member_email2 {
		display: block;
		height: 30px;
		width : 200px;
		margin-top: 10px;
	}
	table {
		margin: auto;
	}
	#idChk, #nickChk {
		display : block;
		height : 30px;
		width : 70px;
		text-align: center;
	}
</style>
<script>
function fn_idChk() {
	$.ajax({
		url : "idChk",
		type : "post",
		dataType : "json",
		data : {"member_id" : $("#member_id").val()},
		success : function(data) {
//  			alert("1"); 
			if(data == 1) {
				alert("중복된 아이디입니다.");
			}else if(data == 0) {
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

function fn_nickChk() {
	$.ajax({
		url : "nickChk",
		type : "post",
		dataType : "json",
		data : {"member_nick" : $("#member_nick").val()},
		success : function(data) {
// 			alert("1"); 
			if(data == 1) {
				alert("중복된 닉네임입니다.");
			}else if(data == 0) {
				$("#nickChk").attr("value", "Y");
				alert("사용가능한 닉네임입니다.");
			}
		}
	})
}


$(document).ready(function(){
	
	$(".cancle").on("click", function(){
		location.href = "/mymovie/login";
	});
	
	$("#submit").on("click", function() {
		if($("#member_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#member_id").focus();
			return false;
		}
		if($("#member_pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#member_pwd").focus();
			return false;
		}
		if($("#member_nick").val() == "") {
			alert("닉네임을 입력해주세요.");
			$("#member_nick").focus();
			return false;
		}
		if($("#member_email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#member_email").focus();
			return false;
		}
		if($("#member_pwd").val() != $("#member_pwd2").val()) {
			alert("비밀번호를 동일하게 입력해주세요.");
			$("#member_pwd").focus();
			return false;
		}
		
		
		
		
		var idChkVal = $("#idChk").val();
		var nickChkVal = $("#nickChk").val();
		
		if(idChkVal == "N" && nickChkVal == "N") {
			alert("아이디, 닉네임 중복확인 버튼을 눌러주세요.");
			return false;
		}else if(idChkVal == "Y" && nickChkVal == "Y") {
			alert("회원가입에 성공하셨습니다.");
			$("#regForm").submit();
		}
	})
	
	
})
	
</script>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<br><br><br><br>
	<section id = "container">
		<form action = "<%=contextPath %>/login/register" method = "post" id = "regForm" name = "regForm">
			<table>
				<tr>
					<td><label class = "control-label" for = "member_id"></label></td>
					<td><input class = "form-control" type ="text" id = "member_id" name = "member_id" placeholder="ID"></td>
					<td><button class = "idChk" type = "button" id = "idChk" onclick = "fn_idChk();" value = "N">Check</button></td>
				</tr>
				<tr>
					<td><label class = "control-label" for = "member_pwd"></label></td>
					<td><input class = "form-control" type ="password" id = "member_pwd" name = "member_pwd" placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td><label class = "control-label" for = "member_pwd2"></label></td>
					<td><input class = "form-control" type ="password" id = "member_pwd2" name = "member_pwd2" placeholder="PASSWORD CHECK"></td>
				</tr>
				<tr>
					<td><label class = "control-label" for = "member_nick"></label></td>
					<td><input class = "form-control" type ="text" id = "member_nick" name = "member_nick" placeholder="NICKNAME"></td>
					<td><button class = "nickChk" type = "button" id = "nickChk" onclick = "fn_nickChk();" value = "N">Check</button></td>
				</tr>
				<tr>
					<td><label class = "control-label" for = "member_email"></label></td>
					<td><input class = "form-control" type ="text" id = "member_email" name = "member_email" placeholder="EMAIL"></td>
					<td><select name="member_email2" id="member_email2">
						<option value="@naver.com" id="eg_f_size_s">@naver.com</option>
						<option value="@gmail.com" id="eg_f_size_s">@gmail.com</option>
						<option value="@daum.net" id="eg_f_size_s">@hanmail.net</option>
						<option value="@nate.com" id="eg_f_size_s">@nate.com</option>
						</select></td>
				</tr>
				<tr>
					<td colspan="2"><button class = "btn btn-success" type = "submit" id = "submit">회원가입</button></td>
					<!-- <td><button class = "cancle btn btn-danger" type = "button">취소</button></td> -->
				</tr>
			</table>
		</form>
	</section>
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