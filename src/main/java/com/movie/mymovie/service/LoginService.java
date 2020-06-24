package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import com.movie.mymovie.dto.UserDto;

public interface LoginService {
//	UserDto getUser(UserDto userDto) throws Exception;
	
//	public int idCheck(String id);
//	public int lengthCheck(String id,int length);
//	public int OverlapCheck(String id,List<String> idList);
//	public int nickCheck(String nick);
//	public int pwdCheck(String pwd);
//	public int pwdEqualCheck(String pwd,String pwdck);
	
	public void register(UserDto userDto) throws Exception;
	
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
	
	public int idChk(UserDto userDto) throws Exception;
	
	public int nickChk(UserDto userDto) throws Exception;
	
	public List<UserDto> findId(UserDto userDto) throws Exception; 
	
	public String findPwd(UserDto userDto) throws Exception;
	
}
