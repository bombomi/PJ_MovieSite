package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.movie.mymovie.dto.ScreenHallDto;
import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;

public interface Movie1DAO {
	public List<TheaterDto> selectPlaceByMovie(String movie_id);
	public List<TheaterDto> selectTheaterByAddr(String theater_addr);
	public List<TimeTableDto> selectDateByTheaterAndMovie(HashMap<String, String> paramMap);
	public List<TimeTableDto> selectTimeByDate(HashMap<String, String> paramMap);
	public Map<String, Object> returnSeatList(HashMap<String, String> paramMap);
	public List<Map<String, String>> returnReservationList(HashMap<String, String> paramMap);
	public void insertReservation(HashMap<String, Object> paramMap);

}
