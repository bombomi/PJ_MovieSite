<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();

// 	boolean success = request.get
%>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
// 	$("#submit").on("click", function(){
// 	if($("#member_id").val()=="") {
// 		alert("아이디를 입력해주세요.");
// 		$("#member_id").focus();
// 		return false;
// 	}
</script>
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

</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
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
		<!-- 로그인 끝 -->
</body>
</html>