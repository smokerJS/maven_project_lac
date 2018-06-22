package kr.co.lac.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lac.repository.domain.User;
import kr.co.lac.user.service.UserService;


@Controller
@RequestMapping("/main")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginForm.do")
	public void loginForm() {}
	@RequestMapping("/registForm.do")
	public void registForm() {}
	
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, User login) throws Exception{
		User user = userService.selectUserEmail(login.getEmail());
		if(user==null) {
			session.setAttribute("errMsg", "001");
		}else if(user.getPassword().equals(login.getPassword())){
			session.removeAttribute("errMsg");
			session.setAttribute("user", user);	// 세션에 로그인 정보 담기
			if(user.getLoginStateCode().equals("00104")) {
				session.setAttribute("errMsg", "002");
				return "redirect:loginForm.do";
			}
			return "redirect:/project/lobby.do";
		}else {
			session.setAttribute("errMsg", "003");
		}
		return "redirect:loginForm.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();	// 세션값 지우기
		return "redirect:loginForm.do";
	}
	
	@RequestMapping("/registUser.do")
	public String registUser(User user) throws Exception {
		userService.insertUser(user);
		return "redirect:loginForm.do";
	}
	
	
	
	@RequestMapping("/emailCheck.json")
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		System.out.println(email);
		String result = "2";
		if(userService.selectUserEmail(email).getEmail() != null) {
			result = "1";
		}
		return "test";
	}
	
	@RequestMapping("/editPass.json")
	@ResponseBody
	public String editPass(User user) throws Exception {
		String result = "";
		System.out.println(user.getPassword());
		System.out.println(user.getNewPassword());
		System.out.println(user.getCheckNewPassword());
		int count = userService.findUserByPass(user);
		if(count == 0 ) {
			result="기존 비밀번호와 일치하지 않음";
			System.out.println(result);
		}else if(!(user.getNewPassword().equals(user.getCheckNewPassword()))) {
			result="새 비밀번호와 비밀번호 재입력 값 일치하지 않음";
			System.out.println(result);
		}else {
			user.setPassword(user.getNewPassword());
			userService.editPass(user);
			result="비밀번호 수정 완료!";
			System.out.println(result);
		}
		return result;
	}
	
	@RequestMapping("/leaveId.do")
	public String leaveId(User user) throws Exception {
		userService.leaveId(user);
		return "redirect:loginForm.do";
	}
	@RequestMapping("/editNick.do")
	public String editNick(HttpSession session,User user) throws Exception {
		System.out.println(user.getNickname());
		System.out.println(user.getUserNo());
		userService.editNick(user);
		user = userService.findUserByNo(user.getUserNo());
		session.setAttribute("user", user);
		return "redirect:/project/lobby.do";
	}
	
	
	
}
