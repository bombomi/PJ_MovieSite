package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.movie.mymovie.vo.BoardVO;
import com.movie.mymovie.vo.ReplyVO;

public interface BoardService {
	
	// 글 목록
	public void boardList(HttpServletRequest req, Model model);
	
	// 글 상세 페이지
	public void contentForm(HttpServletRequest req, Model model);
	
	// 글 쓰기 처리
	public void writePro(HttpServletRequest req, Model model);
	
	// 글 쓰기 폼
	public void writeForm(HttpServletRequest req, Model model);
	
	// 게시판 조회
	public List<BoardVO> searchWord(HashMap<String, String> paramMap);
	
	// 게시판 삭제
	public void deletePro(HttpServletRequest req, Model model);
	
	// 글 수정 상세 페이지
	public void modifyView(HttpServletRequest req, Model model);
	
	// 글 수정 처리 페이지
	public void modifyPro(HttpServletRequest req, Model model);
	
	// 댓글 조회
	public List<ReplyVO> readReply(int board_id);
	
	// 댓글 작성
	public void writeReply(ReplyVO vo);
	
	// 댓글 수정
	public void updateReply(ReplyVO vo);
	
	// 댓글 삭제
	public void deleteReply(ReplyVO vo);
	
	// 선택된 댓글 조회
	public ReplyVO selectReply(int reply_id);
}
