package com.movie.mymovie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "myPage/myPage")
	public String doBoardList() {
		logger.info("BoardList");
		
		return "myPage/myPage";
	}
}
