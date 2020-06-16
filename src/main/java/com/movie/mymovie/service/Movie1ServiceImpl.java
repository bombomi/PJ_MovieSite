package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.Movie1DAOImpl;
import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;

@Service
public class Movie1ServiceImpl {
	
	@Autowired
	private Movie1DAOImpl movie1DAOImpl;
	
	public List<TheaterDto> selectTheaterByAddr(String theater_addr){
		return movie1DAOImpl.selectTheaterByAddr(theater_addr);
	}
	
	public List<TimeTableDto> selectDateByTheaterAndMovie(HashMap<String, String> paramMap){
		return movie1DAOImpl.selectDateByTheaterAndMovie(paramMap);
	}
}
