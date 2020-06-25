package com.movie.mymovie.controller;

import java.util.ArrayList;
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

import com.movie.mymovie.dto.ScreenHallDto;
import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;
import com.movie.mymovie.service.Movie1ServiceImpl;

@Controller
public class Movie1Controller {


	@Autowired
	private Movie1ServiceImpl movie1ServiceImpl;
	
	
	@RequestMapping(value="/selectPlace")
	public String selectPlace(Model model) {
		//앞선 영화 상세정보 페이지에서 받아온 영화 아이디값으로
		//상영정보 테이블에서 영화관 주소목록을 불러온다. 
		//화면에 표시하는 건 아직 안함.. ㅎㅎㅎ
		String movie_id="20183813";
		List<TheaterDto> placeList = movie1ServiceImpl.selectPlaceByMovie(movie_id);
		model.addAttribute(placeList);
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
	(@RequestParam HashMap<String, Object> paramMap, Model model) {
		System.out.println("movieId????"+paramMap.get("movie_id"));
		List<TimeTableDto> movieDateList = movie1ServiceImpl.selectDateByTheaterAndMovie(paramMap);
		System.out.println("movieDateList?"+movieDateList);
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
		List<TimeTableDto> movieTimeList = movie1ServiceImpl.selectTimeByDate(reqVal);
        Map<String, Object> retVal= new HashMap<String, Object>();
		retVal.put("movieTimeList", movieTimeList);
			return retVal;
	}
	//한현님 오기전에 내가 해보는 좌석선택 페이지.. ㅎㅎㅎ
	
	@RequestMapping(value="/selectSeat2")
	public String selectSeat(@RequestParam HashMap<String, String> paramMap, Model model) {
		Map<String, Object> scrHallSeatList = movie1ServiceImpl.returnSeatList(paramMap);//최대 열, 자리 리턴
		List<Map<String, String>> reservationList=movie1ServiceImpl.returnReservationList(paramMap);
		System.out.println(scrHallSeatList);
		System.out.println(reservationList);//선택한 곳의 예약 정보 불러오기 완료!
		List<String> reservationIdList=new ArrayList<String>();
		for(int i=0;i<reservationList.size();i++) {
			reservationIdList.add(reservationList.get(i).get("SCRHALLSEAT_ID"));
		}
		String scrhall_id=String.valueOf(scrHallSeatList.get("SCRHALL_ID"));
		model.addAttribute("scrhall_id", scrhall_id);
		model.addAttribute("theater_id", paramMap.get("theater_id"));
		model.addAttribute("timetable_id", paramMap.get("timetable_id"));
		model.addAttribute("reservationCnt", reservationList.size());
		model.addAttribute("scrHallSeatList",scrHallSeatList);
		if(reservationList.size()>0) {
			model.addAttribute("reservationIdList",reservationIdList);}
		return "movieReservation/selectSeat2";
	}
	
	@RequestMapping(value="/pay",method=RequestMethod.POST)
	public String pay(@RequestParam HashMap<String, Object> paramMap, Model model) {
		//System.out.println(paramMap.get("scrhallSeat_id"));
		//String scrhallSeat_id=(String)paramMap.get("scrhallSeat_id");
		model.addAttribute("scrhallSeat_id",(String)paramMap.get("scrhallSeat_id"));
		model.addAttribute("timetable_id", (String)paramMap.get("timetable_id"));
		return "movieReservation/pay";
	}
	@RequestMapping(value="/reservationConfirm")
	public String reservationConfirm(@RequestParam HashMap<String, Object> paramMap, Model model) {
		int theater_id=Integer.parseInt(String.valueOf(((String)paramMap.get("scrhallSeat_id")).substring(0, 2)));
		int scrhall_id=Integer.parseInt(String.valueOf(((String)paramMap.get("scrhallSeat_id")).substring(2, 4)));
		paramMap.put("theater_id", theater_id);
		paramMap.put("scrhall_id", scrhall_id);
		//예매 가능한지 검사함.
		boolean reservedYn=movie1ServiceImpl.checkReserved(paramMap);
		if(reservedYn==true) {
			movie1ServiceImpl.insertReservation(paramMap);
			}else {
				System.out.println("예약 불가능함.");
				return "movieReservation/reservationErr";
			}
		//HashMap<String, String> confirmInfo=new HashMap<String, String>();
		Map<String, Object> confirmInfo=movie1ServiceImpl.confirmInfo(paramMap);
		System.out.println(confirmInfo);
		model.addAttribute("confirmInfo",confirmInfo);

		model.addAttribute("paramMap", paramMap);
		return "movieReservation/reservationConfirm";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String linkTest(@RequestParam(value="test") String test) {
		System.out.println(test);
		return "main/index";
	}

	
}
