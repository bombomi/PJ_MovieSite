<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%-- JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%-- JSTL Function --%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link
	href="<c:url value ='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'/>"
	rel="stylesheet">


<script type="text/javascript"
	src="<c:url value ='/vendor/jquery/jquery.min.js'/>" /></script>
<script type="text/javascript"
	src="<c:url value ='/js/jquery-3.3.1.min.js'/>" /></script>

<!-- Vendor CSS Files -->
<link href="<c:url value ='/vendor/icofont/icofont.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value ='/vendor/line-awesome/css/line-awesome.min.css'/>"
	rel="stylesheet">
<link href="<c:url value ='/vendor/aos/aos.css'/>" rel="stylesheet">
<link
	href="<c:url value ='/vendor/owlcarousel/assets/owl.carousel.min.css'/>"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<c:url value ='/css/style.css'/>" rel="stylesheet">


<!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->
<style type="text/css">
html, body {
	height: 100%;
}

.head {height 150%;
	overflow-y: visible;
}

.container-fluid {
	height: 100%;
	overflow-y: hidden; /* don't show content that exceeds my height */
}

.body-fill {
	min-height: 10%;
	overflow-y: scroll;
}

@media screen and (min-width: 1024px) {
	.myNewDivHeight {
		height: 90%;
	}
}
</style>
<script>
	function loadPage(value) {
		switch (value) {
		case 1:
			//document.getElementById("right_pane").innerHTML = value;
			console.log("case 1 !!!!!!!!!!!!!!!!!!");
			document.getElementById("right_pane").innerHTML = '<object style="width:100%;height:100%" type="text/html" data="/mymovie/myPage/Mybooklist" ></object>';

			break;
		case 2:
			document.getElementById("right_pane").innerHTML = '<object style="width:100%;height:100%" type="text/html" data="/mymovie/myPage/Mywriting" ></object>';

			break;

		case 0:
		default:
			document.getElementById("right_pane").innerHTML = '<object style="width:100%;height:100%" type="text/html" data="/mymovie/myPage/MainForm" ></object>';

		}
	}
	function signout() {
		if (confirm("정말로 탈퇴 하시겠습니까?")) {
			$("#myFrom").submit();
		} else {
			console.log(txt = "You pressed Cancel!");
		}
	}

	$(document).ready(function() {
		var flag = "${flag}";

		if (flag == 0) {
			loadPage(flag);
		}
	});
</script>
</head>
<body>
	<form id="myFrom" action="<%=contextPath%>/deleteUserList"
		method="post"></form>

	<div class="container-fluid">
		<div class="head">
			<jsp:include page="../head.jsp"></jsp:include>
		</div>
		<div class="row body-fill">

			<div class="w-25 p-3 border-right border-top" id="left_pane">
				<br>
				<div onclick="loadPage(0)">내 정보</div>
				<!-- 				<br> -->
				<!-- 				<div onclick="loadPage(0)">정보수정</div> -->
				<br> <br>
<!-- 				<div onclick="loadPage(1)">예매내역</div> -->
				<br> <br>
<!-- 				<div onclick="loadPage(2)">내가 쓴 글</div> -->
				<br> <br> <br> <br> <br>
				<div onclick="signout()">회원탈퇴</div>
			</div>

			<div class="w-75 p-3 border-top" id="right_pane"></div>
		</div>
	</div>
</body>
</html>