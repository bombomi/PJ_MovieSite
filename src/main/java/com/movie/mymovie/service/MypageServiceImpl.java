package com.movie.mymovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.MypageDAO;
import com.movie.mymovie.dto.UserDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<UserDto> selectUserAllList() {
		return mypageDAO.selectUserAllList();
	}

	public void selectOneByMemberId(String memberId) {

	}


	@Override
	public UserDto selectInfo(String id) throws Exception {

		return mypageDAO.selectInfo(id);
	}

	@Override
	public void updateUserList(UserDto Dto) throws Exception {
		// TODO Auto-generated method stub
		mypageDAO.updateUserList(Dto);	
	}
	
	@Override
	public void deleteUserList(UserDto Dto) throws Exception {
		mypageDAO.deleteUserList(Dto);
	}
}
