package com.movie.mymovie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 게시판 리스트
	@RequestMapping(value = "board/BoardList")
	public String doBoardList() {
		logger.info("BoardList");
		
		return "board/BoardList";
	}
	
	// 게시판 글 쓰기
	@RequestMapping(value = "board/writeBoard")
	public String doWriteForm() {
		return "board/writeBoard";
	}
	
	// 상세 페이지 보기
	@RequestMapping(value = "board/ContentBoard")
	public String doContent() {
		return "board/ContentBoard";
	}
	

}
