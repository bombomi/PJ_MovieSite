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
	public void register(UserDto userDto) throws Exception;
	
	//로그인
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception;
	
	//아이디 중복 체크
	public int idChk(UserDto userDto) throws Exception;
	
	//닉네임 중복 체크
	public int nickChk(UserDto userDto) throws Exception;
	

	
//	public UserDto getMemberById(String id) throws Exception;
//	
//	public UserDto getMemberByEmail(UserDto userDto) throws Exception;
//	
//	public void insertMember(UserDto userDto) throws Exception;
//	
//	public void memberModifie(UserDto userDto) throws Exception;
//	
//	public void createMypage(String member_nick) throws Exception;
}
