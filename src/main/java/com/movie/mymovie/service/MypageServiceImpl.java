package com.movie.mymovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dao.MypageDAOImpl;
import com.movie.mymovie.dto.UserDto;

@Repository
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAOImpl MypageDAOImpl;

	public List<UserDto> selectUserAllList() {
		return MypageDAOImpl.selectUserAllList();
	}
	

}
