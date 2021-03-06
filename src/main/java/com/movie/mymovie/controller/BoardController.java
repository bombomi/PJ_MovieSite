package com.movie.mymovie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.mymovie.service.BoardServiceImpl;
import com.movie.mymovie.vo.BoardVO;
import com.movie.mymovie.vo.ReplyVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardServiceImpl service;

	// 게시판 리스트
	@RequestMapping(value = "/BoardList")
	public String doBoardList(HttpServletRequest req, Model model) {
		logger.info("url --> BoardList");
		service.boardList(req, model);
		return "board/BoardList";
	}

	// 상세 페이지 보기
	@RequestMapping(value = "/ContentBoard", method = RequestMethod.GET)
	public String doContent(BoardVO vo, HttpServletRequest req, Model model, @RequestParam int board_id)  {
		logger.info("url --> ContentBoard");
		service.contentForm(req, model);
		List<ReplyVO> replyList = service.readReply(vo.getBoard_id());
		model.addAttribute("replyList", replyList);
		logger.info("url --> 댓글 조회 ContentBoard");
		return "board/ContentBoard";
	}

	// 게시판 글 쓰기
	@RequestMapping(value = "/writeBoard")
	public String doWriteForm(HttpServletRequest req, Model model) {
		logger.info("url --> writeBoard");
		service.writeForm(req, model);

		return "board/writeBoard";
	}          
   
	// 글 쓰기 완료
	@RequestMapping(value = "/writePro")
	public String writePro(HttpServletRequest req, Model model) {
		logger.info("url --> writePro");
		service.writePro(req, model);

		return "board/writePro";
	}

	// 게시판 조회
	@RequestMapping(value = "/searchWord", method = {RequestMethod.POST,RequestMethod.GET})
	public String searchWord(@RequestParam HashMap<String, String> paramMap, HttpServletRequest req, Model model) {
		logger.info("url --> searchWord");

		List<BoardVO> boardVo = service.searchWord(paramMap);
		model.addAttribute("dtos", boardVo);
		model.addAttribute("pageNum" + req.getParameter("pageNum"));
		model.addAttribute("number" + req.getParameter("number"));
		System.out.println("boardVo" + boardVo);

		if (boardVo != null) {
			model.addAttribute("cnt", boardVo.size());
			System.out.println("dtosSize" + boardVo.size());
		}
		return "board/BoardList";
	}

	// 게시판 삭제 확인
	@RequestMapping(value = "/deleteForm")
	public String deleteForm(HttpServletRequest req, Model model) {
		logger.info("deleteForm 호출");

		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		req.setAttribute("board_id", board_id);
		req.setAttribute("pageNum", pageNum);

		return "board/deleteForm";
	}

	// 게시판 삭제
	@RequestMapping(value = "/deletePro")
	public String deletePro(HttpServletRequest req, Model model) {
		logger.info("url --> deletePro");

		service.deletePro(req, model);
		return "board/deletePro";
	}

	// 게시판 수정 확인
	@RequestMapping(value = "/modifyForm")
	public String modifyForm(HttpServletRequest req, Model model) {
		logger.info("url -> modifyForm");

		int board_id = Integer.parseInt(req.getParameter("board_id"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		model.addAttribute("board_id", board_id);
		model.addAttribute("pageNum", pageNum);

		return "board/modifyForm";
	}

	// 게시글 수정 페이지
	@RequestMapping(value = "/modifyView")
	public String modifyView(HttpServletRequest req, Model model) { 
		logger.info("url => modifyView");
		service.modifyView(req, model);
		return "board/modifyView";
	}

	// 게시글 수정 처리 페이지
	@RequestMapping(value = "/modifyPro")
	public String modifyPro(HttpServletRequest req, Model model) {
		logger.info("url --> modifyPro");
		service.modifyPro(req, model);
		return "board/modifyPro";
	}
	 
	// 게시글 댓글 쓰기  
	@RequestMapping(value = "board/replyWrite",method = {RequestMethod.POST,RequestMethod.GET})
	public String replyWrite(ReplyVO vo, HttpServletRequest req, Model model, RedirectAttributes rttr) {
		logger.info("url --> replyWrite");
		
		service.writeReply(vo);
		rttr.addAttribute("board_id", vo.getBoard_id());
		rttr.addAttribute("pageNum", req.getParameter("pageNum"));
		rttr.addAttribute("number", req.getParameter("number"));
		return "redirect:/ContentBoard";   
	}  
	
	// 댓글 수정 GET
	@RequestMapping(value = "board/replyUpdateView", method = {RequestMethod.POST,RequestMethod.GET})
	public String replyUpdateView(ReplyVO vo, HttpServletRequest req, Model model) {
		logger.info("url ===> replyUpdateView");
		
		model.addAttribute("replyUpdate", service.selectReply(vo.getReply_id()));
		model.addAttribute("pageNum", req.getParameter("pageNum"));
		model.addAttribute("number", req.getParameter("number"));
		return "board/replyUpdateView";
	}
	
	// 댓글 수정 POST
	@RequestMapping(value = "board/replyUpdate", method = {RequestMethod.POST,RequestMethod.GET})
	public String replyUpdate(ReplyVO vo, HttpServletRequest req ,RedirectAttributes rttr) {
		logger.info("url ===> 댓글 수정 POST");
		service.updateReply(vo);
		
		logger.info("user_id=["+req.getParameter("user_id")+"] pageNum=["+req.getParameter("pageNum")+"]");
		rttr.addAttribute("board_id", vo.getBoard_id());
		rttr.addAttribute("pageNum", req.getParameter("pageNum"));
		rttr.addAttribute("number", req.getParameter("number"));
		return "redirect:/ContentBoard";   
	}
	
	// 댓글 삭제 GET
	@RequestMapping(value = "board/replyDeleteView", method = {RequestMethod.POST,RequestMethod.GET})
	public String replyDeleteView(ReplyVO vo,  HttpServletRequest req, Model model) {
		logger.info("url --> replyDeleteView");
		
		model.addAttribute("replyDelete", service.selectReply(vo.getReply_id()));
		model.addAttribute("pageNum", req.getParameter("pageNum"));
		model.addAttribute("number", req.getParameter("number"));
		
		return "board/replyDeleteView";
	}
	
	// 댓글 삭제
	@RequestMapping(value = "board/replyDelete", method = {RequestMethod.POST,RequestMethod.GET})
	public String replyDelete(ReplyVO vo, HttpServletRequest req ,RedirectAttributes rttr) {
		logger.info("url --> replyDelete");
		
		service.deleteReply(vo);
		rttr.addAttribute("board_id", vo.getBoard_id());
		rttr.addAttribute("pageNum", req.getParameter("pageNum"));
		rttr.addAttribute("number", req.getParameter("number"));
		return "redirect:/ContentBoard";   
		
	}

}
