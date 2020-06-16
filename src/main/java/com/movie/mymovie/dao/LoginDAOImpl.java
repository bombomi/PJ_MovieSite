package com.movie.mymovie.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
//import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.dto.UserDto;


@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; //주입. SqlSessionTemplate 객체
//	@Autowired
//	private LoginDAO loginDao;
	
	@Override
	public UserDto islogin(HashMap<String, String>paramMap) throws Exception {
		UserDto userDto = sqlSession.selectOne("LoginMapper.islogin", paramMap);
		return userDto;
//selectOne("LoginMapper.islogin", paramMap);
	}

	@Override
	public void register(HashMap<String, String>paramMap) throws Exception {
		sqlSession.insert("LoginMapper.register", paramMap);
	}

	//--------------------------User-------------------------------
//		//UserList
//		@Override
//		public List<UserDto> getUserList() throws Exception {
//			return loginDao.getUserList();
//		}
//
//		@Override
//		public List<String> getUserIDList() throws Exception {
//			return loginDao.getUserIDList();
//		}
//
//		@Override
//		public List<String> getUserNickList() throws Exception {
//			return loginDao.getUserIDList();
//		}
//		
//		@Override
//		public UserDto getUserById(String member_id) throws Exception {
//			return loginDao.getUserById(member_id);
//		}
//		
//		@Override
//		public UserDto getUserByEmail(UserDto userDto) throws Exception {
//			return loginDao.getUserByEmail(userDto);
//		}
//
//		@Override
//		public void insertUser(UserDto userDto) throws Exception {
//			loginDao.insertUser(userDto);
//		}
//
//		@Override
//		public void userModifie(UserDto userDto) throws Exception {
//			loginDao.userModifie(userDto);
//		}
//
//		@Override
//		public void createMypage(String my_nick) throws Exception {
//			loginDao.createMypage(my_nick);
//		}
//		
		
// 로그인 검사
//	@Override
//	public UserDto login(String member_id) throws Exception{
//		return sqlSession.selectOne("LoginMapper.login", member_id);
//	}

//	@Override
//	public UserDto login(HashMap<String, String>paramMap) throws Exception {
//		sqlSession.selectOne("LoginMapper.login", paramMap);
//		return null;
//	}

//	@Override
//	public UserDto login(UserDto userDto) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
