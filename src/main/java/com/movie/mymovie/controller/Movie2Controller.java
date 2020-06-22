package com.movie.mymovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Movie2Controller {
	
	@RequestMapping(value="/movieInfo")
	public String selectMovieInfo() {
		return "main/movieInfo";
	}

}
