package com.movie.mymovie.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.mymovie.service.BoardServiceImpl;
import com.movie.mymovie.vo.ReplyVO;

@Controller
public class replyController {
	
	private static final Logger logger = LoggerFactory.getLogger(replyController.class);
	
	@Autowired
	BoardServiceImpl service;
	
	// 댓글 조회
	@RequestMapping(value = "board/ContentBoard")
	public ModelAndView list(@RequestParam int board_id, ModelAndView mav) {
		logger.info("url --> readReply");
		List<ReplyVO> replyList = service.readReply(board_id);
		mav.setViewName("board/ContentBoard");
		mav.addObject("replyList", replyList);
		return mav;
	}

}
