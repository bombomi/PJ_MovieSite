package com.movie.mymovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class loginController {
	
	//로그인페이지 login.jsp
	@RequestMapping(value = "/login")
	public String login() {
		return "login/login";
	}
	
	//아이디 찾기 lookForId.jsp
	@RequestMapping(value = "/lookForId")
	public String lookForId() {
		return "login/lookForId";
	}
	
	//아이디찾기성공결과 findId.jsp
	@RequestMapping(value = "/findId")
	public String findId() {
		return "login/findId";
	}
	
	//비밀번호 찾기 lookForPwd.jsp
	@RequestMapping(value = "/lookForPwd")
	public String lookForPwd() {
		return "login/lookForPwd";
	}
	
	//비밀번호찾기성공결과(비밀번호변경페이지) findPwd.jsp
	@RequestMapping(value = "/findPwd")
	public String findPwd() {
		return "login/findPwd";
	}
	
	//비밀번호변경성공페이지 chPwd.jsp
	@RequestMapping(value = "/chPwd")
	public String chPwd() {
		return "login/chPwd";
	}
	
	//동의페이지 agreement.jsp
	@RequestMapping(value = "/agreement")
	public String agreement() {
		return "login/agreement";
	}
	
	//회원가입페이지 newMemberForm.jsp
	@RequestMapping(value = "newMemberForm")
	public String newMemberForm() {
		return "login/newMemberForm";
	}
	
	//회원가입성공페이지 successNewMember.jsp
	@RequestMapping(value = "successNewMember")
	public String successNewMember() {
		return "login/successNewMember";
	}
	
	

}
