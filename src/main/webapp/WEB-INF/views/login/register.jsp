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
<style>
	body {
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
	<br><br>
	<section id = "container">
		<form action = "<%=contextPath %>/login/register" method = "post" id = "regForm" name = "regForm">
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "member_id">아이디</label>
				<input class = "form-control" type ="text" id = "member_id" name = "member_id">
				<button class = "idChk" type = "button" id = "idChk" onclick = "fn_idChk();" value = "N">Check</button>
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "member_pwd">비밀번호</label>
				<input class = "form-control" type ="password" id = "member_pwd" name = "member_pwd">
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "member_pwd2">비밀번호확인</label>
				<input class = "form-control" type ="password" id = "member_pwd2" name = "member_pwd2">
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "member_nick">닉네임</label>
				<input class = "form-control" type ="text" id = "member_nick" name = "member_nick">
				<button class = "nickChk" type = "button" id = "nickChk" onclick = "fn_nickChk();" value = "N">Check</button>
			</div>
			<div class = "form-group has-feedback">
				<label class = "control-label" for = "member_email">이메일</label>
				<input class = "form-control" type ="text" id = "member_email" name = "member_email">
				<select name="member_email2" id="member_email2">
						<option value="@naver.com" id="eg_f_size_s">@naver.com</option>
						<option value="@gmail.com" id="eg_f_size_s">@gmail.com</option>
						<option value="@daum.net" id="eg_f_size_s">@hanmail.net</option>
						<option value="@nate.com" id="eg_f_size_s">@nate.com</option>
				</select>
			</div>
			<br>
			<div class = "form-group has-feedback">
				<button class = "btn btn-success" type = "submit" id = "submit">회원가입</button>
				<button class = "cancle btn btn-danger" type = "button">취소</button>
			</div>
		</form>
	</section>
</body>
</html>