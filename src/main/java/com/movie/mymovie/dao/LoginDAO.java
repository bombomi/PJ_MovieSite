package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;

import com.movie.mymovie.dto.UserDto;

public interface LoginDAO {
	
	//회원가입
	public void register(UserDto userDto) throws Exception;
	
	//로그인
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
	
	//아이디 중복 체크
	public int idChk(UserDto userDto) throws Exception;
	
	//닉네임 중복 체크
	public int nickChk(UserDto userDto) throws Exception;
	
	//아이디찾기
	public List<UserDto> findId(UserDto userDto) throws Exception; 
	
	//비밀번호찾기
	public List<UserDto> findPwd(UserDto userDto) throws Exception;

}
