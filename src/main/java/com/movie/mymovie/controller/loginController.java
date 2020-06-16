package com.movie.mymovie.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
//	@Autowired
//	//@Resource(name = "LoginService")
//	private LoginService loginservice;
//	@Autowired
//	private LoginDAO loginDAO;
	
	@Inject LoginService service;
	@Inject LoginServiceImpl serviceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	
	//회원가입 get
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public void getRegister() throws Exception {
//		logger.info("get register");
//	}
	//회원가입 post
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String postRegister(HashMap<String, String>paramMap, RedirectAttributes red) throws Exception {
//		logger.info("post register");
//		
//		serviceImpl.register(paramMap);
//		
//		return "redirect:/index";
//	}
	
	@RequestMapping(value = "/login")
	public String Login() {
		
		return "login/login";
	}
	//로그인페이지 login.jsp
	
	@RequestMapping(value = "/islogin")
	public String islogin(@RequestParam HashMap<String, String>paramMap, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("url --> login");
		HttpSession session = req.getSession();
		System.out.println("service 존");
		System.out.println(paramMap.get("member_id"));
		System.out.println(paramMap.get("member_pwd"));
		UserDto islogin = service.islogin(paramMap);
		System.out.println("if 진입 전");
		if(islogin == null) {
			System.out.println("if 진입 후");

			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", islogin);
		}
		
		return "redirect:/main/index"; //main/index
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/main/index");
        return mv;
		//return "redirect:/main/index";
	}
//	@RequestMapping(value = "/login/main", method = RequestMethod.GET)
//	public String main(HttpServletRequest request, Model model){
//		model.addAttribute("islogin", request.getParameter("islogin"));
//		logger.info("url --> login/main");
//		return "login/main";
//	}
	
	
	//아이디 찾기 lookForId.jsp
	@RequestMapping(value = "/lookForId")
	public String lookForId() {
		return "login/lookForId";
	}
	
	//아이디찾기성공결과 findId.jsp
	@RequestMapping(value = "/findId")
	public String findId() {
		return "login/findId";
	}
	
	//비밀번호 찾기 lookForPwd.jsp
	@RequestMapping(value = "/lookForPwd")
	public String lookForPwd() {
		return "login/lookForPwd";
	}
	
	//비밀번호찾기성공결과(비밀번호변경페이지) findPwd.jsp
	@RequestMapping(value = "/findPwd")
	public String findPwd() {
		return "login/findPwd";
	}
	
	//비밀번호변경성공페이지 chPwd.jsp
	@RequestMapping(value = "/chPwd")
	public String chPwd() {
		return "login/chPwd";
	}
	
	//동의페이지 agreement.jsp
	@RequestMapping(value = "/agreement")
	public String agreement() {
		return "login/agreement";
	}
	
	//회원가입페이지 newMemberForm.jsp
	@RequestMapping(value = "newMemberForm")
	public String newMemberForm() {
		return "login/newMemberForm";
	}
	
	//회원가입성공페이지 successNewMember.jsp
	@RequestMapping(value = "successNewMember")
	public String successNewMember() {
		return "login/successNewMember";
	}
	
	@RequestMapping(value = "/needlogin", method = RequestMethod.GET)
	public String needlogin(HttpServletRequest request, Model model){
		
		return "login/needlogin";
	}
	
//	@RequestMapping(value = "/login/main", method = RequestMethod.POST)
//	public String mainPost(HttpServletRequest request, Model model, UserDto userDto) throws Exception{
//		System.out.println("update : " + userDto);
//		loginDAO.userModifie(userDto);
//		
//		model.addAttribute("UserDto", userDto);
//		return "login/main";
//	}
//	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(SessionStatus status, Model model){
//		status.setComplete();
//		if(status.isComplete()==true) {
//			System.out.println("Session remove");
//		}
//		return "login/main";
//	}
//	
//	@RequestMapping(value = "/loginuser", method = RequestMethod.POST)
//	public String login(HttpSession session, HttpServletRequest request, Model model, UserDto tryuser) throws Exception{
//		System.out.println(1);
//		UserDto loginuser = loginDAO.getUserById(tryuser.getMember_id()); 
//		System.out.println(2);
//		if(loginuser == null ) {
//			model.addAttribute("login", "1");
//			return "login/main";
//		}
//		if(!loginuser.getMember_pwd().equals(tryuser.getMember_pwd())) {
//			System.out.println("loginuser.getUser_pwd() : " + loginuser.getMember_pwd());
//			System.out.println("tryuser.getUser_pwd() : " + tryuser.getMember_pwd());
//			
//			model.addAttribute("login", "2");
//			return "login/main";
//		}
//
//		model.addAttribute("login", "0");
//		model.addAttribute("UserDto",loginuser);
//		
//		return "main/index";
//	}
//	//agreement
//	@RequestMapping(value = "/sign", method = RequestMethod.GET)
//	public String sign(HttpServletRequest request, Model model){
//		
//		return "login/sign";
//	}
//	@RequestMapping(value = "/sign", method = RequestMethod.POST)
//	public String signTry(HttpServletRequest request, Model model, UserDto userDto) throws Exception{
//		loginDAO.insertUser(userDto);
//		System.out.println("12");
//		loginDAO.createMypage(userDto.getMember_nick());
//		model.addAttribute("sign", "T");
//		
//		return "login/main";
//	}
//	
//	@RequestMapping(value = "/find", method = RequestMethod.GET)
//	public String find(HttpServletRequest request, Model model){
//		model.addAttribute("findby",request.getParameter("findby"));
//		return "login/find";
//	}
//	@RequestMapping(value = "/findbyid", method = RequestMethod.POST)
//	public String findbyid(HttpServletRequest request, Model model, UserDto userDto) throws Exception{
//		model.addAttribute("findby","id");
//		System.out.println("findbyid : " + userDto.getMember_email());
//		UserDto finduser = loginDAO.getUserByEmail(userDto);
//		if(finduser == null) {
//			model.addAttribute("finderror", "IF");
//			return "login/find";}
//		else {
//			model.addAttribute("user_id", finduser.getMember_id());
//			return "login/find";
//		}
//	}
//	@RequestMapping(value = "/findbypwd", method = RequestMethod.POST)
//	public String findbypwd(HttpServletRequest request, Model model, UserDto userDto) throws Exception{
//		model.addAttribute("findby","pwd");
//		UserDto finduser = loginDAO.getUserById(userDto.getMember_id());
//		if(finduser == null) {
//			model.addAttribute("finderror", "IF");
//			return "login/find";
//		}
//		else {
//			if(userDto.getMember_email().equals(finduser.getMember_email())) {
//				model.addAttribute("user_pwd",finduser.getMember_pwd());
//				return "login/find";
//			}else {
//				model.addAttribute("finderror", "EF");
//				return "login/find";
//			}
//		}
//	}
//	
//	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
//	public void idcheck(HttpServletRequest request, HttpServletResponse httpServletResponse) throws Exception{
//		String id = request.getParameter("id");
//		List<String> idList = loginDAO.getUserIDList();  
//		JsonObject jsonObject = new JsonObject();
//		jsonObject.addProperty("idcheck", loginservice.idCheck(id));
//		System.out.println("loginservice.idCheck(id) : " + loginservice.idCheck(id));
//		jsonObject.addProperty("idoverlapcheck", loginservice.OverlapCheck(id, idList));
//		System.out.println("loginservice.idOverlapCheck(id, idList) : " + loginservice.OverlapCheck(id, idList));
//		jsonObject.addProperty("lengthcheck", loginservice.lengthCheck(id, 8));
//		httpServletResponse.getWriter().print(jsonObject.toString());
//		
//	}
//	@RequestMapping(value = "/nickcheck", method = RequestMethod.POST)
//	public void nickcheck(HttpServletRequest request, HttpServletResponse httpServletResponse) throws Exception{
//		String nick = request.getParameter("nick");
//		List<String> nickList = loginDAO.getUserNickList();
//		JsonObject jsonObject = new JsonObject();
//		jsonObject.addProperty("nickcheck", loginservice.nickCheck(nick));
//		System.out.println("loginservice.idCheck(id) : " + loginservice.idCheck(nick));
//		jsonObject.addProperty("nickoverlapcheck", loginservice.OverlapCheck(nick, nickList));
//		System.out.println("loginservice.nickOverlapCheck(id, idList) : " + loginservice.OverlapCheck(nick, nickList));
//		jsonObject.addProperty("lengthcheck", loginservice.lengthCheck(nick, 8));
//		httpServletResponse.getWriter().print(jsonObject.toString());
//		
//	}
//	

}
