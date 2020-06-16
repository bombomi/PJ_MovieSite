package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.mymovie.dto.UserDto;

public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UserDto> selectUserAllList() {
		List <UserDto> UserDtoList=
				new ArrayList<UserDto>();
		UserDtoList=
				SqlSession.selectList("MypageMapper.selectUserAllList");
		return UserDtoList;
	}

}
