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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.mymovie.dto.UserDto;
import com.movie.mymovie.service.MypageService;

@Controller
public class MyPageController {
	private final Logger log = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private MypageService service;

	// 인덱스
	@RequestMapping(value = "/myPage")
	public String index(HttpServletRequest req, Model model) {
//		log.debug("MyPageController - /myPage/myPage");

		String user_id = req.getParameter("user_id");
		if (user_id == null) {
			System.out.println("no session found");

			HttpSession session = req.getSession();

			session.setAttribute("user_id", "test1");
			System.out.println("force set session to test1");

		}
		model.addAttribute("flag", 0);
		return "mypage/index";
	}

//	@RequestMapping(value = "/myPage/MainForm")
//
//	public String mainGet(HttpServletRequest req) {
//		log.debug("called ------------------------------------------------");
//		String memberId = (String) req.getSession().getAttribute("user_id");
//		if (memberId == null) {
//			System.out.println("session has expired");
//			return edit();
//		} else {
//			service.selectOneByMemberId(memberId);
//		}
//		return "mypage/MainForm";
//	}

	// 마이페이지 메인
	@RequestMapping(value = "/myPage/MainForm")
	public String view(Model model, HttpSession session, HttpServletRequest request) {
//		log.debug("called ------------------------------------------------");

		log.info("MainForm start");
		log.info("flag=[" + request.getParameter("flag") + "]");
		UserDto UserInfo = new UserDto();
		UserDto sessionDto = (UserDto) session.getAttribute("member");

		try {
			UserInfo = service.selectInfo(sessionDto.getMember_id());
			log.info(UserInfo + "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("flag", request.getParameter("flag") + "");
		model.addAttribute("UserInfo", UserInfo);
		return "mypage/MainForm";
	}

	// 정보수정 페이지
	@RequestMapping(value = "/myPage/ModifyForm")
	public String edit() {
		return "mypage/ModifyForm";
	}

	// 예매내역
	@RequestMapping(value = "/myPage/Mybooklist")
	public String list() {
		return "mypage/Mybooklist";
	}

	// 내가쓴글
	@RequestMapping(value = "/myPage/Mywriting")
	public String writing() {
		return "mypage/Mywriting";
	}

	// 회원탈퇴
	@RequestMapping(value = "/myPage/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";
	}

	// 정보 조회
	@RequestMapping(value = "/selectUserAllList")
	public String selectUserAllList(Model model) {
		List<UserDto> UserList = service.selectUserAllList();
		model.addAttribute("list", UserList);
		return "mypage/MainForm";
	}

	// 닉네임 ,이메일 정보 넘기기
	@RequestMapping(value = "/selectInfo")
	public String selectInfo(Model model) {

		return "mypage/MainForm";
	}

	// 정보 수정
//	@RequestMapping(value = "myPage/ModifyForm")
//	public String registerUpdateView() throws Exception{
//			return "myPage/index";
//	}
//	
	@RequestMapping(value = "/updateUserList")
	public String registerUpdate(UserDto Dto, HttpSession session, Model model) throws Exception {
		log.info(Dto + "");
		service.updateUserList(Dto);

//		session.invalidate();
		model.addAttribute("flag", "U");
		return "redirect:/myPage/MainForm";
	}

//	// 회원 탈퇴 get
//		@RequestMapping(value="/deleteUserList" )
//		public String deleteUserList() throws Exception{
//			return "index";
//		}
//		
	// 회원 탈퇴 post
	@RequestMapping(value = "/deleteUserList")
	public String memberDelete(UserDto Dto, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		UserDto member = (UserDto) session.getAttribute("member");
		// 세션에있는 비밀번호
		String sessionId = member.getMember_id();

		if (!(sessionId.equals(sessionId))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/index";
		}
		service.deleteUserList(member);
		session.invalidate();
		return "redirect:/main/index";
	}
}