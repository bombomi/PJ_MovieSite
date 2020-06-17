package com.movie.mymovie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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

	//after select of theater, page move to 'selectDateTime' for selection
	//rendering view 'selectDateTime'
	@RequestMapping(value="/selectDateTime",method=RequestMethod.GET)
	public String selectDateTime
	(@RequestParam HashMap<String, String> paramMap, Model model) {
		List<TimeTableDto> movieDateList = movie1ServiceImpl.selectDateByTheaterAndMovie(paramMap);
		System.out.println("movlieDateList?"+movieDateList);
		model.addAttribute("movieDateList", movieDateList);
		model.addAttribute("theater_id", paramMap.get("theater_id"));
		return "movieReservation/selectDateTime";
	}
	
	//after select date of timetable by ajax, page move again to 'selectDateTime'
	//response to page which request with timetable(time).
	//just include time(date x)	
	
	@RequestMapping(value="ajaxDateSelect", method=RequestMethod.GET)
	public @ResponseBody
	Object ajaxDateSelect( @RequestParam(value="theater_id") String theater_id,
			 @RequestParam(value="selectedDate") String selectedDate)  
	{          
		System.out.println(theater_id);
		System.out.println(selectedDate);
		/*
		 * 도대체 왜 맵이랑 매칭이 안되는지 죽었다 깨어나도 모르겠다^^
		 * 
		 * jsp에서 받아온 theater_id, selectedDate를 맵으로 묶어서 쿼리를 보내야하는데
		 * 하나로 엮이지가 않아서 넘어가지 않음... 해결해야함!!!@ 수요일날부터 할 과제임...ㅠ 
		 * 
		 * */
		HashMap<String, String> reqVal=new HashMap<String, String>();
		reqVal.put("selectedDate",selectedDate);
		System.out.println("selectedDate from map = "+reqVal.get(selectedDate));

	
		//List<TimeTableDto> movieTimeList = movie1ServiceImpl.selectTimeByDate(hash);
		System.out.println("sql success??!!?!?");
		//System.out.println("movieTimeList"+ movieTimeList.size());
        Map<String, Object> retVal= new HashMap<String, Object>();
	
//		retVal.put("theaterList", theaterList);
					//System.out.println(theaterList.get(i).getTheater_name());
	
        retVal.put("ok", "success");
		return retVal;
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
