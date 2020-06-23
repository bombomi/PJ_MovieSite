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
	
	@Override 
	public List<UserDto> findId(UserDto userDto) throws Exception { 
	return loginDao.findId(userDto); 
	} 
	
	@Override public String findPwd(UserDto userDto) throws Exception { 
	return loginDao.findPwd(userDto); 
	}
	
	
//	@Override
//	public int OverlapCheck(String id, List<String> idList) {
//		System.out.println(idList);
//		for (String temp : idList) {
//			if(id.equals(temp)) {
//				return -1;
//			}
//		}
//		return 0;
//	}
//
//	@Override
//	public int idCheck(String id) {
//		for(int i = 0; i < id.length(); i++) {
//			char temp = id.charAt(i);
//			
//			if((temp < '0' || temp > '9') && (temp < 'A' || temp > 'Z') && (temp < 'a' || temp > 'z')) {
//				return -1;
//			}else {
//				continue;
//			}
//		}
//		return 0;
//	}
//
//	@Override
//	public int pwdCheck(String pwd) {
//		for(int i = 0; i < pwd.length(); i++) {
//			char temp = pwd.charAt(i);
//			if((temp < '0' || temp > '9') && (temp < 'A' || temp > 'Z') && (temp < 'a' || temp > 'z'))
//				return -1;
//			else
//				continue;
//			
//		}
//		return 0;
//	}
//
//	@Override
//	public int pwdEqualCheck(String pwd, String pwdck) {
//		if(pwd.equals(pwdck)) {
//			return 0;
//		}else {
//			return -1;
//		}
//	}
//
//	@Override
//	public int nickCheck(String nick) {
//		for(int i = 0; i < nick.length(); i++) {
//			char temp = nick.charAt(i);
//			
//			if((temp < '0' || temp > '9') && (temp < 'A' || temp > 'Z') && (temp < 'a' || temp > 'z')) {
//				return -1;
//			}else {
//				continue;
//			}
//		}
//		return 0;
//	}
//
//	@Override
//	public int lengthCheck(String id, int length) {
//		if(id.length()<length) {
//			return -1;
//		}
//		return 0;
//	}

//	@Override
//	public UserDto getUser(UserDto userDto) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
