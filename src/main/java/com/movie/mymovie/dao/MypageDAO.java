package com.movie.mymovie.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.HashMap;

import com.movie.mymovie.dto.UserDto;


public interface MypageDAO{

	public List<UserDto> selectUserAllList();
	
	public UserDto selectInfo(String id);
	
	// 정보 수정
	@Transactional
	public int update(UserDto member) throws Exception;

	public void updateUserList(UserDto Dto) throws Exception;
	
	//회원 탈퇴
	public void deleteUserList(UserDto Dto) throws Exception;
}
