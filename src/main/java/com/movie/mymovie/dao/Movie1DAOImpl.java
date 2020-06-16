package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dto.TheaterDto;
import com.movie.mymovie.dto.TimeTableDto;

@Repository
public class Movie1DAOImpl implements Movie1DAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TheaterDto> selectTheaterByAddr(String theater_addr){
	List<TheaterDto> theaterDtoList=new ArrayList<TheaterDto>();
	
	theaterDtoList=sqlSession.selectList(
			"Movie1Mapper.selectTheaterByAddr", theater_addr);
	
	return theaterDtoList;

	}
	@Override
	public List<TimeTableDto> selectDateByTheaterAndMovie(HashMap<String, String> paramMap){
	List<TimeTableDto> theaterDtoList=new ArrayList<TimeTableDto>();
	
	theaterDtoList=sqlSession.selectList(
			"Movie1Mapper.selectDateByTheaterAndMovie", paramMap);
	
	return theaterDtoList;

	}
	
	

}
