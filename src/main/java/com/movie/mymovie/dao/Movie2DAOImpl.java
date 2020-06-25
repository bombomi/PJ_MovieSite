package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dto.MovieInfoDto;

@Repository
public class Movie2DAOImpl implements Movie2DAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MovieInfoDto> selectMovieInfo(String movieCd) {
		// TODO Auto-generated method stub
		System.out.println(movieCd);
		
		List<MovieInfoDto> movieInfoDtoList = new ArrayList<MovieInfoDto>();
		
		movieInfoDtoList=sqlSession.selectList("Movie2Mapper.selectMovieInfo",movieCd);
		
		return movieInfoDtoList;
	}

	

}
