package com.movie.mymovie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.mymovie.dto.UserDto;
import com.movie.mymovie.service.MypageServiceImpl;


@Controller
public class MyPageController {
	private final Logger log = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MypageServiceImpl MypageServiceImpl;

	// 인덱스
	@RequestMapping(value = "/myPage")
	public String index(HttpServletRequest req, Model model) {
//		log.debug("MyPageController - /myPage/myPage");
		String user_id = req.getParameter("user_id");
		HttpSession session = req.getSession();
		
		session.setAttribute("member", user_id);
		
		return "mypage/index";
	}
	//마이페이지 메인(추후 MainForm으로 수정)
	@RequestMapping(value = "/myPage/ModifyForm")
	public String edit() {
//		log.debug("called ------------------------------------------------");
		return "mypage/ModifyForm";
	}
	//예매내역
	@RequestMapping(value = "/myPage/Mybooklist")
	public String list() {
		return "mypage/Mybooklist";
	}
	//내가쓴글
	@RequestMapping(value = "/myPage/Mywriting")
	public String writing() {
		return "mypage/Mywriting";
	}
	//회원탈퇴
	@RequestMapping(value = "/myPage/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";
	}
	//정보 조회
	@RequestMapping(value = "/selectUserAllList")
	public String selectUserAllList(Model model) {
		List<UserDto> UserList = MypageServiceImpl.selectUserAllList();
		model.addAttribute("list", UserList);
		return "User/selectUserAllList";
	}

}

