package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dto.UserDto;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UserDto> selectUserAllList() {
		List <UserDto> UserDtoList=
				new ArrayList<UserDto>();
		UserDtoList=
				sqlSession.selectList("MypageMapper.selectUserAllList");
			return UserDtoList;
	}
}


