package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.Movie1DAOImpl;
import com.movie.mymovie.dto.ScreenHallDto;
import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;

@Service
public class Movie1ServiceImpl {
	
	@Autowired
	private Movie1DAOImpl movie1DAOImpl;
	//selectPlaceByMovie
	public List<TheaterDto> selectPlaceByMovie(String movie_id){
		return movie1DAOImpl.selectPlaceByMovie(movie_id);
	}
	public List<TheaterDto> selectTheaterByAddr(String theater_addr){
		return movie1DAOImpl.selectTheaterByAddr(theater_addr);
	}
	
	public List<TimeTableDto> selectDateByTheaterAndMovie(HashMap<String, String> paramMap){
		return movie1DAOImpl.selectDateByTheaterAndMovie(paramMap);
	}
	
	public List<TimeTableDto> selectTimeByDate(HashMap<String, String> paramMap){
		return movie1DAOImpl.selectTimeByDate(paramMap);
	}
	
	public Map<String, Object> returnSeatList(HashMap<String, String> paramMap){	
		return movie1DAOImpl.returnSeatList(paramMap);
	};
	public List<Map<String, String>> returnReservationList(HashMap<String, String> paramMap){	
		return movie1DAOImpl.returnReservationList(paramMap);
	};
	public void insertReservation(HashMap<String, Object> paramMap){
		movie1DAOImpl.insertReservation(paramMap);
	};

}
