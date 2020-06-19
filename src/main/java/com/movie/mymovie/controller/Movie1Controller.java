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
		//값을 전달할 hashmap 생성. reqval
		HashMap<String, String> reqVal=new HashMap<String, String>();
		reqVal.put("movie_dateTime",selectedDate);
		reqVal.put("theater_id",theater_id);
		System.out.println("movie_dateTime from map = "+reqVal.get("movie_dateTime"));
		System.out.println("theater_id from map = "+reqVal.get("theater_id"));

	
		List<TimeTableDto> movieTimeList = movie1ServiceImpl.selectTimeByDate(reqVal);
		System.out.println("sql success??!!?!?");
		//System.out.println("movieTimeList"+ movieTimeList.size());
        Map<String, Object> retVal= new HashMap<String, Object>();
		System.out.println(movieTimeList.get(0).getMovie_dateTime());
	
		retVal.put("movieTimeList", movieTimeList);
	
        retVal.put("ok", "success");
		return retVal;
	}
	@RequestMapping(value="/pay")
	public String pay() {
		return "movieReservation/pay";
	}
	@RequestMapping(value="/reservationConfirm")
	public String reservationConfirm() {
		return "movieReservation/reservationConfirm";
	}

	
}
