package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.movie.mymovie.dto.MovieInfoDto;


//임포트 해줘야함

public interface Movie2DAO {

	
	public List<MovieInfoDto> selectMovieInfo(String movieCd);

}
