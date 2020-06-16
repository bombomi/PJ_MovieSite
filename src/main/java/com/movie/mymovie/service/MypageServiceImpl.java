package com.movie.mymovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dao.MypageDAOImpl;
import com.movie.mymovie.dto.UserDto;

@Repository
public class MypageServiceImpl implements MypageService {
	@Autowired
	private static MypageDAOImpl MypageDAOImpl;
	//위 아래 static 맞나. 컨트롤러 error남
	public static List<UserDto> selectUserAllList() {
		return MypageDAOImpl.selectUserAllList();
	}
	

}
