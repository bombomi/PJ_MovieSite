package com.movie.mymovie.service;

import java.util.List;

import org.springframework.ui.Model;

import com.movie.mymovie.dto.UserDto;

public interface MypageService {

	public List<UserDto> selectUserAllList();
	/* public UserDto selectOneByMemberId(String memberId); */

	public UserDto selectInfo(String string) throws Exception;

	public void updateUserList(UserDto Dto) throws Exception;

	public void deleteUserList(UserDto Dto) throws Exception;
}
