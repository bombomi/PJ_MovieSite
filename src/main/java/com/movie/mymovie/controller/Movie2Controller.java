package com.movie.mymovie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.mymovie.dto.MovieInfoDto;
import com.movie.mymovie.service.Movie2ServiceImpl;

@Controller
public class Movie2Controller {

	@Autowired
	private Movie2ServiceImpl movie2ServiceImpl;

	/*
	 * @RequestMapping(value = "/movieInfo") public String selectMovieInfo() {
	 * return "main/movieInfo"; }
	 */


//	@RequestMapping(value = "/selectMovieInfo", method=RequestMethod.GET)
//	public String selectMovieInfo(@RequestParam(value="movieCd" HashMap<String, Object> paramMap, Model model) {
//		System.out.println(paramMap);
//	
	
	@RequestMapping(value = "/selectMovieInfo",  method=RequestMethod.GET )
	public String selectMovieInfo(@RequestParam(value="movieCd") String movieCd, Model model) {
		
		System.out.println(movieCd);
		List<MovieInfoDto> infoList = movie2ServiceImpl.selectMovieInfo(movieCd);
		model.addAttribute("selectMovieInfo",infoList);
		/*
		 * System.out.println(paramMap); System.out.println((String)
		 * paramMap.get("selectMovieInfo"));
		 * 
		 * int movieCd =
		 * Integer.parseInt(String.valueOf(((String)paramMap.get("movieCd"))));
		 * paramMap.put("movieCd", movieCd);
		 * 
		 * //HashMap<String, String> confirmInfo=new HashMap<String, String>();
		 * 
		 * Map<String, Object> selectMovieInfo=
		 * movie2ServiceImpl.selectMovieInfo(paramMap);
		 * System.out.println(selectMovieInfo);
		 * model.addAttribute("selectMovieInfo",selectMovieInfo);
		 * 
		 * model.addAttribute("paramMap", paramMap);
		 */
		return "main/selectMovieInfo";

	}
}
