package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.movie.mymovie.vo.BoardVO;

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
	
}
