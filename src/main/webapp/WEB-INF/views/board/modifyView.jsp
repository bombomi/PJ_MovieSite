<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
</head>
<body>
<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>

<h2>글 수정</h2>

<c:if test="${selectCnt == 0}">
	<script type="text/javascript">
		alert("글 수정 실패하였습니다.");
	</script>
</c:if>

	<c:if test="${selectCnt != 0}">
		<form action="modifyPro" method="post">
			
			<!-- hidden은 form 태그 내에 있어야 한다.  -->
			<input type="hidden" name="board_id" value="${board_id}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			
			<table align="center">

				<tr>
					<th> 글 제목 </th>
					<td>
						<input class="input" type="text" name="board_title" maxlength="50"
							value="${dto.board_title}" style="width:270px">
					</td>
				</tr>
				
				<tr>
					<th> 글 내용 </th>
					<td>
						<textarea class="input" rows="10" cols="40" name="board_content" word-break:word-all>${dto.board_content}</textarea>
						
						<!-- word-break: break-all 글자 단위 자동 줄바꿈 - 권장
									   : keep-all 단어기준 자동 줄바꿈
						  -->
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="submit" value="글 수정">
						<input type="button" value="글 수정 취소" onclick="window.location='BoardList?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
			
		</form>
	</c:if>
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