package com.movie.mymovie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.movie.mymovie.vo.BoardVO;
import com.movie.mymovie.vo.ReplyVO;

public interface BoardDAO {
	
	// 게시글 갯수 구하기
	public int getArticleCnt();
	
	// 게시글 목록 조회
	public List<BoardVO> getArticleList(Map<String, Object> map);
	
	// 조회수 증가
	public void addReadCnt(int board_id);
	
	// 게시글 상세 페이지 
	public BoardVO getArticle(int board_id);
	
	// 글 쓰기 처리
	public int insertBoard(BoardVO vo);
	
	// 게시글 상세 조회
	public List<BoardVO> searchWord(HashMap<String, String> paramMap);
	
	// 게시판 삭제
	public int deleteBoard(int board_id);
	
	// 글 수정 처리
	public int updateBoard(BoardVO vo);
	
	// 댓글 조회
	public List<ReplyVO> readReply(int board_id);
	

}
