package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.Movie2DAOImpl;
import com.movie.mymovie.dto.MovieInfoDto;


@Service
public class Movie2ServiceImpl {
	
	@Autowired
	private Movie2DAOImpl movie2DAOImpl;
	
	public List<MovieInfoDto> selectMovieInfo(String movieCd) {
		
		// TODO Auto-generated method stub
		return movie2DAOImpl.selectMovieInfo(movieCd);
	}

}
