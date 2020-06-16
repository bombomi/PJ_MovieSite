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
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;
import com.movie.mymovie.service.Movie1ServiceImpl;

@Controller
public class Movie1Controller {


	@Autowired
	private Movie1ServiceImpl movie1ServiceImpl;
	
	
	@RequestMapping(value="/movieInfo")
	public String selectMovieInfo() {
		return "main/movieInfo";
	}
	@RequestMapping(value="/selectPlace")
	public String selectPlace() {
		return "movieReservation/selectPlace";
	}
	
	@RequestMapping(value="ajaxTheaterSelect", method=RequestMethod.GET)
	@ResponseBody
	public Object ajaxTheaterSelect( @RequestParam(value="checkboxValue") String theater_addr)  
	{     	
		List<TheaterDto> theaterList = movie1ServiceImpl.selectTheaterByAddr(theater_addr);
		
        Map<String, Object> retVal= new HashMap<String, Object>();
	
		retVal.put("theaterList", theaterList);
					//System.out.println(theaterList.get(i).getTheater_name());
	
      
		return retVal;
	}
	@RequestMapping(value="/selectDateTime",method=RequestMethod.GET)
	public String selectDateTime
	(@RequestParam HashMap<String, String> paramMap, Model model) {
		List<TimeTableDto> movieDateList = movie1ServiceImpl.selectDateByTheaterAndMovie(paramMap);
		System.out.println("movlieDateList?"+movieDateList);
		model.addAttribute("movieDateList", movieDateList);

		return "movieReservation/selectDateTime";
	}
	@RequestMapping(value="/selectSeat")
	public String selectSeat() {
		return "movieReservation/selectSeat";
	}
	@RequestMapping(value="/pay")
	public String pay() {
		return "movieReservation/pay";
	}
	@RequestMapping(value="/reservationConfirm")
	public String reservationConfirm() {
		return "movieReservation/reservationConfirm";
	}
	@RequestMapping(value="/headerCheck")
	public String headerCheck() {
		return "header";
	}
	
}
