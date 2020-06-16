package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;

import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;

public interface Movie1DAO {
	public List<TheaterDto> selectTheaterByAddr(String theater_addr);
	public List<TimeTableDto> selectDateByTheaterAndMovie(HashMap<String, String> paramMap);

}
