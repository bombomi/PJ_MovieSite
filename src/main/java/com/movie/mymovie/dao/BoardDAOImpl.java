package com.movie.mymovie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.mymovie.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 갯수 구하기
	@Override
	public int getArticleCnt() {
		return sqlSession.selectOne("com.movie.mymovie.dao.BoardDAO.getArticleCnt");
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO> getArticleList(Map<String, Object> map) {
		return sqlSession.selectList("com.movie.mymovie.dao.BoardDAO.getArticleList", map);
	}
	
	// 조회수 증가
	@Override
	public void addReadCnt(int board_id) {
		sqlSession.getMapper(BoardDAO.class).addReadCnt(board_id);
	}
	
	// 게시글 상세 페이지
	@Override
	public BoardVO getArticle(int board_id) {
		return sqlSession.selectOne("com.movie.mymovie.dao.BoardDAO.getArticle", board_id);
	}
	
	// 글 쓰기 처리
	@Override
	public int insertBoard(BoardVO vo) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.insertBoard(vo);
	}
	
	// 방명록 조회
	@Override
	public List<BoardVO> searchWord(HashMap<String, String> paramMap) {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		boardList = sqlSession.selectList("com.movie.mymovie.dao.BoardDAO.searchWord", paramMap);
		System.out.println("dppdp " + boardList);
		return boardList;
	}

}
