package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.movie.mymovie.controller.MyPageController;
import com.movie.mymovie.controller.loginController;
import com.movie.mymovie.dto.UserDto;

@Repository
public class MypageDAOImpl implements MypageDAO {

	private final Logger log = LoggerFactory.getLogger(MypageDAOImpl.class);
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
		log.info("member_id=[" + Dto.getMember_id() + "]");
		log.info(Dto + "");
		sqlSession.delete("MypageMapper.deleteUserList", Dto.getMember_id());
	}
}
