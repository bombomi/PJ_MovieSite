package com.movie.mymovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.MypageDAOImpl;
import com.movie.mymovie.dto.UserDto;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAOImpl mypageDAOImpl;

	@Override
	public List<UserDto> selectUserAllList() {
		return mypageDAOImpl.selectUserAllList();
	}
	

}
