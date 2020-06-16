<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- 
<script type="text/javascript">
	$(document).ready(function(){
		$("#submit").on("click", function(){
			location.href='/login/islogin';
		})
		
	})
</script>-->
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
					<button class="moveBT" type = "submit">Login</button>
					</div>
				</c:if>
			<!-- 	<c:if test = "${member != null or member_id != null }">
					<div>
						<p>${member.getMember_id()}님 환영합니다.</p>
						<button id = "logoutBtn" type = "button">Logout</button>
					</div>
				</c:if>
				<c:if test = "${msg == false }">
					<p style = "color:red;">아이디와 비밀번호를 확인해주세요.</p>
				</c:if> -->
				</form>
			</div>
			</div>
		<!-- 로그인 끝 -->

		<div class="jo_seBtn" id="ko_f_size_s">
			
<!-- 			<form name="signform" id = 'signform' method="get" action = "sign"></form> -->
<%-- 			<a href = "<%= contextPath %>/lookForId">아이디 찾기</a>| --%>
<%-- 			<a href = "<%= contextPath %>/lookForPwd">비밀번호 찾기</a>| --%>
<%-- 			<a href = "<%= contextPath %>/agreement">회원가입</a> --%>
			<form name="signform" id = 'signform' method="get" action = "sign"></form>
			<a class="moveBT" data-target="#signform" id="sign">회원가입   </a> 
			<form name="findidform" id = 'findidform' method="get" action = "find">
				<input type = "hidden" name = "findby" value = "id">
			</form>
			<a class="moveWindowBT" data-target="#findidform" id="findid">아이디</a> /
			<form name="findpwdform" id = 'findpwdform' method="get" action = "find">
				<input type = "hidden" name = "findby" value = "pwd">
			</form>
			<a class="moveWindowBT" data-target="#findpwdform" id="findpwd">비밀번호 찾기</a>
		</div>
		<div class="sns_sign_in">
     <div id="my-signin2"></div>
  	<!-- 네이버 -->
    <script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
	
	<!-- 카카오 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  
	
	<!-- 네이버 -->  
    <div id="naverIdLogin"></div>
		<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId({
				clientId: "HFnmhVECDrtveBH0bKOm",
				callbackUrl: "Jv6uMLmNCG",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
				});
					/* 설정정보를 초기화하고 연동을 준비 */
				naverLogin.init();
				</script>
	<!-- //네이버아디디로로그인 초기화 Script --> 
	
	<!-- 카카오 -->
		<a id="kakao-login-btn"></a> 
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('2113078b4084f943d0f692c88e9e2869');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
    </script>
   </div>
</body>
</html>