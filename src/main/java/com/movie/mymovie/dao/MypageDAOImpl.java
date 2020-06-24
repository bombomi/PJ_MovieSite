package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.movie.mymovie.dto.UserDto;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<UserDto> selectUserAllList() {
		List<UserDto> UserDtoList = new ArrayList<UserDto>();
		UserDtoList = sqlSession.selectList("MypageMapper.UserAllList");
		return UserDtoList;
	}

	@Override
	public UserDto selectInfo(String id) {
		return sqlSession.selectOne("MypageMapper.UserAllList", id);
	}

	@Override
	public void updateUserList(UserDto Dto) throws Exception {
		sqlSession.update("MypageMapper.updateUserList", Dto);

	}

	@Override
	public int update(UserDto member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void deleteUserList(UserDto Dto) throws Exception {
				
		sqlSession.delete("MypageMapper.deleteUserList", Dto);
		
	}
}
