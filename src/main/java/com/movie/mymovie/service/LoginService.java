package com.movie.mymovie.service;

import java.util.HashMap;

import com.movie.mymovie.dto.UserDto;

public interface LoginService {
//	UserDto getUser(UserDto userDto) throws Exception;
	
//	public int idCheck(String id);
//	public int lengthCheck(String id,int length);
//	public int OverlapCheck(String id,List<String> idList);
//	public int nickCheck(String nick);
//	public int pwdCheck(String pwd);
//	public int pwdEqualCheck(String pwd,String pwdck);
	
	public void register(HashMap<String, String>paramMap) throws Exception;
	
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
}
