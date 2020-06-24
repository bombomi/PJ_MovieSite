package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
//import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dto.UserDto;


@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; //주입. SqlSessionTemplate 객체
	
	@Override
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception {
		UserDto userDto = sqlSession.selectOne("LoginMapper.islogin", paramMap);
		return userDto;
	}

	@Override
	public void register(UserDto userDto) throws Exception {
		sqlSession.insert("LoginMapper.register", userDto);
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(UserDto userDto) throws Exception {
		int result = sqlSession.selectOne("LoginMapper.idChk", userDto);
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public int nickChk(UserDto userDto) throws Exception {
		int result = sqlSession.selectOne("LoginMapper.nickChk", userDto);
		return result;
	}
	
	//아이디찾기
	@Override 
	public List<UserDto> findId(UserDto userDto) throws Exception { 
	return sqlSession.selectList("LoginMapper.findId", userDto); 
	} 
	
	//비밀번호찾기
	@Override 
	public List<UserDto> findPwd(UserDto userDto) throws Exception { 
	return sqlSession.selectList("LoginMapper.findPwd", userDto); 
	}
	

}
