package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import com.movie.mymovie.dto.UserDto;

public interface LoginService {
	
	public void register(UserDto userDto) throws Exception;
	
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
	
	public int idChk(UserDto userDto) throws Exception;
	
	public int nickChk(UserDto userDto) throws Exception;
	
	public List<UserDto> findId(UserDto userDto) throws Exception; 
	
	public List<UserDto> findPwd(UserDto userDto) throws Exception;
	
}
