package com.movie.mymovie.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.mymovie.dto.UserDto;
import com.movie.mymovie.service.LoginService;
import com.movie.mymovie.service.LoginServiceImpl;

@Controller
@RequestMapping("/login")
@SessionAttributes("UserDto")
public class loginController {
	
	@Inject 
	LoginService service;
	
	@Inject 
	LoginServiceImpl serviceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	
	//회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	//동의페이지 agreement.jsp
	@RequestMapping(value = "/agreement")
	public String agreement() {
		return "login/agreement";
	}
	
	// 회원가입 post
	//@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserDto userDto) throws Exception {
		logger.info("post register");
		int result = service.idChk(userDto);
		int result2 = service.nickChk(userDto);
		try {
			if(result == 1 && result2 == 1) {
				return "/login/register";
			}else if(result == 0 && result2 == 0) {
				logger.info("result=["+result+"]");
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		service.register(userDto);
		
		return "redirect:/main/index";
	}
	
	@RequestMapping(value = "/login")
	public String Login() {
		
		return "login/login";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = {RequestMethod.POST,RequestMethod.GET})
	public String idChk(UserDto userDto) throws Exception {
		logger.info("url -> idChk");
		logger.info("userDto=["+userDto+"]");
		String result = service.idChk(userDto)+"";
		logger.info("result=["+result+"]");
		return result;
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/nickChk", method = {RequestMethod.POST,RequestMethod.GET})
	public String nickChk(UserDto userDto) throws Exception {
		logger.info("url -> nickChk");
		logger.info("userDto=["+userDto+"]");
		String result = service.nickChk(userDto)+"";
		logger.info("result=["+result+"]");
		return result;
	}
	
	@RequestMapping(value = "/islogin")
	public ModelAndView islogin(@RequestParam HashMap<String, String>paramMap, HttpServletRequest req, 
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		logger.info("url --> login");
		HttpSession session = req.getSession();
		System.out.println(paramMap.get("member_id"));
		System.out.println(paramMap.get("member_pwd"));
		UserDto islogin = service.islogin(paramMap);
		if(islogin == null) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.'); history.go(-1);</script>");
            out.flush();
			mv.setViewName("login/login");
			return mv;
		}else {
			session.setAttribute("member", islogin);
		}
		mv.setViewName("redirect:/main/index");
		return mv; //main/index
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/main/index");
        return mv;
	}
	
	// 아이디 찾기 페이지 
	@RequestMapping(value = "/lookForId") 
	public String lookForId() { 
	return "/login/lookForId"; 
	} 
	
	// 비밀번호 찾기 페이지 
	@RequestMapping(value = "/lookForPwd") 
	public String lookForPwd() { 
	return "/login/lookForPwd"; 
	} 
	
	//아이디찾기성공결과 findId.jsp
	@RequestMapping(value = "/findId")
	public String findId() {
		return "login/findId";
	}
	
	//비밀번호찾기성공결과(비밀번호변경페이지) findPwd.jsp
	@RequestMapping(value = "/findPwd")
	public String findPwd() {
		return "login/findPwd";
	}
	
	// 아이디 찾기 
	@RequestMapping(value = "/findId", method = RequestMethod.POST) 
	public ModelAndView findId(@ModelAttribute UserDto userDto) throws Exception { 
		
		ModelAndView mav = new ModelAndView(); 
		List<UserDto> userList = service.findId(userDto); 
		System.out.println(userList); 

		if(userList!=null) {
			if(userList.size() != 0) {
				
				mav.setViewName("/login/findId"); 
				mav.addObject("userList", userList);
				
			}else {

	            mav.addObject("errorMsg","검색된 아이디가 없습니다. 다시 확인 해 주시기 바랍니다.");
				mav.setViewName("login/login");
			}
		}
		return mav; 
	}
	
	 // 비밀번호 찾기 
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST) 
	public ModelAndView findPwd(@ModelAttribute UserDto userDto) throws Exception { 
		ModelAndView mav = new ModelAndView(); 
		List<UserDto> userPwdList = service.findPwd(userDto); 
		System.out.println(userPwdList);
		
		if(userPwdList!=null) {
			if(userPwdList.size() != 0) {
				
				mav.setViewName("/login/findPwd"); 
				mav.addObject("userPwdList", userPwdList);
				
			}else {

	            mav.addObject("errorMsg2","검색된 비밀번호가 없습니다. 다시 확인 해 주시기 바랍니다.");
				mav.setViewName("login/login");
			}
		}
		 
		return mav; 
	}

}
