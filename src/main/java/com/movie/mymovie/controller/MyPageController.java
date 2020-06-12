package com.movie.mymovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

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
	}
}
