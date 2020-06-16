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
<style>
	body {
		text-align: center;
	}
</style>
<script type="text/javascript">
	// 회원가입 화면의 입력값들을 검사한다.
    function checkValue(){
        	
    	console.log($("#memPwd").val().length);
        if(!$("#memID").val()){
        	alert("아이디를 입력하세요.");
            return false;
        }
            
        if($("#idDuplication").val()!= "idCheck"){
        	alert("아이디 중복체크를 해주세요.");
            return false;
        }
        if($("#nickDuplication").val()!= "nickCheck"){
            alert("닉네임 중복체크를 해주세요.");
            return false;
        }
          
        if(!$("#memPwd").val()){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if($("#memPwd").val().length < 8){
            alert("비밀번호를 길이가 너무 짧습니다.");
            return false;
        }
          
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if($("#memPwd").val() != $("#memPwdCk").val()){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }    
            
        if(!$("#memEmail").val()){
            alert("메일 주소를 입력하세요.");
            return false;
        } 
          
        	return true;
        }
        
        // 아이디 중복체크 화면open
        $(document).ready(function(){
	        $("#IDCheck").click(function(){
	        	var id = $('#memID').val();
	        	$.ajax({
	    			type : "POST",
	    			"url" : "idcheck", // ----- (1)
	    			dataType : 'json',
	    			data : {
	    				'id' : id
	    			},
	    			cache : false,
	    			success : function(data) {
	    				$("#IDChecktext").html("idcheck : " + data.idcheck + "  idoverlapcheck : " + data.idoverlapcheck + " length : " + data.lengthcheck);
	    				if(data.idcheck == "0" && data.idoverlapcheck == "0" && data.lengthcheck == "0")
	    					$("#idDuplication").val("idCheck");
	    				else
	    					$("#idDuplication").val("idUnCheck");
	    				console.log($("#idDuplication").val());
	    			}
	    		});
	        });
	        
	        $("#NICKCheck").click(function(){
	        	var nick = $('#memNick').val();
	        	$.ajax({
	    			type : "POST",
	    			"url" : "nickcheck", // ----- (1)
	    			dataType : 'json',
	    			data : {
	    				'nick' : nick
	    			},
	    			cache : false,
	    			success : function(data) {
	    				$("#nickChecktext").html("nickcheck : " + data.nickcheck + "  nickoverlapcheck : " + data.nickoverlapcheck + " length : " + data.lengthcheck);
	    				if(data.nickcheck == "0" && data.nickoverlapcheck == "0" && data.lengthcheck == "0")
	    					$("#nickDuplication").val("nickCheck");
	    				else
	    					$("#nickDuplication").val("nickUnCheck");
	    				console.log($("#nickDuplication").val());
	    			}
	    		});
	        });
        });
        /* 
        user_id;
	private String user_pwd;
	private String user_email;
	private String user_nick;
	private String user_pic;
        	openIdChk(){
            window.name = "parentForm";
            window.open("idcheck",
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        } */
 
        // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
        // 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        
   </script>
</head>
<body>
	
	<form name="joinform" action = "<%= contextPath %>/successNewMember" method = "post">
		<div class="head_z"></div>
		<div class="section">
		<div class="content">
			<div class="memberInput">
				<div class="member" tabindex="0" id="memberform">
				<div class="membId">
					<input type="text" id="memID" name = "user_id" placeholder="ID">
					<input type="button" id="IDCheck" value="Check">
					<div id = "IDChecktext">
					</div>
					<input type="hidden" id="idDuplication" name="idDuplication" value="idUnckeck">
				</div>
				<div class="membPwd">
					<input type="password" id="memPwd" name = "user_pwd" placeholder="PASSWORD"><br>
					<input type="password" id="memPwdCk" placeholder="PASSWORD CHECK">
				</div>
				<div class="membNick">
					<div>
					<input type="text" id="memNick" name = "user_nick" placeholder="NICKNAME">
					<input type="button" id="NICKCheck" value="Check">
					<input type="hidden" id="nickDuplication" name="nickDuplication" value="nickUnckeck">
					<div id = "nickChecktext"></div>
					</div>
				</div>
				<div class="memEmail">
					<input type="text" name="user_email" maxlength="50" id = "memEmail"	placeholder="EMAIL">
						@
					<select name="user_email2" id="email2">
						<option value="naver.com" id="eg_f_size_s">naver.com</option>
						<option value="gmail.com" id="eg_f_size_s">gmail.com</option>
						<option value="daum.net" id="eg_f_size_s">daum.net</option>
						<option value="nate.com" id="eg_f_size_s">nate.com</option>
					</select>
				
					<label id="agree_f"><br>
					이메일 수신 동의							
						<input type="radio" name="subject2" value="agree"><span>동의</span>
						<input type="radio" name="subject2" value="disagree" checked><span>동의하지 않음</span>
					</label>
				<br><br></div>
				</div>
				<br><br><br><br>
				<div class="memberBtn">
					<input type="submit" value="회원가입" id="memsuc" onclick = "return checkValue();">
					<input type="reset" value="취소" id="reset">
				</div>
			</div>
		</div>
		</div>
		</form>
	
	
	<br><br>
	<a href = "<%= contextPath %>/login" method = "post">로그인 페이지</a>
</body>
</html>