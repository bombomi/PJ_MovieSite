package com.movie.mymovie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	private final Logger log = LoggerFactory.getLogger(MyPageController.class);

	// 인덱스
	@RequestMapping(value = "/myPage/myPage")
	public String index() {
		log.debug("MyPageController - /myPage/myPage");
		return "mypage/index";
	}
	
	@RequestMapping(value = "/myPage/myEdit")
	public String edit() {
		log.debug("called ------------------------------------------------");
		return "mypage/Myedit";
	}

	@RequestMapping(value = "/myPage/Mybooklist")
	public String list() {
		return "mypage/Mybooklist";
	}

	@RequestMapping(value = "/myPage/Mywriting")
	public String writing() {
		return "mypage/Mywriting";
	}

	@RequestMapping(value = "/myPage/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";

	}
}
