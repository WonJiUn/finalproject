package com.care.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
//로그인 세션은 여러 사용자가 필요한 공통기능이기 때문에 따로 인터페이스를 만들어 상속시켜 사용함
	@Autowired MemberService ms;
	
	@GetMapping("/login")
	public String login() {
		System.out.println("멤버 로그인 연결");
		return "member/login";
	}
	
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id, 
			@RequestParam String pw, 
			@RequestParam(required=false) String autoLogin, 
			RedirectAttributes rs) {
		
		int result = ms.userCheck(id,pw);
		//System.out.println("autoLogin : " + autoLogin);
		
		if(result == 0) {
			rs.addAttribute("id", id);	//successLogin으로 값을 넘겨줌. 리다이렉트일때는 모델이 아니라 이런 방식으로 해야됨
			rs.addAttribute("autoLogin", autoLogin);
			return "redirect:successLogin";
			//로그인 성공일때
		}else {
			return "redirect:login";
			//로그인 실패일때. return이 1
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, 
			@RequestParam(required=false) String autoLogin, 
			HttpSession session,
			HttpServletResponse response) {
		System.out.println("id : " + id);
		System.out.println("autoLogin : " + autoLogin);
		
		session.setAttribute(LOGIN, id);
		
		if(autoLogin != null) {
			int limitTime = 60*60*24*90; //자동로그인에 체크했다면 90일간 쿠키를 만들어줌
			Cookie loginCookie = new Cookie("loginCookie", session.getId());	//쿠키 value는 유일한값인 아이디로 저장
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.MONTH, 3);	//현재시간에서 3개월후(이거만 util에 있는 Date)
			
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			//sql에 있는 Date로 변환하여 DB에 저장해야 함(로그인세션쿠키, 쿠키지속시간, where에 쓸 아이디)
			ms.keepLogin(session.getId(), limitDate, id);
		}
		
		return "member/successLogin";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, 
			HttpServletResponse response,
			@CookieValue(value="loginCookie", required=false) Cookie loginCookie) {
		//쿠키값을 받아오기만 하면 DB쪽에서는 삭제되는데 브라우저에서 삭제되지 않는 문제가 있었음. 
		//setPath("/") 경로를 설정하지 않으면 현재경로에 쿠키를 생성하게되어, 상위(/)에 생성했던 쿠키가 삭제되지 않았음
		//쿠키에 대한 범위 : 주소 경로에서 상위경로에서 만든것은 하위까지 전달이 됨. /를 쓰면 모든경로에서 쿠키를 사용할수 있음
		if(session.getAttribute( LOGIN ) != null) {
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				//로그아웃을 누르면 쿠키를 만료시킴
				
				ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));
				//데이터베이스의 자동로그인값 수정. 시간에는 현재시간을 넣어줌
			}
		}
		session.invalidate();
		//해당하는 사용자가 세션이 있으면 세션을 만료시킴
		return "redirect:/index";
		//index 앞에 /를 붙이지 않으면 상대경로가 되기 때문에 member/index로 가게되어 오류가 발생함
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {
		//if(session.getAttribute(LOGIN) != null) {
			ms.memberInfo(model);
			return "member/memberInfo";
		//}
		//로그인세션이 있으면 멤버인포로 보내주고, 아니면 로그인창으로 보냄.
		//이런 작업은 컨트롤러, jsp로 가기전에 있는 인터셉터에서 처리하는것이 더 빠르고 효율적임
		//return "redirect:login";
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		ms.info(model, id);
		return "member/info";
	}
	
	@GetMapping("register_form")
	public String registerForm() {
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if(result == 1) {
			return "redirect:login";
			//회원가입 성공
		}
		return "redirect:register_form";
		//회원가입 실패
	}
}
