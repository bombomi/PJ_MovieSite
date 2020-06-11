package com.movie.mymovie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AllMovieController {

	private static final Logger logger = LoggerFactory.getLogger(AllMovieController.class);
	
	@RequestMapping(value = "main/index")
	public String doIndex() {
		logger.info("main/index");
		return "main/index";
	}
}
