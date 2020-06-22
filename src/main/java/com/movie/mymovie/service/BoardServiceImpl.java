package com.movie.mymovie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.movie.mymovie.dao.BoardDAO;
import com.movie.mymovie.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	// 글 목록
	@Override
	public void boardList(HttpServletRequest req, Model model) {
		// 페이징 처리
		int pageSize = 15;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 시작 글 번호
		int end = 0;			// 현재 페이지의 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 글 갯수 구하기 (cnt)
		cnt = dao.getArticleCnt();
		System.out.println("글 목록 cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";		// 첫 페이지를 1 페이지로 지정
		}
		
		// 현재 페이지
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수 6 (30 / 5) + (0)
		pageCount = (cnt/pageSize) + (cnt % pageSize > 0 ? 1 : 0 );  // 페이지 갯수 + 나머지 있으면 1
		
		// 현재 페이지 시작 글 번호 (페이지별)
		// 1 = (1-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지의 마지막 글 번호 (페이지별)
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		// 출력용 글 번호
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<BoardVO> dtos = dao.getArticleList(map);
			model.addAttribute("dtos", dtos);
		}
		
		// 시작 페이지
		// 1=(1 / 3) * 3 +1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage: " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;

		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage: " + endPage);

		System.out.println("=======================");
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	
	// 글 상세 페이지
	@Override
	public void contentForm(HttpServletRequest req, Model model) {
		String strId = (String) req.getSession().getAttribute("user_id");
		int number = Integer.parseInt(req.getParameter("number"));
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 조회수 증가
		dao.addReadCnt(board_id);
		
		// 상세페이지 조회
		BoardVO vo = dao.getArticle(board_id);
		
		// request나 session에 처리 결과를 저장(jsp에 저장하기 위함)
		model.addAttribute("number", number);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("strId", strId);
	}
	
	// 글 쓰기 처리 페이지
	@Override
	public void writePro(HttpServletRequest req, Model model) {
		BoardVO vo = new BoardVO();
		
		
		// 글 쓰기 hidden 값으로 받아오기
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		/* vo.setBoard_id(Integer.parseInt(req.getParameter("board_id"))); */
		
		// 화면으로부터 입력받은 값
		vo.setUser_id(req.getParameter("user_id"));
		vo.setBoard_title(req.getParameter("board_title"));
		vo.setBoard_content(req.getParameter("board_content"));
		vo.setReg_date(req.getParameter("reg_date"));

		// 글쓰기 처리
		int insertCnt = dao.insertBoard(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 글 쓰기 폼
	@Override
	public void writeForm(HttpServletRequest req, Model model) {
		int board_id = 0;
		int pageNum = 0;
		
		pageNum  = Integer.parseInt(req.getParameter("pageNum"));
		model.addAttribute("board_id", board_id);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시판 검색
	@Override
	public List<BoardVO> searchWord(HashMap<String, String> paramMap) {
		return dao.searchWord(paramMap);
	}
	
	// 게시판 삭제
	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		// deleteForm의 hidden으로부터 값을 받아온다.
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		
		int deleteCnt = dao.deleteBoard(board_id);
		
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시판 수정 상세 페이지
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		BoardVO vo =  new BoardVO();
		vo = dao.getArticle(board_id);
		model.addAttribute("dto", vo);
		model.addAttribute("board_id", board_id);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시판 수정 처리 페이지
	@Override
	public void modifyPro(HttpServletRequest req, Model model) {
		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		BoardVO vo = new BoardVO();
		
		vo.setBoard_id(board_id);
		vo.setBoard_title(req.getParameter("board_title"));
		vo.setBoard_content(req.getParameter("board_content"));
		
		int updateCnt = dao.updateBoard(vo);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board_id", board_id);
		
	}

}
