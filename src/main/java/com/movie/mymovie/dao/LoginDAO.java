package com.movie.mymovie.dao;

import java.util.HashMap;

import com.movie.mymovie.dto.UserDto;

public interface LoginDAO {
	//--------------------------User-------------------------------
	
		//UserList
//		public List<UserDto> getUserList() throws Exception;
//		public List<String> getUserIDList() throws Exception;
//		public List<String> getUserNickList() throws Exception;
		//User
//		public UserDto getUserById(String member_id) throws Exception;
//		public UserDto getUserByEmail(UserDto userDto) throws Exception;
//		public void insertUser(UserDto userDto) throws Exception;
//		public void userModifie(UserDto userDto) throws Exception;
		//MyPage insert
//		public void createMypage(String my_nick) throws Exception;
//		public UserDto login(UserDto userDto) throws Exception;
	
	//회원가입
	public void register(HashMap<String, String>paramMap) throws Exception;
	
	//로그인
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
}
