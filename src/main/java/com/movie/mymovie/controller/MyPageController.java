package com.movie.mymovie.controller;

<<<<<<< HEAD
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
=======
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
>>>>>>> branch 'master' of https://github.com/bombomi/PJ_MovieSite.git

<<<<<<< HEAD
@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "myPage/myPage")
	public String doBoardList() {
		logger.info("BoardList");
		
		return "myPage/myPage";
=======
	// 인덱스
	@RequestMapping(value = "/Myedit")
	public String edit() {
		return "mypage/Myedit";
	}

	@RequestMapping(value = "/Mybooklist")
	public String list(){
		return "mypage/Mybooklist";
	}

	@RequestMapping(value = "/Mywriting")
	public String writing() {
		return "mypage/Mywriting";
	}
	@RequestMapping(value = "/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";
>>>>>>> branch 'master' of https://github.com/bombomi/PJ_MovieSite.git
	}
}
