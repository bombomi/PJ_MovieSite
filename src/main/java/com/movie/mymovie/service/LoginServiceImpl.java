package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.mymovie.dao.LoginDAO;
import com.movie.mymovie.dao.LoginDAOImpl;
import com.movie.mymovie.dto.UserDto;

@Service("LoginService") //서비스임을 선언. 특별한 기능은 없다
public class LoginServiceImpl implements LoginService{
	
	@Autowired //자동주입
	private LoginDAOImpl loginDaoImpl;
	
	@Inject LoginDAO loginDao;
	
	@Override
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception {
		return loginDaoImpl.islogin(paramMap);
	}
	
	@Override
	public void register(UserDto userDto) throws Exception {
		loginDaoImpl.register(userDto);
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(UserDto userDto) throws Exception {
		int result = loginDao.idChk(userDto);
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public int nickChk(UserDto userDto) throws Exception {
		int result = loginDao.nickChk(userDto);
		return result;
	}
	
	//아이디찾기
	@Override 
	public List<UserDto> findId(UserDto userDto) throws Exception { 
	return loginDao.findId(userDto); 
	} 
	
	//비밀번호찾기
	@Override 
	public List<UserDto> findPwd(UserDto userDto) throws Exception { 
	return loginDao.findPwd(userDto); 
	}

}
