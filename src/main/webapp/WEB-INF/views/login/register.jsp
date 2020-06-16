<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
	$(document).ready(function() {
		//취소
		$(".cancle").on("click", function(){
			location.href = "/login";
		});
		$("#submit").on("click", function(){
			if($("#userId").val()=="") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val()=="") {
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			if($("#userNick").val()=="") {
				alert("닉네임을 입력해주세요.");
				$("#userNick").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<section id = "container">
		<form action = "/login/register" method = "post">
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "userId">아이디</label>
				<input class = "form-control" type ="text" id = "userId" name = "userId">
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "userPwd">비밀번호</label>
				<input class = "form-control" type ="text" id = "userPwd" name = "userPwd">
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "userNick">닉네임</label>
				<input class = "form-control" type ="text" id = "userNick" name = "userNick">
			</div>
			<div class = "form-group has-feedback">
				<button class = "btn btn-success" type = "submit" id = "submit">회원가입</button>
				<button class = "cancle btn btn-danger" type = "button">취소</button>
			</div>
		</form>
	</section>
</body>
</html>